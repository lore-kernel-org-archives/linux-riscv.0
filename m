Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAB5D4663B
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 23:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0KtnVbzNtOaFyk2ctBfdeJlT2ACN5maEZt/ZPC9P/VQ=; b=OjsaNBUUs1REzn
	vpyjSPPg1d1VdgCes6g9GHM3qwndBpSg7Eda8FSkKEUgESg+UoukUz2mCSGNRf7H1pbb2LW95Bpjl
	Zk3v9gdUqB7dn3V2TLywmYPxfz37poT57l04Do8acLS7HA+FKP7ww1kz6SNpcNx5tVBXO++bIljq0
	zuIfTiowbHaOaqq0/MCzQ9tMA6rw1pAAmCKXVJhvgHf7kIsehb3govICJ9tyYNy0awxts102m+7WS
	M1QkBzeZ3+oRTWsewjV8yz7lfkKF8qBhd+WykvByxqVhyzrti0aIoltHvjkAqgBLKFTneGzm+uPwR
	6L2VFQ4qOez8AbOXEsWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzS-0000000DKME-3vHh;
	Thu, 15 Jan 2026 23:42:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzR-0000000DKKv-0744
	for linux-riscv@bombadil.infradead.org;
	Thu, 15 Jan 2026 23:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZgauUMDVjNkmmnUZThthivYhABO9DN7YXuMbhZ6n408=; b=aNd5YASfm6QJSU0hLY42vtUBNN
	3oT8lIeDoHILjkde5d+3XvBWj3YOy13/jn81Us1qTta/oX4MZSNUGHzl2k7vxahtZUWq5zPRrMyPw
	sL+HBraKLkaj2ztgKxUIijzx4edSawmcrKlAggi/Gyj/oA/4YzEVzU8tMJInjXxj9J/Sy0mh0uynb
	Z2gPBdOhtg0wZjq/XjInzdWEtkfduMpfvOuWhQxYRaTGTbBMR8ReXdyZ03+hlXGcJvuR6PD2/zc2w
	MdZCR+DxsmiEZey3Q54mbQJn9o4vvyiE7KQ2h3qW4C3AI93xarQ8CP+NF70f1+3aLpUjaFHVvbJr3
	0Fs5Jejw==;
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWzK-00000007o5k-2nOH
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 23:42:55 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-78fb9a67b06so14328577b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 15:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768520568; x=1769125368; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgauUMDVjNkmmnUZThthivYhABO9DN7YXuMbhZ6n408=;
        b=IZYGdnKNCriRu2RRfK/XzK5rEfEyzswCuE/zxm9/ipf8EYa9I+vfuMd4Lf7+gS13zX
         s3TjsH9GLMv521r56WpEm+1SBLvKWOBjPGOPs0RULsAuht6eFxz3ZGwycwHu0WkhwdJB
         DhCjd3bVfL5vbwF8Aynymt/vhwD/S3NZoAeskfhdmPG0Pu3j1o8THT+csLrfzFTniEXn
         P0Xeic8cYqWlfJthjVXahQaQG02O272ELYehrx1qa0YFMUEq/Ku3hxmc0ehaUYu6tot4
         ZhqwzLMRsOwNUXWPMnEqlbhNLF286SiRAFaO5GJ8HXtIpOpZHIOSplA14qGvmIPoSCgI
         5I5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520568; x=1769125368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZgauUMDVjNkmmnUZThthivYhABO9DN7YXuMbhZ6n408=;
        b=CbrM1EgT9wNExOC2K+Amc39PgIY/+afLLEFy6XdBZw14BsBP4YyqtgAZIkPR6bpFdF
         M9Mvi/dyDPEAjjcv0hTMDe8/wKcVbOff3czV+sejRfV0ADZjS2bz9NF/1Ai3b2DNz/EI
         KC91DXpxDOtp9R8QkXICnu15Tj6X/DEizgvdFfEnRvEa/GFeRbvX62Cctw13vZBI7hbj
         4yTrcgR2Drav9mXe6pF/hkn6Jv2Wd50IUw3i/KZq8uJG7xLWgnAag7LiLBqHo2Zujxaz
         uyof/S6rBP62c+wGukPrNoUPGs79RTUdCeIMBpTl06/HoI8Aj0g7XCoBlmAnyBVrmdVl
         0lQw==
X-Gm-Message-State: AOJu0YxO3fQt+Y1/oR+QymJp/z0Dq/SqRZer02pa+cQKR9VB0JAP20jL
	Xlrh/uX9CXk//d3QMUU1Tbk5bNt7OVv2+QGpMjQSDDiGgE7MnVMmS3BAXDhPVOvrMos=
X-Gm-Gg: AY/fxX4foNF0DKu1Q/Elit/tjqUMBTop/dySgseL7XhTZrQVPzv/ng8UFL5yjAi8QH9
	seao1B/uBDS/HqXbLDmtX7fI5ewJQangmCfwQz3Cwk27Kyfw12GOGCc7NVM6dygD35dIo09xnQx
	9yyHTbJYfzXnOCBSNWomzR2RSb7f0BydkZ0qpCaZNXPhot+RvaQFW/vGvLCPMMcjmpOiSD9ibsY
	Kx2MWLhr83DWPaA8Z8sTS060EDZ4+FKQa1f37CGtIkBMwEG25ZXHnSU07Znd9GecYnMj/uCXmEt
	OOGMohDByruueJbUeQUk0h+/hKfSwXYJDmW9oc9QMMPCBfteMQSxQKupPR4gC3YbZSqvzYHsDAP
	hibJcUTTR2p/alpz6TGVSc78tPdT0vlBGGKUhd3Fg+iMKalOTR7ZprlXJn/TDJBHzr1XnFgMjgR
	r6J9rG6ftCpbNvD3jENrHtreU5IVpg5apVtp3j/wu03bAjPZkZ1noKP3WIknUGcf3XMZkG7eg=
X-Received: by 2002:a05:690c:6e0b:b0:793:bbd2:5675 with SMTP id 00721157ae682-793c67f7993mr7567597b3.44.1768520568667;
        Thu, 15 Jan 2026 15:42:48 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72aesm3027117b3.11.2026.01.15.15.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:42:48 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 15 Jan 2026 17:42:03 -0600
Subject: [PATCH 4/8] dt-bindings: soc: tenstorrent: Add atlantis resets
MIME-Version: 1.0
Message-Id: <20260115-atlantis-clocks-v1-4-7356e671f28b@oss.tenstorrent.com>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
In-Reply-To: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_234251_167524_B9E0005C 
X-CRM114-Status: UNSURE (   8.42  )
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

Document resets from RCPU syscon for atlantis.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 .../tenstorrent/tenstorrent,atlantis-syscon.yaml   |  5 ++++
 .../clock/tenstorrent,atlantis-syscon.h            | 34 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
index 3915d78dfeda..7e9c8d85ba9e 100644
--- a/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
@@ -31,11 +31,15 @@ properties:
     description:
       See <dt-bindings/clock/tenstorrent,atlantis-syscon.h> for valid indices.
 
+  "#reset-cells":
+    const: 1
+
 required:
   - compatible
   - reg
   - clocks
   - "#clock-cells"
+  - "#reset-cells"
 
 additionalProperties: false
 
@@ -55,4 +59,5 @@ examples:
       reg = <0x0 0xa8000000 0x0 0x10000>;
       clocks = <&osc_24m>;
       #clock-cells = <1>;
+      #reset-cells = <1>;
     };
diff --git a/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h b/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
index a8518319642a..ac6afc95b224 100644
--- a/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
+++ b/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
@@ -64,4 +64,38 @@
 #define CLK_CAN0_TIMER_CLK 52
 #define CLK_CAN1_TIMER_CLK 53
 
+/* RCPU domain reset */
+#define RST_SMNDMA0  0
+#define RST_SMNDMA1  1
+#define RST_WDT0     2
+#define RST_WDT1     3
+#define RST_TMR      4
+#define RST_PVTC     5
+#define RST_PMU      6
+#define RST_MAILBOX  7
+#define RST_SPACC    8
+#define RST_OTP      9
+#define RST_TRNG     10
+#define RST_CRC      11
+#define RST_QSPI     12
+#define RST_I2C0     13
+#define RST_I2C1     14
+#define RST_I2C2     15
+#define RST_I2C3     16
+#define RST_I2C4     17
+#define RST_UART0    18
+#define RST_UART1    19
+#define RST_UART2    20
+#define RST_UART3    21
+#define RST_UART4    22
+#define RST_SPI0     23
+#define RST_SPI1     24
+#define RST_SPI2     25
+#define RST_SPI3     26
+#define RST_GPIO     27
+#define RST_CAN0     28
+#define RST_CAN1     29
+#define RST_I2S0     30
+#define RST_I2S1     31
+
 #endif /* _DT_BINDINGS_ATLANTIS_SYSCON_H */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
