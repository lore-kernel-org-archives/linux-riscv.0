Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC47C4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 00:53:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2030361B48
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 00:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2030361B48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4P1NdqqJI0pJIE65bWD8jsbQgsh1KNAr702QqLHJbA=; b=EuXI6r8BW+A7/w
	aaECIWqT2JK0ghTp0ofYjfiG3h1GRaTcLLG0K7tm3Dwm5BLvO8kmnOyYspZHUWSKRwdYY6Ej8E9WU
	I97du09zm8gqegQafbgfChn6ZyaycX8z4X0bTuOrp8+VWWP1oT+AFthtFuM2vqIxwY+lOyaQ01Sns
	u/j/OqgV8km71zhQlvaPmvkPFyn+dNXKYz0Rei1XEMshhHJWLeRZTwK12grT+iKwr3FH8z/CSmQs8
	zaxQkKSY3NVIVNY7r84ENIG4v/VtNqTlnGuQSjLxMiS3pYjtjTbLge3waujFWjywBm688yVhhPLGz
	TClOm1HPWSOzQBzrdMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmmj6-00HTyt-8u; Tue, 16 Nov 2021 00:53:32 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmmil-00HTrc-0t
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 00:53:13 +0000
Received: by mail-pl1-x633.google.com with SMTP id b13so15972901plg.2
 for <linux-riscv@lists.infradead.org>; Mon, 15 Nov 2021 16:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UnxeX5SYnUNt5FPPR3XcURZ6ym6nyt/1fGq3kqylBIo=;
 b=CC3HnIyUpf6TTi09gUPg+7d9css4arcQA8It4ZEeFZ2VNEe1SZekRoEqUmB0vWAK3J
 FN3Khy8n0wXZJNdNYvG3WacASROQtnE271NnW+qqU3AzrA8XTP32o1xlHaJPCro3v8ih
 Ds3RI9/TchtvZstY9GqMtYJ3nLVg4YrYuLhNJ1n/lZ+SssTqJASpuVHB01LQLi3iDDJt
 Qh5a3tAxBkiH9g1FzXK6YFcIoZzjvmE8uba7Tkt79aGIpoeX3RKaG1w42fR5M5Q4sqOu
 yiT6AUDn/923XU3Ex+dtzHWaFzeTnmNjPt9bHh7kIbAQysFRnZfs+5HhhpUSfN1GChz7
 zeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UnxeX5SYnUNt5FPPR3XcURZ6ym6nyt/1fGq3kqylBIo=;
 b=PzcVc/WtqKQjDrNqaHRsbmIuoyAUV1i8VoqbAR/d9azN6ww78a8nG4iGjmy+F+YbM1
 Q/etrqHk3BUT/viu2tmGsF5zKNNbhP4hRDjuajWgjr73bhWKs55LPtYWnHE/XTOpSUtQ
 nVrpg+J1z8e90J4FtsuJKvboCMGsO+MQbNjUq2eUsoEzDDXfhfO2c3LiYlC8+U7ICMeb
 NV5DqvMIzDELNJGhGBhHQj0i2iP7bTN9BILdspaB69Dzxn8WlruEM7f4jiZDPRI0VH4Z
 8WchchuR78Q2/cfB9V5rKHLCXgF3KZFQzC1fQA3WBC6HZOCq1KKMQogPINV4rgl6eTHL
 fXQw==
X-Gm-Message-State: AOAM532RiHlQdPBEH7idk2WMoh5i2ky7XUN4VYPCjRwIMwTYkbBZuZUz
 /jdohqzmiJDrNEce/m7ltZU=
X-Google-Smtp-Source: ABdhPJzxmzvjNq5ymfML/LjS8AmV2qUVIsZBDxqNdE4sUvDg3GLZvDShmmhsiZziWYbhiWg/XLmvwQ==
X-Received: by 2002:a17:902:d4cf:b0:141:d36c:78f6 with SMTP id
 o15-20020a170902d4cf00b00141d36c78f6mr40922853plg.56.1637023987574; 
 Mon, 15 Nov 2021 16:53:07 -0800 (PST)
Received: from localhost.lan (p4899162-ipngn25301marunouchi.tokyo.ocn.ne.jp.
 [122.18.9.162])
 by smtp.gmail.com with ESMTPSA id y7sm12493381pge.44.2021.11.15.16.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 16:53:07 -0800 (PST)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id 8AFA790095A;
 Tue, 16 Nov 2021 00:53:03 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Yash Shah <yash.shah@sifive.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: [PATCH] riscv: dts: sifive unmatched: Link the tmp451 with its power
 supply.
Date: Tue, 16 Nov 2021 00:53:01 +0000
Message-Id: <d04daf5956ad61496188c7aee3d2eb958e34d7d2.1637023980.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
References: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_165311_114453_D570B0DC 
X-CRM114-Status: UNSURE (   8.53  )
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

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index bd6e90288c8a..73c1e4adf650 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -59,6 +59,7 @@ tps544b20@1e {
 	temperature-sensor@4c {
 		compatible = "ti,tmp451";
 		reg = <0x4c>;
+		vcc-supply = <&vdd_bpro>;
 		interrupt-parent = <&gpio>;
 		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
 	};
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
