Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00F6EE4996
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 12:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ybA9Y4z5UdwZYkl6CH+f/cqy5bDwnj2bq3qWlqJP8w4=; b=WShcrI/nAF+O6J
	XRqGe9LqyKvPwaPw0vIhcIIrMch/P4h1gghV5SHHiKBdirk78UDIWntEifN4Ktxl1RKM01p/b5suI
	l45dBf+RZV3soP/uWYWVSkmvNB2Vbbln6SsDX5u2D3b2DFobGq13395J9YT5+6LSRg2uV+c9M6naW
	zii5RwjY3CfC/viNtMWeOhM3RB8mGcnkN5Yy7gt2xbVM7uFI5ft30cESqfEYlpZe6Ga6jW2aOaO9k
	BBIzX3l0rQEkAhosoARLSgYhdhbQXhGltTlPp3RSsG9AWDH2V+iS7tqpnvKQQgN8oHOJOlUuJExE1
	2iNbo844yJwPY2GAcUjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY450-00Dze9-06;
	Mon, 21 Aug 2023 12:32:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY44V-00DzH4-1J;
	Mon, 21 Aug 2023 12:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0BPre1mji4iNkocWD89whAC0rMq3U6GyUcT+h0WZYyY=; b=LdnCfJ8Xtky1ZpNQF3xKRxY0aB
	zzHm67AGzb3dc2INiylHNmB8RnKsRw+fFCG8oWfxC6PCUQh06HiEeQZhbTIWnMYNnIfeAQXwTRVpG
	Oj9GbBHCtEPFZpoij54tSuY682CRtdFEgctZ6BIlNR4tYAYgvA/Qt5Ih0AsAbbo7sY365UvUdIYhA
	pSusoOYeDLTSl0cw5LBnAY2fQ7LSTgUKOZNOn17/0DKD0DhwddDop/MHz2ltGptFjCLePvzv0Htnc
	yclHCcL9qcrNCUi2Vm+/6RgPAU/2905th/g7QOREmhtgiGqjme83IBPaJ/PVvPAw4HhnsJ7OAsEGZ
	93BXXRFg==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY44L-001VC8-1Y;
	Mon, 21 Aug 2023 12:31:50 +0000
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RTsGs73pWzVks8;
	Mon, 21 Aug 2023 20:29:09 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 21 Aug 2023 20:31:21 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-mm@kvack.org>
CC: <surenb@google.com>, <willy@infradead.org>, Russell King
	<linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>, Kefeng Wang
	<wangkefeng.wang@huawei.com>
Subject: [PATCH rfc v2 08/10] loongarch: mm: cleanup __do_page_fault()
Date: Mon, 21 Aug 2023 20:30:54 +0800
Message-ID: <20230821123056.2109942-9-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
References: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_133144_059265_4F48EE6D 
X-CRM114-Status: GOOD (  14.57  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Cleanup __do_page_fault() by reuse bad_area_nosemaphore and
bad_area label.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/loongarch/mm/fault.c | 48 +++++++++++++--------------------------
 1 file changed, 16 insertions(+), 32 deletions(-)

diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
index e6376e3dce86..5d4c742c4bc5 100644
--- a/arch/loongarch/mm/fault.c
+++ b/arch/loongarch/mm/fault.c
@@ -157,18 +157,15 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 		if (!user_mode(regs))
 			no_context(regs, write, address);
 		else
-			do_sigsegv(regs, write, address, si_code);
-		return;
+			goto bad_area_nosemaphore;
 	}
 
 	/*
 	 * If we're in an interrupt or have no user
 	 * context, we must not take the fault..
 	 */
-	if (faulthandler_disabled() || !mm) {
-		do_sigsegv(regs, write, address, si_code);
-		return;
-	}
+	if (faulthandler_disabled() || !mm)
+		goto bad_area_nosemaphore;
 
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
@@ -178,23 +175,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 	vma = lock_mm_and_find_vma(mm, address, regs);
 	if (unlikely(!vma))
 		goto bad_area_nosemaphore;
-	goto good_area;
-
-/*
- * Something tried to access memory that isn't in our memory map..
- * Fix it, but check if it's kernel or user first..
- */
-bad_area:
-	mmap_read_unlock(mm);
-bad_area_nosemaphore:
-	do_sigsegv(regs, write, address, si_code);
-	return;
 
-/*
- * Ok, we have a good vm_area for this memory access, so
- * we can handle it..
- */
-good_area:
 	si_code = SEGV_ACCERR;
 
 	if (write) {
@@ -235,22 +216,25 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 		 */
 		goto retry;
 	}
+
+	mmap_read_unlock(mm);
+
 	if (unlikely(fault & VM_FAULT_ERROR)) {
-		mmap_read_unlock(mm);
-		if (fault & VM_FAULT_OOM) {
+		if (fault & VM_FAULT_OOM)
 			do_out_of_memory(regs, write, address);
-			return;
-		} else if (fault & VM_FAULT_SIGSEGV) {
-			do_sigsegv(regs, write, address, si_code);
-			return;
-		} else if (fault & (VM_FAULT_SIGBUS|VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
+		else if (fault & VM_FAULT_SIGSEGV)
+			goto bad_area_nosemaphore;
+		else if (fault & (VM_FAULT_SIGBUS|VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE))
 			do_sigbus(regs, write, address, si_code);
-			return;
-		}
-		BUG();
+		else
+			BUG();
 	}
 
+	return;
+bad_area:
 	mmap_read_unlock(mm);
+bad_area_nosemaphore:
+	do_sigsegv(regs, write, address, si_code);
 }
 
 asmlinkage void __kprobes do_page_fault(struct pt_regs *regs,
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
