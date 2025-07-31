Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BF3C87FCA
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 14:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvZ46h5X8hE16pRWYyYIGOCsGCORXnD8nZWWzq9pgjg=; b=j4TigXRcOLvDh2
	NpnFWatukqOV/x5zy+6JFudNt/AE8rlmYX3hKreCAIZ/aPE2fk/P1GiITSOww8jk4vjgHJUeKmLG2
	AELiqXVrBrmvrRbRad4e17DF33WAWC3qeQgaxgVASBQ/GoBQf+F1C+UzEqR40cfPMR7A4+bFfYZYw
	0IozM4PDd+71C94PEeP8z9EmFS1HXXF6KSYm1iTgPQQpdo43I3Ifs/+l15AI6KYL9Y0IWLlmRhvar
	ufknp2gR1eyoV5yg8BZFAPL73JjCgoJ7/vr8z9/decPZfIves5yCJZuf5m7Ek6jeNNpc9TwN4jMgl
	4bWVlq27VzK6E7DTDbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUgL-00000003tXg-0P2z;
	Thu, 31 Jul 2025 14:54:57 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhU4d-00000003nre-0dYS
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 14:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1753971261;
	bh=9fCuuegqOgh7yiTp50CPz7MDoO4s4zlMG+vfGbQq2dc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=gFWL7plr3wIOFLw1USGzJyUvm7wnFPkewap6zTW0pc1SBNGEtQpLTdakfIezYXL15
	 75LVBb8/7x2SKd766hUrWDfBvZbGHtHNJ8JU3EPeOrC9IRnJluO9zuvWTAg6rJl29b
	 //riokJsuE2z1I+vqruFuSp5XOsCiIS/Iaz3iXFE=
X-QQ-mid: zesmtpip3t1753971259t7d3f21f9
X-QQ-Originating-IP: TenTfqs+CfHaj0Vw1Jf1EPSV90Ue4n9Xf6fnQuF3AZg=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 31 Jul 2025 22:14:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 374415705309625813
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 31 Jul 2025 22:14:06 +0800
Subject: [PATCH RESEND v3 1/2] dt-bindings: clock: spacemit:
 CLK_SSPA_I2S_BCLK for SSPA
MIME-Version: 1.0
Message-Id: <20250731-k1-clk-i2s-v3-1-2f655ddb0c6f@linux.spacemit.com>
References: <20250731-k1-clk-i2s-v3-0-2f655ddb0c6f@linux.spacemit.com>
In-Reply-To: <20250731-k1-clk-i2s-v3-0-2f655ddb0c6f@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753971252; l=860;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=PxJJD5BdYiecz3+HAlAUv0mqXDsb9508pUsTSJAhu14=;
 b=Ge8h+yboIYawFvD0VS7n4GY2qkjNPCR43qjJnnuWIBTw2eyDPG73qm8w10ZV32dcGJDPpIJ15
 YosOy8//CGuC+NVKlXUdSsJuSukeWeRDtPKsP1vjXRNsUiFolMgl4/o
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MGadMsDlxthn0v46dFbHttd8o9/0VmlHpyZwCrTvlnt465oFnCcfGFhx
	QI+u0ZvkJN9Sxd3oVYiNzn1Eytkc4HajumIA0DwxMC5PolRe0PSq0ucSNADhg7MSHRNVfUj
	gzlTpLaX8ieg0MyhdrOfSizxui5OKHLN83E2UBPVCVkj6JZSCSVgsYkwCt9EMDKwv3rtIgz
	HkVYGyTBFPK/sQTezER4KxnzpHDCBhYGGLxRwS8mghot7/G0JKD0bIQE9Zpl22Errjbxp/5
	oNEdYPvx3iTyrhSahbsaN2m4+9aO6ev2cu96qwvbaxAx18t48xfJmuEy48ZRMRfBdzv+Bae
	JvFxD4e1QJWkQjyhdf83H3NpDzVbp5V+vXWQXsdUvEM9eJwjZezeUhPYq6gTed9ayReq/d6
	Kng80rcR1MBivpkgzrEJtXihSzhntAAjYZUSpjPGaGNhc8xc+NcgbtKaN8yTbYPv1zDOJZF
	6tt3C/VkcITZjIedqxo6eHTz9A6nRkoOn4Yig48sL0bJHrU2OdMGB6rONjBUvyYS0ZQR+hn
	DeS7lYI32uXLzR8XVFYf4y38twloW6OyzFcX9vQMDks7qF9gqEB/p9Mr0IuJOfCzISce9LJ
	k2vohb0EAqVGj3u6QVr1SBrmYxxaDyVL4Mo8qN0hYNvFES8aSBEsn8lF0hJbUvEcqgiqfkb
	HQIjw9F6X3GxSO8TXVQmJXLZ2QEVEoosEyF4uSOJBFaRNO67pntybx2+bjJPnHJPtyMPKlF
	e/NxNESZ1agTCuY3b4kLskS5lId6bTQQ+sw+eYTQvjnGb8vspepnJrO2VxzZ1pBfxMBr21P
	wmiC6+DwupMouIOki4rRWGaY6xebshXTzKIRBZgFcIMETV/Qw15NdNpVRw0uoSGEiLv6IH5
	6eCR97dgEodpao26XR9IN63rVyAOxH4NUKgf4zl6mL1RMS86udPbcWiatgJFSZKO7g5E1+x
	sRVp08DPF0mb6h8VkuK5d+g8Ac67Vh0JbSt7lTix2UsbMS/zPZBkmIf0mAcZ/kXzQkA/fq/
	GiI3bCUdiCyD4MaI0HGsmMp1Bbc13x1Mh+BAc1xzPHpZvoIMthzZ2IJ3ktppQLE0JrNdVzf
	ttNL9W/Di7l9f4a0Juy0uHBkf+HGsMLBOZmn8n38CFCJi/ks8Q7yNHCjAL7Qat7IzgxD2aJ
	4SMl
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_071559_620980_CD14516B 
X-CRM114-Status: UNSURE (   7.60  )
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
