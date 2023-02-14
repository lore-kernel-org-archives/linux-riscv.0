Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCD8C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 18:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6Fp7RzJA5l924HyEuJRrtQTQHruOFqyntSoCqGqrwI=; b=FdL2L0yVkkPi06g7TOYtZ2X0Mc
	2WubjeH42KS2XZCw6EOLBfJdxwFYm9yi88aXD9OSyw2qXFUunBh9HUSUkFSdSiSYg7T75FzXtD9Jo
	xM38f+tTLGjInShQHEj4PFr14QswZU+X4SJK5cUy/kVQTPQJ91+kF2eyptKaZPDWRIHRE+5D4nfKu
	r5/xtTVbudmuivIIMYWeJZUy6sVc47HJIFTLs6MCHYPmT4cOctSpR4UFAMbDfQ+GuVBPCKqNhJIN1
	rbeAEPpAFVF3SGfEsUJ/NlvB/c2HQNvaffF9Y5/zYQA6AsFjEGEYY5ixcIsiIqo5KKNAhE4OSlP3Q
	7y1E0rxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRzsY-0039BZ-3W; Tue, 14 Feb 2023 18:18:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRzsI-00395d-EM; Tue, 14 Feb 2023 18:17:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 093BE617F0;
	Tue, 14 Feb 2023 18:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7666CC4339B;
	Tue, 14 Feb 2023 18:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676398672;
	bh=zSduewvCgVEnuzhr9XpZepyB0TgJiJb9HvA+avKQf58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iTl9UVRqG8j3RhpI2HJze1aWHJj8me3Ri764XwYKLpgwBJZ59y6ovgSUZ0D101V+O
	 ujek8v+GWtvYHcsqrEAX/dS2DmfCwbRFP5yM6afFIKheTBIeg9dR8zpoXJAQ3VhDyN
	 YsPvol5yku2yUzQz10PsqRom5gHgdaIIVdKxiD8wvIRUlrm5LHxm14nqG3ooUoRsAS
	 R0BR/jyYj9Pgr5fgYSj5+xRbNPUmlB0JABQ7DJoamkuLE6rngih0UjXQ2iahNC7Q59
	 U4aK+R4ErdePpmSQJDR6OcIP4uUAj7a8DOnzX/VtFELirqIp59mzX6hEYwQo8UtDwl
	 jjt+X3f8ouzvw==
Date: Tue, 14 Feb 2023 18:17:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 05/12] riscv: Implement non-coherent DMA support via
 SiFive cache flushing
Message-ID: <Y+vQScKTumiXe8n3@spud>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-6-cristian.ciocaltea@collabora.com>
 <f1a6c357-b7e0-2869-72e0-e850b63e6ca9@codethink.co.uk>
 <3256853a-d744-4a41-41b6-752b5c95eedc@collabora.com>
MIME-Version: 1.0
In-Reply-To: <3256853a-d744-4a41-41b6-752b5c95eedc@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_101754_598477_15B5D854 
X-CRM114-Status: GOOD (  20.18  )
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
Content-Type: multipart/mixed; boundary="===============8910939669215257466=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8910939669215257466==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dFnVpkuOuLY3tqvx"
Content-Disposition: inline


--dFnVpkuOuLY3tqvx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2023 at 08:06:49PM +0200, Cristian Ciocaltea wrote:
> On 2/13/23 10:30, Ben Dooks wrote:
> > On 11/02/2023 03:18, Cristian Ciocaltea wrote:
> > > From: Emil Renner Berthing <kernel@esmil.dk>

> > > diff --git a/arch/riscv/mm/dma-noncoherent.c
> > > b/arch/riscv/mm/dma-noncoherent.c
> > > index d919efab6eba..e07e53aea537 100644
> > > --- a/arch/riscv/mm/dma-noncoherent.c
> > > +++ b/arch/riscv/mm/dma-noncoherent.c
> > > @@ -9,14 +9,21 @@
> > > =A0 #include <linux/dma-map-ops.h>
> > > =A0 #include <linux/mm.h>
> > > =A0 #include <asm/cacheflush.h>
> > > +#include <soc/sifive/sifive_ccache.h>
> > > =A0 static bool noncoherent_supported;
> > > =A0 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum dma_da=
ta_direction dir)
> > > =A0 {
> > > -=A0=A0=A0 void *vaddr =3D phys_to_virt(paddr);
> > > +=A0=A0=A0 void *vaddr;
> > > +=A0=A0=A0 if (sifive_ccache_handle_noncoherent()) {
> > > +=A0=A0=A0=A0=A0=A0=A0 sifive_ccache_flush_range(paddr, size);
> > > +=A0=A0=A0=A0=A0=A0=A0 return;
> > > +=A0=A0=A0 }
> > > +
> > > +=A0=A0=A0 vaddr =3D phys_to_virt(paddr);
> > > =A0=A0=A0=A0=A0 switch (dir) {
> > > =A0=A0=A0=A0=A0 case DMA_TO_DEVICE:
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 ALT_CMO_OP(clean, vaddr, size, riscv_cbom=
_block_size);
> > > @@ -35,8 +42,14 @@ void arch_sync_dma_for_device(phys_addr_t paddr,
> > > size_t size,
> > > =A0 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum dma_data_direct=
ion dir)
> > > =A0 {
> > > -=A0=A0=A0 void *vaddr =3D phys_to_virt(paddr);
> > > +=A0=A0=A0 void *vaddr;
> > > +
> > > +=A0=A0=A0 if (sifive_ccache_handle_noncoherent()) {
> > > +=A0=A0=A0=A0=A0=A0=A0 sifive_ccache_flush_range(paddr, size);
> > > +=A0=A0=A0=A0=A0=A0=A0 return;
> > > +=A0=A0=A0 }
> >=20
> > ok, what happens if we have an system where the ccache and another level
> > of cache also requires maintenance operations?

TBH, I'd hope that a system with that complexity is also not trying to
manage the cache in this manner!

> According to [1], the handling of non-coherent DMA on RISC-V is currently
> being worked on, so I will respin the series as soon as the proper support
> arrives.

But yeah, once that stuff lands we can carry out these operations only
for the platforms that need/"need" it.

Cheers,
Conor.


--dFnVpkuOuLY3tqvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+vQJgAKCRB4tDGHoIJi
0gRfAP9Kmf+N7QG3K6IM9+MnqN+wCycLzbKArvQrKfMwajqFCwD5ATnEt/GZfG+F
/C7JzGrUamjvpgCT+vvFkXYMT/CFAgg=
=DgMQ
-----END PGP SIGNATURE-----

--dFnVpkuOuLY3tqvx--


--===============8910939669215257466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8910939669215257466==--

