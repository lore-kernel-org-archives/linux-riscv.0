Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A200C87FD2
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 13:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9rrhkwZaqzPpuudxMOu04wPBsOlyWD/TWJfNUDX56Y4=; b=X19TpyxDH8kZH9
	d4x8vpqZEWcVmfuKZl1u1UwUVDY8EQiFjotpls1KTcKs2vagED/5G6gNcybJmS6WcFrfpE1fJFKMw
	MEiHSJpIufoHIt21K2D8BxCYmBgo98NcmlHKF1tyB/WQEe8t8qCKu33LezZTLmqnJTCHFxsS2OMLb
	VYiLU48BYAaGt+xdFfwKlUfFwJp+13/aZwQRt/kx7HcNosFnqYACqXMxyP2jBAHymCrDQEzDYpzsh
	gyuezI6s2syNIfnILZLWq7meTJzVsoL2pncGXR3gvKT44hTRgK7wGEum4RQ6ajlEv1QfhwQr3JS6N
	qIYASgu85GNLllPK7Jgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHKO-0000000CmcY-1Qnb;
	Tue, 05 Aug 2025 13:03:40 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHKL-0000000CmUM-3fR6
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 13:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1754398897;
	bh=FVBPVEeUd1bxjQJhz//RpBXorx7jPTLOEKGvJHJaQ6I=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=GKqVW8RllaaWhyxzlswADaKZNrK6QXCLKcNW5vbwzBY1KJhPygIiiRfYlu1c3Q9AK
	 1gHDTrTZaXRiaYFI24Vyg4FLEa/+PJoDpvvjFoWR9I/4axB2Fu0QE6xHnZEIAL8WF0
	 m3PVVkGYVrmBR54CV1ikMWtAAMNtM4rMuxk34AOo=
X-QQ-mid: zesmtpip2t1754398895tfe7aa0dd
X-QQ-Originating-IP: CPpRJvHoFk9wwvAZxLC1CoM7Jc+eYsDtqwv2sfJO/dA=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 05 Aug 2025 21:01:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9963814642751996560
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 05 Aug 2025 21:01:09 +0800
Subject: [PATCH v4 1/2] dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for
 SSPA
MIME-Version: 1.0
Message-Id: <20250805-k1-clk-i2s-v4-1-038181284dd4@linux.spacemit.com>
References: <20250805-k1-clk-i2s-v4-0-038181284dd4@linux.spacemit.com>
In-Reply-To: <20250805-k1-clk-i2s-v4-0-038181284dd4@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754398873; l=907;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=5BkvHDYGZxcrey1OnIOFiDWh/mlgsN57huK66iChlDA=;
 b=SxTtW4MUMwC7dLisiqic3znXA6OPJqUWvrb5W5Pn6+JFG8K/Yh3eUkw2+FCEHT/mEu4vhreEc
 rAhO0DskONhChyvl0uXygnVqsvgGn/ntlTHpow6ebqltPYLSEQ4B0QC
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: M/XjN/ZJ8p367ZHiom7Cv7mua4kjbEkWh6RWDcrdzzvcifHUXn6L7z64
	lMnrMVcOIVumqRHN9CRBfmH25UmbjBby2YPvKHiyTi+2Bcn+iv2BZdzFmHkp8YsZfhSbb6f
	atxS4zQu0P10VClCdiBJlmOuMYi1g7dEA3v3o+iy7QHRA8RdPX7YJEcrnggHyRcoFgA3PE5
	YJCs8LweoxIp7BOVACcDWNhGQf4J/FFW2nwwb/30+Pp0HaY5N0gpw0mSosj74upGhrBLmOn
	o04AREv0yWtjJf+SWcywAk4MQudzBPWAO9EdkZ8oyUtaQaJPTsEVuArorakFx13fR2TqRUX
	C1hVeWgLqJeGmtFdV+qbLTRkvGwOQJiaS0rLWD4j05HqsRUXjXFTjXkHESMBtBNnz4MQqn4
	sPBtt7+i/pbCSYXg3o3ZpQ+2Ytch0H/kK7azePXjra5645EVYuFOYGTiEDCvlJdTedpGZ9m
	zTlNOjyo61bGGX3CtBcd2Ze8OwrHq0GMyvYkgr80uQdsEkQyUO9tF6e+q075UrCJxHfF6mx
	1od9KznOOcI4vwrY+00wkRMjyhcE1rUTvkbgifvfMAL/8Koj6/qWd6E5jmgtRzXi75Tjp85
	RNXE/a1lRQcDlWX8YqqfGjmhXtxNxiY3QC6APw692j/dXoQZX41xXK9wNHwPzmpDB2DfwXd
	qr2rcWiwqp7cdcqWfj4FzvM2SATqUVI2OyDP350l168fmJgtYxRc8JDmyvYN6iRWnKTi+nJ
	0Bb39N8FqYQJSkTPyjsY8bA8yy+j/K09fbSW5TruMnSq1uvgp5z+dnK1NYc9lG5lds1q/C3
	IPkstVyylWxTAmONO1KXheeO8S4Ee8JMsnDukkaz5ez5uiJojBMePqTUqigqF/L/YruZ1lZ
	tbHLM/vaWJw1DeUVi0JsXiYY7XJPOztG87TCCNJL0omwF+8nH8BY91S0BWqFFbeiskKL86v
	x3MM69imvXYmTMuYFGYAmpssnT+kILkoiX97qM0iu1FW3Ws00ed1wU6JMVk7q+BB7zomgfj
	w+rO/2p6yHECyrjo2tMwDM7SBEZSkl+fMws0MJzqbt/8TJWF5UTcExHEmwZiniPMb/GNvPX
	gZ9YFBZlz9cLJb18SPnzwhF/gNaODrt3kvvUhRfmKKzIT0/g0zBnQxSDYMxpQeRmw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_060338_324327_51BB4592 
X-CRM114-Status: UNSURE (   8.29  )
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

In order to use the virtual clock SSPAx_I2S_BCLK in the device tree and
register it in the driver, this patch introduces the macro definition.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/dt-bindings/clock/spacemit,k1-syscon.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
index 35968ae98246609c889eb4a7d08b4ff7360de53b..9be578953d71e79e93eb10eaa35b47b97812e826 100644
--- a/include/dt-bindings/clock/spacemit,k1-syscon.h
+++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
@@ -179,6 +179,8 @@
 #define CLK_SSPA1_BUS		97
 #define CLK_TSEN_BUS		98
 #define CLK_IPC_AP2AUD_BUS	99
+#define CLK_SSPA0_I2S_BCLK	100
+#define CLK_SSPA1_I2S_BCLK	101
 
 /* APMU clocks */
 #define CLK_CCI550		0

-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
