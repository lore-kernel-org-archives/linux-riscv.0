Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1895D12D60
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 14:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/TkWHmLSqfwXT5PA6XvRt9EyGGO5rMEtsh6Q4CO0gM=; b=VxmEHlmkpLpcLcr2NsT1yOrdFe
	BYMY2m8htwXfikVvK2wMwBiilyFALO32Z9T+wfGU2PYgT+RDAu0KGVz9TKdtLIANPleDRxnfoI5WO
	d4R6Svqw0WshLcj34xfivRPkYmbgSFU1E0+MWtBRD2PwjotRMhxUg+Q0LAh+ZGynQZ1I+as1om/Jo
	hF1MUZ0A+BDSm80gpfoS8ZQS4AjS+hxXaWzSImsGG9TQ3WxmLMFTT+MFEDoq1b+ZBakhqKpR0pcAW
	Hnk2wcSuwrJ8g3mDwsA7V/DNdi4q24yDrrdz+1ERn/o2CYXpGPlfu+nDX0rNUnwUpOfanuKJNpRxT
	TswNyQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnVX-00000006cpl-47Th;
	Wed, 03 Dec 2025 14:07:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnVW-00000006cpR-2TEo
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 14:07:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BC116019B;
	Wed,  3 Dec 2025 14:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6B5C4CEF5;
	Wed,  3 Dec 2025 14:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764770821;
	bh=XeHOjzxsRrs+/e6OQBy6/U+iBQacdtZwJuoDbBvL84A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZRFou55lAWY0gHE0IOEH0Gt/B/UKvR48gF+GByDhvdsppdIg94FSMm3NtvuVzEYB
	 cBOqLdl7V/BJZQdEZWwcdxvLB4dBSiaWlMSRWrq1NdbThAxenh7BSb0YT1U1pJrkoy
	 1ytI4okgiY9BWTMIBRSA/vlFtW6M9MwYitrCSPzYm6f8iZ2UbNEz7KgyYOyiAqcv3v
	 1xDrsBFI5B1r5SJ2GYDUOvu45ISGLcyhCUZkSoCv9yQYtTOL9xeI/LnNhOiu+wtmt+
	 lkuGOhFkMql+jvc0Ni4itBMMqPDQ5fmzoB/fjoOto7zKDGidznOVomCtfWGxXBlGeS
	 kTHjs6J+bhcNg==
Date: Wed, 3 Dec 2025 14:06:57 +0000
From: Conor Dooley <conor@kernel.org>
To: q691800735@163.com
Cc: krzk@kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: dts: canaan: Add K230 clock provider DTSI
Message-ID: <20251203-cradling-flypaper-8c75476eecc4@spud>
References: <[PATCH]riscv:dts:canaan:AddK230clockproviderDTSI>
 <20251203-f383bdd0@spud>
 <20251203125027.9820-1-q691800735@163.com>
MIME-Version: 1.0
In-Reply-To: <20251203125027.9820-1-q691800735@163.com>
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
Content-Type: multipart/mixed; boundary="===============1619294413060875492=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1619294413060875492==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X3f9mh5vr55gGvqS"
Content-Disposition: inline


--X3f9mh5vr55gGvqS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 08:50:23PM +0800, q691800735@163.com wrote:
> Hi Conor, Krzysztof,
>=20
> Sorry for the problematic patch and any hassle it caused. As a new
> contributor focused on K230 drivers, your note about ongoing clock
> driver work was crucial.
>=20
> I=E2=80=99ll immediately stop duplicate development, search the linux-ris=
cv
> archives for the existing K230 clk driver patches, and reach out to
> the lead developer to align on next steps. I=E2=80=99m committed to learn=
ing
> upstream standards and making meaningful contributions moving forward.

FWIW, that clock series is here:
https://lore.kernel.org/all/20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail=
=2Ecom/

The base k230 patchset has been sitting on a branch in my tree for a
while, waiting for the clock series to be completed:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=3Dk2=
30-basic

I suggest that you focus on one driver initially, e.g. the reset
controller or the sd/mmc controller, and submit dt-bindings + driver +
dts changes for it to get an understanding of the process.

Cheers,
Conor.

--X3f9mh5vr55gGvqS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTBD4gAKCRB4tDGHoIJi
0oJVAP98S5STGXeTLIk+f7U4dp8aPjYstYoXrFf3ALMv6LD2EAEAsF072Hzefp4k
cF9qdJx2f+5x8G5sMH6XepC0L7bVQQQ=
=TrIW
-----END PGP SIGNATURE-----

--X3f9mh5vr55gGvqS--


--===============1619294413060875492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1619294413060875492==--

