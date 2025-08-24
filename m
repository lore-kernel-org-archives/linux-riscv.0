Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2DDCA0EFC
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Aug 2025 08:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SlRXzDpmqf+hMB3IePpTW+gaVBNlAckqIMfe5ArjAng=; b=T5zF19VwVFrWme
	m6QdYx/JjcQzMaC/TmcTN/tjpIbXSCZRC7frZ/06zJsZsPs+/X+hPBNHaXrZzaJhmIA0Q2fvh2zIL
	yHxHTSz6cUVLcHa4SUarFTHNd3NU9Q/fT/eZBIeu0sOmA7MVXSYACJQwYqnsQAcQRSCooj4QiX59T
	VuoHZzHFcliBWj5rh+to1FfP2xsgJL2M/ZJA8DC1swk+CjGnhfeqik5HS/D7nkFE6d42tfGlC6qaS
	rSD1lL0Qw6ig29mc56bnTy3oQ+VC9kFZxJjYZtPgpwvzt/sCrSgWUfMu8sdcKNw6ZaUIvaCn3CMhn
	jNmvGE/lYotU7yXXIpcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq6Ij-00000005soJ-13Mg;
	Sun, 24 Aug 2025 08:42:09 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq6If-00000005sgK-1tYL
	for linux-riscv@lists.infradead.org;
	Sun, 24 Aug 2025 08:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756024831;
	bh=uIeFRp7srlfzTl3qg/h25R18H1T9HniV32V3H37+zLo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=GKbwYKEpik6QLJbcHuSWJhkX1LzKHnBobBPBQFIfpjiwLqMjUfFbcqMR/454lbGj5
	 j3SCkajM4TPrpi91c97NsquZxLSjorr2/MA3LljLTt9DfTQ+LS7Hk1eC5oqHUPmYIE
	 q0iPc3HRl7Tdsnt/++RAIE+VWVvAtYNq02nr2fOI=
X-QQ-mid: zesmtpip4t1756024829ta2e03abb
X-QQ-Originating-IP: R+FEK3RJ0uU9/B5/5AD3L4JnXkWhDGlpkAywfX6XE6s=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 24 Aug 2025 16:40:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17996591963032369533
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Sun, 24 Aug 2025 16:40:00 +0800
Subject: [PATCH RESEND v5 1/2] dt-bindings: clock: spacemit:
 CLK_SSPA_I2S_BCLK for SSPA
MIME-Version: 1.0
Message-Id: <20250824-k1-clk-i2s-v5-1-217b6b7cea06@linux.spacemit.com>
References: <20250824-k1-clk-i2s-v5-0-217b6b7cea06@linux.spacemit.com>
In-Reply-To: <20250824-k1-clk-i2s-v5-0-217b6b7cea06@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756024814; l=987;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=v/t1aI3aNag38Iw54UrTz56l99+UEE1QCM7Cs9uZPv4=;
 b=iONwEIHlXVoixiSORjJxTfn/gRA3ySjVcx44485CZagW2P+78goqG1fL/Z+oleVAPbN/wYGb2
 RQryHUz9mJjBnXwhtDnWU94+xGj896RrrhljBPr/wCbDoUstkk/2IWX
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MWzGDmnScki3k3C5VIVHaDBd8z4Roju4+0neCTSnYOxzh9F3UIJVkRW7
	vbNS57Rn+P6EcKYl1wMCksANQzKMZtZ7Ogsjr3wfaS2Wp/UH+9xJtc51Y7O/g5Kt5r7bNpf
	kG04qQiJdNBRzvXTLTndAIXxALEb7mcO1/2eL0M79UCuQu0rDRUbbkLm8EA1Z1WzSKFSwlf
	j9TDqZViB3pEerwDDIVNRUhgtKl6UpSe8X0cbI0c7Xb1oQgBeEql5XxJzVf8UXg0jkShZMO
	Cq+bnC4BeCfwxux/FehkKkC9etkHyrt9Ay4QjhdYQ0JhriCK060bbzGb2E0GjOnFeo1fYFy
	069xZ82vns/DfyroYIZv2wtVFIktA9lxvLXJgWbTODwJkfdv6SqqVOIAq0bPVY7M8Ej0btQ
	mhLz7A7xVwfOH+ldGk7cxiIeuLs5ppefKzYT+IFbc4sl4kcUJnZ9NPa8zRLhgFmxAwQqObH
	jgwTUy7b+2moPpLhM3RhAmyj/lUtt9YyHOwnIKE+tlOhp6Xh2uX83VfyNBtpvRE4VUU+WL0
	W2rm/USXdStM32e5pu5poXVNmVfqIwfK2hdffPTaoJB8e/Q5fRw1xQmQIhLnbkyFt3JkDO8
	qivqhVKgunAj5FG8I/FuzoSs9fUz8HTmVjlZM2IhNjv0w/rT7cIyM4U/njgeAP0DIk6iWce
	IMr/5sz79vfm5AiHh2nZdRpeJklGRxULJyWwIBQC1t3iZzlmyt8JCLBAQDOISHsOtjsiB4D
	3jdTvmA63mLbDDyHyZPhCpSzs7scFWCxEcBKPkv8EtJFc9VZtdhvyNwQeQ3offQCnEFdYAp
	sivDEIHgmgYXc+qE0y5TBQXL4tR7tQhX+dNN97bFvVPVRgekpnxrW3UKA2ps4MQKonXg8YN
	A2WfOm6k2XZUsH7F8lllU2QoI5C9uXkhV3uemraTVX8msZsYADSjSWT4uDunA6RDFMSCvnX
	XHZxiwV5EfxAcTopjhp3eG3t82WSU+UVzQEChY6Y+LJ6RngOf29PINzhIm+dGdPSm1qYWYL
	zLVmpD6qNzJmxPygSy+C2HREFiQ4nXTPP9tGI8MlJxmSIepxMetqJUcFIh3/wGuj594zYsW
	o8DP69ICqdhPrg5TgIHPAU=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_014206_513438_3B07EDB2 
X-CRM114-Status: UNSURE (   8.01  )
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
