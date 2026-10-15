Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08785CC6B2F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 06:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFxcwF0I3ogS2TpLIsrUOzGXJilp4NL+53ux/VzPtQ8=; b=M+vnKWVEkgXmMQcEjyQksQkHvE
	UjEtg8ZqPYi9nYYBAQxTKfZ/L9ExAKOk6b4DMZA0F/S2LTDPgw0oTRsKGz7ltF06aZvN+2kWhK4Tr
	+MRlXGmjOD0TubNmhkSiti0W5ghr73+0XFN6cF16zKRdDnu5BhQN8ITs8gweaWsNW2h+o5SyWNqi8
	rSMmEKa1dREmbY+iY6tEuJLCRYRZ/0/eKme4ueQMAW8EAnyi+nmE5h4yYx90FQR6WbIUckSiIQ9v+
	5YVM+opX+A7RyJ+UgrMqB591o//Q7AsJ1Oyyd8ElcNAcunZsiwCNPJTcEAEA3p/a/8imwGrSRTnun
	kDgaRPRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHF0w-0000000GwBV-051u;
	Thu, 15 Oct 2026 06:32:30 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHF0p-0000000GwAO-3yRw
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 06:32:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so34136165e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 23:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792045942; x=1792650742; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aCK3gVEToJ+wvka1ZOkBmWjuDFje6LetoLMhHEyakXc=;
        b=Utj1OTyb8EI0QT1e3pP1tD5qsXrTY7J6r5T04FX9aXW1X1xLzBcEYESTwVFeYMlxmP
         vShpespcn5zN4zM2s55nocoijwryLAeg0tZlx37MV+S2tuqzgS8v106vl+Lp34eGzcr2
         DYMtemHDM9uLfS5wYtqQqXoP1uSxOKLMBVcGurdC6OonxXiVALrOIJJVS2IY3iQFvB4u
         tVRsaS1IcoZzb/p6w0J+6EIRX9XXvpidqn0UgXdyk8I0JiOSvIrQmB4RxUhkaSTPcPGl
         8L/WT49VJWwFUHrREiITH+8hQ60nLkCVyFwjalvWSDVo5GI0vsfyYNyjnmjm0jjcqtET
         9djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792045942; x=1792650742;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCK3gVEToJ+wvka1ZOkBmWjuDFje6LetoLMhHEyakXc=;
        b=A8WBa3KLg/qqx5FKk4SG2Bhk1j2Uj7GI2fgh1Ibh+BE5e5zH247LWwVImPXc09Lsc3
         WfsKcRjSucqyFZRalTAtcuJ/djhqq3CZMfnxQvQSXcu9oTn4+oWXchHzUxAK9GVoiB5/
         7Bf2iBG3XgVSpRePrJRAlGroWQQVYoQwfM/SHozojzPLBfTRnpna4IuP2DRU9SW5sOl9
         mwegpnmTzKasmnZZ9u9uF23N1haf2iir8frSZ7toRFNgUL5BHuv4kYKF8Ltun4+vjZeM
         8aiTagSbxeIDnBJ0PwkwTp2zJ6PngJapHXFyLsNC80pyN1F8CQZLy3pW+noIUzfbo60M
         L9YA==
X-Forwarded-Encrypted: i=1; AKwUvBxc1TS/6Je5OtluandkeC3RAD7oSYn0LwxSYjoe4Gc/HLjMIOadjBruMKunzyixjqlTeruSYZc8VxlNjA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLJopK4yRy/fvU0xAna/a/0p0Fezx91kVVwSXw37K2NaCFFrpXk
	jnohgsDfbFzIc5SiNIRbKflkiNSf3PuFoueUYRjiiHLVf5ghpGfgHw7uqVLRWMFTOIw=
X-Gm-Gg: AYBFou3wCSWoN5Hdf20dcWTKgAOzbs/ZlxprIG4NjMWTJoGOyR0iCdQZf+i3f4uUaOR
	ULRQ/pY+U1sNaPJcytnFAITHWsBnPRuHuCA64YUnwoUIrzX3vHpcXYasq4djUInaZsIOQsfnS1w
	vhCYkfz3vO+ofr6SBvmdjeoCYb20mzOqYNMk61KwPgJKcEZhHBqca4eWNRvHpB1Ex9fuUzLo+Jc
	8yhPixV91OdjkbdlnCl1wetiKAqij+AVBvakZHE5h0dhZNWkKIDiv4JxVnq6VOus92ahLjy2ACM
	eeMXxUZmhDQ+5oRIWdalml06PUk3Fa4lz7KmWF5nGiIwJGntvExo74ajYRUGws4JcxxenC8hIP8
	Zt3U3sovdtCPuj9oFhXOR5F58UtCHP6dqgER0haaAg+tcWRWj8EWJRvXH1x3sN3yXjeaYCYDBy4
	avzpN/WI+p4K15hhh4P7eSie8Umn9gfOmhiwuvx4MBc0/MrtrTg2LKuaNbSuUiMzk6qEVWAyj0m
	go3DB+qHXM8ZEQ=
X-Received: by 2002:a05:600c:46cf:b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-4a18e4a3ac7mr390482335e9.5.1792045942037;
        Wed, 14 Oct 2026 23:32:22 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1bd9a8a22sm52340755e9.5.2026.10.14.23.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:32:20 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:32:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Message-ID: <atByyAg-c8v_IiAj@monoceros>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261014074516.240247-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_233224_007804_A71905DF 
X-CRM114-Status: GOOD (  11.60  )
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
Content-Type: multipart/mixed; boundary="===============9160708972624884542=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9160708972624884542==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2wqyi6vrkxoccpli"
Content-Disposition: inline


--2wqyi6vrkxoccpli
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
MIME-Version: 1.0

hello,

On Wed, Oct 14, 2026 at 03:45:14PM +0800, Inochi Amaoto wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id and
<linux/mod_devicetable.h> pulls in a looot of dependencies this driver
doesn't need. So please drop the latter.

> +static const struct of_device_id sophgo_efuses_of_match[] = {
> +	{ .compatible = "sophgo,sg2044-efuse", },

s/,//

> +	{}

s/{}/{ }/

> +};
> +

Drop this empty line

> +MODULE_DEVICE_TABLE(of, sophgo_efuses_of_match);
> +
> +static struct platform_driver sophgo_efuses_driver = {
> +	.driver = {
> +		.name = "sophgo_efuse",
> +		.of_match_table = sophgo_efuses_of_match,
> +	},
> +	.probe = sophgo_efuses_probe,
> +};
> +

and this one, too.

> +module_platform_driver(sophgo_efuses_driver);
> +

Best regards
Uwe

--2wqyi6vrkxoccpli
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrQc3AACgkQj4D7WH0S
/k6AXAgAiAV2USgEzQOtvljyc8VbWNuSTr9JlXOIb2McAei2yOxSLalBc1rFQsSh
Z/UTyGYma1+gCD0MWFS1n4maltg+40KzZAzEwnGc7REEcSdkOYpss26bTQRHj4r8
R8DCErxJRfj7+lKnoNtLgK0hz28wPFBIp0YSPyCVkbQJF8N0hl5NhmR6cp+RykDI
u/DFIl+DUwm9fpHVxvTBWsHdigv8+CQ0HKLesoqDLD0RyTFiA3MMqg/g0cyA7qAs
6gqYBGn1ZjmuXbiAdTslU0ASU0cHgIthGhMK1IxTlwrU3MErYG35z24LQGMxeL88
Hz3oIY6HAz9ZzGxGZV38TB+eQMPs6A==
=jQo+
-----END PGP SIGNATURE-----

--2wqyi6vrkxoccpli--


--===============9160708972624884542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9160708972624884542==--

