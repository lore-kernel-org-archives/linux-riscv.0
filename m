Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A7BC021A4
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Feb 2025 14:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbQhS3tCs1AfzB+ip1YAO/x1L4bPelVpmar+MSUxuU4=; b=ZZcWpqmENteVe4/Xy2XnW8fx5y
	Jj1VrH/lVHPiVWAc/Dn2mvgCBLrlAYcX8I7U0ZvBkb6nYQTGDyIC9b3tsaJmuD3mYj0RvD19C1EEd
	BcnB+2jLJhcUR5C/00r5P4T5kjvdOjHZNfxaNOwLs2SggWBpSMsWHDDhTtIC7p9/1txo6z23NoiU9
	mFtnroyCYc80yEBh2bbGv/tQiVLz6ZONVU3Twqg9480kEKmpZTwBIU6Q20ojXJcAczy4AWUv9eIVt
	JSW5aN3G8w2Ke9dcw49E5qCU0EI2OhgCsreQjGh39x+7Cd4Tp+SgVUQGrClJbtNPB8pC4lR0tJv3k
	K9Fgv8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJTP-00000000FuN-2kUR;
	Sat, 15 Feb 2025 14:48:51 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJTM-00000000Fu0-1jkM
	for linux-riscv@lists.infradead.org;
	Sat, 15 Feb 2025 14:48:50 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so620111a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 15 Feb 2025 06:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739630927; x=1740235727; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lbg1N+wLayi/whWMrltZrWn7zwfnnHHeJrDcaKiX4Ps=;
        b=IEnRhfKz1gNJis9EQ725UKCZGFQrIM7mOnPjNS1ClLvvKF4qPd9Ysh7T4LCCjaVSNY
         i0X+fcjQT6YiC1cAlRHNYmVXGqPLDvsNEQ50NBVrpBTtPMI3M2+d9BkNkGC6/uH4S5I+
         O1vP/xR14aGrWeeCrHe7dP1TSNrCaPflfmJI58YmqNe18RhokAI6pT+KCttz2Ga3Zce8
         qMSOQnFr+kwz95oGkVQ53nXKiZt9pcmlygscJi8/89wCTS3ccgJJ91CIILN0PZd5d+ZO
         oWDVo2QgbHcVexkqJWSM5XuKy4rqtIlxMg+euEx2tGSyUXjwajtEysYRMbKAZrrj2o6I
         zJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739630927; x=1740235727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lbg1N+wLayi/whWMrltZrWn7zwfnnHHeJrDcaKiX4Ps=;
        b=EDCRAzdqRMTN8LxUYrbNdhEI5zE+qj0mOJ0c6r8bprDsjh2t8TwBw6Dd1LChER3veU
         v4Fn8la2a9vb7FiMcdfev+zDVqUvYaUmBnK9aTVrUl45bU+USmTdyGRJQIvOVEhVkiF9
         6dTmR6hMfJc1AePr84wbx6BcF8Oiwz5HFRFx5tGx7deuCZvWCFJbdcn6iQUEtheTQnWG
         zoeQ9hFZadyUjF83kKZXfG5h4/4oRyEKZxu0tHxKBksoDqz700r/SZ6vKJ7PLyl61+l9
         UZwd1ih/aQUaQKOjMTT4jUmezmBLlt6XZ3FSBTuBkPe0FNUnVrtKCSCWNfgw/oZVRy7D
         g9Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVfns0uCb+io+Ys0vpBiSQ4QENhNyHSJzPNNX8xq5MAJ+MT9KtLzKhbefuB/yLNCSVtR1zLHFV4cFS+6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgDd6ebKhrKlVfo03cVR2fbIE8ltyHs10CliPmYvZacz/EnwTx
	C1sfC78GZi51ccotkISl9ymfnurUEQmfGZcnrHs+08O7IS6Xi70P29Cw6BSVSd4=
X-Gm-Gg: ASbGncsm+bssP82uIOlwRXilhC2yb8yEZ53PknKomd7fJq+4rRALkEs6AU/iBboQJ9b
	SAruYDbm6ybcDBX0l0D7o4wkBeq4Wb9u3Nd17ujAZsJiXFWy7koNa7mY3G8Hjgc2ZdOig4xW9wV
	hlucsV7jMQHYSJ5COfgDm/JOuleFhi2hWTvpRXUDuChWIvkAckczXW/cKAEP1AXh/HPdQOE7Sd1
	BqF37UMiXo8fK7LA7EaE1T2qKEB63XGdannlylZEu4ROkbO5IctiMaDVWRwyqCPwCEbUj5QlRzq
	/4JGPiJVTPwx0ugjXpAo
X-Google-Smtp-Source: AGHT+IHGUJDSLwV8NiWicLHO4Iozp7Nhzo5SqFKK3mYQs2c37P7TAAIEBh9jKvZYNUC3E+8LNP+rJQ==
X-Received: by 2002:a05:6402:2394:b0:5e0:445f:9577 with SMTP id 4fb4d7f45d1cf-5e0445f96d1mr591569a12.22.1739630926630;
        Sat, 15 Feb 2025 06:48:46 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f65sm4535781a12.1.2025.02.15.06.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 06:48:46 -0800 (PST)
Date: Sat, 15 Feb 2025 15:48:43 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] pwm: Strengthen dependency for PWM_SIFIVE
Message-ID: <ts5ze4fosj2vg6pokjfqx3tjernjug646kihiqikxfrhk7tzbl@whgq4nuhni4r>
References: <20250127105001.587610-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20250127105001.587610-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_064848_453627_9F3A44F4 
X-CRM114-Status: GOOD (  14.20  )
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
Content-Type: multipart/mixed; boundary="===============4225101222659776705=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4225101222659776705==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="abah4d5y6c23gnb5"
Content-Disposition: inline


--abah4d5y6c23gnb5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: Strengthen dependency for PWM_SIFIVE
MIME-Version: 1.0

Hello,

On Mon, Jan 27, 2025 at 11:50:01AM +0100, Uwe Kleine-K=F6nig wrote:
> Back when the sifive pwm driver was added there was no symbol for sifive
> SoCs yet. Today there is ARCH_SIFIVE however. Let PWM_SIFIVE depend on
> that to ensure the driver is only build for platforms where there is a
> chance that the hardware is available.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> ---
> a quick grep suggests that the driver is only used on machines that inclu=
de
> arch/riscv/boot/dts/sifive/fu540-c000.dtsi or
> arch/riscv/boot/dts/sifive/fu740-c000.dtsi and for these ARCH_SIFIVE is
> enabled. So I'd guess this patch is fine. Still an ack from someone who
> knows this arch better would be very welcome.

Applied now without further feedback to
	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for=
-next

=2E

Best regards
Uwe

--abah4d5y6c23gnb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmewqUkACgkQj4D7WH0S
/k6PBgf+NdlhPNnLRvoXn8ieJ1IOw9v5VVkzZm5tJWQNbYaQF2b/VJQOPa2i1nmB
Lbw/LoU4pgrGjhwyZ/f1xs2TLqiESJRBjQXT2jre/SoU0BvcgmDUEpFdAlXxeuc6
gI3PhXJgik2DKrNZbvOa6mT4J1VF31up07n3mZGrmU0sPtwKywrNrEdQLOLTpB2k
r/tikPD+OdiqCdRNxMZLsDaePEK6/X6RlplAr8yjcZMl+jNCfUmDlP/I7/LLEkGK
52A0jazwJ28ocX0GKi+gy7/5v7IJ5jZpBtms1dXaJITbtff5ELv6KSYEqNFGSxBj
sKpcnKoT8/eXeZqKvpsp4OhjQuM2Wg==
=Y4rI
-----END PGP SIGNATURE-----

--abah4d5y6c23gnb5--


--===============4225101222659776705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4225101222659776705==--

