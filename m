Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E355E7E35D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 09:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXo3gP8EWm67+BxHV9xzKkuY5Kmx8vXgt0ZQmFB5Ptg=; b=nE+6DqcCDEQsMH
	eHeKqxLlAbbZVwKCC/gQ+7x9eEYU3y9Z/dlDUOxeB6ANpfWT46XXHKB8d2H2m3exHACI2BQsnYQRe
	QiUvBTa23CH16N6U4QtkC3qGHSKU5CvRRrc/JPZCCD/xZjwsTfiD1YSCGTk0yCtM+10LBLI3Zf/5B
	RNv/JSIku8l8GK0OQDqjIFfXFzot+KxH+RQzH76Qo7Je1tmRPQTUCJU1KnDLAEj30BGKB/gZfzYQh
	+mnV/9JQLWI9DlPoDrFKvielm8TzPcUXI5Jg3ihfCkfxMGxnKyn+6mFeLAA36c0DU22wyltpCcI6D
	7a/M2rPiQ8Ds6CwgbHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8b1U-00000001pPu-0GbU;
	Fri, 03 Apr 2026 09:41:04 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8b1Q-00000001pPB-1kTs
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 09:41:02 +0000
Received: from localhost.localdomain (unknown [116.25.95.185])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3972f1899;
	Fri, 3 Apr 2026 17:40:53 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: gaohan@iscas.ac.cn
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rabenda.cn@gmail.com,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v5 2/3] riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
Date: Fri,  3 Apr 2026 17:40:21 +0800
Message-Id: <20260403094021.229838-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6376799689e094253fb1dc0e3e27b491be46e9db.1775148159.git.gaohan@iscas.ac.cn>
References: <6376799689e094253fb1dc0e3e27b491be46e9db.1775148159.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-HM-Tid: 0a9d52b78a2e03a2kunma4e3e7aa59b1ed
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGh9DVh5NTB9IQh5NS08dHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNOWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_024100_639008_2855147B 
X-CRM114-Status: UNSURE (   4.30  )
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

Hi,

> @@ -91,6 +110,94 @@ &i2c8 {
>  	pinctrl-0 = <&i2c8_cfg>;
>  	pinctrl-names = "default";
>  	status = "okay";

Perhaps the previous i2c8 enabling patch could be merged with this one.
For the floating sections, I suggest marking them as "not connected":

```
		regulators {
			buck1 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3450000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			buck2 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3450000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			buck3_1v8: buck3 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <1800000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			buck4_3v3: buck4 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3300000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			buck5: buck5 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3450000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			buck6 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3450000>;
				regulator-ramp-delay = <5000>;
				regulator-always-on;
			};

			aldo1 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3400000>;
				regulator-boot-on;
			};

			aldo2 {
				/* not connected */
			};

			aldo3 {
				/* not connected */
			};

			aldo4 {
				/* not connected */
			};

			dldo1 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3400000>;
				regulator-boot-on;
			};

			dldo2 {
				/* not connected */
			};

			dldo3 {
				/* not connected */
			};

			dldo4 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3400000>;
				regulator-always-on;
			};

			dldo5 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3400000>;
			};

			dldo6 {
				regulator-min-microvolt = <500000>;
				regulator-max-microvolt = <3400000>;
				regulator-always-on;
			};

			dldo7 {
				/* not connected */
			};
		};
```

Thanks,
Chukun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
