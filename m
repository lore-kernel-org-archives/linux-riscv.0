Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292A8C5AD49
	for <linux-riscv@archiver.kernel.org>; Wed, 28 May 2025 10:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMXbs+aJN/zuqpkBO3lyVAR9ZGDQd4EZsDnSI1W00Vk=; b=qzN+1UGhlLu1Pi6sFS6WcirHgt
	0dL51Bmk0uOGFnj1ceU4LvfimSs3Rzt/zp0zXY1Rcpq0hwQrwGZ8BWqwRLA2IDjX3+qq6YsaXSvtp
	f51N6KskU/65Rf+/p10D7OAF9Y2oXEr9saZKcgNwh/IJ/Q6cGFAUrGTCaBUEnag5iMKryATMzlnyM
	g8ovCoKThJEUWaOwvpJTxLbRi+jVsFYwcehzALhULmIccFYqe1pUi6jcyNSyZjxjIjrZ+sBk0ZbI3
	YYqPRy55RmouNRSIkUw+Jonj/a4EevHXftOZB3yVHcmE+fz0YKnz8wUZ1HJFB8tnVzDffhrvlataI
	93cmdGBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDux-0000000Cpu2-3uAF;
	Wed, 28 May 2025 10:21:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDuv-0000000Cpss-1xuy
	for linux-riscv@lists.infradead.org;
	Wed, 28 May 2025 10:21:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4D565A4F876;
	Wed, 28 May 2025 10:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626A6C4CEEB;
	Wed, 28 May 2025 10:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748427708;
	bh=MarkZ8utDfJEEqG+ZwLpK8d+OC45TaBkZgBFc7qet+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4QFFQUIcZimiPD3SX9jXdRRX77wR2TsQWYRGBAm7B+x66WD6mXbTPY8CFWaatNzT
	 BHpRSl9D0m0FV3dyChup6xal++HQlK+ocxtllMOk59zPyM1hOM43W45usPV/a1cF15
	 hqroARrL1RjBAtB8rh/GjU3BNsCaSW7Ozrpg3opRCsOtJEpuffjm413yrnP5/HeANG
	 Wpw0cqfAbUqjZ10TiqhukNRnJPqjA387wshfZqS4ipF3XJOSA9LSYIKkWHLOL4wgqI
	 CP7gtUj2HsLSfbQ92/w4Ckam3mMIwyeNIY1f6UzHUl6nk1Sdj130C9sV/AusB0V8Tp
	 ZucM4V6myOcTg==
Date: Wed, 28 May 2025 12:21:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Nylon Chen <nylon.chen@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, paul.walmsley@sifive.com, samuel.holland@sifive.com
Subject: Re: [PATCH v14 0/5] Change PWM-controlled LED pin active mode and
 algorithm
Message-ID: <crcfskukqifse6gqrydx2iezargv5frv6dguj3iqdkfm7xxbqh@4v2dvo4zcmbz>
References: <20250509095234.643890-1-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20250509095234.643890-1-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_032149_574340_6F10A846 
X-CRM114-Status: GOOD (  12.21  )
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
Content-Type: multipart/mixed; boundary="===============5123284266277200161=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5123284266277200161==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q3beuwyz772xtchz"
Content-Disposition: inline


--q3beuwyz772xtchz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v14 0/5] Change PWM-controlled LED pin active mode and
 algorithm
MIME-Version: 1.0

Hello,

patches 1 and 2 ideally go in together, right? @Conor, does your Ack
mean that you're OK with me taking the dts change via my pwm tree?

On Fri, May 09, 2025 at 05:52:29PM +0800, Nylon Chen wrote:
> Nylon Chen (5):
>   riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's
>     active-low properties
>   pwm: sifive: change the PWM algorithm
>   pwm: sifive: Fix the error in the idempotent test within the
>     pwm_apply_state_debug function
>   pwm: sifive: Fix rounding issues in apply and get_state functions
>   pwm: sifive: clarify inverted compare logic in comments

The objective of patches #3 and #4 is the same, right? Both prevent that
=2Eapply =E2=88=98 .get_state is idempotent, right?

And I'd also squash patches #2 and #5 to have the comments updated
together with the respective code changes.

I think the algorithm implemented in this driver is more complicated
than it should be, but this is not this series's fault, so I tend to
apply it with the above mentioned squashes.

Best regards
Uwe

--q3beuwyz772xtchz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmg247UACgkQj4D7WH0S
/k6YPwf8CPS53gGarqxZhus1KnVvEiNi//eZnxRpZNoAwKCuMXf3nZ87lDGFDOpr
ZafvQskHAPQK6E5WffbH33HJyr+8sFLhHWPFLWBmpHbi4pNdUDYfYWPhgwcU0roH
j3J0ihE2ysD3hq8AnYFjM/O5wqZDkXQQ+Qgk1XUuLp3SywIQDYmsVt5+Gqy7LXRd
BcYv7fWURROIeLL4XnKEZghjYDJUXIk50ue3UYqeYDv6jhWdoJOn6Acc7KdUXDYQ
hO99harJgO772boFRxa7+c9edXfNpCHzeVMFJbqoqvWu8msq7SpvZqJKz1aUQOMN
EPaRoaY8tdFY4qPbwrka8VfubM395A==
=dm+D
-----END PGP SIGNATURE-----

--q3beuwyz772xtchz--


--===============5123284266277200161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5123284266277200161==--

