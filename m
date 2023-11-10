Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA79C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 05:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZNcypdFNQGdQ8MqmnyaFb3GcT8ghodCK6e1fMwGat0=; b=AX6HM2Bqv8DKnH
	hNcDnMlJG/pfQrQI7VySc77QF5nTh9KsTlpQ4dCWgAGuZ1mmaT34ZQw4Sgu2Hg3iebYwxNVfSDtHM
	a7nCNFfc4HEzlsvAcwHoaav7+ecfxXFy6G5zFsz3o2VqwjXs7BJCWmqv3WrPgZ88LI0RLifoNvAc0
	FRBcJUmWBFInUXJ5U+4Gg4dO97kXANeIOvSiA9Y3VGNC4MFxfBEwkkoOSAmL2KnOX4BjJM5Sr86Q7
	bBSXwyEINNpeSayzA3HVDf6RhK1daxfLuJMDcQAqpBh4ZcNQ+IVd6wTVKwayBFowxLeAcpAgtxY0s
	Lu9wULUQqhWx0xhpph3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KHx-007u8w-2e;
	Fri, 10 Nov 2023 05:42:41 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KHv-007u7s-13
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 05:42:40 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cc2fc281cdso14762885ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 21:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699594958; x=1700199758; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnDZGk512Fn6FcfRLVRqtgZTjSOOBJwTCzWACAW0uhY=;
        b=KQbt+PydV27dKVzbRJWnYiJgzla3fTCShlj2nKYAfi0lBTthOjxRD7PrrPO2apRmf5
         VikHIbz7utL+KW3w/6uEpe55cXDiT7Eq3kyQ6LSA3wzUFck52lE79853NCoPMGU7ORfn
         I3nPbgGSN6FE8n+UoCgjxVOfq7NII+Z0dlz0p660C5QbIWGqLKLU9I/0AudYev47CUBV
         4pLGsQ7ikK358Bki2dhSGkjkIyTPNL2G/yYFYLwZo0Gnspj3PMa1l4n2Gu8qRQhWm1YP
         hq90fD30rRZwQ7qPFRruGwfK3A7M8Kx4E3sZHrqSvYKMHGBSCVk9tJW7KfJ2sB61zMKF
         xS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699594958; x=1700199758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnDZGk512Fn6FcfRLVRqtgZTjSOOBJwTCzWACAW0uhY=;
        b=qtYkRiHh7fZU2hfRBkEmMhS2A7vT7kXkTRllu2ssPtjHzag6PKkKUWVavRZBus7sQn
         RwTo0+RRS1g4bgESid5hwiU6jsVjSzLe9sI55OcunAWWgP3ON+MJH0FodY4m3Tkkz3pj
         ekKVccW2Z97uEQAv5OPQpdVracbq2IFuCSSrPJ2SeE8Qlofki/YGtuWS2HQBdXXllxsV
         UaW5JsAsJyGktI8Pt/Z+1MIwoQ4R2wYQ54kuaMSQ6jRr+rglb5+Mv11Fpjy4cSdek+eg
         0r4zEz5c3p3N28PrsUDVyHiLIUc1Nik6WLdyuFn3734bBB+j0HpvsJ7U8I3VOsiyfHyR
         Yn3A==
X-Gm-Message-State: AOJu0YyneUBQB0MNj7lRdGZue3e+5/FB6QXlOZVrydiWMwG+JSluWIi1
	AcTeuL/JIHKa6nBkH3+0DheRYA==
X-Google-Smtp-Source: AGHT+IGTTsahV81/Rw5QlsTpUJVxQ1PAILctgM4NyU6BPo77WHSOVHAuWPMQfe9MkO/AQRFIKwQmIA==
X-Received: by 2002:a17:902:cf01:b0:1c9:d8b6:e7ad with SMTP id i1-20020a170902cf0100b001c9d8b6e7admr11068018plg.56.1699594958186;
        Thu, 09 Nov 2023 21:42:38 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:2071:4479:98b8:cc69])
        by smtp.gmail.com with ESMTPSA id ix22-20020a170902f81600b001b8a00d4f7asm4498845plb.9.2023.11.09.21.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 21:42:37 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Thu, 09 Nov 2023 21:41:17 -0800
Subject: [PATCH v5 7/7] riscv: dts: thead: Enable LicheePi 4A eMMC and
 microSD
MIME-Version: 1.0
Message-Id: <20231109-th1520-mmc-v5-7-018bd039cf17@baylibre.com>
References: <20231109-th1520-mmc-v5-0-018bd039cf17@baylibre.com>
In-Reply-To: <20231109-th1520-mmc-v5-0-018bd039cf17@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699594943; l=1102;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=vZkA/Rp2zWEJvsAGA/badfpHmHgx6/3DqqLzYe2IxQc=;
 b=fJaLj8Us7PpYhDPHDt2gAJV0CgQsotNJKZ73gVndaddpreipV21Pv9bXilRM3ODn6eiDa/Ubk
 h7kJ2SCtnDZD8g4t2P9LyI/wn5hmo7COmgWYmsLyqjWJR3zX5ICneL5
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_214239_361819_52B78AC0 
X-CRM114-Status: UNSURE (   9.64  )
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

Add mmc0 properties for the eMMC device and add mmc1 properties for
the microSD slot. Set the frequency for the sdhci clock.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi      | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index a802ab110429..94f1741435a5 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -29,6 +29,10 @@ &apb_clk {
 	clock-frequency = <62500000>;
 };
 
+&sdhci_clk {
+	clock-frequency = <198000000>;
+};
+
 &uart_sclk {
 	clock-frequency = <100000000>;
 };
@@ -36,3 +40,19 @@ &uart_sclk {
 &dmac0 {
 	status = "okay";
 };
+
+&mmc0 {
+	bus-width = <8>;
+	max-frequency = <198000000>;
+	mmc-hs400-1_8v;
+	non-removable;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+&mmc1 {
+	max-frequency = <198000000>;
+	bus-width = <4>;
+	status = "okay";
+};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
