Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABD4C001DF
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 20:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmuSDYsyCgCCl1yyaDVzKHbILzYOU8TBD+mVadyGVA4=; b=HkZ34wWFWcQKRv
	VAuxpyBTXtKJVA56t+kiLlGAkVX8XUMAQ50GjbKGG+BmqnRfOXNHWqgi2o1puLgAR/TqDnMNIVIEs
	sY0pzwLOaD5z9wc8AQzXO6+YvgOFHu+0nzJtT2LG0uxqwn+tzCZagAHGsu+jtQPQLRD7cFVNYTtKS
	NjvdMX0sJIQchefqWbJF5CjkJIGYxug/Arh3RRQ8dKv2jNYU8pAwiZBRIQ2dNjLpLkZnLyuUEEg2e
	bYRyCJlVDj80G2pnenuhmPsYL44BtFRPLjY3rU5oQD1meF3gZanlXVzeFuHFu0sFUFz2F1zqBgmmi
	k+BuQ0tdRSfjcVkuFtYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG3me-008bIj-1P;
	Sun, 02 Jul 2023 20:35:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qG3ma-008bEV-1m
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 20:34:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fba5a8af2cso37418505e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 02 Jul 2023 13:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688330095; x=1690922095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Urzo+tFsGAkOnz5ecpB6iDl1xPRU1BRxrnQ2HFHQvFc=;
        b=JzpxMDAE4UcE4qgKpe2qIYa1+chuZrFCRU5IBISMlKC+1W5ZrRnTTJtoWOhZPEWjE9
         P0DG8/CQ4j8Ufs9qfrVLSY4zr7NrFnk6Qosqy8NxOCFg707x3R5WyAqWo2zE4NCAbWig
         SReNgwntctr7AaU1AiUNleX6xt0G/S0OQ1kXb5qFn8qk1SqDuNwh4HhRAVGqmFmWZsjM
         6VLRcowSvOLGLgfSGWzZ3rlAzkmQ+vZynmeC1ceyDimJfuOW/DQGb4q9lPbGPVl6ugMR
         N/JgfMbzQV1ZJob2PK/kRlxrzoa/OJtEUzVg0lsHRctldfKLmKQdicP344vj6D4OYyXg
         bU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688330095; x=1690922095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Urzo+tFsGAkOnz5ecpB6iDl1xPRU1BRxrnQ2HFHQvFc=;
        b=UCL4eyQnbvBTVqOs1dKrv+W5ve2b64k/K0ty5A/xsm4xjaVoat20013zRCslY5GZ8R
         5w5DYuix9woJfEHi1ajx+1hjE6hJ0GgqQKxgldgLbD8FWH840yTjmegQXv2acLGV4QXB
         CLfj3D/4cdAsUZcifFzI+1+WWxaaJP4UwBigjPZa/MVaK95x+aTClbTJEeDfuCER7Vvj
         5BSpzvfkEvFV0fNtvGL0HN10rDQs1IfbHvPhWgOPx6PCf1vA2B5Bfo+aAbmNRsvtXuzQ
         OvDM7Z9aCINfcE5YuxkWbHWiJKkAVBLhfeJ5gAdVaelw7X4jqIemKvb4W7iAxQ+Njhfo
         Vssg==
X-Gm-Message-State: ABy/qLaDdzQojrMq+k3Gx4pjiFLup7rdsQ/KjfEHtpdhZjUJeXoGI2il
	ybV2xZpB4C+8HzMlMLoasPM=
X-Google-Smtp-Source: APBJJlElm9XqeQdO3+GTDFDpJLzuHY/UR2rcUieG+OuqysMrqplFSVn/oZ4mIw5L5cVrvaghmfyvnw==
X-Received: by 2002:adf:f504:0:b0:30f:be04:5b5e with SMTP id q4-20020adff504000000b0030fbe045b5emr6227046wro.37.1688330095191;
        Sun, 02 Jul 2023 13:34:55 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:b4ae:ae48:2e1b:1dcd])
        by smtp.gmail.com with ESMTPSA id f1-20020a5d5681000000b0030647449730sm24000478wrv.74.2023.07.02.13.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 13:34:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v10 6/6] soc: renesas: Kconfig: Select the required configs for RZ/Five SoC
Date: Sun,  2 Jul 2023 21:34:29 +0100
Message-Id: <20230702203429.237615-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230702203429.237615-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_133456_616969_DE2183E1 
X-CRM114-Status: GOOD (  10.04  )
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
Tested-by: Conor Dooley <conor.dooley@microchip.com> # tyre-kicking on a d1
---
v9 -> v10
* No change

v8 -> v9
* No change

v7 -> v8
* Included RB tag from Geert

v6 -> v7
* Included RB tag from Conor

v5 -> v6
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
