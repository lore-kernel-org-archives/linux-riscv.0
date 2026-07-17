Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47ED6C44517
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 07:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5aFBDUC2W3+59JbCFyyMtSQDgYU/5xiQ96FOGo22TY=; b=uaGGfIlxp9YDdE
	BXzHsw6VST7hcTAclS4RTvSxGa10XH8zTJlxuaNdS1Ah19F59AWO2ew6Js/AfPsYRfFySM3OaqI/J
	RA4XSJNiujLo14qhw035JrVu+VnwDcL5HlY92aePdbkIlpGcITN0XBn0yYyO6THf0/bcnGlSIOzmn
	eqGJRObwpkV3igFkI7DLUrM1C0D8ocoHu1d+8fgDEONpenk2v9aKOQf8NO07fR2tm3N5caVodw2cY
	mFrq2Bg9tXRjBsDWHzjNJKiQ3Dh0CgFZqPE9bA2/3mXY1VKcSJvxDO6SjTRf6jNVKCO8WW2Bqn+QX
	W0rPgJnHx6wijcvk9h6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcyN-00000001RRz-32rX;
	Fri, 17 Jul 2026 07:27:03 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcyH-00000001RDy-3sXU
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 07:26:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784273184;
	bh=fymj27WXKJG2RMZe+ljkSj5ptI3AG/Qlm4jztXs9Ax0=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=spV0IHG0Fn8u4G7YI8Jsh9Bl7y1ARaS9Sqqe07kyXSlAiSbKvUYtlGJBbkXu7OToY
	 X8w8h/ATVr9kQNZL+wzqVDI1ESiRx9ICngOC8YoT7Lh1Q11VZ9/seX2Qkw2/gADQFi
	 UZlXev1YioXIE1MOzJ7yzJQTHbw56KDmNraDANQs=
X-QQ-mid: esmtpsz19t1784273177tf811608e
X-QQ-Originating-IP: i5+anhGPQj0cZfDYZeOkgyTzjxq1pAkh6BJR4p17JNI=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Jul 2026 15:26:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9954810506696884270
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 17 Jul 2026 00:26:01 -0700
Subject: [PATCH 1/3] dt-bindings: soc: spacemit: k3: add i2s_sysclk,
 i2s_bclk_factor and i2s1_sysclk_src IDs
MIME-Version: 1.0
Message-Id: <20260717-k3-clk-fix-i2s-v1-1-e95001a692ee@linux.spacemit.com>
References: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
In-Reply-To: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=pmDemkdZ9ingitjiHnQJPHF6cz5rSUrFawXebGp5onc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmRN/m8Wz11pnE8dDmXuOxFvGnZqXJxY47AnWELXaoae
 xuXinR3lLIwiHExyIopsnQ/4NlW4BNlWyBQ6Aszh5UJZAgDF6cATORxCSPDyQaFznrTkE1vxI4d
 dOhqtL/jMWOJl+fUBrEeNo2z1VVTGBmaWLXr/Do436zPLV74siyqT6Fmisva851lp+a9jps0pYY
 TAA==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NqN/wpVFVRYXOxlE2cRx/EeylxrLvwXRRmJBJvn7PPUMOSenr+bZ/JIW
	Hg4GIRS0zIU76z3FudxKWR506GBVs3Jpdu8HG/9m33+Y3r8SM3b+JtawRtBO3nS8i6w+qLi
	k7hX0OK//XMGcyAYGdu4gnNbbvAyKEnU0CBtsEGCx3l9wwcZVWkdU1yANWU0qKj5Rq5uznj
	eAzZ3NhkF5z+ixulKQPGLjZcI/h1a+Hbk9VChSrTdJZSso2Vy7vOkwyKt+ZryDgIWFJIZgw
	tGMaJQkPMSYcs0ylF12dHdk8jcp3URrm+fAiXun6eYtREQZM2yPXs2Kzrnn2hwHm5aQSmSl
	W+UcIX1GEUD/AB9sjgCAAAIP2z5NZpe/FtTaLnhviN/SVN8yFImF6hlFIAahKhdDr2oAUNS
	1JTbUzasnwkziUpMKyqSMCNL/TQbzMXU39+TVSzir97MgxUBf2fRMoXA7lklhkROT4x15DN
	b4NmOwhWoMiUNzBjxB22nek1Cz42+7+Xs1sRO2MrGIWeN4UhNtodVyaOzQDM3r67AFW5ejl
	IYC22gk74l7oYWVgsmlWo4dYfpN+Uwrt8AS4FRqqD6czHRy2/WK/vcFZIgdAzXLz+Tx4Lk1
	lBE8helEbvZl7219r4Pp/CPEMmMU0q9Dz2ell52eIfbUtoKAkoYhsXlj9EDKIK5bZwNA5QR
	PnyrGT4wxdxXEijNqHX0nOsj7NHPx7qmdi6ygCZiiUJkKMrx+ez4Cq8Xk6vc+tCdUhO0cPP
	ZJSIxK26ho+PZeq27YVlyJu8Swrl8AZVgEqwb5ydsm63juH0aVICsIQ8pLwVjCrF6VbjDz0
	PyMT75GRroD0cVeyuKYV7XZqeQ5MQzEf3eHI268rT+ux+LyxnOdPFHZAQ/gWAppZR+O2wgq
	EdVrJGT+eiK4WNweRZwDlmWUTQZI2fVKWExcDQWSBq7NSwuveWYNyWFO4NKdTH6jB6ebWW6
	L1z25W55JQe/gsAPKhLfXHe/x+AMGXWuwst/hSCW/dgEBj4Dx3P9Bw7a3PjQNpwfIQfgnwc
	c1bP0D4MLv1daHU91c4aGZsC+8zMbyFgEvJHLHaPoDaC63R+Eksqu3eTaZKe4=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_002658_268862_4A2D4117 
X-CRM114-Status: UNSURE (   7.12  )
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

Add three new clock IDs to expose clocks introduced by the topology fix:
- CLK_MPMU_I2S_SYSCLK (51): the common i2s sysclk DDN at MPMU_ISCCR1
- CLK_MPMU_I2S_BCLK_FACTOR (52): the implicit /2 factor feeding i2s_bclk
- CLK_MPMU_I2S1_SYSCLK_SRC (53): the dedicated i2s1 sysclk source mux

CLK_MPMU_I2S1_SYSCLK keeps its existing ID (47) but will be repointed to
the real per-instance i2s1 clock in a subsequent patch. No in-tree user
references this ID so the semantic change is contained.

Fixes: efe897b557e2 ("dt-bindings: soc: spacemit: k3: add clock support")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/dt-bindings/clock/spacemit,k3-clocks.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/spacemit,k3-clocks.h b/include/dt-bindings/clock/spacemit,k3-clocks.h
index dfae52547cda..df0b9fe43b76 100644
--- a/include/dt-bindings/clock/spacemit,k3-clocks.h
+++ b/include/dt-bindings/clock/spacemit,k3-clocks.h
@@ -145,6 +145,9 @@
 #define CLK_MPMU_I2S3_SYSCLK     48
 #define CLK_MPMU_I2S4_SYSCLK     49
 #define CLK_MPMU_I2S5_SYSCLK     50
+#define CLK_MPMU_I2S_SYSCLK      51
+#define CLK_MPMU_I2S_BCLK_FACTOR 52
+#define CLK_MPMU_I2S1_SYSCLK_SRC 53
 
 /* APBC clocks */
 #define CLK_APBC_UART0           0

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
