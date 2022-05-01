Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEFFC433FE
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 19:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rm5ASMHMHobCZ6uP0vTwpAKfcI7wIT3T675Va+wxNkw=; b=Thk7k3pSG1j8j4
	p29KLrBXYRMk8w4zjg8mUY6xEiPM3Eqkdxn9eXYhaUAeYpI2E8fMxjoTRvfOyfA2UPcrm/bKjlw0M
	xq8vGidGOc4YGjvlHU46rxks8/o6Dcq9WJm+9K32KWfxFvITj5sPOBR+Pj217gexln3+nOtMaPU/A
	Fo4XTA9perQaXH1wTWrm/s+bidlh8DVhUUVctzW8wHt8R9iB/HwQxXwYOhB6xKcV23L3dF1IB0+UZ
	ibsN+LBVPdk4Wpw+xCpq9Dejp/KpPGPDIkCQOvvRUVUIXEIqP8g+f71I2nIypHRWafA5+O22ZYluo
	gKKOTChahYyYbfOyC8YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlFDR-00GnLg-LH; Sun, 01 May 2022 19:26:45 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlFDL-00GnHH-MW
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 19:26:41 +0000
Received: by mail-wr1-x433.google.com with SMTP id j15so17253615wrb.2
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 12:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AwbBgF2BBmn2/d5GaBoLnqmBoCcWn7LCRN6pKIxnqBg=;
 b=5Tmp/7ZCksQfQfYzi1RBTW83DljZezcq0OcxLFdDEygvSFIlH+qCeZR2eKH7Vem1Qd
 Jm1an2hVugwVK8XRpETiqSvFEfKJG5518qrxStFhIhvz+PsJEvvwC1NbbRto2q4O6jF1
 1EvtFiBotHydVmKpUv/NYsOHm9rFl+2vtAHgkoR2Rcy2+uB3C9pk1UNeIQN9AzY+0s35
 foCr2ISHskiY1ff8Bj7BLsh8i8Q4JRXdabTaLA5ewAqKBe4xCuJFtZXTnBflwgmAiFHp
 fnhN4GN0UFhbSMwweTuibOnyQGagX5T9HoQ/pFRHFdGJjUmsCbYqg1lg9pSgSC5lOXza
 SMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwbBgF2BBmn2/d5GaBoLnqmBoCcWn7LCRN6pKIxnqBg=;
 b=dLV6ODOuQ3gYL3/TnNvo0lmZ7PT6hIAiHK0VsiK51FirvQtvxii5BhVTOKqIm3gTY1
 Tf5BqZQUxBkUx3fBEtgMBFlnl5iGw2fKB/iPpljPvCOqWtP3LUKLzlrZkQiGuRRwVDfS
 gAr+exQWLM5FfTwb3qhoAj7qxtnIZYYa0gVryQFEvzLYmxEAKdSefA8o4i4aTr+N6Tg+
 NPto2TkvdomRFVog2CUrzhtu11NUo0S6Q/sfMwxXoM6rIW6g34GHcVolcsIsMGlNVhH8
 fTAQmocRFUT9l2OHFNkV5NHf+2rRCd6/EPHqtXMFQ/1U+OQb7+oD6/0D47PKtP2vL/i/
 q0HQ==
X-Gm-Message-State: AOAM530Rucic+SVLnAoIH1dz2Bc5xgJVsii0wE3KloouyZHHm6lI5oIB
 P+k3Wad82pmTbnUIxY+N2qCc2g==
X-Google-Smtp-Source: ABdhPJyEezBHT102gjya0WaiBuQc9VkqGSxGDbobxFzp1NmbTTgUdU8zC5QFP8x+mu0WwhtpG5KvEA==
X-Received: by 2002:adf:f350:0:b0:20a:dfc8:f8bf with SMTP id
 e16-20020adff350000000b0020adfc8f8bfmr7181943wrp.377.1651433197294; 
 Sun, 01 May 2022 12:26:37 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 i14-20020adfa50e000000b0020c5253d8c6sm6448105wrb.18.2022.05.01.12.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 12:26:36 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 7/8] dt-bindings: riscv: microchip: add polarberry
 compatible string
Date: Sun,  1 May 2022 20:25:58 +0100
Message-Id: <20220501192557.2631936-8-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220501192557.2631936-1-mail@conchuod.ie>
References: <20220501192557.2631936-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_122639_779765_1BD4BB65 
X-CRM114-Status: UNSURE (   8.17  )
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

Add a binding for the Sundance Polarberry board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 7a1f883a39b5..3ac611689441 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - microchip,mpfs-icicle-kit
           - microchip,mpfs-icicle-reference-rtlv2203
+          - sundance,polarberry
       - const: microchip,mpfs
 
 
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
