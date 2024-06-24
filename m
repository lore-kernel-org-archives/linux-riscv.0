Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F669C27C4F
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 02:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/k/v6WmkzIFlhKx2vjlkHDbnamPaxbrb0zUwTSV0AE=; b=bp+8FeCCsklxgd
	vW8l+GKiezkxR4VxAJw71uZoqMe6B+Xu7fxGxJJ63GYCg7bgG0C2OgHroGboHFpu2+f8ZuA1fQy+4
	dY9yATW8BeMpLJ2sTgkoO4WBmHOM+9gj2+zGYIb/lboo+wjr3zc71/sZ/p1ObCUenjfGxoE85j1yc
	Yp7pEhHh4+v/09W6iMFoZhg+fD8+u/I6h9tJZeMTzyjJ3vdo0DVRtyP3IexBy+LfzD6jcvbEshBpk
	PTLz0QA15LGvvJUiXQkwyv/zwd46sN0sH/7NiKdulFJHw5ATDph3lx247epnGPlHIMMORimpq6WgQ
	Oe+tYdoMA06GFUrF27xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLZFS-0000000FGMV-3NfJ;
	Mon, 24 Jun 2024 02:16:02 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLZFH-0000000FGIJ-2G2v
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 02:15:54 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-707040e3017so2706984a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 23 Jun 2024 19:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1719195350; x=1719800150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnFMVS1MfqfzWdRfEx5FfQB3Afj3yo7GkFlPsBGziDs=;
        b=BzeeBkB27M/5lmr9gtM+oGNq+exvD+mkvRMMe7GiNuvhDH4ll19S3FAVoTZG/Jx+eD
         4eDAg0K+N5YtBnrV6i1krWScA0l8FPGoczxSUyjjf9dDzagNTkDXNYx83n4IJ9WVX8Y9
         4tTpKerrE7oedPFJH5LOGMUeM7hpivHQv5LU7ZygcKZC7iDvyluqJlWkD0tOTzG1BOw2
         ThHPFk1S9/h85s5W1Mf7YvtoMrwRc03pIPL0wOrO+oYW+HqPJkyUfG0YqA6nb1+bHTH0
         sasQgwK55Wj4vD2OmQajVBxf3ca/77FlZbPGzl5+aLpeD+N/sjHbyN0XHmBTpvVyhb2T
         AqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719195350; x=1719800150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnFMVS1MfqfzWdRfEx5FfQB3Afj3yo7GkFlPsBGziDs=;
        b=PiOnt/cdbP8OW0QPQyUgU9bRP4IszAzIurrxv8i0G6oyZINmLwqH09AobXc8WdGKxP
         S6neBNpzwemB3SSdNg8AMrmw1JKKgKw01BWAbpNjFLTovPJVenI/KJQoQmg/XaqTE88t
         wKUabZtAA/1Jm4RqradnNaDxWLlDYsQxJlMu6t7PgEt3fGRTcskHoqex4QOEtJ07qVd8
         62n8wLAyCu37vqy4N6t8f2m0edUM8cTsW7lnSsHiDNQtkPmxifVJ8abvNlmO1qRw+krn
         JdYl8z0pZMS423YyK8Yf+fL0N1xs2vIHQDDbtJBJDcmnRKfSrDRK1ZO8awfjqRr//iWn
         u9tg==
X-Gm-Message-State: AOJu0YyWTEFipqDrDbg7fNes4hJqgncbILZYQ04XBVSL4Il4EJ7u1qkz
	xAgyQU3/8hHp0m6a6iGE55kYHC4keLP4ALnW/BQt01oO0iVNo5BbJSljPba9HpQ=
X-Google-Smtp-Source: AGHT+IHW6HWUX6v/07vrhz8vJOF/5qYP0BvoXQ21bV6naDfQXKTOF3D8FapemtVEDDfuAXBOASPQqA==
X-Received: by 2002:a05:6a21:c98:b0:1b6:d9fa:8be with SMTP id adf61e73a8af0-1bcf7fd1210mr4394592637.40.1719195350539;
        Sun, 23 Jun 2024 19:15:50 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:1584:936e:5eb0:fab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706511b137csm5071770b3a.86.2024.06.23.19.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 19:15:50 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sun, 23 Jun 2024 19:12:37 -0700
Subject: [PATCH v2 7/7] riscv: dts: thead: add clock to TH1520 gpio nodes
MIME-Version: 1.0
Message-Id: <20240623-th1520-clk-v2-7-ad8d6432d9fb@tenstorrent.com>
References: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
In-Reply-To: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719195343; l=1705;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=1YUFcjPStRQXnRCkm7LFCYqYtH2keuIc2Ndi6ymcweU=;
 b=rYBGKNJzXmCmLAga5clXqSFTTT6acEgLUJTAcP100RcfUjqlXe3oY4DKYzEONUhMhRslOqumq
 IBxq129anadAhKP9VsQmsnBjrF17brGOw1fgRg6bSOgGM2pr+vivXcb
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_191552_632806_C9674956 
X-CRM114-Status: UNSURE (   8.39  )
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

Add clock property to TH1520 gpio controller nodes. These clock gates
refer to corresponding enable bits in the peripheral clock gate control
register. Refer to register PERI_CLK_CFG in section 4.4.2.2.52 of the
TH1520 System User Manual.

Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index d05002ad7c96..351e09beab70 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -237,6 +237,7 @@ gpio2: gpio@ffe7f34000 {
 			reg = <0xff 0xe7f34000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clk CLK_GPIO2>;
 
 			portc: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -255,6 +256,7 @@ gpio3: gpio@ffe7f38000 {
 			reg = <0xff 0xe7f38000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clk CLK_GPIO3>;
 
 			portd: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -273,6 +275,7 @@ gpio0: gpio@ffec005000 {
 			reg = <0xff 0xec005000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clk CLK_GPIO0>;
 
 			porta: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -291,6 +294,7 @@ gpio1: gpio@ffec006000 {
 			reg = <0xff 0xec006000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clk CLK_GPIO1>;
 
 			portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
