Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EB4C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 19:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SkCW/yKmaE58ncU6Gox9DbwocKMSUjt13Ti8pRqBxTc=; b=kRczbBz+Kw1HbU
	0PHUIGXBbHbyRjvryI3zeOQkb5SW2KNNEdhUjBrKyTuDfmuG+N/0l0jGvKuu7QEfzseX+ICsD/Wd+
	8KQKCIw3ltE/XlLD4DEVLqoNNLoprs2pIx281DJqmdsDRXTiWrpQhwo/hpzo9OXvsO0HoMu2Ws0vS
	1rQA7VUn725MLHrIJBIb1uAtuGTkgXJ/B05L4eocIryXTY/S0n1MSQl7l96+iMnRqIJWFmhVuK4gU
	ZB2cYEsSHvubwLxQJBT7F5XoNJu9w+t6v/ZekV69RUGWUEsJak1i+Qr9IPYA9kfRFUEnQbOUpHkCM
	GmMnO7xNtXltC6dRhIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8nr1-002ERD-8r; Tue, 05 Jul 2022 19:04:59 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8nqv-002EMY-Gv
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 19:04:54 +0000
Received: by mail-wr1-x42f.google.com with SMTP id h17so5719998wrx.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 12:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ia61xjYZRZJlY+9xb00BGdCtYvU+CPGhICs6f5ZBvAY=;
        b=LgY3wj15rZfyPkNFwy/Q/05dDlJOgaYzX0JTd0xz7r/ylNZFU6sm8GCVNQ2urRAVdm
         CkscfoU23VZ+NxtXrj6d1CYcK5/gqnhrW6BraIrqUGrymi2gro2CDc5rPQmr7D8x5S1q
         IIXzb7QwpcDzFyyqHAC/hmNBNEpXIxhuEKa9OVvi9S8siKSrSTl5DySskUngGK4T0/wt
         CL4huuFlUJFA68LQHfh6XwxZs7l1MXp/kXCnzlX1lck+s3fQ7DCQ2Jak74KKrnW52WsY
         okuchUG6xc3pPxY4ap5GCU8TcXHvCy3l58VQQ4CbAdEsCLNecF1COBWun3N17gYEaooA
         D5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ia61xjYZRZJlY+9xb00BGdCtYvU+CPGhICs6f5ZBvAY=;
        b=jKf8omKeGiYvhXPuARBuzTIHUCVNVwZ6Zjv8nn+9i84CLcCAQ4NiRFZioj4Bq812dg
         KfkERvrBe5F1TfE34TUU2Lqe6QX85EaXM5FKOVwDE+82uIUNCsiNMaSgkaP3nxb5psUx
         5GKbeRyGsoVrSV9LIWyQ7sAfCQTngJPq3UJ/3B31XgEoOD7x0wvXK9C/Nvm/DpEPeR8C
         OISdfhxWjPi3cIiybGYuyLlBrUu+RZO9OQAPaqwlTKzscwvCM1anh54vy6XJfjfZIchb
         6j2Uo5Kprfl+bRXKVy5It70tEvJncLMO06QuzTxY/4app1HL5UqWy+oemuZ/QWE7D9Dn
         5cnQ==
X-Gm-Message-State: AJIora8pCnSGAsr/aM9c6fLbeHaGvfTieUa/fKxB9Ye/xC/QTNJZYPQO
	+Hrg5BWXnUbmA9hheihcy9DyHA==
X-Google-Smtp-Source: AGRyM1tfUrutzCcev1jR0MNPW4nQzPfSNDQNeYJBmdJ1xJzSas6+URz89sHyVueorcnGMkr2xdlaUw==
X-Received: by 2002:adf:fb46:0:b0:210:2316:dd02 with SMTP id c6-20020adffb46000000b002102316dd02mr34750910wrs.557.1657047892078;
        Tue, 05 Jul 2022 12:04:52 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id d7-20020a5d5387000000b0021d5c52f4b4sm9912961wrv.34.2022.07.05.12.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:04:51 -0700 (PDT)
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
Subject: [PATCH 3/5] riscv: dts: sifive: Add fu740 topology information
Date: Tue,  5 Jul 2022 20:04:34 +0100
Message-Id: <20220705190435.1790466-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705190435.1790466-1-mail@conchuod.ie>
References: <20220705190435.1790466-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_120453_599404_8F6F006A 
X-CRM114-Status: UNSURE (   9.47  )
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

The fu740 has no cpu-map node, so tools like hwloc cannot correctly
parse the topology. Add the node using the existing node labels.

Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
Link: https://github.com/open-mpi/hwloc/issues/536
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index 7b77c13496d8..43bed6c0a84f 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -134,6 +134,30 @@ cpu4_intc: interrupt-controller {
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
