Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444B9C25B47
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 21:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZNcypdFNQGdQ8MqmnyaFb3GcT8ghodCK6e1fMwGat0=; b=Hn9JHKAYKAoFkQ
	FIg1Sdo+oCcRGY1PLQ8085CRnrqtAYh2Wma1lhF4mhI2F7yZIKGsDPAX+w1Xk6F9hmZFl2oU+BtPX
	S0jZUGZzseykZSd3NEfOzK5irSYhQqxSzpi38+1CG7D30/G1PIOxoioFgI8HlgKUg2GlTnaXu3Z4a
	CGDQ7WG78NucYd/k3XUJ99tTA6ukvGW1/LW1uWxrNWSDmZKXy9EO/6Iz5l4zqVy+VFQ+zRDyvXLMr
	1F3WgBrl4K6DdEpqVooipWSwAQPp42avnHKA7JdH1xrn+GZ/ZdYRFb9+MMBRqMJ4iJyYiF6JeqEip
	SXtgzen9ymVKThK/9/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv28y-008HbA-1N;
	Mon, 23 Oct 2023 21:07:24 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv28u-008HXS-2n
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 21:07:22 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-692c02adeefso2891018b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 14:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698095240; x=1698700040; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnDZGk512Fn6FcfRLVRqtgZTjSOOBJwTCzWACAW0uhY=;
        b=ZMvRHqKqG1II2/Uq4YlnvbG1OTUZhcbuFX0qCplVBIejNwleL9vk7ysiRL8sEeBv5X
         XtANRL6pql/sIdKeUDliInFmRdeECn0kKs9mDbBvPVDwOF/9ZlZva1HuXRpKQrIRaASh
         WJRIqXKDuKy9BciqCV54KwdFN4fQcXeu6SNhQp34/nwCSBVkdv6kxEotFjnoOcqpQlDU
         P3ERR7Ji8B65EkNSBvygvoxrUn+Fe81xPhQDO3UAO7K2WahowYwr3FJs+lPFHGqt41Yu
         F6KuVTKAM2+PN76GHQcbQK/VzFn2em4fa9ab73Lf4t8Bmo5NkuYK2EscNAVVVsdwlZHo
         xibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698095240; x=1698700040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnDZGk512Fn6FcfRLVRqtgZTjSOOBJwTCzWACAW0uhY=;
        b=iXofkFaHnLrJLghb9UY+Zk66L5/ObyZiL279kQ0KPWFYSdqsZG0xBU1V8Us6a9RhtX
         UkTShggIeeGFs4KtxC7YsPwTVtdk7aXtKB2YMbbut0p0IKvCDbtpGhvq6AeJV2cRcF3a
         aaqTElm4ziNGUnur8Mrn42iAS6n5chvZIVHUDJDI+VmIZzqdWWQJDiWuBsrkb1uo1GXV
         CVH/WdEBRBfJ/g1l8y+HUflYhMV2pNShRfrkPpoXaq6EweFkf5fs6PJKcwBqYo5Lv8/q
         RTB1Z96MbGEVVw+xVKK4nlmXG8cfo3U5EvrS8EffON8anIHmF1O+nW5KQ37KjPdFn6PV
         mGfw==
X-Gm-Message-State: AOJu0Yzw6gVWMtbcTH0LsRGN5giAg7xYWD4Kh7zfLWLCibpWcQPKZwD8
	0bTorVM5G6ThgcSZjfKqGAgZdw==
X-Google-Smtp-Source: AGHT+IFy9i3wiRv7RsL2aaRs6W12U8SLHVKjHe5u5szPZ8Mmj2tmiOgWQEONmuRJ4KzzhMNyDRzMng==
X-Received: by 2002:a05:6a00:1896:b0:6be:2bfa:6290 with SMTP id x22-20020a056a00189600b006be2bfa6290mr9584374pfh.8.1698095240362;
        Mon, 23 Oct 2023 14:07:20 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:b9a0:8714:407c:4146])
        by smtp.gmail.com with ESMTPSA id k28-20020aa79d1c000000b006bde2480806sm6573066pfp.47.2023.10.23.14.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 14:07:20 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Mon, 23 Oct 2023 14:07:08 -0700
Subject: [PATCH v3 7/7] riscv: dts: thead: Enable LicheePi 4A eMMC and
 microSD
MIME-Version: 1.0
Message-Id: <20231023-th1520-mmc-v3-7-abc5e7491166@baylibre.com>
References: <20231023-th1520-mmc-v3-0-abc5e7491166@baylibre.com>
In-Reply-To: <20231023-th1520-mmc-v3-0-abc5e7491166@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698095224; l=1102;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=vZkA/Rp2zWEJvsAGA/badfpHmHgx6/3DqqLzYe2IxQc=;
 b=ax5AGQOb4EokTCr2I432j5nbW8QaPOXuJavEGggSs1ADU93cWqll3c1fgKxLtJr4V7cVFFlVf
 3vhc56vd56WA2rIDPUGnxPWzgbBzvgjFKNJQh0b6hnAKjzBdq1stbeQ
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_140720_909656_3A6A9330 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
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
