Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51D0CCA47B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 19:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9OnResv9FoC+Y+K1Ax4XNgrJZ8UvX7d7q8NTHPyxL1I=; b=4eROtOSV+kIEWj
	CiUVtWCpYA9JUyCXWMkJzFoF+FEMy+3kRnV9ME75EYb7TKO8ecTTXtcBjfEoIsmWpppKDxKJFhkZG
	vC5mUvGVnRgOXNNByGPsW0rDXSYX/bYlGUe/tHpguRGYcMzF+eFueOuqxxPodfUNyClIl1GnsUu3r
	qjI0Y6xRx1I5Mj6ElGmMIcQAWz6MLLJXPOz64SopTehBxmQngVBvZSoHDO7W7OpHxNh7HIAcWpF3q
	eNf6LnMOR0p7SG+7VpqJEhXbMYvaorXNXZ5wQmlj8x2RmSrig+iBGhZGybtj3Pt5QXu1/ueaHBior
	8kafWwsBHvLWXytWmi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8nqz-002EPp-Im; Tue, 05 Jul 2022 19:04:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8nqu-002ELa-KJ
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 19:04:54 +0000
Received: by mail-wr1-x432.google.com with SMTP id d16so12553300wrv.10
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 12:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gNuyaztG7WG0XECyfRAu1NlFkLmq6WFnwK6RpenhzSk=;
        b=Npg6A1E1a10kmmFESMxKy1SqF84MP3WhpDB4JM9gAU7qd4MB9Z69GK51SXZQlRU/MY
         SqJUW7jJa/PhNKQUYxyGteJLYUQSdq306+RMob512BiSvFZ+AH5mge2FwXNwTkv2zQA/
         f9e/djtjCOhGwoZuoXcG/bT7/p4BnkgWVXmfwN2z26XoQvYoFXr2SKB72DgjcQ+7j2O7
         JZStLlzfaBTWs0X8Os5HHab5COQZBOUnoXALUWu70rLfSPBQksy1/7z9arApMPObnSdZ
         qvAqOHE8VzLUb+t3X0Y3tO7w4jVaC67k5ySYZTr1ZUMwozxNjK4cVf0QaVtKIliP5n1q
         xwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gNuyaztG7WG0XECyfRAu1NlFkLmq6WFnwK6RpenhzSk=;
        b=rTqnTf/z0E3pJFHf/wabHtIQYlsuMbHN2rhhlaonUI7OZcYvZDLHJeDA4g3gEgXbga
         OuisnsPtQ/hYeNH9X+qZ1Vmc8Sy0suUTjh5zgSuYGwXks9W+vmHNNxWcm4jVXz/K7xCO
         Tiy760zJXLSqnt9se+psR7VXs25SE/u/lPYwXX726wbhup4aWxZRO+R/DwMHPCCtV5pv
         kkUh4cBDx1JK1PCFE3tYpRDzwXQnLu0cH55aXtt3mdwRno6KQkd5FDbXSig3rRkDegW+
         2cocM+aPAtuK3PH2J4HKGrK03hOd3woRLu7qanxzthDI3THElh1xBhISHXOEHKJZqY+3
         uKzw==
X-Gm-Message-State: AJIora+qtI2nGsVJTCDXJWJrrQNgew/Kca7TeolFySzKUcKyGfWZpwxS
	Bs917Cjm9N6AkGQqxDSQGTOLyw==
X-Google-Smtp-Source: AGRyM1sZnlUg7cRbAbZwdDLmnM+md2H39+NMEEpyyL3usCmFG/KO5nQimCQLm9NLNI9LS9XggnvjhA==
X-Received: by 2002:a5d:4b87:0:b0:21d:7019:80c6 with SMTP id b7-20020a5d4b87000000b0021d701980c6mr6132428wrt.234.1657047890925;
        Tue, 05 Jul 2022 12:04:50 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id d7-20020a5d5387000000b0021d5c52f4b4sm9912961wrv.34.2022.07.05.12.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:04:50 -0700 (PDT)
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
Subject: [PATCH 2/5] riscv: dts: sifive: Add fu540 topology information
Date: Tue,  5 Jul 2022 20:04:33 +0100
Message-Id: <20220705190435.1790466-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705190435.1790466-1-mail@conchuod.ie>
References: <20220705190435.1790466-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_120452_704989_DA05A0F5 
X-CRM114-Status: UNSURE (   9.37  )
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

The fu540 has no cpu-map node, so tools like hwloc cannot correctly
parse the topology. Add the node using the existing node labels.

Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
Link: https://github.com/open-mpi/hwloc/issues/536
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index e3172d0ffac4..24bba83bec77 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -133,6 +133,30 @@ cpu4_intc: interrupt-controller {
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
 	soc {
 		#address-cells = <2>;
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
