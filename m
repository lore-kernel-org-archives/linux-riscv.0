Return-Path: <SRS0=ZJD+=OK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E4AC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 13:29:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0AC260F93
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Sep 2021 13:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0AC260F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DGgvcM8fyp9DXn1wFl3iDGYhI0jQ6ZjQCqlj24BCWTU=; b=jX72xV3m8JgaZ2
	K1Yp15krFN8EnV8gvddaQHZrzecWIoP0p4dT3YwFktGOk46RFG6zVBvAk9p0Ic1GE8Cpubn20SK4F
	WNX3LqpsBGJYuFCNVv8xW4jhvw/VsZmHdmru3fXqfuLWWGr6L4BECZ6ge8WpruXZyU6J6kS56r1eF
	StXLYbnQtOFfjtUMx8z3oh+fYu/LRLrf3y2nhi5y7d9X0dPj/89fbL4JUTGQ0f0Xa7v+bqzgj42kn
	I7lnItJK9eXfWsdrSKg0J1QnN/85jp5Vcu108xVZFJScvRk2ZStnnVTyXEixL7PsOkhQVqfUkAhy/
	TpoZjEnNP+1kAoFIuAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSJLb-001ltQ-7o; Mon, 20 Sep 2021 13:28:39 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSJLY-001lro-Uj
 for linux-riscv@lists.infradead.org; Mon, 20 Sep 2021 13:28:38 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A5F6C3F322
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 13:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632144515;
 bh=405kNu3dtB0zJ30yHuYcgVnAp+AYJ1QTK0vyYlLZaqY=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=NQdLJw9QEHoYLaDLev9ToUXchtqHQGvd8KwaKvH+08yotM8UNHx8Kf+N2TD1LSh0S
 SFFNumz0X/s364OXjyI+dIbJo4pBoE3dMA5+8GdTxQV6hob8dmlMPT/7nST0cw5CLd
 d+O/aiIePC5ip7COoui+qhQB+FfujidNR6ejfWi0CBabvwIeb94fnGmA4coDsQZ9DK
 01bu40uYWNPGQoyytINQ4FkNFGe357F3pwbaqmUmMJx8uGq+TvKYRWsXEXJwF5UNhS
 U5Bqvvh6neG4CaTVTJ3hS2Y9VTU7uaB9hHb/cmC8e4j3QMX3qU+CVwLmbPrkVxEsMo
 aJdMbZJS+mlVw==
Received: by mail-wr1-f71.google.com with SMTP id
 v15-20020adff68f000000b0015df51efa18so6070478wrp.16
 for <linux-riscv@lists.infradead.org>; Mon, 20 Sep 2021 06:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=405kNu3dtB0zJ30yHuYcgVnAp+AYJ1QTK0vyYlLZaqY=;
 b=wMb0IEBg2KEQlv6SqpjQdqU7FiEXW58HTmMsqgzpTBzS2n28+U8pmkw2xTY7nqLrvt
 /vQLSOmR+5deFjlNP9j4qZK2WXi6FTuryBu6D5XOUhU3/WdpZTy9cVJKj9iHeJZtLva6
 ps5oLHrPm7VIBnDlNdLtD0GRfHNjfVQ8RK4/2hG+8W5kdyNGA+mMT0PrYcdv29viJAts
 HPFo7uuitrZRm4ZCK/7g3SREomV6874PviYCtjrl3g9cy7ntxzUpy2mkcl/8d27ORZEh
 TbQ51mphdZn9ytvu/4txTTk3t67H6j6Y/9TXPNkl/a7XVjq+NmC/YUWhrle9bs45vYsZ
 MgJg==
X-Gm-Message-State: AOAM530U5kJ3Wju0KVtdo9e1PzXaEZFXIQEYfJ+x/togL+qHhDqD+ASq
 yufrAv1VruGgEpJJlFeEmbeLv02zJVccSXKADQyDb5Fo79j7bOyeHpXX96ht+Vr0Kf5XCHJjIJo
 0HqS+qpkpOJZmOaAYPXhVFo9Z50ZqlQbmKPka3N4b/xCfvg==
X-Received: by 2002:a1c:7201:: with SMTP id n1mr24134480wmc.19.1632144515398; 
 Mon, 20 Sep 2021 06:28:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn/S9tRY6RVjn6ynl0DulA8/tnIBG0wKbhfeCztIh58oZTCS+xiYF7PbLFUUBnXpyQ/mByIQ==
X-Received: by 2002:a1c:7201:: with SMTP id n1mr24134462wmc.19.1632144515253; 
 Mon, 20 Sep 2021 06:28:35 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id g1sm45429wmk.2.2021.09.20.06.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 06:28:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor.dooley@microchip.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/5] riscv: dts: microchip: drop duplicated nodes
Date: Mon, 20 Sep 2021 15:28:26 +0200
Message-Id: <20210920132830.152802-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_062837_157769_DCB065C7 
X-CRM114-Status: GOOD (  10.50  )
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

The DTSI file defines soc node and address/size cells, so there is no
point in duplicating it in DTS file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index b254c60589a1..3b04ef17e8da 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -9,8 +9,6 @@
 #define RTCCLK_FREQ		1000000
 
 / {
-	#address-cells = <2>;
-	#size-cells = <2>;
 	model = "Microchip PolarFire-SoC Icicle Kit";
 	compatible = "microchip,mpfs-icicle-kit";
 
@@ -35,9 +33,6 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x40000000>;
 		clocks = <&clkcfg 26>;
 	};
-
-	soc {
-	};
 };
 
 &serial0 {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
