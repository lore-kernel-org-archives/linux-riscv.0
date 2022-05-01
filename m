Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF3EC43217
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 19:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcYGp3/waZkFNBJ0m0gnzeTfCwBxbxE/HTtF2fryGu4=; b=BwVjGR3XZPSxsa
	+tuTtaEYCI/aP63uwNC0yTmJOhTPYVtfuhiyqjzYfmoQoyPxqdgiSqTJ4Z74tf971vS4NRfCsj047
	iv/g9UkV6GOM4FBpI0xLcpWA/pq9+ujBW80z7M33no9AHbI5qIvRKuz0madGrW64Td1xK6rvtY3dJ
	0Ne0u90bT1FtT0iLPfi3UqsOcsxkbUJqf4Rl8ENBCieJT5WX44QjJfxS9KSeWq1ULTAeU2uKArHVM
	thrdVUqgwqipwXSoUvtYsNf6vKhxcKBPBpW4SovVga9v8dZZzZzZSC0IVCjKgNjYL3Xz5GLgVBgcU
	qA+VpiARyIh9vcMqTDBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlFDJ-00GnGy-7D; Sun, 01 May 2022 19:26:37 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlFDG-00GnEp-Ak
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 19:26:35 +0000
Received: by mail-wr1-x434.google.com with SMTP id e2so17217143wrh.7
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 12:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u32JFIRC//emCZL/Ld3yABcbdL+d3UQ5fDlVHIQccNo=;
 b=sxzkX1VFhNqqe8n7RnKrQj+ftX71cZJmrTDXQ3Fe/e4H96I1o3xuYnj8qWRoBQV1U6
 2ckOvz+BoHOIAc2t2GcZCN6fW5ZKcsYS3QEPrUQvgHE+BOZbwka+DMH8hR02QqpU8otn
 YTmEzsG8pSOXfSxTAju3EmnUR3OTJILSBxeyaMu8hBXrQiyuW3ACk04U72OZZOlNCZx6
 hT2JnLM1UJZ7MGw4b6AILGpa2zVlCARq4TjrJGSasPVKcJ/H00yR47yhXoDDFR7HoqVw
 7iEOBooAl/R7y2YXUBrGJvkbHs8W8Fz30Oo6Nhhx0BTKIEcSs4ZEUM8GoYOaKFm8/+Ck
 F7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u32JFIRC//emCZL/Ld3yABcbdL+d3UQ5fDlVHIQccNo=;
 b=vcw8r1INCE40EPAQ4Ezds0XxvMq3AYlgKSgqWDprnFYNvi6+2vBKOQRL05RJAZ3Sbv
 /G283xn8gS5L2t6rmo3QhC5bcBEz14OYLOGaGgL6s5WzOjyJGDDWMCSK71kGKnIwtG6o
 P9oP97Fh02+4qsUicBxD71+ihRIzMuutyddAEvoyfpm4TIOIi4aam5apeSzScpD3A7Tk
 70WZ+/xyjtXrsmwIi5AkoXz6ZCwHWgApNEZLQxq6hQjR6qGMwR+ZR7ghZgHX2jfAn2Sc
 DKmuW5RidQQpAJxNnr9N7CvI+Ldi4on//bBtxxsPMjfkBcX+MzMKZotssTcw4y/V8dPW
 r/RQ==
X-Gm-Message-State: AOAM532zSo6UlTkkOOjo71I2uN2Er2ZEVNurliwUIrpWp4L0If/PglfH
 Ix/UHjkv5JuGxdEvO0afaAnAWA==
X-Google-Smtp-Source: ABdhPJwjsAF2UAJYsS2UgrYDNjZB+5ZRdRryVx25MuVXxb+axzDv/f0S36XNkvu/gzx9XmYDG8JDWQ==
X-Received: by 2002:a05:6000:10cc:b0:20a:de6f:3c48 with SMTP id
 b12-20020a05600010cc00b0020ade6f3c48mr7011148wrx.650.1651433191975; 
 Sun, 01 May 2022 12:26:31 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 i14-20020adfa50e000000b0020c5253d8c6sm6448105wrb.18.2022.05.01.12.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 12:26:31 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/8] riscv: dts: microchip: move sysctrlr out of soc bus
Date: Sun,  1 May 2022 20:25:53 +0100
Message-Id: <20220501192557.2631936-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220501192557.2631936-1-mail@conchuod.ie>
References: <20220501192557.2631936-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_122634_408716_3335A958 
X-CRM114-Status: GOOD (  10.67  )
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
