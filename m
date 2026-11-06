Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448F0606A329
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 17:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xEAhzuok;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WNW2T8Lr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DoO77mHEpDHGrWTaOZ2xGLTY90thLfLvWxl9pTPqCd4=; b=xEAhzuok9mKt+PFqBQZSsvyjal
	+Vb23/9NS6216Irxn6YTfK/ctrrAA3d8AiWA//9YQ4rXTOpBY8wHmz2PPaZxqM81TuJlnKp1m0xJj
	4QXBvM3o5nrC8aOdZnngOT1G25Xsly7mHUYOC4yNVAOQuZYfni7S2Rh2YfRW5eUjbQ2wWsdd9kiw5
	BGYsDENKxoOgx5f0Tu62omAZ2+jzVKCmmsjsBleBnwP3h/f3KHPjyCNOH0GUGsKhNuldX6Q9QYPEi
	ya2DtH1/CIxjRpKdvmzLdJL84E9V5+X5dRCvxzQTndboKxeo5pIJzQhXWuIQPki8RMl5VZSlUKh6x
	Y64LK06Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOAf-0000000DJhW-1pt6;
	Fri, 06 Nov 2026 17:56:13 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOAd-0000000DJex-0IeJ
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 17:56:12 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-490d59c3edaso681232f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 09:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793987769; x=1794592569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3eWGx2zpAT4OXgx07lg3AYpdKyWukUrsNNsX1hEEVzo=;
        b=WNW2T8Lra4n7ZcCBqVbbtlVFiiUDsfKJN0gWUjvoOdJoK3vbkQPmaKHaW4fZWrRR/W
         esMU76zH2F1zYpFVMnNkoYbRQlTShaXPJG9DYS/L2h9M6O91XTh/4625gAXSyKtUKSHZ
         waG3hPmI7Rlxi/hmysXwEYVWci2289Ekok+RsTbqret9xyXAd/4LMiLbBRD8O2+fFsc4
         4aQj4RSW1eyjwoRET9EnaV+1J6lWczIsYbTeyz4peZ89um9VwYFn79AHkrQzN2eXZQah
         G3+NqZZZKWhilalm/cID771Io+KpyB7TMrfGsYh+Xuiq5R7t2V6OHP7A538EA74z5Ma6
         oj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987769; x=1794592569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3eWGx2zpAT4OXgx07lg3AYpdKyWukUrsNNsX1hEEVzo=;
        b=Kd5vehxOGJwFJOCtMtJaK7C4QMIA4dLoBh2pht6+bhO091I617jDOtUW666h5NvGpm
         gQd937+5dzUGRw0B+m+2vdL28bpDA0ElcK3EyWFN/a5WpWuJC93oDt6b745/9wqcVJWk
         zAu+YCMTPLFLx5R70Kk/YsvOtsjdi6ZKhBmzcgQHTAzvZogFr+VaSRRl4UvXH3KX9ODL
         Q4jlA3CT5BeqW06WEZVHFN9OM7o00ATLXJvDu1FUScmKISeOu/TBiGHPYJyr+dFKjmO6
         rSp36Mnh4xZ1fhN8DFSCMlU4rZwXbj6kDF0ZwgAjzTOyutmQ5OIAB7CNn7eFilA3Vgi6
         KWLg==
X-Forwarded-Encrypted: i=1; AL+hErE1O9yaU2DA7/ss+VIkNI9gQU0No5mh4T2QN4bRGr4qwIfLLhs323bQNHDul5BBbKZy0tYaG+n9U/HDHA==@lists.infradead.org
X-Gm-Message-State: APuU4Z96NO63vKMmf2OLmUS5ClECi6N9ga2eoZPmsEbNJsaPnNkFCuJd
	6TF97w1pBCCCWtyUW1xy5w11VgGxF2DRlER1+1m3fj2F0AjFsxK8628R
X-Gm-Gg: AYBFou1mPDMWnaRcbBZ6mpIQoHl2zwcEZYxbrbnRjw/ihutslI1tHqO13/oQqlrcr9A
	h3YtIX50xQ/IL+iUfICXQyxWbpKJ/a2sNCgBFbhaCvl43VmSu86MjIyY4DZttLo2c1xPP/YHrXc
	l5ETbopR0dLVeZhsItOnrHPJPiRV1c25gob8aBhM1yfx9mUCnUPHVEycEhaulny9arEsZAouu9j
	OFRM3WPxzUfkO8vWRbkFyKZ9Z3k1SE7NRJjyNlB4NizgGbL1po5GgZl6sc6PHl7YKwi7JENjgUT
	crPdSNBQldman+TPPx1lcBrWANMn5Gc2c1vXe4P6PiNhBU/onUIl/PvfxS6a0UHuKboQ5xBvC+F
	DQMvcBhq02mXrWi0a2lgeu2qLCf5D/E6F7N2QBIKvaM4cWYPxHEsgZPAnxLGkv9Tcd1VWePrMK0
	h+OUvaBLV5na3tAbZjcKLomgJPKeTuU1ZaEDRa5eNOcyBuWoAt0B2n9F1i9Aa98BIx3q8sEeacx
	YP/IK2zpl+EB0RckTD7v1bOQqWqQxhxNq8lQm7XexJElP5si9Utf/cBoG5Cuq4Cr50fdsFG0PDA
	d3D6NvgPSxypuhpDuKXJJYBP/tm6Uvg=
X-Received: by 2002:a05:6000:2c09:b0:488:8347:a110 with SMTP id ffacd0b85a97d-492777dc1fcmr7593332f8f.7.1793987768982;
        Fri, 06 Nov 2026 09:56:08 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723283dsm4649612f8f.23.2026.11.06.09.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:56:08 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH 3/3] riscv: dts: starfive: jh7110: Add the RTC node
Date: Fri,  6 Nov 2026 17:56:00 +0000
Message-ID: <20261106175600.3877614-4-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106175600.3877614-1-oo.hehir@gmail.com>
References: <20261106175600.3877614-1-oo.hehir@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_095611_126404_7B5CE834 
X-CRM114-Status: UNSURE (   7.87  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on a VisionFive 2 v1.3B.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 82ea63f71..14f92b942 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -1206,6 +1206,20 @@ pwrc: power-controller@17030000 {
 			#power-domain-cells = <1>;
 		};
 
+		rtc: rtc@17040000 {
+			compatible = "starfive,jh7110-rtc";
+			reg = <0x0 0x17040000 0x0 0x10000>;
+			interrupts = <10>, <11>, <12>;
+			interrupt-names = "ms-pulse", "sec-pulse", "rtc";
+			clocks = <&aoncrg JH7110_AONCLK_RTC_APB>,
+				 <&aoncrg JH7110_AONCLK_RTC_CAL>,
+				 <&aoncrg JH7110_AONCLK_RTC_32K>;
+			clock-names = "apb", "cal", "32k";
+			resets = <&aoncrg JH7110_AONRST_RTC_32K>,
+				 <&aoncrg JH7110_AONRST_RTC_APB>,
+				 <&aoncrg JH7110_AONRST_RTC_CAL>;
+		};
+
 		csi2rx: csi@19800000 {
 			compatible = "starfive,jh7110-csi2rx", "cdns,csi2rx";
 			reg = <0x0 0x19800000 0x0 0x10000>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
