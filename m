Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C1BC44501
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 01:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OymDgUkXMEQe6Ls2/2X/uMkri2I762Jv8mLS0JgtWfU=; b=gwZSHPEg9jgqQU
	LRfPsaUKIXl3r3DLLwtgTR+FDDCs/YqtOYq4lURVddZEJLo/w0jveXQse/AZX6xDV4z8/nqaeYbHp
	oUm5qBPei0XDOdd6MGD8PvkCVmdTAj72hm3aBctf/hQKuS5hTabIVC0v8MfwL8KMi/Ao+YMLCAHUg
	lHrK5htB8+7EO/MGQeu/wp6MvJCp7+hQup6I9YeQtrWy30A/sUDj/m4h1DqQ4tPV3tg7uBOwp6T+V
	ArmUNI42YoiGQEADClFpFFeIhB3o0ltVOj8VA8AHdvB8B4nCUj42+JLVFMNsHg2mSqAOpbDHEI0Mx
	kJnmKsNsJCEZ6WXJfKYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiMgR-000000066hh-2f4X;
	Sat, 11 Jul 2026 01:39:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiMgO-000000066hK-0ykD
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jul 2026 01:39:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c7cfa17fedso21368395ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 18:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783733947; x=1784338747; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EPEx0OGzOEwToO7NlEWG4WETIyrNl/GbYjEC6n6Sa/M=;
        b=Q6cz9VwGpHg2tK0s7MXMy2hRRseAd5DD0/RzdCcc8pItvXgNiiLAg463ihB5gH/bN+
         2zxh0b2BNMD1Ys1/X2fZi9f8ONZbaVAe2HIjoxRJpE7hEZWc3yDnYJOL4WpBmKx/1/Ow
         geUxBls5hySzwU/wSlJs18C/LwcbPSyO66hSpiucdSurRAurCP1QRxGuLpnz7m5YRQ8T
         SCXcMF0wcYZvHi++nYyv0yvcqiUTz1AkoozdWlLr7RphRkdBXJSlmIhU7J0u60Ew9mE4
         jlx9VUpR6JjaN3aPUYfQggRgoJUsIp5BWHeTWWciZ2c8YiK0s63tRiyJBWvQmKOa5xOG
         2fDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783733947; x=1784338747;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EPEx0OGzOEwToO7NlEWG4WETIyrNl/GbYjEC6n6Sa/M=;
        b=Xho0h1syQakLbLY38ty58NqYtR9ZQgIi6eYBWPFqBCAttGTLFVGRj0DqSHQhZTP2Y8
         yRfYOe4jXkVmWJhBi1eGRZ5cDYH0H8YqHLr6viYFKbz5xlCFPq0lLSzlUE5h82TgkZrw
         H2p/0MrlhyV3rIFbIWrbNq9lMI1KdWVWMUvoqMhPCw54QEQXNA6jg+s/qBSU1SEg1yPS
         Bn8I1gBSB0aR+UhVJlg8zNyWpMwLi2BkEgCG76PevvN1ru2TszbVW4E9+neW97iXhLBv
         PN9lAm2fdLtgtYNfXANFuW4jy7hfHZRRjGahT818m2kme0WAPwWLDBJFZB1Ad1Ny3Y4q
         rFxA==
X-Forwarded-Encrypted: i=1; AHgh+RqQAaHekqR99b3qDc0lVe4WdiKI1Rbt7JhQmaJiLxD4rg4W3ZSvoW1nDE5Bhegxh94QV0dkRNCKDULLIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtXoQQgaagX+aWyLzVgn75JgCYtI1qzxFHVidI62VK75bXY3Ri
	+fQFKrCvch8lZLMiViW1ShEomuPPVm7OLkJ61rqIXrdIeOhzeN3b2/eC
X-Gm-Gg: AfdE7cncY7Yty2dcmMUKoa3pjTCk1HBinH6UeJj4Oh6YQSCRpjib661ecG9Sxk41umq
	uvCo/ppA6swPCU+w8PSwd0rYfPk9lFMQVzLwsoMoAWqbstKBX2YEoaULDGCdChtMftbyUQ0FOvb
	CtRFeT1GJO7JoQb+tc+8RDPkgLOrwSrqeMbrhC/WMIHRtZ7S1KUCX56/sHPYj6xDyqhwTmEO1yV
	+/FOhEQXpxXoxjXQ6HAARpv2rL9b2oxQf5CRRwN5rM5I1r0pA082jKNvyPglUT7cXrHC+KJexzI
	ZOLcnyGdUY10pYGZhErBpsuB+p/iNelV8jOKOZhBiwXYJgfV83e233assj7I31H05x6RYG3U0nv
	vGutKtm2inx1ONg1lMecT8J4BrACZmix0/hVb3zcIvT+9cNgQEuX4PdTFeB3idhr2Z231nSdidB
	4Qik9JVsmQ83hhzP0/UkU=
X-Received: by 2002:a17:903:2a8d:b0:2ca:ecf6:910e with SMTP id d9443c01a7336-2ce9e1d907bmr13544725ad.0.1783733946772;
        Fri, 10 Jul 2026 18:39:06 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdf5sm67268535ad.73.2026.07.10.18.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:39:06 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Sat, 11 Jul 2026 09:38:52 +0800
Subject: [PATCH v3] riscv: dts: spacemit: k3: Add QSPI support for Pico-ITX
 board
MIME-Version: 1.0
Message-Id: <20260711-k3-pico-itx-qspi-v3-v3-1-d6b37fc86c39@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBswhayuEi1qGmsIyjQkiO6et
 HyL/x+IHIQjdMUDgZNEOfYMUxZA67gvjDJng1a6Vla1uBn0QgfKdeMZvWAyaF1TTZqUNkSQSx/
 Yyf1f++F9P8ikJQ1lAAAA
X-Change-ID: 20260709-k3-pico-itx-qspi-v3-7f81b2c023cc
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, wefu@redhat.com, 
 Aurelien Jarno <aurelien@aurel32.net>, Cody Kang <cody.kang.hk@outlook.com>, 
 Zhengyu He <hezhy472013@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4490; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=XpzDsD4EXMx2JkQDtGh7s6GqPeOccP/wJkLH4H3nCIk=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqUZ60HQKomjcD5WHgnMkKuhF0OaZzaLilmVWI+
 7OxoFqRj3WJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCalGetAAKCRDN9pw2gLgN
 2JLmD/9suwc0BL1mkz5u6f0XUVMQ7pgvXVmwhRzxTXJr5ZH8S20ubHZSf0dnhwNpBtvRaoEQpRR
 BXl8WX/ZXWi7JhAE77huOI+4A0jS+J5+Mc4+8Sf+l/IHMCO9M0PlmcpZqwFN9mpEERpLq7Jz9SB
 2fPl457P1u3kdjcKuSiVTADSzduYYFAZnOBMlLALyRG0XiRlrG2Tu/PcUe7tWn8LKeJWDdiyVF/
 ThnaXv2sV9FVUpknnK70F6mnp+ST9hLj7SvNTTkDDlcxoDBCsylFluHjpNUHVpamFkZNqJcm01q
 ct8sJ8vZzhVIMPOSmdlE5cPj8UNsjcPqsjkSgDP723i9UoR8BASKt28WtOr2cJkgIojkbbu+91X
 3Kc4s2S7TBNbsBRgom2n4b0okKSt9Dts6RdbZDZv7PLWs7ffcvTKjVGdneZ2pE8nFnBI0Cn9NX0
 CSauirlxmX/HFh5Tk0ef1qcYM1v7rRjjjViWOP42MlN0h9LHMWpMA0gPNmqy/LwQDVRgg3RUETR
 aunmN3zRO/1E8mkjQgko1TXuVLbupT4XqVzLuiwaKh67KGzEhLk/2YALOWI0jsDhcHoZSpEhvdg
 rxZ9yEilv56hT2HEQLmCI4S+1fSGH7++zGK/CPidNe4lPKaxPYlbdwLMaLAQl8k3FsmTN1I7rq1
 FB12tR/E9glhkZg==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_183908_306099_2A4C9268 
X-CRM114-Status: GOOD (  11.68  )
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

Enable QSPI with proper pinmux on the Pico-ITX board, and describe the
NOR flash wired to it.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
Changes in v3:
- Drop the already applied binding patch.
- Update the subject and simplify the commit message.
- Use the existing qspi_cfg label for the Pico-ITX pinctrl override.
- Rebase onto v7.2-rc2.

Changes in v2:
- Add "spacemit,k1-qspi" fallback to the K3 QSPI compatible.
- Reordered Signed-off-by trailers.

Base: v7.2-rc2

Here is version 2:
  https://lore.kernel.org/all/20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com/

Here is version 1:
  https://lore.kernel.org/r/20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 56 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 21 +++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 17 +++++++++
 3 files changed, 94 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..fd2b154f275a 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -200,6 +200,62 @@ phy0: phy@1 {
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
+		vcc-supply = <&aldo2>; /* PMIC_VCC1V8_QSPI */
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
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f3798..846d5e8cc783 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -679,6 +679,27 @@ pwm19-2-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	qspi_cfg: qspi-cfg {
+		qspi-pins {
+			pinmux = <K3_PADCONF(138, 0)>,	/* qspi dat0 */
+				 <K3_PADCONF(139, 0)>,	/* qspi dat1 */
+				 <K3_PADCONF(140, 0)>,	/* qspi dat2 */
+				 <K3_PADCONF(141, 0)>,	/* qspi dat3 */
+				 <K3_PADCONF(144, 0)>;	/* qspi clk */
+
+			bias-disable;
+			drive-strength = <25>;
+		};
+
+		qspi-cs0-pins {
+			pinmux = <K3_PADCONF(142, 0)>;	/* qspi cs0 */
+
+			bias-disable;
+			drive-strength = <25>;
+		};
+	};
+
 	/omit-if-no-ref/
 	uart0_0_cfg: uart0-0-cfg {
 		uart0-0-pins {
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..9a49dd8032bf 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1099,6 +1099,23 @@ pll: clock-controller@d4090000 {
 			#clock-cells = <1>;
 		};
 
+		qspi: spi@d420c000 {
+			compatible = "spacemit,k3-qspi",
+				     "spacemit,k1-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0xd420c000 0x0 0x1000>,
+			      <0x0 0xb8000000 0x0 0xc00000>;
+			reg-names = "QuadSPI", "QuadSPI-memory";
+			clocks = <&syscon_apmu CLK_APMU_QSPI_BUS>,
+				 <&syscon_apmu CLK_APMU_QSPI>;
+			clock-names = "qspi_en", "qspi";
+			resets = <&syscon_apmu RESET_APMU_QSPI>,
+				 <&syscon_apmu RESET_APMU_QSPI_BUS>;
+			interrupts = <117 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k3-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;

---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260709-k3-pico-itx-qspi-v3-7f81b2c023cc

Best regards,
-- 
Zhengyu He <hezhy472013@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
