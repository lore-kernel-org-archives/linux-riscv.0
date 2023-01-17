Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795E9C00A5A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 22:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ML9MD/qhCQO8wbeyNdrNQKv2I0/8jJYVQFZhfNhNjBU=; b=0GyahYDtcjd3v9n50YCxzOI7WO
	fbIXPBWS3iF1nB5UOW51TuW9PZyTn9Y5Ljan/Dy6BDo8Gx1EquTlHDQ9s8yMv6C6Uczu0SnWHerrr
	+LsBsy6bgw2C2IgDht1LnKJchmFDryW4obupn1SZ6AC7qeHxg0dI6NuddwVbP/cTdsqNNefGXiNvh
	YtRbKh+wGMhWB5xHKcJxLN8AeceLvlkZBwqvfLYpbW87isOTqmrNyOls9YXUiGy7HhEp0beCBaVqk
	DIXVc23epGi1C+YpCQ3RmFSJNT6rKdP3QGN6LnsOB1gbtYhMjRbC4Ob3G8B6beYgjn7JXWagE+olV
	0RCOPatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHuXr-00G6pv-Gq; Tue, 17 Jan 2023 22:35:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHuXo-00G6ou-JN
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 22:35:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26D9E61552;
	Tue, 17 Jan 2023 22:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB693C433EF;
	Tue, 17 Jan 2023 22:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673994903;
	bh=eWG1VPMkeRLPxbwPwcVEiYJL+Vutp+KjKBvwMn+l3Zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmPyOVQeGo/pyoaPU/m2sGtG6M/15GKwqGraCmJC/fRxCKvJFxnwFEcVaogxNpJF1
	 uIIpdQkP3GEvYM0aFk27sCLxaYnqexZTMYuDvupLiaBrnb1vveW7pDJ43luSF1jsgW
	 LujmcHaOAO/bk/Mi3xIqYDoeVZS/R5rmsj975KpKV+pRRPsIvqAUmuXA13L7uY2JY9
	 0FxARInPXLP4h/bPfxoznqLq7Qcz3QBp3xx1vdINzCmE0JBIAQownSBOxfHnhFwhh6
	 EvdyvK01zUJpNX0Kx9cZgX9/I0Yg1x73zAsdYfUzhGe8H1jPpRSeo/Bw6StZRU6vJN
	 jyalA/nzzOD6Q==
Date: Tue, 17 Jan 2023 22:34:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Sia Jee Heng ' <jeeheng.sia@starfivetech.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Ley Foon Tan ' <leyfoon.tan@starfivetech.com>
Subject: Re: [RFC PATCH 0/1] riscv: Introduce system suspend support
Message-ID: <Y8cikxHHxXPeGKyF@spud>
References: <20230106113216.443057-1-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230106113216.443057-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_143504_698746_25799AA5 
X-CRM114-Status: GOOD (  15.42  )
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
Content-Type: multipart/mixed; boundary="===============7547423207148138889=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7547423207148138889==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wN+tLJAJSLr64pUs"
Content-Disposition: inline


--wN+tLJAJSLr64pUs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Drew!

On Fri, Jan 06, 2023 at 12:32:15PM +0100, Andrew Jones wrote:
> Booting with an OpenSBI including the RFC series[1] implementing the
> draft proposal for SBI system suspend[2] we can add system support to
> Linux. This support implements "suspend-to-RAM", which means when a
> kernel is built with CONFIG_SUSPEND 'echo mem > /sys/power/state' will
> initiate a suspension.
>=20
> This has only been tested on QEMU using the OpenSBI system suspend
> test. The test just waits 5 seconds and then resumes. To truly use
> system suspend a platform must have a low-level firmware implementation
> and provide at least one wake-up event, such as from a wakeup-capable
> RTC alarm, to resume.
>=20
> [1] https://github.com/jones-drew/opensbi/commits/susp-rfc
>     Posting: http://lists.infradead.org/pipermail/opensbi/2023-January/00=
4091.html
> [2] https://github.com/jones-drew/riscv-sbi-doc/commit/d9e43e9a938fc3eb51=
0e023c3f352462876f7785

In case you don't get alerts from GH, I left one *tiny* comment on this.
And I really mean tiny!

Thanks,
Conor.


--wN+tLJAJSLr64pUs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8cikwAKCRB4tDGHoIJi
0hl1AP0QF4aS884D60QTE61PkR3KD+ux5b7AY7P8vJgkm3RssQEAisCAY5lSFYO4
C0A3bvPEfpMwK/5LKe6TT9oqP6WqHAE=
=JsIX
-----END PGP SIGNATURE-----

--wN+tLJAJSLr64pUs--


--===============7547423207148138889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7547423207148138889==--

