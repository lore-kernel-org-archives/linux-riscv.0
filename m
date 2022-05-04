Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC86C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcYGp3/waZkFNBJ0m0gnzeTfCwBxbxE/HTtF2fryGu4=; b=tvvTaMZ+rkjj6Q
	LR8BZChEbm205nIExCXmRXUnUxlnrbOfyPvWFewHT0SJDc44GrqEuIp/OJ4auH/CKSCOv3cg6IYa3
	NYmQPrKe7G14IROj1Q5o9wpZgExnydQ6JTf24c9oB1+R464XuICLBxesTbSZpMnZ2kgLusCKF/yCn
	EM3kSGjSZnLuvGf1gUxmQg4c111jcrR8huF1VJ8t8CRGtfpPlZqNQ1/h2ZrTCaLyPKbUeER7ldx+J
	+uuGed9oVbd8o1T34zwg7RI4fwvKIQnfslC7xDy+/2m2INMdiVRw1WagjmMiPLRNSzQbs5LODftHM
	lacJwAQ1sjBIngzxwdnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLiU-00Ca6D-03; Wed, 04 May 2022 20:35:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLiR-00Ca4i-9C
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 20:35:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id q23so3532259wra.1
 for <linux-riscv@lists.infradead.org>; Wed, 04 May 2022 13:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u32JFIRC//emCZL/Ld3yABcbdL+d3UQ5fDlVHIQccNo=;
 b=EqFAmxuYJmI2kg2xatXiw/7b//+XA/+XzJzcDLMsLcAOX1ovCEd1KFfehGAAlyE/4f
 xiEsAoP4ivzt5ag/BNffjzP+vfNzGXwAIK22vNZQHW+NcP7O09lV3mpCC7Y6loIiONrA
 TTsShcURvOoV0uUpDVoGQAxc1Bl2gAypo/gfEHlcSVj5tO79VuX+dc+7lB+A2Y42au5l
 H7WUi6m66kT551TvD/5W6zFWyscv1V1s17bypijpwcglt/NXM9J0zI3zkSpgFPF+rZVs
 ZbH1OXkxjFCSbAD6w2PvEQE0c1NTq4S6bPHM+Pn78i4aywVaF3Meg/7ZOF1rAk3WinHd
 YsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u32JFIRC//emCZL/Ld3yABcbdL+d3UQ5fDlVHIQccNo=;
 b=CDdV2JFizvAHISMFull1QHhw70DJ80Lz3zoufqk0udCE1gfsFTwvxmw292IgOc2dup
 whQ8I772AyIs8eXOhSaEieLItkhKq1b2kaSrrlJpi2hg88C8yjRzbc4j+q3Yuf3fKZ+j
 W6UDK1h0HbQN9fNvLjbI6qeNfe97wq2j0YLuUzCeblskSFg3NX4HTbLWZ9k8bgXKBEGR
 F6hqpChJGkGCQVLKGgc8EaojQwbwbH1CcoURJHZZDwymTxK+ZatrwxDnPEYjt18sos7v
 6Mi1poTXMSacLbDOWSQkQ2IySxf0+ECPM09HJ7nWnQIMwD57WrzoVJm8eRtKBDtkPiwy
 pZmA==
X-Gm-Message-State: AOAM531iNAqmJANhY66ChOEPtMwh35HESv/s5ehcGktm5qWWW2mi7Gk5
 GalV8h+m6uCHl2L7cTR+sLnxjw==
X-Google-Smtp-Source: ABdhPJzdiW4qElFhKIrkosBG7ULnYOtaYvUC52RzTtbzq9l2iyrkPzwTsFVvo1mh5bSHLcpQlZiRLA==
X-Received: by 2002:adf:f6c1:0:b0:20a:c408:4aeb with SMTP id
 y1-20020adff6c1000000b0020ac4084aebmr17411494wrp.74.1651696514483; 
 Wed, 04 May 2022 13:35:14 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 l20-20020adfc794000000b0020c5253d8dfsm13330101wrg.43.2022.05.04.13.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:35:13 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de, heiko@sntech.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/8] riscv: dts: microchip: move sysctrlr out of soc bus
Date: Wed,  4 May 2022 21:30:46 +0100
Message-Id: <20220504203051.1210355-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504203051.1210355-1-mail@conchuod.ie>
References: <20220504203051.1210355-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_133519_362548_833214AF 
X-CRM114-Status: GOOD (  10.90  )
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

The MPFS system controller has no registers of its own, so move it out
of the soc node to avoid dtbs_check warnings:
arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dtb: soc: syscontroller: {'compatible': ['microchip,mpfs-sys-controller'], 'mboxes': [[15, 0]], 'status': ['okay']} should not be valid under {'type': 'object'}

Reported-by: Palmer Dabbelt <palmer@rivosinc.com>
Suggested-by: Rob Herring <robh@kernel.org>
Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 746c4d4e7686..bf21a2edd180 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -146,6 +146,11 @@ refclk: mssrefclk {
 		#clock-cells = <0>;
 	};
 
+	syscontroller: syscontroller {
+		compatible = "microchip,mpfs-sys-controller";
+		mboxes = <&mbox 0>;
+	};
+
 	soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -446,10 +451,5 @@ mbox: mailbox@37020000 {
 			#mbox-cells = <1>;
 			status = "disabled";
 		};
-
-		syscontroller: syscontroller {
-			compatible = "microchip,mpfs-sys-controller";
-			mboxes = <&mbox 0>;
-		};
 	};
 };
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
