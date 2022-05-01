Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94D3C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 19:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=weO2u1LMGuPZTmxhBRPQjCOlwk6o44Gy06hfWEQLuW8=; b=h+OL68/vZVIhGe
	ib5fHqQV8zf/INOu5Ba9UrRs21E4Eak39SSPwbyZvj71kA8Pe4NW5QelZT9sRoKzMOmHx6Bz/ATDP
	Ica0k+/PB4m9kg9UizSXE5C10POaYipNkL6sSrF6HrVauaHwo+RwR+3e0vKDUyAE89twmi325Ob5d
	HQZ0iNuJkn3fvpoTGsGB2xrsTEvT0QVIzrY7GFrivmBnrMh/Inj172+Lz6lSEWAieRvgFqVfRvIxO
	OUHCk6XGS5lLSG2X0vgupFYuLkP70Av9lRkEF93gdUVNcJwLym8xr5qD2cqzNNLTyFqvszv8uapsM
	kg3JSKfE/WhNzro0rPLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlFDP-00GnKb-Sp; Sun, 01 May 2022 19:26:43 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlFDK-00GnGq-Ba
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 19:26:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id p189so7289893wmp.3
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 12:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/kez/qpsFQ+IZamV7zrV7LTtRW1TdlvsPTX0KFg6YaM=;
 b=zYcbbbn6x8nFqBJNcTo5K10m1fVCPAbmzI4EEiqB19Dt0CtN4YfZ+n3eRJUrEUrmG3
 4GQuYluEbb4bGxzAJFOVTQpx6wM/O2xCVrJnUb2dpktdkLrqiH/Ox6Av5VE71LGANb5p
 enO1+LaDy0ieC4/r8HrZy0GpqbFnPqzoGHreSD6/rHVFNHSPh+mlI86BlfOQlPj3tGAL
 yUpREufCVhnuseHLb6prpzQeIJfWvkoawrO/gw6d9/iWGp5FWBubzO2VaHeFijKlLj9/
 lMeN3FdAHsO66Tv9w8FClrjFdeoH3s6srPsX69bA0pDoprHSvxGZhcDojB8LJdJX9q4I
 810Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/kez/qpsFQ+IZamV7zrV7LTtRW1TdlvsPTX0KFg6YaM=;
 b=yAJixVN/bp2ua+4yayjdb6h8/YSeo8QiXRz8Va1n5ix5Q5KvjEU466o3Y/XO+ocwE0
 QT/d8yvPbY/Q/rr4IKd9gu4J9NysK4AYV69wVNz2pzsJ5qUkar/CaKKDmAyUGBuJWLIY
 5WGr4hEG4EG8fpnPAjEArbPE64pAbugU8ZAKZMHTW7yKekB4KJDPXzZ0gOgA7FYuILTO
 2hvlXlV9HPo4GcTPx5vy3wc2D4tTiPGUI9vGqTZMK9qZDlvTXsaRcP9JEJ9YSOE4VUOp
 9h7be9tVk8a666Q1Ro6ISITQolfRqO34GfOwNINRsD5euxgRAOEEKfLTRQOSL4tFvVq8
 0iEQ==
X-Gm-Message-State: AOAM533hAqYG+pIAudk3GpZjdTEZU+KpvY7e1rlZrhu/mWaB80uugEdi
 yAMwesRJVx8QHeUOces1uLJJdQ==
X-Google-Smtp-Source: ABdhPJwMWJCsRKRMZtX/Ja6xQmgBBzodM0Qb3tBUl6fsvsA0sjo0C3BxIcXqpeX6QRnynN5mejc5Dg==
X-Received: by 2002:a05:600c:3492:b0:392:97ba:9581 with SMTP id
 a18-20020a05600c349200b0039297ba9581mr12598465wmq.163.1651433196187; 
 Sun, 01 May 2022 12:26:36 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 i14-20020adfa50e000000b0020c5253d8c6sm6448105wrb.18.2022.05.01.12.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 12:26:35 -0700 (PDT)
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
Subject: [PATCH v3 6/8] dt-bindings: vendor-prefixes: add Sundance DSP
Date: Sun,  1 May 2022 20:25:57 +0100
Message-Id: <20220501192557.2631936-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220501192557.2631936-1-mail@conchuod.ie>
References: <20220501192557.2631936-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_122638_436635_F936F7E9 
X-CRM114-Status: UNSURE (   7.54  )
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

Sundance DSP Inc. (https://www.sundancedsp.com/) is a supplier of
high-performance DSP and FPGA processor boards and I/O modules.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 01430973ecec..1d47a38c2a2e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1197,6 +1197,8 @@ patternProperties:
     description: Summit microelectronics
   "^sunchip,.*":
     description: Shenzhen Sunchip Technology Co., Ltd
+  "^sundance,.*":
+    description: Sundance DSP Inc.
   "^sunplus,.*":
     description: Sunplus Technology Co., Ltd.
   "^SUNW,.*":
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
