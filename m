Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3567EC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 04:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3wKwrLcFwyUZ+gRtqqvPnkMBCIGBPb4zRTfFMAiAy2I=; b=DrhX1y4IqU/nXI
	QVIr5AAxdci4sp4oLWatauKdMi+Vh5HRqFl76pJnkHEbJ55YSAJ+Zsa8L9GqI1IngPB8DHHEpSc+T
	7qElmn2HR1F79laZ+yPBX1D5t3zgf7EAfkOEjQRJtylX3r21wZTmY50lBW75gGNt4fdKBBTIh1HX3
	qiNzprqp+5laDmf2+XfsSGY+d7d4HGnLDkNR6afk2cnrjg87HoT5TYchgUAH49+jBjN+Aimr+ph3i
	TU/fU49N0O1DHRQ6JHtd2W1et4VHj26uHyg+yfUp1ENeQtAUWj88todER2xxfCuGAHWiWpwhytF8W
	i8dKycW2mTcoIxUKkQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaCN-0000000AlXW-04hS;
	Tue, 16 Apr 2024 04:13:35 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaBA-0000000AkV8-1jkb
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 04:12:23 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5a9ec68784cso2397446eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 21:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240737; x=1713845537; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=tUR9E7He+/k1L/NDGf3XsS7GVg1N2XX93cC91jBoF3r57NcUmpSItQTddZxiunaBT/
         s5i5gFq7m90SWFm6TEiJJzKmOC1fzC+hfMtqqGYuuxWR4YINPMkUh0tcqM8V6p/s/3F3
         y8InD05i4noqYWdtsprXoin4DT4wcUHIHdxWpj1O01LcJ9YoGqjPvK8SOC3As34oqUr1
         V4k3r/6XFoSqzoGsZCUOOMFhnkB/ZpGvdLLKubfRgnICjThQ+9q2wF4P9g8e3xefXC5l
         OzvjyD20DWU3tZujwcJiR1SAWeKVWlmnGDkICHEUA9+e0qIRPCFFaZ2B4wVpw/EIBlMn
         PNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240737; x=1713845537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=XIx2tYLPH1WRxRNcKgOTwcUZFeTKdWpA1zIebPDdHAoA3rqbF7v1gsef+jKg9aW2Me
         N1clkjzSSWrCojh99L6zLkzmvrXBn9HcLXG6nryIVJouOd9Ckp3j15EgFHePITxiyVI8
         i6nE3XpX3coeHNZ2lUfNYY+oMxgTg5Li8eS9LliXnYSyQcXTwyFq23FhRC71IiD7g1wc
         Qq2IYAPKDIDc7kgDwUuGshKxbXPWSEJc9MSa5Szp9OnfAgQJtTOzZUpDW+JRjFqxn1AD
         jDtJXBoQJCFcdJcyJ50cL+FCKsUj9lGBRKVEuzOsSVVmCqEH8N5z+1oHYvXLnLy5+AgF
         xAIw==
X-Gm-Message-State: AOJu0YzIY6ISXIlyAN9fpdAL9OxMYC5BaB4K/0QRcf8IR1UvT6xMWfF/
	jtHLXUiQrtt1UKx+qyv7JPIPi1/2vQtD5Nq/Xmp544rJSmDDJGmMLTrDWE79MM/E3yWHi1UUSJu
	q
X-Google-Smtp-Source: AGHT+IHkqiMkVjxP3CYqN1RvGEvTVB4gtmkT8yxeTu0gT+YMQ6rgsqh73ctLt3AZ3AdSqqJmE2B/vA==
X-Received: by 2002:a05:6870:b293:b0:22d:f859:2225 with SMTP id c19-20020a056870b29300b0022df8592225mr15026805oao.6.1713240737601;
        Mon, 15 Apr 2024 21:12:17 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:16 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:07 -0700
Subject: [PATCH v2 10/17] RISC-V: define the elements of the VCSR vector
 CSR
MIME-Version: 1.0
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-10-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=C7F1c584ODJM4qF9TPT5kMoM8fDlOPYyEMw6010Mea8=;
 b=gL5a3gZt7YmAzdC8JCIo8MXcZ7fbdc6iO361KpgkRlf5taEU4xnmrghYwi1t5py6BJP8PyQO9
 P2I8p9MxL5KDfEXe96mXU4uz3Aeg9WWgIVAt+oJLRgmHkwkJ4xayrK0
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_211220_690034_3EB9ED5C 
X-CRM114-Status: UNSURE (   8.55  )
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

From: Heiko Stuebner <heiko@sntech.de>

The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].

Define constants for those to access the elements in a readable way.

Acked-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2468c55933cd..13bc99c995d1 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -215,6 +215,11 @@
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
 
+/* VCSR flags */
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
