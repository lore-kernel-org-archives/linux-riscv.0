Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F87CD98C7
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/E+nXROFkVpmo8bbxr+X80p9BepVw/kE4tZciIzGk8=; b=4qziPkkIX8Wkci
	JIiKur+nEP31xQMyUnFH8LjMBypEkY5kEfvPtwyy0sxhuUOsHLM/o0T3FcIH67SZa3aaUPEpFulQp
	uuRmk82p/1KZaQsuOye5MFpWq2eHwL1rDQHCq5EJIkJppN884lUWxfGHe63Pyl/ntd/8WnX/NiyLp
	9Y7GETO0F9VGGul6+X6eDdVZ3yBFFN/f03y9PlvwizGLt3T0NXLdMqbX7oWXYkds0cARXjlzP42YF
	gKrYTuVcfDs1fyktp8XK+pn6OVfnnsiTLLqQe3tUl456UbMUDRxnlmxVwzyZ2ZuJIzWVCBBZQMTq+
	hI6VZxPJvxerf3Eui87Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlnE-0000000A1Fw-1cHZ;
	Thu, 11 Jun 2026 20:14:24 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlnB-0000000A1Dg-0WDa
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:14:23 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c0c3546924so1972965ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208860; x=1781813660; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMGfGczB0NxDEd0np6M2cDGmk32GLLRpI8e709o6daA=;
        b=JxKYM9EZWtsyx6rOjeHC3UGSt380x/e8GMjubnot7Mpne+uAo2fJnsRb2OEM+pcTUv
         bH4fjvavMaqMtdvbXZgvbplKSuv1I6tgbyoHCLTvyaA5LRbgkbHWXz4dJhJt+8lJ0NeQ
         qZQwLpLIYIHhfMkridkyJfSF717WdZCGd97cttzvKOu6/SV2w96A26xhwwTWzg/55GiG
         t1Jf9xubhTIfAOFDVO+RssMHZdURMepW55ysZ14lqRUCRfWE/zrdmMX579UCTQW2ZErb
         1pwhzgS4A8YfGXjqYFI8Mozh6UC5uOEGCd6uNR+s3zxgpLdz1O91/lpjJpUXPqH8ZMVo
         jvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208860; x=1781813660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yMGfGczB0NxDEd0np6M2cDGmk32GLLRpI8e709o6daA=;
        b=Fz7zSkA5HiBKTsTL9mMwAJPLwX/ny+YhaPRbyEder5REMZmrxQNuK3fXuMbDAeXI2U
         5KBbm5GWFEvEnVLDwX1kbRcddhomwZmZKss8Z5bTtY6bu5zCHA85grXEgMZX9mMrPMAa
         8rVCosVAMCqeace0eqLQyziB0544PqKN6S5fVygGpK5rZHqstOlYy47Isp7KDQtb+8a6
         i4vyY+c8e/1SnNgfPThz9xIDENxhFTWcFCVjNCW3sOFzubUS3xaWjggPWvwL0Buy9jPo
         CTK2l7qNdeUP/mYDFIIAiJua3rLp/sjl7w2ObG/imlQKDAjEeTfUouh+bH3VzK96KbKD
         3uKw==
X-Forwarded-Encrypted: i=1; AFNElJ+rjDpAhGkuCncHmyfW9yUNFy6O/1NGidcaf6MuRwJf7X7EjYZT71JdyU/t6aV2vnUrmsB0kjBThLIqWA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7057BT9S+MTeuJNLuue21wRpVlpJh4blxXpDMSVKdhTmQZy9w
	cOLnZuhiglc3CzRhbn+DZdZlQS/fGx/UPD7PVryXcl5JulRGZ2SbQMMU
X-Gm-Gg: Acq92OEm9qNSQZxldoQnZoxWN7fG9QoA0RowAePKD/RmKwvHzUIGJRjeQ8vgKlIgTc5
	yi0WwxjJnLpDNBnxbpm3rhqk4pScxIsingib4Up8glwFBH9zYJKxtsIWqrHZDKuKVizABLr4rWF
	ttNKd1Mj4xZNn71EJYxL6qAF0Eph5vzr4Jp3saCYWmC+AZSg5PW1DQr9b9LCs/Gnr4vRpxAzOOi
	OQSXLSx6gW8VyTu2x8D7Z/Iz08hAqVrJrAomrC0fkbgEZ0c5gx8vPSlfinD0A3EgQTfcjXP//e5
	V14IKP2gRble3pYJsfN4b1i70wKKLkyU9whzKkeXVauKICCelnIoqm3cFfqQfa6Zi7sP2yeikJH
	SLv/lRowkz6pQCW442EeJWOFOtznA5k3LGydIORbxWqLhu86IPByVCQjy2Ilxj/PSDMK5XxWSdA
	==
X-Received: by 2002:a17:903:1a06:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c2f21a0ademr49861065ad.20.1781208860004;
        Thu, 11 Jun 2026 13:14:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:14:19 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:46 -0400
Subject: [PATCH v4 09/16] riscv: Add Zic64b to cpufeature and hwprobe
MIME-Version: 1.0
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-9-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>, Qingwei Hu <qingwei.hu@bytedance.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5498; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=nGcs7EOITyjoy7uSccUTn+y3G2TeXfDwFJQsTGZZRmY=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsUPmOxf9nXjyoMnC1vs5VV/yvwq8uZhwmOPzB2/lR
 w8uh2z51lHKwiDGxSArpshy+GhL9tZXPtG+zzl/wMxhZQIZwsDFKQATuRHDyNC+8ZLz+e1PLxQG
 PeDeacx92vPirw9eCru37O0+63JQWJyD4Q+Xmn6uoIng/eC0tWdzPFyk35ySKTl26hUbx4kFh7P
 8jPgA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_131421_166711_94CED419 
X-CRM114-Status: GOOD (  17.14  )
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

From: Qingwei Hu <qingwei.hu@bytedance.com>

Zic64b mandates 64-byte naturally aligned cache blocks and is a
mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
validate callback that requires each cbom/cbop/cboz cache block size to
be 64 bytes when it is present, and export it through hwprobe.

Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
Co-developed-by: Guodong Xu <docular.xu@gmail.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4:
- Credit Qingwei Hu's earlier Zic64b cpufeature patch: set him as
  author, with Co-developed-by (Guodong Xu).
- Validate only the cbom/cbop/cboz block sizes that are present; Zic64b
  does not imply the CMO extensions (Conor, Qingwei, Greg).
- Add a Link: to Greg's confirmation on the tech-unprivileged list.
- Add the missing blank line before the ZIC64B hwprobe.rst entry
  (Andrew).
- Did not carry Andrew Jones's v3 Reviewed-by: the validation was
  rewritten (present block sizes only) and the patch is now authored by
  Qingwei, so it warrants a fresh review.
v3: New patch.
---
 Documentation/arch/riscv/hwprobe.rst  |  4 ++++
 arch/riscv/include/asm/hwcap.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 arch/riscv/kernel/cpufeature.c        | 19 +++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 5 files changed, 26 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index fc68dea397aae..32a14331eb9de 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -425,3 +425,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
     in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
     presence of the Zba, Zbb, and Zbs sub-extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 58523b3a1998a..36572c1ff438a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -117,6 +117,7 @@
 #define RISCV_ISA_EXT_ZICCAMOA		107
 #define RISCV_ISA_EXT_ZICCIF		108
 #define RISCV_ISA_EXT_ZA64RS		109
+#define RISCV_ISA_EXT_ZIC64B		110
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 430dc49a82863..36ec8ab470423 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -122,6 +122,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCRSE	(1ULL << 4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	(1ULL << 5)
 #define		RISCV_HWPROBE_EXT_B		(1ULL << 6)
+#define		RISCV_HWPROBE_EXT_ZIC64B	(1ULL << 7)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index e0197160af6dd..29dff41313e65 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -154,6 +154,24 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	/*
+	 * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check the
+	 * cbom/cbop/cboz block-size (when declared) device-tree properties to
+	 * avoid inconsistency.
+	 */
+	if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
+	    (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
+	    (riscv_cboz_block_size && riscv_cboz_block_size != 64)) {
+		pr_err("Zic64b detected in ISA string, disabling as a CBO block size is not 64 bytes\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
 {
@@ -524,6 +542,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index dcc102bf8f183..3e80e5551ae0d 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -211,6 +211,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 		EXT_KEY(isainfo->isa, B, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIC64B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
