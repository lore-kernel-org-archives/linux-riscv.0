Return-Path: <SRS0=kDER=NE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550E4C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Aug 2021 14:44:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17B9760EE0
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Aug 2021 14:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17B9760EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCtxzqpYZV1b4b8MTRQQ9uvtYsxn72NhciYV+Y9gIGs=; b=toz6VEwW+VInojF1+c4wUd+knL
	zuQvIWQrJGy1eEdMknqwKktiV1SgOS/80fUm1TX4v+QFI0raoFPQajBNVEuUCh3BOOcezx/Gyr1dh
	Crh293Uy8LOC2hs0tyDwYLzocmKGfwQAgJkztIYYshkr0cAw+Ehai3vn5r9OAmJwaoz5kn5MaNC3r
	c33MZhKZkTXvOs047pSEHeutV4GR108J9OE7n9vjDCUJrZutkGyJxXsMPnYbuc8DmFSgG7dBtDW0J
	f4IP4KuzZJ1gmS996FxxBXNpO4XqGyDyfN19qjbXC85GfD1osQYB/KrZFS2OoKLzOq0TrA3rstXUz
	oMJ6Hn4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEYQ4-00Cq6q-G2; Fri, 13 Aug 2021 14:44:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEYQ2-00Cq6A-5g
 for linux-riscv@lists.infradead.org; Fri, 13 Aug 2021 14:44:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id u1so7088176wmm.0
 for <linux-riscv@lists.infradead.org>; Fri, 13 Aug 2021 07:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2GEjq99Ivf3hy+n7EUR2s2FJOrTklvp8lMkzGzLSlp0=;
 b=Y8zwNcjCx+h1UdumUaPu7pesQBDoZN92clH1u7JNjfchXUBltzO6Hq+tMpwDWkK8CI
 CCS/tCK+Ay9RsGm0H+A6e7/HA/lqoobcBHjX9E25NOklGJM3Lme/K5pkdpGMD2WcE8gF
 8oLdDR5YP72ZPME54YtfI+LyoCYfKE/0nXX2wS6Z/PNXrV9kaMjpok1aqt9tzKdU2FmU
 nNKke3J71Skwe3UdJSa0PoOp9bpti9tRoxQoc8eRa2BNemU0k2okytWpYtCtJP6Fx7HD
 oUeEfZkMifpB9rafuECHy5e/H4wZdv7BQn/94xcsnhotMtEXtLadrH0Hs+GP9zx8BZ4n
 gbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2GEjq99Ivf3hy+n7EUR2s2FJOrTklvp8lMkzGzLSlp0=;
 b=Hoe8EjpjxUabflG3p8y7o/KSlhLsr91+XUEhm0+qyzkD6nk7exD1ov7aYEBhdiZVvs
 hFjeXhzKtXYAe/G7FvATsi34/My06vDkBIJysArmXesCBiFKP5w/mAQ3G+Q5h4Ge/7C3
 RPBMkycxuEBe+kV09EUXkdGuDysUWfyPVlER3IU62w7N7hhpy1NCX9F4Np+8T0ujeWmk
 mEaoLaQ57OKynjZtoBofm9sUsoi0XLWNxZETRbZnkITmM0HI1IAet/SbKGGWaXRUmPDP
 JuhJzcrYc+BV+9ypFL+y69YZcEDVz+r2VQv8zZ/5Md0Oo2+raLOf2k/nvfqVLYxA1ejr
 rSjg==
X-Gm-Message-State: AOAM533Zzm/IWdYkJ/GdWaWjWGr9c3sKP6ALZKcj9ysUN1xBoaAX9Yt0
 QDuTsFcxv1mM3SxSFmdkeRc=
X-Google-Smtp-Source: ABdhPJxnx3BM6wz5YYRTf89esWL4ZWKvIrQqeRM0oSTeawxwQy3JNDz03Ud0xkzXOJKOgU5EsnDaJQ==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr3062131wmj.63.1628865859846;
 Fri, 13 Aug 2021 07:44:19 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id e11sm1751375wrm.80.2021.08.13.07.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 07:44:18 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:44:17 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Matteo Croce <mcroce@linux.microsoft.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Drew Fustini <drew@beagleboard.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jon Hunter <jonathanh@nvidia.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH net-next] stmmac: align RX buffers
Message-ID: <YRaFQRyD8fwc6PEz@orome.fritz.box>
References: <20210614022504.24458-1-mcroce@linux.microsoft.com>
 <871r71azjw.wl-maz@kernel.org> <YROpd450N+n6hYt2@orome.fritz.box>
 <87pmuk9ku9.wl-maz@kernel.org> <YRUwMjeQnXH5RfoB@orome.fritz.box>
 <87v94a8z0u.wl-maz@kernel.org>
MIME-Version: 1.0
In-Reply-To: <87v94a8z0u.wl-maz@kernel.org>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_074422_268500_892496EE 
X-CRM114-Status: GOOD (  48.51  )
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
Content-Type: multipart/mixed; boundary="===============1836286450680740366=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1836286450680740366==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X64kRSgE2UZmdzLA"
Content-Disposition: inline


--X64kRSgE2UZmdzLA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 12, 2021 at 04:26:41PM +0100, Marc Zyngier wrote:
> On Thu, 12 Aug 2021 15:29:06 +0100,
> Thierry Reding <thierry.reding@gmail.com> wrote:
> >=20
> > On Wed, Aug 11, 2021 at 02:23:10PM +0100, Marc Zyngier wrote:
>=20
> [...]
>=20
> > > I love this machine... Did this issue occur with the Denver CPUs
> > > disabled?
> >=20
> > Interestingly I've been doing some work on a newer device called Jetson
> > TX2 NX (which is kind of a trimmed-down version of Jetson TX2, in the
> > spirit of the Jetson Nano) and I can't seem to reproduce these failures
> > there (tested on next-20210812).
> >=20
> > I'll go dig out my Jetson TX2 to run the same tests there, because I've
> > also been using a development version of the bootloader stack and
> > flashing tools and all that, so it's possible that something was fixed
> > at that level. I don't think I've ever tried disabling the Denver CPUs,
> > but then I've also never seen these issues myself.
> >=20
> > Just out of curiosity, what version of the BSP have you been using to
> > flash?
>=20
> I've only used the BSP for a few weeks when I got the board last
> year. The only thing I use from it is u-boot to chainload an upstream
> u-boot, and boot Debian from there.

That's interesting... have you ever tried to inject a version of
upstream U-Boot into the BSP and have it flash that instead? That should
allow you to drop the chainloading step.

Not that that's likely to have anything to do with this.

> > One other thing that I ran into: there's a known issue with the PHY
> > configuration. We mark the PHY on most devices as "rgmii-id" on most
> > devices and then the Marvell PHY driver needs to be enabled. Jetson TX2
> > has phy-mode =3D "rgmii", so it /should/ work okay.
> >=20
> > Typically what we're seeing with that misconfiguration is that the
> > device fails to get an IP address, but it might still be worth trying to
> > switch Jetson TX2 to rgmii-id and using the Marvell PHY, to see if that
> > improves anything.
>=20
> I never failed to get an IP address. Overall, networking has been
> solid on this machine until this patch. I'll try and mess with this
> when I get time, but that's probably going to be next week now.

So I've hooked up my Jetson TX2 and tried various workloads. I wasn't
able to reproduce this on next-20210813. I've tried both the L4T 32.6.1
release and a local development build.

Perhaps one thing to try would be to upgrade your L4T BSP to something
newer. I know that there have occasionally been bugs in the MTS
firmware, which is what's running on the Denver cores, and newer BSPs
can fix those kinds of issues.

If that doesn't help, perhaps try to read out the SoC version numbers so
that we can compare. I know that some newer Tegra186 chips behave
slightly differently, so that's perhaps a difference that would explain
why it's not happening on all devices.

You can read the version and revision from sysfs using something like:

	# cat /sys/devices/soc0/{major,minor,revision}

> [...]
>=20
> > > That'd be pretty annoying. Do you know if the Ethernet is a coherent
> > > device on this machine? or does it need active cache maintenance?
> >=20
> > I don't think Ethernet is a coherent device on Tegra186. I think
> > Tegra194 had various improvements with regard to coherency, but most
> > devices on Tegra186 do need active cache maintenance.
> >=20
> > Let me dig through some old patches and mailing list threads. I vaguely
> > recall prototyping a patch that did something special for outer cache
> > flushing, but that may have been Tegra132, not Tegra186. I also don't
> > think we ended up merging that because it turned out to not be needed.
>=20
> ARMv8 forbid any sort of *visible* outer cache, so I really hope this
> is not required. We wouldn't be able to support it.

I couldn't find any trace of this anywhere. So I'm possibly
misremembering. It's also more likely that this was on an earlier SoC
generation, otherwise I'd probably remember more clearly.

Thierry

--X64kRSgE2UZmdzLA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEWhT4ACgkQ3SOs138+
s6G1rxAArVvwByHZ3mTo/xyzjpXbONIIoIJ3sPDUfnv0XGyqVLpstQGZqzZM2qmr
OiykYQpbdjemNNvZLrW0axYvo/7ImPhMaA2aKhOUdekOqx8HhMFUpBB4t5zvzeKm
/EpbhncuTeIXMGVeCpYNSnBqqf9TvewojlecM/UuiqMRfEH093LmZz2hluVWWzHz
V9LbAz/MfMz+XH9HTsLz6rRsR49mh2n3eO0XfJPqZYwuPr6U/hQEBspb9b/8nK2Y
eUKzHcec0Lk0qesdnarMb14YFCs8zShQd4hKsxGsA65gC1vKpfDp5Bact4jtuo4L
4HfKNS4HD0mKU413Jd/AcFu0sht5b0MDV8iyxXZKwgHCScrEwLiUpVpqcEVgreCw
UfXmExHmZrSglwe8LOBX/8cGekHMUojyu3mdBkzKTT4MZf8UavvwDfmLEsgyYmEO
u67ZQvhIjOXw4HpUvVTY07v1Sj1aHZjKgl7baD4nVx9cR7bjxVK7AbFvykKYZjdI
3EiE33eHg/18CN3XaaPA7A6Kh8gLj/7Y8fziusfDV3G/wGm7we1oF5DTjBHbAQu8
GOuH7ZMzJ8NwMTJ758zhRdKCS4dt0fsAXYgC5iwGbFaSYwzv9JkCdYCLntyNWtYR
ulWUWKl7p76oH+P+WqjPcYdEpz8SVCfhQjoRzgu3FSPu+bNM/oc=
=uBz8
-----END PGP SIGNATURE-----

--X64kRSgE2UZmdzLA--


--===============1836286450680740366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1836286450680740366==--

