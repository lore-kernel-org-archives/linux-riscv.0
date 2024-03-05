Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56537C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 16:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kj+4X9pJ78xB/72+ga/ocTrNts9Jj+3QteJeFAkuKrk=; b=YiKw9KHOMe4cPm
	3MyhBNEB4GI7JkaG72hDytFEHxCacC7GXcspJs6mPGMqAsGnJNlKraPqatiao50u3IiHCQZNd25tT
	1clCE3K0cSPT9xqfIAo+fTJ5iBWZL9SF2x7R6WFYVuWFqwgeisZVQ0jgkjGbcbuI7PN5O++Auqs3J
	heSetVUcxVivPsoc71PDR+ErveTBsNjlFbdN5h8lE+H1Vs3c+e2ci7hIYK4wE13dv9HEpjYcAeJeK
	iYEP5nsXYf2M4Qt+CjDlrgWSLsy65avcWcF3bnzPAT/p5wayfCWnQW7g5yajISx8Sa3hVH2GezfJN
	5039QAhaWWr73kPZ3JnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhXE2-0000000EODD-3oME;
	Tue, 05 Mar 2024 16:01:06 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhXDv-0000000EOAv-0jlb
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 16:01:01 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5132010e5d1so1188130e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 08:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709654456; x=1710259256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HxUg3AxRiB6TIJXosfVD0lTwwq/nFBs+gkaA4km4gxU=;
        b=Y/VaCfNwrG7Iz14gPMiI0Ii2I97NV/GdCz6R6+QhE7KXjG+2jUnlcFA7o4xBSrXU7G
         sGxeoakhpWsXwjqVFATb/FGuDZP9WLnRGVMh/Pz7hbPD0AANvkvncDfhNzKIg+QjOK9Q
         8eOI6XvJNjvUmakWPXxr4yT4RaNFLcbsIEYS0xNEevV+qtupWpZr6vhoEH0gI2r7b0eF
         7kcW/F5hktVdcgRUah16R+V+nHB7MNjH7ixBQgQNr3uyYnKhBy58LqGcZsSj/GOyTo+T
         FOav9IpgRTLLkXxxFJ7xcC6pIe02oPgtqMteiDPVW8y7C3NT/qAYGQvJPHAsAZ7Uexl+
         q1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709654456; x=1710259256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxUg3AxRiB6TIJXosfVD0lTwwq/nFBs+gkaA4km4gxU=;
        b=ZGh9921/T+fOt8PxUKmEk9bsE6e5gIZWIPKPgXtfgnjAD4QNrXvUnykC9tyUvldhNG
         Mgz1cBONgi7QiLA/V9V6zAPx5R+AI4S9DUoV3rOrRvH749/EBmyuz8HF4EzjD94KZpEs
         hJzNCOCo53G0sS+CTigjujnEGlHf3yrgrXmxrin780MfHMX2SBZEmMuvmOOWv1rE0Dsw
         +sMexTpVoz/AtDwX6aEC6rvNGUis5MGhrnjfjxkhT3al3zwh/9q8UdUCaQQWJmytkcvy
         p4qGXQwCkq+So8hsXfmBzhJZaFDev8g0RMVXSKGuMRGWL6LOfBZe+zNJw6hKuccyBtoZ
         Gshg==
X-Forwarded-Encrypted: i=1; AJvYcCV9ll14STQAJFhly9JlQ8Mv1yt4Y6W3lxp9GjUu4sARWwK1w/+1n/xbsFHDUFvpv+I5+goOMDL65gdpEg9Ta/7s7WLe/DVIAfTNk2HxshBV
X-Gm-Message-State: AOJu0Ywbhp3IpO0th8+Y4WD2pZlprXAlVL1BRVj0c5cS/UqIQW7iolv1
	htnzDQUKcWKLgQa3ae4L5XHBsNzBgL8bzKvN08sh+F2OSkcuL48PylL2T2EztNw=
X-Google-Smtp-Source: AGHT+IF57JrXYlAH5g59FQErQGOTRJzeoscMpRDMA4PwN4JJecNt3wRc1NRvWU7k57dYCHeOVs6BEA==
X-Received: by 2002:a19:8c1b:0:b0:513:472c:1f50 with SMTP id o27-20020a198c1b000000b00513472c1f50mr1704877lfd.52.1709654455835;
        Tue, 05 Mar 2024 08:00:55 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id mc18-20020a170906eb5200b00a3f28bf94f8sm6133612ejb.199.2024.03.05.08.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 08:00:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] riscv: dts: starfive: jh7100: fix root clock names
Date: Tue,  5 Mar 2024 17:00:46 +0100
Message-Id: <20240305160046.46337-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_080059_419552_8B03A284 
X-CRM114-Status: UNSURE (   8.75  )
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

JH7100 clock controller driver depends on certain root clock names.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdWw0dteXO2jw4cwGvzKcL6vmnb96C=qgPgUqNDMtF6X0Q@mail.gmail.com/
Fixes: f03606470886 ("riscv: dts: starfive: replace underscores in node names")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 90149e379c10..9a2e9583af88 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -116,6 +116,7 @@ cpu-crit {
 	osc_sys: osc-sys {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
+		clock-output-names = "osc_sys";
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
 	};
@@ -123,6 +124,7 @@ osc_sys: osc-sys {
 	osc_aud: osc-aud {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
+		clock-output-names = "osc_aud";
 		/* This value must be overridden by the board */
 		clock-frequency = <0>;
 	};
@@ -130,6 +132,7 @@ osc_aud: osc-aud {
 	gmac_rmii_ref: gmac-rmii-ref {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
+		clock-output-names = "gmac_rmii_ref";
 		/* Should be overridden by the board when needed */
 		clock-frequency = <0>;
 	};
@@ -137,6 +140,7 @@ gmac_rmii_ref: gmac-rmii-ref {
 	gmac_gr_mii_rxclk: gmac-gr-mii-rxclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
+		clock-output-names = "gmac_gr_mii_rxclk";
 		/* Should be overridden by the board when needed */
 		clock-frequency = <0>;
 	};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
