Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ED3E83F05
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 05:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3CNPMe4Vhv6/SCiiXUS0CgS0O5pge0PpGb9kuqViGOo=; b=b/Pg6/sIP15Fpw
	zL+9BwhpjDpLwdrY4lFNYwIqMdOdzBKKV4lMJJrLI/x/Mk/2XTuy3ztPc2yOIZ+0SaEy5U82BI7qu
	c0iWbQo22/KeEkIvR/FTffKPjSWRUq5mOe3ZICBoDfn+Qk7zQjIg5DqcZS94dBr4xFflJuW4vsfH1
	BVzg7+ebI3d7jmAas+8r6YyGt4F+G0uNVc50LKTmbd7CZ6ha/rFMhgmmQH4/oXhvlgO8CMCnDa/Ps
	9Pg/tVQLff2HYT+Cm9vEowHiSehkKKOO0Y6x7KnQ01enbaXt3D9lF3oNrgmYBie2JWSk8bdY1puMe
	Y02QXZ+ieN7s3fynisAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsK4-00000009T4P-1Ti2;
	Thu, 05 Feb 2026 05:54:36 +0000
Received: from exmail.andestech.com ([60.248.187.195] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsK1-00000009T3p-3DHe
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 05:54:35 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 6155s2Bu011477;
	Thu, 5 Feb 2026 13:54:02 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Feb
 2026 13:54:02 +0800
From: Hui Min Mina Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC: <tim609@andestech.com>, <ben717@andestech.com>, <minachou@andestech.com>,
        <az70021@gmail.com>, Charles Ci-Jyun Wu <dminus@andestech.com>
Subject: [PATCH] riscv: fpu: refine FPU save flow
Date: Thu, 5 Feb 2026 13:53:42 +0800
Message-ID: <20260205055342.572379-1-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 6155s2Bu011477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_215434_148307_02165EDE 
X-CRM114-Status: UNSURE (   8.72  )
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

From: Charles Ci-Jyun Wu <dminus@andestech.com>

When Kernel first time run to arch_dup_task_struct(),
it will check if sstatus.FS is dirty. If it is dirty,
then it will do FPU save flow. But this field is
floating currently. Meanwhile if the combination between
platform(HW) and Kernel(SW) about FPU configuration
is mismatch. eq: The platform is without FPU and Kernel
is with FPU. Then Kernel may trigger illegal instruction
here.

Hence it shall check by has_fpu before do FPU save flow
in arch_dup_task_struct().

Signed-off-by: Rick Chen <rick@andestech.com>
Signed-off-by: Charles Ci-Jyun Wu <dminus@andestech.com>
---
 arch/riscv/kernel/process.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 31a392993cb4..a27c21c7d9c6 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -199,7 +199,8 @@ void arch_release_task_struct(struct task_struct *tsk)
 
 int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 {
-	fstate_save(src, task_pt_regs(src));
+	if (has_fpu())
+		fstate_save(src, task_pt_regs(src));
 	*dst = *src;
 	/* clear entire V context, including datap for a new task */
 	memset(&dst->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
