Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C35F606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vb85ausC;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=fV110O3u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=osj30uXUPMSjuI+yQlAnXlzPSI0YccIzqntyLOFPEZY=; b=vb85ausCSmg2sPfUWXyiGgEI3B
	91F8s/+otysqHJ8tYmKE+AsgxrKsIrESrpcHvOyCO8zm8SE6O/JsuDJD6mZuYv5qbr0DeBx05utso
	4P3k1bqoCdVDZkF4VUWy6alqEleABUjeMK4+EKHsWzDKwY77fchfeP5QRhJGhBMz8xKgsFQrIjlw/
	uTXWqvyN2Hl03+g9gmmXSM1R8aM6WHUwr/CrtJVNT2V3X72YK7lWF1PG2n1zCnCo9AbOAKvVzju+k
	f6pxw3aKy2o2bSw26H3kMUNbPS9aadjgsBOzMP6fedqhHXnbn8YIJUAjzSA4yzm56ugGSUF1bNjpY
	lntSvG4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsm5-0000000897K-0Rzz;
	Thu, 05 Nov 2026 08:24:46 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOslu-00000008932-0mq0
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867046;
	bh=AP0zRsZ9xsH1/txX8W8F6xW2ty4IlAtLIMu5KyXAlxg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=fV110O3uo4e3D76xP7mofzd7HKt4j62w1Mg4F3MnDICurpwG0Fjn3/v0PmnU9Kp1M
	 AcAUUfzUZhw3oAA3KcxLgNzhgcOsQCd4LqfC6gRhPKQJ7q6i2PyiZFc5tHZKL3OovM
	 ceC7GIMldThm0FT9u7er6a3q+SHrMRn/vXV8ZUM0=
X-QQ-mid: esmtpgz14t1793867044t097a89bc
X-QQ-Originating-IP: bfC0YRYM6S4tUriZljan2rXWt1UUFrNrbDpzva5BQSo=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:24:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13664405851354263933
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:23:48 +0000
Subject: [PATCH 3/5] riscv: dts: spacemit: k3-com260: Add SPI NOR flash
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-3-138b39d74602@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=BqkZaDMkvSW+3nj/8yfgq4f+zkX9e4PcXZEkcZcCU0M=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbEUm9z9SMv/FbyKj/Xzf16MNJ6R9XPhMmr63+VfP5
 fSoXMzaUcrCIMbFICumyNL9gGdbgU+UbYFAoS/MHFYmkCEMXJwCMBHLFkaGPcwxq+yWVZQsDPH2
 ZhTY+1O784t52t7WqIbUD/HL99tKMjIsTJeJWcTjKSU3zV0869bUbTyP2V7HTthjfSHCyHvhLSF
 OAA==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MbuzFk2nEjG+5OAbDusMCcPFJlp929TRXA+NR5awNZuZ0I9jiMSpAaNP
	QElvP6Rz7A8wAJ8JCIXjLU3/WKFoL2so23DWI0qyYsSBpeAw9VmRkNvbQFip7Nm1LDqUGq+
	NyUwgzxaK3n9s9qELDQYB0reS/gjfFEOoz7x+ACEKxVG52aYvggciDRKo7+NGSHMkFWj3gq
	wVZHmEKv+Fjs+3XrBKTsUlQgad3qNV9NDDKhWvrJFyQR1JGdt1SUUb5yRTbJTilWmr4Zjye
	cKVbyf7HQUCEAjhXYVTxymyCED8aIEpS+6amZrHR4ZIz7k1S4+17MjUMOtuTt/K2xU2geJE
	KTVOS9SJb9ogvo11EGyIpIxyp4uVHPTabj8pwUqbsAvTauWbnM5vG1pENeixYup38+QlsqH
	9II2ngJEokNp3E/g5wpr5NS0WBP0Y24Xiika0eFJKmNbUTmMmXc4M1sL6vR0ahndlibsE3K
	Pod6Jkm+uVB4G+9bakg6zt8YYCxu01yJ8z36u6t4asrIG5jKMJThPVmu5DotNqTywH6Qk7A
	rycsW/z51DV9pF5vUEKOXhpu4SK+XSYyjSAATs1yg8DvNCHKP1mx+gqkbNkgymuY6iARpIq
	InbE3ubHcn7AWuG8nRgoOXE91prLMkMwdjCIjreXkaYDS02rdskt3oZ2HMNKgVdxw6OOlL3
	e6kRz8qrxBy6lv83yPr+Lpnivma1lvFuVT+Wj8qVrQruGlQzKk8xvCcvmEYP7yZfzlboyhh
	IWKQiqOHvDdvppVBOfVyNs+0X3kQXjV4V4E+fh9+wZeEmv6n62nWrnw/waiVk0GfwfwtExM
	krUEpQLzi2ekreffx8yLyJmenRkddAvQoBuN44cIjBEq7NDIdy+6zGd77yr6i8IxHJmJxvf
	S8PNPlPjz0nJqina/nnjmW7TYab/bGTU3ETDMUwt86CO6diveahgNvl/np/aKix5ctqUxvB
	PDyZ7Fcgw7U+rDPGgWMLHocQkuuXmhrBZ1GkyjZaoMBYz6YvG/lvLuS8mO40vwEKVrxcs5K
	khY298Fz104MpKXkLeDIg30a8tMJzx2DnmNpZHK0byCS07qwixZPMMpLB22FVllabsdx1AX
	izxFcb5K7KO33W7VmZFLQfhK8reiJXzkfb8miSTAVF6eqmFao15SwuoJqjUvx/TskdjmW85
	aiR3HGk/lTwCn1JqzdDPONu2rQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_002434_757719_18265871 
X-CRM114-Status: UNSURE (   7.95  )
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

The K3 CoM260 module carries the SPI NOR flash that holds the boot
firmware. Enable the QSPI controller with its 1.8 V pin configuration
and describe the flash together with the partition layout used by the
boot firmware, so that every carrier using the module gets access to
it.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 55 +++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index f2df797a2c80..f94607cb2eeb 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -233,6 +233,61 @@ phy1: ethernet-phy@1 {
 	};
 };
 
+&qspi_cfg {
+	qspi-pins {
+		power-source = <1800>;
+	};
+
+	qspi-cs0-pins {
+		power-source = <1800>;
+	};
+};
+
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <26500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x20000>;
+			};
+
+			fsbl@20000 {
+				reg = <0x20000 0x80000>;
+			};
+
+			env@a0000 {
+				reg = <0xa0000 0x10000>;
+			};
+
+			esos@b0000 {
+				reg = <0xb0000 0x100000>;
+			};
+
+			opensbi@1b0000 {
+				reg = <0x1b0000 0x60000>;
+			};
+
+			uboot@210000 {
+				reg = <0x210000 0x5f0000>;
+			};
+		};
+	};
+};
+
 &sdhci0 {
 	pinctrl-names = "default","uhs";
 	pinctrl-0 = <&mmc1_cfg>;

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
