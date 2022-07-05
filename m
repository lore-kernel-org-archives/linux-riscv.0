Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408C1CCA47B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 19:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Ll7Hd4+GdqPESZQRzzQ8evND7zL5ZdHbm0IvcSEjYE=; b=GtkWjW8ZZm9zaM
	mlkUzNdZ4D78gSkmFo+Tb66WE/czQJR/c6DAJ+Lbbsw8/XNEEhRTroi2FnmcTZUcRhm1C6n8yIP9G
	EEzznF9GKNg3Pug1y8vYjmUmdXpQ9dbY2ZOB0zJQP0Z4MJxfbS7kUyxnZi4wJEXJUM+TUR/yuHIhc
	upatn+H4fThUCKvsUiCFp+x+n/4pOjR4AWjdA5TFyq2CevDYl0znzRC8l2eXGA7dAhgpkKAXuonVL
	ql14SLq8WXux8dDnIp6GVrpdDGV1prxhyEtehSg1z9JPD+UMGY/q+RSQKD4ubXVD9UYREKsZVidRx
	co1kDWFA+hc2x7Lw3Kuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8nr6-002EVX-Cc; Tue, 05 Jul 2022 19:05:04 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8nqx-002EO8-OZ
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 19:04:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id bi22-20020a05600c3d9600b003a04de22ab6so7798150wmb.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EAejLaRmDI7ahw+8pWedR3a7Dpv7oYIzED6NiiTc7a0=;
        b=gH8Eh0uSyp1pd8lYOTghOMpllbsaSKtH0LZfoePu+NLFoGUnlrt/bMlxOQW8M9nYhm
         2RcpqIr/5SHSJXL1yLCB6PqDhUDzggWiwdYDbx5v3OTdAqaVLNZekmK5HwJU8AM+QJrV
         /T44OnuWF5AME4PsrRs8vhQbGU4Onl26sSNn1wqmfQ2bn6F3OggSTLoCL33SK/nWdIaP
         7Z5v0Aza1Kf+VxyRjvGNLOltssWMr9PoSSvETyshYXAkAsZuPzMlFI9rZ7+27fy75akx
         9uMzCdfvFIU+oAjoE3bdvC7hculNfq448yw1hlj7Rc0xgBHMq3tap751KKBP09thts6R
         rdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EAejLaRmDI7ahw+8pWedR3a7Dpv7oYIzED6NiiTc7a0=;
        b=q+aIdBExHlhBiPBcbe15FNMc6OSXRpYdbE0SmhAu2mCpIKO2ee/G9JJD2GkAeTZkqU
         Y93RWsg1yaOKvsRIP7YQXhuM/1Apn3EL5a+tjzt4WGjtKxvRR+um3hiKiBtWg+SsSjNk
         Q/8687RZ7IKy5V1WtTSThtoZrmhpI3yM8NAUoZUmgAgkdE0Q3lT+oIRHAjith+whgFUM
         bHFgVG428MEkiYGWOjlwo/Y1ufnTf4Y+0h1qihAtdEeHRDHf+GbaTLcDuNpff6ydPcXj
         apO5+9Gjgy95RMc8ofCdXQc80O2DosDdUNitEZxtRdnftYGmzXEXbahm/xHXfph+Oq45
         Fpjw==
X-Gm-Message-State: AJIora/cTt6Q3ZFj15a2glGQRRRtC+UfbPbNjHdxgxciI9wJcMhdyQvh
	2Ln8prYrlgHbyh5th012CIrGjA==
X-Google-Smtp-Source: AGRyM1v5EycBOklnarxa0uQO3GFtyp55frrKZpEg99ryhZLuRXj9VDMx0b33n8f0spv/5bGvXvOHyQ==
X-Received: by 2002:a05:600c:2284:b0:3a2:b7d6:609b with SMTP id 4-20020a05600c228400b003a2b7d6609bmr5625866wmf.83.1657047894458;
        Tue, 05 Jul 2022 12:04:54 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id d7-20020a5d5387000000b0021d5c52f4b4sm9912961wrv.34.2022.07.05.12.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:04:54 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Zong Li <zong.li@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jonas Hahnfeld <hahnjo@hahnjo.de>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Brice Goglin <Brice.Goglin@inria.fr>
Subject: [PATCH 5/5] riscv: dts: canaan: Add k210 topology information
Date: Tue,  5 Jul 2022 20:04:36 +0100
Message-Id: <20220705190435.1790466-6-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705190435.1790466-1-mail@conchuod.ie>
References: <20220705190435.1790466-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_120455_829597_C2BF1503 
X-CRM114-Status: UNSURE (   9.25  )
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

The k210 has no cpu-map node, so tools like hwloc cannot correctly
parse the topology. Add the node using the existing node labels.

Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
Link: https://github.com/open-mpi/hwloc/issues/536
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 44d338514761..ec944d1537dc 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -65,6 +65,18 @@ cpu1_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
 			};
 		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+			};
+		};
 	};
 
 	sram: memory@80000000 {
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
