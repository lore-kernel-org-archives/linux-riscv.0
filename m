Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC848606A335
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 01:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zj2FIHvc;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ej2PdTyW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XkC5UeSsb6J+PblsSMghk91jJ3cgePQKSeVx6MRDTgY=; b=Zj2FIHvciF6asZJUTnkjMRv5P9
	BIhE4WpJgzyx4ppf0fQGvaHMf7vdtcR9NsnyqH1A+Jnma3fZuhVwfibDFfvmP1NI2yo7iTd/utso8
	0WDN0sIcGiryraLaNaotzdXWjZw5lno0JFNyfV8+KZcAKWpBr2kMqPl1dVgLNzGhrVEva38zveXdH
	6ma3TeeZdiLMGaMciN9e0rpc2huryROpWvzCzNtMaCabpLC5KLP1HqSv6gDswoX3/ODsdMy+d7C52
	69V9to6lkk1EI0+YGsurr7e+jd7Ik1e747tCECCKZzMD4yWw9XlR0nCqw+Ar10WRAVOontUdpPRKQ
	9blfpV8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW1yO-00000008C1n-36K2;
	Wed, 25 Nov 2026 01:39:00 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW1yK-00000008BzO-3RaA
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 01:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795570727;
	bh=pOH/pz5YI6n5r4yeSn21B/P2nSnkvlBqbg8UUHq5vZU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=ej2PdTyWp2BLpKWOJlrXqbaQlnb8jf47akj+TqjC26FfCIlcH/07fHJj3hIC7P8gf
	 uiPVmy2QbVL9y4RnD8zBoEr4p2y5MrG/g2qOiX4PbBBuJFoRmt+MXzlgxB/oOjRxXV
	 Evv6ZgzsD4pyDP/YO1F+PUhIBQ1ejm13oIXNoqUo=
X-QQ-mid: zesmtpsz6t1795570726t3875f953
X-QQ-Originating-IP: 1pUHN2W2v/cwes8S0A48xd4P62TBf9qf6ZLNZV/KyCU=
Received: from = ( [183.48.244.245])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 09:38:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15465363206099856492
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 25 Nov 2026 01:38:22 +0000
Subject: [PATCH v3 3/5] riscv: dts: spacemit: Add the K1 APB timer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-spacemit-soc-timer-v3-3-e6390f3ae4a6@linux.spacemit.com>
References: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
In-Reply-To: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1252;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=MskIDgqPGeV/8XRXVLyf9Iga/gwF4QUehWI17LXRw8Y=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDNlsNqLsAtoNqulCF2yfnZpmX8D/xTC1TI7Raif/gt2Ox
 n2/HbZ1lLIwiHExyIopsnQ/4NlW4BNlWyBQ6Aszh5UJZAgDF6cATER/FcP/NNaXb88c5Ht6S/6I
 WLpuaEZs+dGL0Zl/09bON6jY8++iOyNDW2v2z+K4Z0e2V6mFxKtPOpNwlE88bNYe2cSATI71NVs
 5AQ==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NEAuM+RWOySTu/6gG6xcPy8RPcRCS9wqJdwA9O2ucA7v+gN6A2M2gXyx
	ofw0ZjUm8X4w4+PNDoUg1dlh7IKZ9J+8IBZTC4VfUK5YmFRFQmrObYdLMSSosCXgBixFoRw
	7E+PvHOsA5cgLemmWkOFK+3PwgqiIWXbfacOSOFf+NDg9V7aQLqYTJkz5t3Cbd/FLsYunFD
	Np6Ul2mXcSL+cmXHN5cIrZSYeClLFRFyHIU5XROVrFd0h+9J+4lfWbPnmK68AehiSXt0Bzr
	DdKQk8/HQ5XSH4J5YL4g4KgfQeYQgJbRLl4kgTEw+bLohyKmqfJ0xsiCXppFvJRX5QNC1IZ
	srPlDWRQlCzUr6OW3N57l6A5YO1XACcqeXaiYlW8VMvPDG8xpa6um+k6Mges0DRtyBmMfYz
	qTHCdeVesVz3O1qePPOvQM1H46TdQRZvkLnIGlCKC8myDQ9SVFxIDocjTC6xg7t6oFtVddO
	WjJVhUbh3c0VAXSIaLFLdRxTJhxY5sEenzuiWQPkEbygXT/9qlGHvH7Gr9ycXLs1sCdftpb
	KBjoGTGnfSTxIpqdEfRC/foPkkuPA28guFGfQoLSXIstzTRDhRquYfyMl7lqBEZXgogjFHv
	iVcQNxhsTLTYDCgegOx01/ev82gWVIfB0995avisxduqbs4oA0IsdNIaCK8zg+sHtdo4aPW
	xnd24tWbA6GzZf9sDziYt8OozNzxEcgBSUT0ifAbE5CmReB9MwqANtOMIB4tYZ/v2LqJMPn
	tOKxTbealQRulR2HKzH9MIZV3OzOivsgW7pw3RZX2PA9KRJTlHNA5zYE1uHiZzKDWXNrIUn
	EblgxSc2ktaC92Yq//X08ZxWaGz/WUbuPoIfVqjgn9AReCzcEPEK5xYaeKPy0EoEuEuPj66
	VHA1S51/bjvU9XRZr7Bd8q3MAPO3P4ZokNw18+8vdvcWKp+qbkZ8tkccIxZrWRoZYlqaf2I
	R+v4tFbwLUjHLX3ZkjVXEjA9SnD74Emn69BW81dxOye9emruucnnMGxL31alICp1GPn3usP
	tB6tmpmNKvxNHX8NLsI/HwnMBTeZzgFSOJRXdueX6LEmIcGJlYbY1ESMVzDERj+gKGtEtPD
	HOdm4w4Xa5GD0UdnbCYU88=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_173857_259700_CB1E7C74 
X-CRM114-Status: UNSURE (   7.60  )
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

Describe the first APB timer block and its counter 0 interrupt so it can
provide a shared clockevent. Connect its functional and bus clocks and
reset, and select the oscillator-derived 1 MHz input for a stable counter
rate independent of the PLLs.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 542bfc0d19f5..c3db90f6bf14 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -583,6 +583,18 @@ i2c5: i2c@d4013800 {
 			status = "disabled";
 		};
 
+		timer0: timer@d4014000 {
+			compatible = "spacemit,k1-timer";
+			reg = <0x0 0xd4014000 0x0 0x100>;
+			interrupts = <23>;
+			clocks = <&syscon_apbc CLK_TIMERS1>,
+				 <&syscon_apbc CLK_TIMERS1_BUS>;
+			clock-names = "func", "bus";
+			assigned-clocks = <&syscon_apbc CLK_TIMERS1>;
+			assigned-clock-rates = <1000000>;
+			resets = <&syscon_apbc RESET_TIMERS1>;
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
