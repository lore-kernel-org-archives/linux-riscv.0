Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC14EFF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 01:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TGQLcdehiV/3Hy7c7J7F0IQIvkwtpEIgG1sEhg/ssk=; b=tfL2k/Ax2Seayi
	5zZ+1WmwioLCGodAzkUlMML9TJ2d2k4DhZC9f0VUgooQs0yJaOOe76nk//kVO0QetRbjZxZzdjIcf
	ZatYbj26FT1l0EqMeoN9KgMsxbFjRGoeFrBNxMTDoPOasilCrgyIg3uITVgGETZBt6rQjt/qRAth1
	WpmJcpSDc96O91S7WByrdH9emGrB792agy7xUXDHFeCfC2I7IXODxs76pa1zZ68h2Y19y7CbXqePE
	GOpYEAS3pg/FH8Wwfu4YfQcE9/ntLfgA0nPNRTEU0wil2ySYgtG415tXYrQrWfv7kfsHp5rdTJMHk
	Gg8ptlbniYxAenlhw+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtu9-00000002jCF-2MOf;
	Wed, 29 Apr 2026 01:39:57 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtu5-00000002j6w-3NDT
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 01:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426763;
	bh=FI4ajARcW5357tLN5/I0ua9TZkOJrFRVAlMis1T0b2M=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=PMHPxM+MdkxK20cLK6+5IuWDfzxgxJhU41PDprcA4fTm+chog750zcf/8Eefx+qFB
	 pCJa97kuon4xuNQRj/e1oEPysjWDBGjgvcE8cTUlGEoVC/iVbT3GH7D8OT+FM2PdUk
	 9VdFbEGuyD6rla0pxAzxMlspcbcQh+Sxti9plwZc=
X-QQ-mid: esmtpgz12t1777426755t013c7bfe
X-QQ-Originating-IP: xdBdhRDl77xch4NsM0af+nFog4tII5MZi881pdQy8Kw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:39:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7627828452192065809
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 09:38:50 +0800
Subject: [PATCH 5/7] ASoC: dt-bindings: add fixed-sample-rate property for
 SpacemiT K1/K3
MIME-Version: 1.0
Message-Id: <20260429-k3-i2s-v1-5-2fe99db11ecb@linux.spacemit.com>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
In-Reply-To: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=1270;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=NAgZL6RRaKXXih+6ACD5ImpEXa86qDP16TxAOhPDHIQ=;
 b=TusiHIciXUEkTyZdF0agxDOszJih+9MIoUSFVA68HIDOa8vi2cUesDBfQe6f4l4R+9H2D8znc
 iEXn6JQBHR1DS1pO8ZQIdzSeDXsQeMaCRPGheSGBpUYrD6BmdWQTB97
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NogX0aiuLvlKalpi8EyVVslWua28pTXEt3tRapUcSl/V6fbTvffaHvA2
	empsSU7BOUgDIuO8cb0H6yhhPN8fnEOvn4B1isdrEXRrWI+2sXR1vWIBIvda0JClsPIQRns
	FUxf9f2uWTcYKJXGsedPjkm8JiLJAY9WK0L+2n4oZ2uZAKjz4Ze+bmJZkTGvokqySTxobtu
	DiXoMSyKja+uO3apBo7fsdSytmoIg2U0BV4pwnqWeGxwz36umliFD7PM6tKtbXwR4sjYs4e
	0DMhT4G0//ZyGjjLstSH9KqTtv3ovfYs+Z+nvLRLOZlIsGXIEJ0eibwdGlUDvAwylY0PTGr
	Lhwx94tcJOFoCu90QEs9PCTJ9TQyrOwn4Q3SwetoaiHS3DbXykIU412T5f6FIz7R3jmO6Jp
	3Hl2IXfLPbKaoqq9jBWAxvKDgs3MgoYa0W1xjSFrzpgo/JOqytQx+Mit69JI85I1oJTupon
	D272bChCe4/n1/x7gKWtA4meX9ZN157oNzY0mNoNTzTDz/N8Ot2zVLiQS7BMJ4Hp0sHlu/i
	1BG5p8Gfp8ZNZtE52rTOTpif4ySens4eHk1mcyVbZPl9w01emKpcKhewzIeq7iFlgAzc+mt
	d92sn3Uf/GwNrC6SvdlGPvmtQRjy8ycifibM0vjA4OzxhP6GjGhlEFVxTqSigKKUGb4lxXD
	jxAefrdEKDY+yh/t49Ft2H1jWSwTFI32SeJzqYVvggzzCC/z6HsCJApURGdSkkco0el6Ddu
	9DIR22URCEvoOfNrMQmkjBGz8FrJqWSymiIqJGA82mM62AFtaKdlnafedBylLXp5vRmyXRD
	z3624DdtUb0+zbJqI7FWsbhAsYugHCTJNENBeTt5Pn/Rf8NXWHiKImu7XGEtC0SGDnH4z5K
	yLVottoqbAP3Ni+odyFJyGRDDYuFwXPWfZILYlIHzG7bCjon72FSf3zYxyLmMMWm2obRXdj
	iY7QHVIw3hfP01BwPYlrqC8lhlk1kX4wyOaew5FOIdvWbLSmVoqemxJjYKht1osUjEZp45/
	1JL/f0afbKR+QuiIIN+3UI3MF6WMIGYp0kS8kGly5NKGTVbAG/UoV0e8iOlOqE65YqzPs7i
	2FO2WI2cOjFp5kwsesMIYsJ9Sal4yaAIi8IBA5PvDnd8TlJywYIBCJOn3BGbtBKzTVdQL9m
	1agvKpEyQXP8Z6iIjrWl9TdFtg==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_183955_317987_79D34A8A 
X-CRM114-Status: UNSURE (   7.07  )
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

Add the optional spacemit,fixed-sample-rate property. When multiple I2S
controllers share a common bclk, this property constrains all
controllers to the same sample rate. This applies to both K1 and K3
SoCs and is only needed when two or more I2S controllers are active
simultaneously.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
index 240d90402e4f..137070ad9eba 100644
--- a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
@@ -84,6 +84,14 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  spacemit,fixed-sample-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Fixed sample rate in Hz. When multiple I2S controllers share a
+      common bclk, this property constrains all controllers to the same
+      sample rate. Only needed when two or more I2S controllers are
+      active simultaneously.
+
 required:
   - compatible
   - reg

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
