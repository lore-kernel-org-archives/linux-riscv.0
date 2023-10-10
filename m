Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3E7CD80BD
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 12:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCo+cWb/Kx9S/tSGYUfQaWUziAq7IvMWAA4JmBwPHJg=; b=wKc8DvQpUEcXzj
	VgGaf2L/WmLA6BkGU1iruzjLMBEddgXtjZU+GM7asJX/9QO1RDH3WtpSOmH7Mr0CAYloK2fGB5o+x
	R64m2Fr5JXxOGK9jjHV89SxPluw/WMrVC0yZbeMTjsMLqgxN6ESaoKR9wNqTUw/KGZTUXDZU+VeOV
	PjRDoF+rO9vpEUMQIv2yRhMI9Ebkk1tbf0k5nn4qvNKN+I14HYbyHkhJjf7oVjZUP/1dE6E9hY5pe
	bQ0QuH4D90wt05/QPsjSJA9JBaGOZ6n1zmryVuiWS4c0j+EAC2TBWdXbdrtSKzhZssfiOAU5h/27Y
	8iE9XD6/J/oqrpc6cx8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqBjU-00DK6x-10;
	Tue, 10 Oct 2023 12:21:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqBjQ-00DK5e-0j;
	Tue, 10 Oct 2023 12:21:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B3602B81C0F;
	Tue, 10 Oct 2023 12:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE79C433C9;
	Tue, 10 Oct 2023 12:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696940457;
	bh=UxKiOjwRVBO8hPyVUUWzczAVTUMRjFlQkrN/ltCYT8k=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=z6owfJjLMQIFX2uC9sV/8w0Sqo46Pwrls0o6HMuGNTLpJ6j2UenvrZZUZyQPOk4e4
	 J3ULbbvJmYW9SamstV3gX+7XoWSBjLaIAkObsItWXbwj4B3BwNurPGM/XAYXjZVith
	 +in/PsQQCypXf3oYXYGwsK8NbTcgAuJuaCoH/RRg=
Date: Tue, 10 Oct 2023 14:20:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Deepak Rawat <drawat.floss@gmail.com>,
	Dexuan Cui <decui@microsoft.com>, Dinh Nguyen <dinguyen@kernel.org>,
	Guo Ren <guoren@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Khalid Aziz <khalid@gonehiking.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	WANG Xuerui <kernel@xen0n.name>, Wei Liu <wei.liu@kernel.org>,
	Will Deacon <will@kernel.org>, x86@kernel.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v3 0/9] video: screen_info cleanups
Message-ID: <2023101007-retread-spyglass-4b8c@gregkh>
References: <20231009211845.3136536-1-arnd@kernel.org>
 <ZSU59yPUO_Fu39o5@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZSU59yPUO_Fu39o5@phenom.ffwll.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_052100_528456_6324FC9A 
X-CRM114-Status: GOOD (  21.33  )
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

On Tue, Oct 10, 2023 at 01:48:07PM +0200, Daniel Vetter wrote:
> On Mon, Oct 09, 2023 at 11:18:36PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > v3 changelog
> > 
> > No real changes, just rebased for context changes, and picked up the Acks.
> > 
> > This now conflicts with the ia64 removal and introduces one new dependency
> > on IA64, but that is harmless and trivial to deal with later.
> > 
> > Link: https://lore.kernel.org/lkml/20230719123944.3438363-1-arnd@kernel.org/
> > ---
> > v2 changelog
> > 
> > I refreshed the first four patches that I sent before with very minor
> > updates, and then added some more to further disaggregate the use
> > of screen_info:
> > 
> >  - I found that powerpc wasn't using vga16fb any more
> > 
> >  - vgacon can be almost entirely separated from the global
> >    screen_info, except on x86
> > 
> >  - similarly, the EFI framebuffer initialization can be
> >    kept separate, except on x86.
> > 
> > I did extensive build testing on arm/arm64/x86 and the normal built bot
> > testing for the other architectures.
> > 
> > Which tree should this get merged through?
> 
> I guess if no one else volunteers (Greg maybe?) I can stuff this into
> drm-misc ...

Oh, hey, console code is for me, I keep forgetting.

I can take it, looks like we have enough acks now, thanks for reminding
me!

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
