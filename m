Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F077C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0YafOqZAi9UYLxqnc5tgsWqt9emymVxstS+L3MsVdw=; b=vH0YEH8soM90pVPJXUQpKopQrs
	Bc8a4fdoTr+6DJXEADQ7g89Cw9NJDeB/5Agk/nzpsPv3o9KTFYMM5H8EHAecPSehEX/6pfrPkgin3
	JjFEM3iwgR9/WUiX6KgXQPulQEMlenKd8q7XxAOA7gaS9ouWwRLVvnWolldQ6T1T61AyfZdmCb2df
	G8k7DVFglZBC9f9TdmnXXUueytMY8Y3/es1GZYEy0RJLAFlTPzVrX66/+6+v3EJ0lPe8jeDf4+89E
	cKf5BtTs+9FZoo0k0AvwdS6BWhi6mQGawwN5ueede/AguHzXZdF7C837YOijPd9cqFf+ZFyFGsPsW
	2QPj9Ipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKesw-00000009RXW-1M2A;
	Fri, 21 Jun 2024 14:05:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKesp-00000009RTh-31Ao;
	Fri, 21 Jun 2024 14:04:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 67D2ECE2F02;
	Fri, 21 Jun 2024 14:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62082C2BBFC;
	Fri, 21 Jun 2024 14:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718978692;
	bh=KWONXLjIDswlsmFvy16KVHeYndfVYsx2KlAtEwqZ4dU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oET6lsg4mKcAgsDQrC0hA/Q3BbSXRXajfx26T9gI1bPB+UEUoBLFKq0YJtFNV70ib
	 it2BQbNLzutOEjK5w/r3P5dr9QY+/gTjWGaaXIqAH/c2LpcUadIMkDteFkgUgJT28y
	 ouTaof7EjAYOAzigL2dMMuULJSeqz1nlvxvPcnsjByat4Aj5l8JwqKEj19MV/6kYGp
	 /+k8rqlLbjvtXPNgI1SfldUVWYTvQo58LlkKEhOV5AapBu0FcpZmrcpGLfgFgr7zBp
	 DEHmoG3Fr2iu+l6EJjXKRHZPJ3Gffo2pHdoOKaJi3IcIZnocKH1X/iVdzF3wenjO0Q
	 bRtpPlwegkcdQ==
Date: Fri, 21 Jun 2024 15:04:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	greentime.hu@sifive.com, vincent.chen@sifive.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Message-ID: <20240621-glutton-platonic-2ec41021b81b@spud>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com>
 <20240605-atrium-neuron-c2512b34d3da@spud>
 <CAK9=C2XH7-RdVpojX8GNW-WFTyChW=sTOWs8_kHgsjiFYwzg+g@mail.gmail.com>
 <40a7d568-3855-48fb-a73c-339e1790f12f@ghiti.fr>
 <20240621-viewless-mural-f5992a247992@wendy>
 <edcd3957-0720-4ab4-bdda-58752304a53a@ghiti.fr>
 <20240621-9bf9365533a2f8f97cbf1f5e@orel>
MIME-Version: 1.0
In-Reply-To: <20240621-9bf9365533a2f8f97cbf1f5e@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_070456_294347_4F151D87 
X-CRM114-Status: GOOD (  57.96  )
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
Content-Type: multipart/mixed; boundary="===============7203860696508260902=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7203860696508260902==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qd/Kua9U59FyvKVK"
Content-Disposition: inline


--qd/Kua9U59FyvKVK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 03:15:10PM +0200, Andrew Jones wrote:
> On Fri, Jun 21, 2024 at 02:42:15PM GMT, Alexandre Ghiti wrote:
> >=20
> > On 21/06/2024 12:17, Conor Dooley wrote:
> > > On Fri, Jun 21, 2024 at 10:37:21AM +0200, Alexandre Ghiti wrote:
> > > > On 20/06/2024 08:25, Anup Patel wrote:
> > > > > On Wed, Jun 5, 2024 at 10:25=E2=80=AFPM Conor Dooley <conor@kerne=
l.org> wrote:
> > > > > > On Wed, Jun 05, 2024 at 08:15:08PM +0800, Yong-Xuan Wang wrote:
> > > > > > > Add entries for the Svade and Svadu extensions to the riscv,i=
sa-extensions
> > > > > > > property.
> > > > > > >=20
> > > > > > > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > > > > > > ---
> > > > > > >    .../devicetree/bindings/riscv/extensions.yaml | 30 +++++++=
++++++++++++
> > > > > > >    1 file changed, 30 insertions(+)
> > > > > > >=20
> > > > > > > diff --git a/Documentation/devicetree/bindings/riscv/extensio=
ns.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > > > index 468c646247aa..1e30988826b9 100644
> > > > > > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > > > @@ -153,6 +153,36 @@ properties:
> > > > > > >                ratified at commit 3f9ed34 ("Add ability to ma=
nually trigger
> > > > > > >                workflow. (#2)") of riscv-time-compare.
> > > > > > >=20
> > > > > > > +        - const: svade
> > > > > > > +          description: |
> > > > > > > +            The standard Svade supervisor-level extension fo=
r raising page-fault
> > > > > > > +            exceptions when PTE A/D bits need be set as rati=
fied in the 20240213
> > > > > > > +            version of the privileged ISA specification.
> > > > > > > +
> > > > > > > +            Both Svade and Svadu extensions control the hard=
ware behavior when
> > > > > > > +            the PTE A/D bits need to be set. The default beh=
avior for the four
> > > > > > > +            possible combinations of these extensions in the=
 device tree are:
> > > > > > > +            1. Neither svade nor svadu in DT: default to sva=
de.
> > > > > > I think this needs to be expanded on, as to why nothing means s=
vade.
> > > > > Actually if both Svade and Svadu are not present in DT then
> > > > > it is left to the platform and OpenSBI does nothing.
> > > > >=20
> > > > > > > +            2. Only svade in DT: use svade.
> > > > > > That's a statement of the obvious, right?
> > > > > >=20
> > > > > > > +            3. Only svadu in DT: use svadu.
> > > > > > This is not relevant for Svade.
> > > > > >=20
> > > > > > > +            4. Both svade and svadu in DT: default to svade =
(Linux can switch to
> > > > > > > +               svadu once the SBI FWFT extension is availabl=
e).
> > > > > > "The privilege level to which this devicetree has been provided=
 can switch to
> > > > > > Svadu if the SBI FWFT extension is available".
> > > > > >=20
> > > > > > > +        - const: svadu
> > > > > > > +          description: |
> > > > > > > +            The standard Svadu supervisor-level extension fo=
r hardware updating
> > > > > > > +            of PTE A/D bits as ratified at commit c1abccf ("=
Merge pull request
> > > > > > > +            #25 from ved-rivos/ratified") of riscv-svadu.
> > > > > > > +
> > > > > > > +            Both Svade and Svadu extensions control the hard=
ware behavior when
> > > > > > > +            the PTE A/D bits need to be set. The default beh=
avior for the four
> > > > > > > +            possible combinations of these extensions in the=
 device tree are:
> > > > > > @Anup/Drew/Alex, are we missing some wording in here about it o=
nly being
> > > > > > valid to have Svadu in isolation if the provider of the devicet=
ree has
> > > > > > actually turned on Svadu? The binding says "the default behavio=
ur", but
> > > > > > it is not the "default" behaviour, the behaviour is a must AFAI=
CT. If
> > > > > > you set Svadu in isolation, you /must/ have turned it on. If yo=
u set
> > > > > > Svadu and Svade, you must have Svadu turned off?
> > > > > Yes, the wording should be more of requirement style using
> > > > > must or may.
> > > > >=20
> > > > > How about this ?
> > > > > 1) Both Svade and Svadu not present in DT =3D> Supervisor may
> > > > >       assume Svade to be present and enabled or it can discover
> > > > >       based on mvendorid, marchid, and mimpid.
> > > > > 2) Only Svade present in DT =3D> Supervisor must assume Svade
> > > > >       to be always enabled. (Obvious)
> > > > > 3) Only Svadu present in DT =3D> Supervisor must assume Svadu
> > > > >       to be always enabled. (Obvious)
> > > >=20
> > > > I agree with all of that, but the problem is how can we guarantee t=
hat
> > > > openSBI actually enabled svadu?
> > > Conflation of an SBI implementation and OpenSBI aside, if the devicet=
ree
> > > property is defined to mean that "the supervisor must assume svadu to=
 be
> > > always enabled", then either it is, or the firmware's description of =
the
> > > hardware is broken and it's not the supervisor's problem any more. It=
's
> > > not the kernel's job to validate that the devicetree matches the
> > > hardware.
> > >=20
> > > > This is not the case for now.
> > > What "is not the case for now"? My understanding was that, at the
> > > moment, nothing happens with Svadu in OpenSBI. In turn, this means th=
at
> > > there should be no devicetrees containing Svadu (per this binding's
> > > description) and therefore no problem?
> >=20
> >=20
> > What prevents a dtb to be passed with svadu to an old version of opensbi
> > which does not support the enablement of svadu? The svadu extension wil=
l end
> > up being present in the kernel but not enabled right?

If you'll allow me use of my high horse, relying on undocumented
(or deprecated I suppose in this case) devicetree properties is always
going to leave people exposed to issues like this. If the property isn't
documented, then you shouldn't be passing it to the kernel.

> I understand the concern; old SBI implementations will leave svadu in the
> DT but not actually enable it. Then, since svade may not be in the DT if
> the platform doesn't support it or it was left out on purpose, Linux will
> only see svadu and get unexpected exceptions. This is something we could
> force easily with QEMU and an SBI implementation which doesn't do anything
> for svadu. I hope vendors of real platforms, which typically provide their
> own firmware and DTs, would get this right, though, especially since Linux
> should fail fast in their testing when they get it wrong.

I'll admit, I wasn't really thinking here about something like QEMU that
puts extensions into the dtb before their exact meanings are decided
upon. I almost only ever think about "real" systems, and in those cases
I would expect that if you can update the representation of the hardware
provided to (or by the firmware to Linux) with new properties, then updating
the firmware itself should be possible.

Does QEMU have the this exact problem at the moment? I know it puts
Svadu in the max cpu, but does it enable the behaviour by default, even
without the SBI implementation asking for it?

Sorta on a related note, I'm completely going head-in-sand here for ACPI,
cos I have no idea how that is being dealt with - other than that Linux
assumes that all ACPI properties have the same meaning as the DT ones. I
don't really think that that is sustainable, but it is what we are doing
at present. Maybe I should put that in boot.rst or in acpi.rst?

Also on the ACPI side of things, and I am going an uber devil's advocate
here, the version of the spec that we documented as defining our parsing
rules never mentions svade or svadu, so is it even valid to use them on
ACPI systems?




--qd/Kua9U59FyvKVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnWIfwAKCRB4tDGHoIJi
0q/dAP4kNGqCQqfmua36oZyQabQDESU4lnBPcaNqz4EP05qYHwEAv0/Przk2eqiW
eKknt2R9xQc1PxpjjybKTm7K30FMVAU=
=WPCG
-----END PGP SIGNATURE-----

--qd/Kua9U59FyvKVK--


--===============7203860696508260902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7203860696508260902==--

