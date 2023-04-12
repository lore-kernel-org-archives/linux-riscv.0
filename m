Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964E3C77B6E
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=niwWJQ75/MWcm32vcpsb6b2r1iPLC4XYgqYufJJyF8E=; b=2MOUYpbYM+4Ys0
	RSKddXCSD0YWOdShWLqkUiD6erBqhYkrH3CcXxNq9moXzaY/X2jY9ygQ+9SOcJti+jipQet8vkFs5
	Op8RF6+1/7nGHtQlFST+kevgVuTclHLNwgDfMraotfH6MFfi5pXMYkP7tSWbZi04ALr11u/vVzwyL
	Ji7erWllf4m3QSVWkq9kGnFSC1obZzfP2t8gDkPRgNoCBVjl+4TB/n9es28JiFWRh3kK9RoqOnOEe
	gDwRJqM37Pmm1Rh0L8OgMQmaOofsgUbBmsDhsF0fAWXKqRMQby++2WeHPSAf/3KQin3G1qULs+OxG
	vlG1J25ROl/Soz5iZ1ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYM6-002kVu-0G;
	Wed, 12 Apr 2023 11:09:38 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYM1-002kSj-39
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 11:09:35 +0000
Received: by mail-wr1-x430.google.com with SMTP id d9so10572275wrb.11
        for <linux-riscv@lists.infradead.org>; Wed, 12 Apr 2023 04:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681297773; x=1683889773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOfHS7Qab7COf5GtysXp/s/EeUshZZGs99cMnoHWLN8=;
        b=KXkT36kIhH4+z8eGdY1Vra7SGQyCjqqO7jEbK/xNa8WLTRmZxCxMGGiGyMQ6gpA97u
         efp5NuCBLFuiXo+jIebfDuwK63r3dAAC4uMXqh+SWA0HAbJHnNw4aq153+CJQ4kKYlmM
         kBDD/zPnQOrNJIwgtYq8QXM6UhJmYDfyeFlF9HUjyhGzfik5nIrg+qDYXt5y3CRljPzV
         8OwCk2AahtWm6gDqqoujS0q9WJ3SuyzZW7noF+gPzsi3GYaz6WANuq/6aBM4CoITESkD
         GXy7Wmf+QkYZWxe5xEqv+ipQKVRSDMd7IR7QPzK6HLX8s9Jr9dT0Bt52El8DNtVLtOow
         DWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681297773; x=1683889773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOfHS7Qab7COf5GtysXp/s/EeUshZZGs99cMnoHWLN8=;
        b=pAmm4sf9EEBuhQIP9LBzxPMv2Fi7GB3xJzdxhuR1KdqsKUxZiotT6kkYUwZPUoO3t0
         MfB69XJ6gesVTTH+l/7CVF4zBYhkffrr0z8NSuBYfF/YwFqz43IMYqvDPbddC5BVZ6OR
         TyCUu+pYxqVER2QCYIepVsqs/aY95bXhirCVN32ptTuXQ2guA4aVvoIB58gg2ZamxktD
         Mb6+SlFlWVggn/evMZLhB+Uu59otfbH/MHpCL9beeEbTHc2N2MWW9bUvUUkNEH4mZchX
         pkAJaaZAC4bilFTIFnuxava+vnc2swxmtFHW/IfX4t1YMCbKgUR0ENH3LNjOUxHOPHFY
         jYag==
X-Gm-Message-State: AAQBX9e4VQIKiJLoRzxDrHEPWb39F8omLV1514pmC9y/gVxenf6ZTw6o
	V/X4DTeOzf396h71RKShlP0=
X-Google-Smtp-Source: AKy350YtiZRV0yRO7dsna9ACipGa4QgFSL7APwLjXNb9K94TAKrkV3vUnAuEzMQUiL3+mG1FFgSc/Q==
X-Received: by 2002:a5d:62d2:0:b0:2e2:730a:c7e0 with SMTP id o18-20020a5d62d2000000b002e2730ac7e0mr1857235wrv.3.1681297772582;
        Wed, 12 Apr 2023 04:09:32 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:783d:9280:20c4:db22])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d668d000000b002e61e002943sm16863582wru.116.2023.04.12.04.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 04:09:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 7/7] soc: renesas: Kconfig: Select the required configs for RZ/Five SoC
Date: Wed, 12 Apr 2023 12:09:00 +0100
Message-Id: <20230412110900.69738-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_040934_024404_619723FD 
X-CRM114-Status: UNSURE (   9.83  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Explicitly select the required Cache management and Errata configs
required for the RZ/Five SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v7->v8
* Included RB tag from Geert

v6->v7
* Included RB tag from Conor

v5->v6
* New patch
---
 drivers/soc/renesas/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index de31589ed054..67604f24973e 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -334,6 +334,10 @@ if RISCV
 config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
 	select ARCH_RZG2L
+	select AX45MP_L2_CACHE
+	select DMA_GLOBAL_POOL
+	select ERRATA_ANDES
+	select ERRATA_ANDES_CMO
 	help
 	  This enables support for the Renesas RZ/Five SoC.
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
