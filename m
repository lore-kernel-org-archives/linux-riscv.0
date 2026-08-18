Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF8CC5DF70
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 09:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pv6mvNB04GXeQdHAyp1jN7elhEQ6ughza7DwLhZJyw=; b=cyr8iKbS9BuuNmS6raUiPu7AjD
	T/fq/xLhiND2Mwn4Q4GdLD4LWnEyPxXURoWHXphI/Tbo+O1oXOBmosKtQUgJYt/ErLPTpYQ+NqZdJ
	yBr2cwM8U3cXMo53jKTI1GpZcx21T6eyZGEig7IE8evzCSaqetwxbCay0t1t7xuxnkd9HDHR/3fye
	h88y053P5xQTHCzM40NEVuCb0NJCPwvFKap278K/4wWyOiU+Zt5qcb02wsYJdDnL3+T6aq4q9eL7V
	+CeXhSkByIXuFNs45jPVEg+bjnpMkFS0ECniBqqtc2Lz19OuQh/CO76wjPhCCp+idZXeblnkq5c+Q
	yeJ51CaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGO4-00000007fC6-1sFe;
	Tue, 18 Aug 2026 09:45:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGO3-00000007fC0-2YkV
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 09:45:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DAF6860A59;
	Tue, 18 Aug 2026 09:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CF21F00A3D;
	Tue, 18 Aug 2026 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787046338;
	bh=lxh47bE0eJzEi3uLLxOK0tSzMFY3vWxKYVwvwmXkahI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QA/kUcVl1gBFWaEcZbEEmA4ftKlCm6wMEV58ryRTFN1iyW1KOCl/ZkhdkHu64Am7C
	 CoPkXKml4NuWlOW0WTS7BF0R2kRJLsBcHmAwf5NK2L2nzw9yVL/vYGSvl7IPTZGvs5
	 ui82O9Vp2FujHe+YpBLiDqelqa2rk6DRPDcV86FkGUzOfPyOe64jxPCLoShfVQWIl6
	 87B7eQQRzyGPjW9Pr6BFzJmx1Br1wi0cXsboiPU9Pwvkb1fIccKFcb8TGLLjhnCCw8
	 2KNMEkCICtM9bo0hTmLC3NVeFk+pJT4POdyN4LKvA0sen4mLS6qs9FWIGExbf+kakq
	 e0S6aJuCLRppQ==
Date: Tue, 18 Aug 2026 10:45:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: conor.dooley@microchip.com, alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org
Subject: Re: [PATCH] riscv: hwprobe: require both F and D extensions for
 RISCV_HWPROBE_IMA_FD
Message-ID: <20260818-uninstall-opposite-b713ce801f5c@spud>
References: <20260817-unmade-dyslexic-4bb4acf535af@wendy>
 <20260817211507.28685-1-skunkolee@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260817211507.28685-1-skunkolee@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0747898617019025514=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0747898617019025514==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UR2iiSoY9sceda38"
Content-Disposition: inline

--UR2iiSoY9sceda38
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 03:15:07PM -0600, Ivy Lopez wrote:
> On Mon, Aug 17, 2026 at 03:14:36PM +0100, Conor Dooley wrote:
> > The kernel never supports F without D, so this cannot occur.
> > riscv_isa_extension_available(NULL, f) always returns false if D is not
> > also present.
> >
> > If anything, the code in has_fpu() should be changed to only check D and
> > not F to match expectations elsewhere, or F and D for the same reason.
>=20
> Ah ok, thanks for the clarification.. I hadn't realized F-without-D is
> already structurally impossible here, so this patch doesn't change
> actual behavior.
>=20
> Would you prefer a v2 that fixes has_fpu() instead (checking D only,
> or F && D, whichever matches the intended semantics elsewhere), or
> would you rather I just drop this patch since RISCV_HWPROBE_IMA_FD already
> behaves correctly in practice?
>=20
> Happy to send whichever you'd find useful!

I think I would rather see has_fpu() get changed. I think checking
either D only (ideally with a comment explaining why that's correct to
do) or checking both are equally valid, which to do is up to you.

I don't think there's really any other equivalents to this has_fpu()
code because anything that would do it just calls has_fpu() instead!
The closest thing to it that I found is code in cpufeature.c that only
checks D (with comments), but that code is part of the wider extension
parsing logic that where the block on F without D happens in the first
place, so it may not be the best example.

In the future, when replying, please try to keep more than just one mail
of context, to make it easier for people to follow the conversation if
this is the only mail they read or if they forgot exactly what was going
on in the previous ones.

Cheers,
Conor.



--UR2iiSoY9sceda38
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoQpvgAKCRB4tDGHoIJi
0p8XAP90QgkBM+N2QT+XtDm/msMcyWeJrpYVPoOLdAxGPL3dpQEAkNSaf9PWQMhQ
BWvah9YbgBwis1ciOb639ZyaGQSu4wU=
=Ftnu
-----END PGP SIGNATURE-----

--UR2iiSoY9sceda38--


--===============0747898617019025514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0747898617019025514==--

