Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE28EE644E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 05:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDwHR26Vp3Qj0oIbbERNnQrQ9hF+kq5Wrx6oTXmyRJw=; b=AYgRAyGBLA03ff
	YHkLUa2MzCdmOuydEzhBXihZBGBJ9Mc4NThfzezB5RxbBHylP5oaawoxOhK+68yfcA89e/kx4V1gW
	IUA+TNPwabLyTCuhHj/BeWMVKhn2tIrh59OIq7OAN56elnAnk/uaAPbNGGrp4aWYRVFL3P5g7iQA8
	kQRTHsBu8LKqBVOxSBb2eAmtrDcuwUKvi1vq4c8r4Z5CRz5o4iSdI/Cf7fS08V5LxjyTS2JaggrFa
	1/QMU8atWCV7RqguXo9Sevz5nRsd7oqr6zkzGmBq2avLhLjTIc2IuVuOtGON1zizwpr8Kk6AF6oXk
	0fecFLMxZa8dhfItJ0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1socoG-0000000Bw74-28gf;
	Thu, 12 Sep 2024 05:56:04 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1socoD-0000000Bw3d-0Sh1
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 05:56:02 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2053a0bd0a6so6474375ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 22:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726120560; x=1726725360; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6vSC44jl4CdBSHHJd2q6Sf8U8Y24j++yUJmo2Jtjkw=;
        b=ko6h6eqkNm2TeAjki59mAETO/eEGVPIw8rRSGbhHcH7HRyv74xwYMn7cEh7TXgfdNJ
         IBfRs6Js+7aPgoZHnPtKAgDZrizUhk+UMbag1ONcQJpy+gZQFjP8y3g4Wm/1Es3QZumz
         vxtvB4RpTYJ7m7FOmzGrz8pZ1qdxPZK1n9kEsgmGTNmQLY3/N/cBm4WzifyPMyKaTFW4
         en7PsKALqIzv1F0drEu6SA1a44ni/ICppr6HTrykzJj2oTGQVWLXfKtIaxchT735Is7u
         QxWold0yMCuVoTopS+gYOz7wKwPBymkd9RCJ4VO/c2xzwGt6wvfENDPhhWUJ/WbGt5wj
         rliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726120560; x=1726725360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6vSC44jl4CdBSHHJd2q6Sf8U8Y24j++yUJmo2Jtjkw=;
        b=Outt0teNmqHHUmfGHyWaj5hkiVm4UVo7b/U+0/FDi3JqS734SaeqG/051y+r2tGMau
         2oxQlzeY2HIc85JVjnd2oaiEM4J386vcslyvHEcMMxZT1TsUDxa3A+IGLbFStYrejgUP
         GpzWLjECBNCZXcBBTJctvNef14ZqOV1byuTmmUUOanJ5r0nvDSQTrF/xFlfMDksn2Qw5
         f941FHzxkWjYnE380WnNBZop+TY7YS6OOVgKt9X0giUYrsEKaXx7R+eIwtFnMFKOaYw/
         0SgDZrumDXP36NPdHslTOQ0j0AtMqIktOag6fNlxZTEX3upTPu/FV17o2l9xufvEfLEN
         cb2Q==
X-Gm-Message-State: AOJu0YyNF+9yRhtAcXRks/JDyAMjVwSwiCoZ/XbwsQ1GBL3y+yrGFdgg
	7Hjafs4o5RmdN0yaHnzvhw1JIuvYBqqvf+s2wvxDODNog34utDIHSRyYsEMFE0Y=
X-Google-Smtp-Source: AGHT+IEPAuMTwq96E1itGrD7jktU/8wAEcvnLz9ajoH5Z6N4peyxFR/uYKlbWT48re/ej30oK7FXSQ==
X-Received: by 2002:a17:902:e5c8:b0:1fc:2e38:d3de with SMTP id d9443c01a7336-2076e315577mr29117125ad.7.1726120560046;
        Wed, 11 Sep 2024 22:56:00 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe99b6sm7870465ad.209.2024.09.11.22.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 22:55:59 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 11 Sep 2024 22:55:15 -0700
Subject: [PATCH v10 07/14] riscv: csr: Add CSR encodings for
 CSR_VXRM/CSR_VXSAT
MIME-Version: 1.0
Message-Id: <20240911-xtheadvector-v10-7-8d3930091246@rivosinc.com>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=M4fQyJxhZ7NtPnQCPQfoncg1fbWtYe6qmsOGHrd6z/g=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qjpuhlprePJ7PoOP6JyDK7e+qIg/XFCBf7KI/47gTND
 TN8G390lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMJEfWowMk5Qyeb/kX3u0ViT3
 QPelJQcOT96xynnJ0UM/uh1TPXavXszwP/L3LxeW9v9MaQ4WD9lfbH0/QXhWmvC5Gj1PfmMujgI
 NZgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_225601_717916_1E1208BD 
X-CRM114-Status: UNSURE (   9.03  )
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

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 3eeb07d73065..c0a60c4ed911 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -300,9 +300,14 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
-#define VCSR_VXRM_MASK			3
-#define VCSR_VXRM_SHIFT			1
-#define VCSR_VXSAT_MASK			1
+/* xtheadvector symbolic CSR names */
+#define CSR_VXSAT		0x9
+#define CSR_VXRM		0xa
+
+/* xtheadvector CSR masks */
+#define CSR_VXRM_MASK		3
+#define CSR_VXRM_SHIFT		1
+#define CSR_VXSAT_MASK		1
 
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
