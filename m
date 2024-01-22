Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E223C4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 08:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuQoNg0TtfAYbpMvsG1Fl1tWhZ4tRoRshveYROvqF+o=; b=ha8MW9V9KKv8N8nu8YGEkdyNVl
	II9BHlvn5IBUdivkPiXJPfT6P+yQkKaBQJnGcZINkFkCQMJ+YMLFJdc28OWjYapwjfXIbU2fGfqgb
	xca9foDjVsoFiBr3zDcsJ1DyA4KHdvfxAmUtIxfgWBWvXDjZLcty/4u8btDGWVC+NSojhKYqnzn0h
	WVCHg9Uy/gbPfjhXBWY6nQxNqiNb2/U8JEHthCzx2LJKyUF55/0/62tAEKyZxTV7ojmXFIZunTRNs
	sbQkbhqYymC4NXjGPKFqQOBUYDTHare19m798u1APJu25wR+kur7zQzE8zyz3IVIZm6JQu3A2Gngu
	35xFJ28Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRq5R-00B9jo-2J;
	Mon, 22 Jan 2024 08:55:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRq5O-00B9ir-15
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 08:55:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6A614CE28DF;
	Mon, 22 Jan 2024 08:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51193C433F1;
	Mon, 22 Jan 2024 08:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705913715;
	bh=RbUr3CBB8JAWdnVgirl7B1Rad7j/N8G1Y0BLkXdKk6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZ5e7zTK6udMaSZDG2BEngv+O8fjiipXH0Qn102yD+6LGOGjOS92X/Dr6/HrdBTya
	 0mkECPSMXCfTHpplBmsYGL0E4/juPEshQMWfNPOVZTJFYLy++IEUQspzPXQadPKxRo
	 I5w+1ko7wiX8t2dwTGNvFx7UUfKi9YiVxvBpn1FncMW+nTwvubRdqUySqWrcIPZUEK
	 f63ZIiJD9XJwUMm+Tv5mNIZkF2Byb4olycNhSy5DQ8qd8bISn/7cOVfz1AWRD+o6gW
	 ysHIWH5LrrfEx1WGVU4BYD0Q3ifrSyEFV4oHGg8KD3A5eoDhQ+ebiUEdnIEEMRECCx
	 VP7tGZIXCp89g==
Date: Mon, 22 Jan 2024 08:55:11 +0000
From: Conor Dooley <conor@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, robh@kernel.org, sudeep.holla@arm.com,
	pierre.gondois@arm.com, suagrfillet@gmail.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH] RISC-V: cacheinfo: add init_cache_level()
Message-ID: <20240122-jawline-handling-e190c90ddcfc@spud>
References: <20240122013510.55788-1-cuiyunhui@bytedance.com>
 <20240122-boxcar-conical-c728a709aa5c@spud>
 <CAEEQ3wmX7_VP-YM9NkesAhd+5zetw79AW9bo0YO7KGAeJX4eRQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEEQ3wmX7_VP-YM9NkesAhd+5zetw79AW9bo0YO7KGAeJX4eRQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_005518_548727_FA6A4522 
X-CRM114-Status: GOOD (  15.43  )
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
Content-Type: multipart/mixed; boundary="===============0874090894372262835=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0874090894372262835==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nIAUbLZo0rcUTOrB"
Content-Disposition: inline


--nIAUbLZo0rcUTOrB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 04:32:15PM +0800, yunhui cui wrote:
> Hi Conor,
>=20
> On Mon, Jan 22, 2024 at 4:09=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Mon, Jan 22, 2024 at 09:35:10AM +0800, Yunhui Cui wrote:
> > > When cacheinfo_sysfs_init() is executed, the general weak function
> > > init_cache_level() returns -ENOENT, causing failure to add the "cache"
> > > node to /sys/devices/system/cpu/cpux/. Implement the init_cache_level=
()
> > > function on RISC-V to fix it.
> >
> > If you recall correctly, I asked you to explain how to reproduce this
> > when you sent the patch.
>=20
> In fact, the reason has been explained in the commit log. As for how
> to reproduce it, you can check whether there is a "cache" node in
> /sys/devices/system/cpu/cpux/ on the riscv platform.

That's the thing - I tried to reproduce this several times and either:
a) The system had cache information in DT and the directory was
   created. If I hot unplugged and re-plugged the directory was
   re-created.
b) The system had no cache information in DT and the directory was never
   created.

You said in your original report that you came across this problem in
qemu - can you share the qemu command required to reproduce please?

Thanks,
Conor.

--nIAUbLZo0rcUTOrB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa4tbgAKCRB4tDGHoIJi
0qEhAQDf5GOioL30XSblHzIsxeUnJiWtW0IHNKk1vqhH6mJ/LgEA/5Zh6G4uESUe
I4oY4M92ei01+uox27pgiVLu4CQ6FQU=
=x05X
-----END PGP SIGNATURE-----

--nIAUbLZo0rcUTOrB--


--===============0874090894372262835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0874090894372262835==--

