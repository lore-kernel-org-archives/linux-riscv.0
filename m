Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF69DC76196
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 20:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VVtIm6ox46pSk1MPyLIjDGO8c6gaA93n++39pHX5Sg=; b=viL/ViIqbsLOxOo59VArC/oV02
	dXmZzp0nrbENf8Mt0RVTNMnd5Jwlf2qbIOfhfEemEBu/ikdikcOb2CvJIhLLfndeNVk1GziwY+KuR
	8VJcASsHlHpy/PAtAhOVmWDnve9DfUsc4sNmFTn5YvHvGsqgfY4RGrMiaLVmKsjQa1oYY9b5DH1jN
	EWwKvQ6e1X56qx3CZzR1YU1LqVcVCH1T9AFPXn5DhgTZ6OtHKhmiR4ZvIx3zA3DQygnShMk97aXIX
	VIpSOh1CLU4UZ5aplI29OoHcsW/GOycSUVBRiBe3nKHjo2qAPz+GPbq0J9DLmkdjVwgMZDuSb8PeE
	sM4oGtBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piiBd-00BIE4-3A;
	Sat, 01 Apr 2023 20:50:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piiBa-00BIDh-2Q
	for linux-riscv@lists.infradead.org;
	Sat, 01 Apr 2023 20:50:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BDB7E60F92;
	Sat,  1 Apr 2023 20:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83A1C433EF;
	Sat,  1 Apr 2023 20:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680382251;
	bh=cblNPwspiLiu6TBVBEScNWqtn9HgaLDxVomWxXoSOWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R2Xsf7OmDrvxKOnaV1o2olTZD/+xO24c1NxVVjgi4tY54cdvVXRkP8hJX46e8UoKN
	 vHFfU3gTbKbx1gzg/9ZYBwKR77EFvO/bE9X5mbcwTnp5Xav6jrPMbaxht6AO6eYeeU
	 8uZ8Q6WVgufuMawepfUsnfuH+0iPYWMfn+pjTVn+FOP5n6swmE7RwLL05Fp4hH719s
	 trz6qOMwQ7pEP0BXeCulcHfwhx2FbZDit9dRQgxqa4X+m6eps5Cu7fkyEs8Jd/kMXl
	 yBu1tZ0WR2yiKZf80HCi8SKkX8C0Q74lFP4zMMEs70FtCI4Ykck7/2RopRFMfOCEyW
	 HPxAvf8S4LXqQ==
Date: Sat, 1 Apr 2023 21:50:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v15 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <0b91dee7-6c1d-4a33-8235-8fd5d58b200e@spud>
References: <20230330071203.286972-1-conor.dooley@microchip.com>
 <20230330071203.286972-2-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20230330071203.286972-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_135054_854497_B96E00D3 
X-CRM114-Status: GOOD (  19.52  )
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
Content-Type: multipart/mixed; boundary="===============2562040224550905192=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2562040224550905192==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WqrHL50fzIiM0DjG"
Content-Disposition: inline


--WqrHL50fzIiM0DjG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 30, 2023 at 08:12:03AM +0100, Conor Dooley wrote:

> +	/*
> +	 * Because 0xff is not a permitted value some error will seep into the
> +	 * calculation of prescale as prescale grows. Specifically, this error
> +	 * occurs where the remainder of the prescale calculation is less than
> +	 * prescale.
> +	 * For small values of prescale, only a handful of values will need
> +	 * correction, but overall this applies to almost half of the valid
> +	 * values for tmp.
> +	 *
> +	 * To keep the algorithm's decision making consistent, this case is
> +	 * checked for and the simple solution is to, in these cases,
> +	 * decrement prescale and check that the resulting value of period_steps
> +	 * is valid.
> +	 *
> +	 * period_steps can be computed from prescale:
> +	 *                      period * clk_rate
> +	 * period_steps = ----------------------------- - 1
> +	 *                NSEC_PER_SEC * (prescale + 1)
> +	 *
> +	 */
> +	if (tmp % (MCHPCOREPWM_PERIOD_STEPS_MAX + 1) < *prescale) {

Hmm, looks like 32-bit doesn't like this modulus.
I pushed things out for LKP to test before sending as I felt I'd not be
allowed to do that operation, but got a build success email from it.
I'm not sure why the mail wasn't sent as a reply to this, but
<202304020410.A86IBNES-lkp@intel.com> complains:
pwm-microchip-core.c:(.text+0x20a): undefined reference to `__aeabi_uldivmod'

I know that tmp < 65536 at this point, so if the general approach is
fine, I can always cast it to a non 64-bit type without losing any
information.

> +		u16 smaller_prescale = *prescale - 1;
> +
> +		*period_steps = div_u64(tmp, smaller_prescale + 1) - 1;
> +		if (*period_steps < 255) {
> +			*prescale = smaller_prescale;
> +
> +			return 0;
> +		}
> +	}

--WqrHL50fzIiM0DjG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCiZJwAKCRB4tDGHoIJi
0iJlAQCB2UJl++XV4NMR+7ECnWEx79RdqD/XDFZb1Ug8Y9BRwwEAvSU+APt+rIRQ
PbPJgMxFUNyTzMFYCMWtE6d2M3dPCQ8=
=v2Y6
-----END PGP SIGNATURE-----

--WqrHL50fzIiM0DjG--


--===============2562040224550905192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2562040224550905192==--

