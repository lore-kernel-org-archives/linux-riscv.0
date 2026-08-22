Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5560C5DF8C
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 13:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzmVLmNe0w+O0jVr8esRwelPfTnyCdXBBEiIJe3rwcQ=; b=3GlWGOyCRjf3wPI2/vdrXtfzZ+
	Z1ISXBbpshIW33F/XlkhbysU16BApoEU/s9w+Rrz9lMuFJRbbTY5Z7WXZyWnpdKHdFl0630MqP6mf
	fPjx8dBaBERpm0EzOGCLM8dRwL1okpMgjQ/9h026PWzG1zvKLIVq/KdvPTsAmjJ/N24BNGcAazWIQ
	zr0S/FTwMuEFhP/2LHD7vaWw/RYJX6hPCv0aB8DKWmJKY7DSVjoRpzwAhIQppqG4z8oUp4dadmCqJ
	FOBe827owbXrWbpTsH+UtkL9+A0N4LryXsjaxyzfHT0BGxv4wI71qwuKgKWEIm6QvA+f6FjW1BTdz
	KvNdmUoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxlyx-0000000EY6O-1OVA;
	Sat, 22 Aug 2026 13:41:59 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxlyu-0000000EY64-11Yr
	for linux-riscv@lists.infradead.org;
	Sat, 22 Aug 2026 13:41:58 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so352919666b.0
        for <linux-riscv@lists.infradead.org>; Sat, 22 Aug 2026 06:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787406114; x=1788010914; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aj3ZYubTvLgnR11pZYHVat4EVUJdKX6AnHgTVge4+Wc=;
        b=TfNXE18swEIt1N7xsh1DJPmEuGWtDR2uZfh88zBk6RiF/sTtI1YeKaQHX3iC1ENQWx
         tTxOZWd1cqoOoqIAJQ5A4MNNYqkT3wS1HgQTIpLCuyrkd0BE1n3vICUwawkV2aczE6OF
         RLNVQR8IUQ6TX7nz9oVP+kac1Cu/YMB4WXS/pad5zF4w+FlHA2gWgNbgSE/DVHvrw+1u
         /1xdR5p0kkVg+GIYP1knNszVKDYBkbBIKhjjO7HuQHnuvWm7okOZPtfRhVguiitAgTg+
         c7lkQFZovNQUdQp/DYsj/5+1V75xKKw2G8fH+KvQKRF/5agH+RZ6FLRST5qiROYsgSwg
         Xtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787406114; x=1788010914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aj3ZYubTvLgnR11pZYHVat4EVUJdKX6AnHgTVge4+Wc=;
        b=b8dNDYZD2BaMSrUBatYTQ2l1OBeOs8f6//i4FLVu6Jzu/HAmPf8wAEFIn/b+MBww6q
         fTG3zf8j8R4gqaCd2bvmeCJSGAt/KUS+/sMJbROVa7jLG620Dqj9VLmtaEaD2VvERAI5
         OZEye4De6DmvueyP3um0LxFTjom+n802ldaGxz+G0JsbKJjWKFnKF6ULp6fHB5ddZER8
         tEciF/xZ4Wz+G5sLhoYbsbqO3vvBGKgXI/V2atElcm4g3gDTljTUntMeOP1zQyvo43gb
         N2m+hF8iRuxFMQgAGM2ML7llnjoyQp+SNFtGoBV3UNBntvPkg3wMjsVd8WAdc3j81jp1
         q/gg==
X-Forwarded-Encrypted: i=1; AHgh+RoRjSD3EWTOinwIVfEIgh+Fi0ATffuZcSqAbidkhX0oDeczeAbxRqwRyeAaaFxvKIiUAbIlb/2VsCoruw==@lists.infradead.org
X-Gm-Message-State: AFuF++lEJ7c9LPGjUQxZNeQ4op340T76vpAeAKb9VXcFV42pvybDc6tJ
	UF2QaPW4AjrQcdOfdU0tOaX6ZVEtvtBnRRIEUkMh6t5AU8PUssOTWpOItJ+34yt/ApU=
X-Gm-Gg: AR+sD11FfrLT8NvFqaw43EG0g3QDsfX36VpbHCyhVesqzrKF/6IzdjtcBUBlurtav39
	yjhoS1UfFqs5f6KinaE0cI4sleZgEKmcVtSLocmAiQyu5D8z0+qOrZTMsCVQwvDj2ZjDYJ83ypL
	1wk41JEzQCYYmNB+3nnglu3MiCgEpV9fuIvbw4JTvd/YB/GYtZ8zRnl2N0b94XGJHa0i+fdb+G7
	turoxo8ZMV7puUUon0vAhG8fHgC3JqqkPXYzMxszFYp11mq4++zGkF8HjZH94NL9kD6cxQeD/uB
	+G2TIX4UEk/cFbRnIbY22ZlsIrJgzuka+AMj4WPKDNxjrTmPo0oiS6AbY71EZ3idPmszUDP/9Lr
	BybjFtKGU8GzKTgxO4KWJFWqih45qRu4GM7hRPO6FjHs/ayopocri9CaEbA3ED2mpOEiM8rZ06d
	eWnUwBdMU+fHtk+P0e/olbybgc3fucv1PO5IM68bPj6A5I5S9Pc7FAihfLjMY+yH9jYQ==
X-Received: by 2002:a17:907:8908:b0:c21:35d0:f435 with SMTP id a640c23a62f3a-c24924db408mr547750766b.10.1787406113365;
        Sat, 22 Aug 2026 06:41:53 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c249606a8fasm387614266b.8.2026.08.22.06.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 06:41:52 -0700 (PDT)
Date: Sat, 22 Aug 2026 15:41:50 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Kees Cook <kees@kernel.org>, Joel Granados <joel.granados@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	kernel-dev@igalia.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	fsverity@lists.linux.dev, keyrings@vger.kernel.org, bpf@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wpan@vger.kernel.org, lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, linux-sctp@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-s390@vger.kernel.org, bridge@lists.linux.dev, mptcp@lists.linux.dev, 
	rds-devel@oss.oracle.com, virtualization@lists.linux.dev
Subject: Re: [PATCH RFC v3 03/13] sysctl, mod_devicetable: add macro
 MODULE_SYSCTL_TABLE
Message-ID: <aomlfGJM61qZKxx2@monoceros>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
 <20260819-sysctl-module-aliases-v3-3-aab90569365d@igalia.com>
MIME-Version: 1.0
In-Reply-To: <20260819-sysctl-module-aliases-v3-3-aab90569365d@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_064156_600620_DE3C0A84 
X-CRM114-Status: GOOD (  14.74  )
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
Content-Type: multipart/mixed; boundary="===============7422012452489464130=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7422012452489464130==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="akn7oxv4v2qk2wdq"
Content-Disposition: inline


--akn7oxv4v2qk2wdq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC v3 03/13] sysctl, mod_devicetable: add macro
 MODULE_SYSCTL_TABLE
MIME-Version: 1.0

Hello,

On Wed, Aug 19, 2026 at 03:16:16PM -0300, Mauricio Faria de Oliveira wrote:
> The MODULE_SYSCTL_TABLE macro emits a struct module_sysctl_table variable
> with pointers to a sysctl table's path and entries, and table/entry sizes.

That new struct doesn't seem to contain any pointer?

> That symbol will be handled by file2alias.c (modpost) with the changes in
> mod_devicetable.h and devicetable-offsets.c.
>=20
> The option macros MODULE_SYSCTL_TABLE_{DISABLE,UNIQUE_ID} can be used on
> a per-file basis to disable the macro and change the symbol name pattern.
>=20
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> ---
>  include/linux/mod_devicetable.h   |  7 +++++++
>  include/linux/sysctl.h            | 42 +++++++++++++++++++++++++++++++++=
++++++
>  scripts/mod/devicetable-offsets.c |  6 ++++++
>  3 files changed, 55 insertions(+)

Please put the new struct in a separate header. Apart from not being
about a device table, I'm currently work on removing
<linux/mod_devicetable.h>. See commit
ad428f5811bd7fb3d91fa002174de533f9da94d7 for more details.

Best regards
Uwe

--akn7oxv4v2qk2wdq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqJpxsACgkQj4D7WH0S
/k5bfgf9HJoNnVEr9RCdAghOTP5QqFmH5ae7Kbmnodv6c6Pi9JGIjjGbeT5eKw3e
JkSKqdEnlVMrLoKrhneRsxwTDGPrZvrLZrPLdZwJmPWZn5Fg+kkOO9yFAGPeMsPX
S6UP1NY9kaCiBtlcsGT9EvMWz0jWVAWX1xb7Y2WcVZJsCWdcPhvWc3/lIbw3E4o7
PqLtSFblkQmtGl2OL4WkP6xhEPH6qQO9BAmhLVKKZwFW5/l4sHmXRrpgSJlroR3b
iH3liIeS6wxFp/fMYuFRryGHNMXn6gC447OnOCTmGNEj7+7Y3COwSGivgubcRIzI
RkmxkMf2Iuntnwp4oQzCbipE5EiKGA==
=SPY4
-----END PGP SIGNATURE-----

--akn7oxv4v2qk2wdq--


--===============7422012452489464130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7422012452489464130==--

