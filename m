Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B2AC25B45
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 21:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08bxnx4kHAymZNvnCm83S2gJrNq29HHDsZg3x2WhrCw=; b=Oq9nAv4ih65n0J
	5AWtQ78JcEMxXlXxbJezjLgGTEmMgjOFsW6Ep+uFPWtkbnsw4dj6wxQtkUL+WDjFPt7zDXKIY3nk2
	I9ZXJbejb+cxaOJ0xOEPGy+BaVhEOZW4zXHxWs4bfFiI8QEeiZdeBrH/o+hv3VQqUx5w2jvN58n3x
	PbANJ5mbehUqhFRk1NFjZfD7V1y8oRHWfv1wyOqyKJQjza8xz2TiUnuLqMtgSFDNNrJR4kc+4WkIr
	uFl12cM0vZWwWIDBBoh9lBjBWCDOK456mcdTlgyjyq2ZEtIWdA3n9peAEZu2TlZ+k3xFwoZsDs0xq
	93c0/O+951G8TR5zG4uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv291-008HdI-0p;
	Mon, 23 Oct 2023 21:07:27 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv28v-008HWP-0w
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 21:07:23 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5a1d89ff4b9so2010783a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 14:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698095238; x=1698700038; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRsbR8cyJBJLQiljQwh8xETHPQGsjMsxLgd7DL4I86c=;
        b=pqXs21zoW89lM3PEITibl8E1QQLiWjlXUlZK+mKzbAyp/s3qHusIJ48fs9vqRfEjPO
         j2rB2HHNDWRfNbAWMRDfGstDLgIiNMw7B3XJfl5+dkEfjFp/n1udEKPXiL1Hrz44M2M8
         x/7WemsSF7x1/nqNh57n0h6P9atwBzK2ZW1gG3qjx+HOZ/lxx1TNofNR5gGtciKodQ50
         3r/VtwLjGIyzya46GIpnSQ8gQ0p+TcvgWT/AhK1oGN0lUxs2y9DZG31wHKqiwDC1TqHH
         8CbZogzmD8V2lliPWgAxIVURs4HQ55+pNy7QcUL3rWdKwyMETCrsRtAma/p0BPGShwMg
         DwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698095238; x=1698700038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRsbR8cyJBJLQiljQwh8xETHPQGsjMsxLgd7DL4I86c=;
        b=G9iu2O/BoPRt0X8C82ksOBVWl9CRlERPCg9M20s3aUGxrz3pMI5NKY7onGdmqho09C
         fk51OnPJt6Mr72kHuw6PCFwjv/u2X/zUCtA68Ssueu+bOTCgujt/Eeuz2fT9SKt7GVsx
         f+hv+CGDG/55oqVnGQuawgO6NBWImVjf7DPdlYnPTPTXMiB9cV04BzNT+znGjhhiopaG
         S/AK9EdLwfmuej541AmsHLx2h6vwf2HZtXyE20VKmYMy7tb5tNjwDBhUPOD2V0xCAt8I
         dE9zrU465ShIs6NEsEbvdGeZqkhi116DhzevcF+9iXXmQUE/rTZaiBi7liCuJRo+TCVd
         MJOA==
X-Gm-Message-State: AOJu0YzHjXE1296Iqw70uvBvY+/5x6SETCiv84WH/Tdroejxozw8kOos
	FLd3BmSIUwCNLRD+7BeqWcgUtg==
X-Google-Smtp-Source: AGHT+IEcm7Zc5+MK/lCTTfkNi5jhtUVjUnBE3Ln3l7QAceSfeitd0U6qE3f3EKflACoeh8fywVD2hA==
X-Received: by 2002:a05:6a21:7747:b0:17b:1071:36cc with SMTP id bc7-20020a056a21774700b0017b107136ccmr674297pzc.53.1698095238361;
        Mon, 23 Oct 2023 14:07:18 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:b9a0:8714:407c:4146])
        by smtp.gmail.com with ESMTPSA id k28-20020aa79d1c000000b006bde2480806sm6573066pfp.47.2023.10.23.14.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 14:07:18 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Mon, 23 Oct 2023 14:07:07 -0700
Subject: [PATCH v3 6/7] riscv: dts: thead: Enable BeagleV Ahead eMMC and
 microSD
MIME-Version: 1.0
Message-Id: <20231023-th1520-mmc-v3-6-abc5e7491166@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698095224; l=1065;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=ivnAVa4ydzuGy1tIrb6+8N9xlA3xHNWc5N0iKEqGJGs=;
 b=fSe4EYk9ihygXLrUGGGojwk2oDvxB27qsTIAtBQVzytAxI/BhiUgb2rFV4KVB0yQxgBPjOgnG
 waAl7MfGzViCUge3ZosjMnnvAfeTZKgm5HLiqY35OghByzWM/d0dUys
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_140721_334422_11711697 
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
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 70e8042c8304..c4e748827889 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -52,6 +52,10 @@ &uart_sclk {
 	clock-frequency = <100000000>;
 };
 
+&sdhci_clk {
+	clock-frequency = <198000000>;
+};
+
 &dmac0 {
 	status = "okay";
 };
@@ -59,3 +63,19 @@ &dmac0 {
 &uart0 {
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
