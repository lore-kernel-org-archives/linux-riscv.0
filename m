Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD74C54E41
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Mar 2024 13:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWwYs6Gj4Ws4oDAUzod6XAsb6MhBvd/wmOLmey8Yk48=; b=OdheQo/I46eCJk
	vK2mvAfpb4T+tiIi2DAYZ8XA9lTCqlDzjnFXHvU9V9P3qfHuIFMAp9VBWtgJByCN2Yk3WirISdenK
	OjnSLSbI3+5uTUbKt8wscmx0X62zq79YuBgvbg1R/hgCp/z3C4tjuBXaoUPXHiK7jTPJWU2ui/Zde
	PzeGqxMTj3Z05LRSt9tr1FuDFLl7+vLPrIwNP/MtT5Ogak0LLu16puG5IiA2zTr4MfWlXxsDQUykk
	orgErY77scpHnFjDCBZeN1R1dq0jO6JHTVKiHzUlZDsvMGsIJIzIqbWmZtiymyhdQgbZ64jfgmez0
	dfM4qk0pjqamjjKS6fSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgls9-00000005xw6-0wH2;
	Sun, 03 Mar 2024 13:27:21 +0000
Received: from out203-205-251-60.mail.qq.com ([203.205.251.60])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgls5-00000005xuj-39iW
	for linux-riscv@lists.infradead.org;
	Sun, 03 Mar 2024 13:27:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709472432; bh=rFMECsDJ5IFHw+IvpG6sgKMg8QyjajlU5QopKTYKlmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ln4A1qumBAqoTIAKgaLBFC6QtV7V7+0dmv28Ado1pYk9JNs1awiDQUha2caE4jYzS
	 lZzr+XDe3woxxrV75EhL9cO92lUGVy7iFyDbb9KelF8haqtCiqRvcZWBWn1Vm7o7Xp
	 5jTPZsdaKLPrEpZZrHwvT9DgpVJ1aiYEAy2nyrgU=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id 6C4A707D; Sun, 03 Mar 2024 21:27:04 +0800
X-QQ-mid: xmsmtpt1709472430t70p75nqs
Message-ID: <tencent_4F1B21F8A605B7B4091DBB70B5635442BE09@qq.com>
X-QQ-XMAILINFO: N2/jAoEINgTTzf9liOgkTdvZcW6SafzHc3KT1jJ7uCGqdTo8dpUlniyEwVuc/h
	 hr7U6mKSsBM2SzBYRQW4/5CKh071601RFdmNbaI+qEUoLU5zb1FAHfDqA+Dr1+ZN7taur6LnIzU4
	 vvNWVibvyjZ1A1aiB+wMMET6CFJi7m5ssV3Ut4g7+/KHFVpsyLZYMSolS5q9d6ertu1wCTKw1+hM
	 GHVLi0rNOhq50WKozjSoiwROJYClkaPqV8m8EmNLFfVw8gVpiprxtldcqO1V/S3B80F3cU3sijCW
	 qzxm6YhxyLyKanVmTOiG2XIrFZxwaxgsf5v8QpMa16+kMWM5zy7tCxXq4W0GhfL8LtdSXRTpXLVf
	 S4H5FgsyUJb2SuksYPB5R53J3+Cx9VCKMb80mjMJGiok7/ebIUBBmUe71uhabjWpuustQW5q9l6U
	 scsQsr7oGlPx2rcaQU827xyCwMewBxWh/Rrw+AwGcJEWkwMDTkJL6zHJ4qIKp/1zTF5MxsB08hyb
	 HfE9eZj+SODdhq0T9lizMzJnY4kxnbLyJhTZyyDuSLUDE7h/e9xf++uke8xidWIj10vBrBLpkP6E
	 61BHb8Apm8ExmowhIjoSAkcoZNsEV075AUTZBXvgSDSYAK5kGi2aQaErsw7dHUVufpE3+Z8tK/+B
	 2t2/JY+bJTRuGvNYvAo/zEowsz5elEjyslPG06aLvBH/zXVJFvdv+nI0JGy/ua2Lpd4sOL5ptpTO
	 O50nV3Gi6vXEb65bPyCjCKdHSE07DNAyLcp8SAtghb8HcbMeukZqX8SIfw0T1Bc78XP1t7ozfyl+
	 4a8npH3PizYgTfEd4wroXfpiRHXbWmHeLRnYpGIoXAMkxMqJ4YDf1BK8FN5ARJaYOftxDa3js+wM
	 hGNlYvba0aChvI3hYfHSCkP4gf5D7Zp4zcl+QyY64Me1jFkz+UWsdZ8iaReo22EjmGKlUSBEuk3g
	 HsUSb+b2NeiHG1ldShVk9kZUcSo6enhu2hvutEVut0YsczXbWJe1Pedm0BYNMSithifXWlqrjyl9
	 lxoGzg/Upgp6tdR4/zPfYmwfIcD7wQIWauNLuMGlWxVVmSptA61T09iksvQRY=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH 3/5] riscv: Kconfig.socs: Allow SOC_CANAAN with MMU for K230
Date: Sun,  3 Mar 2024 21:26:25 +0800
X-OQ-MSGID: <20240303132627.553698-3-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_E15F8FE0B6769E6338AE690C7F4844A31706@qq.com>
References: <tencent_E15F8FE0B6769E6338AE690C7F4844A31706@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240303_052718_213133_C7502F23 
X-CRM114-Status: UNSURE (   8.93  )
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

Since K230 was released, SOC_CANAAN is no longer only referred to the K210.
Remove it depends on !MMU will allow building dts for K230 and remove the
K210 string from the help message.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/Kconfig.socs | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 623de5f8a208..b4e9b7f75510 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -75,13 +75,12 @@ config ARCH_CANAAN
 	def_bool SOC_CANAAN
 
 config SOC_CANAAN
-	bool "Canaan Kendryte K210 SoC"
-	depends on !MMU
+	bool "Canaan Kendryte SoC"
 	select CLINT_TIMER if RISCV_M_MODE
 	select ARCH_HAS_RESET_CONTROLLER
 	select PINCTRL
 	select COMMON_CLK
 	help
-	  This enables support for Canaan Kendryte K210 SoC platform hardware.
+	  This enables support for Canaan Kendryte SoC platform hardware.
 
 endmenu # "SoC selection"
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
