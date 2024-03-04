Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECBCC5478C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 15:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwz3jHDGnmK583rkXeZhfU4nzw1pTkWEOO2znolW7/E=; b=e1Ys3WLCmZVPeA
	hie1+tpZrQ22q2RsZf3c3R0fi8IyrsfSzilmRNd2JY0z6wgmj0u81URBlA1kLXK1xULwqj2d9g7G+
	GoaqI1GdzX5h+w2yc9HRDT64MRGcGmJxcNj6uHinWgzP4N1RGNJD3OH1FPGfnEVH3F/I+IMnTJ+6q
	x468Xn1kkiOwmBTeFBBeNYvXCKe1sGHgizKkVWwHAos4ABr7uv7wdz3hOiZ18xm9YsKHu9YJsdtP2
	AMyUdHGQGr2YIaW7mn0yPdHmeIAtAkDIDOH1f8wyUvmqCCPiX088tP5Elacx1HP/z/NUOLy4Ik1UF
	JpdrsmiF2ZSHcnXdNnvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhA3u-00000009XNr-3Urs;
	Mon, 04 Mar 2024 15:17:06 +0000
Received: from out203-205-221-210.mail.qq.com ([203.205.221.210])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhA3h-00000009XE5-2gFW
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 15:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709565410; bh=Zq7j+pO9atzoOOHePaxM6b0KaYKNJGrtsSo0TfDn0y8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tKhV0KcKbi3Z3cCBkgQQ44qTruieoW0apVY5TC0CCNKH8cT58DkFrVyPWKWir1gNW
	 3XgFiiVxhdf6xHwi0xVXzALhfeqZTqQ1DVMd//PyBk8dAmbG/660jT1BRVUfjfLzRB
	 pJSaQe20khusIvP7P41P30LUJbXd7sST/oLZGx08=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id 42726AAD; Mon, 04 Mar 2024 23:16:39 +0800
X-QQ-mid: xmsmtpt1709565408tx6g6kx2w
Message-ID: <tencent_CB98AA10FE4664BE0F410BED454764DCE007@qq.com>
X-QQ-XMAILINFO: OM81xDxpmoVkDm+I0fbFX/1HJ5fb/wJR3WA281dpFCJUX+Y9svJyFTnWk0b8Wt
	 BBmm2rtsHQyvqlRqS2sd3Cps94Fe/wscI9DMghzT6HYz+Cu2dDl/dRH7KRYt+XietT3N1wj64vbz
	 VYdnu13rxhB21jkieir24daSNqVfvDaqMzibq+PE+Ut0JUrNJ++fmX4nOTgy6E5kU4NV1LvHugeX
	 vfcJV1Wz+1EkvlOvnZeZqtdAx86XAnvra8U00nY5p+Jq5HFUoqgfQwSS2kGl02l08meWQN0SF70I
	 YGgRvyhL7Rlfgl9U80FACVscHLI/JmQIfBNr6nu2BsuCkHcCukrPzNKXsbreKo7Ta15PznGlOyP2
	 bEsT1eh7ijip57Jp26NsPSw+gx6QBWK2VCisXtb9J92Km8D5nU+MY8XX6pZlOrEd7do8F1v+TbN2
	 c3KrvmUdlnd8ALIsCSSYB4tDgFT7Rt5np0rhT4we6eMxfufZzigDAvbuqXwJqb7R35mQVYmNzUWM
	 ZwlgTx5PD/uG9vHuUSTIykPVCEXGJvGijfDWNMZLMr0CvyGMVu+h4B+6TlEuPhNE1/JdCEq2RvVj
	 CtYUozqcbC+spPi3W7lrxcryl3fwVOr9pYOAY4gJXlN+pvrXF1mz7zqqgUJ3DlyFHPQTKMfeUBo1
	 +iVmq1aKA7jLx4vxMpn9GIO7qEv+/bYU/h/f8D98X28SAJCOaE1kcSKJRSCellXBLDmHKZGtzAPo
	 TJHPmL4eAgKusBmKfyZCO1+kdh/Z2YIF6yzgTE4HA8UxhyjzGmFLZuHhi2cTgbYeOacU376K3YaL
	 AhKmhou5AlnYwfgj+XI2JMQzQYDbD+SDFanEEU1Dq8wA723oLJdZwnwcdfrszbhoLmbP2qS9K4P5
	 +EFjnkWL7WdchhJOhLwu+iox8TcJ0o7YaRdFmA0p/+5zuHzBLP48bX59AyZMlgKTpzVLLWp5d9MC
	 rqorNR6TJY8rOyvNIzaqFM8VuQRs8qHLRtrzN6fSRu36ZQgZOzXoiYXgZAH/n/PyJ5cPmDudZPUW
	 DAhfE3QRYjrUVyUqGD7XucC3ooVVA=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 5/7] riscv: Kconfig.socs: Allow SOC_CANAAN with MMU for K230
Date: Mon,  4 Mar 2024 23:16:24 +0800
X-OQ-MSGID: <20240304151626.759150-5-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com>
References: <tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_071656_404437_62E5D866 
X-CRM114-Status: UNSURE (   9.54  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
