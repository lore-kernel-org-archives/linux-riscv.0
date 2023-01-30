Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8892C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 15:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFCakISEVHFp5BLlbk2Izrctw418NdMq8VANP/tfdqg=; b=Z0kSzillwOSt9bn328vyXkEVMI
	RuhUZVOSJvhV6t3YQubibBJS/wQUHG5ygMGPhk6+GAJo2CgXl12XpXcsZw80UIV0O6RKarYh+NySN
	oNW2EjmuMUJ3AAQ1tFGGf62yYV09WTWRusqoGRhxtJCs4DD4YM8siQ36aCpMufW/h9fEMixLsRpyv
	rgbsd6JBcyNo/MqHZg0Mw7hWyEWz/6dARgUbk4ZfDvA0y9XC2VWts2ui47i+4cYqQf+vGYcT+YBLd
	logfjBfn+SBRbQGh4gUG4y0uKXQbCnWIZFuR9liKH7F8iACDbm7GiXUu+OrDRNx+Lbvqb5U7bEB6j
	UbTY4Z1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWD2-0043di-Ik; Mon, 30 Jan 2023 15:36:40 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWD0-0043cO-E9
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 15:36:39 +0000
Received: by mail-wm1-x32f.google.com with SMTP id l8so8285836wms.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 07:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dOXRUmBXFiifXvzPC8imf6hOLL/T6qZBqV64N2nOgU=;
        b=fTQ3P9YCjeLCmcnsVKhrpsPP8aZsKY6HBgLCPuqzSrFWX/iT8Sp44LdM2UB/fyhNMV
         E66b241sIzZeZ4NCpropV3vUUcZSTPL7mSKjBAx833SMSi7MJqfX8PZWt0+sF5JLx9A3
         ufIdnyL1VLNXgDPn7Ef9iNvj9t7ZkYeNfFyGlc8OGvuKjuVEGVgwMvACU2gt+bciF8t2
         sYbfj5SgBQ27AasRjJ2BFXK1cEFTtMG2zXkRWyXJo/J25nesB4xWs26L47z7P39NYVkN
         EoVaVqbNL8HQ0mwhDPgA6jIC21Rc+xjWhJ2HZJZwtZZUJ9P9xPN0pS57zmHm3e6fS4Ld
         1jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dOXRUmBXFiifXvzPC8imf6hOLL/T6qZBqV64N2nOgU=;
        b=AADtpK4gCwgR0NApKrYtcTXPPlLE/riyJ8G36c8iCLKjURFRhLajox2oUZ8GLQudzI
         oGYCHadlcy4Emf4eXxyFhvbkhxvI5L3fbDGcJIcNULJTfbRRqrqbcHaPhwTPOrfcbM95
         e8F1djb59II7iusXDpb8E/i1iwMMNpOvs+iy57YfcJ+IIXQXqleibCG7ag09D1bHfrv1
         dpIR6bCrzgjgnW9b/1qFjqe+PrWPN3lqblGX1md6ZtOZQHwjtVSPCmJIdQyFYhpA4PFu
         x14DWSS0SgJgQAvw9X+qR+oH7DY1b05U0Y4fpXHcgKwMFbPL4ZbxCZp3x8NWPE/rjaXB
         vg+g==
X-Gm-Message-State: AO0yUKW46ikLQ0AEadWt6riA4FFp9QqRsG/JF/C0l8frwOKS73UizDXy
	HFT9sGx0e43LCRcXms8EkBE=
X-Google-Smtp-Source: AK7set/4JeVm2sUMgE7ALABnOi8bhC2azYZoYx20b9heveQtDktZVPMBf2tjCnHNbw8+1PRZTZeMhQ==
X-Received: by 2002:a05:600c:3595:b0:3dc:1054:3acd with SMTP id p21-20020a05600c359500b003dc10543acdmr23270906wmq.17.1675092993971;
        Mon, 30 Jan 2023 07:36:33 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id w16-20020a05600c099000b003daf681d05dsm13068005wmp.26.2023.01.30.07.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:36:33 -0800 (PST)
Date: Mon, 30 Jan 2023 16:36:31 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	"Wesley W. Terpstra" <wesley@sifive.com>, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: sifive: Always let the first pwm_apply_state
 succeed
Message-ID: <Y9fj/72Tl5FN+HSf@orome>
References: <20221109113724.519021-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20221109113724.519021-1-emil.renner.berthing@canonical.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_073638_493842_B6C98C77 
X-CRM114-Status: GOOD (  20.32  )
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
Content-Type: multipart/mixed; boundary="===============7102764625712017282=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7102764625712017282==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ir6Gg7F9FhCRM+tI"
Content-Disposition: inline


--ir6Gg7F9FhCRM+tI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2022 at 12:37:24PM +0100, Emil Renner Berthing wrote:
> Commit 2cfe9bbec56ea579135cdd92409fff371841904f added support for the
> RGB and green PWM controlled LEDs on the HiFive Unmatched board
> managed by the leds-pwm-multicolor and leds-pwm drivers respectively.
> All three colours of the RGB LED and the green LED run from different
> lines of the same PWM, but with the same period so this works fine when
> the LED drivers are loaded one after the other.
>=20
> Unfortunately it does expose a race in the PWM driver when both LED
> drivers are loaded at roughly the same time. Here is an example:
>=20
>   |          Thread A           |          Thread B           |
>   |  led_pwm_mc_probe           |  led_pwm_probe              |
>   |    devm_fwnode_pwm_get      |                             |
>   |      pwm_sifive_request     |                             |
>   |        ddata->user_count++  |                             |
>   |                             |    devm_fwnode_pwm_get      |
>   |                             |      pwm_sifive_request     |
>   |                             |        ddata->user_count++  |
>   |         ...                 |          ...                |
>   |    pwm_state_apply          |    pwm_state_apply          |
>   |      pwm_sifive_apply       |      pwm_sifive_apply       |
>=20
> Now both calls to pwm_sifive_apply will see that ddata->approx_period,
> initially 0, is different from the requested period and the clock needs
> to be updated. But since ddata->user_count >=3D 2 both calls will fail
> with -EBUSY, which will then cause both LED drivers to fail to probe.
>=20
> Fix it by letting the first call to pwm_sifive_apply update the clock
> even when ddata->user_count !=3D 1.
>=20
> Fixes: 9e37a53eb051 ("pwm: sifive: Add a driver for SiFive SoC PWM")
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>  drivers/pwm/pwm-sifive.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

I've applied this as-is for now. What I'm wondering is if perhaps we
want to implement something into the PWM core to deal with this, now
fairly common, situation.

Thierry

--ir6Gg7F9FhCRM+tI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPX4/wACgkQ3SOs138+
s6GN+Q/9GErvttbzCfQ8UlLEkSt6ZyC2QIVVZhEDF7LoH4jprLifKAEsGMR9BK5y
XS2nldqcUtb9q/p6hVdnGcMjyDmoH9OLoVeM3PX56BaeKYaEBdUeg97uFAwsIJU4
TdcFpAzIVKNCsPyK0wwPw2P4bWyiEs1+rf6Go4jNu7aZE77yI11TrhjUxXBc++9g
EcDChQ2pu3PJgCaBx16GZ4RQ5CgkR7JSL50ZohmKbdO/8asYi3aGEBxo5YN6BTaV
NKI2H1n1XH1KKC6m/3/eIC2fM3bv9q+JqRe7vJ9kalxTdYnwZKglRv2WyFsA0kF1
e1bTJrq3P3fpZVfY+dH1SfddToqGftPOc5vBd+NnK/brfmX+uCpg+vDoo/YeP+jU
TDh9FZkWGMJ7XhZh1A65QQazsKfo67gyG5xKZZU/XtT6U9vUXBAffpzWryeS+ulr
iDo6WjhtqBw+7hk57paDn5f49wVJIRijvNU0dAVIGGxaZceiAo1WJsaC7zUxrvq+
9fCZb/o7bfsnFd+/QG8tVcuZ41dKTrqlXHU70qzhXJ4tBxE8NVrk0hG8AmghyGt3
oQiyNw4LJE777ES/OVpkndtr4DMaERL7+e6ZAqJ8w/YQNHEedacHM8KopOrGUTHp
f33dJEjjcqFU3r0PWfo9mRRaxLF7AeWJxOdlMUK28f1k5fQo+V4=
=oOaj
-----END PGP SIGNATURE-----

--ir6Gg7F9FhCRM+tI--


--===============7102764625712017282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7102764625712017282==--

