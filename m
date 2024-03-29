Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513E6C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 04:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1cd93Up286XGQHn5tzsqfufeuYOYvWfTtTp9TDQRME=; b=hVGQTQ96LkhDFV
	+AEtjeqmy2Ls5D1oZrpgb39I+ZPzIgf/F7+BwWP/i7/ZrN9I4BI4Rgdcmdabh5ECR+rQLRzAvEciA
	VDUuevkFEy3gd2o4j6nfWGh1T8pRzYpEeh2AW2npPbcy/iMrj3jqqJQY7cpDKzvWeL7YlP+W07sgk
	QTMV9C04baNGKscfpJp6aYhO7onMMXeF5RXp+OWDV96ORlMf9OLYjf8KZOp+iLSlfML/RT79kkHNz
	J39R3IQoHgE0A8UL7XoTH/SMalatNvie6N33R7IQ1eyBPKLW+7Tp05UhLkqIKpKxZWA7ICQUW82lb
	V92NQJH8603YQzl5lDbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq49T-0000000GoM8-0bss;
	Fri, 29 Mar 2024 04:47:39 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq48i-0000000Gnhs-0z46
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:46:59 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-22a96054726so1209473fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687597; x=1712292397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOjKUP7R2Pn5KHy+bcQHndffhGuedIhGkkiUJ74Ko2E=;
        b=gR7XTVkB+pn4lUj66ZcEhFAWbK90IaajhNqYLmlWT56d8nOSLoADogI5PIVV7JhIIq
         4SohT6Lq64Ry/FZ7NMbVx+qsSLlMZ7mMVpYByPlv1mPDn6BdLnhvMeRmejPR8uOWYEJl
         epU3wGaWmrr96ywHSAh/ky7seYaTqA3XmibH9CEldJpIZce1ak1L9D2o5cMIfRijHCeY
         L3KpE5Jh4ULyexzym5PmOC8ggDNlJcEzfxz2/+bLpxAkYJhUUvrstyN2WcsomqO8G470
         QREe9TtZrMJQlFe7wKYVrO4A0137FUrzJjtk0fClOdhvLCw98G+mMbfUybBw0koe8msB
         be3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687597; x=1712292397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOjKUP7R2Pn5KHy+bcQHndffhGuedIhGkkiUJ74Ko2E=;
        b=lbYWchq0CgP+rCRwdeXnRUXCsQRJRLyecWp2GWBhf6PXftsenywq7z9NCX6Yxx9z6M
         FfDkrUE+J2uo7PahSTVcuuJAtjQGQoOQxu2mZlreCWGM6U6EPUuxZjsx8tze8fK9JbrX
         XawlRqhVNTR7PoKeBjDBNCbtJjiV59SPA5yOTK5VPmQbmm5XBX0xWTZjB4Fg6K4wcHYX
         euvgCoiKj2ToHU3nrvFxWXDglx33aWoeyy988FZMy9Ii/uUyGi8NqHtJU1l5MIqRo5kU
         eb5l7jkDj7hYOEpAbW3Kn06NxBY3UXO76TFeH0Rs+OyG6figgHbfvyCz7P66nHR2/Azr
         gnbA==
X-Forwarded-Encrypted: i=1; AJvYcCUb/rCXOAPqAg6Fgwzd9K25s92zf/Jg/FaKo08vyXXsJ5v5N0aDn5kQKw+CBxPzY03m1m2fV0s9Lmu7b+s4m3QWyg2J0YGlWnkycXUJE/oN
X-Gm-Message-State: AOJu0YxHqroFv1w1kcoX4t8uItx4HeTrHoisqxr/VQ7baUrhMNTYtdjo
	iaBAxiGvh5+fSrggSHY6hH9uhvOGj99KzO3dHkb3ZwHfplzGIDAzxVCfPImjIPM=
X-Google-Smtp-Source: AGHT+IGJQSx7xjJ7n2mbejRm8WQQAwrhRnla3swVvKyB0ZaA2dVNGQk8U096glMvDQJ5OLMIlZU/5g==
X-Received: by 2002:a05:6870:b698:b0:229:e636:921f with SMTP id cy24-20020a056870b69800b00229e636921fmr1250647oab.49.1711687597188;
        Thu, 28 Mar 2024 21:46:37 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:36 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v2 16/27] prctl: arch-agnostic prtcl for indirect branch tracking
Date: Thu, 28 Mar 2024 21:44:48 -0700
Message-Id: <20240329044459.3990638-17-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_214656_057834_06A4BE21 
X-CRM114-Status: GOOD (  11.94  )
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

Three architectures (x86, aarch64, riscv) have support for indirect branch
tracking feature in a very similar fashion. On a very high level, indirect
branch tracking is a CPU feature where CPU tracks branches which uses memory
operand to perform control transfer in program. As part of this tracking on
indirect branches, CPU goes in a state where it expects a landing pad instr
on target and if not found then CPU raises some fault (architecture dependent)

x86 landing pad instr - `ENDBRANCH`
aarch64 landing pad instr - `BTI`
riscv landing instr - `lpad`

Given that three major arches have support for indirect branch tracking,
This patch makes `prctl` for indirect branch tracking arch agnostic.

To allow userspace to enable this feature for itself, following prtcls are
defined:
 - PR_GET_INDIR_BR_LP_STATUS: Gets current configured status for indirect branch
   tracking.
 - PR_SET_INDIR_BR_LP_STATUS: Sets a configuration for indirect branch tracking
   Following status options are allowed
           - PR_INDIR_BR_LP_ENABLE: Enables indirect branch tracking on user
             thread.
           - PR_INDIR_BR_LP_DISABLE; Disables indirect branch tracking on user
             thread.
 - PR_LOCK_INDIR_BR_LP_STATUS: Locks configured status for indirect branch
   tracking for user thread.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/uapi/linux/prctl.h | 27 +++++++++++++++++++++++++++
 kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 3c66ed8f46d8..b7a8212a068e 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -328,4 +328,31 @@ struct prctl_mm_map {
  */
 #define PR_LOCK_SHADOW_STACK_STATUS      73
 
+/*
+ * Get the current indirect branch tracking configuration for the current
+ * thread, this will be the value configured via PR_SET_INDIR_BR_LP_STATUS.
+ */
+#define PR_GET_INDIR_BR_LP_STATUS      74
+
+/*
+ * Set the indirect branch tracking configuration. PR_INDIR_BR_LP_ENABLE will
+ * enable cpu feature for user thread, to track all indirect branches and ensure
+ * they land on arch defined landing pad instruction.
+ * x86 - If enabled, an indirect branch must land on `ENDBRANCH` instruction.
+ * arch64 - If enabled, an indirect branch must land on `BTI` instruction.
+ * riscv - If enabled, an indirect branch must land on `lpad` instruction.
+ * PR_INDIR_BR_LP_DISABLE will disable feature for user thread and indirect
+ * branches will no more be tracked by cpu to land on arch defined landing pad
+ * instruction.
+ */
+#define PR_SET_INDIR_BR_LP_STATUS      75
+# define PR_INDIR_BR_LP_ENABLE		   (1UL << 0)
+
+/*
+ * Prevent further changes to the specified indirect branch tracking
+ * configuration.  All bits may be locked via this call, including
+ * undefined bits.
+ */
+#define PR_LOCK_INDIR_BR_LP_STATUS      76
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 242e9f147791..c770060c3f06 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2330,6 +2330,21 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
 	return -EINVAL;
 }
 
+int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
 #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
 
 #ifdef CONFIG_ANON_VMA_NAME
@@ -2787,6 +2802,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			return -EINVAL;
 		error = arch_lock_shadow_stack_status(me, arg2);
 		break;
+	case PR_GET_INDIR_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_get_indir_br_lp_status(me, (unsigned long __user *) arg2);
+		break;
+	case PR_SET_INDIR_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_set_indir_br_lp_status(me, (unsigned long __user *) arg2);
+		break;
+	case PR_LOCK_INDIR_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_lock_indir_br_lp_status(me, (unsigned long __user *) arg2);
+		break;
 	default:
 		error = -EINVAL;
 		break;
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
