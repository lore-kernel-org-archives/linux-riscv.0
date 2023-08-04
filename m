Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80813C001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 20:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mu/wRRWjG01ldFgreva67N3c+GiiH1yuVHFyClDYO9Q=; b=JhdmdYayiOHXPV
	+L/T3MF616IqiImrOVW7BRHOmqT/TywsbvC7FR+hEQmfYX2Y3olGaKpeOQvnN04HLj61Gcyhoy9oF
	hopFR4bxh+KG6fgheLRqgT6Vl35SDAf1VKHxRx4WyB/D2NN0skCvgOWem/zSyXSGABgVXzETuhY0x
	PMS8SI/thnV6lgKCD/i+UA0+Kolmc4mBQyBid20j9GUnj19csgdTZh9giCZX4JLrl45Ln8McWNOwm
	nX+++t5fQ67qD1YVoFYekXRUt0g5GQN++qLj7sswK5/R8M1bmR6HmIW04elm2LzHu27WYzB6pNwYZ
	qownqCXoSdxSX/Z+M9kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS1pu-00DEKE-05;
	Fri, 04 Aug 2023 20:55:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS1pr-00DEJt-01
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 20:55:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6BE23620D9;
	Fri,  4 Aug 2023 20:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BA5C433C7;
	Fri,  4 Aug 2023 20:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691182544;
	bh=wReEdRZmNyzKl8e39OUS/Hxln9/SS8v2NW80Cb+MhRg=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=Dg2rKdsCZa9KopomzzcFwZJZVcIoYS0nwbd9LEhg5UBGsMLJciX8q4AFAGHVCtGrC
	 P1nrcHCj2kqOfjWxuGs+6DImdGWftTInrnVWai2gagMhAs71O5JkmtftaoCtiDyu1z
	 AERYu375lf1Pt0yYUcTHlMU9vRcscSn4K36Q5hKgxKT3iqopzNpmm1VOVPcSc2zVPv
	 Zar+WBAKffJmB11lE1UcbucdfFdn9lwxZXodhjiOj84FicrvS5Cc1VUTfFQ9hMCtjl
	 Q2yhSSSty8uLQxpxve0cM3XXCM2fXVihIfPTgeyh1hbBCk5xrbxB6yajkeC07Fnq3i
	 PGtVzRLJge10A==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id DA8B427C0054;
	Fri,  4 Aug 2023 16:55:42 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 04 Aug 2023 16:55:42 -0400
X-ME-Sender: <xms:zmXNZKrcMNnSiSjBe42hFkrLMNaka8fh4JPOnwaDGvMKoDTK4Bekgw>
    <xme:zmXNZIrMvIAorwCXGgkWQygRfMITle1Ljec5oWGgL6hpaLDMmNHyOOR4qc61vFxNB
    vLlgvjhk4whRfP3ORo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrkeeggdduhedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhepvdeviefgtedugeevieelvdfgveeuvdfgteegfeeiieejjeffgeeghedu
    gedtveehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedt
    vdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrd
    guvg
X-ME-Proxy: <xmx:zmXNZPNqv6JqAbvGdhKTrjHJjz7f6BDwoP6u0n-c0osDzkfvDnn0Ag>
    <xmx:zmXNZJ5HftwiSGcKWU0ycmkYvV0ayoxBI0_v34C7K4u-buO3oXr_bA>
    <xmx:zmXNZJ42CJzXtY3RSQmkX5EtQyDdPeo_8WI7wjARdljTjXHqxUIwjA>
    <xmx:zmXNZIJ-f0ZTQCQxpbdxuHaKLQUvW2kXkhdWs_Jge0gm9mdiYo0ReQ>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3121EB60089; Fri,  4 Aug 2023 16:55:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <3baeb706-dc62-487c-a909-afc3cb3bed26@app.fastmail.com>
In-Reply-To: <ZMk7cMgZXgZVobq2@shell.armlinux.org.uk>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <ZMk7cMgZXgZVobq2@shell.armlinux.org.uk>
Date: Fri, 04 Aug 2023 22:55:20 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Russell King" <linux@armlinux.org.uk>
Cc: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Ard Biesheuvel" <ardb@kernel.org>, "Helge Deller" <deller@gmx.de>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Arnd Bergmann" <arnd@arndb.de>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 guoren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>
Subject: Re: [PATCH 1/4] vgacon: rework Kconfig dependencies
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_135547_154329_0265089D 
X-CRM114-Status: GOOD (  22.24  )
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

On Tue, Aug 1, 2023, at 19:05, Russell King (Oracle) wrote:
> On Fri, Jul 07, 2023 at 11:52:23AM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The list of dependencies here is phrased as an opt-out, but this is missing
>> a lot of architectures that don't actually support VGA consoles, and some
>> of the entries are stale:
>> 
>>  - powerpc used to support VGA consoles in the old arch/ppc codebase, but
>>    the merged arch/powerpc never did
>> 
>>  - arm lists footbridge, integrator and netwinder, but netwinder is actually
>>    part of footbridge, and integrator does not appear to have an actual
>>    VGA hardware, or list it in its ATAG or DT.
>
> Integrator/AP has PCI, and I have had PCI VGA cards plugged in to that
> hardware when I've had it.

I'm pretty sure it can no longer work and broke a while ago,
so I would prefer to leave it out unless someone actually has
a reason to use it and puts the work in to restore the support.
From what I can tell, it's broken in at least three ways with
the new PCI host driver:

- the PCI memory space is identity mapped to its CPU physical
  address as of d3721efce22d1 ("ARM: dts: integratorap: Fix
  PCI windows"), which is generally better for compatibility
  with broken drivers that read the BAR directly, but it
  prevents memory mapped ISA-style devices including VGA text
  buffer.

- vga_base is no longer set by the new PCI host driver, so
  any accesses to the text buffer just end up in user space
  memory at (__iomem*)0xb8000

- there is no DT binding for setting the global screen_info
  to whatever the boot firmware has initialized
  the VGA BIOS to, and the default 80x30 on Arm does not match
  the typical 80x25 text that would be set by the BIOS.

> Provided any platform sets up PCI in a compatible way, and can run the
> VGA's BIOS to initialise the card, then vgacon is supportable.

It looks like only footbridge does at this point, all the other
platforms would need to fix at least some of the three things I
mentioned above, in particular plat-orion is the only thing
setting vga_base but also has the identity map issue.

My impression is that nobody has cared about vgacon on most
Arm systems since it's harder to get working than fbcon with
a native PCI driver (or the built-in pl110 on integrator) but
also less useful.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
