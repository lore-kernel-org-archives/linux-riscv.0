Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE94BC001DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1GOQQZiwDDiFpTrvkBclxqY4I5Z8xjP55lnpzAJU7U=; b=OUpSfaRE4aQQYPuneHU1XrULGP
	dbonnO8L2BXN3oUye4VNnYNLPtnQXtvs3L4BMScM1jTO3ZM28cyv4WlGritJz3Hys6emAU0aJpvBC
	bLx+7/ILiSk5A0pcujjjJzw/GkPvIbuH3k/NGISGD1pZ7OFikivXblGGjERVq015ScwqOXF+VHs9M
	6Xpj0Fx7JyK3tmK39ZeZ+4teJILUZgcyBXKdbxjQZmaKKMBOadIJWPfDnDraYzajfQUgehsp9zxAd
	5nbvp+WFfyB060h7cKtcpxZkvLz0Ea+jcoerAIqFv5gbx5H+9wsTeX//QKtG71r8uZZjl1mHprzVn
	kXm+rHcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOExD-00739C-0j;
	Tue, 25 Jul 2023 10:07:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOExA-00737H-0y;
	Tue, 25 Jul 2023 10:07:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690279660; x=1721815660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1uw5efYhJWeMt9QNbpoLleLIfGC+amYIGyr4fPDWts0=;
  b=hk09ZK8l4mFlLytbf8nyOiQWiwCTboY86lzmkHbI8Lt7jRzDsbkrd80l
   9NHWRVMOlF0KAliv6xbAt+0uR0GzsLG3WJfDGQpxmPRvPpEEx0lqnOrjr
   1LHO0nhCqHfR6BS4sgC8UyWpZsLM7wDlnoetO8nviTBYOMHbVA1T7npcb
   BvHzm7aEmKVImZGR+HHhGHr4D+J6IwYq0SqNOxfyR7sAEZO6LOs0JBpVa
   bK82aiunbD0QyzlMjDpyfWEPcK9BV8podgcPObAF2+lmlVZyYRtJXBgK9
   2VW/y+XparTDwLP7h6cBBQkWWFJlPnw2VyBhHVHlVcXL/a7gF6DgIcsdg
   w==;
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="asc'?scan'208";a="222089118"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Jul 2023 03:07:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 25 Jul 2023 03:07:30 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 25 Jul 2023 03:07:28 -0700
Date: Tue, 25 Jul 2023 11:06:54 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, Mayuresh Chitale
	<mchitale@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel
	<anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Atish Patra
	<atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<kvm-riscv@lists.infradead.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 0/7] Risc-V Kvm Smstateen
Message-ID: <20230725-dwelled-obtain-24bf6a4e6964@wendy>
References: <20230724142033.306538-1-mchitale@ventanamicro.com>
 <20230724-scrap-pranker-7fd120078136@spud>
 <CAK9=C2XXnQWqJgES2iWjatG9SFeFEUXZzLXz1gTYQ0aAh=7KJg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2XXnQWqJgES2iWjatG9SFeFEUXZzLXz1gTYQ0aAh=7KJg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_030740_430375_9DE8FAB0 
X-CRM114-Status: GOOD (  33.32  )
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
Content-Type: multipart/mixed; boundary="===============3015268177433616942=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3015268177433616942==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BR67x+OQMbrXN+rh"
Content-Disposition: inline

--BR67x+OQMbrXN+rh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Anup,

On Tue, Jul 25, 2023 at 09:47:14AM +0530, Anup Patel wrote:
> On Mon, Jul 24, 2023 at 10:08=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> > On Mon, Jul 24, 2023 at 07:50:26PM +0530, Mayuresh Chitale wrote:
> > > This series adds support to detect the Smstateen extension for both, =
the
> > > host and the guest vcpu. It also adds senvcfg and sstateen0 to the ON=
E_REG
> > > interface and the vcpu context save/restore.
> >
> > There's not really an explanation in this series of where Smstateen is
> > needed, or why it is only implemented for KVM. The spec mentions that t=
his
> > also applies to separate user threads, as well as to guests running in a
> > hypervisor. As your first patch will lead to smstateen being set in
> > /proc/cpuinfo, it could reasonably be assumed that the kernel itself
> > supports the extension. Why does only KVM, and not the kernel, require
> > support for smstateen?
>=20
> Here's the motivation behind Smstateen from the spec:
> "The implementation of optional RISC-V extensions has the potential to op=
en
> covert channels between separate user threads, or between separate guest
> OSes running under a hypervisor. The problem occurs when an extension
> adds processor state---usually explicit registers, but possibly other for=
ms of
> state---that the main OS or hypervisor is unaware of (and hence won=E2=80=
=99t
> context-switch) but that can be modified/written by one user thread or
> guest OS and perceived/examined/read by another."

This much I gathered from my (brief) reading of the spec.

> Based on the above, Ssaia extension related CSRs need to be explicitly
> enabled for HS-mode by M-mode (which OpenSBI already does) and
> for VS-mode by HS-mode (which this series adds for KVM RISC-V).

Ah right. Reading back through the patches, in [4/7] I see "Configure
hstateen0 register so that the AIA state and envcfg are accessible to
the vcpus". I would ask that, at least, [1/7] is updated to provide this
motivation & the rationale for why only KVM needs to care. The
motivation for the work should appear in the patchset somewhere, and
probably in the cover too.

> Currently, there are no new extensions addings CSRs for user-space
> so RISC-V kernel does not need to set up sstateenX CSRs for processes
> or tasks but in the future RISC-V kernel might touch sstateenX CSRs.

Right, that is what I figured was going on, ignoring it for now, in the
hopes that we remember to deal with it before some userspace visible
side channel shows up.

Dumb question maybe, but I find this to be quite -ENOPARSE:
> Bit 0 of these registers is not custom state itself; it is a standard fie=
ld of a standard CSR, either mstateen0,
> hstateen0, or sstateen0. The requirements that non-standard extensions mu=
st meet to be conforming are not
> relaxed due solely to changes in the value of this bit. In particular, if=
 software sets this bit but does not execute
> any custom instructions or access any custom state, the software must con=
tinue to execute as specified by all
> relevant RISC-V standards, or the hardware is not standard-conforming.
Does this mean that bit 0 of the CSRs mentioned in the quote controls all
non-standard extensions at the respective privilege level? If so, does
that not make the "ignore that we will now report the presence of this
extension" approach flimsier, since we have little visibility into what
may exist on that front?

Granted, it is not as if delaying this patchset would benefit anyone in
that regard, since those attempting to exploit the side channel know that
the side channel exists, whether the kernel reports having sstateen or
not. This probably just boils down to /proc/cpuinfo being a terrible
interface for detecting extension support in the kernel.
I've got some other comments about it that came up on IRC yesterday, so
I'll go complain about it elsewhere :)

Thanks,
Conor.

--BR67x+OQMbrXN+rh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZL+evgAKCRB4tDGHoIJi
0iLeAP42cokJ0f9kUVftTkbT2M0XaFTi5k/0fY5J428UHxg6xAD+IwTqs0CJSI4k
wb1oVsSPTawNFFR1hxCDmvbOAiBJawc=
=AbPh
-----END PGP SIGNATURE-----

--BR67x+OQMbrXN+rh--


--===============3015268177433616942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3015268177433616942==--

