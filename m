Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0E1C55162
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2026 22:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naJcq0DcSHbKidjAjqe+8AWNxVJIf/+kS5iwwmBfDe4=; b=WBIyD0soannuuVXEJSNSVzYLtb
	YM7L6ookivuQT3ToEpFQt0hNRhex+f+4yYSfv0X/QeeJyniJI8/AB9cBwn6ok7S1rjFkEQBVfHr1y
	5rse10n6kTEssqt+1tznSNH5+guQo0EMRMcmshuEOU7Us/krbvZQPHYTjLFVREkimo0+65Umw2MtX
	OV02807QGwTNv9YKb/MjnzS1jMO99HA1prQQNU6gJJnbKjmvT9xYSQMEKFceoLR8BXtSLJJp44FS1
	8x0KO3uckwEejZ1BoEd1Zr1io6+8iB4OX3TNgKTlo7OecxwPvZkkE/eG71+REtlijC3mYACtgKbSn
	FvFqgrlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqeb0-0000000G5s0-29vI;
	Sun, 02 Aug 2026 22:23:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqeay-0000000G5rT-309h
	for linux-riscv@lists.infradead.org;
	Sun, 02 Aug 2026 22:23:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso12069345e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 02 Aug 2026 15:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785709427; x=1786314227; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l1ZnHpxm2/LMNQiDhVhwSE0m9IpcWUrwKDgA+ZpNiFA=;
        b=JcLFB9qyeQn29y4re85EpfRICn3qtdDP3scCvGIEINyCBkrG5TW23CGWcBBd1GuXHv
         xdcqf6BHBV3kcxJZucFgPanfAxmOzCw5z1DPUTI3FyeUFbQ/7hy+LPGPW7KnXVyaExPT
         A5njvGaGA4DxyPCUZBJfXrj3gZf+oJYXtdqaah+FPJRDUxdfGdXDw2SIrOnUUOFvX3Z1
         wI9P1aEGfI6HeKAQPWerznO0B6EPXYRzoQnIhxM4iISi04CZ7gcUbI13xvKnKGmu2Ktj
         9x1eyzCro0yh4a1xSt8GWoBmMGIvNrLDshJo39BVDkskkZW12bUMYVcnwgoJKbJEo0JN
         Ifaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785709427; x=1786314227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1ZnHpxm2/LMNQiDhVhwSE0m9IpcWUrwKDgA+ZpNiFA=;
        b=jiXA/Gdi8cxu5K4ovath3W/qdmsm30SZl/3B3iVyImmk91ztstdvI9XrWDYNJm3+iH
         HdNFrID38CalrNn0y8iqBD8oX+JainxbuAOOprYWA8iVNKb26Z0q0JYU9HTA4EimrQNC
         vB2d710CLejMXyP9XDyWRHUuovi0aFhaIbo+9rMG7HxrOcr7rch6WIsVZGXdIE7iG1UE
         6L1HqFqZ2pAOfYh0ZcF41B6pBd/jk9ifJZt4PjRob6zDZkBWjhlofXZBzcDSWoy3PEdz
         kK36DZk9FoLZ/py/yFlJAd8EA1qDGTYIeIXOuzs8mFcmVx+B8xNMKk17JDHz8QUArkfO
         qNCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBweyDvwyo9ZW9ORBXs9VaWLYDq+J5BSY8Jm5Vxjwz/aZ45CvFiAs9VYYhdIuZoRd3oU3QlXkm8GmVuA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs+imP9NpURg4PU0repX8QiEXPiXY+EsTKlA1vI9+zDXjFNkJh
	/rJfAOk64SLI9B+S/E9sw1mpM0axASRw2bCoHrHYnqzpfDQt8NayBxUgu4PY3Il1vMA=
X-Gm-Gg: AR+sD10BGuHUtw9diQWgWlW9I9XbXMPqb5ONWZvGaXLphQQpqkTO4HE/C7TAj+LQNx1
	e6TD2G5ystw5HxRnLUj8GaQ/mBbTXWV2atQl93xUZezjOqy7fIDYy/TenD6nvKjuGrU/CrjkFZ6
	bdJggxSsdKqoe0xRekLEkMSOsvevkGI3KhdNrAekvsrf3jnWTNPf6yb8lPEjrRIgdGF4In5oxse
	qqbA5bEyuplKNA2o/rRgnfe3E48dCZBJsNAg+g3f/KaU0x4bAC5+nYTGYIX5UtDJvRZRCt1zKUK
	GQDTbKPUaoOR5M3ebrdlm2/kemn6UC7EmyENeQ/43I6TDJ8VfBR85nMmxA3lRb+wKGJd8L/nJ7s
	3GE2ej4IuvjgVTPze04JJqYXsTgoQTXUD8stpjROUC3ljN4Z19maFfTikp9gT7a7+qSLibQMKeV
	qrWrR2ijI2okK7HNhWvzTa7mmt/iYvAAWxGCk134caXoQZR+oZLY1PWffao84wd77yZQ==
X-Received: by 2002:a05:600c:8b08:b0:495:5b4a:53b7 with SMTP id 5b1f17b1804b1-4980c694e4amr194391165e9.19.1785709426561;
        Sun, 02 Aug 2026 15:23:46 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49808691014sm168712505e9.11.2026.08.02.15.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 15:23:45 -0700 (PDT)
Date: Mon, 3 Aug 2026 00:23:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v4 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Message-ID: <am_CzLdCkMKeRv_F@monoceros>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
 <20260801072711.153217-5-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260801072711.153217-5-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_152348_765534_DB3D9DCE 
X-CRM114-Status: UNSURE (   9.64  )
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
Content-Type: multipart/mixed; boundary="===============4727347362224158395=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4727347362224158395==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gz2oumjekulxb57s"
Content-Disposition: inline


--gz2oumjekulxb57s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
MIME-Version: 1.0

Hello,

On Sat, Aug 01, 2026 at 12:26:54AM -0700, Changhuang Liang wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>, which will go away soon.
<linux/platform_device.h> already contains the necessary bits to have
of_device_id defined, so you can just drop the #include for
<linux/mod_devicetable.h>.

This also affects several other patches in this series.

Best regards
Uwe

--gz2oumjekulxb57s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpvw24ACgkQj4D7WH0S
/k52FQgAnVpMoN8c7RMzlLeC4BZnq+Mr045A+Lyjzbeke6y6tbnrEC8YbXAvRo2N
sNZXvZHsehjbmNqj46Yh6CxejtAye4h4IKeyjmmrOGc/+Q+bJ0g85G2hmalRb7oi
CA+lzCUG1kR9AkM0WIATKYQ9xlDy/rxCqmIGxrfvfY/N/xxtC0JwBpuqmoq5BBaD
7VjgxCyAmBP3XRCgEJB6OEtCdz8Uu55RM2uFyy9Ep1/jGuW4EOAkgFzYOlv6XdDt
7/4pdjxlnZeXPQRqdYVo5atbFjSGaPkYijxj3ITmnD9eipiXu0elV7ONWEXCgejO
v/cmCw7tsyRfKKvwR5+mjGtHhsRtuA==
=Z5ww
-----END PGP SIGNATURE-----

--gz2oumjekulxb57s--


--===============4727347362224158395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4727347362224158395==--

