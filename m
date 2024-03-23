Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C803C54E58
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 12:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPv5m3XyljSPrl/rYZvfvLGkOiWcHq6oqXSyM1Zr7gQ=; b=ROGEPWh70jB87Z
	8U/iB7QvBfBiXwVlrUJiD7gC7bnn+uCEFhakRbtMuOyvdF/n9GS3sDZ3tr+CJZ0pKAAEqpCPR/Qmn
	t11hV6z/PrSLGXvZYYpScM1uth1STypk1HVyBwUYDi6qwnqeZY78JnM5qh+u5QSUMRRxRwd/BRRrK
	pon5GsH374s325cxT/iYcIU6RQajKsJi4mUnYHHqFoIcO9MVZK5RnVJ3aWPwYdMiCcgbc7AB/lZkz
	DJtkfneVYLov8PNvwBplbKe4k0ztEMiw7hEItkpIm39kihhDqQiwF2kSMGqIeDuOuwLAO9MPmEAik
	wjy3g1n5pDK872baP5wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0FE-0000000AKgT-2JB0;
	Sat, 23 Mar 2024 12:13:04 +0000
Received: from out203-205-221-164.mail.qq.com ([203.205.221.164])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0F9-0000000AKcw-4C8s
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 12:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711195970; bh=jaM56XVEDkeOpfko2CLF+2oPCWKBzRPYG5Ofw5dlTQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gxxoEA64ZPc9ULscjOxXXprSOytH11AoB89nHhZkk1j9vZbytGlr9AoTObOJe1/bg
	 Aj8B/LEQCN9Uv2xlxvs5aYcaOskKxiUSNPV3tW7oRWWBVL0igxIaq1WdGkTyhougm2
	 Gh6e71DyGgffv0mXEw5wEXcN7DC/YazHSyOmHiyQ=
Received: from cyy-pc.lan ([240e:379:225d:8e00:b91:b2e7:7c69:8554])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id 32594C7F; Sat, 23 Mar 2024 20:12:37 +0800
X-QQ-mid: xmsmtpt1711195966tascze9lu
Message-ID: <tencent_1A4625C4B7B18B8F4430483BD71111372E05@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85NoaOVyhodLMB6vQGFNYeNFWaGC50wVFAW8rjIf0HbkFl+03/qCU9
	 ZOpchX6kxJhjxYSYN02wRb8yAiqINgZqUAqGM1a2UmpIGpFvue01N+Bhal0WVYsPEGXsjPuz4SRF
	 c2raaIAeoRKbwiXhHIXgbXlIBoL4qYzCLS6iTiEPDmKwZds2FwLxJ9V8wTzkVTY+BBzIN1cZqNmv
	 ARkSXbJcOibyakXfJcb5jOZ2PppxJv3Kxjrfmv64eDqsjrEJ+fEagDT8ww2qRpvTV70fV2K7qFj7
	 XGAw+zaE0OQX03XSsOOlHoo4vGsfhTlD0dOM/5LRwKBS00FZFdcDw1HpRi3NDOM7mqCvdw3TiNIc
	 0N/VPlzvsVokkeubl6IGNeuBdmvWZ8Ra4/QwLJpWzXqHlPUcvPygfKrZpBrh/SJBwV57WqhUILSn
	 pMC7roTPKCAAKvvETI5DLYZUsdXnxzF9sZgclzuPswRoH1jYHdXca5vlU5oJAAch3oMhZCD2Pn92
	 heqOW5bY0aEjFWvP1D2IBiDhwQ+aXYsAzpGhNAUVucACP80BKRtTPHtLCpZ0e6LPBeiutFN2ureO
	 STCBAAL3kE/EuH2nJhE/2aOkKpN4PWETrQFeHJQ60WaM7e2wEfNJYp5lGPqiW+168e6cPWgmlwaV
	 b/eFlk7RXxRD06mWuSx774q8XKgGnwqBgXBECl5rsC9U+B4xVBPLl8nnIr+kiKqb7zB+Gs9v5u7D
	 eBZNPLEbwu4giqg7Dn08pTUYOdG38+KrW02sR5Fmg4dN1YPKgWPv19IJTapPwtKnhUUcwZIqnfZV
	 5v0azewkDEb94LlyXfXAM3IPIdyRv5uLOyNwpZAmZNo0S8Xti+jsE6nsFRy6Ad/0KBXrEdMpKFZ/
	 FFTVGf+a5FTurqorTmL+Lr1q6qMbzQ1w6/Hwzbq1s8ILsJL5a8TwNLzzN9/PU9XImHTeEqclt8ew
	 hOyP9LQlTor0Ema64tJAmJb1OGEDko3DnCVoJzm0n6Mvme7LlcHzR6g4ddpJKagVkA3TcyS37lcC
	 qUbF+h8+RQKiv1vprAmG+LPQwKJME=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v6 04/11] dt-bindings: interrupt-controller: Add Canaan K230 PLIC
Date: Sat, 23 Mar 2024 20:12:16 +0800
X-OQ-MSGID: <20240323121223.1729328-4-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_051300_522057_CC033E40 
X-CRM114-Status: UNSURE (   7.09  )
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

Add compatible string for Canaan K230 PLIC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 709b2211276b..122f9b7b3f52 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -65,6 +65,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - canaan,k230-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic
               - sophgo,sg2042-plic
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
