Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0918FEC01B4
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 10:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7NDTB8vprkFfyd8/bSvBFxzBBxiLEE7p0TWtUpnMvE=; b=tYz6a4V6lp8PiH
	FdrK4QJk3D08yaTmAVgNsWdHt0+QGYkc8uSqQgiDxm6C1XXBqTuWgK6ICtSEmhqvgF4DowPFIvxSe
	UIX1MvsdxkbgvW38sEcNCEdW98/qvLDsns9CTOTC4sq3Ae7V9GHHZ8gG+q7V7Rw0OAbWRWGFyTkFQ
	Q7z5uFfJoDJUVFD9t8QngUm/W/B/uAg9MP686yN12qnUt0tWk61EMn+k0pcqs7Y2p6Si6+8rcgLOj
	BCpx8So+0FAq0ab9nWb0TMWATDpWoovwvabF/iIjTiPz/ZG15dsN0bcsoZg6nu6nD1Gy+GBW4Ce9N
	W8uqU6EipYIXSb0gOAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cNv-0000000GU6q-0UsD;
	Mon, 23 Mar 2026 10:19:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cNs-0000000GU4O-20ap
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 10:19:45 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so27299865e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 03:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261183; x=1774865983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Zbg7NdVFVfV/LiASAwN6OwVtEgN5JVFcgTwCKtL1AE=;
        b=fLJrxx7cs+HNTC80Ix9cAAU21e9ElZ5kF8AdJ51AEW+dAHyZHHBie/f+0jQem2SZKP
         ZhI/GVubgWRvT+W2izvnyfAMRm8HfLWtxVlqUVSzyk+WxJH5isN5/QA4FM54oYvjctgO
         DuHGqAjeS3X+uxVRuPRP6Ri/Y52t7QMkcbEU/f5+gwA0zY+LnZJvzUo6nDAhWFPCIQZp
         mEdzxXO+pPVVtv0tRTNu3F83TVgrf7guBTypYneUVQuoe4xmZ7cm9BfRwtRHlRVw0W8o
         nugEUnkdFFMmgrVkowm7DE8yrYIFNT0ZGzv2Ymdapm50RJ62QAcm1tDEyTK0M4pu4b/U
         NPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261183; x=1774865983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Zbg7NdVFVfV/LiASAwN6OwVtEgN5JVFcgTwCKtL1AE=;
        b=QCEqHcS4odYiSRUrsebA9Ig1c76boREOBGlDZ/g7N6JxVi6uhOV7MbXd7feeagjyH8
         BmcxYMrkkFTMcnhQvYA2gEe+ztt0tAb1OudMdWYM91VO3gOqVrzpUAQcbaxyGHCyjfXl
         9a29tkr8yhgVL0bkgOpXTDy2Ij6CU2+/9DijJzQsULsfFqFn9NkjKUbMsJhakTwsovwk
         6XEinzvSyE0u2ZHRYcUe913onErKjYEMwOuIp5CinD3ySJ490rYAFkr1eBU+FA80xmto
         0CDsJ8D5DdVHjOQ/bOKfxQiQTYb8my+lc/5/rv9y6F+FfiLycE1rwyVft+m70Xlo8GcX
         5xpw==
X-Forwarded-Encrypted: i=1; AJvYcCW869nCX3r+NyZYccCRclLQ1T08jXNUuH1VKUHf/0qldHOmFIrz//k08mhqdTwUDqHWeOl8o/pKeox2lA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCJXf/7Q+bTLPHaUzR352t1QEa9gd9+2hbVc7KlIOPrx8I3Tcg
	1wADYkh/vCFze3yKlKasn+RFtC6zrxquA6Nif2yZrB9dgmAy44apS6nCYFndNA==
X-Gm-Gg: ATEYQzzCvRmCAZIrG111lbfz9VqFu1wx5rEvJiXMJY3WMs8Cjy2mT3n+mcQ/86Tx0Ve
	B3vANBIw9It+Ug9b0kduQm5K2VVd1ReLGyRhgp8DyM+k+r83/1a/O/AH/ZyzEHSOYEioARMrgwX
	9vScQ3RPD3UVVE/rvOxzqSxoNwQUWII1H8GfhBwSXdgzg0Vhy+9SBi2MxmyHPTIzHR6ydQXFZkI
	Fd0NkM/mpUKFv4b7UlmY/Zu6wearNRh2VkhgVuTwSAuu81yDdjnyvCP6fAL6AxX3gkfZL5YZq/X
	mtiUo70OT8k988Sglg7Vjqx6yega+Khp/rEA5Mk1zP7ENUmpYZvBVqGqqQpo2FGmByviRmtCKGh
	KHzUOpGOYm4RvLWB6TZAlzv/C2dD7hBlpPFYnyMkRQooCriookvbeExuaiNFfaenPlpU+rMMR8/
	c+NLyatVoERj7hYO443JXKA0jpf89XcIv3u5cu/L1pBISkzdedRrsycIyXiU5NcKK0
X-Received: by 2002:a05:600c:45c7:b0:485:3fd1:9936 with SMTP id 5b1f17b1804b1-486fede721amr149755185e9.5.1774261182461;
        Mon, 23 Mar 2026 03:19:42 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:41 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:10 +0100
Subject: [PATCH v4 7/8] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260323-orangepi-sd-card-uhs-v4-7-567c9775fd0e@gmail.com>
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_031944_546145_E74D1EAB 
X-CRM114-Status: UNSURE (   9.90  )
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

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Suggested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 404b69c47b91f8c37d74a3031dbad0d94a28d1b4..6d042f905d233bde2e29d1366bd177b41915ce4b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -222,7 +222,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -243,7 +243,7 @@ buck6 {
 				regulator-always-on;
 			};
 
-			aldo1 {
+			aldo1: aldo1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -369,3 +369,23 @@ hub_3_0: hub@2 {
 		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	broken-cd;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
