Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6021A606A327
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E3qyvGyQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aONj7GCZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yRXHLJUyiAkxvgZ3oVjmWwCmnUofxEQXCCZ7pPwAhkI=; b=E3qyvGyQ5sgTHw3nAXRoudjxT7
	oo3gSf7O18Ec76lJ+m8Or3sfHxgemLGZvADdMgMuj8n6I29oL9F7qi5b8UABS9t74/CRpRoW/dnsS
	rnGY4nvpy2xwdPdW1wfCPJGX9L4ZLvnDOUDFblnfvGXRzIMlj40MUof3MONZH/Z3xK+URiCiCCt+Z
	EKrpQ9psERvjsmcPrS7THfLxtWrDK8AochpH42JVnl8moYju6egREVAl+fnTUtSoTR6frerENFxj/
	FIXjSKTgALnYKMsci8YYqJJoFHspcZUpFf1CMhV9H1o5qVgz2r3Fi7XxYyj2SKMKr9nooiGDGUUfE
	OEqBNSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS97I-0000000Fai9-2MWp;
	Sat, 14 Nov 2026 08:28:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS97H-0000000Fahy-2Nfm
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 08:28:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3211605D0;
	Sat, 14 Nov 2026 08:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B121F000C4;
	Sat, 14 Nov 2026 08:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794644886;
	bh=Z8lG6RIILKdVtCLqTJnL4db2Nr11A+SPOEk6bNLst48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aONj7GCZBFFfnZ8Ubfmqq1wA/ptT6y4aS02AvlojcCkonlAxX2BcAToLyO51K9O6D
	 hYhVXTRLTiNcpr8p9Ud0Sz0nujRAbq1n9QL39vSKM24atcGMUZYWerjuQL3gzTCdko
	 3kZWR3j7wm8FgnHshN9zRb4aMXLCyM+cgLCDrfFUsmumAfUph5qUF4ZZL+6Yw0jAoX
	 YdihrZBWIiv8eWvIP0T2hF/EFCUZslaid3TO2SYhHGwniX9SdrblHXeUEklMG32gTB
	 PzGs2GCsULKUfwGptcLGuNk8G/2YWwFgGDnJCokFSrZ//UB00S2roMKwvnziZc/9OZ
	 Arhu/U28jG/Yg==
Date: Sat, 14 Nov 2026 08:28:02 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Sarah Emery <sarah.emery@canonical.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 CoM260 IFX TQ support
Message-ID: <20261114082802-GKC100523@kernel.org>
References: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
 <20261105-k3-tq-dts-based-on-com260-v1-2-aa0b7714aed0@linux.spacemit.com>
 <fcd2fc41-5af8-4256-8296-a5435fdf41db@canonical.com>
 <DMTY56PU7CP2.JGIZ9XDXII9E@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DMTY56PU7CP2.JGIZ9XDXII9E@linux.spacemit.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Troy,

On 08:39 Fri 13 Nov     , Troy Mitchell wrote:
> On Tue, Nov 10, 2026 at 01:46:28PM +0100, Sarah Emery wrote:
> > My understanding is that the nodes from CSB1-N10SPK3, the "K3 CoM260 TQ"
> > and the "K3 CoM260 IFX TQ" are all the same: a "K3 CoM260" module on a
> > "TQ" or "IFX TQ" carrier board.
> >
> > Is there two different carrier boards name "TQ" and "IFX TQ"? Or is it
> > just the same thing, called differently in this patch and in the EEPROM?
> 
> They are the same carrier board. The only difference is the power scheme
> of the CPU clusters. The bootloader programs those regulators at boot,

If they are physically same carrier board with same CoM260 module, but only
the power setup configuration is different? then no reason to introduce two
different compatible strings, if still need to differentiant, please find
other way out?

> and upstream Linux currently keeps the voltages it leaves. Support for
> the regulators is not upstream yet, so the two boards cannot be told
> apart in the device tree for now.
> 
> > I'm not sure how devices out there are referencing themselves. But if it
> > is in fact one device and the EEPROM calls it "k3-com260-tq", this patch
> > will not work for device-tree matching.
> >
> > What do you think? Can you clarify the situation?
> 
> You are right, thanks for pointing this out. I only had an IFX TQ board
> when I sent the series, so I did not notice that the TQ nodes identify
> themselves as k3_com260_tq in the EEPROM.
> 
> I will restructure the series as k3-com260-tq.dtsi holding the shared
> carrier description, with k3-com260-tq.dts and k3-com260-ifx-tq.dts on
> top of it that only set model and compatible. I will add
> k3-com260-tq-power.dtsi and k3-com260-ifx-tq-power.dtsi for the two
> power schemes later.
> 
> Yixun, what do you think?
> 
Please send out a version for review, I'd be generally fine within introducing
two dts files, but be careful about new model and compatible string..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
