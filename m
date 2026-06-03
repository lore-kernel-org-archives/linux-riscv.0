Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A990ACD6E57
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 19:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUIZWJ3zKh0SciOnXnt+/w3teGJjprdNHQoTo42GlSY=; b=ShmKqnjbdWLkabslxrRu4Ed+9M
	sKq2phQbL7Ajc0eLWMp7a7UgZIab2LdxoKQcX341Rd5c6caH2f1ODg5nOr8pcaHMMzKzqH6M3UToQ
	aCH5RFAW4PksxPY+ffRYJNF0N/huOF8x3YYwZNGIdGG/AayghUSta9d121ep+vyehBtScVfRWz56f
	9DCmtGssG0Awi4knvwQw6BKlQDo6yxv2KoD4ME9ICqu6MNN9Hxgr8jK2zesn1IBj1apDUPilWh2sQ
	wZ76uOjnzc4Kza4uW/ku/cRiQPv+mAFS8H53lvIk5a9Fw3p69tIybynQzDnBj9sA2kP6XAMj099VR
	iO8dcbUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUrOj-0000000FlOe-0hTB;
	Wed, 03 Jun 2026 19:37:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUrOh-0000000FlOY-1l9X
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 19:37:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AF3E06008A;
	Wed,  3 Jun 2026 19:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76581F00893;
	Wed,  3 Jun 2026 19:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780515422;
	bh=s3qnc/SJWDZVqy5joLNzLjwUlB1aBEwjBqBmT0FU8gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SZQWscm7L2vXrJbDhlkoQkeUJkLEDBlD2comFRsfLCkSwI+Z+b93Gc3jB8oSWL+ja
	 KbUxFtO6lhSwuUFQuX2tV9SnHqBa2Tqnbw4JTfVwWubAk+00Ov/AGKLPLA9oxjTiX0
	 t2rzWJB4uXUI9AtBjyJXATFh/zjnuU4rUJib3XMYXiSL+DK0u4slD/t/+koMtZvwnk
	 4xLDBD97wwdk1+NmYJTbJHhfXbVUlfyyouFXnADc5KHBKJD4eLjMiONgmkdTCxEe7g
	 PAzuw/w5SM2VttqKq2rhxjUcgurCWykKo8Mgmwz+C5pR/M0lvbeqdbFWjgJ0MyXhwV
	 yNMh/r+aFanKw==
Date: Wed, 3 Jun 2026 12:37:00 -0700
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 6/7] dt-bindings: riscv: Add Tenstorrent Atlantis platform
Message-ID: <aiCCXO0XFfFSdLQB@gen8>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-7-joel@jms.id.au>
 <20260603-enrich-primal-69483cc92b84@spud>
MIME-Version: 1.0
In-Reply-To: <20260603-enrich-primal-69483cc92b84@spud>
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
Content-Type: multipart/mixed; boundary="===============6438084213190760389=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6438084213190760389==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PKkjq6arGK0OljzM"
Content-Disposition: inline


--PKkjq6arGK0OljzM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:17:41PM +0100, Conor Dooley wrote:
> On Wed, Jun 03, 2026 at 05:12:18PM +0930, Joel Stanley wrote:
> > Add compatible for the Tenstorrent Atlantis platform.
> >=20
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
>=20
> This one has weird signoff stuff.
> pw-bot: changes-requested

Sorry about that. At one point, I was going to send the series so my SoB
got added. It should be dropped from all of these patches authored by
Joel.

Thanks,
Drew

--PKkjq6arGK0OljzM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaiCCVwAKCRDb7CzD2Six
DFzjAQDsnxKEvbM+HmKWbwYeRsAEhTUoAXLpfl47EcMzOmajiAEA5LQwNiBUIk0f
x+ZN3WrLFvotRZClG34vhMQZHQU9FQg=
=T1bm
-----END PGP SIGNATURE-----

--PKkjq6arGK0OljzM--


--===============6438084213190760389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6438084213190760389==--

