Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D360CC531F9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 11:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZouVLBFu767cGOIk0f9MccK9a+B7z0GLa2iTbuRSres=; b=TwU8PS5WRTcqMq
	v8U2VThXmQDYJYJ1IelNcvZ8yo1ZyO6wE9d9QcsbShMA5GoRTyoCmCUc3PqJgbXWw8KlNvxW9UrKr
	I/p0xTJs33snd+D0FdkRcGdDPVNTwwqL3vwbN2L885/o3bfnuwD1MNf3ormYtoj+Lzllh6OKDDTO/
	nWlP8XNDg7Wq/hXj2xgkDaYTR8H8cbfJaIYTV7w8aaVYpWn6GuFcVnE14UVLei0hVVcchSOC1bSyA
	1OIWM/4T1GiF2J/62RscXO6tLOIgtRw1qNAHtG+Nu/+4RethDtzZsU05iTiptS+Ve2BuLA5E7PWtI
	omsJhaOTQg5+A3LOWEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogBm-000000056T4-11OF;
	Tue, 28 Jul 2026 11:41:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogBl-000000056Sk-1FxA
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 11:41:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8076434FD;
	Tue, 28 Jul 2026 11:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4D51F000E9;
	Tue, 28 Jul 2026 11:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785238896;
	bh=azXT0ZNHvel2jvUvD7O+6uNPNDf+us/70LW0g7DokLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CfM2wpok3HDUErucZuqaT028yhD7BEMnip1rAVB5y/EtiZ8FGMBnBGIwAdWxdt5rw
	 uu1LnExjYcBA4eJTYVW+ymQD8YOxVRBtulNBLti7c7RV+PSFdFSbodOAymX8UzlZ7s
	 NvGYl+6/5oWljJq6mBVMa5AS0gDEUQi4ykwKZkzRGhc73Iz6MgZwcdI/azTGDeWW0X
	 F2kjIGvzRWoNon12rJVCzl3zboXnIdKuMFTHM43jgRMby6fAfMD9jkK82gLLVGjyBD
	 Kef0s7thBlKGbBkB3nqz1foAo18dWaWATQNEimCZVahJoOnKN93c3VED+v+aDNxfe6
	 zhw08mG2p1ALg==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jennifer Berringer <jberring@redhat.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: dts: spacemit: add eeprom for K3 CoM260
Date: Tue, 28 Jul 2026 11:41:30 +0000
Message-ID: <178523887414.625374.3693595453960002085.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722202848.1817988-1-jberring@redhat.com>
References: <20260722202848.1817988-1-jberring@redhat.com>
MIME-Version: 1.0
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


On Wed, 22 Jul 2026 16:28:46 -0400, Jennifer Berringer wrote:
> SpacemiT K3 CoM260 Dev Kit has two eeproms: one on the compute
> module and one on the carrier board. Both use a Giantec
> GT24C02B-2TFLI-TR.
> 
> Jennifer Berringer (2):
>   riscv: dts: spacemit: k3-com260: add eeprom on i2c2
>   riscv: dts: spacemit: k3-com260-ifx: add eeprom on i2c1
> 
> [...]

Applied, thanks!

[1/2] riscv: dts: spacemit: k3-com260: add eeprom on i2c2
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=259f5639b4b1a04cef9a7f79a95ef9ab928264cd
[2/2] riscv: dts: spacemit: k3-com260-ifx: add eeprom on i2c1
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=b1d7f3e7da4230815ad732f764f7978049737bb6

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
