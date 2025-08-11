Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2CAC87FDB
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 13:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SlRXzDpmqf+hMB3IePpTW+gaVBNlAckqIMfe5ArjAng=; b=RADhwlJKEjzgf0
	DehTZRiPsDbzmUrjROBChVGPLlDqjZbiqs98vxgN1N6UVeM14MXw/znuibQlyrKURGfMSyxT6tUEW
	1TIOP/iL+A+icFbONx3Lnx3ZSQ7UghYcxbvX1jsNhHAPaETn6BofZEBapMc3GuM50uN5HWWVYmlx0
	P+4A5z/xAFw5cj9NyR9iF7V3pTvOKb55uXl0ZSOjOyaMw7jMV3Q7z33Xwv8t8m6s4qx2AeS/c+x3k
	OFk+laLFvzbYVSHqeyUcH6deDUyFlQwOiI5qop4ldG05WDm1hNpWWskHNZlxIHx+vbOLyQSLifoYP
	vTQOMhCs5Jjhev0H2oSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSpD-00000007rvJ-2TDr;
	Mon, 11 Aug 2025 13:44:31 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSmj-00000007rUc-2oir
	for linux-riscv@lists.infradead.org;
	Mon, 11 Aug 2025 13:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1754919644;
	bh=uIeFRp7srlfzTl3qg/h25R18H1T9HniV32V3H37+zLo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=hUUTSkdcWmto6VZl/4IQ1STJE6sZoBysCOPpgUfi0hLIDk+V0AchTkPHlvj+kH8Cx
	 TUaFmvhtXdUFXP8PO9OELVlmWLT09dRmFJsORkTjDk94CsZNywuTvhFxAEVmK6OoCn
	 0QtgBb3gBirg0TuNc2eZO0YEBVHgykRW75fP0IG0=
X-QQ-mid: zesmtpip2t1754919642t9229f5a3
X-QQ-Originating-IP: oT9x3PC+R3Dfu0OvSz9rCuURNF5kYhPnlXD/FgPgQj8=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Aug 2025 21:40:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16647974151986818985
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 11 Aug 2025 21:40:33 +0800
Subject: [PATCH v5 1/2] dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for
 SSPA
MIME-Version: 1.0
Message-Id: <20250811-k1-clk-i2s-v5-1-ebadd06e1e91@linux.spacemit.com>
References: <20250811-k1-clk-i2s-v5-0-ebadd06e1e91@linux.spacemit.com>
In-Reply-To: <20250811-k1-clk-i2s-v5-0-ebadd06e1e91@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754919637; l=987;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=v/t1aI3aNag38Iw54UrTz56l99+UEE1QCM7Cs9uZPv4=;
 b=XDOHjzDt/8Bwy+RRA8v116qZP150LO1bgNRRsDV6NYYcy/qAG6+L7cLb3aW4R559pub1Hb7ok
 nlF5AxmwrioC0C/xmLN3pELovIUov390m2CXwboOprAQ2UzgmR+JCYe
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NyNN0kiL8cx31ru8BJhr+c/4CRICI7dytkCT5auQ4F+hBheehRc3gH8b
	i7SP58vr6/s4B4XUjK93zRC9nVhBei9g5zZK4SclfiN2I6zeaemeKK45mofhbq1GEcWmSHQ
	6IyAZIOypeHt5G1xrIsH3EWbV159zgx+CJ8Aaj7HsO5nRYigOBUnsviZcrDTSwgVjJWViGY
	Z9wfZWpmK57qEqENev8Ml2IJVTqGADM3tmlhiamrEo8bm67+iquS1uNUgOciVeKzfRTTb5P
	UiswBZdCLXAYYed7aYXEC2ylJQjCjD3pSYjXM2l8wj+5KKCvbfU/db3xkcLPF3c8s3eQzaY
	QhfjZ6IuIMqYx7forEqWY1KRBNUhjI6u34sQFAGOU0x7Q1eJS2nheOXwWQfWxQonbplFrdM
	rgzxpzM2zNxwWDwXZmnGh//DwblyRajggHtvjjZWpfqNDPIvdgT7CJD0w2UMpEGxf4Yjdlm
	qBQ3fW2hOgRhsk18rTqlD0d88cHXuoNDMuaQGsPoReI+XhMchwyVKWKRkrvOROPwotnBpn3
	cxKlUWYD0w1SLSAifKzmcIpXPgiBJnPhd8qq1kod88B3ZhpR1YHRggwZHxaSqBo5V48WHfK
	m2BOVfPBwrSd1J42fam6kUNZkL9K+ZQM3ZbnYbrTBgTNRgNtxgIM06kquytXSKpOq/IYaaq
	+5H476lImg0BSonGg5jc5xOsxb9BJ4iAkuA7kD+teuELNZcuQLUy+n0C2Mf5fmF77dNR/Xh
	XjP9O7dcT7hTdok1cSzzAsjUGes0yY1u0YsFdG6D0rNVQ/9mG+eUVrrznLKF1ver2Kxf75x
	G+XfapDeGz+11lw9TBO8ZT76oXAfIYblqVgs5taHvtdMnub7oxHn+o8GUnqOgGxlQO+l1Vy
	NxTd9YDZ+QGExZFHrIEQ1FxQu0nbD5qzKYCCmHBqK8wLYEDZ2EHfcVHNStCFJQc3VdbIgUu
	cAVXAJ/mvq9INByqLpQbEvdBUGbDJfWqfiTbQTR9DDOcJeIZWL3hxuqsDaUyc97CeaN14q6
	BN/bQS05ArtLdphoSSppzNwl2XOqmAPHdLBfMVDLEl22Y0qblbKjcp28c+dQnHe162n1Q3C
	MvjkEB1m6+TCGQRF4kSKFg=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_064158_224240_B71EDB4A 
X-CRM114-Status: UNSURE (   8.33  )
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

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/dt-bindings/clock/spacemit,k1-syscon.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
index 2714c3fe66cd5b49e12c8b20689f5b01da36b774..505205453d7f19ad478b3b741d83f4498fcb8c0d 100644
--- a/include/dt-bindings/clock/spacemit,k1-syscon.h
+++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
@@ -182,6 +182,8 @@
 #define CLK_SSPA1_BUS		97
 #define CLK_TSEN_BUS		98
 #define CLK_IPC_AP2AUD_BUS	99
+#define CLK_SSPA0_I2S_BCLK	100
+#define CLK_SSPA1_I2S_BCLK	101
 
 /* APBC resets */
 #define RESET_UART0		0

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
