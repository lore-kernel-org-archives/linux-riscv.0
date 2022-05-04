Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFD6C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 20:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dtL57O0CVkr9mGQbfb3STXrUNUA3Qu1SLdYwbS5EHQ=; b=3XjMeNBxFuyC7C
	+HAlaUZMt+LcBivd5yfsHFTgqOt8O4EReiiJtdlFWS3bXymzexXs8BIf7KA0lVJ9JaQ57/hxVg2zy
	J/46u+Io+PIciYjt7jx1n8FxT7aTOwmb/c5zKP/QOfOBm53/P9y7zIYeSzSsApdNv62Z7P/YoEv1y
	7rpWWI8KoMSdcyB2bbpc9B4eC8+60URz5E0cjpyfU8u1ZvCs2FB5d4ztpxQOSk7rNjIEclAVD8iwK
	z4rGaedzXwXrj9SEWIr8dQZG9w00cLBlrKOGbrn0cMpBLGP9Xs06r57AisyNJeUstZcm3rIjvloOJ
	gjH/Ei6VdNLs4y/irXvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLiY-00Ca7t-58; Wed, 04 May 2022 20:35:26 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLiS-00Ca4u-4l
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 20:35:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id j15so3535978wrb.2
 for <linux-riscv@lists.infradead.org>; Wed, 04 May 2022 13:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5D4kzOmGE7Re7vnlBTXTiR7FcHwOIAoOgkeDw/vc/M4=;
 b=eJ45NdIcxjr/92xfWtahZPRwhHmf1pnasdivXJNSTjnCvSFR7Sf9l/rPHzCzvJ35Jj
 6F7/rw832CQifVQPa3MNqS1UqCEfVy2aUFUSIpJ5oRQ/T5zzMhL6DjPQaW2rSFZGgHP7
 wIcPvoXQX59NsQVoMurnY9nAzG1KBTMMtLnIBHbK1ulqEho9SdiKjHAexH3ThITR85Py
 sJRrhVWJA9B1w9SMhgoQlBXKCxsDb706AmZrwHhkdQu4uW68OWtuQHh2/9ni8UtZ710A
 DOxw5QDNSLD7pZj7sLUdbvjrIOcaKTQIKmNQYOv91ioBBaNUSfZVDfGhtzEJpDn5CTYA
 Rg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5D4kzOmGE7Re7vnlBTXTiR7FcHwOIAoOgkeDw/vc/M4=;
 b=YLTpmV4sZmFJYhHsRwDNt25scglZWFvEp2fwabs17DOw6gabtVSsDoP4VzRiS8pwhn
 HTAf6Qpuga/jPrXpzK+Ar3c4T+tuPHtzckqjrQVLUchH96bzYjm5a6B4bGFDiikisIY4
 j7vkEZCQm6eNzco0OkNQQ7fmnrnDLySI+AViden/E9LmRbrvpcp8/T3nZV15EA1mB2oR
 V78ZMLZkINTnrPZcz81jUu6oWYhJTUtLNtiUe+FvGNCxX+WUazrIjTGDMT6RwsTAWIvq
 L8uCLRnQ7fVFEAiHomv+Zr/Y3T7JmucMZ4mEY4uHk8ZXsqqXdV1CGoB5liQwY5k5n38+
 nxvQ==
X-Gm-Message-State: AOAM530zFMXv+ystomnjBSwoLKAEMJmOuzcUwuv+UIYnfP7v1HW9mxcU
 YDM58koGkIVWVAbg3DqQgv9x6Q==
X-Google-Smtp-Source: ABdhPJyvbowoCrHJp4S9JGsEZwHDiCmp1MNaFzSxtbcHpSp/Q+WTTmrWNcjGitiaEyvroZY4I2SW5Q==
X-Received: by 2002:a05:6000:1681:b0:20c:5aa2:ae14 with SMTP id
 y1-20020a056000168100b0020c5aa2ae14mr14366908wrd.443.1651696517422; 
 Wed, 04 May 2022 13:35:17 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 l20-20020adfc794000000b0020c5253d8dfsm13330101wrg.43.2022.05.04.13.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:35:16 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de, heiko@sntech.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 4/8] dt-bindings: riscv: microchip: document icicle
 reference design
Date: Wed,  4 May 2022 21:30:48 +0100
Message-Id: <20220504203051.1210355-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504203051.1210355-1-mail@conchuod.ie>
References: <20220504203051.1210355-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_133520_239322_3CAAEA48 
X-CRM114-Status: UNSURE (   8.08  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add a compatible for the icicle kit's reference design. This represents
the FPGA fabric's contents & is versioned to denote which release of the
reference design it applies to.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 3f981e897126..822a711df9e9 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -20,6 +20,7 @@ properties:
     items:
       - enum:
           - microchip,mpfs-icicle-kit
+          - microchip,mpfs-icicle-reference-rtlv2203
       - const: microchip,mpfs
 
 additionalProperties: true
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
