Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5F4CA0EE6
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 16:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bap1q5gcZO0+AqHv98fmOjEyCwaotRBsjCli3hc0ULw=; b=mlHO7SKtVc/9Jp
	gXvcv7dG7YPXboI81wwL/VBWjCthgro3S8Z8+Bnr8MDAKEGcnh2qnkptdRvOYGaVAJGH9sf+wsNAo
	uX6LHDV2Yq78JukJKr3F0Bp2NHXTwnLd8phNQ7AejmuyEhArVhm/GafStxei/H3XMgayzCp8M5ZPB
	s/9TO2X23BE+Yqo6yzIkgyRdznPz7GlHqqD0bOpiZtqo2s4MFDPebo4YLYODeJiVwvOlRUViWY4im
	h4REUjnTTOXmmrruGktnJCPPh62VtOren809d9I2pmhf4QlY9ptvVxSFdNd8iz0X+1FS5WcyrsVgx
	E7HfeBvoqHlNK/PpFOrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbHB-000000007yc-3fgE;
	Thu, 14 Aug 2025 16:58:05 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umaJI-0000000HY5w-1fuw
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 15:56:14 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-323266cdf64so949360a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 08:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755186972; x=1755791772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQNPbIdIHYbwO34hliHe+Dii/8OaWGaAGknLYtaJxxA=;
        b=ZutLwMruz11MF0YrztV11kxZDV+FHhUgPxqpgEul7JNVX2g5AySSoJKpYKsm0KMY6o
         cLa6IDZfjmHHz4hT6XFTdFD9z1zRc16nXpksyjllJch6YJ8wpIdNhguoCjwyZYd8qwgc
         BYt5EM0Xwi44x+V8T34ctnQU5q46A2jY/N8XYj6LUZgeBsebUi/bnOjlP7fBsBHx34il
         cmINTpB1R1gwt5Fi7DZmEUoeJvAjgZdotWYyp2hOo1VGJQz3YdvpZgIJ1KsczqQx01BQ
         EuNZdkJOTye2g2ydOKu7vAflc7QBZbScFlW6AeMolZL7ZoKkRvWEVtKEZDaXl61aI60D
         FiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755186972; x=1755791772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQNPbIdIHYbwO34hliHe+Dii/8OaWGaAGknLYtaJxxA=;
        b=CsD944J2vDqesvHvXupxTMCk0aW10sHqbP7DCLMtr+1PC9fJ0WXCgDmqLwfttaoZqC
         rbAOo6Oe248P2MQDSr/RN37uKYFmMe69iYugV0o+CFZWZSDatWe/XejLFLacyRK/gRIB
         3kodPS9H9TVVST/jtqv7CTRSfXOBjPLapYoinL7HAYpD9/+GVqRl6sYzVFVFWoF9pyeJ
         Kxluu1GjmEQHvxHM82ZgBgmxxgkhmVW+wP9Kl5zHaoLuhafwgqa7bs5gDjQsAli6gnS+
         L0HcENDOtF00qK9IJilVtqfx/RCJ+7fY5fu50Ne7xm+9NJnnNf3Bf6bvxkfRIan867f3
         OCmw==
X-Forwarded-Encrypted: i=1; AJvYcCUvfkSC5N1rH+UFzPIP3NENgHzXoRpvZPr8zpC1ip9LctUqvUw/gWiOua0RHZaKc3DJtjq+ig90GfAE7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXRT8O7512aVNnrAO78V1xpBPwbL3ZXoHZ5TzdlQDu1b/Ee4W5
	61XpKh3+9BKTyXuYyV4JcM/O3HTD8m9LFqMR87JQCty8ElrXqCFTagFpflQhaRDAWHo=
X-Gm-Gg: ASbGnct8Ajkv1RbNYdMkW5AS5WUE/4UxGskvnfTwRcSo2YeiXxVXDkCpqYP4JTKaKYx
	qPfL5ajakr/PFr9cncj4MyMfFJbiukJSEZaqxOfPbzolGxj928srOVyiOM8F5mwxW3lLar5wKpE
	cgHaj7HYW4n2C2Kl/GGCzUampzGgiKm1MZL7qap0wGSvdkufRfgmrhGXNLw/8Xn+HbJIvER221b
	CIlUvp5xkrGkGms6zgcN4Kk0khkbBSTp3E4+At9D6abE1UobSKB2nYaoqTWBC2Ixe+mYNxnQrOT
	BRIlc8LkPpospX7nKux6gTwbvonAUu2yl/Lxz4np4tEUBOrMD+LTOtEZWog8bUVfRY8+RWosRkw
	ADHhXNC03eCw82RTsxYStcLCCrJSmGtZuJZQ6+JxGPDb/EtKioL590K4PwX0Q2Q==
X-Google-Smtp-Source: AGHT+IEH2lHONmY7yOykbcxyMlWHAYogmXhk5h922kUnrQe0tO8VefaBP+3/9ekNxpfG4JCDWaX1hA==
X-Received: by 2002:a17:90b:5303:b0:312:1c83:58e9 with SMTP id 98e67ed59e1d1-3232795877emr5105743a91.5.1755186971369;
        Thu, 14 Aug 2025 08:56:11 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3233108e1d9sm2225500a91.29.2025.08.14.08.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 08:56:10 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/6] RISC-V: KVM: Introduce feature specific reset for SBI FWFT
Date: Thu, 14 Aug 2025 21:25:44 +0530
Message-ID: <20250814155548.457172-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814155548.457172-1-apatel@ventanamicro.com>
References: <20250814155548.457172-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_085612_438134_F8924130 
X-CRM114-Status: GOOD (  14.17  )
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

The SBI FWFT feature values must be reset upon VCPU reset so
introduce feature specific reset callback for this purpose.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 164a01288b0a..5a3bad0f9330 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -30,6 +30,13 @@ struct kvm_sbi_fwft_feature {
 	 */
 	bool (*supported)(struct kvm_vcpu *vcpu);
 
+	/**
+	 * @reset: Reset the feature value irrespective whether feature is supported or not
+	 *
+	 * This callback is mandatory
+	 */
+	void (*reset)(struct kvm_vcpu *vcpu);
+
 	/**
 	 * @set: Set the feature value
 	 *
@@ -75,6 +82,13 @@ static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
 	return misaligned_traps_can_delegate();
 }
 
+static void kvm_sbi_fwft_reset_misaligned_delegation(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
+
+	cfg->hedeleg &= ~MIS_DELEG;
+}
+
 static long kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu,
 					struct kvm_sbi_fwft_config *conf,
 					unsigned long value)
@@ -124,6 +138,11 @@ static bool kvm_sbi_fwft_pointer_masking_pmlen_supported(struct kvm_vcpu *vcpu)
 	return fwft->have_vs_pmlen_7 || fwft->have_vs_pmlen_16;
 }
 
+static void kvm_sbi_fwft_reset_pointer_masking_pmlen(struct kvm_vcpu *vcpu)
+{
+	vcpu->arch.cfg.henvcfg &= ~ENVCFG_PMM;
+}
+
 static long kvm_sbi_fwft_set_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
 						   struct kvm_sbi_fwft_config *conf,
 						   unsigned long value)
@@ -180,6 +199,7 @@ static const struct kvm_sbi_fwft_feature features[] = {
 	{
 		.id = SBI_FWFT_MISALIGNED_EXC_DELEG,
 		.supported = kvm_sbi_fwft_misaligned_delegation_supported,
+		.reset = kvm_sbi_fwft_reset_misaligned_delegation,
 		.set = kvm_sbi_fwft_set_misaligned_delegation,
 		.get = kvm_sbi_fwft_get_misaligned_delegation,
 	},
@@ -187,6 +207,7 @@ static const struct kvm_sbi_fwft_feature features[] = {
 	{
 		.id = SBI_FWFT_POINTER_MASKING_PMLEN,
 		.supported = kvm_sbi_fwft_pointer_masking_pmlen_supported,
+		.reset = kvm_sbi_fwft_reset_pointer_masking_pmlen,
 		.set = kvm_sbi_fwft_set_pointer_masking_pmlen,
 		.get = kvm_sbi_fwft_get_pointer_masking_pmlen,
 	},
@@ -321,11 +342,16 @@ static void kvm_sbi_ext_fwft_deinit(struct kvm_vcpu *vcpu)
 
 static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
 {
-	int i;
 	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
+	const struct kvm_sbi_fwft_feature *feature;
+	int i;
 
-	for (i = 0; i < ARRAY_SIZE(features); i++)
+	for (i = 0; i < ARRAY_SIZE(features); i++) {
 		fwft->configs[i].flags = 0;
+		feature = &features[i];
+		if (feature->reset)
+			feature->reset(vcpu);
+	}
 }
 
 const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
