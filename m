Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D23C53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 23:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LgdXCYB67Qqye/U57EDP3JCRDF3WN+mnogUfgED/uPI=; b=mfKxcs80SC8hUU
	KqT7M6K/2J9dGyE1XXZaFJUDPl9/8mNeWdjO3Nia3sbCN0SigAUQlz+lXkBwdhgh3ccYJ6RLNq709
	D/tp2HCZhhVLHww9jSAoxq6VCUDVHsV26OTI4qplnsc9VxUgmd6ZaWdmygIULWnnrgc48Jz0WaVw1
	y8DoQpzvOCp9POsejdeTDKoaEuCBlkNkIhVX+GXm2zEzl2OH02u2Nr4mnQUK6bdOS7p83PYJBXI9a
	4szJmLXgjjmyXq/Cj9RKzNvAiTGJ+zqYkKRp1FtfmFxraQ6Juq59mvlmtO3bZR+mbXl350Kqe5+PB
	DeDVvoqGfYrCsuhe73zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDej-000000096xI-3oOm;
	Wed, 29 Jul 2026 23:25:45 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpDeg-000000096v1-3fZj
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 23:25:44 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-848593533cbso1019066b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 16:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785367542; x=1785972342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5uwqzdU+bRfmUzUhku7H1r8OyjJF5nGSMJqcdrWCrY=;
        b=Y6VH9PS/jIfi1Ri/+FvBjXenL2Y1Tcm9NorVPsAqoOqNool6Pt8QHhL/SHLIf8SE0I
         aXwW/yU3fYxHFDf3OD0Qd05lpwzJE9pYZXNzfylM32WeDi46x+7/assE4y4u4daq0CPW
         ncLna/UOfXCuNz3WvpSgwod0gpQrX4wfnMA7TayvOEVQOLnSzIyde8is53Irrnf8WQVL
         r+4OPtQ2S7JNKvt0BzzYd4yVUbAGDVRsq75TFoSCT1o+mxKsjEOmxhPpCLjsMyjyD1Iy
         f0EmHU83JqKdDkNdVexIQFweLnHyazNcBUUntmLnrJP0OiATF7DCk2FfcnsHb3dSktHJ
         8ZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785367542; x=1785972342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b5uwqzdU+bRfmUzUhku7H1r8OyjJF5nGSMJqcdrWCrY=;
        b=PSA4/RPqSaaotbFXcxE2BGgxzyLJn1Smc2HTSs5Nist8haW2eZZxaa7oSU2fI61LfJ
         0TrxPYbP1kF5UWcC00t5AccFou2VuYIQKOhflb6vZTiRHCWvo/q7NchdyPbP6U93j8ea
         NDMPgfz9PiDTr/+s6zK17dzpxRbxNnjeprJicy+LufPDUUiImElroHT3lv37E+XVx9XU
         yWryfOEsRaB+yzalYJosgeM/FOWByLxyo+yYtrCkLMsTcJrUrtLfzAy5FqfaTmXLGO23
         iF5EhsN2pnWj2mWhnGN23BGDsZVory1ossKfdrF5Bw1NwxmwaGGcT5IZub9kmGBvjqgL
         6bnw==
X-Forwarded-Encrypted: i=1; AHgh+RoRKUPXOAvDtEO/a4CvLkrTrNL0/SaTHwhW6HP4nRVjUN7lWkDBH22eeEtjEXszTvtuPUG6h7Ncldqedg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOK5AXhty0UZFVrGR6MaF5it7F3m0m2uSfTeg9crVjtOCXuPsb
	tb3PwEuXwva48hWp0uykuWLx0P8vr3GDlUc7zquWanGSg9yYue6FijB7
X-Gm-Gg: AR+sD13KrEoJbmtUR6LZG0WIXAIRPzlCY1PhMlY5jtNCbf0Am/1FJ0SxYtq0rphuJVV
	kfadTKNkKMFPa6Uz7dPFVFSKFZhufKYjg5BT+uhtqzq7+hs/Q9bgQkW5Jw5V+87DB0CtOK3u+eY
	Jd9mYa6OXSEbzcXyEp4tNVNBA/aWjNcz8taEGsYDIUWAA2TmLkJBmZEVLm9nHm/n7LWrfYA7gZ2
	mLA6Altqmiuqp3qxa6Cu2oeiGoG2VXA5g88qflhqeZzwVtwkAXdNDd9c2dK+WgTGtWIT37q4jRu
	yHnOHWwBDu99wtBqV3jOrQcK6KBNDZD//bHBw92qmiWXWi920vo6+0ladOj/8wdOjE7VpodYS+U
	2YenhImQm5MuWmNKSYBz3SZk2gTsoceYHLMX53tZ2zneCa8NI+BrpbFzuC137IGPAsulXytw4/D
	PAkHv1EB/d/4OMB1DCR6hS/QIkls5RLJxxg7AEMMNcvHG9msXyGVQ9/luN3/4=
X-Received: by 2002:a05:6a00:330e:b0:82f:38df:681c with SMTP id d2e1a72fcca58-84ebc1eb51amr328381b3a.6.1785367542040;
        Wed, 29 Jul 2026 16:25:42 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02fa474sm1992558b3a.30.2026.07.29.16.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 16:25:41 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 1/4] RISC-V: KVM: Add SBI extension validate callback
Date: Thu, 30 Jul 2026 07:25:22 +0800
Message-ID: <20260729232527.139183-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729232527.139183-1-inochiama@gmail.com>
References: <20260729232527.139183-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_162542_939861_25034AAE 
X-CRM114-Status: GOOD (  13.04  )
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

When user disable FWFT extension after setting any value of the
FWFT feature, the state of vCPU will be broken since the value
of disable FWFT feature is still functional.

Add the generic SBI extension validate callback so the FWFT
extension can fix its parameters before the first run.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 ++++
 arch/riscv/kvm/vcpu_config.c          |  2 ++
 arch/riscv/kvm/vcpu_sbi.c             | 23 +++++++++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index c1a7e3b40d9c..f01a2860c751 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -60,6 +60,9 @@ struct kvm_vcpu_sbi_extension {
 
 	void (*reset)(struct kvm_vcpu *vcpu);
 
+	/* Allow the extension to correct its parameters before the first run */
+	void (*validate)(struct kvm_vcpu *vcpu);
+
 	unsigned long state_reg_subtype;
 	unsigned long (*get_state_reg_count)(struct kvm_vcpu *vcpu);
 	int (*get_state_reg_id)(struct kvm_vcpu *vcpu, int index, u64 *reg_id);
@@ -93,6 +96,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_sbi_validate(struct kvm_vcpu *vcpu);
 
 #ifdef CONFIG_RISCV_SBI_V01
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
diff --git a/arch/riscv/kvm/vcpu_config.c b/arch/riscv/kvm/vcpu_config.c
index 238418fed2b9..b68aa830aaf5 100644
--- a/arch/riscv/kvm/vcpu_config.c
+++ b/arch/riscv/kvm/vcpu_config.c
@@ -69,6 +69,8 @@ void kvm_riscv_vcpu_config_ran_once(struct kvm_vcpu *vcpu)
 
 	if (vcpu->guest_debug)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);
+
+	kvm_riscv_vcpu_sbi_validate(vcpu);
 }
 
 void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 46ab7b989432..b737e9a7a12a 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -723,3 +723,26 @@ void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu)
 		ext->reset(vcpu);
 	}
 }
+
+void kvm_riscv_vcpu_sbi_validate(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	const struct kvm_riscv_sbi_extension_entry *entry;
+	const struct kvm_vcpu_sbi_extension *ext;
+	int idx, i;
+
+	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
+		entry = &sbi_ext[i];
+		ext = entry->ext_ptr;
+		idx = entry->ext_idx;
+
+		if (idx < 0 || idx >= ARRAY_SIZE(scontext->ext_status))
+			continue;
+
+		if (scontext->ext_status[idx] != KVM_RISCV_SBI_EXT_STATUS_ENABLED ||
+		    !ext->validate)
+			continue;
+
+		ext->validate(vcpu);
+	}
+}
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
