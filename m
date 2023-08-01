Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13156C00528
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 17:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CXt9nQdES0obvhbKuvbr1zmxOadtIjY6JmusCfG8I0o=; b=hpQvXDrJl/u88G
	/URm2k4hD1V7IDzKx0PUthNQrOK6WC6QhpxgBieQ+Jz+zuVBD0jtaCS+WljUeKbJXyLpGI6xxUxuB
	Ry2FFz/Aq8TPMlTzmXUGcTmUIsRw2S5rdkM+0bW+nA8geQJBkYIAnzgBCyJJqGBrnz0972DGazncM
	MkFmqIVGDsuSiHdo8yc/xmwpGp+a8OqIRdw9Kx1LIBBeCt6jlrqc2hbf2M3wiVVtBrLDscfvsmrnt
	YnVItZ4x9eU8TjWyP/d+DDRBhjerPx+adubWaam6ldtdfvmyGlKzuaZGy90csFBnOr21l3GJU4kQf
	6Znk4GvsIBVI99B7lWXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQsp7-002syh-2f;
	Tue, 01 Aug 2023 17:06:17 +0000
Received: from [2001:4d48:ad52:32c8:5054:ff:fe00:142] (helo=pandora.armlinux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQsp4-002sxV-0x
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 17:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=32t8KzBiPK91q9EniM+EKlgz5Oc7/DEkMGke2ASM5EU=; b=unxIrnLNyLPXcSABko4H/SUNuQ
	mzeaJHPhKbDEH9rWd7Ynct9vQoFC82GeOjKSWTrwiWN3t/A7A/Q9p98WGawABwzWrv+TM4VGn3IeK
	P8yfGK2FJ92R/tI6iB7lucI9N2VUPXN7w7wDmYS1Q4OED6HgRyoe7B4QXHXdgC+l489GJVabErUMX
	48FQQp4ZRfu6OVgc/0wBFzUQN5jxzzg9M/ta0sIyBJw3FWzvd/4Sl/wLR3NjFMkrU0KJBvUNIIbFs
	Qbkb4B03q3lfczTN0gEftqY7RStyietmGv1OJ/d5dI6WwCTsArlAzbITWyW5yUi3S8gr+U0qly+py
	1fgWWNBQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38416)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qQsok-0004Oc-1r;
	Tue, 01 Aug 2023 18:05:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qQsoi-0000rc-EW; Tue, 01 Aug 2023 18:05:52 +0100
Date: Tue, 1 Aug 2023 18:05:52 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Ard Biesheuvel <ardb@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH 1/4] vgacon: rework Kconfig dependencies
Message-ID: <ZMk7cMgZXgZVobq2@shell.armlinux.org.uk>
References: <20230707095415.1449376-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230707095415.1449376-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_100614_332309_959DDB62 
X-CRM114-Status: GOOD (  13.94  )
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

On Fri, Jul 07, 2023 at 11:52:23AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The list of dependencies here is phrased as an opt-out, but this is missing
> a lot of architectures that don't actually support VGA consoles, and some
> of the entries are stale:
> 
>  - powerpc used to support VGA consoles in the old arch/ppc codebase, but
>    the merged arch/powerpc never did
> 
>  - arm lists footbridge, integrator and netwinder, but netwinder is actually
>    part of footbridge, and integrator does not appear to have an actual
>    VGA hardware, or list it in its ATAG or DT.

Integrator/AP has PCI, and I have had PCI VGA cards plugged in to that
hardware when I've had it.

Provided any platform sets up PCI in a compatible way, and can run the
VGA's BIOS to initialise the card, then vgacon is supportable.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
