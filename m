Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B1FEE0AC4
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tYTP0Gp7+zlhD6ZTk8JAX9e5LW+ymTKj2znzbZzw1s=; b=brWe31k0G/kBAB
	EdMckPsX3Xvu8sjri5CYPCHuyBM3Qvhy76l6Awl2RDTL6cN10wMy6FH7X1yAYeXq91QRHhyLPpfx+
	62nckLfSrNwFsvDeTfIuR4RXGmK2NaqitvewUGGQl0hjo4/DNGT6GJTA9M9pvO+YqsQHz6+fY9gBx
	JZ9xYujX5K+FssxLv46GXfJUKD1tATABMj/8Ltm79lUKSQ+yFYcEHYukV9KO+MrkFCen1EdhvUHOi
	5n5nRk/lrmYg/Ak2fUWa1yCleBxqaFnmLzR4het3zpAIqQJa5k7tcZVb/fxswkP4dIVIrIbtPz23z
	nB1om26si4MU1+I3wKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofYU-0000000CKXM-3b1F;
	Sat, 07 Feb 2026 10:28:49 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofYS-0000000CKVF-0zIX
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 10:28:45 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c648bc907ebso1877289a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 02:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460123; x=1771064923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDg5moTLZBDcuSKrclVF6M9QumyUxl2nytvSuElrSC0=;
        b=J9GusMF2zcmck/zLnnH7SZ4tDay8LCW0P1YbcgVIA7O2UwldCd3ziFcMgKbHwOGF3e
         w1iLt3gvvinAELCocA7SjNzyiEhqD2IcT2QCAqANQ+MYQExegkrC+t2LhS4W4fLv6Zzh
         W3MH7CPwGSNF5MdQ3cFruD+U8CLnPK7vlt4x1G9iXXJLuhxlCq91Ta0BEbqHwzRmmiNr
         NYGT6gZhrxDekdtgaLByOfNYHQYNsz7ZFzPzeeqSpxczuKfjLDezuR6A7cfXZKh5BhwZ
         +56zNGAPLa9jY2Mo2phw2MqonC9AN2AeDZ6bgxFebQajlxMAo9Oaq2v8N5f28dPeW57Q
         kTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460123; x=1771064923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fDg5moTLZBDcuSKrclVF6M9QumyUxl2nytvSuElrSC0=;
        b=PMlTJVGl57RyNQW6KSPUCdkj1BXSAimOokr9d1bYUJfiF4ISVEbQwK2XWFPvfTnBF6
         F1PLrinkw7v1lhreKswzJMtaHtuU8PHHtEa4EOhXrNn9ztgscvxlG6Llw6mqRV5nrfm2
         oxRsPsGe+NfA061rFcftz5eb0ZGu8hwAfOWc8wc0soUP88wTDGvl0ifCIp4nJ5MBLHI7
         0PCWgwtgOkGyWMNNiivprO67kYCeqKTsbZ3/H8hFNt+m20XfzNnxJ6OzBQ4LHomt8q3H
         PQAGSH/caAeWINpnAdutalVaqFScjJvRc8QaxvAasAoJqE0NX/cIK3g6R7zEcg7FBRiw
         7FTg==
X-Gm-Message-State: AOJu0Yy6IE6sdeANAMe5J3M0l6WKraQ5Vtnf7QqjzSvOseO+IB6AXf2d
	GftbhUJXhtOwEGMFF9JieVcWymWi02cpVeKl9TFfWYlL7sqcYMWzqV5iRw82VFjEvUc=
X-Gm-Gg: AZuq6aKlW0nkZNQ7S15G9VzcPiFnq67anH8I7tEqQvc3ARe+oRLPIdag718HaYmNFt0
	Sek7Mk5qGznQlazWTIydXtvr5SokFT8MUl2O/UBJ0J+JCCRNmUYJos5PQvZW4QMoVhcTF3RFf73
	ZPzsa+Cr8R9c1PwTlAP7waMAhC8cVT3d/qUkiXeJ+qkru6dYjbkgIGNxRFZSuJYKXxrTMkFlVWI
	5m84IFuNNLeEC06YILQallK5hretqh/BmFMAfBDNtRCZG9JWnoq8SzzCUr5j/fvKRSA4P11rPYh
	3jwHDYJ4WpfYrFc5ja8TCCM7pLXmYycJ+OMxt1wg8IO0VZf/L1rcSX/sefQpKMuUV01dh0z4gEO
	IGcnS0dJadm2AYY/XnhXE4LeUODPkS0SNnCRrd5B3K8Nj6OSTNkkbOHBzWyV5glWWHtFZ06EL6I
	24TZk2W57ZGaZ6VOZPJBJCT6UEYmTkm5WrCNUK2s6dcOm88E6Xxbfajg==
X-Received: by 2002:a05:6a21:a98:b0:38f:df47:87a0 with SMTP id adf61e73a8af0-393ad386587mr6157848637.61.1770460123273;
        Sat, 07 Feb 2026 02:28:43 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:42 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 07 Feb 2026 18:28:02 +0800
Subject: [PATCH 8/8] riscv: cpufeature: Add parsing for Sha and its
 comprised extensions
MIME-Version: 1.0
Message-Id: <20260207-isa-ext-parse-export-v1-8-a64d3a8bc20a@riscstar.com>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
In-Reply-To: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_022844_282272_1D22D7EC 
X-CRM114-Status: UNSURE (   9.89  )
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

Sha is a profile-defined extension introduced in RVA23 Profiles
Version 1.0 that captures the full set of features mandated to be
supported along with the H extension. The augmented hypervisor
extension was optional in RVA22 and mandatory in RVA23.

Sha comprises: H, Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala,
Shvstvecd, and Ssstateen.

Add Sha as a superset extension so that when "sha" is encountered in
the ISA string, its sub-extensions are automatically enabled. Also add
individual parsing for each of the comprised extensions.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/include/asm/hwcap.h |  8 ++++++++
 arch/riscv/kernel/cpufeature.c | 24 ++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 75f64f5b7355db6ea5218f544ceda3be9619a58a..8cc1d47b1068637fabb94a3f8defb1d6fe3bc180 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -123,6 +123,14 @@
 #define RISCV_ISA_EXT_SSTVALA		113
 #define RISCV_ISA_EXT_SSTVECD		114
 #define RISCV_ISA_EXT_SSU64XL		115
+#define RISCV_ISA_EXT_SHA		116
+#define RISCV_ISA_EXT_SHCOUNTERENW	117
+#define RISCV_ISA_EXT_SHGATPA		118
+#define RISCV_ISA_EXT_SHTVALA		119
+#define RISCV_ISA_EXT_SHVSATPA		120
+#define RISCV_ISA_EXT_SHVSTVALA		121
+#define RISCV_ISA_EXT_SHVSTVECD		122
+#define RISCV_ISA_EXT_SSSTATEEN		123
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index fff35a3e85db70f5610df2667f2b4f45f091cb2b..13fa5dd555c4cb40831f75c3a0e0c4c5b518864b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -498,6 +498,22 @@ static const unsigned int riscv_supm_exts[] = {
 	RISCV_ISA_EXT_SUPM
 };
 
+/*
+ * The Sha extension captures the full set of features mandated along with the
+ * H extension. Sha comprises: H, Shcounterenw, Shgatpa, Shtvala, Shvsatpa,
+ * Shvstvala, Shvstvecd, and Ssstateen.
+ */
+static const unsigned int riscv_sha_exts[] = {
+	RISCV_ISA_EXT_h,
+	RISCV_ISA_EXT_SHCOUNTERENW,
+	RISCV_ISA_EXT_SHGATPA,
+	RISCV_ISA_EXT_SHTVALA,
+	RISCV_ISA_EXT_SHVSATPA,
+	RISCV_ISA_EXT_SHVSTVALA,
+	RISCV_ISA_EXT_SHVSTVECD,
+	RISCV_ISA_EXT_SSSTATEEN,
+};
+
 /*
  * The B extension comprises Zba, Zbb, and Zbs.
  */
@@ -638,6 +654,13 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvksh, RISCV_ISA_EXT_ZVKSH, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvksg, riscv_zvksg_bundled_exts, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zvkt, RISCV_ISA_EXT_ZVKT, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_SUPERSET(sha, RISCV_ISA_EXT_SHA, riscv_sha_exts),
+	__RISCV_ISA_EXT_DATA(shcounterenw, RISCV_ISA_EXT_SHCOUNTERENW),
+	__RISCV_ISA_EXT_DATA(shgatpa, RISCV_ISA_EXT_SHGATPA),
+	__RISCV_ISA_EXT_DATA(shtvala, RISCV_ISA_EXT_SHTVALA),
+	__RISCV_ISA_EXT_DATA(shvsatpa, RISCV_ISA_EXT_SHVSATPA),
+	__RISCV_ISA_EXT_DATA(shvstvala, RISCV_ISA_EXT_SHVSTVALA),
+	__RISCV_ISA_EXT_DATA(shvstvecd, RISCV_ISA_EXT_SHVSTVECD),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_supm_exts),
@@ -647,6 +670,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sscounterenw, RISCV_ISA_EXT_SSCOUNTERENW),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_supm_exts),
+	__RISCV_ISA_EXT_DATA(ssstateen, RISCV_ISA_EXT_SSSTATEEN),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(sstvala, RISCV_ISA_EXT_SSTVALA),
 	__RISCV_ISA_EXT_DATA(sstvecd, RISCV_ISA_EXT_SSTVECD),

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
