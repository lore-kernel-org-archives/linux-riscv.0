Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF3DE7719D
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 01:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCmrGOoEzx/Upxrp4gY/MU54Lc7muWyYlaD2aIFsLgA=; b=CVgvVPdImHY9Hb
	QNmgSWgofFADV7FFZp6Ma4q2TxjIaE6BVIa3iWEi7MNAQL8sr21z/p28Z2l/C6qhPCty/lIcDmwah
	s+jKvIH2y0Owe5WQ9RYm9CsvcMAbquyfg/ga8mcIKC37ZAaONiiQusyiRa71fY4HSyycaZ9MBpeMo
	Nu/d2pqkwdhxuCZEavI7rKQIDNrfZZy4pRXUrMUrCxgZPl39V/d+9T5HfMfE7h47qOyzbmyRnJQV9
	e2+NqK+38aVjPf3GiM7EMIhNBSdE1qGaptzETB84L1UNz0pz91+BoxTS4Q4O90/pRMyD1vmHip4Ai
	wNlAWfvMrMIsg8Psh9sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQg8-0000000HX53-1hM2;
	Sat, 11 Jan 2025 01:52:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPeh-0000000HPv3-3d8e
	for linux-riscv@bombadil.infradead.org;
	Sat, 11 Jan 2025 00:47:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mG/7mpvt2lUZ0JpSGT/sSZlaG6n67EyEdFyeasyHfcQ=; b=dhUYzGpJLw/2hQhOoqisF1zGML
	lSPmiTBVPiSj+M/NYVtHRVpkgQ55xNO+iU4DYdJMFfi8eR7P1AyAac+SgTUuVF67rSalcAx1At2Hj
	MvyxYdmwQxII/hvw6jFwaZlWDNSMeLz1A99/F7qxPM/FL1NJt0UhJIcs0u5BMwrNVLKdC08ar+LWe
	COcVERtCgK3X5PgNFiu/y55vEU3lRa5EIy+rNQQ+iFXB5eMbqhSDPHTK5JGHDZvaHfwWvNQmq7V0O
	iJeW8fsB11KAGCPobFLjqYix6Utq0y8RBxbLxHIOZc2hV+yXtHahgbB0tnLt3DWjjwK8guwwVFPqi
	HmLQrf0w==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPee-00000009y9N-0zBv
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 00:47:10 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2162c0f6a39so65582295ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 16:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736556425; x=1737161225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mG/7mpvt2lUZ0JpSGT/sSZlaG6n67EyEdFyeasyHfcQ=;
        b=h3hUsaI+BkMcTXKUK0maHm1d8OigIeZwQy01k144MpwSWZpzMfY3+miCge44R2udjm
         bhO/a2JU8+bghAs9xet4UYY3sPxlsV2w107wKIWIT5jjtT+NIQO0csrccf7zx2/x0jx0
         GegB563gsZnwNA30gjtaPnPf+EcdVGO2mQx4D96wZAkIbe+LVjIGMLqoyCIPddrJYFoq
         eljo5YnWXpJzOgWternGL82pENoS+2tD7opGNkeAyea5wcKk94OefftLbdmdENiNFsUf
         5kLpwYvoodyMRFC5L95LV9RFtPpffkCZObTbpxLEIB1podRF2magmukbpthJkdQ22QYx
         REqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556425; x=1737161225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mG/7mpvt2lUZ0JpSGT/sSZlaG6n67EyEdFyeasyHfcQ=;
        b=eEPbkPT+LJY1HTPXdUQENVqA68B8lCA8FmHOzZrXo+Mce+imm/7Cl/1dLMB9pk17cE
         127Teb2WDcCCKNSnq8xgVMGR89pJsq+Xe1abu3vcsfQvuwnX5AqigPghkY3lMRi0Gx9c
         oDXMXFEhZ2n3gixZB0Mixy/ZG0jh4ZcN0djzw9NcbK07f0KIuaOsU2K2PErD6s3ge5yc
         VzPIzX2hLW4dbMi/kgwi3IeMXECoz08X+he9aXxI7Wth6yF6LZPe1xksDxGYrT4F/qP6
         4+qk76T4UdzrOfQm3NO5zI1ldrB4PCuCILDAaLVVpL0EF1+nTRr0ZvB9izR6VU8XY7tX
         pLlw==
X-Forwarded-Encrypted: i=1; AJvYcCXRofnGW7GIG+JHX78h6G0RbcZvyJyF4NluPTWazvICNDKhCjiFKaFu4rQU2yhrEZRfQlsikovPeGRXog==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPl1LSHuKzedBMGhjfR8HibF8To9ROMroROGXHOdq6K/3prZSM
	qR7Z8C37JASZkC1ZRUIdrD2J+dwRPUH8npQTenhS8Jctrm8V9ZBoLgOriAPptn8=
X-Gm-Gg: ASbGnct5lJ6E9r2RNClPQT8QertWmoHFuoQ9B1ae/3YLnApTZam9OKv82gmCal6nL21
	a8hm69Z5mWjJvsyZYkQHFEDJJeQHIWClV+YnK/+u/eYtlXV2216QAVzwPhf8l3ZX8OMn+k7Lvys
	SxQj5iDhdVxv7tLJg7fc+TqktwHfX/cENmX12KjNI2kCM9q/eaXr4ZxDoVX0Yq6pTD52a+tSTXw
	zsdWkE2q7E3qqNH0+leV7B0AWmBw6fYyytIEJ+HWXlJfpoUFgxyKwB1W5jyOq53wqCwnmCU82Mw
	2sQ=
X-Google-Smtp-Source: AGHT+IESLBI5YsUnw0OyUQC27t17HSuv96bLkPw7hOOSo/oEqHzGTMFX68XVgxfF9DQh8PbXSB/mhQ==
X-Received: by 2002:a17:90a:c106:b0:2ee:7e53:bfae with SMTP id 98e67ed59e1d1-2f55836e87amr12065549a91.10.1736556425468;
        Fri, 10 Jan 2025 16:47:05 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a28723esm6064295a91.19.2025.01.10.16.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 16:47:05 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] RISC-V: KVM: Fix inclusion of Smnpm in the guest ISA bitmap
Date: Fri, 10 Jan 2025 16:46:58 -0800
Message-ID: <20250111004702.2813013-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250111004702.2813013-1-samuel.holland@sifive.com>
References: <20250111004702.2813013-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_004708_834282_3844BD82 
X-CRM114-Status: GOOD (  19.77  )
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

The Smnpm extension requires special handling because the guest ISA
extension maps to a different extension (Ssnpm) on the host side.
commit 1851e7836212 ("RISC-V: KVM: Allow Smnpm and Ssnpm extensions for
guests") missed that the vcpu->arch.isa bit is based only on the host
extension, so currently both KVM_RISCV_ISA_EXT_{SMNPM,SSNPM} map to
vcpu->arch.isa[RISCV_ISA_EXT_SSNPM]. This does not cause any problems
for the guest, because both extensions are force-enabled anyway when the
host supports Ssnpm, but prevents checking for (guest) Smnpm in the SBI
FWFT logic.

Redefine kvm_isa_ext_arr to look up the guest extension, since only the
guest -> host mapping is unambiguous. Factor out the logic for checking
for host support of an extension, so this special case only needs to be
handled in one place, and be explicit about which variables hold a host
vs a guest ISA extension.

Fixes: 1851e7836212 ("RISC-V: KVM: Allow Smnpm and Ssnpm extensions for guests")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kvm/vcpu_onereg.c | 83 +++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 30 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 753f66c8b70a..93115abca3b8 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -23,7 +23,7 @@
 #define KVM_ISA_EXT_ARR(ext)		\
 [KVM_RISCV_ISA_EXT_##ext] = RISCV_ISA_EXT_##ext
 
-/* Mapping between KVM ISA Extension ID & Host ISA extension ID */
+/* Mapping between KVM ISA Extension ID & guest ISA extension ID */
 static const unsigned long kvm_isa_ext_arr[] = {
 	/* Single letter extensions (alphabetically sorted) */
 	[KVM_RISCV_ISA_EXT_A] = RISCV_ISA_EXT_a,
@@ -35,7 +35,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
 	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
 	/* Multi letter extensions (alphabetically sorted) */
-	[KVM_RISCV_ISA_EXT_SMNPM] = RISCV_ISA_EXT_SSNPM,
+	KVM_ISA_EXT_ARR(SMNPM),
 	KVM_ISA_EXT_ARR(SMSTATEEN),
 	KVM_ISA_EXT_ARR(SSAIA),
 	KVM_ISA_EXT_ARR(SSCOFPMF),
@@ -107,6 +107,36 @@ static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
 	return KVM_RISCV_ISA_EXT_MAX;
 }
 
+static int kvm_riscv_vcpu_isa_check_host(unsigned long kvm_ext, unsigned long *guest_ext)
+{
+	unsigned long host_ext;
+
+	if (kvm_ext >= KVM_RISCV_ISA_EXT_MAX ||
+	    kvm_ext >= ARRAY_SIZE(kvm_isa_ext_arr))
+		return -ENOENT;
+
+	*guest_ext = kvm_isa_ext_arr[kvm_ext];
+	switch (*guest_ext) {
+	case RISCV_ISA_EXT_SMNPM:
+		/*
+		 * Pointer masking effective in (H)S-mode is provided by the
+		 * Smnpm extension, so that extension is reported to the guest,
+		 * even though the CSR bits for configuring VS-mode pointer
+		 * masking on the host side are part of the Ssnpm extension.
+		 */
+		host_ext = RISCV_ISA_EXT_SSNPM;
+		break;
+	default:
+		host_ext = *guest_ext;
+		break;
+	}
+
+	if (!__riscv_isa_extension_available(NULL, host_ext))
+		return -ENOENT;
+
+	return 0;
+}
+
 static bool kvm_riscv_vcpu_isa_enable_allowed(unsigned long ext)
 {
 	switch (ext) {
@@ -209,13 +239,13 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 
 void kvm_riscv_vcpu_setup_isa(struct kvm_vcpu *vcpu)
 {
-	unsigned long host_isa, i;
+	unsigned long guest_ext, i;
 
 	for (i = 0; i < ARRAY_SIZE(kvm_isa_ext_arr); i++) {
-		host_isa = kvm_isa_ext_arr[i];
-		if (__riscv_isa_extension_available(NULL, host_isa) &&
-		    kvm_riscv_vcpu_isa_enable_allowed(i))
-			set_bit(host_isa, vcpu->arch.isa);
+		if (kvm_riscv_vcpu_isa_check_host(i, &guest_ext))
+			continue;
+		if (kvm_riscv_vcpu_isa_enable_allowed(i))
+			set_bit(guest_ext, vcpu->arch.isa);
 	}
 }
 
@@ -597,18 +627,15 @@ static int riscv_vcpu_get_isa_ext_single(struct kvm_vcpu *vcpu,
 					 unsigned long reg_num,
 					 unsigned long *reg_val)
 {
-	unsigned long host_isa_ext;
-
-	if (reg_num >= KVM_RISCV_ISA_EXT_MAX ||
-	    reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
-		return -ENOENT;
+	unsigned long guest_ext;
+	int ret;
 
-	host_isa_ext = kvm_isa_ext_arr[reg_num];
-	if (!__riscv_isa_extension_available(NULL, host_isa_ext))
-		return -ENOENT;
+	ret = kvm_riscv_vcpu_isa_check_host(reg_num, &guest_ext);
+	if (ret)
+		return ret;
 
 	*reg_val = 0;
-	if (__riscv_isa_extension_available(vcpu->arch.isa, host_isa_ext))
+	if (__riscv_isa_extension_available(vcpu->arch.isa, guest_ext))
 		*reg_val = 1; /* Mark the given extension as available */
 
 	return 0;
@@ -618,17 +645,14 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
 					 unsigned long reg_num,
 					 unsigned long reg_val)
 {
-	unsigned long host_isa_ext;
-
-	if (reg_num >= KVM_RISCV_ISA_EXT_MAX ||
-	    reg_num >= ARRAY_SIZE(kvm_isa_ext_arr))
-		return -ENOENT;
+	unsigned long guest_ext;
+	int ret;
 
-	host_isa_ext = kvm_isa_ext_arr[reg_num];
-	if (!__riscv_isa_extension_available(NULL, host_isa_ext))
-		return -ENOENT;
+	ret = kvm_riscv_vcpu_isa_check_host(reg_num, &guest_ext);
+	if (ret)
+		return ret;
 
-	if (reg_val == test_bit(host_isa_ext, vcpu->arch.isa))
+	if (reg_val == test_bit(guest_ext, vcpu->arch.isa))
 		return 0;
 
 	if (!vcpu->arch.ran_atleast_once) {
@@ -638,10 +662,10 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
 		 */
 		if (reg_val == 1 &&
 		    kvm_riscv_vcpu_isa_enable_allowed(reg_num))
-			set_bit(host_isa_ext, vcpu->arch.isa);
+			set_bit(guest_ext, vcpu->arch.isa);
 		else if (!reg_val &&
 			 kvm_riscv_vcpu_isa_disable_allowed(reg_num))
-			clear_bit(host_isa_ext, vcpu->arch.isa);
+			clear_bit(guest_ext, vcpu->arch.isa);
 		else
 			return -EINVAL;
 		kvm_riscv_vcpu_fp_reset(vcpu);
@@ -999,16 +1023,15 @@ static int copy_fp_d_reg_indices(const struct kvm_vcpu *vcpu,
 static int copy_isa_ext_reg_indices(const struct kvm_vcpu *vcpu,
 				u64 __user *uindices)
 {
+	unsigned long guest_ext;
 	unsigned int n = 0;
-	unsigned long isa_ext;
 
 	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++) {
 		u64 size = IS_ENABLED(CONFIG_32BIT) ?
 			   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
 		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_ISA_EXT | i;
 
-		isa_ext = kvm_isa_ext_arr[i];
-		if (!__riscv_isa_extension_available(NULL, isa_ext))
+		if (kvm_riscv_vcpu_isa_check_host(i, &guest_ext))
 			continue;
 
 		if (uindices) {
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
