Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A47C001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 09:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5bwGmE1jSQBw/vee8GzhN9RfwneQu+a5TjO3gd0y5o=; b=vPe0rD08pYW/qZWJYXvDJ5apHb
	NY6DSCr8bqnrQGfazVgAb8lbFBpdrdpOVi9UX3up5vBz/2vguwEBUkt+0mk3xaFcFYZlCHZSMH1/M
	wCa3KVG7Swv6EczLo0rm/Ad5XK9KxAf6KDByrUHtITnHApZwQS8SA514VuIzd5q3uXnyiOSKNq86w
	fc9mK1F7VbqQZ9K+AC+5l7t5egnHfN43Iv50IbStG4T2Yq6AbhSlrt4MQci1fYAVTFoB1XbQS2rjB
	AsH3yUu2vm9X4YBsGs083FZRP/dexYUcWe/WwoC8GiEUGLSnOO/Zx5lxoQmuk1xlRxuz3vCiDhj6T
	evDmIPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU257-006zUC-2R;
	Thu, 10 Aug 2023 09:35:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU254-006zTR-0t
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 09:35:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691660146; x=1723196146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7bSIBluZHrn6nW0cWOntEcmcZvIYoENm563ppWQ7iv0=;
  b=hC4PlXRCEOjFGsct4ZQWFUan2yNO3zmVniGbDHiL9xZiBT/U29mdBANI
   D+teuJB8/LXwFIyxRpyHwYnRs2lgymRO1zHNPore/mo6taT/WMEOnvEOn
   wxJLAOLNPBBEDwtaPbml3fps/ZqjhLeMO1G1xDXD6KXR+gUgZ9QhLC/8P
   T1Cv05HYvDB575YDmKZRIb4ySgJ3b+oAgjNm2XAv+S3l2pydv8SmlCp8u
   W5w9c3caPwO2VI4CvwT/Op+sKSecYN96miLVtSLlidOCXwnlq3yIdSVWf
   7SpLLN7iOGaC7hMIWAQsRI3zZfouIFDzFRfp/LEICrrZ1g8nKtgM1gLkf
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="asc'?scan'208";a="229138945"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2023 02:35:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 10 Aug 2023 02:35:12 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 10 Aug 2023 02:35:10 -0700
Date: Thu, 10 Aug 2023 10:34:33 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <apatel@ventanamicro.com>
Subject: Re: [PATCH 2/6] RISC-V: Enable cbo.zero in usermode
Message-ID: <20230810-caution-rise-a12e7210c670@wendy>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
 <20230809115516.214537-10-ajones@ventanamicro.com>
 <CALs-HssK7ys8kjZPuodoz9qEe_hReyihfbBdQsp1exLH3vxkSQ@mail.gmail.com>
 <20230809-7aa41e2dd2fd2909f1266a20@orel>
 <20230809-disrupt-jersey-f2545c5903fe@spud>
 <20230810-30583d716fb7652e22c868ee@orel>
MIME-Version: 1.0
In-Reply-To: <20230810-30583d716fb7652e22c868ee@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_023546_425561_BBF57744 
X-CRM114-Status: GOOD (  48.06  )
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
Content-Type: multipart/mixed; boundary="===============2739355733656959331=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2739355733656959331==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wY2MGtIKC7JkVaqx"
Content-Disposition: inline

--wY2MGtIKC7JkVaqx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 09:31:54AM +0200, Andrew Jones wrote:
> On Wed, Aug 09, 2023 at 07:12:58PM +0100, Conor Dooley wrote:
> > On Wed, Aug 09, 2023 at 06:58:15PM +0200, Andrew Jones wrote:
> > > On Wed, Aug 09, 2023 at 09:00:35AM -0700, Evan Green wrote:
> > > > On Wed, Aug 9, 2023 at 4:55=E2=80=AFAM Andrew Jones <ajones@ventana=
micro.com> wrote:
> > > ...
> > > > > +static __always_inline bool riscv_this_cpu_has_extension_likely(=
const unsigned long ext)
> > > > > +{
> > > > > +       if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_ext=
ension_likely(ext))
> > > > > +               return true;
> > > > > +
> > > > > +       return __riscv_isa_extension_available(hart_isa[smp_proce=
ssor_id()].isa, ext);
> > > > > +}
> > > > > +
> > > > > +static __always_inline bool riscv_this_cpu_has_extension_unlikel=
y(const unsigned long ext)
> > > > > +{
> > > > > +       if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_ext=
ension_unlikely(ext))
> > > > > +               return true;
> > > > > +
> > > > > +       return __riscv_isa_extension_available(hart_isa[smp_proce=
ssor_id()].isa, ext);
> > > > > +}
> > > >=20
> > > > Another way to do this would be to add a parameter to
> > > > riscv_has_extension_*() (as there are very few users), then these n=
ew
> > > > functions can turn around and call those with the new parameter set=
 to
> > > > hart_isa[smp_processor_id()].isa. It's a tossup, so up to you. The
> > > > only advantage to it I can argue is it keeps the code flows more
> > > > unified.
> > > >
> > >=20
> > > I like unification, but I think I'd prefer we create wrappers and
> > > try to avoid callers needing to construct hart_isa[].isa parameters
> > > themselves. I'm also not a big fan of the NULL parameter needed when
> > > riscv_isa_extension_available() is invoked for the riscv_isa bitmap.
> > > So we need:
> > >=20
> > >   1. check if an extension is in riscv_isa
> > >   2. check if an extension is in a bitmap provided by the caller
> > >   3. check if an extension is in this cpu's isa bitmap
> > >   4. check if an extension is in the isa bitmap of a cpu provided by =
the
> > >      caller
> > >=20
> > > The only one we can optimize with alternatives is (1), so it definite=
ly
> > > gets wrappers (riscv_has_extension_likely/unlikely()). (3) and (4) can
> > > also get wrappers which first try the optimized (1), like I have abov=
e.
> > > Actually (3)'s wrapper could be based on (4)'s, or only provide wrapp=
ers
> > > for (4)
> > >=20
> > >  static __always_inline bool riscv_cpu_has_extension_likely(int cpu, =
const unsigned long ext)
> > >  {
> > >      if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_=
likely(ext))
> > >          return true;
> > >=20
> > >      return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> > >  }
> > >=20
> > >  static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu=
, const unsigned long ext)
> > >  {
> > >      if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_=
unlikely(ext))
> >=20
> > Why are you gating on CONFIG_RISCV_ALTERNATIVE here?
>=20
> This ensures we remove the riscv_has_extension_[un]likely() call
> when that call would end up using its
> __riscv_isa_extension_available(NULL, ext) fallback. If that fallback
> where to return false, then we'd still need to make the
> __riscv_isa_extension_available(hart_isa[cpu].isa, ext) call, doubling
> the cost. Whereas, when we gate on CONFIG_RISCV_ALTERNATIVE, we know that
> riscv_has_extension_[un]likely() will use an alternative to check the
> global set of extensions. When the extension is there, the compiler
> ensures that everything vanishes. When it's not, we'll fallback to a
> single search of the cpu's isa bitmap.

Right, that is what I suspected that you were trying to accomplish here.
I was not just not entirely sure whether it was or you'd just missed the
fallback path. In my original mail I was just going to say "Please add a
comment here as to why you want to avoid the fallback", but figured I
should figure out your intent first!

Just to note, alternatives are available on all !XIP kernels now, so
it's only in the case that the fallback path will be activated.

> > >          return true;
> > >=20
> > >      return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
> > >  }
> > >=20
> > > and then use smp_processor_id() directly in the callers that need
> > > to check this_cpu's extensions.
> > >=20
> > > For case (2), I'd advocate we rename __riscv_isa_extension_available(=
) to
> > > riscv_has_extension() and drop the riscv_isa_extension_available() ma=
cro
> > > in order to avoid having some calls with RISCV_ISA_EXT_* spelled out =
and
> > > others that rely on the pasting.
> >=20
> > > And, ideally, we'd convert most
> > > riscv_has_extension(NULL, ext) calls to riscv_has_extension_[un]likel=
y().
> >=20
> > > I'm also not a big fan of the NULL parameter needed when
> > > riscv_isa_extension_available() is invoked for the riscv_isa bitmap
> >=20
> > Rather than actually act on my concerns about
> > __riscv_isa_extension_available(), I've been busy devoting my spare
> > time to playing MMOs with the excuse of not wanting to fiddle further
> > with cpufeature.c et al until Palmer merged the new DT property stuff,
> > but splitting out your case 1 above seems like it would really help
> > there. The NULL argument case is the one I think has the potential to
> > be a footgun in the face of config options.
> > Split out we can document that purpose of each function & hopefully
> > have one set of functions that deals with "this extension was detected
> > to be present in the hardware" and one that does "this extension was
> > detected & supported by this particular kernel".
>=20
> Sounds good to me!

I figure said change should be independent of what's going on in this
series?

--wY2MGtIKC7JkVaqx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNSvKQAKCRB4tDGHoIJi
0gF0AQCw9TjN5k9qJbPZyuUUuWTxymsyk/aMnkh6xnW/qtsvEAD+NAJB/eX7lF7Q
N3o7P6tQyz4sYKGP38Wdc6j7Mu1P8wA=
=6K5M
-----END PGP SIGNATURE-----

--wY2MGtIKC7JkVaqx--


--===============2739355733656959331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2739355733656959331==--

