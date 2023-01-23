Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F7AC05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 15:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5A9qRiP499npVDHNxY1DmQM7/5cSspM82yoauSt1zAw=; b=mgZUhXJ9PuH++c
	qy/Aepv9U6eugdTCweKPnImiAQ/6tcBvIrj7yaewrEHcHchd/9ej8cbuIpQXJtoYPqpZ41VdzfZz4
	LRTCOWLqnupF6c4biIjd7BaHe3bQew1oE4xGWBN/nt16GKhMavHL/bq2Vxp/R2CfpVQYANIfvz0kw
	YwOYTjkstE8/Mx15itfznwY1Mv/AG6XdxQQQollLEAKI3wpQ2IYDVh/gnMfsb/sxpQrmFva5BDmgP
	kuItd/Wgwf10RFUxQAA66obKGrIsqOIF73xZjU+Yo0SQudzg4CVNqg+aMbQQ2pTu9LiJJ9za40Lhe
	nCaLnDe4qp+xZGxHFWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJybl-0008Vj-7j; Mon, 23 Jan 2023 15:19:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyW5-0005hw-2C
	for linux-riscv@bombadil.infradead.org; Mon, 23 Jan 2023 15:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PQrsbaoWMRqz/6zcr+gxlvsS+z2BwQ6sf3IkSGfrHIg=; b=a7mLNJGx4sU4eow0MSJ5+ho1P0
	nj5Lj2p7sEWg9qoBi2hUNWnhQyAC6V1WB8Ni5TLgXzPs9griAgOjXH6fi3jNokAJgcKyy2irGnOM6
	B+T+dMDKAdRd+tY9K88Al9Q0fXz1d+TcSADfT8Mymqrvzc2HUlYyligbm2pjd4o4tSbFUaHJ69pvy
	m6EnQPe+q1+R8/NV35xxJ87/HrWJlgylHD2rBmfHgYaVhObcmUrBAhu1/09A3wBUwqOh5K7w/3Oh5
	Lxo2UHnn2YpFdAKSC2kQmCfO6d4B6CVoalYX+utvJEpZ0xyTs+VhuWFtY3eVSehR1jao9UnMIyuTI
	Yo10GnZQ==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyVy-004Jd3-Ce
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 15:13:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id y1so6623177wru.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 07:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQrsbaoWMRqz/6zcr+gxlvsS+z2BwQ6sf3IkSGfrHIg=;
        b=DrZkJqf8Lx/ikr2BhspNugPkwAK39BkOWz2sYI9KIsWgPfrmz3MxCIAlThf9eQMRoU
         0jFC/YJ/sI0ZvwfIPyUKQOcYKAjNBgQZ903EVlEmHIJERffJSuQbWtWQOQplD4P6xzXT
         vjbQhlypnRB9rEdBr17ZgPxaIuIfR28dVJhRctEPx+xF8mt3sF7Xn9NHD/tFZthCCP3J
         N9cjFd21wGYV/rg0RlP7ggPd5GuxBxGv3h40ZGahorcp0z8jWPFrnpEgdSfOiixLtos9
         M3vRGjxu6YizEJCkQmiusSvfeahaywTgfrHTZygFlKjEDsvmsqohvwqFgejQlMBcqr7Z
         7qeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQrsbaoWMRqz/6zcr+gxlvsS+z2BwQ6sf3IkSGfrHIg=;
        b=h35gRAxPIcPFBIXwY6gI1GSKBoJISSfHJ3JJkFNBv/66V0JfesG+mXuL9ot3FcZZ4m
         iYduHih08prVbQlIU4fu9H4D7kyr4d+9qXJcuQH/9NVSJWowaa0Ff7lo3k4OK16SfIUb
         NQ/WWbjK+gBkl12Y8HLVYLxfAluShq5DRVq/JvyTeS/9/GE3KoXHU7ELG9ZLiB1Yw4Ol
         DnxxcaGt4JstM6Z4dr1jyFa2RynYgR/8oG5h5V59jIl4xKFRPNYnkqSbdiNeWlRMw0MT
         m2uN0OlsLkMuy6dtdlQw7FUGMVEd3QL4IxBoVQJYa9JxAxzuyismAhx4zWAUk+hM7fPY
         H4SA==
X-Gm-Message-State: AFqh2kq9VtBUCOsLlcJIEF6HXB98n63qn5vXshIm7Z7+nh5BV7YIUG0m
	hJHiJNdx9bn17WsQ9zuGg+hykQ==
X-Google-Smtp-Source: AMrXdXs32d96ovFaMtHszqx/rc2fx1h5rF19uqq0L+W7R44WRoQBW69g+WiSqNVd5szTAMO6f6ULYA==
X-Received: by 2002:adf:f9ca:0:b0:2bf:9424:c163 with SMTP id w10-20020adff9ca000000b002bf9424c163mr9542845wrr.57.1674486815043;
        Mon, 23 Jan 2023 07:13:35 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	- <devicetree@vger.kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Chester Lin <clin@suse.com>,
	Fugang Duan <fugang.duan@nxp.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Pragnesh Patel <pragnesh.patel@sifive.com>,
	Le Ray <erwan.leray@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 11/13] dt-bindings: serial: restrict possible child node names
Date: Mon, 23 Jan 2023 16:13:00 +0100
Message-Id: <20230123151302.368277-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_151342_997031_2F9041AD 
X-CRM114-Status: GOOD (  10.66  )
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

The re-usable serial.yaml schema matches every property with ".*"
pattern, thus any other schema referencing it will not report unknown
(unevaluated) properties.  This hides several wrong properties.  It is
a limitation of dtschema, thus provide a simple workaround: expect
children to be only of few names matching upstream usage (Bluetooth,
GNSS, GPS and MCU).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/serial.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
index 11e822bf09e2..21992e9a3c2b 100644
--- a/Documentation/devicetree/bindings/serial/serial.yaml
+++ b/Documentation/devicetree/bindings/serial/serial.yaml
@@ -96,7 +96,7 @@ then:
     rts-gpios: false
 
 patternProperties:
-  ".*":
+  "^bluetooth|gnss|gps|mcu$":
     if:
       type: object
     then:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
