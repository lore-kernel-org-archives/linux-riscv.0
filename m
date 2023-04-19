Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7051CC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 16:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MH2hm6eq0zD2cwVzwIs2459JdnG0R7R3Qx55EH2/Hn8=; b=40U8bB23O9czQ7Bjix5MRAutaw
	ZUNHlYsa+X/OPrRaOjW7CoMiCiRgOuoNjxUDBWz3KIXu4/N4jeoOP/+5nBPvt1Dmqy+b0taLbOmhN
	pElsUBPqsIUGWPj56hk7UaYjz+nyZf8V7eaYJIXqUGNvtQ8brrIHFlAYepTsMQFSrSMliD4y8KcCn
	a1gyNmCzfT5EcZfl8QHo4zvcC7V+d2ov7Bq/0smVxJ/iU6S2qo/QA6a0AUsczqTXoco9gUZzXJ7GT
	xI5wNxeajIMgH5l/gnQZE6SWsJ7LV66dwpCwVCyVUi2dC6mwIeJ4KyamYC4pxry+Ll0zaGRzR84Ye
	Z29Ejiug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppAZm-005tL8-2c;
	Wed, 19 Apr 2023 16:22:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppAZj-005tKB-2Z;
	Wed, 19 Apr 2023 16:22:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B980464046;
	Wed, 19 Apr 2023 16:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5EBEC433EF;
	Wed, 19 Apr 2023 16:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681921350;
	bh=Na+Gctu1eRVYnCnlzW6Ba6qpLiZQaWKUzFgPmQN3DHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bxnpwf0RaKg+Apd4eHxU8M/pkkrpbO4643LDVepd73WMPvL0/iSvNIPxlT6TGnv31
	 JBJeV3amJpBcnH6O7ftQgGhk/mmG7tj3tqy7yVadOyAfdMlFyG1xJxGhtr1JhHpmBy
	 hHPCs7i+3raxiTXwzHchxEwO1/uF1Qz0ujI4kSw+g51KEIV5LvDIBYudfRfGttO40M
	 k9nR7g0Ts8HFuVTw7NvPpZrgQWSXLRDLUhJLx5rDasoFCdMXrgBfSfgzf5owFIixOc
	 A9buAAbw9/TS0u4DUmO6QBp/dzdSaTtBmEIRhe1UWDZmXdFHcxa7OFDVnS35TUOb/X
	 TPWeYBKmQPcZQ==
Date: Wed, 19 Apr 2023 17:22:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 02/14] RISC-V: Add SBI STA extension definitions
Message-ID: <20230419-unethical-blissful-f89c948e6cc0@spud>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-3-ajones@ventanamicro.com>
 <20230418-elliptic-headboard-6a18fcccdf07@spud>
 <bl7i54kgkzvxzhritql4vtzpymepx7hmtio7pjnbmipv3dxwgi@dtmqpnkdlwl5>
MIME-Version: 1.0
In-Reply-To: <bl7i54kgkzvxzhritql4vtzpymepx7hmtio7pjnbmipv3dxwgi@dtmqpnkdlwl5>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_092231_910594_C02C8C10 
X-CRM114-Status: GOOD (  25.81  )
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
Content-Type: multipart/mixed; boundary="===============6836403091367499930=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6836403091367499930==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9Js0i994whNMl8Dg"
Content-Disposition: inline


--9Js0i994whNMl8Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 10:15:54AM +0200, Andrew Jones wrote:
> On Tue, Apr 18, 2023 at 07:43:51PM +0100, Conor Dooley wrote:
> > On Mon, Apr 17, 2023 at 12:33:50PM +0200, Andrew Jones wrote:
> > > The SBI STA extension enables steal-time accounting. Add the
> > > definitions it specifies.
> > >=20
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  arch/riscv/include/asm/sbi.h | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sb=
i.h
> > > index 945b7be249c1..485b9ec20399 100644
> > > --- a/arch/riscv/include/asm/sbi.h
> > > +++ b/arch/riscv/include/asm/sbi.h
> > > @@ -30,6 +30,7 @@ enum sbi_ext_id {
> > >  	SBI_EXT_HSM =3D 0x48534D,
> > >  	SBI_EXT_SRST =3D 0x53525354,
> > >  	SBI_EXT_PMU =3D 0x504D55,
> > > +	SBI_EXT_STA =3D 0x535441,
> >=20
> > What is the sort order of this? Matching the spec ordering, or just
> > append-at-the-end?
>=20
> I don't believe there's an established order. I've been going for spec
> order, I think.
>=20
> >=20
> > Unrelated, but in checking that I saw that your SUSP stuff is in
> > master - you planning on resending that series?
>=20
> I think I need to wait until it's been ratified.
>=20
> >=20
> > Anyways, this does match the docs - but I'm quite hesitant to leave an
> > R-b when it's not merged yet.
>=20
> I could take your R-b now, and then if the spec changes, I'd drop it
> when reposting the PoC after reworking it.

Yah, sure.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--9Js0i994whNMl8Dg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEAVQQAKCRB4tDGHoIJi
0nbiAP9sVw3Tt3i4VAABtLlxBxYQt1hZLM/Sg/W1ZY3UlHc6XAEAg4AE6lMc4IUP
kDefpgizU/CT+bf4XbQix+/RdgFOtQM=
=jUWF
-----END PGP SIGNATURE-----

--9Js0i994whNMl8Dg--


--===============6836403091367499930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6836403091367499930==--

