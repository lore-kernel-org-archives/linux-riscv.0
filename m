Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED66EE4996
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 12:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzHRak8MJqFUuq8zsAfkVU1c7hWPffi97zz1TeBe2HY=; b=LyLDATsvBVKrbq
	5CfGbrcKlymSiIlmMaltLDBArQlSGtYLgotHE3ELfdodZBt2fDfdvcPgfHwLh//yqBGqEcVYG1HQ/
	WZxzjqZ5jENkmuiKM5eTplDc/22ri4a/hDtXCSKg4+8g2Q45Ah+YVFdQNOnucEzlgVlb9oUOY16z0
	CQljeNav0xo1GhHBLjszI9WM7+7KHluoxfOBgnxB/z0iAEAahYovaC0nO21zJHXiLQD3kZiAl6Hf+
	MjTLHiLSgxTWIV0ly6WLtSvNj44cAnTgAUTbLpa4uvbd1jjTyx7YB+v9yNXiDCUfOA7rcXTdBcQlP
	ypZ68NEq5Oy/ATU0wp3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY459-00DzkC-0T;
	Mon, 21 Aug 2023 12:32:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY44X-00DzIV-1K;
	Mon, 21 Aug 2023 12:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gIldAat6PTqp0m0qcFfSiDczJB9xcWWS8CD3qklnWTo=; b=kJu5Rp6+d8nls1Q2PjGT45jeU4
	Y6CwAMZLRxH03DTsuuTA2P0J5opNT+1sXZXMLbPBbZ+EhDVI1DLOtioFt6i+p6t3uYyBFmoRT3OvE
	o4b4qc9hfgmKE/A7HVxGn4AxrHMI2+ghKlYO9yMC1TSDIig7tdSQ9flQwvbRpXjt+/Q5TlJN1UM1Y
	Fwld6G1nutHYNjha4okP946++jbp6vjRk6b39q7cLY8JfOQxyMO4wTD/kVSXDnwjTuRWV1Ygdkqi0
	S+VOY4A2xNXLbAFvMfW2q+3CNx4+J+Ogs5lA2LRYJakbimF7s0UZ5XxKt7B0j1PVpnFOJ1X6rJXiC
	UFg3BNwg==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY44O-001VCA-2Q;
	Mon, 21 Aug 2023 12:31:52 +0000
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RTsGv1szHzVksj;
	Mon, 21 Aug 2023 20:29:11 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 21 Aug 2023 20:31:23 +0800
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
Subject: [PATCH rfc v2 09/10] loongarch: mm: add access_error() helper
Date: Mon, 21 Aug 2023 20:30:55 +0800
Message-ID: <20230821123056.2109942-10-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
References: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_133147_498567_B49326BD 
X-CRM114-Status: GOOD (  14.31  )
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

Add access_error() to check whether vma could be accessible or not,
which will be used __do_page_fault() and later vma locked based page
fault.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/loongarch/mm/fault.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
index 5d4c742c4bc5..2a45e9f3a485 100644
--- a/arch/loongarch/mm/fault.c
+++ b/arch/loongarch/mm/fault.c
@@ -126,6 +126,22 @@ static void __kprobes do_sigsegv(struct pt_regs *regs,
 	force_sig_fault(SIGSEGV, si_code, (void __user *)address);
 }
 
+static inline bool access_error(unsigned int flags, struct pt_regs *regs,
+				unsigned long addr, struct vm_area_struct *vma)
+{
+	if (flags & FAULT_FLAG_WRITE) {
+		if (!(vma->vm_flags & VM_WRITE))
+			return true;
+	} else {
+		if (!(vma->vm_flags & VM_READ) && addr != exception_era(regs))
+			return true;
+		if (!(vma->vm_flags & VM_EXEC) && addr == exception_era(regs))
+			return true;
+	}
+
+	return false;
+}
+
 /*
  * This routine handles page faults.  It determines the address,
  * and the problem, and then passes it off to one of the appropriate
@@ -169,6 +185,8 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
+	if (write)
+		flags |= FAULT_FLAG_WRITE;
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 retry:
@@ -178,16 +196,8 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 
 	si_code = SEGV_ACCERR;
 
-	if (write) {
-		flags |= FAULT_FLAG_WRITE;
-		if (!(vma->vm_flags & VM_WRITE))
-			goto bad_area;
-	} else {
-		if (!(vma->vm_flags & VM_READ) && address != exception_era(regs))
-			goto bad_area;
-		if (!(vma->vm_flags & VM_EXEC) && address == exception_era(regs))
-			goto bad_area;
-	}
+	if (access_error(flags, regs, vma))
+		goto bad_area;
 
 	/*
 	 * If for any reason at all we couldn't handle the fault,
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
