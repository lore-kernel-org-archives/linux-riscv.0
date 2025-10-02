Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA4CCAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZjOpr0vbTBm4jvcuWJaWpU8yxrtmP6yJtRrdF/CEwg=; b=0/7T/dCMam0xf6XKNpsd2URplo
	RgXvZm3Y7nuqhPRXavUooHltXPfuS3QQOi3XPZlHVjWS6JpiOq9S1TjKDeEQvr6bRj7jg5yjdDAvy
	FPcvi8IsYltRLeilEb84vSgJhupykWNGci0sUVLSkh+qhHCbAQYE6+XGXVSUbpdCUQc/6BFk2F6or
	UGk/3XGnK2BekvbkeqLiNxQF3iAtdRpU2xj0An4Ry1uu3dMIg/6+xCY36Ir4CBRyz42xIB7USLJ63
	U97Ncu9383lL5mk48aJOQIQuBglT3HitMzQqu0ufqVObDzo1o7OrckMPEM83Q/emyGopmA2KXwo0n
	TUhsP+VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4FjM-0000000A9fd-3OQi;
	Thu, 02 Oct 2025 09:36:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4FjL-0000000A9er-0Jlm
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 09:36:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48D8D44C6B;
	Thu,  2 Oct 2025 09:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A75C4CEF4;
	Thu,  2 Oct 2025 09:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759397766;
	bh=bolpaLjsSmPCM0rXF6ePFMhixKRVDli27uVWmbGLTdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TzLVSutpbF3K1sI4Tt8076iyPL/gyGCh7yBtkMzjgrnsBWmJQpentUbqnFoDpc/A1
	 eFLuai0OaGQJDiJTl6u5yfsZgpRwOB9yT2YxnKC3c6UgtQSdWCELHC25L9kUHc560a
	 lWfjpy3wjSQcxdkE+HO0Fyjyl1ntmkdq2ZrdvkEbzjr9/RJmZVqZ0TdEA6f1LxqpI6
	 7Bywv7CxNYrFU1mx2dZnzy3TYV5r+vvAHAraRG2JZX8UfYJBNANR5F1Nc3p29aZasT
	 3nZmLb/rdzTlb1MRgMmWzZmp/e11iqTF6r8qE83CXNYRFMSf/2IktLhQopisbEIg3K
	 pCa1LGtND33RQ==
Date: Thu, 2 Oct 2025 10:36:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: COMMON_CLK_RPMI should depend on RISCV
Message-ID: <20251002-rubbing-nucleus-b353e09be786@spud>
References: <ed37635b59b0765ed3dbed6ea33c562a40b9e287.1759243789.git.geert+renesas@glider.be>
 <6555b47f-919b-b56c-4a76-352c904343c2@kernel.org>
MIME-Version: 1.0
In-Reply-To: <6555b47f-919b-b56c-4a76-352c904343c2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_023607_133153_B8299D24 
X-CRM114-Status: GOOD (  23.10  )
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
Content-Type: multipart/mixed; boundary="===============6215924092568985944=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6215924092568985944==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X3zY6r0kZPU8RzaL"
Content-Disposition: inline


--X3zY6r0kZPU8RzaL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 07:15:56PM -0600, Paul Walmsley wrote:
> On Tue, 30 Sep 2025, Geert Uytterhoeven wrote:
>=20
> > The RISC-V platform management interface (RPMI) is only available on
> > RISC-V platforms.  Hence add a dependency on RISCV, to prevent asking
> > the user about this driver when configuring a kernel for a different
> > architecture.
> >=20
> > Fixes: 5ba9f520f41a33c9 ("clk: Add clock driver for the RISC-V RPMI clo=
ck service group")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Thanks Geert for catching this.
>=20
> This patch is against unmerged patches in -next.  So I'll plan to add thi=
s=20
> to the PR that I plan to send to Linus tomorrow -- unless any of the=20
> drivers/clk maintainers would prefer that I not.
>=20
> > And perhaps the "default RISCV" should be dropped, too?
>=20
> Probably.  I guess we should just add this to the arch/riscv defconfig=20
> instead.  Let's wait on this one for a few days to see if anyone has any=
=20
> comments, and consider that change for v6.18-rc fixes.

There's little point having "default RISCV" if it's only available on
RISCV in the first place, may as well just be "default y" and be
simpler.

My 2c is that putting it in defconfig is barely worth doing, unless there
are actual platforms that use it.
Does QEMU provide a useful test for it that exercises the various code
paths, that would make it worthwhile to have in defconfig Anup?

--X3zY6r0kZPU8RzaL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN5HbQAKCRB4tDGHoIJi
0hCxAP9qMjBA9+QO8ktTeHc/pequI7z96SimmSjrHSVx09FE9AEA5DRhJFgRmgYs
YN8wWBv7xA8cwGsr6+oBkTOSUoj1WQk=
=YMaO
-----END PGP SIGNATURE-----

--X3zY6r0kZPU8RzaL--


--===============6215924092568985944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6215924092568985944==--

