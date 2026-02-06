Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C23EE2084
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 10:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/r8wuTK7BYntphNGUniN/gcjBexZHxAeYzANyx7OD7g=; b=wzbJfDM0ZXiYaqJ0QJpG6Y3wfu
	K1o9W0xNxPzMaUQ/FDJOVb17tEjeYjbngxVLVlFJf2viy0JTg1oUL+/riXLZXw0AIKz1ep+vcvXWg
	6MC5QPd/y8f1y+kmd9/rfBSoeGPd+YqZvoCpNdlGom4uRUO+sMFpgst/7wLtCjC3pVXNtmKmexrEA
	9V04tjXx09JvcVP5I0KYRdGQm3rtwx6GViT5h/GQ2PvMwkzgFvRVU1LweWoj8ElA0a4CHmCTUEteP
	Q06MFM2IKyTSQEa3rysRq1at2TJypRZjoyks3ToHUf+N2PYnm4cGlK0jueLnGNJFhVrg/J557jDHq
	IqyvuA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJ1I-0000000BAzg-1sxr;
	Fri, 06 Feb 2026 10:25:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJ1G-0000000BAzA-11oK
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 10:24:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E45C243DD5;
	Fri,  6 Feb 2026 10:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C47FC116C6;
	Fri,  6 Feb 2026 10:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770373497;
	bh=nSlDqHzMQr152avoDT8llEAGQVSmXKKZSUd4Xq6kY2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qd6XDHLl3otd4l7745FgtPHKCh+28ET+4Gh4od6CGkx9KS7Rmrnkuzrnifg94r/rN
	 OLjfInm8mgJh7ONidOWK8Gh54/rKF5snHY8nmT4Q4rMwo4SMe0HxDvtC4zbTBBC+e4
	 zsyr/lwEOHpNtwSNo56ArmBaMDE4QvCgrJqonWp4CUmMGXLAeJUaMUe9VxH0u/xiYT
	 dy/j+hH186tZh0Y5Ys1YxM8w8QfAoSSH3ZITUu59upINGLkB1Aze4mRHoP1RhTTyWL
	 SP+MmDr0FSVqiQj0GIN3bxtbFhxX7Q2wVHBlvgqfRPoInqSTYpWc1ytvp+bh9ts4Eo
	 ueh0byIlBA+0A==
Date: Fri, 6 Feb 2026 10:24:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jingyu Li <joey.li@spacemit.com>, iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/8] dt-bindings: iommu: Add spacemit/t100 features
Message-ID: <20260206-buffed-scrubbed-36fc49ada496@spud>
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <A0E91F323138E92F+a27d73b00f3324f0d3885128f5596230b3f1370b.1770195980.git.lv.zheng@linux.spacemit.com>
 <20260204-primer-wrought-6f64b14bf152@spud>
 <53171BEB06F43599+7c1f54bc-e72d-4cbd-9d10-194ae6b13744@linux.spacemit.com>
 <20260205-attitude-customer-129fe2bd5dc7@spud>
 <B8005DB6301AACB4+374512e1-f561-4d2f-afd6-7a4b51012501@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <B8005DB6301AACB4+374512e1-f561-4d2f-afd6-7a4b51012501@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_022458_324389_3A817C57 
X-CRM114-Status: GOOD (  38.32  )
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
Content-Type: multipart/mixed; boundary="===============6529944387949995013=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6529944387949995013==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8z5ZdYiefbay1YtF"
Content-Disposition: inline


--8z5ZdYiefbay1YtF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 06, 2026 at 09:33:09AM +0800, Lv Zheng wrote:
> On 2/6/2026 2:24 AM, Conor Dooley wrote:
> > On Thu, Feb 05, 2026 at 11:11:51AM +0800, Lv Zheng wrote:
> > > On 2/5/2026 1:37 AM, Conor Dooley wrote:
> > > > On Wed, Feb 04, 2026 at 05:09:12PM +0800, Lv Zheng wrote:
> > > > > Adds device tree bindings for SpacemiT T100 specific features by
> > > > > introducing spacemit,100 compatible. T100 contains distributed IO=
ATCs,
> > > > > each of which exposes pmiv interrupt.
> > > > >=20
> > > > > Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
> > > > > Signed-off-by: Jingyu Li <joey.li@spacemit.com>
> > > > > ---
> > > > >    .../bindings/iommu/riscv,iommu.yaml           | 37 +++++++++++=
++++++++
> > > > >    1 file changed, 37 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/iommu/riscv,iommu.=
yaml b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> > > > > index d4838c3b3741..2da3456e7402 100644
> > > > > --- a/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> > > > > +++ b/Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
> > > > > @@ -32,6 +32,12 @@ properties:
> > > > >      # should be specified along with 'reg' property providing MM=
IO location.
> > > > >      compatible:
> > > > >        oneOf:
> > > > > +      - description: SpacemiT distributed IOMMUs
> > > > > +        items:
> > > > > +          - enum:
> > > > > +              - spacemit,t100
> > > > > +          - const: spacemit,riscv-iommu
> > > >=20
> > > > What actually is the t100? Is it an SoC or is it the name of the co=
re
> > > > complex IP that spacemit is using in multiple SoCs?
> > >=20
> > > T100 is the name of the IOMMU IP developed by SpacemiT, announced in =
RISC-V
> > > 2024 China Summit:
> > > https://www.bilibili.com/video/BV1DNtCeiEBk/
> > > It's world first server SPEC IOMMU in RISC-V, supports IOTLB placed in
> > > adjacent to the DMA masters and supports PCIe ATS and PRI.
> > > You can find it shipped in the recent publicly purchasable SoC Spacem=
iT K3.
> >=20
> > Right, then what you need here is something like:
> >=20
> > items:
> >    - enum:
> >        - spacemit,k3-iommu
> >    - spacemit,t100-iommu
> >    - riscv,iommu
> >=20
> > Driver can then match on spacemit,t100-iommu - but you need to have
> > soc-specific compatibles.
> > I'm not convinced that riscv,iommu is suitable here though, does the
> > driver work on your platform without the portions of code that are added
> > by this series and enabled by your new compatible? If not, the I don't
> > think the riscv,iommu fallback should be here.
> >=20
> > Additionally, please stop sending new versions so frequently and in
> > response to earlier submissions. I have a v4 in my inbox while we are
> > still discussing v3.
>=20
> SpacemiT provides RISC-V IOMMU implementation, T100 is the first
> generation of the this IP product line, we have plan to develop T200,
> T300, etc., with more features introduced to be adoptive to new
> RISC-V IOMMU specifications.
> Besides, T100 is not only shipped in K3, but also shipped in V100 and
> the follow-up SoCs, like Kn, Vn00, they will likely use the same
> synthesis result of T100 RTLs.
>=20
> From SpacemiT's point of view, we need a common sense of this IP
> series for something like IOATCs, that's why spacemit,riscv-iommu
> (this is same like qemu,riscv-iommu) is introduced. And a common sense

No, it's not the same as qemu,riscv-iommu. That exists to avoid
riscv,iommu being allowed in isolation and as a "SoC"/integration
specific compatible. The driver matches against riscv,iommu not
qemu,riscv-iommu and has no qemu,riscv-iommu specific behaviours.
It is akin to having spacemit,k3-iommu.

> of T100 for all SoCs shipped T100 (like global filters, vendor events
> and etc.,).
>=20
> IMO, the current compatible is proper to reflect these concerns.
> What do you think?

I pretty much already told you what I think, that you need SoC-specific
compatibles for SoCs that integrate this IP and that the you should drop
the spacemit,riscv-iommu compatible. The spacemit,riscv-iommu compatible
doesn't provide any additional value over spacemit,t100-iommu, and has
the downside of maybe being confusing in the future if spacemit
produces a iommu that doesn't have the IOATC behaviour.

Also, I don't see an answer to my question about whether the hardware
will work without the driver changes this series introduces and enables
with the new compatible?

Cheers,
Conor.

--8z5ZdYiefbay1YtF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYXBcwAKCRB4tDGHoIJi
0jyPAP9isV7zyFlG71V/A10awaNoOnM6vetdkFyMEwJt5Yj2ZgD/U8AKoodPKvnt
PY1aMEIn8pr+p3KARKfZhb9DFBcT2w0=
=XWl+
-----END PGP SIGNATURE-----

--8z5ZdYiefbay1YtF--


--===============6529944387949995013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6529944387949995013==--

