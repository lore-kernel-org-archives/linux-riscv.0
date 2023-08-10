Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B4DC04A6A
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 14:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPUWlrQPHxOgk0sVU6xTpsjHLCdfobkuQ/4OHTuKRhQ=; b=RifRRe6WJgP/uo
	Fi4G9RQwp7y/WvbNZ3W+PdFHbn1YtI6S/sPKteowrYQW3q2CMWEbUdZ/WIV63/xz5JaQXDavtwcf2
	9B7+GakiriTQKw6OJsNn/TWkvdxAmfYQgFS0HqAkmGd0JLWkqYJno7SViYjU10+5/STzn7eTkWOlL
	L50XAJCjAb5+8t5gkvNhZ9MrgEZDXpxDA+kAj+4Oq3AeOGGTAPG8KvG7iUo02zeI1XfG43e3P5l/a
	WU641svBIdEpS8sgpx/tzV0PDGrTOzGhucYA9gmomAk+gpPR04bbJ3NUcaTk0UgaYS6sGvbfl1oF+
	PzI8MPHo97E0nYpbMbtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU75g-007wQ4-0q;
	Thu, 10 Aug 2023 14:56:44 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU75d-007wOC-0g;
	Thu, 10 Aug 2023 14:56:42 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe8c16c1b4so1473777e87.2;
        Thu, 10 Aug 2023 07:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691679399; x=1692284199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pjgEmaLZWbZLKm+zTsTjeEOP7/LCJvRIUhdiZyAT1I=;
        b=NblbJO7/2Ss674guLQHVjj8RzFXtFbwGuEzHos0GJr94LzO88o0Iev47abuxJLfP4y
         g+8Z6r0kL6ByXiVbTnkfUkRXH+ji09/lMHqwT9cTlD4+YU3jP6SCA4O2rIcE3RtE9OGT
         +NgolV9kq/VPKDREHjuQ+7kVcLuQ7Tk662uuVQVSyUIH999syuH/Y8hicQcoFyYUlHa/
         cbGGoZSBpeE91tcpORHnz/7mU39Cn8MaztKKLtrF1NNimy6g0D6sTmd4uk/soqByzQC+
         Ws/iq/BXsn/Mhwgg7A7tz8ZgDvBRI8puL+mguwKRVo2YKgBkjQdVS8GsqDBkh6iQS0Y7
         TOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691679399; x=1692284199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9pjgEmaLZWbZLKm+zTsTjeEOP7/LCJvRIUhdiZyAT1I=;
        b=VRk62bBhdITrUK79L3LMWh1n+UE1fKOOiktO60skNjIHxHu/1uKEnOFZP19qKdNIQq
         OA+J4lnmDD3x18sh3Sw26wItU2AUQkWiKyeBgD/BAKX+GFT+ruvL32/TD55UtgDsgmmC
         ryvF9hZEcDQNOpqZUgpFxAne7qm+tddB//VQYDwDLFJswWR342SVwGymn2nxvJHLRTl8
         S1g87ffYbrKoQYHkrqQWjhKruSQ8hOsB/qq+goFUiy/sQg4t0rvsoRYT7LLMiq2fWzrl
         1B3w0LumHKuevuqpDcEcB/csEAQtPQO4TRMUf/1hk4yiIYISBY4q0VT3ZPtI4wnW3x7s
         DHSw==
X-Gm-Message-State: AOJu0YzDFrJVMBCUpUTUpWlxiWhkmmNJblpjrxvkyCHUuOsWFrBUqOrG
	4S5V5k2Y7QaMajE7NhaGqA==
X-Google-Smtp-Source: AGHT+IGc4D1yN43d/fMmdFFXBfx2I/wJfkAD5m7dIiQY5P19trltKvl/MLc6FmifEgRKE5Q9FmWa6A==
X-Received: by 2002:a05:6512:1093:b0:4f6:1779:b1c1 with SMTP id j19-20020a056512109300b004f61779b1c1mr2878454lfg.48.1691679398692;
        Thu, 10 Aug 2023 07:56:38 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id p12-20020ac246cc000000b004fe0de39fddsm308496lfo.290.2023.08.10.07.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 07:56:38 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Thu, 10 Aug 2023 17:54:28 +0300
Message-Id: <20230810145443.1053387-4-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230810145443.1053387-1-privatesub2@gmail.com>
References: <20230810145443.1053387-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_075641_252780_F97B1340 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, linux-sunxi@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

D1 and T113s contain a pwm controller with 8 channels.
This controller is supported by the sun20i-pwm driver.

Add a device tree node for it.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..e24543b6aff7 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -127,6 +127,17 @@ uart3_pb_pins: uart3-pb-pins {
 			};
 		};
 
+		pwm: pwm@2000c00 {
+			compatible = "allwinner,sun20i-d1-pwm";
+			reg = <0x02000c00 0x400>;
+			clocks = <&dcxo>,
+				 <&ccu CLK_BUS_PWM>;
+			clock-names = "hosc", "bus";
+			resets = <&ccu RST_BUS_PWM>;
+			status = "disabled";
+			#pwm-cells = <0x3>;
+		};
+
 		ccu: clock-controller@2001000 {
 			compatible = "allwinner,sun20i-d1-ccu";
 			reg = <0x2001000 0x1000>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
