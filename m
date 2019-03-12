Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39950C10F00
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 12:12:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02FEF206DF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 12:12:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WssHCWeo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGfMpmdo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02FEF206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tAi8adXZZ9Z6nQ3RmJH6Ux0R/IbXpZqmXWgU/OaSUfs=; b=WssHCWeokOCJYSW2dfy/Htxmv
	6NI8Qw8uafW7oSQ1FbQEZdYHGDmVN14gsti6jEX7h5oz+ZNroUcZmBZkd8gaZH9sIOOWzEmj1B/ar
	jVNcoFlywaMk+KHM6h0jPPzKxALdp8+BMENNc7++2Rd1aclDENiZekzPspz+VzhGltxc6uzcjtF1C
	L2Zfbwc0cmeUUlqvQ5rAYFS5RW0Kew8bx+8N+b6qqfbqsjfr65naTBWB3ENfdIBX7yYNLX0S4usmY
	u9EzjYGCtQ4hekuU2edWyIp4dGq0GGtK+AVXdesmzEoSH2pYLJbspjTlqGLD6aQH1iy+nbkDRuyIc
	DElNBt2KA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3gGf-0008N3-8B; Tue, 12 Mar 2019 12:12:25 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3gGc-0008Mc-Bs
 for linux-riscv@lists.infradead.org; Tue, 12 Mar 2019 12:12:24 +0000
Received: by mail-wr1-x441.google.com with SMTP id i16so2378893wrs.13
 for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2019 05:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tlLiaO0QvUN+5U+pEOsUBgx0DXxj5SqSgUYXXck5DpM=;
 b=fGfMpmdo0TpskNHf7G4TYFxi5SMEHNd7uF71sJso5/bSmIrqd1X5hzmKec4aRfMV5p
 g5CmQi1lVCJMF7TSijib/wd4OGl46srNZvCbtQvUWbM83oanpyVGWR/202JDyneRUkzE
 DjrAk2sMlmHxCrDOYt2IfT01HBAZGI2Y6K6fnKbnwQmiT1p1K5zppDSdftg3wgnVhSpL
 t0toW2iQxXD94Y3EdXMzjuxf2ijBrmNAeYHjYvUvOtpZWPU4X6zfgMVaSFPoSQ6MCssJ
 Ghw0b5yvYs52i7EoghyyKzvd4Jt/a32LHpYfb/ogOmjbQn5XKCPG/bRXde/OSkUUxzWG
 ZNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tlLiaO0QvUN+5U+pEOsUBgx0DXxj5SqSgUYXXck5DpM=;
 b=EOI92bN4wTUbpKfaqVXyqwRJ+VqZ8I74kPQlxnyaOHCLA52Kl4A5x9NUvYecTD1iRj
 cpSBxFlh9cGeJ7z7eHX1yZva5Ml1hvKVqnbMgPwDRU1/1kQjNM+ILH+OKME4No/F0E/6
 NUBUa1qHVQvmSa2TDueqrHTHnzVdLhVcmmJjYrObLv5+MaX7wckzWxSxWHP81ZzsI5W7
 epJyXNUmUQOJsr1+yW4t2jG5g0Yikr8/c55xB9DZQxlIBbECjwlCN+ooVpSJ8ZtJmR1z
 T2JXlpm5xgnstQJcKktLPXTEAaODXIzS6ARv0wncWFCNJDwaOht6tgOQuvdoT4TZ7YeS
 Odgw==
X-Gm-Message-State: APjAAAUSa1HK4Dn+FPraQs4GKnvOcTlbVpAohMzbJvqDXuAZgB+wyGyz
 oduaPOQVkKY697NQLElXKns=
X-Google-Smtp-Source: APXvYqxrAKBNz2i/pOugTU6pHA5OPbs5J1+101GxQuQCdDJ+GiRWcDF9yii/Q1nS7pFysGxioMuvvg==
X-Received: by 2002:adf:f089:: with SMTP id n9mr17515940wro.313.1552392740433; 
 Tue, 12 Mar 2019 05:12:20 -0700 (PDT)
Received: from localhost (pD9E51D2D.dip0.t-ipconnect.de. [217.229.29.45])
 by smtp.gmail.com with ESMTPSA id r6sm7103385wrx.48.2019.03.12.05.12.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Mar 2019 05:12:19 -0700 (PDT)
Date: Tue, 12 Mar 2019 13:12:18 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v9 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190312121218.GM31026@ulmo>
References: <1552378289-27245-1-git-send-email-yash.shah@sifive.com>
 <1552378289-27245-3-git-send-email-yash.shah@sifive.com>
 <20190312091739.fhv2hb2ll2eamdsn@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20190312091739.fhv2hb2ll2eamdsn@pengutronix.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_051222_534067_EBC00029 
X-CRM114-Status: GOOD (  24.59  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2271873753346443231=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2271873753346443231==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P9KQiUGMzYCFwWCN"
Content-Disposition: inline


--P9KQiUGMzYCFwWCN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2019 at 10:17:39AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> there are just a few minor things left I commented below.
>=20
> On Tue, Mar 12, 2019 at 01:41:29PM +0530, Yash Shah wrote:
> > +#define div_u64_round(a, b) \
> > +	({typeof(b) __b =3D b; div_u64((a) + __b / 2, __b); })
>=20
> Parenthesis around b please. I guess I didn't had them in my suggestion
> either, sorry for that.

We don't really need the parentheses here, do we? The only operator that
has lower priority than the assignment is the comma operator, and that's
not going to work in the macro anyway, unless you put it inside a pair
of parentheses, in which case, well, you have the parentheses already.

> > +static int pwm_sifive_enable(struct pwm_chip *chip, bool enable)
> > +{
> > +	struct pwm_sifive_ddata *pwm =3D pwm_sifive_chip_to_ddata(chip);
> > +	int ret;
> > +
> > +	if (enable) {
> > +		ret =3D clk_enable(pwm->clk);
> > +		if (ret) {
> > +			dev_err(pwm->chip.dev, "Enable clk failed:%d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	if (!enable)
> > +		clk_disable(pwm->clk);
> > +
> > +	return 0;
> > +}
>=20
> There is only a single caller for this function. I wonder if it is
> trivial enough to fold it into pwm_sifive_apply.

I think this is fine. pwm_sifive_apply() is already fairly long at this
point, so might as well split things up a little.

> > +static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *=
dev,
> > +			    struct pwm_state *state)
> > +{
> > +	struct pwm_sifive_ddata *pwm =3D pwm_sifive_chip_to_ddata(chip);
> > +	unsigned int duty_cycle;
> > +	u32 frac;
> > +	struct pwm_state cur_state;
> > +	bool enabled;
> > +	int ret =3D 0;
> > +	unsigned long num;
> > +
> > +	if (state->polarity !=3D PWM_POLARITY_INVERSED)
> > +		return -EINVAL;
> > +
> > +	ret =3D clk_enable(pwm->clk);
> > +	if (ret) {
> > +		dev_err(pwm->chip.dev, "Enable clk failed:%d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	mutex_lock(&pwm->lock);
> > +	pwm_get_state(dev, &cur_state);
> > +
> > +	enabled =3D cur_state.enabled;
> > +
> > +	if (state->period !=3D pwm->approx_period) {
> > +		if (pwm->user_count !=3D 1) {
> > +			ret =3D -EBUSY;
> > +			goto exit;
> > +		}
> > +		pwm->approx_period =3D state->period;
> > +		pwm_sifive_update_clock(pwm, clk_get_rate(pwm->clk));
> > +	}
> > +
> > +	duty_cycle =3D state->duty_cycle;
> > +	if (!state->enabled)
> > +		duty_cycle =3D 0;
> > +
> > +	num =3D (u64)duty_cycle * (1U << PWM_SIFIVE_CMPWIDTH);
> > +	frac =3D div_u64_round(num, state->period);
> > +	/* The hardware cannot generate a 100% duty cycle */
> > +	frac =3D min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
> > +
> > +	writel(frac, pwm->regs + PWM_SIFIVE_PWMCMP0 +
> > +	       dev->hwpwm * PWM_SIFIVE_SIZE_PWMCMP);
> > +
> > +	if (state->enabled !=3D enabled) {
> > +		ret =3D pwm_sifive_enable(chip, state->enabled);
> > +		if (ret)
> > +			goto exit;
>=20
> This goto is a noop.
>=20
> > +	}
> > +
> > +exit:
> > +	clk_disable(pwm->clk);
> > +	mutex_unlock(&pwm->lock);
> > +	return ret;
> > +}
>=20
> There are a few other things that could be improved, but I think they
> could be addressed later. For some of these I don't even know what to
> suggest, for some Thierry might not agree it is worth fixing:
>=20
>  - rounding
>    how to round? When should a request declined, when is rounding ok?
>    There is still "if (state->period !=3D pwm->approx_period) return -EBU=
SY"
>    in this driver. This is better than before, but if state-period =3D=3D
>    pwm->approx_period + 1 the result (if accepted) might be the same as
>    without the +1 and so returning -EBUSY for one case and accepting the
>    other is strange.

Perhaps a good idea would be to reject a configuration only after we've
determined that it is incompatible? If we're really going to end up with
the same configuration within a given margin of period or duty cycle and
we can't do much about it, there's little point in rejecting such
configurations.

>  - don't call PWM API functions designed for consumers (here: pwm_get_sta=
te)

Agreed. The driver can just access pwm_device.state directly.

>  - Move div_u64_round to include/linux/math64.h

Looks to me like DIV_ROUND_CLOSEST_ULL() is already pretty much this.
The only difference that I can see is that the divisor is 32-bit, but
since we pass in state->period, that already works fine.

Thierry

--P9KQiUGMzYCFwWCN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyHoh8ACgkQ3SOs138+
s6E7lw/8CwEa+SQ6iOIiC0QTSowiTzEaVGxw+bbwyxGkg7BXfvg6iLEzK+ZhsIU4
NyA0Q2/u8dP6lFawnP5kzMcjzYeKDbBq5hpfjv+JVGaLOo4KdCfVI5rNyrtv68Cz
Gp0J8SxekNcqGwXp19oYLy5HyaIxZupDAPGkdKmVQn4Khxj2wee4kBj3BoSDRCyh
/deUWdxme4U5RurMMiDTeS6MMiXubCZjS/ITjzDCvrroVlWzC10ATPZObZ1jJPI4
UljScKJgZwCHLfuZN8X+dXQGCHHJ25kLmnXpouPM84JsypKqKqhmN3ngwdVdg9Vn
YOrGOXoemgKXMpuKAKDg3Oc+Ys+1kmODm7PnrxAOX8Q6Vb+C7H9KMIKVBZpIcbfX
jJwYrXcDxwW+5bA+mPDUBLQxUdxcEq0FheOLDjHQefnQGWu1NZoyLeHGITIS72/D
KcKVqijEMR5SoGyIFLdq1Ua03YFfYl2b4WOuWRFd3KxcqZ+rdenC9uzCw57JFF28
n35rUWNpTbuQYdhTzkNcdP2Tf2joG0cPvN8+5adW7SwAHSUQgAipFFOt/2ldL0+c
tay4eC7LxSZ5sBqxPdIbH3P1iAsVtbxlpL/640lg5U5eBawVH5ewpOe7hVBtEoKn
Rn2nfqndVJHWZg1YxZsC8RIx0ylD1/YhnP+tRJhvZOEwjf4dq2Q=
=iW8+
-----END PGP SIGNATURE-----

--P9KQiUGMzYCFwWCN--


--===============2271873753346443231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2271873753346443231==--

