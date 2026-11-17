Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F982606A323
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aWFxEgHd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QZTyYsPL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DQLuYHs2kjiVPIISkUE9LTEMQnoGF4UY9j028ZjzbgI=; b=aWFxEgHd/0FP7fteZa5xsPNVwB
	LRwA7tMNtCB+r4G++ObvLbPmjA+WXHSZCRMKHkV8kEx29ZPIm+B0ZlaIsCWihZcBD9hftG5Zg6/lb
	5oy0Vq4eWDCegP7IqmwkZlGj1fnu6HfL+QYzHLRWOOwNlWu4ZQs+fEljRaYDdhWM+6cqWBnDKxSQD
	Rl33L0y0TjZQuT+FTjCyL62O3qX5SZK704tsn8RnIsRaoaplcKFp3PU5+FHCLXdxYmhq3pmC0XTc6
	BpsNMF6BLB5iVy7tAmDopuAqhchC8Yb+IPeLnaXUSGSAqBx2s2WDMupB/tYZQ0r/XWGzE0LPFqbdS
	HVcoKAtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIl0-00000005lxi-3Cgf;
	Tue, 17 Nov 2026 12:57:56 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIku-00000005luW-2rJg
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 12:57:52 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-3791619605cso8289114eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 04:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794920268; x=1795525068; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlelFqtSwzH7qLeRIoPSb1dB65eEiaq1xmBL8y2J6Sk=;
        b=QZTyYsPLUd2nAaHAUIYCLRXgJcjcYAnVUxMO07MKYKZNIYnk9AljJzF96dBsKatG+P
         LL7/j6v3MFC7p8tn8GD7D8WwkUTFqo51JK5RTu3MGBfM3TkBEuicclRS4Qfq6u0piblL
         pnPyecPT+GwUu59DoSoYGiDu6Aurs/rNZkzvOCLNad2sd2fIO9be577OdBfxiSP8TJQj
         4RZ35KqRr5fAoBJfgNlJsD0RumTA39S3l7CMSpBUuhMZQyfpLDTh5L8O8HZY5+Qw9nMQ
         Gex7e78P4pGqaDTsdA+V90X+PknjlU3TYBGv/Xnn98Ul1EX+Qz+UUJPeoCbzy7O3b2IA
         BN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920268; x=1795525068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlelFqtSwzH7qLeRIoPSb1dB65eEiaq1xmBL8y2J6Sk=;
        b=2iHpfpbPjP9cEq4laOl+c+Hx7Zzak4MMInhX4P+hbOdwduOJQTIS4a60PL7iKbfO/P
         ZHAx+Y8AfrBQRIceNV1XASEdhZ2HoHKWfSjdR4WO0oPIBD1T/3R9dbngM3VwgBIPnqea
         NjaIE+InaEFf2p5FjFNWfhABH8Kos3O0WllEQeR9f1b0PPpcTAkqrmcjhS7v7GW9WY+n
         +tJ3Rcpbz+8Lz6E+KvjmJhmx4C5SYzT4tRu94rn3mgIR/Ht2eYSGlimXUFHsPd0Wpvia
         8N0j65t+q4DS2Yj4uXuomDlQs0IAol3lDUDzX3ZdJrIFYE5ly6JH+0DGZkE+Kr6qc+Zj
         4RPQ==
X-Forwarded-Encrypted: i=1; AL+hErHWSuOGBUXyBvEi2TxuMk5h/0HwcBMPG8cdAwbeqexgah/AmeP5Koaa9Gw4AnZIq4QocrZ2mzEvbei7mg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8snpe86l4tzKesWxZvdpCNehG0pb2Le6My66gjGchSokjkSN9O
	2dSWkOu/LiWT3u2rag2NhIfJdhJCuIjxNAyenGh1pZhPruc1UHES1l2nJ/DqVt+2Grw=
X-Gm-Gg: AZFdTZfbVsnB3PJPeBJRXFPmAi7yS7xC5lHCcp1o78NPXoZ+jMk61KFHNH7NOdqn8bZ
	xgwNuglepvoYVSxHp3Adz1n+stNV/LcX/DBWMcvIlszN3mgyxFYdsPP92PTCAy9aUem+D6i8bMG
	+hCpmaNLSh24qnRvOzKzBuQPwoGNb3ToqUAinfvVjid78vv5nVEI9HVIZeX7kuTCLxJOGALXt65
	ma7ZSmnlAar26F3L0vPKh3Mw28osAjylMFgDiFzq4LeHfVWdrmrg8YWnc9cWsvl+qdW2Gc2GWu7
	urh5Y4+kjFT1QLfubuY2+iJeao1H5OOCZhhaSRf+bEcyaD5Z8a54xWOYmbpb3UGpDcGhyu142XE
	l+T92DuEmdzVukHdF8Frc3qMNYtO8McnzcyxuhdravtoJEB5AJI26SIYjrbQD38A9uVSoVWwNcx
	yYJYKMBAE7ayJEFo71yC2GFxbFHw32ESaTy7VlbAaZS1UxwrbKNzNBd6HCCAxRiVULkc0VVGOgN
	Kdw2+JlMpBpNOfW5zmCKRtVOzKpulBqLOzei9S438To+wqgA+83aSVG8d7+N5Rh1HY/XSkfVOTo
	w2DdqzALhs4qO9KqgVKxfChIBvNuXQQEpJ567zqtbrNY/yUrMhp+Nv0dw/q80bwPLbGEgotxn+k
	OhWQIVjDfhQbfJw==
X-Received: by 2002:a05:693c:4097:b0:36f:d53:cf2f with SMTP id 5a478bee46e88-379635648f7mr13425750eec.1.1794920267749;
        Tue, 17 Nov 2026 04:57:47 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::a1aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm44767034eec.11.2026.11.17.04.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:57:47 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Tue, 17 Nov 2026 09:57:15 -0300
Subject: [PATCH 3/3] riscv: dts: sophgo: cv180x: add PWM controller nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-milkv-duo-pwm-v1-3-3f1786ea57b7@baylibre.com>
References: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
In-Reply-To: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-pwm@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_045748_981467_95762ACC 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The CV180x/CV181x/SG200x SoCs provide four PWM controller instances at
0x03060000, 0x03061000, 0x03062000 and 0x03063000.

Add the corresponding nodes to the shared cv180x.dtsi, so that they are
available to every SoC including it, and keep them disabled by default
since the boards still need to describe how the outputs are wired.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index d2ec70fd515e..c478e7eb549f 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -160,6 +160,46 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		pwm0: pwm@3060000 {
+			compatible = "sophgo,cv1800b-pwm";
+			reg = <0x3060000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM0>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@3061000 {
+			compatible = "sophgo,cv1800b-pwm";
+			reg = <0x3061000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM1>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@3062000 {
+			compatible = "sophgo,cv1800b-pwm";
+			reg = <0x3062000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM2>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@3063000 {
+			compatible = "sophgo,cv1800b-pwm";
+			reg = <0x3063000 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM3>;
+			status = "disabled";
+		};
+
 		saradc: adc@30f0000 {
 			compatible = "sophgo,cv1800b-saradc";
 			reg = <0x030f0000 0x1000>;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
