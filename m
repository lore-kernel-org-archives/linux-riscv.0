Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDF6C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 17:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kt1eGlYCWSj22qBWhOFa/4m0+3cCRrdzODC4vUR7fqc=; b=3QhuUfkafMLeO02DYsNkBxnin5
	xU+abDWv3VxKF5lHNU/mY8iZdssm3l4l2NcvMjso1+8ac5mKhV2bASHsSH0Jrk6Xwm6rW/Qr2ZMcI
	mxY9CXvGr3edotIbVW+Cg6TMZFXXJDiB4qCNeHT7+wEORhPPzm+/usY7TRCazrBLwkf0GjpUsP/Jq
	/hrdoPrKlFOshMMHisFMlnK7KBL7EJdkbuM+sUyy6Js4JSym5PXF2xdpBWk1PyFxJ8e5vXh9+LwXO
	VjL4XuBtUQ1QgYsUGkfkfGlJjl802s95Oqp6GwHN+xdeCOpfkNoYlQgPAJCif/56JldJR+BkGUMPm
	BGmc4JEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhYAj-0000000EbE0-0Z1Z;
	Tue, 05 Mar 2024 17:01:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhYAf-0000000EbCZ-1Qsw
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 17:01:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7A105CE1CF5;
	Tue,  5 Mar 2024 17:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F502C433F1;
	Tue,  5 Mar 2024 17:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709658098;
	bh=4qZMQUT97qziMrbEkR0c+mNUfDn+AAkaDuZWbsUSINQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fU42HUNXNJ2YEmsFtU0BPLIyXXoSJjZmBlfqPyEq1dHLm9X3835jn+VMyfHVT+/1y
	 A0ZCzfbXW9Se2xrf/Kn+gVNWPzxaENVbUSrIl2Bz64IKKGOaPa6u7gsTItt5XgOoPa
	 s5nyJ69oQhhZZazxcFpA6TGBUPhoUHusXjf+cD3thL+qWodMJ/YKtkckTvzMxhYarg
	 34zbBKhN1NBLTr0JU0x6hKmr7ktJeSDPSpAc9lZwSJk/UN7WgOxzktJKk1YVM5hJG2
	 GlOZgjF3qnO7l4Y7fgj+mk0hFBhLQrhhbFBQANDh9gaA1zuRbGZ1GhryE0Drl3k+a7
	 RL9pB9EDhaZ7A==
Date: Tue, 5 Mar 2024 17:01:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	dlemoal@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, guoren@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/7] riscv: dts: add initial canmv-k230 and k230-evb
 dts
Message-ID: <20240305-shorten-disallow-eae65fdc8fdb@spud>
References: <mhng-f1aa91d4-211f-4eb4-a94d-a9d88b0d3f6a@palmer-ri-x1c9>
 <7A86D933-B85F-4B29-8D6D-AB414A42AC06@cyyself.name>
 <tencent_B2C1146D4947315C8018AE90EDC64F3E6207@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_B2C1146D4947315C8018AE90EDC64F3E6207@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_090141_775430_53921205 
X-CRM114-Status: GOOD (  25.41  )
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
Content-Type: multipart/mixed; boundary="===============9064057348922380020=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9064057348922380020==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7/iNqzShui/y+tHK"
Content-Disposition: inline


--7/iNqzShui/y+tHK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

Just chiming so that things don't get misinterpreted.

On Wed, Mar 06, 2024 at 12:37:16AM +0800, Yangyu Chen wrote:
> > On Mar 6, 2024, at 00:22, Yangyu Chen <cyy@cyyself.name> wrote:
> >> On Mar 5, 2024, at 23:54, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >> On Mon, 04 Mar 2024 13:06:00 PST (-0800), cyy@cyyself.name wrote:
> >>> - Svpbmt and T-Head MAEE both supported
> >>>=20
> >>> T-Head C908 does support both Svpbmt and T-Head MAEE for page-based m=
emory
> >>> attributes and is controlled by csr.mxstatus. If the kernel wants to =
use
> >>> svpbmt, the m-mode software should set BIT(21) of csr.mxstatus to zero
> >>> before entering the s-mode kernel. Otherwise, the kernel will not boo=
t as 0
> >>> on T-Head MAEE represent to NonCachable Memory and it will lose dirty=
 cache
> >>> lines modification that haven't been written back to the memory.
> >>=20
> >> So I guess we need the bootloader to just be accurate here?  ie: whate=
ver
> >> extension it tells S-mode kernels is enabled is how S-mode behaves, and
> >> then this should just work itself out.

Correct, the bootloader/firmware "just" needs to write this bit to match
what it passes to onwards in the devicetree.

> > Yes. Currently, I have patched OpenSBI to disable MAEE. Conor Dooley sa=
id
> > from a public irc group that he wants to control the enable of T-Head

(#riscv on libera, the usual location)

I also suggested that that, given we can use the standard extensions,
we should use them instead of the custom extensions/errata.

> > variation of zicbom and svpbmt from dts, in addition to mimplid or
> > something now.

Correct. I'm find with the impid =3D=3D archid =3D=3D 0 condition, given th=
at's
what we need to keep to avoid regressions, but if any future T-Head CPUs
want to enable MAEE (ERRATA_THEAD_PBMT) or the custom CMOs
(ERRATA_THEAD_CMO) these should be enabled from DT. Particularly when
these CPUs can be configured to either use the T-Head versions or the
standard extensions.

> > I think that will be a better way for the bootloader to tell
> > the kernel whether the T-Head MAEE should be enabled.

You've got three options I guess. You could patch the DT in the bootloader,
or use a fixed DT that matches the bootloader, or you could use the DT
passed to the bootloader and parse the extensions to decide whether or not
to enable MAEE or Svpbmt. Seems you're going for option 2.

> > Link: https://github.com/cyyself/opensbi/commit/b113c1c01d700314a4a6962=
97ec09031a9399354
> >=20
> > Furthermore, I wonder whether a CPU node like this would be acceptable.
> > I don't have any other details of how another CPU from K230 SoC works on
> > Linux.

A CPU node like what? It is not clear to me.

--7/iNqzShui/y+tHK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZedP7gAKCRB4tDGHoIJi
0vlUAQDOzEPBUwFNFekPyZA1wxs/XJG2IBFzn18OERTkISZkDQEArky2FzLuZ9b1
IyeQgq4Qy6fuiT9qN796R8RzZPoXDwg=
=mHae
-----END PGP SIGNATURE-----

--7/iNqzShui/y+tHK--


--===============9064057348922380020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9064057348922380020==--

