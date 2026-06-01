Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694C4CD6E4C
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5GUHP1yJVrOqjXcDFdHlzqbVQejsjFRAxlOwNh3njU=; b=S3KPtGVhjZoNKH
	P4sZ4dtwsOm2ZOOD6pwlxeKvcpTS1F7CnNFyaUoUiPVSiWvLLdKi4QLkFvWbwlKkJAyOROXw5nsXa
	N0gXW+ZnFnl3dYYB/rk3sz3bWY/1ioz4Gg5brLSHov8+xfp715gfkaVZFAEmTmaMR9S9KVa/WCBO0
	ojXkesrW35AtEF3nwvdQ+1PQT0Qv5WZ2YvR8TtrKFMzOfDvwGfptbY6TQcZ36kLJXFX3vQZn/j8Qz
	ImKTmJri3D1wjh6Y/JbjYtorqRatcp7oTLQfoDrH9fsxML8EC8TiXNA1TtYWuFmVeULdfX1F/9kcE
	epkkEH+wCL+8sDeg9g6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFu-0000000AOSb-0720;
	Mon, 01 Jun 2026 08:44:18 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFr-0000000AOOV-37Ly
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:44:17 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2bf1f074a12so31010755ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303455; x=1780908255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZP5r0J73Q2Ucds4N11ve2c25N4gijVaOCy/mmdW+YU=;
        b=EEKTAf6Uml8aAE8SpOeYJ9niC4rEVVF0vc8TqQV5oSrYGCDAIrYISBiPBk/y8O3Cmb
         IdsAFLq/lIUffKOQ8m4H0TkcdFfmY6F7lWYzkCgWVL7z7j0vq8hHpWRtJ9611L2vfCmc
         AjADA4dDA9jWMYfsUkSZiTrEGHJIzWTvxXlVHwcekifvDAstx3eOnpC2O+lhXyLpE9Zb
         QCnxwGhj0hU4CKVdgp7iqw2rQSj/nh26seebuyQeyJEZQcAz5QYJs5sJpmj3O4GT2xfI
         hP2JQR+Es4Ukv8zlsj75VCkEGNfNLqayRGqVBkftgWw3UHiEYTjkp1MQhYZntdhkhHU5
         o+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303455; x=1780908255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AZP5r0J73Q2Ucds4N11ve2c25N4gijVaOCy/mmdW+YU=;
        b=k4a/g8z4mfRXWfxHPizP8QeXks4QNQmWIUjvDrheZMr2tuFZNMPILB/qZA5HSGk2jO
         e8vz6Zs7HekhrhnfDxKM7soii4M3Xf0Re1YlMLCvchcuq1iZSN314Fv/bBnGsW6bmDxv
         jCw3L5ruYz6KnQKue/3HCmjUvYq1gC/bSbd42+AG5h405hT5PpzGZ406cPG+u/7HnPWB
         6c1TB9DZ43d14Vpjkw/ja9eLrOOvk01KrD6dKgLJyJRUUHoAs2tFzwtbz1lT6qT+yiXF
         Ptfdf4FO6rc/67QuCG8DRrfzzgc4jk/GOf6Os379HVVm8+Lsu2cdxoyv9x5u8IibKQPL
         wGLg==
X-Gm-Message-State: AOJu0Ywu1cD6R6qQrppzEOKzJbW1W592J6teCm11KGdAXBNsYkLVl+/7
	ub7bRWxhRkHljZQiHVvkmpH0BHWnNzXpQdFi8kaKeGGYtm+5O5v1gfxH
X-Gm-Gg: Acq92OGp7OZfmPCD8pNUnn9K/RQR2BKeKPUdSL8zOBSjkw+8JlpbA95NPuLA6MFPOI/
	am0BAuiLkwQcZXGfmPi4lhXlwy+VK0ryfUiozNr+lHJDWw6FxB3MrGPC1lYyB6d+tnLw8N+cE0V
	N+1EUG6P9+WXomizUD3RAxc/RTZkazBcizNdh6LaW0E5eSlHvozFKaZ/lBthV45D9JvnpyyumJn
	K5lAT6R6drP7BJDDJlFc4bvGfVQDYIcETrwUd7Wip8BIKxvi402epbpT8LGo0BGBpjx1F1iMxgo
	rVAXYCb7RjNu2fBXXUBdepYUZyLXdyE0twKIFiKy6ScPIKVjFGxzSWpMiGjvo6U1lxYFF1Mbqg+
	WvHXZlbOAxTJUWjuBOpqsIVseE92cpMsyd7OyeHGHbS/VnSvszT63S0VoOGzatR08Rw71yqyYJM
	lnmCxFjNKJ9E9Dw5UwT2iulLgNNlFtVW8pKA==
X-Received: by 2002:a17:902:e749:b0:2c0:b4f5:41d4 with SMTP id d9443c01a7336-2c0b4f5428bmr82594955ad.41.1780303454902;
        Mon, 01 Jun 2026 01:44:14 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c26bcesm95822185ad.65.2026.06.01.01.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:44:14 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v2 6/7] RISC-V: KVM: Add support for control-flow integrity FWFT features
Date: Mon,  1 Jun 2026 16:43:34 +0800
Message-ID: <20260601084336.2601675-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084336.2601675-1-inochiama@gmail.com>
References: <20260601084336.2601675-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014415_805602_85190FE3 
X-CRM114-Status: GOOD (  11.88  )
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

Control-flow integrity is controlled through a WARL field in henvcfg.
Expose the feature only if the Zicfilp/Zicfiss is supported for VS-mode.
Allow the VMM to block access to the feature by disabling the ISA
extension in the guest.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 70 ++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 375269e43c13..278eb95b97de 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -163,6 +163,58 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
 	return SBI_SUCCESS;
 }
 
+static bool kvm_sbi_fwft_landing_pad_supported(struct kvm_vcpu *vcpu)
+{
+	return riscv_isa_extension_available(vcpu->arch.isa, ZICFILP);
+}
+
+static void kvm_sbi_fwft_reset_landing_pad(struct kvm_vcpu *vcpu)
+{
+	kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_LPE);
+}
+
+static long kvm_sbi_fwft_set_landing_pad(struct kvm_vcpu *vcpu,
+					 struct kvm_sbi_fwft_config *conf,
+					 bool one_reg_access, unsigned long value)
+{
+	return kvm_sbi_fwft_env_flag_set_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_LPE);
+}
+
+static long kvm_sbi_fwft_get_landing_pad(struct kvm_vcpu *vcpu,
+					 struct kvm_sbi_fwft_config *conf,
+					 bool one_reg_access, unsigned long *value)
+{
+	return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_LPE);
+}
+
+static bool kvm_sbi_fwft_shadow_stack_supported(struct kvm_vcpu *vcpu)
+{
+	return riscv_isa_extension_available(vcpu->arch.isa, ZICFISS);
+}
+
+static void kvm_sbi_fwft_reset_shadow_stack(struct kvm_vcpu *vcpu)
+{
+	kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_SSE);
+}
+
+static long kvm_sbi_fwft_set_shadow_stack(struct kvm_vcpu *vcpu,
+					  struct kvm_sbi_fwft_config *conf,
+					  bool one_reg_access, unsigned long value)
+{
+	return kvm_sbi_fwft_env_flag_set_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_SSE);
+}
+
+static long kvm_sbi_fwft_get_shadow_stack(struct kvm_vcpu *vcpu,
+					  struct kvm_sbi_fwft_config *conf,
+					  bool one_reg_access, unsigned long *value)
+{
+	return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_SSE);
+}
+
 static bool kvm_sbi_fwft_pte_ad_hw_updating_supported(struct kvm_vcpu *vcpu)
 {
 	return riscv_isa_extension_available(vcpu->arch.isa, SVADU) &&
@@ -288,6 +340,24 @@ static const struct kvm_sbi_fwft_feature features[] = {
 		.set = kvm_sbi_fwft_set_misaligned_delegation,
 		.get = kvm_sbi_fwft_get_misaligned_delegation,
 	},
+	{
+		.id = SBI_FWFT_LANDING_PAD,
+		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, landing_pad.enable) /
+				 sizeof(unsigned long),
+		.supported = kvm_sbi_fwft_landing_pad_supported,
+		.reset = kvm_sbi_fwft_reset_landing_pad,
+		.set = kvm_sbi_fwft_set_landing_pad,
+		.get = kvm_sbi_fwft_get_landing_pad,
+	},
+	{
+		.id = SBI_FWFT_SHADOW_STACK,
+		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, shadow_stack.enable) /
+				 sizeof(unsigned long),
+		.supported = kvm_sbi_fwft_shadow_stack_supported,
+		.reset = kvm_sbi_fwft_reset_shadow_stack,
+		.set = kvm_sbi_fwft_set_shadow_stack,
+		.get = kvm_sbi_fwft_get_shadow_stack,
+	},
 	{
 		.id = SBI_FWFT_PTE_AD_HW_UPDATING,
 		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pte_ad_hw_updating.enable) /
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
