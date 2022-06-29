Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A982C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3NUU6jUgDh1QKjsGmxsEqEf/Umx4mJ037Gwx5+TXk6A=; b=udcCPcpeeAt1Qg
	htuPO8F9wzvD+GQoHpueiL7owBKR6/Nr4YwkbyN/w6jKnr48YZhbj1v50NHt9usvSzopYtqqxW+Pn
	YALQmn3LQ3UDz+b5znS5xmdj459rbpolepfv8rzSjYKvrUDrUeIm8kR3scmlglsojNngYi8kESdYP
	0TWDAGUAFiGJqW0uxjASuEu6YwHns5Oz6onE2gAsfiAMOruhi3x69FWLGvlQzIJztBxZ0ROnJODZD
	u9a3MiGVAWKEFdqK6M0HeGuDN8uGpGqMO07w7qzb37M49wPtbm0UiuHiQMKjR+3D5ylNu5QlhcLXv
	3KJk+ru8KJrhof7ITvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cgf-00Dadk-Vk; Wed, 29 Jun 2022 18:45:18 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cg8-00DaBQ-PG
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 18:44:46 +0000
Received: by mail-wr1-x436.google.com with SMTP id o4so19850038wrh.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 11:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lSAtLBVYvrx4+26h7+GvQLFIbOLj8yUyLWcfE4t8YDc=;
        b=Gg05/t+/FXPkRenwx1qHvhlOMODtFpKL/no0hINP8JMW14scbGTJqbUefdhtwratgU
         grEGM8eU4lWFIiPESGiueYpts7cjDlJRLBIzM5ZsXVuH9FzkMr9tHsBgVVqjWBN1GlvK
         8Q8loTffgUn8dEzgkBiOh2xMyV0VFHVAZAtsSavWDwGncJhky3H7ImOtJQlzgOOWAqUY
         iJQrWXeLhD8IqbgRQGGdxV35uefbG0o1zSbrLcVIYjgZlRqMq28pTN5szQsAw/tFRiJo
         YAy9bH1NwbpaHtrgHoUWaU2YAC7ZpC+O10b5BEj7lUVsyLa3x39mZw6dh7g0gC0fT41X
         T7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lSAtLBVYvrx4+26h7+GvQLFIbOLj8yUyLWcfE4t8YDc=;
        b=icP2X3Q4pad05SvCTtsjg+JDwEp/ki9whp8Nu+euDbmEO9xV67bqpKofU8W7dRSMXX
         kdMLMV7xNRkq3nPSPSPmaYC9sAxh73s067pit4Wwui24eJhTyoB6cKqtvgusk0F/MbLU
         SQ9dSRdxFdTsk3DPTJ5cmM60y1AdQFZ/VTrcON94qFUesz3bfX5SqGEEUPyv77ZIuR2X
         Fx9Wtv4gFPNFfvs7znihN4ubNuP1c5ZiiksilcwrNv+TKRfpgzOAvyrZjevxVrBxK1PI
         o+JXJ5It7kfj237bMwNymH+8xZtpnn0SVx5AR3aW/YLHF9BqXY4h5zqNCxkmw6RR8am+
         goFg==
X-Gm-Message-State: AJIora9K8jc/u4VN9a6I8rKdtr6438PqpIksGPl3LsGyhfJMTzhz5fly
	7fPIya83BhuNEwzXutgpktj0wA==
X-Google-Smtp-Source: AGRyM1sKo8OaJK8TbEgNGzQ3er/g31kuw/qeXLGUV3MKWqoytAx3LrG09RNZ7rN7G4m3of4rSEmYUA==
X-Received: by 2002:a5d:4e47:0:b0:21a:39fd:5bb5 with SMTP id r7-20020a5d4e47000000b0021a39fd5bb5mr4583796wrt.712.1656528282726;
        Wed, 29 Jun 2022 11:44:42 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 11:44:42 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 04/15] spi: dt-bindings: dw-apb-ssi: update spi-{r,t}x-bus-width
Date: Wed, 29 Jun 2022 19:43:33 +0100
Message-Id: <20220629184343.3438856-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_114444_862523_46D1431A 
X-CRM114-Status: GOOD (  10.97  )
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

Most users of dw-apb-ssi use spi-{r,t}x-bus-width of 1, however the
Canaan k210 is wired up for a width of 4.
Quoting Serge:
The modern DW APB SSI controllers of v.4.* and newer also support the
enhanced SPI Modes too (Dual, Quad and Octal). Since the IP-core
version is auto-detected at run-time there is no way to create a
DT-schema correctly constraining the Rx/Tx SPI bus widths.
/endquote

As such, drop the restriction on only supporting a bus width of 1.

Link: https://lore.kernel.org/all/20220620205654.g7fyipwytbww5757@mobilestation/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index e25d44c218f2..0a43d6e0ef91 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -143,12 +143,6 @@ patternProperties:
         minimum: 0
         maximum: 3
 
-      spi-rx-bus-width:
-        const: 1
-
-      spi-tx-bus-width:
-        const: 1
-
 unevaluatedProperties: false
 
 required:
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
