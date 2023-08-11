Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1088DC001DB
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 09:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgxHTB1yd9Vz+a5vChh5fQQx9uiVMj68pdX2gCiIs9I=; b=w3+/MizCpX74v61UM7iFlgPkpx
	ucmO/biVAzBhzAGm5160uYLCrPA7Kihuf3I16vYtPN+RNexoxnga6bc7V3p2aex7KzS+3DcptD2+j
	GHuwNbCAd3ZLbenhnzqNWpJ7H/i74dnUw9/w/VxbVFhcaycm/R6UnTGn1DutwrGO041xaU/5o0FyS
	QDnQuxQNG+WXnPNWC72fTw+A15T9+AO+eMozAe3ZgG1IuSJOz+JyiUFcxUxsf0/bzHd/vq7g9zxfI
	x2R7+BB168cvStsO0mSpdBRuG46L6zR4r3eQl2f/14iAF7AtG2iBSnWc6l2w5nacpVA4X9SDN2mJC
	ctzYyjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUOmF-00A3Xt-1U;
	Fri, 11 Aug 2023 09:49:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUOmB-00A3VD-1m
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 09:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691747387; x=1723283387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9VhyV6tf6nKG8sQMJiUssXz+BHVJ+A8d6JFwhaqPn7k=;
  b=fNIScv01lYSRW6PnjLGmzhQ9gJGmNSIDNTT+P0XV/DIknrQtS3pFhnKf
   EFBoL5f9cJOZV+FJHEjwFQGIRklEATj/j3YvjMab+X/RrjXuDsWas5Q4Z
   v/ZjuiE8vniUTHnKdpJsxoWulxJ27a+SnkUKz+jwkoi+QZD/Zvu7j3RGd
   5tlp17GhBrG3t2k0ZSTXvrOS2BIYc4196u/37vHTqcslZfxDqSaRLQfCA
   +QNzafTkZ3A38J8jjjSeBNspFpRwWvZPj1cmILlo0y2KCpzXndWOx87UI
   4FJSDITiIESjINXwAGPIkNXyj6b8GZz4vmmJTKr5msqqXT5yNouHwAsGs
   w==;
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="asc'?scan'208";a="229327501"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Aug 2023 02:49:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 11 Aug 2023 02:49:11 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 11 Aug 2023 02:49:08 -0700
Date: Fri, 11 Aug 2023 10:48:31 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Guo Ren <guoren@kernel.org>
CC: Palmer Dabbelt <palmer@rivosinc.com>, <leobras@redhat.com>, Arnd Bergmann
	<arnd@arndb.de>, Will Deacon <will@kernel.org>, <peterz@infradead.org>,
	<boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<parri.andrea@gmail.com>, <andrzej.hajda@intel.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [RFC PATCH v5 5/5] riscv/cmpxchg: Implement xchg for variables
 of size 1 and 2
Message-ID: <20230811-lip-penalty-ded332178318@wendy>
References: <98f523e515b2adc2aa7bb8d133353bad74e30897.camel@redhat.com>
 <mhng-92f37526-d36c-48c0-8fbd-7676df1b6086@palmer-ri-x1c9>
 <CAJF2gTQgv5xsfSfvV7KePAXFnFQOMq4GXOp40kQgM54L6hVD7w@mail.gmail.com>
 <20230811-overlook-displace-330af8289647@wendy>
MIME-Version: 1.0
In-Reply-To: <20230811-overlook-displace-330af8289647@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_024947_755878_06F3DA8C 
X-CRM114-Status: GOOD (  54.13  )
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
Content-Type: multipart/mixed; boundary="===============7188352150626876866=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7188352150626876866==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1G+VqHK18bMDBLDF"
Content-Disposition: inline

--1G+VqHK18bMDBLDF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 07:27:28AM +0100, Conor Dooley wrote:
> On Fri, Aug 11, 2023 at 09:40:30AM +0800, Guo Ren wrote:
> > On Fri, Aug 11, 2023 at 12:23=E2=80=AFAM Palmer Dabbelt <palmer@rivosin=
c.com> wrote:
> > >
> > > On Thu, 10 Aug 2023 09:04:04 PDT (-0700), leobras@redhat.com wrote:
> > > > On Thu, 2023-08-10 at 08:51 +0200, Arnd Bergmann wrote:
> > > >> On Thu, Aug 10, 2023, at 06:03, Leonardo Bras wrote:
> > > >> > xchg for variables of size 1-byte and 2-bytes is not yet availab=
le for
> > > >> > riscv, even though its present in other architectures such as ar=
m64 and
> > > >> > x86. This could lead to not being able to implement some locking=
 mechanisms
> > > >> > or requiring some rework to make it work properly.
> > > >> >
> > > >> > Implement 1-byte and 2-bytes xchg in order to achieve parity wit=
h other
> > > >> > architectures.
> > > >> >
> > > >> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > >>
> > > >
> > > > Hello Arnd Bergmann, thanks for reviewing!
> > > >
> > > >> Parity with other architectures by itself is not a reason to do th=
is,
> > > >> in particular the other architectures you listed have the instruct=
ions
> > > >> in hardware while riscv does not.
> > > >
> > > > Sure, I understand RISC-V don't have native support for xchg on var=
iables of
> > > > size < 4B. My argument is that it's nice to have even an emulated v=
ersion for
> > > > this in case any future mechanism wants to use it.
> > > >
> > > > Not having it may mean we won't be able to enable given mechanism i=
n RISC-V.
> > >
> > > IIUC the ask is to have a user within the kernel for these functions.
> > > That's the general thing to do, and last time this came up there was =
no
> > > in-kernel use of it -- the qspinlock stuff would, but we haven't enab=
led
> > > it yet because we're worried about the performance/fairness stuff that
> > > other ports have seen and nobody's got concrete benchmarks yet (though
> > > there's another patch set out that I haven't had time to look through,
> > > so that may have changed).
> > Conor doesn't agree with using an alternative as a detour mechanism
> > between qspinlock & ticket lock.
>=20
> Hold on a sec, I don't recall having a problem with alternatives - it
> was calling the stronger forward progress guarantee an erratum
> (which it isn't) and an ISA extension w/o any "abusing" that framework
> that I did not like.

Hmm, what I wrote here makes no sense reading it back. Let me try again:

	Hold on a sec, I don't recall having a problem with alternatives - it
	was calling the stronger forward progress guarantee an erratum
	(which it isn't) and "abusing" that framework that I did not like.
	The series effectively mixed and matched whichever part of ISA
	extensions and errata that was convenient.

>=20
> > So I'm preparing V11 with static_key
> > (jump_label) style.
>=20
> I don't think there's much point rushing into making it based on static
> keys when no progress has been made on implementing support for
> non-standard extensions. Changing to a static key doesn't change the
> detection mechanism, I've not got a problem with using alternatives for
> this stuff.
>=20
> Thanks,
> Conor.
>=20
> > Next version, I would separate paravirt_qspinlock
> > & CNA_qspinlock from V10. That would make it easy to review the
> > qspinlock patch series. You can review the next version V11. Now I'm
> > debugging a static_key init problem when load_modules, which is
> > triggered by our combo_qspinlock.
> >=20
> > The qspinlock is being tested on the riscv platform [1] with 128 cores
> > with 8 NUMA nodes, next, I would update the comparison results of
> > qspinlock & ticket lock.
> >=20
> > [1]: https://www.sophon.ai/
> >=20
> > >
> > > So if something uses these I'm happy to go look closer.
> > >
> > > >> Emulating the small xchg() through cmpxchg() is particularly tricky
> > > >> since it's easy to run into a case where this does not guarantee
> > > >> forward progress.
> > > >>
> > > >
> > > > Didn't get this part:
> > > > By "emulating small xchg() through cmpxchg()", did you mean like em=
ulating an
> > > > xchg (usually 1 instruction) with lr & sc (same used in cmpxchg) ?
> > > >
> > > > If so, yeah, it's a fair point: in some extreme case we could have =
multiple
> > > > threads accessing given cacheline and have sc always failing. On th=
e other hand,
> > > > there are 2 arguments on that:
> > > >
> > > > 1 - Other architectures, (such as powerpc, arm and arm64 without LS=
E atomics)
> > > > also seem to rely in this mechanism for every xchg size. Another ar=
chs like csky
> > > > and loongarch use asm that look like mine to handle size < 4B xchg.
> > > >
> > > >
> > > >>  This is also something that almost no architecture
> > > >> specific code relies on (generic qspinlock being a notable excepti=
on).
> > > >>
> > > >
> > > > 2 - As you mentioned, there should be very little code that will ac=
tually make
> > > > use of xchg for vars < 4B, so it should be safe to assume its fine =
to not
> > > > guarantee forward progress for those rare usages (like some of abov=
e mentioned
> > > > archs).
> > > >
> > > >> I would recommend just dropping this patch from the series, at lea=
st
> > > >> until there is a need for it.
> > > >
> > > > While I agree this is a valid point, I believe its more interesting=
 to have it
> > > > implemented if any future mechanism wants to make use of this.
> > > >
> > > >
> > > > Thanks!
> > > > Leo
> >=20
> >=20
> >=20
> > --=20
> > Best Regards
> >  Guo Ren



--1G+VqHK18bMDBLDF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNYD4AAKCRB4tDGHoIJi
0mzjAP9I84a/grioF+CwmaV5BGDLO1LDXujkNHMIBw0Tz7h+oQEA2KgImdGzanYA
k1XgIZMkhGz5oJDQ4HibU9KuHFaRzgI=
=9y9Z
-----END PGP SIGNATURE-----

--1G+VqHK18bMDBLDF--


--===============7188352150626876866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7188352150626876866==--

