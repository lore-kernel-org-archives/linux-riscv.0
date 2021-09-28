Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D34FC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 11:26:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D0D961131
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 11:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D0D961131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DKIoqbEyixGdXgbWIPJG4apXeV8C8Og4ByzVJw7yzA=; b=DkvnllPanHKWL4zjxXsCxPOe9Z
	zseSrLkXV1fDLCLFbqdt8+VmLSBTZBI8dZUphE6+de+uZyTtyRvN2YKT6bgOJOszPB6mwh4VqFu8V
	KH4ISqHf7UqFwRMSThSWzGorsYD4gGg1euHt3eEKEneNodMfjlqEylOf36+tprmxYGzl794B+J/0e
	YvbYJ9KBdrUEsyEOQWetGLWbLvtv1blRyqKEWixgEte0GcNBqI5e1uu5ntPigfBX6X5yi/wLH8kH/
	JIqBavBIGWTr3kFclnAedexgowo9pIKWaJT0TXVUu0kZypynaQpQvC2kYeGbtXQYzv5zG4cEFQHFL
	a+iiMSUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVBFd-006v6b-GO; Tue, 28 Sep 2021 11:26:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVBFQ-006v4D-R5; Tue, 28 Sep 2021 11:26:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7925960F4F;
 Tue, 28 Sep 2021 11:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632828368;
 bh=R8KAqiUVcTbld8SsRhBAD3xBl/gv/DjOFjV7VeJVJDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZDP54yBqAPPjJtMo6FUl3/T3DClmyQtNWx6vavSHrpsh16x4kVdk0SYdvj80Ex+M4
 Yj4H6MT1ZJPcH37iU+qXGnSM2i7cgqGyFOddHKn+i/QO+5fhah8KHxPCzdVjGgkiWn
 aadoi/Wq66w2jIYJHDiiK44z8nbbFZj/Zn+f68+nJjuJjCI/dXoDcLZv8L/5PPP6HD
 dU50BkbVZcwtl6As8COrJI8vAUqrmShnCWO6Rk4P7YDBkJL2HLE5piBcI1MWTR6Fsg
 RQhKhavzvBOk0b/x1YjTRPzr9XxB6rjo/MS5icvZViqJ7ZEIAlwE2XccdOvV0T/oeB
 xSvt2+C3tBIdQ==
Date: Tue, 28 Sep 2021 12:25:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-ia64@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig
 unconditionally
Message-ID: <20210928112519.GI4199@sirena.org.uk>
References: <20210928075216.4193128-1-arnd@kernel.org>
 <20210928083751.GG9223@ediswmail.ad.cirrus.com>
 <CAK8P3a11c6eLRWKvQeSqvEicc9bMDeEEGV5fygTidoRzYf9KnQ@mail.gmail.com>
 <20210928092400.GH9223@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
In-Reply-To: <20210928092400.GH9223@ediswmail.ad.cirrus.com>
X-Cookie: 98% lean.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_042608_930907_E586A99F 
X-CRM114-Status: GOOD (  20.85  )
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
Content-Type: multipart/mixed; boundary="===============5904705625792302386=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5904705625792302386==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cf0hFtnykp6aONGL"
Content-Disposition: inline


--cf0hFtnykp6aONGL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 28, 2021 at 09:24:00AM +0000, Charles Keepax wrote:
> On Tue, Sep 28, 2021 at 10:51:36AM +0200, Arnd Bergmann wrote:

> > Other DSPs use the drivers/remoteproc/ subsystem, but that
> > is more for general-purpose DSPs that can load application
> > specific firmware rather than loading a single firmware blob
> > as you'd normally do with the request_firmware() style interface.

> > Not sure if that fits what you do. Can you point to a high-level
> > description of what this DSP does besides audio, and how
> > flexible it is? That might help find the right place for this.

> Hm... wasn't aware of that one, we should probably investigate that
> a little more at this end. From a quick look, seems a bit more like
> it is designed for much larger more general purpose probably memory
> mapped DSPs. I guess our code is a little more firmware parsing
> and loading, and a bit less generic remote proceedure call stuff.

Right, that was why I didn't suggest remoteproc - the DSPs wm_adsp
covers seem much smaller than fits comfortably with remoteproc.  You
probably could make it fit though.

--cf0hFtnykp6aONGL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFS+54ACgkQJNaLcl1U
h9A8qQf/YB0k06nBX21Y0D9WiuzfAdegrPLdfUizVJ4VMq/8sIzxSUr3yXB0F0rR
iqS0ArRzG105rz27TluAzsoN7T1TngfvDTrQFvUBG8/xBjhNBbCxMyU7q9n8wNkC
Jjc5ylof97391uxN+1o72Unu/AOe8V6xhR4kqvQ/Sm827dp8UZIJmP0oFFw15Sgy
FCx2FaweLYfuqY4YKLdpPF3/dcvfli6O0itg7FnZHX1PLkqq5K+WKKcG5WEP+Jt2
gKccsPs2YJefc8ecZMLp6NU+T8bQraAKkpph7a2ahTNe6Ltt36E3zahy7cp7wjuZ
Nae3bwDF2mJrxNhyKnTwKBfRZvtAvg==
=SewW
-----END PGP SIGNATURE-----

--cf0hFtnykp6aONGL--


--===============5904705625792302386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5904705625792302386==--

