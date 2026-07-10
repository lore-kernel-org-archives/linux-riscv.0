Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27448C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 07:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wn7ngl00rlEdRcHy0m/DXmHdFSldkCAbVr2Ks6vU/WU=; b=mPEzzG9hFybdJ2
	S/+oJrov1AbrHrKGeMAWocjVt4FcHA87knd6JOAdH8zpK0MwPBoIgDip3ms61dWudS05AKvXgTNOu
	z227YUVwVXsh1M0UnQtrzac7C8b/izjw3lOm+NUqQEauX8l363GuyX8Octi7kvnH2JErae9K763Kv
	14Vn4JRRtM8PmjjWP5p/ITiO3eB/Rt5nNfdy9Y2suIwnB5/Q896J0EV66q6VYam18YT/6xHXN9g+H
	7AhJlP30+XgrkJjrOvi8GI5RY4oodzH27xGVTKS55h8zQIT3IrbTfWYuFbRVQ3OQaewgkQZ2NTZhm
	gvnV4ZB0NuPsPBBXQwtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi69A-00000004Oso-2I3N;
	Fri, 10 Jul 2026 07:59:44 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi698-00000004Orc-0cBE
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 07:59:43 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-384caf7b168so130664a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 00:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783670381; x=1784275181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNHx+OsQYG/KhT5bcVFP5J4XDttscJh5ndZrWTFJRcI=;
        b=j3lrMwV0C/0ODb6fRMpNLI4BvGYJJn45/IjmrX9n4rnqqIN409jjRk1c2DmT/WfoMU
         FFJSLLw47wjlIET2aXLqIinkrjk8h6HFZsI/DABUth+6Wnd5BbQv0bfeSmSYiv0pkOmM
         2wRAgOjb3R2OzrAWjz553zupeEbW0iCsmizX6dpJvxHZTSOxyk7MUeKF/BiUjJC7OyiA
         97dLBsh3KxvZON0uBflil4stxUI/yabBMoQuk4Wt2btTAFu+R1TTZiVO/I9/GQOaKHHF
         FYf/icz4Pq6+Ho5GN5ypoBg4JUpEOFUNxNO7m+Bvgvgaz1cdNtXzhp+QIQ1ysS3E76b7
         FSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670381; x=1784275181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNHx+OsQYG/KhT5bcVFP5J4XDttscJh5ndZrWTFJRcI=;
        b=KO0mL4cKbOuCdzsJRzYG7Mgyrs3+s1biWw/Ydjj1V8wAkC1XOu4luB9OJHlOUxqjBr
         6IjH4WOIZhBz3aziz0pEcb7TjeYsLl0oyxcHXKTT7EYT9VuIqP10cGDw/jKYivFneLZn
         zht+NHKLoLZdT4diu26oi8XVLPUCggFsrx0wzcnzMlEsOEl1vNwMlvy2hmbg2nm06BDc
         8J6iGknJTvAAOHPf7KnqE3S7XOQf30TpW8eTHeQzBnUD79BZnIUMlYAChBDpZuuAK/zz
         pxmSd3RRjO/b6ZMdgbs0PIcTtacaLKA6zdjDznmVnmtBfyJoCB1M6HX0HeKkqkdFjNLv
         D7Og==
X-Forwarded-Encrypted: i=1; AHgh+RrZi4Fb7vBjLjQGOpJTNk6L/PjoMhBDx9W29wKpvxE304yqR6yhhT8yjO2ceNOv23/s3Jq2QuN423f2yA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/t6ydo7R2fqjeRV2oxZ02Q0vdSYZ1A6TW9e+OofPZGGTHPEyt
	BtA8qdliGMtqU8n+UbNJ5BaEYcMQYZQScAOOPhQ5yoVawKA0H1fuyYFm
X-Gm-Gg: AfdE7clLmxeOGNhmyMD24JkEC0zP4h6d5lVidThIYJqjd6rlSSxvf4CeypvhoWvI35f
	1UdxW52W0V+WXyawE/5dQ+hekw8sGqUJdMstD5TmGON8f+fAlIetBpsnZW8YIskPwLAOHY6/4LE
	PcPe3EmyO80PHnj+szwYHIyjLP7flBLgOY5q2NTte54gXCy55EurU9kA8JheClxLweQMW/6sfVT
	DOWsMVTzkF4KnL3eg1vlGfsR3LyYhRhVEK/KNWW9ss9VY0l44BlMjEjDkiCthXsF6/lS/UXTHlh
	qmkVLE7jwVt4csPYqKxi/7Ej4o13ILMdlslq3kuvA2rydHeDdYJdovzp+A/GRSuEDtmUWUSSI/w
	ErwC8Ml6iiiitSOw9VxewoXE03Ux/0s8uCljfroXpntznMIL8U1oZa18pJAhX4wBt+yM0+VbksC
	qMfskkO6RObr7lszU=
X-Received: by 2002:a17:90b:2f50:b0:37f:e8f6:8d4a with SMTP id 98e67ed59e1d1-3893d33a814mr8798226a91.0.1783670381465;
        Fri, 10 Jul 2026 00:59:41 -0700 (PDT)
Received: from chenyou.. ([140.116.78.205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm19044999eec.26.2026.07.10.00.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:59:40 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
Date: Fri, 10 Jul 2026 15:59:16 +0800
Message-ID: <20260710075917.159969-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710075917.159969-1-chenyou910331@gmail.com>
References: <20260710075917.159969-1-chenyou910331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_005942_185629_93C71B0B 
X-CRM114-Status: UNSURE (   9.22  )
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

The CV180x/CV181x family has an additional DesignWare APB GPIO
controller (PWR_GPIO) located in the always-on power domain at
0x5021000. Add the node so that boards can reference GPIOs in this
bank, such as status LEDs.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
The base address and interrupt number match the vendor SDK device
tree (cv181x_base_riscv.dtsi: gpio@05021000, PLIC interrupt 70,
i.e. SOC_PERIPHERAL_IRQ(54)). Verified on Milk-V Duo 256M hardware
via the onboard status LED on porte 2.

 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..25ad2bd265d7 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -160,6 +160,24 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		gpio4: gpio@5021000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x5021000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			porte: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <SOC_PERIPHERAL_IRQ(54) IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		saradc: adc@30f0000 {
 			compatible = "sophgo,cv1800b-saradc";
 			reg = <0x030f0000 0x1000>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
