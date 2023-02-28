Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6250C64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZmWQ9EEHmcyfgi9aJIJr7fMD5GzNwwdZkI6CXaWK+o=; b=T1+zg/qHKrcPzq0MJbKCAsjbpB
	XS+E/Qhoyn7e1R+PHxSFTy/pspik2fL5lWn0Tuap/Ff0g4GxIPEcElUgPxJ1fTwvWZ3T95/IFYDm2
	vRD4GH+YM/9ah+J11JQejDw4AeVg+1Uvg7KeZw4XXSxzkWUwlyDtppVd6rRXZZzpasb4t6qs3syb/
	4jDju53rG9+vEphcnTGG1lPVKl7qot5Ggao+S8EpVXHnU4JMNvNoW7X7xv3OxCnGlS02Fbs/ZSDgl
	CgaJm3vvLFw27j8stXl31HE3FmHlK6WJ22SMvV0tb9aTbpHObtGgWpGdtLLexi42lKI/R6EmsCW2F
	TEZJq/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX39Q-00DnOr-KM; Tue, 28 Feb 2023 16:48:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX39N-00DnNt-GK
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 16:48:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D9C306115D;
	Tue, 28 Feb 2023 16:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64AC8C433EF;
	Tue, 28 Feb 2023 16:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677602904;
	bh=j5ue8/Ela2S6Iu9D6UhyjPPM660rOm61zS9HUC0Tujs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=td6tBqtvMpGxuJWUwiXX9r1vZNrMKYKDR5mI+adrEC8TwT/mlAdNTNVUMrQ8bF55Q
	 8BvFvH/8MoO+OCHcnOrB1sYotbW8Pos+mMImgoAwu5PC+rtq8khpsn+EqX4ocpxHba
	 EPmorivtjqP53dtw1Sn/sOkWDUn1gIHxZnUSvRPnB8J1tjYoMFfr4K2WIBsHk68vfw
	 m3J3tWrWbmMBDV711DVW5ZUo2tX/i8ggL0Phi0Mean88uznjRnP6i3w0MWtKoqjtL7
	 YTDVs24y9tbRj1JRuYo27DcLtwCbpZo1IzZfik5JHscJkt9ATH3+8RXnS4B9Igose/
	 i+DTneN9Ljvng==
Date: Tue, 28 Feb 2023 16:48:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: ajones@ventanamicro.com, apatel@ventanamicro.com,
	Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org,
	leyfoon.tan@starfivetech.com, jeeheng.sia@starfivetech.com,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
Subject: Re: [RFC v2 PATCH 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <Y/4wU9fZCDTQrx8E@spud>
References: <20230118180338.6484-2-ajones@ventanamicro.com>
 <mhng-2b30e6d6-d8bf-4fae-a95c-f9e042ec90d0@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-2b30e6d6-d8bf-4fae-a95c-f9e042ec90d0@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_084825_600035_1AC1BEAF 
X-CRM114-Status: GOOD (  15.92  )
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
Content-Type: multipart/mixed; boundary="===============6547903698525564487=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6547903698525564487==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9m7cpQBsS3gT/8xX"
Content-Disposition: inline


--9m7cpQBsS3gT/8xX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 07:54:56AM -0800, Palmer Dabbelt wrote:
> On Wed, 18 Jan 2023 10:03:38 PST (-0800), ajones@ventanamicro.com wrote:
> > When the SUSP SBI extension is present it implies that the standard
> > "suspend to RAM" type is available. Wire it up to the generic
> > platform suspend support, also applying the already present support
> > for non-retentive CPU suspend. When the kernel is built with
> > CONFIG_SUSPEND, one can do 'echo mem > /sys/power/state' to suspend.
> > Resumption will occur when a platform-specific wake-up event arrives.
> >=20

> The code looks fine, but I can't find the SUSP extension anywhere.  There=
's
> just hart suspend in
> <https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.ado=
c>.

It's not merged yet, so:
https://lists.riscv.org/g/tech-prs/message/222
&
https://lists.riscv.org/g/tech-prs/message/228

Or on GitHub for those who are not members of the RVI stuff:
https://github.com/jones-drew/riscv-sbi-doc/commits/susp-v1

--9m7cpQBsS3gT/8xX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/4wUAAKCRB4tDGHoIJi
0pbUAQC3p1Zoqh5pSNqDKdpmv+17fEWPIEWM5GvVuvpHipNyFgEA9cw3OD2IhAAI
eRBwEjtyOYkSrVyi9VC3Jlth9JqDfAg=
=BfZt
-----END PGP SIGNATURE-----

--9m7cpQBsS3gT/8xX--


--===============6547903698525564487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6547903698525564487==--

