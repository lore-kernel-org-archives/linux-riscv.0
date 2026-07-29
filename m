Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3EAC53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 12:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gwC5ngl8uYpEdnAlRtdQLGc2P9aRbhfI1pr9LWKyxQ=; b=FNaB9zh8rKQGXINMeUQ3RxLmP7
	javmqPHiYA0jM75+o5IhgLSSXSKTA4CDfdX05g4D68yoO8Xt4e2wK7SaXnyW7fowbZNNmvCqzI1Ir
	Ak0qBWbiwUIvlOLUrteTnd30zxYLwXxe5IixmYZXkhCnbf4Srv+CDEbEXza4r/Jnpt1cE8xi8tb/+
	Tdu1s/XizE6UoVg0T3CiIcsoRlKR0N9JhaWFLJ6xzgJOS5aiURyI5EuIoL849HwxfOE5XKpR6xNS7
	fsy0WR2qbXTEEu44WUh/Ci0UfAcQve8brsYOz3bQ+WmK1lcJiIvbtSXkwguT9nVYGAO49cvl1VBh5
	j6sMvVaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3WY-00000007vmR-2Qe2;
	Wed, 29 Jul 2026 12:36:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3WV-00000007vlg-3TX4
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 12:36:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-495635a85d2so6949235e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 05:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785328593; x=1785933393; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xGyW1zCh+rLKiJ62hDLL4FkHUX+Lqecc47aUXSHCSkw=;
        b=N01y0mJDn698AyWwDU08aHuZU51PYBnT24YRvN4pXCO4VAbZ7XjIg3BrwhN9Fn5JGO
         z4k2QHzDxT2tJ2Jvi9rcrYMdZoiK0DsMn7Gv6UgKbj6lKEW4+QCkaqDaK0r9oULR7Cul
         gwsPUfxMFBwjA8qhVKhIK5o2orjDGcLk2cbFaW0pkE2yrQo77RP+GmfVOPFU/8wtVahA
         8EqMMcJTuuAHQvQzgjP3TXr3epsYI+RrCQDD+e0xZJ8ZbOJhU5v0hfRrsGzPEpfGNlDG
         HfTdcR4myvgPLRCgLhfuRnV8Lz/dmDxS0sozKWkWtp096D9I6uMnfJrx45qraQa6X2Ba
         qz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328593; x=1785933393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGyW1zCh+rLKiJ62hDLL4FkHUX+Lqecc47aUXSHCSkw=;
        b=a/KpiVFRfEgtIWwG34FzhcefbTRrNBpxjc2voIdea7bUbERNIQfs4ql4WrS+rtGVez
         6a9LT8Ogrt5IEd+YO0gQ1HXbHJM10zq12xEgxrBjE8IOcqKhA9JCh16j7y63RGt75Arb
         6uMKMKqGvPleYxg6dNOdr0Nllia6wvZKFt1u6Uyixdznf4tebxx0WFOr+oOTW002CCxZ
         wUXhNKDz4ueFBCVYBvvUckZfd/P5/Nbe1yHAV6ltMX+SlA8ARsBlhxBRYLtF0PS83YJj
         wLQ6vEuIZSXugQZOafHHeY7/Zk26IDucl4Vu4HRZ6v0U8ruzHAJUhe/3Hii9gEDuR1uW
         U1Fw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+pVsBb/6u2EOthcBHhGRJXE8uLrs4yZeu97E3VRv8IjfJocjnFfaOYev8BOO892GtO1aP5Vud0sdxpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzddJxt2IgEpFGHU/KP0w1lPOheZg9mny7v+rDArY1CKQBsN4eU
	ERcF5DhJLWTz4oJs8qeG9DpgdOOxI5I069rL98D2vyCCkwMcy/faYDT62Vr8wI7K2+0=
X-Gm-Gg: AR+sD10RY/1/0NRjvbK3ABDHU4lOeB6XD2DyyoHw9ZjPFRyVmYUuaS4pPWNGBkCc8YT
	hMNjmj4OgMYo3B1DfFZdVuYkEisb3zLNtuaG4DnRho/O/e3/rsIHjEUhXQ10jHC+AlRoO6w5SW6
	fdpEWoBCoGd6XYP+bs7u9gbZLs90DmBxvA7x2hzQ/XBhZo1/3QUFJ6sFyH6CbbC+gqFW0s8ipjp
	abBlqcSggHdkLKpHMyxGTD3MtZwbaQK3VH3bzQ7yMarbZY6wdRC2E0oM0S+EyU64eCcP1NkxlaT
	oYz0kXle9OK8qb4HxFWrJHFUqdBrn2f/FYzjKNieGZf2Y9MYu+piEQ5rZkEd10fshRkBCnU3D/B
	4XNWm0P4cnK1sqT+qemOwh4KLmFK6ZXGL2ixJzGiiy6hfI3OtyEO4yZ8iD7k8a08yPUu46PJlIS
	oSO/IwHiJ0llct22Jt68ed+MelpwSVYGeHRXMj9PF3p/mJXdogixCNuRanEEbTk7S6Zq90iP/Of
	RrZaud02MacMhda/4Oyx3uyrZ8azu7Upeh3D6Do3XPlR9Xdq2U=
X-Received: by 2002:a05:600c:3153:b0:495:573e:1c54 with SMTP id 5b1f17b1804b1-496c6428a29mr80996735e9.9.1785328593413;
        Wed, 29 Jul 2026 05:36:33 -0700 (PDT)
Received: from localhost (p200300f65f47db0401da7fd03a16a046.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1da:7fd0:3a16:a046])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-496c45b1c76sm146982725e9.6.2026.07.29.05.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:36:32 -0700 (PDT)
Date: Wed, 29 Jul 2026 14:36:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: codykang.hk@gmail.com
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 05/17] phy: spacemit: add Innosilicon DP TX PHY
 driver
Message-ID: <amnzTxDYtSBojHdY@monoceros>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-5-6de34d80e86c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260725-k3-display-v1-5-6de34d80e86c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_053635_879849_F7111C36 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============5645383378811790724=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5645383378811790724==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="db2zigiccrbrx7pn"
Content-Disposition: inline


--db2zigiccrbrx7pn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RESEND 05/17] phy: spacemit: add Innosilicon DP TX PHY
 driver
MIME-Version: 1.0

Hello,

On Sat, Jul 25, 2026 at 12:51:14AM -0400, Cody Kang via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already makes sure that of_device_id
is available and <linux/mod_devicetable.h> will go away soon.

So please drop the latter #include.

Best regards
Uwe


--db2zigiccrbrx7pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpp88sACgkQj4D7WH0S
/k6T8gf8DMOwEtZaYC8vvvJqKWATzitxIn2z2YqgDVlNFzaZEYTG61pFLh/KTds+
sl2cVZmTi8idTg/Of+KXRfO2hxAkSW3C5UbNd60pd0VY+mQSfW0RGGroYO+tusRx
A6NwUHW15ZrpIuAsbkKepIhd0YmoiVA9SimCLHX85RxW8RuuPoKWsaur8Jv/j+Pz
dp+m3Lfaj8gG8J21Rdy8YTgKJ8GMpjOVpViSpsqQIROd5gqkOUepPpTGc8Cc+Pr9
haGqNLM86F9sZOA5aL8HEpYGHDo3Q6hGRmDiUm3CBaNwalgdp6qGUEKWGBjRoi/4
tgGD4NlIoAze3OTkKRb3ysqj3/8Xng==
=c0aq
-----END PGP SIGNATURE-----

--db2zigiccrbrx7pn--


--===============5645383378811790724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5645383378811790724==--

