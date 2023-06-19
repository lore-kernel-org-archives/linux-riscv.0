Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F012EB64DB
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 16:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIunsEUSX/e4uatHRCgDbCqpWQuzdO9Hx/3BDYgfwUU=; b=HKWYTac5uG3HdMwxujReywCdMw
	V1aWyvXZdd4tdS3ezoY+ffkDWVgO2MZm/RnPmXCT4JRgTkeGK9wZ/JMihw5zdGhCV5XSYewOk9ZE/
	IrbUk7k7LR2R0j9RQh0cXofzQ7rNQHQwKES+1S7rZw8SIzm7uT9vXOOxiH+Cjbst12ORuSMVPNcWu
	eqfG3yOsDnEH797+KZb4km7xv61Xbi5z9tQ69GabdFZe3DxvO+tuF9NKPPwM3fLPoizFLUEv0wNNg
	3LRVGIRcI8ft+ZgrM2da6SufRlwZj/VoUt33Dt9C+cfzzpTc9OTybUANveh7vZpsIIn0+ZT/220AZ
	a6vWWwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBHJC-008sJQ-1s;
	Mon, 19 Jun 2023 16:00:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBHJ8-008sIE-29
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 16:00:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E48860D30;
	Mon, 19 Jun 2023 16:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DA2C433C0;
	Mon, 19 Jun 2023 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687190445;
	bh=kJZPT308Vrj2gkE6ZgK4Ey8lLtn6zFIH9BO4KdzActc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nseK1BSy67wT0SlnfLgZdjPu2VxIjA9m+5MypvV9opu0XmJtUgYBSHR6wrLXgxSQr
	 39oiOevReDR0rT1kAnufzziUkl5L8xvyjFLm/+oH/3PBOat1f3Aivhl9uCp7SMlGjD
	 cjCQWGA8uhusJEljjTyuCvdPnyP3w3Ra7GIXpvt6ASu7+tXEN5MTINnmRrznTMI/vw
	 n+t0pIhrGA9/2fLhAusnrEQcwOWv3zHFIGs6fGML9rnWzlTgBt9J+KnNX38SSmnGOY
	 /SuVz05a0Pn2W7XHKKvK7nus1J6dL/4Q6mX+qfURr49aM6jM/eumCPulkZuWL81YNQ
	 X5BvscryExXRA==
Date: Mon, 19 Jun 2023 17:00:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: riscv: Add early boot document
Message-ID: <20230619-sponge-armful-6beeaf4a8624@spud>
References: <20230619094705.51337-1-alexghiti@rivosinc.com>
 <20230619-kerchief-unmixed-cfdbeb1cf242@wendy>
 <CAHVXubjV=0HNyc0-UMAQRQfi4ZUnwH8dmghV-BGogZsJiumtZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubjV=0HNyc0-UMAQRQfi4ZUnwH8dmghV-BGogZsJiumtZA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_090046_810412_C5AB0295 
X-CRM114-Status: GOOD (  64.40  )
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
Content-Type: multipart/mixed; boundary="===============8032689737828049298=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8032689737828049298==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KUVirl+Z6XpH9upA"
Content-Disposition: inline


--KUVirl+Z6XpH9upA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 04:04:52PM +0200, Alexandre Ghiti wrote:
> On Mon, Jun 19, 2023 at 2:26=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> > On Mon, Jun 19, 2023 at 11:47:04AM +0200, Alexandre Ghiti wrote:

> > > diff --git a/Documentation/riscv/boot.rst b/Documentation/riscv/boot.=
rst
> > > new file mode 100644
> > > index 000000000000..b02230818b79
> > > --- /dev/null
> > > +++ b/Documentation/riscv/boot.rst
> > > @@ -0,0 +1,181 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +Early boot requirements/constraints on RISC-V
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Please use "title case", here and elsewhere in the doc.
>=20
> You mean using "title: " instead of "=3D=3D=3D=3D"? Or using uppercase fo=
r the
> first letter of each word? FYI I followed
> https://docs.kernel.org/doc-guide/sphinx.html?highlight=3Dtitle#specific-=
guidelines-for-the-kernel-documentation

The latter. That's weird, I guess it would be nice to see what Jon
thinks about that.

> > > +Reserved memory for resident firmware
> > > +-------------------------------------
> > > +
> > > +The RISC-V kernel expects the firmware to mark any resident memory w=
ith the
> >
> > Should this be
> > "...resident memory, or memory it has protected with PMPs, with..."
> > ?
>=20
> I used "resident" memory instead of "PMP" memory because it was more
> general. I mean you can have a region that is resident but not
> protected by PMP, and I don't think the kernel should ask for this
> resident memory to be protected with PMP right?

Nah, I was thinking about the opposite. PMP protected regions that do
not have memory-resident programs in them.

> > > +`no-map` flag, thus the kernel won't map those regions in the direct=
 mapping
> >
> > "no-map" is a DT specific term, should this section be moved down under
> > DT, as a sub-section of that?
>=20
> Maybe I can rephrase with something like that:
>=20
> "The RISC-V kernel must not map any resident memory in the direct
> mapping, so the firmware must correctly mark those regions as follows:
> - when using a devicetree, using the `no-map` flag,
> - when booting with UEFI without devicetree, either as
> `EfiRuntimeServicesData/Code` or `EfiReserved`."

I'm not sure you need to have a list to be honest. Could do it in
free-form text if you like. But you've got 3 options there for Efi
stuff, isn't only one of them a valid equivalent for "no-map"?
>=20
> > > +(avoiding issues with hibernation, speculative accesses and probably=
 other
> > > +subsystems).
> >
> > I'm not sure that this () section is beneficial. To be honest, recent
> > issues aside, this section here seems like a statement of the obvious...
>=20
> But I made the mistake, so it was not that straightforward to
> me...I'll remove the ().

I know, hence the "recent issues aside" ;)

> > > +that's not the case.
> > > +
> > > +Device-tree
>=20
> Damn, missed this one, thanks!
>=20
> >
> > s/Device-tree/Devicetree/ and...
> >
> > > +-----------
> > > +
> > > +The RISC-V kernel always expects a device tree, it is:
> >
> > ...s/device tree/devicetree/ to match elsewhere in the kernel docs.
> > Same applies to the other instances of "device tree" in this patch,
> > please.
>=20
> Ok I'll do that (but I'm happy to say that I thought about that and it
> was intentional since "git grep "device tree" | wc -l" returns a
> significant number of instances :)).

Yeah, I had the same thoughts recently too. It's completely mixed
unfortunately, but I suppose I was going off of the headings in the DT
docs that are in rst form. It's not a big deal obviously.

> > > +- either passed directly to the kernel from the previous stage using=
 the `$a1`
> > > +  register,
> > > +- or when booting with UEFI, the device tree will be retrieved by th=
e EFI stub
> > > +  using the EFI configuration table or it will be created.
> >
> > Can I suggest changing this around a little, pulling the "either" &
> > dropping some boilerplate so that it reads (to me!) a little more
> > naturally:
> >         The RISC-V kernel always expects a devicetree, it is either:
> >
> >         - passed directly to the kernel from the previous stage using t=
he `$a1`
> >           register,
> >         - retrieved by the EFI stub when booting with UEFI, using the E=
FI
> >           configuration table or it will be created by ____.
> >
> > Also, please elaborate on what it will be created by.
>=20
> Is it better this way:
>=20
> "The RISC-V kernel always expects a devicetree, it is either:
>=20
> - passed directly to the kernel from the previous stage using the
> `$a1`
>   register,
> - retrieved by the EFI stub if present in the EFI configuration table,
> - created by the EFI stub otherwise."

Nah, I think the 2 bullet structure was better. This 3 bullet mode
implies that if not passed in a1, then the EFI stub will create it.
Which is obviously not true
>=20
> >
> > > +
> > > +Bootflow
> >
> > "Boot Flow", no?
> > I am not sure that this is the "correct" heading for the content it
> > describes, but I have nothing better to offer :/
>=20
> Yes you're right, what about simply "Kernel Entrance"? Not sure this
> is easily understandable though.

"Non-boot Hart Initialisation"?

> > > +--------
> > > +
> > > +There exist 2 methods to enter the kernel:
> > > +
> > > +- `RISCV_BOOT_SPINWAIT`: the firmware releases all harts in the kern=
el, one hart
> > > +  wins a lottery and executes the early boot code while the other ha=
rts are
> > > +  parked waiting for the initialization to finish. This method is now
> >
> > nit: s/now//
>=20
> Ok
>=20
> >
> > What do you mean by deprecated? There's no requirement to implement the
> > HSM extension, right?
>=20
> I would say yes, you have to use a recent version of openSBI that
> supports the HSM extension. @Atish Kumar Patra WDYT?

Uh, you don't need to use OpenSBI in the first place, let alone use a
recent version of it, right? What am I missing?
Also, what about !SMP systems? Although my suggested new section title
kinda addresses that!

> > > +  **deprecated**.
> > > +- Ordered booting: the firmware releases only one hart that will exe=
cute the
> > > +  initialization phase and then will start all other harts using the=
 SBI HSM
> > > +  extension.
> > > +
> > > +UEFI
> > > +----
> > > +
> > > +UEFI memory map
> > > +~~~~~~~~~~~~~~~
> > > +
> > > +When booting with UEFI, the RISC-V kernel will use only the EFI memo=
ry map to
> > > +populate the system memory.
> > > +
> > > +The UEFI firmware must parse the subnodes of the `/reserved-memory` =
device tree
> > > +node and abide by the device tree specification to convert the attri=
butes of
> > > +those subnodes (`no-map` and `reusable`) into their correct EFI equi=
valent
> > > +(refer to section "3.5.4 /reserved-memory and UEFI" of the device tr=
ee
> > > +specification).
> > > +
> > > +RISCV_EFI_BOOT_PROTOCOL
> > > +~~~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +When booting with UEFI, the EFI stub requires the boot hartid in ord=
er to pass
> > > +it to the RISC-V kernel in `$a1`. The EFI stub retrieves the boot ha=
rtid using
> > > +one of the following methods:
> > > +
> > > +- `RISCV_EFI_BOOT_PROTOCOL` (**preferred**).
> > > +- `boot-hartid` device tree subnode (**deprecated**).
> > > +
> > > +Any new firmware must implement `RISCV_EFI_BOOT_PROTOCOL` as the dev=
ice tree
> > > +based approach is deprecated now.
> > > +
> > > +During kernel boot: (Kernel internals)
> >
> > With the other section titles changed, this could be:
> >         Early Boot Requirements and Constraints
> >         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >         The RISC-V kernel's early boot process operates under the
> >         following constraints:
> >
> > Thoughts?
>=20
> I think it's better as you propose, I changed it, thanks.
>=20
> >
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +EFI stub and device tree
> >
> > Same comments about "device tree" here etc.
> >
> > > +------------------------
> > > +
> > > +When booting with UEFI, the device tree is supplemented by the EFI s=
tub with the
> > > +following parameters (largely shared with arm64 in Documentation/arm=
/uefi.rst):
> > > +
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > +Name                        Size     Description
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > +linux,uefi-system-table     64-bit   Physical address of the UEFI Sy=
stem Table.
> >
> > nit: Hmm, I think for all of these sizes s/-bit/ bits/.
>=20
> That's a copy-paste from the link just above the table.
>=20
> But maybe I should have pointed to the doc and added only the
> "bootargs" stuff (maybe that's also present for arm64 actually).

If it is identical, sounds like a good idea. It's common code that does
that stuff, right?

> > > +---------------------
> > > +
> > > +The installation of the virtual mapping is done in 2 steps in the RI=
SC-V kernel:
> > > +
> > > +1. :c:func:`setup_vm` installs a temporary kernel mapping in
> > > +   :c:var:`early_pg_dir` which allows to discover the system memory:=
 only the
> >
> > s/to discover/discovery of/
>=20
> You mean "the discovery of" right?

No? The "the" there would not be required.

> > > +For :c:func:`virt_to_phys` and :c:func:`phys_to_virt` to be able to =
correctly
> > > +convert direct mapping addresses to physical addresses, it needs to =
know the
> >
> > nit: s/it/they/
>=20
> Ok
>=20
> >
> > > +start of the DRAM: this happens after 1, right before 2 installs the=
 direct
> >
> > s/:/./
>=20
> Ahah, you really don't like long sentences :)

I dunno if it is long sentences per se, I just think it is easier to
follow.

> But of course ok :)
>=20
> > Also how about s/1/step 1/ & s/2/step 2/?
>=20
> Way better, thanks

> > > +Pre-MMU execution
> > > +-----------------
> > > +
> > > +Any code that executes before even the first virtual mapping is esta=
blished
> > > +must be very carefully compiled as:
> >
> > Could you point out what the non-obvious examples of this code are?
>=20
> I can do a list, yes

Not even a list, just something like "...established, for example early
alternatives and foo, must be very..."

> Thanks for your thorough review!

NW chief.


--KUVirl+Z6XpH9upA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJB7qQAKCRB4tDGHoIJi
0kh5AP9a5onSIzvXpSfaWt42X3SI75aAwMyi+Ou5n+1LexrvYgEArXf9DzwCZdBs
RMUX9baYBukIlDK5ykZRX5Sgri1KDwA=
=5AIc
-----END PGP SIGNATURE-----

--KUVirl+Z6XpH9upA--


--===============8032689737828049298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8032689737828049298==--

