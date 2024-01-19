Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AC5C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 08:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmnVc9n6EwjKnZk5NugOvOMbMZYkGL75iTHtiXSQRwY=; b=ZuZ9FLjEshXQAbncQRtYe/Mu7n
	a2RRnyvuCIE0AnysvkaM6KL4GRXSqoC+KXV5u2MhdhdwnVAaNFrSUmH3OGbaXVaULtQs2gF9x9Ym3
	U64TpazLBNSfBTil42slKwofMMFHxLYCbkaDnr8TEV8iDboIEtfPmwoS5FCK1DULJgQoLEwhG2Uph
	Nw9oZkXawZEEza5yArdpTq74baUkitts0IyUwNo+/PlCUy5gyfZfpLza8QGY2+uwm7RL/rCVChUYF
	9xqFPpoyx9ZkQLs+cN8HobtFMIxg93Qpx7sY3DudekgUIQh2Ebql0ehZNGbatqvNWPu6j5CQbKMm7
	CEGUWRZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQk98-004oxB-2E;
	Fri, 19 Jan 2024 08:22:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQk95-004our-03
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 08:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1705652555; x=1737188555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7hb4YNy+1qkStUyordvads+808KyrLJu2zf0XMDKAms=;
  b=S4TsMD2ACUSGLFb2ftcB0mV+51GATPrMacS6VbgNnLQXRXLPCZi1qv/1
   Zl2TEoNvtV+Qwghq8Bcnii8IlNVLnJLymiVvg/lSU2ajb+MJEhOhQvXg8
   tPDCtwizUWveSlPhhM9tOV9DZLxvtTArOrRfdTc3Xw2iYeY1JXlI08bhb
   1nupgVAsN0nbiGHI99p5fb27TeGTPmgGG/4ZErJfEauWP1q4SpB4q5xa6
   axacLW7Cd1a4B0dzeAYNdJtfLOF8sfdM4r92smZ1nc2ZOZxI+bPhqFY3t
   0iYY0/tZ7bry5KYptIa4/O8gBh45LE6cBcfOz0KDTOCic4362lThWZUx8
   A==;
X-CSE-ConnectionGUID: xQrvGusxQRCedWWaoW8P4A==
X-CSE-MsgGUID: k86Tfw7FQL6546NgoybMWw==
X-IronPort-AV: E=Sophos;i="6.05,204,1701154800"; 
   d="asc'?scan'208";a="245708593"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jan 2024 01:22:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 01:22:14 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 19 Jan 2024 01:22:13 -0700
Date: Fri, 19 Jan 2024 08:21:36 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: yunhui cui <cuiyunhui@bytedance.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [External] Re: Current status of RISC-V init_cache_level()
Message-ID: <20240119-majestic-unsheathe-4ff839d416ac@wendy>
References: <CAEEQ3wn=TkGULh=kqUxxi913_AVrRW1Edb6tTe7CuKS=YkP1BA@mail.gmail.com>
 <20240118-enjoyment-defuse-3b5a2b76afb7@spud>
 <CAEEQ3w=_SNRVCg9tGU+SjPVO57FhGQW7Pk9BZ-f97Lh5U0LXEA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEEQ3w=_SNRVCg9tGU+SjPVO57FhGQW7Pk9BZ-f97Lh5U0LXEA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_002235_060475_C6A53FB5 
X-CRM114-Status: GOOD (  22.34  )
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
Content-Type: multipart/mixed; boundary="===============8121745799254372972=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8121745799254372972==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZpMU+u+k+/pXoQ0t"
Content-Disposition: inline

--ZpMU+u+k+/pXoQ0t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 10:32:38AM +0800, yunhui cui wrote:
> On Thu, Jan 18, 2024 at 9:25=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Thu, Jan 18, 2024 at 07:40:42PM +0800, yunhui cui wrote:
> >
> > Firstly, please don't send me off-list mails about such things
> > and instead, please reply to the relevant threads on lkml.
> >
> > > There is no cache subdirectory in /sys/devices/system/cpu/cpu0/, so
> > > lscpu cannot see the cache information. I found that the reason is
> > > that init_cache_level() is not implemented on RISC-V.
> >
> > What version of the kernel are you using? I had a brief check to make
> > sure something had not gone awry recently and I could see them on my
> > system. What do the cpu nodes in your DT look like, assuming you are
> > on a DT system?
>=20
> The results of top commit using linux-next on qemu, It should not
> matter if it is combined with DT, because the following function flow
> directly fails.

Oh no, it totally does matter what the DT looks like. The default DT in
QEMU's virt machine does not populate any cache properties. On a system
where the DT populates these values, init_of_cache_level() will ensure
that the correct sysfs entries are set up.

> cacheinfo_sysfs_init()...init_cache_level()
> int __weak init_cache_level(unsigned int cpu)
> {
> return -ENOENT;
> }
> Is it necessary to implement an init_cache_level() on RISC-V like other a=
rches?

In order to implement that function, we would need some mechanism for
finding that information. Where do you suggest we get it from, if it is not
provided to us from DT?

> BTW, Does cat /proc/cpuinfo expose cache-related information, such as
> cache size?

It does not.

Hope that helps,

Thanks,
Conor.

--ZpMU+u+k+/pXoQ0t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaoxDQAKCRB4tDGHoIJi
0qhoAP9HUvRSO+ip61lNyU5ujc8wMQ6/G+GeLox3MQA6DwZ5AQEAhrlEa2xfllh9
4pqL+YjQDBlZcCXYEYMt2+7DacoRvwA=
=aPXv
-----END PGP SIGNATURE-----

--ZpMU+u+k+/pXoQ0t--


--===============8121745799254372972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8121745799254372972==--

