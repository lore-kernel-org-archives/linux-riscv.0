Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA11F606A326
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ueHpW2eX;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Ti+0JCyg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w7oH07pxYTi2rHwZTW10cFC+X3kWJweRrY64IbsV/MY=; b=ueHpW2eXmUBZB7SYvFFobHJNDK
	RXD5ZMogaLlTXVfAwU64WUP7Q3JzDFKvDk0lnYbhV+v35Qkxu94eZcDROxKdjvJ5RZHqTc6nnq9XL
	oC2lN/M1qyCuM3QeSs23PexD6TXW6bHUL2+hFQWuHDsSQMvWW9cmfRlXYVEf/M0uHQcH2SmvW64vv
	8GONh9XFp92OLtRAcuBS5zDL4mTe7DKzXfgGP3qtPX3twa9k2sRwPWoqDGSPPBxifaYiU8e7NrUs6
	fEAT1gHAsdLG04tto3Fqa7OLC6rpG0/mMB41pWHPbToLgPExvaDIEmc4CkWDGTh3x9161SW8LitFi
	4ie8fzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsmC-000000089Ai-3a15;
	Thu, 05 Nov 2026 08:24:52 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsm9-0000000895z-1Hl8
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867042;
	bh=ex5QciF8HsRuD6/z7Bnz92BFaI2r9RvhM5A2PdC/ryk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Ti+0JCygyDlUpJxysiAR+jbOJwOHWW8/sS74ZrWCtI0lHnduuwCcgiSDuhJalF4Zi
	 zOvgjyrWjzj2RqrBS21ajLabaQlpd05WsFQVk+z7BZq9fVWWJ1ngE2wG8ZAb6tmo5W
	 OGnHCSLuJrNfj9yrz0x2u1sfLKWAzyuULYxAE3Us=
X-QQ-mid: esmtpgz13t1793867040tc4a0437c
X-QQ-Originating-IP: o6lwSprFVEZUSfcqPwVGLLBhBzK/F2cLTxbydJuQmYo=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:23:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6585883940759934299
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:23:47 +0000
Subject: [PATCH 2/5] riscv: dts: spacemit: k3-com260: Move SD card to the
 module
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-2-138b39d74602@linux.spacemit.com>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=FW3v+X/LP3K9lLC4PILHOwlmTUeSvDKD94xp6NZYOuw=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbEU+GO6Z71S3biWL2vpfdyr33M1fULEsTOfj83188
 teffDO93FHKwiDGxSArpsjS/YBnW4FPlG2BQKEvzBxWJpAhDFycAjCR4GSG//lqBhuif75SK2DP
 b71lcDZhr8OHgH8zj/I9YYzX3zclN53hv4eEAX9EG9fedYWtMwKvOPJkBK/8bNzxWn5BTqPJ1AW
 mvAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MmjslNbgB3jamTJrc8F+c+vDArg7XfFN+JuTVmtGT1SJMtLhJwKPm6wz
	FSnFxFu1unWTdjcqaFbA0vy8oXv6CyHK5uugzbQVQA7vUFmOVwOoZw2QOJQ0D7oh2D6WeqY
	TzKdavVXfxL9ITrmIXuiDD/LclyZ/jFnbcKLZ4HzAp9BTqGxYRErG7b82OUwsGvGZB5EP88
	cHmKx0esjy3KnaTFIpEgpANp0YsvetYxRj+UEU4wMVfKUNhJuO/vi9Zxg3YxOZbN+5HCayU
	MArPXs166zasAR2uAFxksVvSJXVz/DbYfmBtxqYC1bMkEYGqJ4Xscc0eG5nVpc0xXQgOsv+
	DU3y4YKpnU3KKaga0pbyi6nfa3+stHov43NNvQYRyPZL3ufHdeqSK+g08h3XjNt+0ulQwZD
	3C7tHmE1BmaqTA8zsDjWoLR2CXpHRlYUq9Rrp5/UJf2QfYSZSWpkgkQhDxd7280Tx6pGzBo
	h8yVQRL790gCTi5Wvv+9M07JFWSubje/VtW9h9SAwwiTl7ks/f3qqU4qYVGrFf9IisIOsNt
	xjdWQCpJjT0qm4eiZZ4fdL235MGttHV4qoUBSgFaP9pfi04hd7d1/w8tKwBcIgeNHIrlK/Q
	x5jCsAlUAUImZH65z8Lax0XdfmkBqBMREL0THucp+Rlq5LRBrG2+voNo2hEwFX39KFs0JVy
	Xl8kRtgIypkqXtg56iqVr8Uz75lsLV4j/dLH6krX9UYc7S010boN3hVE2FwY/DcjzNc5GX1
	cW46nrt5Bp6Va0V0LDb+9E+REMynn2AmEpwbnUuRJ7VEBmuWESOi9vRSZ1DnxWcomhtooLX
	bBdkW3CRtGbtG6SlwmTgyhXFilR97sH5xyUFGWOMtKYHs6JeUcmHTPemRhZwue7wDAtPsyo
	CTnmxHU4uwpV03t+Jpb2iU5EIf1KlXoD0Jp89GL8S8aQgskT3zPSoqnrAis+cMEiJ8dV30e
	Hjfzys31D3crk4ICR2qA1nOjeDDcBRewd6OgxUNDuWNM4y/BQYSHmK0VzlL1ij1XaH5BVZ1
	o7QA3koPse8oRBXKiYGpiC6mMrKAkyxI8vPhVu1j79FRu8/pMA2ecMa9xm/EKDWlJYNgCLP
	qlqGYKU5WA2+fnu83+j8KLw0ZRJ5T1FBHRdCDKkCFYdnYW7w2U/3RZzax6VIduFaJCJry9S
	KEciPz1mKHW1se8=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_002450_104519_4BEB6E54 
X-CRM114-Status: UNSURE (   7.27  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SD card slot, its power supply and the signal-voltage switching
circuitry reside on the K3 CoM260 module. Describing the slot only in
the IFX carrier board leaves other CoM260 carriers without this shared
hardware description.

Move the SD controller configuration into the module include without
changing its properties, so every carrier using the module inherits it.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 17 -----------------
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi    | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 6e295bc6f196..38809d01df82 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -111,20 +111,3 @@ hub_3_0: hub@2 {
 &usb3b_u2phy {
 	status = "okay";
 };
-
-&sdhci0 {
-	pinctrl-names = "default","uhs";
-	pinctrl-0 = <&mmc1_cfg>;
-	pinctrl-1 = <&mmc1_uhs_cfg>;
-	bus-width = <4>;
-	cd-gpios = <&gpio K3_GPIO(4) GPIO_ACTIVE_HIGH>;
-	no-mmc;
-	no-sdio;
-	disable-wp;
-	cap-sd-highspeed;
-	vqmmc-supply = <&aldo1>;
-	sd-uhs-sdr25;
-	sd-uhs-sdr50;
-	sd-uhs-sdr104;
-	status = "okay";
-};
diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 054bfff7413a..f2df797a2c80 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -233,6 +233,23 @@ phy1: ethernet-phy@1 {
 	};
 };
 
+&sdhci0 {
+	pinctrl-names = "default","uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K3_GPIO(4) GPIO_ACTIVE_HIGH>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
