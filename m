Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A33FEDEC4D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 13:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vq2vUW0cRsPeFOWEQ+7mN9B4xkBsHeII0U9XOorCdmY=; b=Zr6MYqLEScfw0J
	wGkOM3UtJ7U1xt6sXYCmnL5wFG9kH8xSxgdYkALEF4zAkJBDHt3IFQlwnuWYPfOEyqtjMlJkBRXbU
	SHeVYkkHLA7DaHCTBomncQdIN/SojeVo3Crl7Mo5zpkh/Uc5dDfDySJsOt+INiF/g3PWkzhpejcK5
	rJca+gkxlrcbHNg3WG8197Mw+L/a80b6gW/wQTGdSm3+m2g6e1/LuUrSA37+uqIKhqed/G74kpSQ7
	0t836Tb1HC17N35NTwvUzFCg29MQ4HMZnNjp4tDZMsBeas2ySWju/zw37quLb0PyS2WhNsAJbAVWN
	31Ld55AHpEqEVgLjORpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgPtz-005z0X-0X;
	Wed, 13 Sep 2023 13:27:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgPtw-005yzo-2e
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 13:27:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3394EB823DD;
	Wed, 13 Sep 2023 13:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543BBC433C7;
	Wed, 13 Sep 2023 13:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694611646;
	bh=tofNiE93U3IaqeBAYFxACX+5De+6Y1VRyuvZ5K22Ag0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EO9WY8KJHPsM2QmuPdVtf+Wu9sc//W8+E9ReFVCsnXq80hDJiv6ZLwYGMZjbAveI2
	 EG/+UtJ8DClVKi5dqsIDPNTPfHiRTrTQfKtYrIwMEgMlI0n6OIlB8DscP/kUjAS1lB
	 6HLfjNVN0QMgvxoLIudSH+m1JRoLfjt87ZJkjY2gMMr6I2zJkBKnnk7jzLIELPsuZb
	 4Imde23QiiVGfyO5/r61n9cGMIGA6z6tJcsyVBqLpF12DZhDdch2yNVLSz8XgD0xpS
	 VSrSn2829uaB1JQTpe2eKfqc2lMPORxZ8On42Uf7rcAlduwdm951rX2X5H2O8+JplE
	 PXRqN7d070nFA==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [-next v2 1/2] riscv: dts: starfive: visionfive 2: Enable usb0
Date: Wed, 13 Sep 2023 14:26:49 +0100
Message-Id: <20230913-hybrid-passerby-606345c74a14@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230829020511.26844-1-hal.feng@starfivetech.com>
References: <20230829020511.26844-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=406; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=kN8TZYfWHNsAZO+4+tMUbkf2PgLIm9b2uFw6FtgFYC4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmMO6Zt+LYy+h2PteQ99qDdC5Rvvv/ItPP2jFuTuOa6C L4+cWHXs45SFgYxDgZZMUWWxNt9LVLr/7jscO55CzOHlQlkCAMXpwBMpGEuI8ORehleed9tzSpL HTiVF7U+mPtbJdjpQSjTk4ulbysnLWFnZLjhVfM+tmP++XtFSa87pvUEqacFtk8sErT5n5N3RDV 1KRsA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_062729_065722_CFD1F3D2 
X-CRM114-Status: UNSURE (   8.35  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 29 Aug 2023 10:05:10 +0800, Hal Feng wrote:
> usb0 was disabled by mistake when merging, so enable it.
> 
> 

Applied to riscv-dt-fixes, thanks!

[1/2] riscv: dts: starfive: visionfive 2: Enable usb0
      https://git.kernel.org/conor/c/2f9f488e7b14
[2/2] riscv: dts: starfive: visionfive 2: Fix uart0 pins sort order
      https://git.kernel.org/conor/c/1558209533f1

I'll try to get these out before the weekend, the other pending patch
has been sitting since mid merge window.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
