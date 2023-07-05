Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9DFC001B0
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 14:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4a6O4deTj1YiNwyt+cjJnAru5zx6q/HXFdLp+s4wlE=; b=xc6TPb3XoPepmChflT12DLYlca
	5XwClFzeDwn2nxwizsTRYM1ofeZObOYSU85BPrn7gDqZOHLkL4+ncl7aQ4tvX0RHK7wrwvnljhnNN
	SleZG7Bn101qL4pjZeCwctcZtOO6ETR8Sh1yzT4ghM5gRyoMIrVSVFtU7gP44t9JvUW7QE4y4bfGk
	af4MDVfliByqgOhlax8TzpdHUCUa4qzqP8lCKMH0CZ/kv7bybcnhUEAfWMQXE7F5A2/nqCb+7Pgg0
	r6n8XObjZZHgK/ZcF9EGxuuWO4Yr+wSIWEF/fhJru733VmOfLzf2ljrL88xCSHH7IwiQy9t2MDONd
	nxBrQ6mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH3jm-00GBfm-39;
	Wed, 05 Jul 2023 14:44:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH3jj-00GBeZ-0u;
	Wed, 05 Jul 2023 14:44:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF779615A6;
	Wed,  5 Jul 2023 14:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5882CC433C8;
	Wed,  5 Jul 2023 14:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688568246;
	bh=Bfv1OEtpArJuvRQCUGhra7VnMDqNj9p/Pfv5qCvRIlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nyCVxhEVfxnzawgzf+vP0upePIhn/cyzbeAAzA1OUrgQJ909G0rdGpxydDNIxAdg0
	 E65Ol1H8d5SpmXARKfZuNzNJR212t2QJu+DvSvitv1BpwO6Ha6+Rm9P9czDIWu1hKI
	 bnybdnF3dxLKkFLVvJnCe4D1JT+xo+UTe8KOv6Ofr/28MkQSrTj5s/PwH2Idv/YwVj
	 fnXiYzZGwq7EpKyKKVrdEyyqrUTHnRq0nDdAzuQtJmWd8G+tHhwCEvpzU7PZ+7j2Wj
	 SKc8W/uRFsTywdRWRok4J8vrxOdTsyFkVops35QuAr8RiYB2k6MRvvBQuCvv8j3azD
	 uNIuHwyIWow4g==
Date: Wed, 5 Jul 2023 15:44:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Ghiti <alex@ghiti.fr>, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>, anup@brainfault.org,
	atishp@atishpatra.org
Subject: Re: [PATCH] RISC-V: KVM: provide UAPI for host SATP mode
Message-ID: <20230705-fondue-bagginess-66c25f1a4135@spud>
References: <20230705091535.237765-1-dbarboza@ventanamicro.com>
 <994ae720-b3a1-1e67-ca9c-ca00e6525488@ghiti.fr>
 <029b87e1-d4bc-9deb-316b-b93c5bd2a37f@ventanamicro.com>
 <20230705-602410a4b627f419f8f9936c@orel>
MIME-Version: 1.0
In-Reply-To: <20230705-602410a4b627f419f8f9936c@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_074407_399256_5C6D4268 
X-CRM114-Status: GOOD (  29.29  )
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
Content-Type: multipart/mixed; boundary="===============6345399674997219032=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6345399674997219032==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hF/kYSmObsIABPdm"
Content-Disposition: inline


--hF/kYSmObsIABPdm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Jul 05, 2023 at 02:58:24PM +0200, Andrew Jones wrote:
> On Wed, Jul 05, 2023 at 09:33:26AM -0300, Daniel Henrique Barboza wrote:
> > On 7/5/23 09:18, Alexandre Ghiti wrote:
> > > On 05/07/2023 11:15, Daniel Henrique Barboza wrote:
> > > > KVM userspaces need to be aware of the host SATP to allow them to
> > > > advertise it back to the guest OS.
> > > >=20
> > > > Since this information is used to build the guest FDT we can't wait=
 for
> > >=20
> > >=20
> > > The thing is the "mmu-type" property in the FDT is never used:
> > > the kernel will probe the hardware and choose the largest
> > > available mode, or use "no4lvl"/"no5lvl" from the command line to
> > > restrict this mode. And FYI the current mode is exposed through
> > > cpuinfo. @Conor Can we deprecate this node or something similar?

I'd be loathe to deprecate it just because Linux doesn't use it. I know
nothing really of the BSDs or other operating systems, but from a quick
check of FreeBSD:

sys/riscv/riscv/mp_machdep.c
400-static bool
401-cpu_check_mmu(u_int id __unused, phandle_t node, u_int addr_size __unus=
ed,
402-    pcell_t *reg __unused)
403-{
404-	char type[32];
405-
406-	/* Check if this hart supports MMU. */
407:	if (OF_getprop(node, "mmu-type", (void *)type, sizeof(type)) =3D=3D -1=
 ||
408-	    strncmp(type, "riscv,none", 10) =3D=3D 0)
409-		return (false);
410-
411-	return (true);
412-}

Similarly in U-Boot:
	mmu =3D dev_read_string(dev, "mmu-type");
	if (mmu)
		info->features |=3D BIT(CPU_FEAT_MMU);

(@Drew, I remember why now that the property is optional - nommu exists)

Seems like you should indeed propagate this to the DT you give to
guests.

Cheers,
Conor.

> > >=20
> > > Just a remark, not sure that helps :)
> >=20
> > It does, thanks. I am aware that the current mode is exposed through cp=
uinfo.
> > mvendorid/marchid/mimpid is also exposed there. As far as I understand =
we should
> > rely on KVM to provide all CPU related info to configure a vcpu though.
> >=20
> > A little background of where I'm coming from. One of the QEMU KVM cpu t=
ypes (host)
> > doesn't have an assigned satp_mode. The FDT creation of the 'virt' boar=
d relies on
> > that info being present, and the result is that the board will segfault=
=2E I sent a
> > fix for it that I hope will be queued shortly:
> >=20
> > https://lore.kernel.org/qemu-devel/20230630100811.287315-3-dbarboza@ven=
tanamicro.com/
> >=20
> > Thus, if it's decided that the satp_mode FDT is deprecated, we can igno=
re this
> > patch altogether. Thanks,
>=20
> We'll eventually want the ability to get and set vsatp.mode from the VMM,
> so we'll want KVM_REG_RISCV_CONFIG_REG(satp_mode) anyway. For now, since
> we only support CPU passthrough with KVM, it's a convenient way to read
> the host's mode (while PPC qemu-kvm does read cpuinfo, I'm not aware of
> any other qemu-kvm doing that).
>=20
> Thanks,
> drew
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--hF/kYSmObsIABPdm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKWBsQAKCRB4tDGHoIJi
0sRGAP0V7xttVxq9sf036EXDkgHRsXFiX9aySZlvjCyhCM6q9wEArkaV3IBE4Fx8
9ntoXjzyWW+VVouf2XYiRj/xEVTN/wg=
=uolB
-----END PGP SIGNATURE-----

--hF/kYSmObsIABPdm--


--===============6345399674997219032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6345399674997219032==--

