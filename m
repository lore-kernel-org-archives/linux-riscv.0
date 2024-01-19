Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E8AC4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 10:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEW56SwVKrfGVXKCdAyHRw4QlnTfK0WrfAkiIAQhua8=; b=xYeCSf86q0mB8+XQe/DHTl/lJ9
	0mVXYYA9Haq/yAPFhhLyKKI3YdHkz8hCHlj7cEOh9XoMX0cvXMIYmQlIEMpNetT2gfGF6u199Pkx4
	eBJWqwZKB2T5AJq/OIGCJZ3/OrfxmkiR6lhhrbvMKwHJ/u6xMDJk24ZlhRvubVYrqbZ5qXD9CIxtA
	EFYM7PCeHLYy4JfspUwLhfXpXfgn2IOQs1BdneLByMnyedp9JA4tB4SWYqvqvwrMpFXuVeTWG5zJ+
	8rWI9latrvtjkpEg7QQtCJ6q2Q2HWgF4TRXqMsWZKZFj6fhVCc89t1TMGbd6zxn4xb9og/SrdOtCk
	eEDZZJJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQlsz-0054AQ-1A;
	Fri, 19 Jan 2024 10:14:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQlsv-00549v-2Q
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 10:14:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1705659241; x=1737195241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oPnt5NQeRMOFkzdQJTUB636ZQoALoJwLa2sUUhQJQ3I=;
  b=hi5QNUmZAWspDnZzcxB5uO9u7zZOHRGpUrkROGf51PURu3c3P2075C8Y
   yAfErhjrUSi7qx6RJDeO4HuHTXkjy4lAJQ7B4ub2dBluRYs814vdPv65D
   Z+Z4CcxTe/RTTETGZQQtLQuc0zc0xG5O3n8/xkQbjhBZ7d0mYuFLio73J
   cgdtVS7ESdeRywpfCswX7LqRfsgb0kAhdZAER0k1THaHKjZxI3525Np1Q
   EKBR/khfTy1HJkh+e41tAg8dPlTXDXsi+6uHCmPEsSm6zyZ5fT69A7Xaa
   +HC89QsoG3/edTibpz5JKFTD+5DF8a4bwVIKtOUZyhzCoVjOeCK2TIvPh
   A==;
X-CSE-ConnectionGUID: YcwT8PZwTKKtCPlbiXoegQ==
X-CSE-MsgGUID: Yefx+CjvQ9CNyF+qQ/XerQ==
X-IronPort-AV: E=Sophos;i="6.05,204,1701154800"; 
   d="asc'?scan'208";a="245712565"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jan 2024 03:13:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 03:13:38 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 19 Jan 2024 03:13:37 -0700
Date: Fri, 19 Jan 2024 10:13:00 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: yunhui cui <cuiyunhui@bytedance.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [External] Re: Current status of RISC-V init_cache_level()
Message-ID: <20240119-copious-unknowing-35b8ff8a4938@wendy>
References: <CAEEQ3wn=TkGULh=kqUxxi913_AVrRW1Edb6tTe7CuKS=YkP1BA@mail.gmail.com>
 <20240118-enjoyment-defuse-3b5a2b76afb7@spud>
 <CAEEQ3w=_SNRVCg9tGU+SjPVO57FhGQW7Pk9BZ-f97Lh5U0LXEA@mail.gmail.com>
 <20240119-majestic-unsheathe-4ff839d416ac@wendy>
 <CAEEQ3wk9JEMHX59GE5m5n2Tk0fddfXPQ_6tZjQnN_y7DLBAQnw@mail.gmail.com>
 <CAEEQ3wkkLPM5wNhBBYJdy53OzpLY4aGpMMeaPj9s8E5SxnrL0w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEEQ3wkkLPM5wNhBBYJdy53OzpLY4aGpMMeaPj9s8E5SxnrL0w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_021401_870365_E2215DD2 
X-CRM114-Status: GOOD (  34.61  )
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
Content-Type: multipart/mixed; boundary="===============0708331803949750928=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0708331803949750928==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N/UCAII3+xcMAv0o"
Content-Disposition: inline

--N/UCAII3+xcMAv0o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 05:24:48PM +0800, yunhui cui wrote:
> Hi Conor,
>=20
> On Fri, Jan 19, 2024 at 4:59=E2=80=AFPM yunhui cui <cuiyunhui@bytedance.c=
om> wrote:
> >
> > Hi Conor=EF=BC=8C
> >
> > On Fri, Jan 19, 2024 at 4:22=E2=80=AFPM Conor Dooley <conor.dooley@micr=
ochip.com> wrote:
> > >
> > > On Fri, Jan 19, 2024 at 10:32:38AM +0800, yunhui cui wrote:
> > > > On Thu, Jan 18, 2024 at 9:25=E2=80=AFPM Conor Dooley <conor@kernel.=
org> wrote:
> > > > > On Thu, Jan 18, 2024 at 07:40:42PM +0800, yunhui cui wrote:
> > > > >
> > > > > Firstly, please don't send me off-list mails about such things
> > > > > and instead, please reply to the relevant threads on lkml.
> > > > >
> > > > > > There is no cache subdirectory in /sys/devices/system/cpu/cpu0/=
, so
> > > > > > lscpu cannot see the cache information. I found that the reason=
 is
> > > > > > that init_cache_level() is not implemented on RISC-V.
> > > > >
> > > > > What version of the kernel are you using? I had a brief check to =
make
> > > > > sure something had not gone awry recently and I could see them on=
 my
> > > > > system. What do the cpu nodes in your DT look like, assuming you =
are
> > > > > on a DT system?
> > > >
> > > > The results of top commit using linux-next on qemu, It should not
> > > > matter if it is combined with DT, because the following function fl=
ow
> > > > directly fails.
> > >
> > > Oh no, it totally does matter what the DT looks like. The default DT =
in
> > > QEMU's virt machine does not populate any cache properties. On a syst=
em
> > > where the DT populates these values, init_of_cache_level() will ensure
> > > that the correct sysfs entries are set up.
> > >
> > > > cacheinfo_sysfs_init()...init_cache_level()
> > > > int __weak init_cache_level(unsigned int cpu)
> > > > {
> > > > return -ENOENT;
> > > > }
> > > > Is it necessary to implement an init_cache_level() on RISC-V like o=
ther arches?
> > >
> > > In order to implement that function, we would need some mechanism for
> > > finding that information. Where do you suggest we get it from, if it =
is not
> > > provided to us from DT?
> >
> > It's not that we don't get cache information from DT. What I want to
> > express is that we need to implement init_cache_level() on RISC-V,
> > otherwise cacheinfo_cpu_online() will return from
> > detect_cache_attributes() and will not execute cache_add_dev(), so it
> > will not be in/ sys/devices/system/cpu/cpux/ creates a "cache" node.
>=20
> What do you think? If so, I will post a patch to fix it.

By all means if you have a patch that you think solves a problem, post
it. Be sure to CC Pierre and Sudeep if you do. Also explain exactly the
situation in which you encountered it and how to reproduce.

I briefly tested a hotunplug and replug on my setup here and the cache
information was populated correctly on replug, so there must be some
specific situation in which this is hit that I am not aware of as the
hotplug side of things I am not super au fait with.

Cheers,
Conor.

--N/UCAII3+xcMAv0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZapLHwAKCRB4tDGHoIJi
0pTlAQDyH/RkBGbVz74UtLi29SJe0JXNvt66S8dFjPCCODLKiAD/UKh67T21WmJl
lvWcZ0gC7VVNnAHFC198NtuBb+Hd9w8=
=3c8c
-----END PGP SIGNATURE-----

--N/UCAII3+xcMAv0o--


--===============0708331803949750928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0708331803949750928==--

