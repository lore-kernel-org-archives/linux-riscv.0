Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18EAD2FED9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 18:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZNi7rF5ER5pHMD+HG9+/bZTZsKT5Iwk9xbbgr4nxJk=; b=YzmCkAZgSXGi9PXuBCdeTPWfKs
	ipMJH3GL7ouGEbgfCI/DyPIKlKTO9tVDpYFGCUHQdDOY/RHQCDtmR9wyRGTzHRq7pf6V2YzaqQmdi
	lKLVayGbtGoPEdTWsyN/uSsHI3G+1qZnU+4GVloWYp6luQEdN2VBDeUP3UyaGKIryEHHsxEAfbj/x
	yWOSMhEcerK0x/dS2Km7tpzvWVkdFrsfcz7P/DaKp80unapGspJ9HELWB34dEqbq75Ff8UPWujAsx
	z7cuqlQ77wqYqhF+tVSq5dfSeXk3TT5bxYF66gTRlgVO/u0HtBaOASMRWHDoeC3PUzP/DLs+tt4lE
	3oqmBeiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoHN-0000000Es9Q-1OnL;
	Tue, 27 Jan 2026 18:59:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoHK-0000000Es8p-3jGK
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 18:59:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 30B2443FDB;
	Tue, 27 Jan 2026 18:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA81C116C6;
	Tue, 27 Jan 2026 18:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769540346;
	bh=RNmO6INJrf6vBZOIGgzqhzcFiKfgOZ5TeFz3FBzqLHw=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=cWXAZ33QRRnZkydpJVvnUSoHkk8cxWYejV8/TPs8NZD0o8n+tA5Gm0fblbii+5VGc
	 zE3lmp4kPGZWOrVbzafwOENhHCHGueS8GLOFS/U2h5jDuhGclzkVJqTybpK7HgVVkA
	 NCDGysIFqGpSOGwldCYwZ54m1x0jeANTKg8dfnTkt2o7wGOSY3y/uZE0lCJ26s0TII
	 hwvPUU4rdUkDTaX5h2uxp2LB+6cty8MZrPBeWQh0abyILSKhQKFi0hSvh6XxFw0qJz
	 jNnp5eYhRL4LDUw71ZpWrlO6Wfl+b7E5lE6Jaq+XTvEbep4gk7b6iKXUBbDOLIPPVO
	 2aMucMFWV9IXA==
Date: Tue, 27 Jan 2026 18:58:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-sound@vger.kernel.org,
	sophgo@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] ASoC: sophgo: cv1800b: document DAC overwrite
 handling
Message-ID: <f5a0646e-f21d-48a2-8a57-e47db794a327@sirena.org.uk>
References: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
 <20260127-incremental-for-i2s-dvier-v1-1-431b809c632d@gmail.com>
 <6f1d8478-c2b6-4966-b339-47c4d55fe7c8@sirena.org.uk>
 <aXkKfZDyG1uxDsD0@anton.local>
MIME-Version: 1.0
In-Reply-To: <aXkKfZDyG1uxDsD0@anton.local>
X-Cookie: I brake for chezlogs!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_105906_945570_6ECCFFCC 
X-CRM114-Status: GOOD (  12.02  )
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
Content-Type: multipart/mixed; boundary="===============6968163609639411379=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6968163609639411379==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8LAMoqXCOpm9loGG"
Content-Disposition: inline


--8LAMoqXCOpm9loGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 10:57:43PM +0400, Anton D. Stavinskii wrote:
> On Tue, Jan 27, 2026 at 06:49:14PM +0400, Mark Brown wrote:

> > You've not provided a Signed-off-by for this so I can't do anything with
> > it, please see Documentation/process/submitting-patches.rst for details
> > on what this is and why it's important.

> Sorry. I was relying on b4 prep --check. Looks like it was wrong. Should
> I resend as v1?=20

Probably easiest to just resend - sending as v2 is fine and probably
less likely to confuse tools.

--8LAMoqXCOpm9loGG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml5CvIACgkQJNaLcl1U
h9ColAf/fkgnBF6kRiud7owt/zoAhQrLAMNQlUlFwskWevHmn16QwdOmfa4p8Zxz
iZ7aUK2l72TqSnLGeGTsQaN0b6F/95fIQKv6HHN3IpFapf6PQ/yRqRr18cZiXoEG
IRZOwmrxHOeym/3pg/Ebsz6aOAXfOorDiZEx7rJo1MFVy82YuXbSNcjTgruQsPmV
lTvtFv+F2E97fkAwjVLqbGcbBpmXcP37NoPD15fYIPyipUCijusaHEdeHEcj4XvS
K19zqmoS4Ay8XVe723/HPS6787jIo3tKuPDhDGv7xKbIPG+egQ+w5vifCEpuA1Y3
Ev54KUVRptPiGGTomsb6qOlTWeGmCQ==
=6QcR
-----END PGP SIGNATURE-----

--8LAMoqXCOpm9loGG--


--===============6968163609639411379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6968163609639411379==--

