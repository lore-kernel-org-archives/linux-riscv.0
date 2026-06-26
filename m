Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF7BC43327
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1KJrBhLjyH87D6eZGLLUE8C7l1VnPOVxjDi0hfiC1Y=; b=kvord3q2K7sOhOHT1hWtVuzvaG
	iIvnU20Mpyv68vcy4n69GdClILyc7GDtxI8mBK3vZzIvxYDlko5IZxa/1dI9Y4Js5RdueM3oGhTwv
	cd3DsvGH8+Kr6Rm0x4MyOgq+s4IGr9pAEZBRpQXyqzVvDW0jiIxqBosOH8XTkjZwnet3Xg5D+JlQJ
	o5WyxL2ZSMJPkrzFcdWHWx5KpDKL+k/vFL2PM4BaRmZREo/woHJhHcrhCHEGiBet72H4WOeYEWMGK
	tFGsnYgsaqAVtvJAn6OPLwYEn4hc6J12GfekkfxfDkAvkbs14Tg34t9IzbeLOKu5K3zBkdbeBVGfV
	YZb3LtnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8jr-0000000BZ8D-3FXB;
	Fri, 26 Jun 2026 15:45:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8jq-0000000BZ87-0HFr
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 15:45:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4ED9942B45;
	Fri, 26 Jun 2026 15:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2BF1F01561;
	Fri, 26 Jun 2026 15:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782488705;
	bh=YoE9n7g3JaL94VUoMaa+5nIfgKgOXYELQGwVyrlOQDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y3yjhDRKri5OqFVXbZ0Pnd8TmyxIp0+JQNaSAASUVkDKRZK3F5aD/cj7Mdk/lyWzj
	 oeHeNrHk3b9lY6ssLUYcNsr1C4BN1AOrUsuDIno7QiCHl3IjGf7DS0dbuV3/2l2mk+
	 UtP9/QlRgQLGiCNzbtpjAPN4TeSHLpLMz15UB5UHXey0pHTIrqJS4nb2G+z3zqPW5e
	 9Crvxz22lYIWw73PxU4qRqzXUz5kygn7vKP88lseWFRZ1TPjU6KSSxHB/37hx6fL2l
	 ii86j4F/28QrKlTXxLv8tHhilaDvOGDQvbBcOtaF047os8dt+0DfMKKJl7llUwUCQk
	 7m+eXmrvm2SsA==
Date: Fri, 26 Jun 2026 16:44:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 7/8] dt-bindings: riscv: Add generic CBQRI controller
 binding
Message-ID: <20260626-immobile-staining-c825a86bd613@spud>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
 <20260624-dfustini-atl-sc-cbqri-dt-v2-7-2f8049fd902b@kernel.org>
 <20260625-cupbearer-failing-9ce0abf97b93@spud>
 <aj1_0AnIBk8_xoDd@gen8>
MIME-Version: 1.0
In-Reply-To: <aj1_0AnIBk8_xoDd@gen8>
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
Content-Type: multipart/mixed; boundary="===============6490430527523423961=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6490430527523423961==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/zmDCd3AvwrgXHjE"
Content-Disposition: inline


--/zmDCd3AvwrgXHjE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 12:21:52PM -0700, Drew Fustini wrote:
> On Thu, Jun 25, 2026 at 05:19:28PM +0100, Conor Dooley wrote:
> > On Wed, Jun 24, 2026 at 06:38:35PM -0700, Drew Fustini wrote:
> > > Document the generic compatibles for capacity and bandwidth controlle=
rs
> > > that implement the RISC-V CBQRI specification. The binding also
> > > describes the common riscv,cbqri-rcid and riscv,cbqri-mcid properties,
> > > and the optional riscv,cbqri-cache phandle that links a capacity
> > > controller to the cache whose capacity it allocates.
> > >=20
> > > Assisted-by: Claude:claude-opus-4-8
> > > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > > ---
> > >  .../devicetree/bindings/riscv/riscv,cbqri.yaml     | 97 ++++++++++++=
++++++++++
> > >  MAINTAINERS                                        |  1 +
> > >  2 files changed, 98 insertions(+)
>=20
> Thanks for the review.
>=20
> [..]
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - description: Tenstorrent Ascalon Shared Cache
> > > +            const: tenstorrent,ascalon-sc-cbqri
> > > +          - const: riscv,cbqri-capacity-controller
> > > +      - enum:
> > > +          - riscv,cbqri-capacity-controller
> > > +          - riscv,cbqri-bandwidth-controller
> >=20
> > Please modify this, as has been done for other riscv spec related
> > bindings, to let people get away without using device-specific
> > compatibles.
> >=20
> > In this case, you can just delete the first entry from this enum, since
> > it already has a user and only have to implement this feedback for the
> > second entry.
>=20
> Would this work?
>=20
> properties:
>   compatible:
>     oneOf:
>       - items:
>           - enum:
>               - tenstorrent,ascalon-sc-cbqri # Tenstorrent Ascalon Shared=
 Cache
>           - const: riscv,cbqri-capacity-controller
>       - items:
>           - {}
>           - const: riscv,cbqri-bandwidth-controller


Should do, yes. I question the need for a comment though, seems pretty
evident from the compatible what it is.

> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: tenstorrent,ascalon-sc-cbqri
> > > +    then:
> > > +      required:
> > > +        - riscv,cbqri-rcid
> > > +        - riscv,cbqri-cache
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    l2_cache: l2-cache {
> > > +        compatible =3D "cache";
> > > +        cache-level =3D <2>;
> > > +        cache-unified;
> > > +        cache-size =3D <0xc00000>;
> > > +        cache-sets =3D <512>;
> > > +        cache-block-size =3D <64>;
> > > +    };
> > > +
> > > +    cache-controller@a21a00c0 {
> > > +        compatible =3D "tenstorrent,ascalon-sc-cbqri",
> > > +                     "riscv,cbqri-capacity-controller";
> >=20
> > Is this or is this not a cache controller?
> > The compatible and fact that the property points to an actual cache
> > controller suggests that this is not.
>=20
> Good point. This nodes represents just the QoS interface (CBQRI) and
> should not use that node name. 'qos-controller' seems like it would be
> more appropriate but that has no precedent. What do you think?

Sure.


--/zmDCd3AvwrgXHjE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj6eeAAKCRB4tDGHoIJi
0j45AQDa9hIH0IvDEkhDSJ4irWoqKAUinH30Au/Pl3yikbPiWgD8CfQij41pcGKQ
lnHL1Q1xyI46Q5kOGm2ZVr23WQjr/wo=
=JJMy
-----END PGP SIGNATURE-----

--/zmDCd3AvwrgXHjE--


--===============6490430527523423961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6490430527523423961==--

