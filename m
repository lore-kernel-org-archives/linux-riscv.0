Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C1FC4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 01:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3wKwrLcFwyUZ+gRtqqvPnkMBCIGBPb4zRTfFMAiAy2I=; b=JA0Vgmj3kMsgxm
	PN0coLlpqm9MrVWf7dPTupdUw9JWSRpFz00nelO/gRmHrBxzE4doVTBv+0PIJBddISK/I8QZQEJkz
	FJ30L3vPOpHiT+pIIdS3cZgy70tBbm6ZUV3t+mkB50mdL9oeWzWKgdrUxkIn1BY8ooHgB42boKszR
	Z3Mnz8zKxg8GuUgm/Fqpu+7kWw8kHkJXRJWReMglyCXMpTvnIbImfcgmMXqi6tECMLvlVaaSATuwe
	VkNOiuUsqI0LnuVEP9Jsyv0USuHblyojz8Z26SwQ6v58ilbQ93XEgAytmo4CgCWfSrLHdTSPzY25n
	Z3Z71bLU8CViS+OCCiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryLgs-00000009YXH-2TXD;
	Sun, 21 Apr 2024 01:08:22 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryLdk-00000009Vwv-05Ua
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 01:05:14 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-22edec341c2so1781399fac.0
        for <linux-riscv@lists.infradead.org>; Sat, 20 Apr 2024 18:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661505; x=1714266305; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=1HMBOuMK9pFBV1p7a0IrcTYGZzbYKs6/6znEEZHQORy8dQYEypFJbXJ35dHcxX7q/j
         NYdnA3L3IS028EpnqjEoSVpfx4rBzAb4ePBoHRWd9fdT6qh8cZupLP2tQjbB4QqOmYen
         oSKZQN4828cdLuHP3RbB68lP92TpBK3HJ52ev/eUahALF0MUin9XcAGk4sYs4e+PDrsR
         6ggsk4MdBRHqqArKkW+1Iw+mZgYk07fxMwCdkR0ML/b08dN+jmAjGYNpXutJz48vq5Th
         69YDFsBLT31S+r6+2yU7W899Z393YoLqUKJR6vjGKX4Xr5AHmZD3BkzY0rae7U6luluP
         F3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661505; x=1714266305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC8+jsiLZWKY+UGyCwiSu3stdoXyccUkl5+IF/7wAA4=;
        b=ZDhuQ4m9B7wW/5eXn3L8+0B78pjdKIbUNhrcDASQdINtXy2nLr761+cmOn+sN4PzCE
         q2sBk7tAdEpZ2piJQa/kiLSXId8Kb3r/Y1HqOfaO78d44xAsgmR+QwAMa7qYaWPO8hxe
         nrzZEBjjOmCDco5yxm8vhEuKShabpb0X4Yq7bfvB+emINU3dUZtk8Rnu7pNe2GyfwpDH
         iSrPZi5X0ByI6Dc/n1K3MpcGnri4bbvXrKUV30T9XEa2r25bWtkqIgfS3klGm38qUN8a
         ZVhVfeyQEfJZ+LNHgclYN28f6VAJuhSS88Xb3gm/hG9ylF/U3OihBpaEInykcgechBkr
         tMOQ==
X-Gm-Message-State: AOJu0YyHYFxA8QOyi8La2C1P+EkU+v5cRegtJZy3xrq2ZQYimmDSmxC7
	8LwVBlMgsK2gaUEkhI9aG2o2VIOWrJL1spVt3QWFM6gELaXJ8hQjJAviLch/szk=
X-Google-Smtp-Source: AGHT+IGbQ/vxSg+SM01gknEBQRR/q49/3qC6z4/xjDMc4YZpeoH8/vtpKwa4//R2pCwzOVNHIa6iZA==
X-Received: by 2002:a05:6870:9a0f:b0:239:8e67:6f10 with SMTP id fo15-20020a0568709a0f00b002398e676f10mr5008737oab.30.1713661505412;
        Sat, 20 Apr 2024 18:05:05 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:05:04 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:42 -0700
Subject: [PATCH v3 10/17] RISC-V: define the elements of the VCSR vector
 CSR
MIME-Version: 1.0
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-10-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=C7F1c584ODJM4qF9TPT5kMoM8fDlOPYyEMw6010Mea8=;
 b=7jmS1W1m0Q0AzX4wBIry9EylCG+Y3NoCPBcfRTlo9XfCGTiKUGeLKVQZD0sKpe6MXP57BC0/G
 7k6iLclC9/sAQ0QerwrjVwujrLIbftuilh6gclJQQmbPMW8YDHcSlr5
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_180508_459954_F6B8D88B 
X-CRM114-Status: UNSURE (   8.23  )
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
