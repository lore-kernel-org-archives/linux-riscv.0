Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A68C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 03:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWc3vMS1I7I7FpSkJWnzH7kqyO30HoUoD11bUFZk5uQ=; b=a2z5oZ4WgynY9g
	kASb0qLHIevbfhJSRjNr0ePMyHUd+eVru+8AI95IxIIYkeCvf1knFCKUk2Wzd8jcE3SG1fmLP9eAU
	whgLNS6Gy5wl4CESQD1REzNiw2QPLDwxffGMSAr149g3udaDfL4l6PCLmCSZctMBsJ9GSYMwx/xOb
	dG0wq7rghJfVqeWqMqNpmDHaKZ1Gmw9/Tbovpz72BNzoTvzH7hqXMI5Mc8hOK0RxcCO3DWdviBpLo
	11VxOrMTjkfo8ZDMDZR5fWR2wDqU5kFcC8jSfxLY7JbWJj7Qgy0HECVwnXRbUzthzRdj+w2AJQ7C6
	093E2QurtAKrr73JEQtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPxk8-004H1u-VE; Mon, 22 Aug 2022 03:04:49 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPxk4-004GvE-04
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 03:04:45 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4M9xvL3ScfzkWWm;
	Mon, 22 Aug 2022 11:01:02 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 22 Aug 2022 11:04:29 +0800
Received: from huawei.com (10.67.175.41) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 22 Aug
 2022 11:04:29 +0800
From: Yipeng Zou <zouyipeng@huawei.com>
To: <linux-riscv@lists.infradead.org>, <oleg@redhat.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<guoren@kernel.org>
CC: <zouyipeng@huawei.com>
Subject: [PATCH -next 2/2] riscv: ptrace: Implement Compat PTRACE_{PEEK,POKE}USR
Date: Mon, 22 Aug 2022 11:01:05 +0800
Message-ID: <20220822030105.16053-3-zouyipeng@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220822030105.16053-1-zouyipeng@huawei.com>
References: <20220822030105.16053-1-zouyipeng@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.175.41]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_200444_425455_E0C5BEED 
X-CRM114-Status: GOOD (  11.60  )
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

Implement Compat PTRACE_{PEEK,POKE}USR for RV32 user app to peek/poke
tracee's space register.

As the Linux manual page say: the addr is define to a word offset in
the tracee's USER area, In riscv it's defined in:

struct user {
	struct user_regs {
		compat_ulong pc;	// addr 0
		compat_ulong ra;	// addr 4
		...
		...
		compat_ulong t6;	// addr 124
	}
	struct d_ext_state {
		u64 f[0]		// addr 128
		u64 f[1]		// addr 136
		...
		...
		u32 fcsr;		// addr 384 read-only
	}
}

Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
---
 arch/riscv/include/asm/compat.h | 13 ++++++++++
 arch/riscv/kernel/ptrace.c      | 45 +++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/arch/riscv/include/asm/compat.h b/arch/riscv/include/asm/compat.h
index 2ac955b51148..a6fc3706a26d 100644
--- a/arch/riscv/include/asm/compat.h
+++ b/arch/riscv/include/asm/compat.h
@@ -52,6 +52,19 @@ struct compat_user_regs_struct {
 	compat_ulong_t t6;
 };
 
+static inline compat_ulong_t creg_get_by_offset(struct pt_regs *regs, compat_ulong_t offset)
+{
+	unsigned long reg_value = *((unsigned long *)regs + offset / sizeof(compat_ulong_t));
+
+	return (compat_ulong_t)reg_value;
+}
+
+static inline void regs_set_by_offset(struct pt_regs *regs, compat_ulong_t offset,
+				      compat_ulong_t data)
+{
+	*((unsigned long *)regs + offset / sizeof(compat_ulong_t)) = (unsigned long)data;
+}
+
 static inline void regs_to_cregs(struct compat_user_regs_struct *cregs,
 				 struct pt_regs *regs)
 {
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 6dc0687e419f..22fedc13cbd2 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -391,12 +391,57 @@ static const struct user_regset_view compat_riscv_user_native_view = {
 	.n = ARRAY_SIZE(compat_riscv_user_regset),
 };
 
+static inline unsigned long compat_ptrace_get_gpr_reg(struct task_struct *child,
+						      compat_ulong_t offset)
+{
+	return creg_get_by_offset(task_pt_regs(child), offset);
+}
+
+static inline int compat_ptrace_set_gpr_reg(struct task_struct *child, compat_ulong_t offset,
+					    compat_ulong_t data)
+{
+	regs_set_by_offset(task_pt_regs(child), offset, data);
+	return 0;
+}
+
 long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 			compat_ulong_t caddr, compat_ulong_t cdata)
 {
 	long ret = -EIO;
+	unsigned long data = cdata;
+	compat_ulong_t __user *cdatap = (compat_ulong_t __user *)compat_ptr(data);
 
 	switch (request) {
+	case PTRACE_PEEKUSR:
+	case PTRACE_POKEUSR:
+		if (caddr < sizeof(struct compat_user_regs_struct)) {
+			/* access gprs addr must be aligned to compat_ulong_t */
+			if (caddr & (sizeof(caddr) - 1))
+				break;
+
+			if (request == PTRACE_PEEKUSR)
+				ret = put_user(compat_ptrace_get_gpr_reg(child, caddr), cdatap);
+			else	// PTRACE_POKEUSR
+				ret = compat_ptrace_set_gpr_reg(child, caddr, cdata);
+#ifdef CONFIG_FPU
+		} else if (caddr < (sizeof(struct compat_user_regs_struct) +
+				    sizeof(struct __riscv_d_ext_state))) {
+			caddr -= sizeof(struct compat_user_regs_struct);
+			/* access fprs addr must be aligned to __u64 */
+			if (caddr & (sizeof(__u64) - 1))
+				break;
+
+			if (request == PTRACE_PEEKUSR)
+				ret = put_user(ptrace_get_fpr_reg(child, (unsigned long)caddr),
+					       cdatap);
+			else	// PTRACE_POKEUSR
+				ret = ptrace_set_fpr_reg(child, (unsigned long)caddr,
+							 (unsigned long)cdata);
+#endif
+		} else {
+			// caddr invalid
+		}
+		break;
 	default:
 		ret = compat_ptrace_request(child, request, caddr, cdata);
 		break;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
