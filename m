Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572D2C4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 17:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jizob5clkrtyuJ90C7X6nAqjHYp+95706VF78Svh+3A=; b=EhkatttacWuyKj
	hRRazwqreI2Vmlin/vcXL1mDgUsYU0CHB1LIt0j4rVpwIsB5OsuALXdHbA1sRA3Cz6CyouDqLT2rf
	rwhVPvTT6gAwCI5gnFn4kn0EXJ3YI9f0/kl4D0ySp8sO/fBIfej2id4785RbZf6MR41HoVm+Zm3AR
	kMuzUq9ItoCAGxNgnM3ihOs4WxJuQl7RoVZ/UeEPJjftryCwRIGnIRTsvSj5EIEFjtHrbt3lsQIk/
	NkMlxwo6NgY+ybM3CEi6kCA9I4Ui31lGhxTZ2nnSaekwUeVCbsx9mReLHJLQsu3WnjAP91g+mX2OF
	HHDy0nWwyGt9OvZ8KkOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSkM-00FY6o-2f;
	Wed, 13 Dec 2023 17:10:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSkF-00FXyo-2c
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 17:10:06 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c580ba223so16110715e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 09:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702487399; x=1703092199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3wF4eqK4ImhmFBJfbCeNiXF9W/tavYgP8z6Chx48Zk=;
        b=TiG+6karIDSpw6QcoQUlBcAltKtNqb9L5sv5l3vd658ObWLFx7w7/vxZOFXQUJslDj
         QBl7fOmEVYJ+Be49IQwPNluwOA0oyv7Cby+RDjINtj0CI1DB8WBAxgyQG/aT6EOtH94K
         nI4ISG81APrKo+4+IoCTRFXnKjlQ+LIsCWrBT1h3yaq2Z5gF8lAQwmm0LnDcZCAvsYHA
         IK/GGC7gZCUPgwt5SRg9RzJpVeLjM3fgxyy3AsGW1vG1n8j9WeAflM+2KH/kTniKhUC7
         k1qU5EV741fTB+j0AnBcEORD49DtSy9JS4eKFOZadeBqoWdTO2z3YIPrlZW5BE2BGzQs
         igtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702487399; x=1703092199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3wF4eqK4ImhmFBJfbCeNiXF9W/tavYgP8z6Chx48Zk=;
        b=TWjW+5ZlMHV2OTdyxI6/nwFXsn2Iw4MH+j4xVVfEPyg4D+B7icquXs04DlOmAjzPRf
         RQ0t2cONhN4D5OdAuUG9q2Mk9rZuETjgKNiUz+aeBi2JVNfyvaxK1zzKYc79EAORBVjY
         9HtSLdPLZXPut+iBHhZDJbQ9Ylauk4CsNZhnLAINOuHZ9zwU0Wu4eVhyOiX7wBpiIOQB
         zyKfpE+/4VTXegOlWDOXXnH8wF4hs5v1kzfoLPRqJMTqkEjv+FS//b5QPWJZspChBNs6
         VZVGKx0vBK4aUxIj8CVQdD+keCkO+7nmwKAGQ/mqB974ynfkPJ1os87MngHwS1GZwtn9
         V/kw==
X-Gm-Message-State: AOJu0YxMfBGE+61EudDWuTBG0m6e/A6fCyTqaYA4TbugiU3QqDB38Ms1
	PIJfdqgqzhKbXDvEEEZqwO9sKA==
X-Google-Smtp-Source: AGHT+IFHKRNI1CgR2tD7PnLGhLwXTkygwuHFxDOyseYtCLWNSyTmi1aUaMDZFw+KYAbl4+vwnZ/SHw==
X-Received: by 2002:a05:600c:22d4:b0:40c:3143:9881 with SMTP id 20-20020a05600c22d400b0040c31439881mr5203603wmg.20.1702487399310;
        Wed, 13 Dec 2023 09:09:59 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c35d400b0040b538047b4sm23569417wmq.3.2023.12.13.09.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 09:09:58 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	haibo1.xu@intel.com
Subject: [PATCH v2 5/6] KVM: riscv: selftests: Use register subtypes
Date: Wed, 13 Dec 2023 18:09:57 +0100
Message-ID: <20231213170951.93453-13-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213170951.93453-8-ajones@ventanamicro.com>
References: <20231213170951.93453-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_091003_859348_0C0D7AB3 
X-CRM114-Status: GOOD (  12.83  )
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

Always use register subtypes in the get-reg-list test when registers
have them. The only registers neglecting to do so were ISA extension
registers. While we don't really need to use KVM_REG_RISCV_ISA_SINGLE
(since it's zero), the main purpose is to avoid confusion and to
self-document the tests. Also add print support for the multi
registers like SBI extensions have, even though they're only used for
debugging.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Haibo Xu <haibo1.xu@intel.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 113 +++++++++++-------
 1 file changed, 73 insertions(+), 40 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 27d07a32a1ef..4bcc597d34b9 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -28,31 +28,31 @@ bool filter_reg(__u64 reg)
 	 *
 	 * Note: The below list is alphabetically sorted.
 	 */
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_A:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_C:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_D:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_F:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_H:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_I:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_M:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_V:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SMSTATEEN:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSTC:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVINVAL:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVNAPOT:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVPBMT:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBA:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOM:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOZ:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICNTR:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICOND:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICSR:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
-	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_A:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_C:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_D:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_F:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_H:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_I:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_M:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_V:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMSTATEEN:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBB:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBS:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICNTR:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICOND:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICSR:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIFENCEI:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZIHPM:
 		return true;
 	/* AIA registers are always available when Ssaia can't be disabled */
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect):
@@ -335,15 +335,10 @@ static const char *fp_d_id_to_str(const char *prefix, __u64 id)
 }
 
 #define KVM_ISA_EXT_ARR(ext)		\
-[KVM_RISCV_ISA_EXT_##ext] = "KVM_RISCV_ISA_EXT_" #ext
+[KVM_RISCV_ISA_EXT_##ext] = "KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_" #ext
 
-static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
+static const char *isa_ext_single_id_to_str(__u64 reg_off)
 {
-	/* reg_off is the offset into unsigned long kvm_isa_ext_arr[] */
-	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_ISA_EXT);
-
-	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT);
-
 	static const char * const kvm_isa_ext_reg_name[] = {
 		KVM_ISA_EXT_ARR(A),
 		KVM_ISA_EXT_ARR(C),
@@ -373,11 +368,48 @@ static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
 	};
 
 	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name))
-		return strdup_printf("%lld /* UNKNOWN */", reg_off);
+		return strdup_printf("KVM_REG_RISCV_ISA_SINGLE | %lld /* UNKNOWN */", reg_off);
 
 	return kvm_isa_ext_reg_name[reg_off];
 }
 
+static const char *isa_ext_multi_id_to_str(__u64 reg_subtype, __u64 reg_off)
+{
+	const char *unknown = "";
+
+	if (reg_off > KVM_REG_RISCV_ISA_MULTI_REG_LAST)
+		unknown = " /* UNKNOWN */";
+
+	switch (reg_subtype) {
+	case KVM_REG_RISCV_ISA_MULTI_EN:
+		return strdup_printf("KVM_REG_RISCV_ISA_MULTI_EN | %lld%s", reg_off, unknown);
+	case KVM_REG_RISCV_ISA_MULTI_DIS:
+		return strdup_printf("KVM_REG_RISCV_ISA_MULTI_DIS | %lld%s", reg_off, unknown);
+	}
+
+	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
+}
+
+static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
+{
+	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_ISA_EXT);
+	__u64 reg_subtype = reg_off & KVM_REG_RISCV_SUBTYPE_MASK;
+
+	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT);
+
+	reg_off &= ~KVM_REG_RISCV_SUBTYPE_MASK;
+
+	switch (reg_subtype) {
+	case KVM_REG_RISCV_ISA_SINGLE:
+		return isa_ext_single_id_to_str(reg_off);
+	case KVM_REG_RISCV_ISA_MULTI_EN:
+	case KVM_REG_RISCV_ISA_MULTI_DIS:
+		return isa_ext_multi_id_to_str(reg_subtype, reg_off);
+	}
+
+	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
+}
+
 #define KVM_SBI_EXT_ARR(ext)		\
 [ext] = "KVM_REG_RISCV_SBI_SINGLE | " #ext
 
@@ -583,12 +615,12 @@ static __u64 base_skips_set[] = {
 
 static __u64 zicbom_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOM,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
 };
 
 static __u64 zicboz_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicboz_block_size),
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOZ,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ,
 };
 
 static __u64 aia_regs[] = {
@@ -599,12 +631,12 @@ static __u64 aia_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siph),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1h),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2h),
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA,
 };
 
 static __u64 smstateen_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_SMSTATEEN | KVM_REG_RISCV_CSR_SMSTATEEN_REG(sstateen0),
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SMSTATEEN,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMSTATEEN,
 };
 
 static __u64 fp_f_regs[] = {
@@ -641,7 +673,7 @@ static __u64 fp_f_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F | KVM_REG_RISCV_FP_F_REG(f[30]),
 	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F | KVM_REG_RISCV_FP_F_REG(f[31]),
 	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F | KVM_REG_RISCV_FP_F_REG(fcsr),
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_F,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_F,
 };
 
 static __u64 fp_d_regs[] = {
@@ -678,7 +710,7 @@ static __u64 fp_d_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_FP_D | KVM_REG_RISCV_FP_D_REG(f[30]),
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_FP_D | KVM_REG_RISCV_FP_D_REG(f[31]),
 	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_D | KVM_REG_RISCV_FP_D_REG(fcsr),
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_D,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_D,
 };
 
 #define SUBLIST_BASE \
@@ -702,7 +734,8 @@ static __u64 fp_d_regs[] = {
 #define KVM_ISA_EXT_SIMPLE_CONFIG(ext, extu)			\
 static __u64 regs_##ext[] = {					\
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG |			\
-	KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_##extu,	\
+	KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |	\
+	KVM_RISCV_ISA_EXT_##extu,				\
 };								\
 static struct vcpu_reg_list config_##ext = {			\
 	.sublists = {						\
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
