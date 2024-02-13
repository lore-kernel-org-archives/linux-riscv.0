Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0938EC48BC1
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 03:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQJv/Pk40PUEFKxIYS7uBZhliQipdZbRc3tNVUnV7kE=; b=u3gjiiYmFmILzX
	5P2iGNFM+FCMTdhbDs+SaoFR5EpIxANfPbtoiWhDqeF9B2roTCwwhxVUx/vpwCM8jNrVDIhJBYVzK
	2r1OsrdlS1hVPlf47jsNFQTilFGpgCqQ5EtE53ng3jnFXtnb6cE3pqYw3Sqz/F1XzAZzdmfxwoK3W
	8dG7FeKWlFP7Xhjs46hh1H7kDQvxnotqay0gWdwFxe26uO8Kx4Cw+QbnV9caprKU+v2dk2Q92Wc3C
	3asRwoxOkFX6vC81hDwuItu0nQv0ztGGxHJ6YaaMEXmmvaxh96E9qMRaWJgfQBFBZXTWTPa5hjOFl
	YE9enB1mmi/Dna/y+OfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZjcI-00000007rMo-2JgJ;
	Tue, 13 Feb 2024 03:37:54 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZjcD-00000007rKa-3jUu
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 03:37:51 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6e0eacc5078so789241b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 19:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707795469; x=1708400269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rK79X93EtBW9qJrpk3LrvTi516ybVeRsHV0te+WOVM0=;
        b=YxGJ37mGk5sih+RbFfNwNLGlwCNZSu5ksirCp3yCtBQT+MUknE+3MYiDoZ91Cui/qQ
         we3GixmaqWPKoeZj5PfTl2GtpMSH442mqeiQtW5fcGrpeR6QZPE1axetGewQeSklJ9kT
         qIgPt4BEkZx48jldRHaMWXB3gdbKD96fQyr8Bpm6AqNweYcJL3w51XG5iQ+u5PEGjdrv
         BfzF5rPYCUD1vwpZS4/VUcOLqR++tB/wcem2EkkE2KjLLsZCYy29iAwPpUKxPFd/VlCO
         hQ3IYjzhUI9HuhT0y0jVdSOQtt0YwvISGxgcrm9mStif8K1/Mo1pWtApewrHIbcJqrRu
         Do2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707795469; x=1708400269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rK79X93EtBW9qJrpk3LrvTi516ybVeRsHV0te+WOVM0=;
        b=DkseAge3oVAv9X1L1vaaQScfAiuigbqbAI/jr1S/X2huxTNAGjTKsCyyme3BEfg86F
         ym94ujEjgyqNnCNCUKy+nhNmJjILPmaz00jdmKylMpG6Wx4/SWlqrEdlPP+C5vVpn4mC
         ffgtMUz1daTZIE+vQHBVUm5pLitDoQcEEDuhh02fQR1Vdt2n7WPYYMnSY8LABWgM51y7
         6VNWr1gfo5YHSVzTJjJlrdvD+YQMS6qepT60/0AXVCzGykpYBglj3EFiI4mHn3KKzLuK
         KWHpSHjIxSRBY//4A0o650pKsAJ4qPKzWhmFgczwAdtXQJF4JtUprxycpSUUtto8AbcC
         5STA==
X-Forwarded-Encrypted: i=1; AJvYcCVjeOrB3RyBh0LqctVpRK1A062i0x49i1CwdUZqJ74fEtn09nPtcAWGmWvyOMoh4Y8GbJ5Lw/vO0Mn4ZZTNmXrR29ILnNagcgHYg2CX8PP2
X-Gm-Message-State: AOJu0YzQ0Sptg4IGv2YU+f+GKWWibpLKanN+914IGPnuZ3UD3im+g0cg
	WqAXPZt/wR+ZkRpCw9ojHk95WTXtyeoxpp3QqtYJ2Oyei4bNzMWa2bsm4AFyJJ8=
X-Google-Smtp-Source: AGHT+IE1f48UdkFqKO1xCaun/zy54ImvbzLVNqfi6oeRp+4H1Zh+DSqHGiI3HcT/8D8HMS0DDClSGQ==
X-Received: by 2002:a05:6a00:189c:b0:6e0:31c4:3f09 with SMTP id x28-20020a056a00189c00b006e031c43f09mr9843628pfh.3.1707795469256;
        Mon, 12 Feb 2024 19:37:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU80nXNvG9IvTEkeb+gI3X5g1/YZ1z9f+aFTwEsVZd0YtQwmVXoa/KRvIon26KAt5cNSlHOeF71a2FjUjqRP5PAlJ+nc8CF55EDOUaiOA/PhkgZtMyNbXe6JSVbSCfvp7M3BnJ0NMLC4buORby3LxdT+OtSBYTQh5DYywQasxUalqsHQ7bHg8gdayxPwY7rNeHYSVcWKeeIrg6JNnJHFCh85OAs1TwkJJvw1jzosIxo0AzhuK8B
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id v11-20020a056a00148b00b006e0334e3dd9sm6188633pfu.76.2024.02.12.19.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 19:37:48 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan O'Rear <sorear@fastmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	stable@vger.kernel.org
Subject: [PATCH -fixes v2 3/4] riscv: Add ISA extension parsing for Sm and Ss
Date: Mon, 12 Feb 2024 19:37:34 -0800
Message-ID: <20240213033744.4069020-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213033744.4069020-1-samuel.holland@sifive.com>
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_193749_957336_7BD92BC0 
X-CRM114-Status: GOOD (  18.68  )
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

Previously, all extension version numbers were ignored. However, the
version number is important for these two extensions. The simplest way
to implement this is to use a separate bitmap bit for each supported
version, with each successive version implying all of the previous ones.
This allows alternatives and riscv_has_extension_[un]likely() to work
naturally.

To avoid duplicate extensions in /proc/cpuinfo, the new successor_id
field allows hiding all but the newest implemented version of an
extension.

Cc: <stable@vger.kernel.org> # v6.7+
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 arch/riscv/include/asm/cpufeature.h |  1 +
 arch/riscv/include/asm/hwcap.h      |  8 ++++++
 arch/riscv/kernel/cpu.c             |  5 ++++
 arch/riscv/kernel/cpufeature.c      | 42 +++++++++++++++++++++++++----
 4 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 0bd11862b760..ac71384e7bc4 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -61,6 +61,7 @@ struct riscv_isa_ext_data {
 	const char *property;
 	const unsigned int *subset_ext_ids;
 	const unsigned int subset_ext_size;
+	const unsigned int successor_id;
 };
 
 extern const struct riscv_isa_ext_data riscv_isa_ext[];
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 5340f818746b..5b51aa1db15b 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -80,13 +80,21 @@
 #define RISCV_ISA_EXT_ZFA		71
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
+#define RISCV_ISA_EXT_SM1p11		74
+#define RISCV_ISA_EXT_SM1p12		75
+#define RISCV_ISA_EXT_SS1p11		76
+#define RISCV_ISA_EXT_SS1p12		77
 
 #define RISCV_ISA_EXT_MAX		128
 #define RISCV_ISA_EXT_INVALID		U32_MAX
 
 #ifdef CONFIG_RISCV_M_MODE
+#define RISCV_ISA_EXT_Sx1p11		RISCV_ISA_EXT_SM1p11
+#define RISCV_ISA_EXT_Sx1p12		RISCV_ISA_EXT_SM1p12
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
 #else
+#define RISCV_ISA_EXT_Sx1p11		RISCV_ISA_EXT_SS1p11
+#define RISCV_ISA_EXT_Sx1p12		RISCV_ISA_EXT_SS1p12
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #endif
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index d11d6320fb0d..2e6b90ed0d51 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -215,6 +215,11 @@ static void print_isa(struct seq_file *f, const unsigned long *isa_bitmap)
 		if (!__riscv_isa_extension_available(isa_bitmap, riscv_isa_ext[i].id))
 			continue;
 
+		/* Only show the newest implemented version of an extension */
+		if (riscv_isa_ext[i].successor_id != RISCV_ISA_EXT_INVALID &&
+		    __riscv_isa_extension_available(isa_bitmap, riscv_isa_ext[i].successor_id))
+			continue;
+
 		/* Only multi-letter extensions are split by underscores */
 		if (strnlen(riscv_isa_ext[i].name, 2) != 1)
 			seq_puts(f, "_");
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c5b13f7dd482..8e10b50120e9 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -113,23 +113,29 @@ static bool riscv_isa_extension_check(int id)
 	return true;
 }
 
-#define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size) {	\
+#define _RISCV_ISA_EXT_DATA(_name, _id, _subset_exts, _subset_exts_size, _successor) {	\
 	.name = #_name,								\
 	.property = #_name,							\
 	.id = _id,								\
 	.subset_ext_ids = _subset_exts,						\
-	.subset_ext_size = _subset_exts_size					\
+	.subset_ext_size = _subset_exts_size,					\
+	.successor_id = _successor,						\
 }
 
-#define __RISCV_ISA_EXT_DATA(_name, _id) _RISCV_ISA_EXT_DATA(_name, _id, NULL, 0)
+#define __RISCV_ISA_EXT_DATA(_name, _id) \
+	_RISCV_ISA_EXT_DATA(_name, _id, NULL, 0, RISCV_ISA_EXT_INVALID)
 
 /* Used to declare pure "lasso" extension (Zk for instance) */
 #define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
-	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, ARRAY_SIZE(_bundled_exts))
+	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, \
+			    _bundled_exts, ARRAY_SIZE(_bundled_exts), RISCV_ISA_EXT_INVALID)
 
 /* Used to declare extensions that are a superset of other extensions (Zvbb for instance) */
 #define __RISCV_ISA_EXT_SUPERSET(_name, _id, _sub_exts) \
-	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts))
+	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), RISCV_ISA_EXT_INVALID)
+
+#define __RISCV_ISA_EXT_VERSION(_name, _id, _preds, _preds_size, _successor) \
+	_RISCV_ISA_EXT_DATA(_name, _id, _preds, _preds_size, _successor)
 
 static const unsigned int riscv_zk_bundled_exts[] = {
 	RISCV_ISA_EXT_ZBKB,
@@ -201,6 +207,16 @@ static const unsigned int riscv_zvbb_exts[] = {
 	RISCV_ISA_EXT_ZVKB
 };
 
+static const unsigned int riscv_sm_ext_versions[] = {
+	RISCV_ISA_EXT_SM1p11,
+	RISCV_ISA_EXT_SM1p12,
+};
+
+static const unsigned int riscv_ss_ext_versions[] = {
+	RISCV_ISA_EXT_SS1p11,
+	RISCV_ISA_EXT_SS1p12,
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * chapter 27 of the unprivileged specification.
@@ -299,8 +315,16 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zvksh, RISCV_ISA_EXT_ZVKSH),
 	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
+	__RISCV_ISA_EXT_VERSION(sm1p11, RISCV_ISA_EXT_SM1p11, riscv_sm_ext_versions, 0,
+				RISCV_ISA_EXT_SM1p12),
+	__RISCV_ISA_EXT_VERSION(sm1p12, RISCV_ISA_EXT_SM1p12, riscv_sm_ext_versions, 1,
+				RISCV_ISA_EXT_INVALID),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
+	__RISCV_ISA_EXT_VERSION(ss1p11, RISCV_ISA_EXT_SS1p11, riscv_ss_ext_versions, 0,
+				RISCV_ISA_EXT_SS1p12),
+	__RISCV_ISA_EXT_VERSION(ss1p12, RISCV_ISA_EXT_SS1p12, riscv_ss_ext_versions, 1,
+				RISCV_ISA_EXT_INVALID),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
@@ -414,6 +438,14 @@ static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct risc
 				;
 
 			++ext_end;
+
+			/*
+			 * As a special case for the Sm and Ss extensions, where the version
+			 * number is important, include it in the extension name.
+			 */
+			if (ext_end - ext == 2 && tolower(ext[0]) == 's' &&
+			    (tolower(ext[1]) == 'm' || tolower(ext[1]) == 's'))
+				ext_end = isa;
 			break;
 		default:
 			/*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
