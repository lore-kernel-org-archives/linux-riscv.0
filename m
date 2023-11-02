Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C442C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 02:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZNcypdFNQGdQ8MqmnyaFb3GcT8ghodCK6e1fMwGat0=; b=vuNwAaDZyWeiGX
	7CYn6qHIzhGp6JEpz8z5PRIFA8Ac+SNsbRZK7zm6OZuSD8tl7WIakfD4gyF3mkwF0rf3xoc0rOOhb
	ivsUJBd27VJZIZ5N2uklmmmPHe6xSUDUlMIonDO2HP89oZhqPAVRLQsrqTGEoEKxGa9tjro85yR8U
	IMVEa9/Bvi+NOGRiPwyP3MoBPbaZNlxxgtNA53XbHdnz+s9CeLlEU4pMgwYACUJ+tMxWFdtWsqRg7
	IJ7pDioIwd+bxLAnTi3SjnB0Tp8vihKkJJJojW6XL7upxvQVPSeIt2RYr91Cv49CZZ1ZIssTLWX1L
	dsIXPsIdALKyoAtFXJEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyNlx-008a9j-0E;
	Thu, 02 Nov 2023 02:49:29 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyNlu-008a83-1t
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 02:49:28 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1cc53d0030fso4233125ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 19:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698893366; x=1699498166; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnDZGk512Fn6FcfRLVRqtgZTjSOOBJwTCzWACAW0uhY=;
        b=G59btgkKceEPW1HM4F9RuTgnowku1TYoZ/Tcor7j2Y/L3cTh0EfBc6uM0szHcQeFud
         EHtyhJ2qKv5K/iBA0cSk2EsJkEvZPgQ7bVf5YVJw6xBpgXi7Ti+S3jvc6blHXJlp6xGy
         FVAqe4b2a4CENJ7j3Ho2l9sN/6fCSsYfbjO9gboj68omHR6vIoqk5TjlbDckfeURB5Na
         +ZL8ObGpmA7sUkt0BpFCYR5xpXOXwzCDg8swq2t4127UQC8Yh6+Sl3v5ZjwKfo3I9Prf
         OfkMBi27UCoV5jL7mC6BDF+lOlhrpEhUXLPQgMw3ZfYK12hn+vmLMfmNF1mJxBUaogPG
         Me2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698893366; x=1699498166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnDZGk512Fn6FcfRLVRqtgZTjSOOBJwTCzWACAW0uhY=;
        b=HmGyKJokFKpKXqggFSb8bo1PCh3CqsUStUEi8AiMxSgOgzAb+C2lccdiQVxozN2ee6
         VTGaGnxJXtPa53llN0d9kP2k/3eV+mlocBCICPNYzRzYnslA6bxhpT35LjvkIgqwnMth
         g6V5+/ClCbKRIWiY5EmxWNK2iLkUljYKRJxFOZbUAg8mu9NtZmVNScotspXmI3jzmwnI
         5arXsqHFEEYAXMWuQeBls2WBGm5LVnONosmYNnof+bHMXPNDWkV9Nvp253DU5y4FoNqK
         9kn8G0v82MjhRxdvFzx/xmXPfyof7AmGnVmJj403AHOWnbRvGiAPFfxjfhoF+1sNR5lp
         saLA==
X-Gm-Message-State: AOJu0YxsDzMdkSFv5ZwfGZw76PAKtcPy09P89WU5/xnm8PP6WCtU3pb+
	sOB8mxcM+MMtQfWLMaebSIlJZw==
X-Google-Smtp-Source: AGHT+IFotN+N+05ghfeh6n+nIwmS9iXKFbCoDtCFHfdCTkyZqRbHe40loI/Ve+moBfFjdnP9WDRB8A==
X-Received: by 2002:a17:902:dac9:b0:1cc:5ce4:f64b with SMTP id q9-20020a170902dac900b001cc5ce4f64bmr11068897plx.8.1698893366171;
        Wed, 01 Nov 2023 19:49:26 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:7e4c:4d4e:6943:bc0f])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001b850c9d7b3sm1925787plf.249.2023.11.01.19.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 19:49:25 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Wed, 01 Nov 2023 19:48:58 -0700
Subject: [PATCH v4 7/7] riscv: dts: thead: Enable LicheePi 4A eMMC and
 microSD
MIME-Version: 1.0
Message-Id: <20231101-th1520-mmc-v4-7-86e0216b5994@baylibre.com>
References: <20231101-th1520-mmc-v4-0-86e0216b5994@baylibre.com>
In-Reply-To: <20231101-th1520-mmc-v4-0-86e0216b5994@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698893345; l=1102;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=vZkA/Rp2zWEJvsAGA/badfpHmHgx6/3DqqLzYe2IxQc=;
 b=8GSfHaYjbAvdqR5aNak0qxCYTox6ynEJYklYiqEqs75Ahp961sktUsZMwhbfP69H8eDCKd2iX
 Qb0BX3cam5JBwzRquUhN8ceX4V+t4liKW0/NNfG/NOH4PRVtvHtorW+
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_194926_623437_295FC841 
X-CRM114-Status: GOOD (  10.06  )
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
