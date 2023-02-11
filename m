Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B078C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 10:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVwPG2fObsGAc6Ubs2iwsg19T6wCz+hpJ/I6Vee0mjo=; b=mR3tqHMgz4GDlkK8aMns2CwgSo
	KsuMxlnchUYdzjBNlAzkhzyqqc/biPn30+bJFNnVrmk+r+5JY/Tj5wbGB4bqiz+j0M5Lxe2T4BgTZ
	p9tkaOqydsZch4XS4IxlnebBJDrLg9xS9Fvi8e0SzCZmqTaSbD98rvVJSQ59buHP1WqGSss7022pX
	1IrnlQyJ1YsNhLoKnJw3Oc4yp+gjQPR+adoJykSGYwS0GerBSjBh+ZKc91coHmooZzpMvEroPJLCZ
	3CvoXMWUl9hHZuQgpEC2ExeaRBzTXEsPg2XRVOL8qDeUZmGhhM+F0KXunbgYiyC4JztK1aDNvjF4Z
	dkCvA1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQmvi-009C9S-Uw; Sat, 11 Feb 2023 10:16:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQmvf-009C92-2H
	for linux-riscv@lists.infradead.org; Sat, 11 Feb 2023 10:16:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F1B460B01;
	Sat, 11 Feb 2023 10:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B988AC433D2;
	Sat, 11 Feb 2023 10:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676110581;
	bh=2aVQ+KLKzsfaobyXpsg/M8yts7mCRtdw9G4SVI4itco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVk0uqUCkLlV4lXZq89H2xmL56VwO/J649JcRn1GwhcZ2F+o5JRGbFZDAXFVdCUWj
	 KrJKIoi2SoMgiBg4rbMiZcjy6oNDVm2oIneczi59AB3UUvYzMpByS2swAmeS0o4lSG
	 tNMi+vAajNbR7hgeadt0rQfsRiB1ULUl1BKAAJDlQ8Lwe8ROk/VBphOP3SmXVlHlxG
	 WgowRPdMcZcGur1OkpjxeCj1Lhjbfw8lIkp8Of5X123uabzbAZWMaYF0czKowUFQ1X
	 uGevp38mkoXAab6CSFcQkXL+QzHF02p6lLgdawjYWNXzNBCg7I48B0sjRz/q/WvS/g
	 XyQn2xKNsHrLA==
Date: Sat, 11 Feb 2023 10:16:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1] RISC-V: add a spin_shadow_stack declaration
Message-ID: <Y+dq8t9q0IurWU6P@spud>
References: <20230210185945.915806-1-conor@kernel.org>
 <CAJF2gTQfPoqv1Hq14K6Njim7cueiKECJTQ9rft-yPsN+7N5D7Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTQfPoqv1Hq14K6Njim7cueiKECJTQ9rft-yPsN+7N5D7Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_021623_187031_7EDF6493 
X-CRM114-Status: GOOD (  18.03  )
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
Content-Type: multipart/mixed; boundary="===============7027246768831371911=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7027246768831371911==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wU5rssoYuAlgZdH5"
Content-Disposition: inline


--wU5rssoYuAlgZdH5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 11, 2023 at 01:04:43PM +0800, Guo Ren wrote:
> On Sat, Feb 11, 2023 at 2:59 AM Conor Dooley <conor@kernel.org> wrote:
> >
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > The patchwork automation reported a sparse complaint that
> > spin_shadow_stack was not declared and should be static:
> > ../arch/riscv/kernel/traps.c:335:15: warning: symbol 'spin_shadow_stack' was not declared. Should it be static?
> >
> > However, this is used in entry.S and therefore shouldn't be static.
> > The same applies to the shadow_stack that this pseudo spinlock is
> > trying to protect, so do like its charge and add a declaration to
> > thread_info.h
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > Applies on top of Guo Ren's generic entry series.
> It's needn't on top of my generic entry series. It's the separate patch for:

I didn't mean I was "blaming" your series for it's introduction, I meant
that I created the patch using your series as a base to avoid any
potential for conflicts.

> Fixes: 7e1864332fbc ("riscv: fix race when vmap stack overflow")

Wasn't sure if this warranted one, but you're probably right to add it.

> Reviewed-by: Guo Ren <guoren@kernel.org>

Thanks!

--wU5rssoYuAlgZdH5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+dq8gAKCRB4tDGHoIJi
0oqBAP9gZmRpfkdO+qZe/Qr6rAf9sb7yy5SNm2LAq3FVbDNmqwEAuC+xsWAVnnHA
0swj1KLEI/ZVRhAfPt1n8fZTBanSwQI=
=xQ3H
-----END PGP SIGNATURE-----

--wU5rssoYuAlgZdH5--


--===============7027246768831371911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7027246768831371911==--

