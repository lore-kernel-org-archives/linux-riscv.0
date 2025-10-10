Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80806CCD183
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 01:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhilEBDL+067GgSlnffwWFdqKbPatmB6N0+Kq7REvOQ=; b=uE/uNeOt2igmyI
	jDzHDqY7Wivw34HB0A9N219g7nPGSqtPVOij2JEU/UhDyn/1iiiYsFfpU/m7ZCHXXgECT+lsaMoPJ
	LthJhCb+wgukLnxPk20zZOdaluoWCSt+4ykQa6upl4yCYEmzTaaS/DMG96h9WaW+KpUuSbn6/VYEO
	fZCgLRxjS1a62MGgi+9MswS7zugoO3M6pIMN7fOKK4tmYT6rqyyCn70nQ5QcFegt9dz46Z4upD7i8
	4aJGzpI9K+J42E/wj7xrAsHgWhpvRM3fBWVRYr1FQJe73uVz7zFOZvxMjvMXnmJ/hsnxutPwBfLSN
	jtLTIZdSBmf7UG4yMVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72P1-00000007TEK-0bE1;
	Fri, 10 Oct 2025 01:58:39 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72Oy-00000007T4H-20cu
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 01:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760061427;
	bh=LW8SLJdqAoSDw7GW9cUUMcMal45y7bSOQHFDO9blFuI=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=s8+TR4zlBe6b/UiWtfelNUE0Ebn/cZN3Ll3xD76JxJn9Dz/lEfzW47wprRe3oQsUw
	 OkOa1rSgfz/gyN5Hzarqf8oPYI+CbmpbLeGniD7+Bi4cnN2rydhW7csfwFwxGW6vz9
	 +v/GrfoYRSpx0gFf8LAD9K+XwJxTzDoyDQXXt7+Y=
X-QQ-mid: esmtpsz21t1760061419te84f3ea8
X-QQ-Originating-IP: ZWQ1xL+DZDYV8pAS//7JgtDaaEfZoNg0a5O0pI42V2k=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 10 Oct 2025 09:56:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10941913832204491341
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 10 Oct 2025 09:56:34 +0800
Subject: [PATCH v2 5/5] riscv: dts: spacemit: add Ethernet support for
 MusePi Pro
MIME-Version: 1.0
Message-Id: <20251010-k1-musepi-pro-dts-v2-5-6e1b491f6f3e@linux.spacemit.com>
References: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
In-Reply-To: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760061399; l=1192;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=8fVMPi0D436bKk5I12JlAgG0mrDgpoHjEOC1EVXL3+k=;
 b=9hQyo3rM7L6zXB5hetSkNx3wZrbLr3AeYBFyQtOSXpyVPaDQYrpKIHQ51TIISBfPsYlbPWxKa
 n5MuwHxuWS0BFH+9k+uCP3vgUNvyWCpw2RZTlGE8n7BP943ZTCfvDUc
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OKyB8qZPGK+t65CNnb5elH8DPN+7gPefgtESIxDtn72Ge5K3P7dpBMTy
	Qhvg27TW+XRnCzIt9cH32ziw4BdztcxB/jJGiN2xdv2dw85z92JFvqElXGpC74D94faWDQb
	G6gKgsLDrde4OkaZ7Y2s5yCMmYRyGTON9S32tyANxK2pf6a7LAz4SohTFkoy/Be+IGUGbax
	LQbxBaKI3ZbgJN8hZjBqglAIQh4x6PfjTpF9kWRJ1ed+QEIvSEMKCHqlr58wU1dPzl9kcd0
	IVEvGMGdc1kWlZmLQbVnbVASrOjx/rj7IQq1JrEjOQYgsgS5jj0YkUzHTNnOeziMzqNo97o
	hMf2+2Bkc0xsVOgJ6L4gteVfCAFFkVkg1JeTAWu9kgC+Fzurj1zorjshCivaJUe1DvAVWRr
	IfoC41I2CWPZVyxlryIc80wTvP2Umyl+hGuvIdh0xzi3m66h/OGPGn3ANZ6VSI4ObuHHffX
	fdT2ipit3Dz3oq8+6vkvFHZXeGTzb+FIKtUjkppMWTBiLKAS6zYKsTn7tc4r0bt5Tp11ugF
	8FhMRhMi75vdv2miTkwS7BDr5I/g4Jit0VBwdE5N/zdYTZXQKbI5ZOhTxsOACoAhbH0s+k7
	uRF8by6Fd9DLufFg7QonZ9EKYXSxZKircDFRrXu/CptrYPtbi9dlM+LTnZngpwWYkQ5QkmU
	8Rc7da2VUuIKb7CeKz9lAA6ayb8FIM2BZ5zm0MBYxJ2qA4+yfDZI7pcLYHxDH+LZ0jPIdrb
	xrSTBAMpNF2jg9wOs7J0MDfNLHVDaE1aLWNoIDcShvocE7uBDm4LCzgQ5dI+XPjiECIdRP5
	GflA3mZQxctgnioQHe7lB7w+lM60rfydeazxD8SrQa8QMsvVhM3NV8ub4xUHB27JnpktQkq
	GK+RYT5bAIk4dAplTYfEW6OVP9tjT8sWKS4vYlxAivZ/7p3iM4ozOnK9/UNww/mf1Wpj5EV
	2Kbvq7YLdPlL3uBonNGZvX9bte582Y1s5cIhclqixekgwYx3QmXgCUBpehKIZOkvgdvAxRc
	pk0tmI7PQyoHIsWH5mJQTRmM5Lgj0jMxokL4X02IdplxxcDckxhM3lICYOfVn6psfuIOHK1
	vHeUUn7Ol0yI68fInag2DyITl2LNBRZkkoBhRz+PQZTgWxpKz+/bOGqbAaquB+4+UentpyS
	lGjwc7uLNkxQByE=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_185836_966296_C7AB0C88 
X-CRM114-Status: UNSURE (   7.54  )
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

MusePi Pro features a single RGMII Ethernet port with
PHY reset controlled by GPIO.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 89a35914710bfd15c6ad27cd8d0de7ccf62e2309..e9a53dc7a417117c82f3e467677290bdaeffc845 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -47,6 +47,29 @@ &pdma {
 	status = "okay";
 };
 
+&eth0 {
+	phy-handle = <&rgmii0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&gmac0_cfg>;
+	pinctrl-names = "default";
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <0>;
+	status = "okay";
+
+	mdio-bus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		reset-gpios = <&gpio K1_GPIO(110) GPIO_ACTIVE_LOW>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <100000>;
+
+		rgmii0: phy@1 {
+			reg = <0x1>;
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	pinctrl-names = "default";

-- 
2.51.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
