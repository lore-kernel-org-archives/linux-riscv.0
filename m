Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD8E606A329
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CAujrWNb;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=sZdgYVpU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XkC5UeSsb6J+PblsSMghk91jJ3cgePQKSeVx6MRDTgY=; b=CAujrWNbUzY36eui2XObeHUSuS
	PzTGhjetJpUuvguwsyySWG/3OlScHoED4C5va6WqCMalsMO5y3jyJWklCbJzprJGJQ4aKcMUtImJQ
	ECJyKUn+zRYtGEtxGJ+vDw30ZHThcQ4IwNclr+CrWbmHUrQgb8ZEdEOuAwrWXlqOPAr/LqxIQYfGW
	6OI/53UkiOqXJdwztXFu0oCTpqwq0PP3ycPR4Ggpqt0wxklu3Ex2z1L45I/H9JkJsDb3xO1aTgadE
	ORJPdutYSNVCdY0S3VQM9QiMUjU4Ihhbutjv42CkUdhDz/zq6LW5pfPKXQGeadKymG9bBYLhWNWar
	U30bb93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFl5-00000005AdA-0fc5;
	Tue, 17 Nov 2026 09:45:47 +0000
Received: from bg1.exmail.qq.com ([114.132.67.179])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFkt-00000005AUS-49RE
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 09:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794908729;
	bh=pOH/pz5YI6n5r4yeSn21B/P2nSnkvlBqbg8UUHq5vZU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=sZdgYVpUJOYrzs2SoxyKM7If0LqoVedJ5OYlse3/WBG9fGbJqukvBzAO7Lqxj/B5W
	 9Y+Cecj25mWmvST2SbgLBb62Slp8H8pTyW1EWG8DB2xDezxRXbdmlrtnknXk/v+L4+
	 b3dUiPDxDJbTHsq+yhg8V4LJvXmP/IGQxQsxv1Ig=
X-QQ-mid: esmtpgz11t1794908728t9ebeb6f1
X-QQ-Originating-IP: GEu/9t1WGpIJN4mjgOPuwdHRUF2MxTJkCqGcgSUWFFo=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 17:45:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14707964283917326851
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 17 Nov 2026 09:45:11 +0000
Subject: [PATCH v2 3/5] riscv: dts: spacemit: Add the K1 APB timer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-spacemit-soc-timer-v2-3-9264d0ea7755@linux.spacemit.com>
References: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
In-Reply-To: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
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
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFl/lNQUQ14of2oovHZSc31Ky/moebkHtzbe9Uq8tEj53
 KTjfNE8HaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABNp2sLIMNtIVP5x3a03T6LC
 43KT/2gap07ZxTLxtHt7+MJUNvM5lxgZLrq6iIp/djS7l7BE6fHL2c+yXLL8N9swSq69Yf1g99o
 PHAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NGr+XrDfX66uvRAgLxMSeNjir3oXI+hMfzSSbsWdj++6OhWzindqeouE
	JHt/y+EqNrznjw+ZAxU+LDAEsVCApkEL4MnP8EpuntZrYkn7QS9HmmP0vyRrcE6K8bQV5L3
	EKZbthcAetVuu+xXAMf3e2Qt7jszDHbwJAvRgPHMgfK259FRKSgzNLtefgf/2oFcvz5KKfV
	guJzqTLeEf9Gr2JykUr/KD5IQsUAvc+27uftaLeDBQ4r1d/bxxF/OTnohcss0huudosyeEE
	FhN8AlLfl23Lytugv1YXXtmP2qFxOcEVuq/Sah5Nuy7d7fNsoLG4NeBU8wYKstYhhmbDphj
	u5AqFNVak8vMmWtMsIT3PctbF73Sh+MQxU1dckddMLgyW3W23TdVFm2QW+se92IO+KN9PnP
	5xirT0cYTpn+twPY9p+nSEDQYR4k3tdbMM4+P39BGZpzrJqBZ/FgfITKVNpCFMzx09NAHrn
	CWlvlbYeNwIFnxvPxHKamLaT+keRIs3j/qd9LRId2pRm9SG0czmKyp3fulinBevHTfnomEr
	FZcngtBIb4X6Q8sv1WX3KGbg73CLtnJT2tfULGeaSaRQQk6KpVfYaF3oooBdAYBDirJxJNF
	XwK40fZk/i2TxW35A5cuk6rbrGe5/fKRz2skYuL4IBRlvqhO769c/m8UDG+CgH3O7YRFZ8Y
	JO2M4AbcXz/pB5LzPp4qp5mWdJq6OrwtQR2EcxAJZqoXGQR4yDvCF/+ryszIuMAbjJwjNaB
	GYWGC53d6rMKjktyKeeH0vHezTxgWee3q/wGeajn+JnA6sq8tPIjE/xfgxlRA1vaV2lyrJx
	/ewwdAhtsEzuie6j0S24aheWWsveTGvWFlifSTmk5Xi5YO6qwxllYIu0PATizbiEr34muAL
	oQHLyptqVsKVEpPUcw5psgNyzhRlUEYw1hQSpxFVOfNyFH0KYCmD4jHseZI7dlJEKBIYLwX
	52mUhiPNDgE1dEGRFbKA1knRDrmWti/lkzC9s5Kt/QLfbFzHjjgU9rDN2lqtuhcwzSn674V
	Jatl4rHG309IIx6jD+dl6oUnY8vuh/HUZx2tVZ4RV/lnPKKdL4gNaJulJoEAt57bWm3v8aJ
	1v0EgAUOiMlxGzEP85rOLgCAvA+hf0MtRiTfgryvbY5
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_014536_381401_687D736A 
X-CRM114-Status: UNSURE (   7.51  )
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
