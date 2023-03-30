Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507F7C77B71
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 20:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9pRLfYZ21eui2wPWsbwAZA7z/khl5JfVrIjSYs7bjdE=; b=YAhz3Him4KZfrt
	qbXqRPmco+gklfHxAmKhpgZSASOAFR/noWZdOmQTPNn1qJvJ2RNe627cQDS4YZyqZcjNnHm17soNR
	R3c+XL2xpvV1zpmiFDvlXp/9P3rfJEIucLcMLwwvS5rMq+mjRlbFc/eOX5iJPCIGd6YT7KewHGFw1
	IuTtmccxcL4F5HFtDRztEV2sOW8DK9+4xMHQgcHKcIxzaEo/qti9PhMFwF0Q516lRwUvUDmd1xGFb
	F/RNxmAsqUhkq/g3HxSUWWrDEaoiTi6i/1g/e6PAS8etnBepaM8s1llxJksa/eYuYTB4DUmkVuf4a
	6tArOxn8hO0NXX8C8/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phz6l-0051zh-1W;
	Thu, 30 Mar 2023 20:42:55 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phz6g-0051vL-0H
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 20:42:51 +0000
Received: by mail-wr1-x430.google.com with SMTP id t4so15123060wra.7
        for <linux-riscv@lists.infradead.org>; Thu, 30 Mar 2023 13:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680208967; x=1682800967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVLJ+jvYtKAHw9uWehWmKzg7iwxnJbw0QCzpAvbBm74=;
        b=W7fVzssA8QDCapvKTkoy/XagVfFnxYrLEzjjz8EEr9aqhofp2hVnw8T+E3Jr+nEdNa
         97dIWkEbf3FORLwLZE/5HArDgiFztVrOgFjz5hxh1jmA6tjNbhheZt3RWJcyaDjN9d5C
         LGWKU1Ceue5VI2if/h8CyKWHHUO2bN6I3O50fpCnM+VtfM8ZFsQPPztuALBtlfENa6ft
         YtwUfM/3ASZcD5pylRfLVPvV/BOl1WCNFBmTdMwJqPu5XQp12OIeZD8Oce9m1qZDFFDa
         RC5c3OwCzvRrbwjIshLD20LU0IonkECsfK766VhHOvAG9yQIskRzqu0j8ZWStESC3bUl
         hRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680208967; x=1682800967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVLJ+jvYtKAHw9uWehWmKzg7iwxnJbw0QCzpAvbBm74=;
        b=wu9JuA6l/RNXYsGwaXw+Z+dstZcEgQTd+8NNEILqplVRz04DG3hb7blfuzzG2w89Kz
         v3ECLsrV/BIB+GR1zmBBpa4LLMFLt1QZhoMljBHfqFdnx7ocBVVzbAuiPZKBeU2CMBVX
         CFLU3+lLBIgKNIcFn8VEVJChdYGM7XJDFzGvLO1Ey+Q3G2w6H4G588WVewmNBTmBtlsx
         BeuY8hALy2//0w1n0gCfH6yebyjyNVnXou1b+1fO2FnDXjGpSRrLKI5MovO4HvHr1A6J
         tp4Z7ivnoF0vjq9RrO+IlJ2FyQ0K5wWTjk9eX3kEwZOXbJJe+sUizMcpWpo57LpN2xdi
         e2xw==
X-Gm-Message-State: AAQBX9cGxEwfzm0Bcfp4KO5P/JoWYBHyalByhTlDXMG4GUDBeugLRZ0n
	I/24WD/7IGBA8M34MWCdB10=
X-Google-Smtp-Source: AKy350aAvzzQW67L9QzCg0QWZlDe/xWID6JRpmXb9cTLENUc1XfQLzXnwUJG9YMad8I19gvPKRQjlQ==
X-Received: by 2002:adf:fac5:0:b0:2cf:f2f9:df7a with SMTP id a5-20020adffac5000000b002cff2f9df7amr18208641wrs.38.1680208967130;
        Thu, 30 Mar 2023 13:42:47 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:30f2:5b7:ab32:c3f])
        by smtp.gmail.com with ESMTPSA id v12-20020a5d4b0c000000b002cfed482e9asm297981wrq.61.2023.03.30.13.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 13:42:46 -0700 (PDT)
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
Subject: [PATCH v7 6/6] soc: renesas: Kconfig: Select the required configs for RZ/Five SoC
Date: Thu, 30 Mar 2023 21:42:17 +0100
Message-Id: <20230330204217.47666-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_134250_124876_CB2AE0AC 
X-CRM114-Status: UNSURE (   9.40  )
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
---
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
