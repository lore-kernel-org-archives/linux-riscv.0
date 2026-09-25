Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23383C98321
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 17:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+bhV/zwOO4cILTyXDNtMR4jkBQI9QF570NcL14uqK4=; b=l7VW//l8IasfW8SUptkaxD6zME
	Lta+klCWhqT4tgWNUccW41pXsuIfy5t6BiKmqamuq4ly7E2BzHA6r8QaCQsz+h429xulpWyamEHUZ
	l6HxMZEZc+RzeFt8lmOMuc3pO+qo4u6FrIrHzerIdEUl2ZXUE20W9zo6xMM7l5K+rXSLF76J5BLkS
	gqLe8y2KguVISpyXCtarGT9gthug05E4uUhKQMIB8nsL3CaJlgCCLXTKf/oMNB6p1QAeZdL2wyiYD
	BInZYTqgplg/5bdaFIZc0rIK4SmptMqqAdDNbNs4Oea3wNUPUbIXRm4nv2Kz4nOwnh7HTrtESOz2d
	4I+Iljyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9gN-0000000E3oy-34uV;
	Fri, 25 Sep 2026 17:25:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9gL-0000000E3ol-2l1B
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 17:25:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 17C6443781;
	Fri, 25 Sep 2026 17:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1F81F000FF;
	Fri, 25 Sep 2026 17:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790357157;
	bh=vqbbftagvc5RrWc60ar+tiKzwgArqbaZHAHOLJoaJIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X/nkckmljYWXcqMe5MEAbcUmyEWfsjlm5lbbv4B8HLnGbDD1E9p8ATCaNkk9Ge0Xo
	 J7sbKkrqVxYxlIBY0PsUfsMig43ROxd+0/3+fcvkFwtp+Agb82RD/5mUuGrgi5cdCa
	 queuwxETICGk1ExoEeiiSWNGIrp95J7rcvlshOKpAM642vpFUfUUPT3hEPaKUNmAKf
	 lZPP8m463FoFHmtbQ2kOKMEXRo5VXVUFn6K//BMKHhsEQpHlERjmS4AVq3y8CvqrVN
	 GM9iiSSObtHq0yIk0S55379ztu05cyxXbruVD4W80SiG30TQVFC5t0c/hawXguF9bo
	 CqzFbVxUEGBUw==
Date: Fri, 25 Sep 2026 18:25:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Joshua Yeong <joshua.yeong@starfivetech.com>, lgirdwood@gmail.com,
	rahul@summations.net, anup@brainfault.org, lftan.linux@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Message-ID: <b9b0fb81-5a2a-4258-bf5f-eac91dc4b535@sirena.org.uk>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
 <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
 <9c0ae39b-d214-40f5-b010-cdea14ccc774@kernel.org>
 <c2c57bf0-e610-4353-93a4-84edfd08e767@sirena.org.uk>
 <48ba811e-e293-4e94-af38-5cdae4562739@kernel.org>
MIME-Version: 1.0
In-Reply-To: <48ba811e-e293-4e94-af38-5cdae4562739@kernel.org>
X-Cookie: Love America -- or give it back.
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
Content-Type: multipart/mixed; boundary="===============0750248207908311137=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0750248207908311137==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lMCewI6j6WlsEmdV"
Content-Disposition: inline


--lMCewI6j6WlsEmdV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2026 at 08:11:54AM +0200, Krzysztof Kozlowski wrote:
> On 24/09/2026 23:00, Mark Brown wrote:

> > That also looks like what the spec says (some of the description is
> > copied pretty closely from the spec).

> I think we should not create complete new bindings for one spec, but
> rather map that spec to existing code.

As I kind of said in the other mail what we're doing here seems close
enough to that - these specs exist so you can expose a regulator on a
platform that mostly handles them in the system controller (ACPI style)
for cases where some external specification needs the OS to directly
configure voltage levels.  They do actually look like regulators in the
system, if the rest of the system is described using DT they'll need to
appear in there so they can be plumbled in.

--lMCewI6j6WlsEmdV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq2rp4ACgkQJNaLcl1U
h9DgEQf/ev/rFRn1zowFYLxpvC1F7SxcEnn1ugjOp1iS4DSKfF5UqT/bxvBCw5kE
6Y2cjEgpsfC4C9eH/uIn/fBVGN9872aUeZRNRUyoGCZ073QReFnO/EgB6wsjKQx8
Wv6DMnDmlf3tdCxRikYbr1oegxiLLeYjnMUHbdzMuZEe/xc2LraSTtMiEhWGwI+C
fS58wVWMRBaoeGUIeTxh9uDD1rbbeK0IecPQUvXw1COnPmzO2zKdkCc4pE79cXYJ
sBwsJHNhqmpHS0a9A/KMDc3vGkJJFab3WVoQhwJK2WD1YwMApm0ndK+FNHe2is+A
xgRr7hlGTIfvjkx4X71DI6NZO6+3VA==
=yuxX
-----END PGP SIGNATURE-----

--lMCewI6j6WlsEmdV--


--===============0750248207908311137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0750248207908311137==--

