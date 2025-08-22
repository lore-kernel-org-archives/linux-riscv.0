Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF0CCA0EFC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVs6/BbeSJLKNYQ+phwneVZy9KGBriBXZTKYWVAYSN4=; b=fK9s9HG7XSMFYs
	JPMnGBTr08c1OTGkgIaSUkzMQoSuchk1SBH9GewImBvAFGpVVA6PIyDtfgEyfwuVCgCzYlCDuS2ZP
	jbBffLzJjuKqcCUWVUnl1N2y59tn3mN9jcxLdCgPvdqfFgGjfkC7Ydo5hR7nZGIF7tq4zfXc8S7UM
	htjzono6PjSqVrbIDlOJU3aIUO6KwKhZJHERrRvKbA9RkBfsQ/Fcyuk/2qUkLpyK1uOmRn4eFAYxW
	v98MIC5bh2xn+OFoSYHZ6rlP1q2t66lVnHLxzSpWGWJvlSq8NBaSc8yD5SKZqHfcm33e3lT2oWyL3
	vSEyHfxBCfOhsu/Zx8hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqx-00000002IGd-1ebi;
	Fri, 22 Aug 2025 11:22:39 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI7R-00000001LM5-2gBW
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 03:07:10 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-76e2eb49b83so1208972b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 20:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755832029; x=1756436829; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBarAmiAVNczS9KrycJoO+goP9AfyIOpybp54mi0NCk=;
        b=PSHjwdiKO6hfbmVE0rlVvOLqmstU9L/b9jyhocn8vozoQM7E0fmQJIA3LXStUERgqU
         RZQqFcvXbcg4dXlxV2xEJzL12LEr/FxBRMQUP4B5RZeSUG1ABVVKtQrS7zBiDQp4IGY1
         5EJXyrd/xgrWETKWjQ2n0/Pm6sFeo/qrVfBbzNsKJ33ld9+bg+IURm5X5DXw+etPYb8E
         Pb1XCUQnZpf+9K6msOOM7e7pBxYFVLquczI8ixSU2OcRKJldf9S5uVUcqJjZFYw/lbEk
         ly8bozwlfhpqh+achZcw135RyuZBEzhvWgTbzgeR7pFOOKBWTjsCbGdBym8zlPU3WZT9
         iGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832029; x=1756436829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBarAmiAVNczS9KrycJoO+goP9AfyIOpybp54mi0NCk=;
        b=Qo18zAhfZvBGEtUMWKnsbnUz7FJgxY2NuUS7AzZ5fp1qGm+i1I1u76t/u3twkaTfA3
         8PYaiG2LvYkDn3TkWwPGa0dMuk2Ci798feXLfTwR1+neGsTm4XgG7B71iG+uGOJUoP81
         VeR+MlfvBAYY+Fox1PDaw8hDpe/Q0/1mEW5zjXu9FQHrJsGHHNxd3BPi3aE6EVA075xE
         XpEkBCrOsq3pyccUba/DYuIsg9mbl5Dx0WJ6F78GGmyY4u98OHCODxFRqvMzChFDB4bp
         EUmGDNWrGRM7NE5Vi/Sr83aLQhBrAvP9zDgLqgcGz0PgWhHg8k2WWviAUH7fzLndhZFH
         cP4w==
X-Forwarded-Encrypted: i=1; AJvYcCXODq2gbgSfSvsPZP7VYI0+HY3of0RNo/cjG4I+6FIlguywOL82dzWSSOW9PkqNYynG3jrvJOsQmoBbYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxQHSPA79omq51XEffOHux+4wMA1pyXfWIsXzoq7qCY/1aS1Vc
	3vOf0d/cYBMuZIyb02N6cTMbM9R8AsY6N+8LF2Lxi14ZC3PrEPw6ZSHYDDj8ANi0+/4=
X-Gm-Gg: ASbGncu5S52eXvYfSU0xvO4ERU1qkSs/jfNWsmt7fEEnGHQQY6EfCzcY/ug3vigus4Z
	/1+6Q2QqyoXE/W8DZSCYm6ue/rTOcLQ1k3+euNHsZptRfEc9dkt83ICWGNLZ9xaoTQG7GLH1Rxd
	glCmhDEoffxjuXqW6UQTa2xvujfxFg4+bFmhN3mwLT/rNNkv1yPhUGK0FGJQUSMd2+6cYKoTV6q
	uYjh3At/u096iKXsHVQkCb22VOrjUSJrFk7ZV3r52Qp7Rek5F+vePE3sdZ8AhkCuk2H2y5Hqutk
	xz64q7kgYD9/XyDeEsxXnSqeWx6rET2dy074x1FLX8xvZRrY3zqoraSgFoBGbHjm1yqDBkc+JHV
	Xiq92K5jbQDyll3J6Y26k9CRzhyWAuoTD6A==
X-Google-Smtp-Source: AGHT+IG9r1IW40WvsK0ieNWX502Z1iaJ5R2nE5AB//lCMTQKx+lUDc3v2aZziBxwICd17ogNaz3RaQ==
X-Received: by 2002:a05:6a20:2445:b0:23d:58e9:347a with SMTP id adf61e73a8af0-24340c964femr2260198637.26.1755832028794;
        Thu, 21 Aug 2025 20:07:08 -0700 (PDT)
Received: from [127.0.1.1] ([222.71.237.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47769afc1bsm2756777a12.19.2025.08.21.20.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:07:07 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 22 Aug 2025 11:06:33 +0800
Subject: [PATCH v5 7/8] riscv: dts: spacemit: Enable PDMA on Banana Pi F3
 and Milkv Jupiter
MIME-Version: 1.0
Message-Id: <20250822-working_dma_0701_v2-v5-7-f5c0eda734cc@riscstar.com>
References: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
In-Reply-To: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_200709_683675_25DD985B 
X-CRM114-Status: UNSURE (   8.72  )
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

Enable the PDMA on the SpacemiT K1-based Banana Pi F3 and Milkv Jupiter
boards by setting its status to "okay".

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: No change.
v4: Rename the node from pdma0 to pdma
v3: Adjust pdma0 position, ordering by name alphabetic
v2: Added pdma0 enablement on Milkv Jupiter
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 4 ++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012fe56d42ac8a7efdbbdb694f31b6..6013be25854283a95e630098c1fde55e33e08018 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,10 @@ &emmc {
 	status = "okay";
 };
 
+&pdma {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 4483192141049caa201c093fb206b6134a064f42..c615fcadbd333adc749b758f7f814126783f87fb 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -20,6 +20,10 @@ chosen {
 	};
 };
 
+&pdma {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
