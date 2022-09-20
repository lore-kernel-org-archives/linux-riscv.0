Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7A5ECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 15:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+zqMiUCtdEHru80BBzaSaE8x+2lcIk/K8Xf0xkVcFBM=; b=QUQBoznJIuNqg2
	BbsrNsNjW9oXq6SLsM9lxisfmDwjGotxUzqIbofBT9HhDB2DserJLCHMz904RTwPpGDhLATQyBbyZ
	OLbahIw6+3oS9Kd6SpOn0SivzRgO7MqiNMiN2ux8j4nhSYSECprxOwL9olUxsXWLj9O+Lv2JxVkYT
	CBwVfxM2umEDchB1I/rPzyyCfIlIDgd3+zuCWyM3hmn2Qs5o38BDLYYm12URLgn/KAVcpEFbE5JAI
	lNv8mwOIw+d+7AHxG8Begz/ncXuvawqgPNBZCTCk0r3JApv6GfwGrahiSHe9QhWzeF4n3HuyXH90h
	caks4dxrcnvpliDYu0CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeyc-004me4-2K; Tue, 20 Sep 2022 15:15:58 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeyW-004mYH-TA
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 15:15:54 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MX4lD0zS9zmVjB;
	Tue, 20 Sep 2022 23:11:52 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:15:46 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 23:15:46 +0800
From: Chen Zhongjin <chenzhongjin@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<namhyung@kernel.org>, <jolsa@kernel.org>, <guoren@kernel.org>,
	<nsaenzju@redhat.com>, <frederic@kernel.org>, <changbin.du@intel.com>,
	<vincent.chen@sifive.com>, <ardb@kernel.org>, <mhiramat@kernel.org>,
	<rostedt@goodmis.org>, <keescook@chromium.org>, <catalin.marinas@arm.com>,
	<chenzhongjin@huawei.com>
Subject: [PATCH -next 4/7] riscv: syscall: Don't clobber s0 when syscall
Date: Tue, 20 Sep 2022 23:11:59 +0800
Message-ID: <20220920151202.180057-5-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220920151202.180057-1-chenzhongjin@huawei.com>
References: <20220920151202.180057-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_081553_269258_B85DDA98 
X-CRM114-Status: UNSURE (   7.12  )
X-CRM114-Notice: Please train this message.
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

syscall uses s0 to load address of sys_call_table.

Since now we uses s0 to save pt_regs for unwinding, clobber
s0 can make unwinder treat s0 as pt_regs address. Use s1 for
this job.

Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 arch/riscv/kernel/entry.S | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index ecb15c7430b4..a3b14a649782 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -205,33 +205,33 @@ handle_syscall:
 check_syscall_nr:
 	/* Check to make sure we don't jump to a bogus syscall number. */
 	li t0, __NR_syscalls
-	la s0, sys_ni_syscall
+	la s1, sys_ni_syscall
 	/*
 	 * Syscall number held in a7.
 	 * If syscall number is above allowed value, redirect to ni_syscall.
 	 */
 	bgeu a7, t0, 3f
 #ifdef CONFIG_COMPAT
-	REG_L s0, PT_STATUS(sp)
-	srli s0, s0, SR_UXL_SHIFT
-	andi s0, s0, (SR_UXL >> SR_UXL_SHIFT)
+	REG_L s1, PT_STATUS(sp)
+	srli s1, s1, SR_UXL_SHIFT
+	andi s1, s1, (SR_UXL >> SR_UXL_SHIFT)
 	li t0, (SR_UXL_32 >> SR_UXL_SHIFT)
-	sub t0, s0, t0
+	sub t0, s1, t0
 	bnez t0, 1f
 
 	/* Call compat_syscall */
-	la s0, compat_sys_call_table
+	la s1, compat_sys_call_table
 	j 2f
 1:
 #endif
 	/* Call syscall */
-	la s0, sys_call_table
+	la s1, sys_call_table
 2:
 	slli t0, a7, RISCV_LGPTR
-	add s0, s0, t0
-	REG_L s0, 0(s0)
+	add s1, s1, t0
+	REG_L s1, 0(s1)
 3:
-	jalr s0
+	jalr s1
 
 ret_from_syscall:
 	/* Set user a0 to kernel a0 */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
