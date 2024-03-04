Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DF1C54E58
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 21:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwz3jHDGnmK583rkXeZhfU4nzw1pTkWEOO2znolW7/E=; b=tOIAMbE35U67d6
	BpaZ7B66TciNXTvDhJymZinAPfKFZNr1uF3JZlBSxRBIfdA9tIgG1LgxyK5QDuVVNjKwkyF+WTUFp
	Z2eCw78RyFp8RcuggAGckkR3aH4PV5DLpgbm9NYRIDoJelK/6hsFivu90f1PnFgNI3SvaR1ZTnjda
	Z5B1+OfCeS4GBzg6M0rfyRAYlnRohZ/mDwP7Aowwle3+NZqq05RlYAbA4T/AznRQ5irTYB4xouNlF
	hWD1Bn5ZwEe//w5BKuoVqywB66WHJmBu6MOCPS2RvKYCfRk1IzH7GInYPQnN7O7rL6X9ePBFVM+N2
	ZxbR2v7T9T5h+/wlBZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFWC-0000000Ahqz-119v;
	Mon, 04 Mar 2024 21:06:41 +0000
Received: from out203-205-221-233.mail.qq.com ([203.205.221.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFW9-0000000AhoN-3o1a
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 21:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709586395; bh=Zq7j+pO9atzoOOHePaxM6b0KaYKNJGrtsSo0TfDn0y8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jCWlCuWWYJ+fJkBYSAkqEsq1ls5f86p1GxuWmY0LxyrG/PVlTxT14rD6XV6LWWkPn
	 Ytv8br/QLJz98aSWlAbuQjGrRaBQfyEG7Uqdq8P0Kh1vWqbBuV7uEbQhjn0sNwyDgx
	 yBbKsIk6ozwx7hbLBjqXLwrVqG3n26UDW70tjNgA=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id 1953A8D2; Tue, 05 Mar 2024 05:06:21 +0800
X-QQ-mid: xmsmtpt1709586392t2jklroa5
Message-ID: <tencent_0432DA968E39B81431F921F38D747C008208@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznhZHOdB+wuRpkNnO5yKpQhBGz3UE+dIQLnRktOPULLHEmxRfoDI
	 10MK/zPIKLM9Wdte/vVxtDXfnISN0jLZyYGa8nhKf1ZprY2DFe+64VyfP2IUq+awXf/vWxAIb+Lk
	 Mjs7vMejHw6JXf0ojrByWqdB5nhZkZyFUlGDWbaF7S6/w8zXuDJgdhiAveTAww+h5XTbFLjPhsvw
	 9sPI7bIBe++kzJ5l76xSsFAstQemDIXeWjjsuk6Oly71akKd81qbmMPjzg8YcT9UqytrkQTN3kgE
	 EzKoLfTrhzn5Ecqr9dECLh193hZ/MrW1s9MTT+0Dy94oX9uVkf+esIDMY0eBM/Re5pIbWGSg3FaP
	 21xCOhFh+eZNuaSWWPVg6UmpiKJw9Mi3E0M+mmogea1RRDwx096oRy2HTMh4ZyJOe9UH452P6367
	 xhIb9k/Q2jvtzPJ+BMQgRc7AqDS4Z+ojuL88KRt1Yw6uqISFaIeb0ikCQ0upFFwO5eXamYG8Vr9O
	 G1kqX7OPxdOgdx3Xvx3PEcswKRk3Qvmu2VWesxwGIsGIzsWVHNaFlJueDsH7gIIgAETY/BvbMqyv
	 P56tLLGvOzzqvpCczNhIUdGxAil0GIxRjS51axcjWDNcXa4hVmTHe5bWPpUeRqM+qvVAEBQIcAVW
	 dIT7xiabdUysS5sAFEuIAXZc4itcPIr9Fe5v0HO6tsWb030akqtydrJSRl9IlCpbR3GkFpGOm8/z
	 e9deXPd/JDHNuAKalcCpFrLldloua+giZbKu8tCrrM70OfmwTyAHFy2VlLG3j2nYVzNaMVuOAPKy
	 FHSOc4d4oiEfFyOcRvjH1kxpAynbU3E01Wu5z6zkYE9sNazTygt/CMhZIQ24CC2oU1LLFbkfdI3W
	 Fw7oFPy6sR+hnvCQjLg8foorVeO+sQxlHAhajs17QX4RH3+RNya0icqhH5Vmq6l5vYmX5CPfSGnC
	 +S804c95s+Sb7V0Bez4gud0p8QBY88pzYAnqAqqRY1sbGejWofgoEgKEI6hPtAklItqGhA/NCdoQ
	 5fGsQK4Cr9PHceujNi
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 5/7] riscv: Kconfig.socs: Allow SOC_CANAAN with MMU for K230
Date: Tue,  5 Mar 2024 05:05:59 +0800
X-OQ-MSGID: <20240304210601.777883-5-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_130638_368348_0C282A87 
X-CRM114-Status: UNSURE (   9.61  )
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
