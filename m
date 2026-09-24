Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F14DC9830E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 10:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m1obkm6m/vg8AKMJu4RdSgl30BckZJSVoKJiOlmcV7o=; b=tvo8rEXT5NwdEo
	rezaev1mymKSrQFJcCZPz9QOxHeA2DBMSreDaiZXiQnwvSlZgA8qwd5fDAvCY7aNm8iIrM3E2EBb6
	qKCGr5dx7vy6VJcW48oj2di4ugo/jR47H/etLYsZaw1HiiprrRL/DIht6puO0PvQmqjLlbcJV8W8D
	fMyt2/OFL2mDrQRdPPpEWSvIBViRH5mq6hRDRnqOjS6wYCtFjWxZkAFxp/sxBl8iffiQ+dDyCb+e+
	pHnp8gxt+ro6R71+gCtQOOv8puLl12EiFlBAWww0JTvyFZaZGuUaB05xFS3MOz19Co8PiO3ojOWuD
	4ZFT9+VhfCcMe/pCR08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gV8-0000000AgPQ-2Svb;
	Thu, 24 Sep 2026 10:16:26 +0000
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gV2-0000000AgOV-1Efx
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 10:16:25 +0000
Received: by mail-dl2-x10.google.com with SMTP id a92af1059eb24-142dd025d06so1642264c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 03:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790244979; x=1790849779; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u7LK00oqDOE3QAV0dIPEwP0ZWU0x/VHk80FlxiovFNw=;
        b=Z/pjjbr9ig2rSNYHcbvgrfu8qcWEvSS11FjHpCw7HgbDehLMJ4doBjrey+VlH3PZAT
         +xVtilIJW0XShC2Z0f1nz3ugzEnvwcNuYGYfe23BKtUo60PzZme6mi68epyZPN1OucpU
         Yj3hg//NQjgdmxQx1Le9ZeUJ7j/ghcnnaHwIm1oItUEZCuR3DP7XVq/mpNYqqDI+Qlfl
         59Jm8aXcjXjGSIC9+DQ4dY/b2I4Ac4aobYO1Ue4QY10IBTDCxBw0I1Tysc9OqX750pAH
         BdROewG7RiiKWoNLOb/0P/yNMExV3CCMNHV2icLP5mir+c1HWPq3UODAlen0NSg12Wq3
         EUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790244979; x=1790849779;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u7LK00oqDOE3QAV0dIPEwP0ZWU0x/VHk80FlxiovFNw=;
        b=Zyq5sH0bFgzRQ+6uModsKQL45a3D/1aybbUK8/fISaqCMb71iA+sOSqAY7BUxqriUs
         kI+tPKAQ4tw19KH0U6Bsvjjf8b3HByDTaOP8o5XkuKMKDB6YM46dsKzy1mwUU/JkkcT1
         7nIctYQxKNfbKfeA6ozAU0OktOlnIvCls8HzpJknIuqJTEMZLS0gJy1YxhJDzSbpw+sq
         Kq2/3n9ahYTPq9czKsAejRzC+Z7JQF7kHpq5polCKR8Nv11jonG+kRPqNm3mC9jPzcXs
         YX41S+hD9esc6E8E4yZXv9ulqD+X5Wdcq0ioJr8gvg1optezXXT4kej68V8OiKCeg9cj
         r2/w==
X-Forwarded-Encrypted: i=1; AKwUvByHinUybNbA8aM1BWDAncN0gcd4mLYu5ZI+2TQX7lOMMDPCQQPpI7P5gDhml1S3DCkGce8wTgT4V2xkbQ==@lists.infradead.org
X-Gm-Message-State: AFuF++m9bpEItiov2uKXKVt9YMsksWVDg485+DWPGEr8IBf9MomvKNZH
	4tEL0H1Le0i3G3mDr9wC+iVEeYWUcRgrNEoI77S+Zedv/XS+W0vZR3ItjIzPG52IBE0=
X-Gm-Gg: AYBFou0gK6yZGxSK+7qZ5teol7mz3lvrZz5ZsQqKU9Dc7yO6LEoL1MTItiIbqZy+p6A
	pZFTIRfidP90+TCmGClQjwTs9iE+bjE+VdCG957k1PA4XxM+CIWB3n1rcpwTpoRr0kjRULBQCSI
	cjdECYw1FkxJ9A2JRSZ8SoSkHVQ8vGPM6s5Bwa2cMnK05nBhHxgtiVjG4gEjtcV5iBKI4nDYT4o
	fizU2gJLHc79Vg3pADstPkXVCHctYRLUJlhMkIM7uKtwn//h3O1zAjGWYCli+QEYg0nFf4DbADL
	yvs41OjZoIwEBAnWXxo31BF58Wom/4AzPxg2rSF8bVhZGT/utd+KK033rqoAIidzJfaiRY5hkfT
	guvG44+yonqhBgP8NYaaVbnaEWO/oKTGsp0wBla+ywnjtBRTgVgXYJI0cBeUdgp7NTPCp24smAv
	Mm3FNxWIuLXtVnei8WfpNZJo/Xa8IEyxY7IBcWq9Cf5OFwpjHsvRGT1f6jhYK8YGiHlKOY2K3cL
	G9LycyJ4fEHVRQjx34=
X-Received: by 2002:a05:7300:c019:10b0:33b:c24c:47cd with SMTP id 5a478bee46e88-340035bf9d9mr1782888eec.16.1790244978791;
        Thu, 24 Sep 2026 03:16:18 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e975223fcsm12254595eec.31.2026.09.24.03.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:16:18 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Thu, 24 Sep 2026 03:16:13 -0700
Subject: [PATCH v2] RISC-V: Clear HSTATUS.HU on CPU initialization
MIME-Version: 1.0
Message-Id: <20260924-hstatus_hu-v2-1-7e970f5f1d8d@sifive.com>
X-B4-Tracking: v=1; b=H4sIAGz4tGoC/22NywrCMBBFf6XM2kgTHw2u/A8pkqZTM4JNySRBK
 f13m7p1eeDcc2dgDIQMl2qGgJmY/LiC2lVgnRkfKKhfGVStzrWWjXAcTUx8d0kYabQ2qrFNJ2E
 dTAEHem+xW/tjTt0TbSyFYjji6MNne8uyeH/DWQoplLang+2H7ljrK9NAGffWv6BdluULdtg/e
 rcAAAA=
X-Change-ID: 20260817-hstatus_hu-a1a88a27c7b1
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790244977; l=3822;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=MiE+4ItnXmHUBKhLrUz3zntIZyWtLRntpAxtOY0u6BY=;
 b=lJsDgeDAFpzkUZgwbf6xofjnxNK0j5K+KDvcLG59+7QXUPCuV2SrHNbl6effhqne9YSnrJDPl
 DbbQVpzEO2jBsZbYKau8bP8WWRoX/urfT4BpbtZmYrJ8aUni4lV7kqg
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_031620_349050_1381FB3F 
X-CRM114-Status: GOOD (  12.14  )
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

The RISC-V privileged specification does not mandate HSTATUS reset
values, leaving the HU bit potentially set after hardware reset.
When HU=1, hypervisor instructions (HLV/HLVX/HSV) can execute in
U-mode to access guest memory, which may cause unintended behavior
if not explicitly controlled.

Clear HSTATUS.HU during CPU initialization to ensure hypervisor
instructions are only available in HS-mode, preventing unexpected
guest memory access from U-mode code.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
Changes in v2:
- Clear the hstatus.hu in the arch core setup instead of kvm core setup
(sashiko)
- Link to v1: https://patch.msgid.link/20260817-hstatus_hu-v1-1-28c53cdfb408@sifive.com
---
 arch/riscv/include/asm/cpufeature.h |  2 ++
 arch/riscv/kernel/cpufeature.c      | 12 ++++++++++++
 arch/riscv/kernel/setup.c           |  2 ++
 arch/riscv/kernel/smpboot.c         |  2 ++
 arch/riscv/kernel/suspend.c         |  2 ++
 5 files changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b..5efa72823475 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -40,6 +40,8 @@ extern u32 thead_vlenb_of;
 
 void __init riscv_user_isa_enable(void);
 
+void riscv_clear_hypervisor_csr(void);
+
 #define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size, _validate) {	\
 	.name = #_name,									\
 	.property = #_name,								\
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f46aa5602d74..80767a016602 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1183,6 +1183,18 @@ void __init riscv_user_isa_enable(void)
 		pr_warn("Zicbop disabled as it is unavailable on some harts\n");
 }
 
+void riscv_clear_hypervisor_csr(void)
+{
+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_h))
+		return;
+
+	/*
+	 * Clear HSTATUS.HU to restrict hypervisor instructions to HS-mode.
+	 * This prevents user-mode from executing HLV/HSV instructions.
+	 */
+	csr_clear(CSR_HSTATUS, HSTATUS_HU);
+}
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 52d1d2b8f338..bf42efd848f6 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -364,6 +364,8 @@ void __init setup_arch(char **cmdline_p)
 
 	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZBB) || !riscv_isa_extension_available(NULL, ZBB))
 		static_branch_disable(&efficient_ffs_key);
+
+	riscv_clear_hypervisor_csr();
 }
 
 bool arch_cpu_is_hotpluggable(int cpu)
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index f6ef57930b50..a9de2dae804c 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -244,6 +244,8 @@ asmlinkage __visible void smp_callin(void)
 
 	numa_add_cpu(curr_cpuid);
 
+	riscv_clear_hypervisor_csr();
+
 	pr_debug("CPU%u: Booted secondary hartid %lu\n", curr_cpuid,
 		cpuid_to_hartid_map(curr_cpuid));
 
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 3efbf7874f3b..db220966f782 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -43,6 +43,8 @@ void suspend_save_csrs(struct suspend_context *context)
 
 void suspend_restore_csrs(struct suspend_context *context)
 {
+	riscv_clear_hypervisor_csr();
+
 	csr_write(CSR_SCRATCH, 0);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
 		csr_write(CSR_ENVCFG, context->envcfg);

---
base-commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650
change-id: 20260817-hstatus_hu-a1a88a27c7b1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
