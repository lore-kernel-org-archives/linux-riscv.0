Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E744C2BB3F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crptURpjZR1ZIKBY3xoDjVZYOYJWb9p9fzJ06srAbRs=; b=ECIme5/q+KJx5N
	vKj+kzlu9e65qFwsTnuOFDnKzGMCTJR5Jx+Y6v9o0D7b1CxEuf+G3iCAFJhsq35z2/7/Jl27CUvk0
	Ye58EgSD3Ju+ZMUu692wmsZSpUsbEsFZZ1n3ugy+oozoiky0k+GVtYN5/dQrW/0ROYK0aTjlPXbLj
	Dbnzw8XJOv9XyZe9vWwBsB3NzIfW83OI21ztHnXL3gatA4aHHikemfPQr21KHiegGnaLuamDmlC5t
	3NU5WXOhmW+I/KtTyM+MfndWEa7DYqrPMCtV88C3Q6s1fqkf+5gVW2qDT4OCj6J03RILK1G1rsNRl
	k7qL/jnA2zHzwd8ndGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r555H-00CFup-2N;
	Mon, 20 Nov 2023 14:17:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r554U-00CFfu-0C
	for linux-riscv@lists.infradead.org;
	Mon, 20 Nov 2023 14:17:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF29A612B7;
	Mon, 20 Nov 2023 14:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C97C433C7;
	Mon, 20 Nov 2023 14:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700489774;
	bh=qspyWLlSq8sWpiqqSuSqAERRXWBLMY+qTWVHc/Kgvh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Omsrc4PyxEIUeFN5Ayq65crRl3hLKVNA3iff9/dqzjjeBE0az8zdqipvpPl6alQxk
	 E6DOyURCSwVxCJ/NLKbEyO+bWsp1LXHzUvXLZfkGOtT9UeF6D4cs9C6FA04jsM5fab
	 4AQu1xxSjE91ZUYq5gkaBgaRT20TCf3UJJGbXIsITYHHTvFY5IIcsL2kwklI5DwgTE
	 3T2ZDF2tStp/ohTP5wov0fa2bLsco8HW4zeeOHvhdraCZ94aW5O4b+L/Uj9UL904Tj
	 GdQvNSX/e2Z3mTmogcP81pMr4csmoEFcph6SdSRCGmYoxlq3H+vkxRWtoq7x4hoTph
	 czBc15KLN3UgQ==
Date: Mon, 20 Nov 2023 22:03:48 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: HeinerKallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S.Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>, netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC] support built-in ethernet phy which needs some mmio
 accesses
Message-ID: <ZVtnRHsnDd+ZdZpq@xhacker>
References: <ZVoUPW8pJmv5AT10@xhacker>
 <b8c29d27-e0a2-4378-ba5f-6d95a438c023@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b8c29d27-e0a2-4378-ba5f-6d95a438c023@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_061618_585733_6503A29F 
X-CRM114-Status: GOOD (  14.02  )
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

On Sun, Nov 19, 2023 at 05:18:49PM +0100, Andrew Lunn wrote:
> On Sun, Nov 19, 2023 at 09:57:17PM +0800, Jisheng Zhang wrote:
> > Hi,
> > 
> > I want to upstream milkv duo (powered by cv1800b) ethernet support. The SoC
> > contains a built-in eth phy which also needs some initialization via.
> > mmio access during init. So, I need to do something like this(sol A):
> 
> What does this initialisation do?

Per my understanding of the vendor code, it reads calibration data from
efuse then apply the setting, set tx bias current, set MLT3 phase code,
and so on. I can see it switches to page 5, page 16, page 17 etc. to
apply settings. Compared with normal phy driver, the programming is
done via. the mmio rather than phy_read/write.

Here is the vendor source code:
https://github.com/milkv-duo/duo-buildroot-sdk/blob/develop/linux_5.10/drivers/net/phy/cvitek.c

Hi Heiner,

IIUC, the initialization also needs redo after power off, so it's
not init-once action.

Thanks
> 
> If you are turning on clocks, write a common clock provider, which the
> PHY driver can use. If its a reset, write a reset driver. If its a
> regulator, write a regulator driver, etc.
> 
>       Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
