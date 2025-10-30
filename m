Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B19CCF9F0
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 12:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvGZJFLt3SqzpvTQiMGGanbXIZL+rq0BWwtzuHDGq4E=; b=c4uDCd2OddK6wewnFf9wAEC0gL
	aqZ8ExMiBppl5ieYoAOY1z5i6ds8q8G1YvQuS8LlnioZV1GPfL5BL0MRCzZ4UhLrjZmAnyiqY2V0p
	JN0urnCPWXKOKRdi9MsPvfw1+aSzXNbvEaC6EPCd+VOS0goSvtuUL7A1DdDHqyJZZP8pEVNFgd96y
	TnyzH0r/kFTeBYCB0+NAXrMjDfRAU+vvdt9HwyN5rcrZ0wLqwEiIRo0h3sbUMDH+Ve9UUkAzyi7ee
	9QRNnD7XtH5uneQBtQOowmQhLe9D8c7a4ReSEPjepxENuUYdGHANmD7BmzTNl7jyiPdMmQF/mqXuO
	wNqHAw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERlG-000000047MU-09i1;
	Thu, 30 Oct 2025 12:28:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERlC-000000047Kf-0NBw
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 12:28:11 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-429b9b6ce96so361014f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 05:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761827288; x=1762432088; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4faCkAArvXRFWP/BvJT3qCkXJoGOkTL/9xvSBBThwwA=;
        b=j7D/M6xWUEPfU8IefZ8rhyGsbG70Qul+ZBNtYVkeGGB7SfnP1zKxnqfj+AHWEytLEX
         jbXfYuklnYtpA9nhSFaCGrD/UGd+Ph2Wg/Em2EDY+YeM4ItLV7Eya/LVsdUcRJ9f4Nz2
         U9IdF7+1gBuIRgSi/Kq8aQC7h1kGDgL5UaxA2B4Lz7RCKvHMojJiOtgo1lQrn4QKsUoi
         2m8LkgG0gfgrvmOLFWXwndp56Mb33lxW1YgRqcRZmtRNtIzr4X9QA97LJV6G2PvY5GyX
         makHInk73+MdYjKtJCxFCmnW0AgyaKtcMQ8vFyOinmW6sOIaPcn0i/NpDYENhON4DnMj
         trHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761827288; x=1762432088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4faCkAArvXRFWP/BvJT3qCkXJoGOkTL/9xvSBBThwwA=;
        b=KhELCslAXxB2lH6+3Q/6y7i1fvWjt0wIn931bbRFKetB93gBtPgkMo5APcLDySvRDn
         1BnvYFG14wTgNZEPUuPRvjC9xSSPTYdhWib3KucjIoCF6lqxAYrhz44cpSukCYKCAWTj
         ifIe4a6iEMFo1pv8WTw/R2Uz/Y194K0JitPmlN7qjglArTnfK/KJN+Vk5GRx7UwcVZZI
         hjsRqGzllDjZ0zaop9biAYfY90DZZmhPqt4cu7GPjuexJz81Lv/wuJVMcXrP2lPV8DaX
         qnYRF/J9cbb+GLeBqgd/yWdK02QqywrrHFJazEx37gp4J9sSp/UYdY+9Bb05h6hrtttT
         sRlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgEvTY87F9G6anWnm9Wmbo3xFhkT1+qp/MoK1+SCLL3fxhNG9mzSBK2nvUcD+3vVshxnscx8/WvD+0sQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ3mG1R1s1nchP45eF6pps9/y5LJ5dgcfLKkuTjKx3VKG9hrWi
	eNVuILHq5O0l1vryzGbLDuv85UFI8n4U5iAehXhvcxgqcjvaHTNL7Wdc
X-Gm-Gg: ASbGncvT7wv7/HFU+sd3KflGPPHnGgMK+z6X2bY0AqanxWW9zdc/yZlwQjf0cCgxkSJ
	Loz1xJffESM1Qy1i0i9DMvtriHO1zQZXOwEKNi6QeR1KQOh5cQ9kKGTmRTYnLGq3CFf9Mz9c8eJ
	9v0e9cvrT+cwBgj+4N4AicUktEGWIFY3EuS1RsWHS5EnYfo1RB3c7jOM4iiFId+obd8vT8uTAYw
	on6SiCWxZRLfJ9IYWjCvkHCRF0b8Kcm+LMdesFVW/9SDxSiCDYTKvJB6zuOoVKkuXrocjD+yIm/
	JZ6PStBAp1RMg2mffBLTWc7REnLrok9OS4M1O9qv+mKWu182Z9xV84v7q4ZhFjOxyE1LldusDXH
	6GLBAXzrEUrrUTm2ExDUiLrH/fCv01/Rpbu0g9tjNEmPwVM4+rqm7aeBbOak3Tb9Sr61sD+/5Qz
	raTJ6dKuc4gBYC2RiMJg0rWvXiPeCxikiZzGHj2YWt1iusgUMGbWevopkZMY3VuCxlxMxNoELO/
	g==
X-Google-Smtp-Source: AGHT+IFohGfPrMB+gEC0PPjeDu6wKsKn5Xw4tnoTnVq6JsR15gq4re74GuIZTwiApDmgxJjGG1cQpQ==
X-Received: by 2002:a5d:5d06:0:b0:3ec:d78d:8fcc with SMTP id ffacd0b85a97d-429aef82ae4mr6294449f8f.14.1761827288007;
        Thu, 30 Oct 2025 05:28:08 -0700 (PDT)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429ba445463sm2028625f8f.10.2025.10.30.05.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:28:06 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:28:04 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] clk: ingenic: tcu: Use contextual data instead of
 global variable
Message-ID: <5psq67p7ozmfz6mbi626q2uixqtbtfpejkhud5fv6wqr66xasz@ksiokkf5qsgr>
References: <20251029163336.2785270-5-thierry.reding@gmail.com>
 <20251029175647.GA1572736@bhelgaas>
MIME-Version: 1.0
In-Reply-To: <20251029175647.GA1572736@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_052810_141436_D6912670 
X-CRM114-Status: GOOD (  21.37  )
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
Content-Type: multipart/mixed; boundary="===============1950954779280403155=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1950954779280403155==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ob5xm6zi76m7ppm"
Content-Disposition: inline


--6ob5xm6zi76m7ppm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/7] clk: ingenic: tcu: Use contextual data instead of
 global variable
MIME-Version: 1.0

On Wed, Oct 29, 2025 at 12:56:47PM -0500, Bjorn Helgaas wrote:
> On Wed, Oct 29, 2025 at 05:33:33PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Pass the driver-specific data via the syscore struct and use it in the
> > syscore ops.
>=20
> Some of these things in drivers/clk/ are also platform_device drivers
> (though not this one) and use generic power management, e.g.,
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/clk/qcom/q6sstop-qcs404.c?id=3Dv6.17#n209
>=20
> I have no idea if that's desirable or practical here, but using the
> platform_device model instead of syscore could have advantages in
> terms of modeling device dependencies and ordering.

Similar to the MIPS/Alchemy PCI driver, although there's no git log
reference in this case, I suspect this was not in driver PM on purpose.
The pattern I've seen quite often is very low-level device driver code
doing this using syscore_ops because they run very late/early during
suspend/resume, respectively, so the driver PM callbacks often aren't
sufficient.

In recent years, some of the issues have been alleviated by things such
as device links, so a conversion may work now.

However, often these are also exotic and/or old devices that are
difficult to find testers for, so I've been trying to keep the changes
in this series as minimal as possible, so that we can be reasonably sure
things will continue to work just by reviewing the code.

The most important bit in the series is patch 1, which lays the
groundwork for avoiding these global variables for new code. Also, in
particular I have a concrete case where the global variable approach
doesn't work because an IP block that used to be a guaranteed singleton
now no longer is.

I have looked at various drivers that I ended up not converting because
they use a global variable not only for syscore but also for other
things and fixing that up would've been way out of scope of this series.

Thierry

--6ob5xm6zi76m7ppm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkDWcwACgkQ3SOs138+
s6Hg1w//bfwZK2UyWYgH0DjUdLRkw/JLbu/3memPliSQO+SxPOEf7uwnD1QnAiQ3
AaL3UiueXsnj30IkhBnqYoPaFQRz3G5Ag/PFIKX3kireFrAExwZP/9AKWiJflD1I
gh+QOfqgZ1HpJr3QSmmjosBmkm5T7a/J5dUNuCcZoRcya8QmACQqg3sWy8gj4BdT
Hy/aq2/JWEEJs1pLE5SvCexBqTP5gxTj8MTuNgqm3hRDtZc4TQnKNZIcJwgOruMX
Wy4rrgBPQiASKxxP7ksI7iXCTOYM61AlEm39RUFNcGKI9iOw1YxFn2LuVIPoFJc6
H92dgYcRmcEgy/oWPc8yTs9iX2POH5p/40/nb53U3sj6iQVhEMoVIGmIuxEX9RHL
VHkn3RNfYCZlwqDtwCCoN6DWBW2PNUAX3dsD1ng3ZZHuDH2lbQaQudKRi7MGhAxm
ADqiAfq1HO8Fk6uo5BFMtpieue14jJFHaQs21TkOlurf/LH9GT2qO52/8KtcxYx8
F8pXjAM4Ps+sj+Er6h1Tb6PpXrpJ1lvGqagYTEJpWQuWyjXLGeseMpif2ucjdzjp
4qfcE13QtePpLlbO8kklfDMdo6+uClFAMgWMM0jWWFtczIaUWmwRYcDGUbW4RbHt
H6TJJVsDtuaQNx9wfo+vq3oMZviuttJPzFqYefIOL7oACIZD6sk=
=0K07
-----END PGP SIGNATURE-----

--6ob5xm6zi76m7ppm--


--===============1950954779280403155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1950954779280403155==--

