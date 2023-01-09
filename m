Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4E7C54EBE
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 10:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjE1dIdVC9migneStFNrROTjcoB7zu5/fsQCB4LdO28=; b=peQNhR47hYeQQnX5r67FTP2/2m
	QVqcd0JwixzgQyht1heFVmW+rI6pldA5BXNYywZJNo3qUah89sOrk+l2kd+6SZJxUAsvfph4rTsv7
	yJ6WElAJCiW6XzhNJieDrYhRNQFwSV2x12uCYxjIjSY1gVRWUEOrs1aIRHDZfp0xARQ6Mz0KKx92c
	GgBg/q1pZrlpDGA43CeojtKAzGjiiVimzgEFNVM8NtSQIri7xOs8LNhImWqbItMxYr90rbpNxpTYa
	W2hyZERueky0NSeNgmxeNaESr2ApDm/roxQz2rcliur/urTpXpa1PviDzvLBnAfgSS60hjiMzcP/X
	94wbkr0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEpKi-000oHo-MI; Mon, 09 Jan 2023 10:24:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEpKc-000oFG-HI; Mon, 09 Jan 2023 10:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673259882; x=1704795882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t7piUvgFVAZlRcs6FJ2kBJ8E4oIW/FTU20o4L5Xp3uU=;
  b=cnTqpZmr9i+KYLo42B+kEJX7Hb2dHKOHZ+jkGAZmGgDJCegAdTPt97RS
   O4stCOzaZSRH4ctOayWCVQLp+IkpAM5MFWTOySAUBjWJWaGMjEZ4K3zFD
   L/ZarVjH/b/FfgkC1YWPbCNUIpkc+ISizTCzd2Zd1fPCiYOBuAd03eBBQ
   bKZYD9FShBwTNbx9jf438W40yfpPrF4P2ugRLMqdTC1yI+sudB/BL74s5
   0ASYMucIvRbBLnA8yHCVQ8nJCm5m+w0S1+UOuBBFoHiyTV2aXOUSg/PG5
   A2iQ2VUEi0iX8ELWMF34xA8G99cvcH7pqh3Kqp+VYYFeK7n7otfxL0W1n
   w==;
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="asc'?scan'208";a="195843441"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jan 2023 03:24:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 03:24:35 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 9 Jan 2023 03:24:32 -0700
Date: Mon, 9 Jan 2023 10:24:11 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<atishp@rivosinc.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<apatel@ventanamicro.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<opensbi@lists.infradead.org>, <samuel@sholland.org>
Subject: Re: [PATCH v4] dt-bindings: riscv: add SBI PMU event mappings
Message-ID: <Y7vrS4S1NIyV3fJI@wendy>
References: <20230108215047.3165032-1-conor@kernel.org>
 <20230109092715.bwomqoeosif43lr2@orel>
 <Y7vpxW1AeEOhcxUf@wendy>
MIME-Version: 1.0
In-Reply-To: <Y7vpxW1AeEOhcxUf@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_022442_610800_7CF1C132 
X-CRM114-Status: GOOD (  54.33  )
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
Content-Type: multipart/mixed; boundary="===============8595366540178540198=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8595366540178540198==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n57OAywK18Rpbp8P"
Content-Disposition: inline

--n57OAywK18Rpbp8P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2023 at 10:17:41AM +0000, Conor Dooley wrote:
> On Mon, Jan 09, 2023 at 10:27:15AM +0100, Andrew Jones wrote:
> > On Sun, Jan 08, 2023 at 09:50:48PM +0000, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >=20
> > > The SBI PMU extension requires a firmware to be aware of the event to
> > > counter/mhpmevent mappings supported by the hardware. OpenSBI may use
> > > DeviceTree to describe the PMU mappings. This binding is currently
> > > described in markdown in OpenSBI (since v1.0 in Dec 2021) & used by Q=
EMU
> > > since v7.2.0.
> > >=20
> > > Import the binding for use while validating dtb dumps from QEMU and
> > > upcoming hardware (eg JH7110 SoC) that will make use of the event
> > > mapping.
> > >=20
> > > Link: https://github.com/riscv-software-src/opensbi/blob/master/docs/=
pmu_support.md
> > > Link: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/risc=
v-sbi.adoc # Performance Monitoring Unit Extension
> > > Co-developed-by: Atish Patra <atishp@rivosinc.com>
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > Changes in v4:
> > > - A bunch of minor description/comment changes suggested by Drew
> > >=20
> > > Changes in v3:
> > > - align descriptions to SBI spec (and fix a misinterpretation of mine)
> > > - switch to a nested items description, since the descriptions are for
> > >   the elements of each entry, not the entries themselves
> > >=20
> > > Changes in v2:
> > > - use the schema mechanism for dependancies between properties
> > > - +CC perf maintainers...
> > > - move the matrix element descriptions into regular item descriptions
> > >   rather than doing so freeform in the property description
> > > - drop some description text that no longer applies since changes were
> > >   made to the SBI spec
> > > - drop mention of the "generic platform" which is OpenSBI specific
> > > - drop the min/max items from the matrices, they don't appear to be
> > >   needed?
> > >=20
> > > Note:
> > > OpenSBI is BSD-2-Clause licensed so I am unsure as to whether I can
> > > submit it with a dual license.
> > > ---
> > >  .../devicetree/bindings/perf/riscv,pmu.yaml   | 160 ++++++++++++++++=
++
> > >  1 file changed, 160 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/perf/riscv,pmu.=
yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml b/=
Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> > > new file mode 100644
> > > index 000000000000..5e7a54e3d91b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> > > @@ -0,0 +1,160 @@
> > > +# SPDX-License-Identifier: BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/perf/riscv,pmu.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: RISC-V SBI PMU events
> > > +
> > > +maintainers:
> > > +  - Atish Patra <atishp@rivosinc.com>
> > > +
> > > +description: |
> > > +  The SBI PMU extension allows supervisor software to configure, sta=
rt and
> > > +  stop any performance counter at anytime. Thus, a user can leverage=
 all
> > > +  capabilities of performance analysis tools, such as perf, if the S=
BI PMU
> > > +  extension is enabled. The following constraints apply:
> > > +
> > > +    The platform must provide information about PMU event to counter=
 mappings
> > > +    via device tree or platform specific hooks. Otherwise, the SBI P=
MU
> > > +    extension will not be enabled.
> > > +
> > > +    Platforms should provide information about the PMU event selecto=
r values
> > > +    that should be encoded in the expected value of MHPMEVENTx while=
 configuring
> > > +    MHPMCOUNTERx for that specific event. This can be done via a dev=
ice tree or
> > > +    platform specific hooks. The exact value to be written to MHPMEV=
ENTx is
> > > +    completely dependent on the platform.
> >=20
> > The previous two paragraphs reference 'platform specific hooks'. I don't
> > think this DT-specific description, as opposed to the more general Open=
SBI
> > description it's derived from, should reference the hooks, as "hooks"
> > aren't defined in this context.
>=20
> Do you have any suggestion about how it should be worded? It is
> apparently valid to have only a compatible string in the dt-binding and

Meh, DT itself not dt-binding. The binding only "enforces"/documents that
lax requirement.

> rely on using platform hooks to communicate the mapping. In that case,
> the dt-binding only communicates the presence of SBI PMU support.
> IMO, if we don't mention that that is a valid way, the fact that we only
> require a compatible for a DT to be valid looks like a mistake in the
> binding.
>=20
> Thanks,
> Conor.
>=20
> > > +    For information on the SBI specification see the section "Perfor=
mance
> > > +    Monitoring Unit Extension" of:
> > > +      https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/ris=
cv-sbi.adoc
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: riscv,pmu
> > > +
> > > +  riscv,event-to-mhpmevent:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > +    description:
> > > +      Represents an ONE-to-ONE mapping between a PMU event and the e=
vent
> > > +      selector value that the platform expects to be written to the =
MHPMEVENTx
> > > +      CSR for that event.
> > > +      The mapping is encoded in an matrix format where each element =
represents
> > > +      an event.
> > > +      This property shouldn't encode any raw hardware event.
> > > +    items:
> > > +      items:
> > > +        - description: event_idx, a 20-bit wide encoding of the even=
t type and
> > > +            code. Refer to the SBI specification for a complete desc=
ription of
> > > +            the event types and codes.
> > > +        - description: upper 32 bits of the event selector value for=
 MHPMEVENTx
> > > +        - description: lower 32 bits of the event selector value for=
 MHPMEVENTx
> > > +
> > > +  riscv,event-to-mhpmcounters:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > +    description:
> > > +      Represents a MANY-to-MANY mapping between a range of events an=
d all the
> > > +      MHPMCOUNTERx in a bitmap format that can be used to monitor th=
ese range
> > > +      of events. The information is encoded in an matrix format wher=
e each
> > > +      element represents a certain range of events and corresponding=
 counters.
> > > +      This property shouldn't encode any raw event.
> > > +    items:
> > > +      items:
> > > +        - description: first event_idx of the range of events
> > > +        - description: last event_idx of the range of events
> > > +        - description: bitmap of MHPMCOUNTERx for this event
> > > +
> > > +  riscv,raw-event-to-mhpmcounters:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > +    description:
> > > +      Represents an ONE-to-MANY or MANY-to-MANY mapping between the =
rawevent(s)
> > > +      and all the MHPMCOUNTERx in a bitmap format that can be used t=
o monitor
> > > +      that raw event.
> > > +      The encoding of the raw events are platform specific. The info=
rmation is
> > > +      encoded in a matrix format where each element represents the s=
pecific raw
> > > +      event(s).
> > > +      If a platform directly encodes each raw PMU event as a unique =
ID, the
> > > +      value of variant must be 0xffffffff_ffffffff.
> > > +    items:
> > > +      items:
> > > +        - description:
> > > +            upper 32 invariant bits for the range of events
> > > +        - description:
> > > +            lower 32 invariant bits for the range of events
> > > +        - description:
> > > +            upper 32 bits of the variant bit mask for the range of e=
vents
> > > +        - description:
> > > +            lower 32 bits of the variant bit mask for the range of e=
vents
> > > +        - description:
> > > +            bitmap of all MHPMCOUNTERx that can monitor the range of=
 events
> > > +
> > > +dependencies:
> > > +  "riscv,event-to-mhpmevent": [ "riscv,event-to-mhpmcounters" ]
> > > +  "riscv,event-to-mhpmcounters": [ "riscv,event-to-mhpmevent" ]
> > > +
> > > +required:
> > > +  - compatible
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    pmu {
> > > +        compatible =3D "riscv,pmu";
> > > +        riscv,event-to-mhpmevent =3D <0x0000B 0x0000 0x0001>;
> > > +        riscv,event-to-mhpmcounters =3D <0x00001 0x00001 0x00000001>,
> > > +                                      <0x00002 0x00002 0x00000004>,
> > > +                                      <0x00003 0x0000A 0x00000ff8>,
> > > +                                      <0x10000 0x10033 0x000ff000>;
> > > +        riscv,raw-event-to-mhpmcounters =3D
> > > +            /* For event ID 0x0002 */
> > > +            <0x0000 0x0002 0xffffffff 0xffffffff 0x00000f8>,
> > > +            /* For event ID 0-4 */
> > > +            <0x0 0x0 0xffffffff 0xfffffff0 0x00000ff0>,
> > > +            /* For event ID 0xffffffff0000000f - 0xffffffff000000ff =
*/
> > > +            <0xffffffff 0x0 0xffffffff 0xffffff0f 0x00000ff0>;
> > > +    };
> > > +
> > > +  - |
> > > +    /*
> > > +     * For HiFive Unmatched board the encodings can be found here
> > > +     * https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-=
86ed8b16acba_fu740-c000-manual-v1p6.pdf
> > > +     *
> > > +     * This example also binds standard SBI PMU hardware IDs to U74 =
PMU event
> > > +     * codes, U74 uses a bitfield for events encoding, so several U7=
4 events
> > > +     * can be bound to a single perf ID.
> > > +     * See SBI PMU hardware IDs in arch/riscv/include/asm/sbi.h
> > > +     */
> > > +    pmu {
> > > +          compatible =3D "riscv,pmu";
> > > +          riscv,event-to-mhpmevent =3D
> > > +              /* SBI_PMU_HW_CACHE_REFERENCES -> Instruction or Data =
cache/ITIM busy */
> > > +              <0x00003 0x00000000 0x1801>,
> > > +              /* SBI_PMU_HW_CACHE_MISSES -> Instruction or Data cach=
e miss or MMIO access */
> > > +              <0x00004 0x00000000 0x0302>,
> > > +              /* SBI_PMU_HW_BRANCH_INSTRUCTIONS -> Conditional branc=
h retired */
> > > +              <0x00005 0x00000000 0x4000>,
> > > +              /* SBI_PMU_HW_BRANCH_MISSES -> Branch or jump mispredi=
ction */
> > > +              <0x00006 0x00000000 0x6001>,
> > > +              /* L1D_READ_MISS -> Data cache miss or MMIO access */
> > > +              <0x10001 0x00000000 0x0202>,
> > > +              /* L1D_WRITE_ACCESS -> Data cache write-back */
> > > +              <0x10002 0x00000000 0x0402>,
> > > +              /* L1I_READ_ACCESS -> Instruction cache miss */
> > > +              <0x10009 0x00000000 0x0102>,
> > > +              /* LL_READ_MISS -> UTLB miss */
> > > +              <0x10011 0x00000000 0x2002>,
> > > +              /* DTLB_READ_MISS -> Data TLB miss */
> > > +              <0x10019 0x00000000 0x1002>,
> > > +              /* ITLB_READ_MISS-> Instruction TLB miss */
> > > +              <0x10021 0x00000000 0x0802>;
> > > +          riscv,event-to-mhpmcounters =3D <0x00003 0x00006 0x18>,
> > > +                                        <0x10001 0x10002 0x18>,
> > > +                                        <0x10009 0x10009 0x18>,
> > > +                                        <0x10011 0x10011 0x18>,
> > > +                                        <0x10019 0x10019 0x18>,
> > > +                                        <0x10021 0x10021 0x18>;
> > > +          riscv,raw-event-to-mhpmcounters =3D <0x0 0x0 0xffffffff 0x=
fc0000ff 0x18>,
> > > +                                            <0x0 0x1 0xffffffff 0xff=
f800ff 0x18>,
> > > +                                            <0x0 0x2 0xffffffff 0xff=
ffe0ff 0x18>;
> > > +    };
> > > --=20
> > > 2.39.0
> > >
> >=20
> > Besides the comment above,
> >=20
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >=20
> > Thanks,
> > drew
> >=20
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv



> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


--n57OAywK18Rpbp8P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7vrSwAKCRB4tDGHoIJi
0rtIAP9OgKUHF/vkmIB1SlBWT8I2YiA2ddYqU9E4/orbDdQI2QEA34zdhsFAMbVb
b7aa3akI4C7o9GiOK+02qfeNYR1ZoAg=
=LTBo
-----END PGP SIGNATURE-----

--n57OAywK18Rpbp8P--


--===============8595366540178540198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8595366540178540198==--

