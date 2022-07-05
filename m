Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276AEC43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 19:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3QEgEA2gT9ybVvxm8Ikaa2tzrYPHbqkHFz65LVFe0A=; b=p4whDld4kbclOv
	Sgcbe6YygYyM0TWlxv9L3HH10qlLIS9E6USSlgLkamU3WGeuxXO1b/QQD84mJ5YNEJb57/3SyQdsZ
	c/vcXmbcWgYqcMLyxIvJcmA5aRBd+hhlE8x14aYxO4Pa09VEbVVi4faWJTT3E0CHsovx26IAkchuR
	NGJtIrQtLdOeC1DaWWchFyfHPeNO9ap6gz7P8C+Yq9dXVdj4/Euh8mRTI29rEE3fmff7GJIEjjRcK
	myYTn9Qp8xK3iBREm++eGUh28zQQo4DaGMuTcjXZXfxI0DlUcOrh6VFHp6Pjl/abzJKJAEUZBb0Cz
	C3klIcavXvu75Ktj4ycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8nr3-002ESl-JQ; Tue, 05 Jul 2022 19:05:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8nqx-002ENW-1C
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 19:04:58 +0000
Received: by mail-wm1-x32a.google.com with SMTP id be14-20020a05600c1e8e00b003a04a458c54so7775948wmb.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 12:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ofJfdtzmNhmvEWJSidzM2l5f2gdgrg4wmjMzsjAB6EY=;
        b=KPRE2MqxrWAyJ5KFiyW7W2wK/Qp+4RPmBjBPEqd1Ad/RcYiR5eQ4b0SjLC8+sW6c5P
         qCe+z2nKJvGF2GFscoJorSvxk3sNLrfiQ670bUOmB+jACJp9lOakMIuOoOquUdd1Qxyv
         4EDm71nI0XdHb50X7lVmgkNNA8h+QeAqqFaZRYx0mt4T9wPF4HSxuJSZVFf6rY0oqkVT
         u6puW3UWxcyi0rIhc0wj0mC6W6JuMvcvCDBN9Ol1AIcLjv5JSGeLkYTCy1WUs9jLAU6j
         QEfjz7TawPKt6zY2D5YLcdcoWm1Upk/knSsY46BnHYsWbDiw7/Xji7ElmxcyNbFD2ayK
         sg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ofJfdtzmNhmvEWJSidzM2l5f2gdgrg4wmjMzsjAB6EY=;
        b=ZOujSQ3DTeeJdKS4awZ0bnNuuRsecM3zFnHOUjAcC5QRiPhYEYbsP/AUV0AuYBUJsP
         dh2DMVNV7uq8dSWt7lv9s04grVaQhYrLTNEbnhEU3NcsyRjXrFRIzcgvTvnI76F0qAVG
         j0nBOjQn4usuvCOkA0b0uJEeagYDHlrhlvDaUXuZUPQMVlSq+PCPvk3fX7qlU6enOhET
         hDv5RZY+9AoaDVeIQRtYVoq+XssjhGxeUwpa11zcKDYcs8/N8ij+AZ+YmdbfjzigZK5S
         7KwgZCizJxvte5RepooI10j5LSkfcRo4PBsSk9cy9LdlhdlWf2Vg5mFR9UA8TBE7aEVH
         x0pw==
X-Gm-Message-State: AJIora+Hu5+dlLuI4dH6j1ivqxFHjR4lu8HlnIWony9J7zgHyJ+jNHfd
	EHpPoSkcJrMCBhVOD96UQdAPqw==
X-Google-Smtp-Source: AGRyM1tI18mclpFxyL39qQ5/YsPKhSiZSy4A+5WH0urBxCix8CHueAjToJskt0yqz1LTAmw3L7LhJg==
X-Received: by 2002:a7b:c381:0:b0:3a2:aef9:8df4 with SMTP id s1-20020a7bc381000000b003a2aef98df4mr11492100wmj.7.1657047893260;
        Tue, 05 Jul 2022 12:04:53 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id d7-20020a5d5387000000b0021d5c52f4b4sm9912961wrv.34.2022.07.05.12.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:04:52 -0700 (PDT)
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
Subject: [PATCH 4/5] riscv: dts: microchip: Add mpfs' topology information
Date: Tue,  5 Jul 2022 20:04:35 +0100
Message-Id: <20220705190435.1790466-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705190435.1790466-1-mail@conchuod.ie>
References: <20220705190435.1790466-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_120455_118427_199F5C52 
X-CRM114-Status: UNSURE (   9.10  )
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

The mpfs has no cpu-map node, so tools like hwloc cannot correctly
parse the topology. Add the node using the existing node labels.

Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
Link: https://github.com/open-mpi/hwloc/issues/536
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 45efd35d50c5..0a17d30bb3f2 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -138,6 +138,30 @@ cpu4_intc: interrupt-controller {
 				interrupt-controller;
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
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+			};
+		};
 	};
 
 	refclk: mssrefclk {
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
