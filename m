Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DE3EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 15:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+tFtwZkYw20pq2Uc/miv/gMm2m+CqMoRJUYn2XbIoA=; b=BYCGhdEuYSDJOSxTqaoner+TUj
	doTh76yUb7zlU4TF/n7NY2w5UfPb1FvL8AiXB+XO8yABbI6w6wn8TSRtFcecNT2P3MQa0t9lQnF/4
	WQL6TedQ3pWbxR9nNfQ8wFvmZKG9GmjZaRoi5w32v8FtynWYhWbhPR3c0K/encaH5CSOH+8wfiiNc
	Hzv4NzzoNRqPA9AktacwgaEOVadRxu/9oO0BGDt4nW359CVr/WY+8RmG5NJhwjOCrJ204MGr8/pT9
	q3/X2OD9Dj5ctXRezPBNCOEiiuGZiT19WEFFgyQSN6XsNBiPiUTtHBRLKW0wbFcM86VnPIZmciyxi
	+mKQWo6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBzaT-00EvId-26;
	Wed, 21 Jun 2023 15:17:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBzaQ-00EvI1-0b
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 15:17:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5CD646157D;
	Wed, 21 Jun 2023 15:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD77C433C0;
	Wed, 21 Jun 2023 15:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687360651;
	bh=XeX3n2Ex4fOTZjDwqLGXcfRd6/4GgUf3KTctiEH8LGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mxD2EJcFfTQ8e0cNCj5ca8stnZ+HWvu2Z6jfzHsH40oDNnGqGsGsTxUp7OZXR1bYn
	 L2Cu5aduSVIyfzDJaQJ8LBD9PZPlimATgUAaYJhLHhjXuqjmSUDNZDfmXYdGkRXX1D
	 SZuf5sWQDgcP9i//v6Js7lLFgh8H/1xh9l/iNPW3WQFx5xYhnSjBywD0RiJx3X3fxd
	 HyY+OqhP0dKpoidf4iSM7md2bDRx2WcWd3MSgW6MeTKz3BM6w/fj3+jLyZNEB8eKL0
	 /vSntbHj3I3fuwXmj9Oa+2Zbtg7OYxrqqWWHfc7MKnKkfDCKuJKfl0JkBGuJONuHey
	 GHEFZKeNjMxwg==
Date: Wed, 21 Jun 2023 16:17:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Eric Lin <eric.lin@sifive.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, maz@kernel.org,
	chenhuacai@kernel.org, baolu.lu@linux.intel.com, will@kernel.org,
	kan.liang@linux.intel.com, nnac123@linux.ibm.com,
	pierre.gondois@arm.com, jgross@suse.com, chao.gao@intel.com,
	maobibo@loongson.cn, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dslin1010@gmail.com, Greentime Hu <greentime.hu@sifive.com>,
	Zong Li <zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>,
	mark.rutland@arm.com, arnd@arndb.de
Subject: Re: [PATCH 2/3] soc: sifive: Add SiFive private L2 cache PMU driver
Message-ID: <20230621-stupor-violin-930ccc7d7593@spud>
References: <20230616063210.19063-1-eric.lin@sifive.com>
 <20230616063210.19063-3-eric.lin@sifive.com>
 <20230616-revision-speed-a83dc926b334@wendy>
 <CAPqJEFo5genyjY7qJBaESzeppbEnTiDe9qzv98ETLhWfMZeG4A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPqJEFo5genyjY7qJBaESzeppbEnTiDe9qzv98ETLhWfMZeG4A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_081734_315132_E37F0065 
X-CRM114-Status: GOOD (  21.89  )
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
Content-Type: multipart/mixed; boundary="===============6246015032779429635=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6246015032779429635==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lvXd4hUgqP0KdRuW"
Content-Disposition: inline


--lvXd4hUgqP0KdRuW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Arnd, Perf people,

On Tue, Jun 20, 2023 at 11:14:32AM +0800, Eric Lin wrote:
> On Fri, Jun 16, 2023 at 6:13=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > On Fri, Jun 16, 2023 at 02:32:09PM +0800, Eric Lin wrote:
> > > From: Greentime Hu <greentime.hu@sifive.com>
> > >
> > > This adds SiFive private L2 cache PMU driver. User
> > > can use perf tool to profile by event name and event id.
> > >
> > > Example:
> > > $ perf stat -C 0 -e /sifive_pl2_pmu/inner_acquire_block_btot/
> > >                 -e /sifive_pl2_pmu/inner_acquire_block_ntob/
> > >                 -e /sifive_pl2_pmu/inner_acquire_block_ntot/ ls
> > >
> > >  Performance counter stats for 'CPU(s) 0':
> > >
> > >                300      sifive_pl2_pmu/inner_acquire_block_btot/
> > >              17801      sifive_pl2_pmu/inner_acquire_block_ntob/
> > >               5253      sifive_pl2_pmu/inner_acquire_block_ntot/
> > >
> > >        0.088917326 seconds time elapsed
> > >
> > > $ perf stat -C 0 -e /sifive_pl2_pmu/event=3D0x10001/
> > >                 -e /sifive_pl2_pmu/event=3D0x4001/
> > >                 -e /sifive_pl2_pmu/event=3D0x8001/ ls
> > >
> > >  Performance counter stats for 'CPU(s) 0':
> > >
> > >                251      sifive_pl2_pmu/event=3D0x10001/
> > >               2620      sifive_pl2_pmu/event=3D0x4001/
> > >                644      sifive_pl2_pmu/event=3D0x8001/
> > >
> > >        0.092827110 seconds time elapsed
> > >
> > > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > > Signed-off-by: Eric Lin <eric.lin@sifive.com>
> > > Reviewed-by: Zong Li <zong.li@sifive.com>
> > > Reviewed-by: Nick Hu <nick.hu@sifive.com>
> > > ---
> > >  drivers/soc/sifive/Kconfig            |   9 +
> > >  drivers/soc/sifive/Makefile           |   1 +
> > >  drivers/soc/sifive/sifive_pl2.h       |  20 +
> > >  drivers/soc/sifive/sifive_pl2_cache.c |  16 +
> > >  drivers/soc/sifive/sifive_pl2_pmu.c   | 669 ++++++++++++++++++++++++=
++
> >
> > Perf drivers should be in drivers/perf, no?
> >
>=20
> Hi Conor,
>=20
> Yes, I see most of the drivers are in the drivers/perf.
>=20
> But I grep perf_pmu_register(), it seems not all the pmu drivers are
> in drivers/perf as below:
>=20
> arch/arm/mach-imx/mmdc.c:517:   ret =3D
> perf_pmu_register(&(pmu_mmdc->pmu), name, -1);
> arch/arm/mm/cache-l2x0-pmu.c:552:       ret =3D
> perf_pmu_register(l2x0_pmu, l2x0_name, -1);
> ...
> drivers/dma/idxd/perfmon.c:627: rc =3D perf_pmu_register(&idxd_pmu->pmu,
> idxd_pmu->name, -1);
> drivers/fpga/dfl-fme-perf.c:904:static int
> fme_perf_pmu_register(struct platform_device *pdev,
> drivers/fpga/dfl-fme-perf.c:929:        ret =3D perf_pmu_register(pmu, na=
me, -1);
> ...
> drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:549:    ret =3D
> perf_pmu_register(&pmu_entry->pmu, pmu_name, -1);
> drivers/gpu/drm/i915/i915_pmu.c:1190:   ret =3D
> perf_pmu_register(&pmu->base, pmu->name, -1);
> drivers/hwtracing/coresight/coresight-etm-perf.c:907:   ret =3D
> perf_pmu_register(&etm_pmu, CORESIGHT_ETM_PMU_NAME, -1);
> drivers/hwtracing/ptt/hisi_ptt.c:895:   ret =3D
> perf_pmu_register(&hisi_ptt->hisi_ptt_pmu, pmu_name, -1);
> drivers/iommu/intel/perfmon.c:570:      return
> perf_pmu_register(&iommu_pmu->pmu, iommu_pmu->pmu.name, -1);
> drivers/nvdimm/nd_perf.c:309:   rc =3D perf_pmu_register(&nd_pmu->pmu,
> nd_pmu->pmu.name, -1);
> ...
>=20
> I just wondering what kind of pmu drivers should be in drivers/perf
> and what kind of pmu drivers should not be in drivers/perf.
> Thanks.

To be quite honest, I have no idea.
I'm just a wee bit wary of taking anything that appears to have another
home via drivers/soc. I'd rather break drivers out, using the aux bus or
similar if need be, so that people who are knowledgeable in an area are
CCed on patches.
Hopefully Arnd or the Perf people can offer some guidance here. If it
does go into drivers/soc, it'll need a review from someone knowledgeable
of perf anyway.

Cheers,
Conor.

--lvXd4hUgqP0KdRuW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJMUhAAKCRB4tDGHoIJi
0gQPAP9NA5+xGxexqqs9oKDQy5JFuGFIRMNc1wrRkTfe1WpeaQEAnpjQJ6IBF65+
oBS810J/hKoiRXGWz+RIZLvb6+b7MQs=
=s8XO
-----END PGP SIGNATURE-----

--lvXd4hUgqP0KdRuW--


--===============6246015032779429635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6246015032779429635==--

