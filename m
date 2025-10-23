Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D337ACCF9E5
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 18:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ppH355ehZrupv1KAGN5CzsaB1SqYgqrrCByt0mlrDI0=; b=ADYmlEcPmFjucy
	Sox5Qz5+ol8BbsGOtyghkxOb+jXkSDfmHg2kWQPplohuMGJTFPpQ/dO3aX3mStCcIb8ZEwSuBZbfg
	RdjpmvFgMf/U4kyUXwwL0wAF+YWtrbA0iLoht3Ze1z+/bTI4eOqQmLNs1gWx6tcCoFJZcpy/omYaN
	HUOgaKWzpzD7IHBaVZPNBR4x/Ku9ndsdwvhSx1ChIEwNhKiMZnyaCIxcpEopM94R2jGS/r4iC7SGA
	CRX+Df/ZJUjEU2+yeVZCH0k+tIO2pkfG+Ll7pbUwWvHsYEuBDxap/nxFVEKe0lABYDLd5r7/cMpNL
	ebaJqJ08r7jwNzBNzyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzb7-000000078BV-2iUi;
	Thu, 23 Oct 2025 17:59:37 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzb4-0000000789j-3bc1
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 17:59:36 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-33067909400so867599a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 10:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242374; x=1761847174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/0R3e5CbG34zw1DZffq6WeOG5UrZqNxxyPe6S2P55U=;
        b=YqHmLCSQAxFQCVU3WTQ8/gXq+1vyo4Bb1+P7xpJJdpDojnBrHV1gkmX/k/HU7YwY5N
         fr20BToxkiOZgczlLgEazZHM+Q1mHima0FvdH/5LcXgR/++/CR+qP+vQnnqHrPloqBGX
         749Kcs0PfZ9drBd0udO9HkQmobmPzGb56EP4SsZh9f9GE2JHiP8kPXVDYzsOfWtnScr/
         /cw9LLs1fZgxRJhgAdTPesTgLSHTa/q8UT5Cyt31c1I6fLlEtY/lrgsM9sGqRDa3wbEq
         bNjaplUGp/AJXbDwR6SJI3C8jXafkd4ZWWjXwzmGfcyDUDNMKBbTTpvMLLLHwqVf3yAO
         9Xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242374; x=1761847174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/0R3e5CbG34zw1DZffq6WeOG5UrZqNxxyPe6S2P55U=;
        b=sMu/juTYVT5q5nKH7vb3HmBDJGFO6kiQkMX6hTEbctiqDdzf6Ye2x4+7+Rn9aVZ+5T
         yvf9FkAWV4AiuWwSr17rbehZy7QpJii+CrgViIA/r4wIapYXSxL7MWhz3HKXeeG7Hlqh
         y9AZsRluiH/smBFnULlmLZiUlQ1Cn3CSSHoohmcSMv7MbvU1qjdiBKVznhkxIX3palbL
         1+4Jjx68t3lx+OGJ7vOyAz3HOaszH63HsKcI6G/OSOaF40oHODXIwRk3denqdc8EjOZe
         savFTvmpUbE49yjVY5BDjGNJeUykTatsAJS18GUX1I/Y4T6nZy37nhAAH/fAZYZBf2fl
         bFAg==
X-Forwarded-Encrypted: i=1; AJvYcCViJdMNhh3XAIlhQ7ytxKd5+VtQFbahxqo+9aU24AnfZCddjblqoDNBJnOPAZmm3GVA3kk5dpfKu2zpiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRlU5NRDEPxhLPgEvKUwRo3BgaeCwEq+TE5X92IXYWUKt0iqay
	tV982afiHEknnVCBKZcIBpdiqQAcUHOrCsLVT1+n/DuAZVQnfcl8B1vCk5EpQ51bT+A=
X-Gm-Gg: ASbGncsnamIGElMJoqUWJ8KMFKvK/j7O2XsFkXL1+CwafGlHnRdzCu2/NJZbPKb6kX9
	G+84AeZSVEWC5Hm3QF+rBrDXqTA9qSh2KVu16ItBHznsHRncYyaQ2Dj3/MWdcg5reR+B7v/BEmQ
	tyfdcTgFa/ELpIkfLzu3nq02nUGd3z1yYIBbTtYDiliKFaVjgWFhrtMcXuZaCJ7rgsPOdAyrT3d
	fEPFeAsof0d3gSpAGl4ySSH2204kvyYzKSduzZNu3xalsWKrQAMWwi1UBHMPvuVWPVCVy36aODH
	/wAPVtSgx+6jkkJBc6PTFIdGog6vaYaM1F1Syh1V5wQFAk9vr1n1AW8hGCJN84iemKxXXKsKk01
	7Px/MATs5/V0nNZzYnBeDJED9VTR4N6KyTftTrCe9Do5toMgS10Ps3SD9J/3f4iIGPaGR2su9fs
	9yX67KBzCDYcg8KGyK65x2uPvY3dsQtPQVtw==
X-Google-Smtp-Source: AGHT+IHVBHP0VNMgL4i11Hlpfi39kzITsFSqD4nvg71vtIarn49Ipd8vSMUYzNOXYVvvOjEu2JoRZw==
X-Received: by 2002:a17:90b:1b05:b0:338:3789:2e89 with SMTP id 98e67ed59e1d1-33fafbab393mr4375317a91.10.1761242374092;
        Thu, 23 Oct 2025 10:59:34 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:33 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Frank.li@nxp.com,
	guodong@riscstar.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
Date: Thu, 23 Oct 2025 12:59:20 -0500
Message-ID: <20251023175922.528868-9-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023175922.528868-1-elder@riscstar.com>
References: <20251023175922.528868-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_105934_901883_24EAD2B6 
X-CRM114-Status: UNSURE (   9.73  )
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

Define DTS nodes to enable support for QSPI on the K1 SoC, including the
pin control configuration used.  Enable QSPI on the Banana Pi BPI-F3 board.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 21 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 ++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 33ca816bfd4b3..2f3750f7fd6f3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -258,6 +258,12 @@ dldo7 {
 	};
 };
 
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 4eef81d583f3d..e922e05ff856d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -73,6 +73,27 @@ i2c8-0-pins {
 		};
 	};
 
+	qspi_cfg: qspi-cfg {
+		qspi-pins {
+			pinmux = <K1_PADCONF(98, 0)>,    /* QSPI_DATA3 */
+				 <K1_PADCONF(99, 0)>,    /* QSPI_DATA2 */
+				 <K1_PADCONF(100, 0)>,   /* QSPI_DATA1 */
+				 <K1_PADCONF(101, 0)>,   /* QSPI_DATA0 */
+				 <K1_PADCONF(102, 0)>;   /* QSPI_CLK */
+
+			bias-disable;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		qspi-cs1-pins {
+			pinmux = <K1_PADCONF(103, 0)>;   /* QSPI_CS1 */
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+	};
+
 	/omit-if-no-ref/
 	uart0_0_cfg: uart0-0-cfg {
 		uart0-0-pins {
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index af35f9cd64351..47f97105bff0b 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -823,6 +823,22 @@ uart9: serial@d4017800 {
 				status = "disabled";
 			};
 
+			qspi: spi@d420c000 {
+				compatible = "spacemit,k1-qspi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x0 0xd420c000 0x0 0x1000>,
+				      <0x0 0xb8000000 0x0 0xc00000>;
+				reg-names = "QuadSPI", "QuadSPI-memory";
+				clocks = <&syscon_apmu CLK_QSPI_BUS>,
+					 <&syscon_apmu CLK_QSPI>;
+				clock-names = "qspi_en", "qspi";
+				resets = <&syscon_apmu RESET_QSPI>,
+					 <&syscon_apmu RESET_QSPI_BUS>;
+				interrupts = <117>;
+				status = "disabled";
+			};
+
 			/* sec_uart1: 0xf0612000, not available from Linux */
 		};
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
