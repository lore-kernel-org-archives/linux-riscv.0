Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E553C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 13:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trboeAZ8mgXwuNJcYyJvJRs7wZa95U0eIVaCprIAA1I=; b=oHbOmJUXMLN8Ig
	UWlA7mE8zTfmEqaJZSfWVS6Yf9OXll46++CBr+bSmbWCQsNGImgqo5cKFh1ylLJs3vAiwI8HF3v/U
	/ix22SMKjJzqmIcB700NLWzA1hjriYKMEwKScEUKkElNoOitJk685CGFuyXg1oKsDRPLrX7H6HR4M
	igXOCmSb1zXcgvTZXZvmCJcpfnX8nTMY/3kwJaCPvzqRfAQFsqOT9DeiXdWuitdZDIBeI/v2nq8gU
	ldgtJ8CpL3tBev8NNODHvosWcRMl+ci/AEs2/wQIQ07U3tnhphs/awqACZwieKaoqyertm0Zetseq
	4g4A7LEq8YNqPCC1K9Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBii-0000000EhAM-141s;
	Mon, 29 Jun 2026 13:08:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBig-0000000Eh7t-2vGK;
	Mon, 29 Jun 2026 13:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=y2rxNMcGBVERUB0xF8QBo+X+2UWtMpQIiDO4vuKAX14=; b=UKu8rWK3ptiPqf7UseVuVbC34+
	pE9Fn/AZn0Awv7Qc1xgOocJPQY0FvEaTtG9Wdkt6XQHP5PXFIyXZvtOqsiS5CD8QAqtpVqskHeT1n
	desXWHOcBwxGYkl+ZEWs5dBE0xlI4Mfcu5bs/n1xDXKUcFetZ7JBBVHLbty/sRTDO09tFusfYyiZi
	/coAC3VvgZ0UhFCmkqZR+RBjQv44iV1pewQDD7B7YQE6tBuzKYKRo/CehI0Gpm/kHScWQUBPZjDGJ
	LGk8pRLr3LKoKFcmtVCLxq7cpQsNURkWn1ZQGSaVBkno6uZehS8Wmq6VIjz6LWt6T8VSnHV5H/Epz
	B2gpSwYQ==;
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBid-00000003GAf-0Ye5;
	Mon, 29 Jun 2026 13:08:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=y2rxNMcGBVERUB0xF8QBo+X+2UWtMpQIiDO4vuKAX14=;
	b=uYgu3UfWdnRZOQyVdMpV/f/i7+qFPm534ba8WeKtTwDLdknxr+v38yCdBqgJDbr5T97LlAyiO
	36HFiLpYTA5urvpW5Pve2SadknLYr45ROIKEL39p7hlgAfeRUbHYeYImN1vgaiI7CWGhaUZBHiK
	c0F9f3yI5f7bThtPms8OVmk=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gpmYq5HDLzpSv2;
	Mon, 29 Jun 2026 20:58:55 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 472BC40538;
	Mon, 29 Jun 2026 21:07:20 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 29 Jun
 2026 21:07:16 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <oleg@redhat.com>, <richard.henderson@linaro.org>, <mattst88@gmail.com>,
	<linmag7@gmail.com>, <linux@armlinux.org.uk>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <kees@kernel.org>, <guoren@kernel.org>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <geert@linux-m68k.org>,
	<tsbogend@alpha.franken.de>, <James.Bottomley@HansenPartnership.com>,
	<deller@gmx.de>, <maddy@linux.ibm.com>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>, <chleroy@kernel.org>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<hca@linux.ibm.com>, <gor@linux.ibm.com>, <agordeev@linux.ibm.com>,
	<borntraeger@linux.ibm.com>, <svens@linux.ibm.com>,
	<ysato@users.sourceforge.jp>, <dalias@libc.org>,
	<glaubitz@physik.fu-berlin.de>, <richard@nod.at>,
	<anton.ivanov@cambridgegreys.com>, <johannes@sipsolutions.net>,
	<luto@kernel.org>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <chris@zankel.net>,
	<jcmvbkbc@gmail.com>, <peterz@infradead.org>, <wad@chromium.org>,
	<ruanjinjie@huawei.com>, <thuth@redhat.com>, <mark.rutland@arm.com>,
	<ada.coupriediaz@arm.com>, <kevin.brodsky@arm.com>, <linusw@kernel.org>,
	<yeoreum.yun@arm.com>, <song@kernel.org>, <james.morse@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <liqiang01@kylinos.cn>,
	<pengcan@kylinos.cn>, <ryan.roberts@arm.com>, <yangtiezhu@loongson.cn>,
	<sshegde@linux.ibm.com>, <mchauras@linux.ibm.com>, <austin.kim@lge.com>,
	<jchrist@linux.ibm.com>, <arnd@arndb.de>, <thomas.weissschuh@linutronix.de>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>, <jgross@suse.com>,
	<kas@kernel.org>, <x86@kernel.org>, <linux-alpha@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>, <linux-csky@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-m68k@lists.linux-m68k.org>,
	<linux-mips@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<linux-um@lists.infradead.org>
Subject: [PATCH v16 10/18] arm64: ptrace: Extract syscall_exit_to_user_mode_work() helper
Date: Mon, 29 Jun 2026 21:06:08 +0800
Message-ID: <20260629130616.642022-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629130616.642022-1-ruanjinjie@huawei.com>
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_140811_888596_C6336893 
X-CRM114-Status: GOOD (  12.64  )
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

In preparation for moving arm64 over to the generic entry code, extract
the core syscall exit tracing logic into a new inline helper,
syscall_exit_to_user_mode_work().

This new helper encapsulates the thread flags retrieval and syscall exit
processing, unifying the exit invocation paths across both the fast-path
bailout block and the slow-path trace_exit fallback in el0_svc_common().
This restructuring significantly streamlines the architecture for
the upcoming transition to the generic entry framework.

No functional changes.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h | 7 +++++++
 arch/arm64/kernel/syscall.c      | 9 +++------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 8205af0be612..72461c22bb5e 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -123,4 +123,11 @@ static inline int syscall_get_arch(struct task_struct *task)
 int syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
 void syscall_exit_work(struct pt_regs *regs, unsigned long flags);
 
+static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
+{
+	unsigned long flags = read_thread_flags();
+
+	syscall_exit_work(regs, flags);
+}
+
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index f6e9aa132b09..6de1fe281d61 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -127,16 +127,13 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	 */
 	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
 		flags = read_thread_flags();
-		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP) {
-			flags = read_thread_flags();
-			syscall_exit_work(regs, flags);
-		}
+		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
+			syscall_exit_to_user_mode_work(regs);
 		return;
 	}
 
 trace_exit:
-	flags = read_thread_flags();
-	syscall_exit_work(regs, flags);
+	syscall_exit_to_user_mode_work(regs);
 }
 
 void do_el0_svc(struct pt_regs *regs)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
