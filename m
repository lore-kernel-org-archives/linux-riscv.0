Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE26FC77B61
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 15:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cruib1vWm+NRwNANfCOpvQP0PQTju7X/uIjuYISbvKc=; b=RONP1+LSd3kUxnOneE9SMVCBHt
	mHUxLCrt1jmp8cxbfWIyAs6hR8WFYvm2EBFV/YLgyesRdL6G3DWizw3eGVn5HOfTPj/1zw6tfmwJ+
	Qa4olIDPbmF1uC2G3bMOS9yniq+DeUCc1XzErfOdoybphemDwohKjvxeTnFdxaptJxt5STYY60KfE
	pVtLysabYg/WQdSjVEYyd0Ydg3Z7BJuifHVMpXmUF+k1ogRlgaDY9JlQHgyfCxT4jaIAXRa2Mwx/A
	qg/IjnLtOhOl6hyhCSFzh2o1BLAqpTeXzvhHPaGNHpRGYqLHZtH8+hoQF+Ukk0bAZ9MZhrKkzwR1N
	h1BFz5Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptVae-00GF4w-1v;
	Mon, 01 May 2023 15:37:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptVab-00GF3j-0P
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 15:37:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C76C260B01;
	Mon,  1 May 2023 15:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D76C433EF;
	Mon,  1 May 2023 15:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682955437;
	bh=KHtzVvhao5lIdEbOTmMfnch0KO5Rs+DtKi0nE8rYGeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=miwn0zUCFWgK5LmXTT10zLCI7/puvbBYADKXmbWJpJATU/wlQVpFAq2JWE/qFu6qD
	 ocmZFNS1bbxkPv8cerrUBXkefJQ3MMUkogpaxI+NJeAEsVQkuTGjUsh4j1yzSLvrRv
	 /ODZdGIr40qqZMAIOT4EbRuvF6VgdNeQgnQw5S1foFyRaTwODuF2SiPX8YjmsoPnLk
	 tMVxN/BOUhBglPj0xwu+/myrs8eSGIYQ24JBB+UpIJLTCbSwSUj/gwkVmhbnDY+Dc7
	 wwreeWlc5F0SNIQEvoP/JDFlm5RLytQP9M7/kMk2Ow2Oe4GylT19MaRYEtkSw71Tfo
	 vyToH4ZDDMxxg==
Date: Mon, 1 May 2023 16:37:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] RISC-V: fix sifive and thead section mismatches in
 errata
Message-ID: <20230501-slate-headlamp-453304e8864d@spud>
References: <20230429155247.12131-1-rdunlap@infradead.org>
 <CALs-HsuG3EFBs60sgiMcPHoE1dF7mhi3GKt=AWvRPaUHAfA88Q@mail.gmail.com>
 <20230429-outboard-hypocrite-983e977103d2@spud>
 <CALs-HstrR3Cm3jQKt6dmfYiRRVkAVibAZDtFo0wmXz4LEvRf_A@mail.gmail.com>
 <37e6b325-44e4-8e65-68e3-eab2943018ac@infradead.org>
 <CALs-Hss3b86zAqohK9NYEkzn+pnLeMB37qaj1EA6f6bRkFWwCg@mail.gmail.com>
 <20230429-dandy-gush-6f5da93055bc@spud>
 <CALs-HsuP1moOdZQG_Ur3J3cQ1J+j9Zr-tiSgAkvmCsOXaca9ag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HsuP1moOdZQG_Ur3J3cQ1J+j9Zr-tiSgAkvmCsOXaca9ag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_083721_204281_05C42331 
X-CRM114-Status: GOOD (  14.66  )
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
Content-Type: multipart/mixed; boundary="===============8495759614227373551=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8495759614227373551==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QxAgSuPjgLnnYY2e"
Content-Disposition: inline


--QxAgSuPjgLnnYY2e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 01, 2023 at 08:26:19AM -0700, Evan Green wrote:
> On Sat, Apr 29, 2023 at 12:11=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:

> > Ohh man, that's a pretty bad config to try use (if that's your default)
> > for build testing stuff. The k210_mmu defconfig doesn't enable anything
> > other than SOC_CANAAN.
> > I could reproduce Randy's issue on defconfig w/ CONFIG_MODULES disabled.
>=20
> That's the one that caught me before, so I remembered it as being
> "different". I'll try what you describe above next time I'm hunting
> for section mismatches.

By nature of being nommu with lots of stuff disabled, it is a good niche
config to test - the nommu stuff mostly gets forgotten about..
On the other hand, it does skip the errata handling stuff which is what
caught us out here.

Cheers,
Conor.

--QxAgSuPjgLnnYY2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZE/cqAAKCRB4tDGHoIJi
0gf8AQCJyVILPz8wxSdIrC7f2r/NhPPXJy2BPIJHHNte8eGICQD/Qw61dfip/QUD
cSQ4ka2QSjgqad2+EwxS9Gp292pZtA4=
=G+d+
-----END PGP SIGNATURE-----

--QxAgSuPjgLnnYY2e--


--===============8495759614227373551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8495759614227373551==--

