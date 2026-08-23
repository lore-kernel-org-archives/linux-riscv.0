Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A31C5DF81
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Aug 2026 22:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sX+oT890EBgTv2wBCt/njNDdxsygiB4y6sd9fwwhtYQ=; b=uVj+BYwZvMn1AOR/coJleBk1RC
	Qbqtg/Cq7l1NEO3sISSNhqldcikPw7QBuwoq1eeB95dVaKUGzfvMWcauhZUCakrxfLdx0x+prLlt3
	dZ6eFSShAXqhDK055lXIsuXrM4CUuIJU1qZEPXjQWqaBp5jnVXiBYvn32ZVJxTob8oSaaoFntvdu6
	nWCBC/ed5VGwdq2hP/bigDFqJ/KLoCh6skV5vc5qylXdBlr0KOjN/DrsPOLUOqD7lm+RtIibcsPju
	73mMMQGsyA3XVLpIrehfKWGTr7B4yuaTLAIZAd4ZZ21bzh0bte8pNSdXavf3HMYbPS9UuWz4HN9tt
	s7ekj2sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyGQp-0000000FdMW-3avi;
	Sun, 23 Aug 2026 22:12:47 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyGQm-0000000FdLe-0b8X
	for linux-riscv@lists.infradead.org;
	Sun, 23 Aug 2026 22:12:46 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso4955060a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 23 Aug 2026 15:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787523160; x=1788127960; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=//7iEXuM0dwaErrYwlxiIsbco7Xb10BSWAJJRQqIeEQ=;
        b=mNSuwIO2FTYerrL0naphlu7SpZpfbbW2NwyZ52NoRLixEIz24Jmky+/71X+HksuTAH
         HqwD3ce29R3oe1kBG2FBfH+U19GdYLn99KlAtRXBzMlxgVnCGIeo9rK0PiCbfkraIPht
         9wXQbDNLM8Fr9tSz+8kV+NS/n/aU11Ak5UTcKikISqr1hsPWukjl1N//fMGxwGW6YKJw
         DTumPojrfJACOOrKOkQ2B4T7nEV/4FzlvrvBeq5FX8Ra77v6vwY+lx25PYSt7HYWnSBO
         3qR2ImaaECaV4OnITc25TT1EiGqDFIHyDtc/qqY3pw/jXLRLnJB9omqSt1sRfmEVqU/4
         NfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787523160; x=1788127960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//7iEXuM0dwaErrYwlxiIsbco7Xb10BSWAJJRQqIeEQ=;
        b=L7qbE33JQCk3tz+NZ7mriCxwNGJb0475As3OxrIsv/Fp1XcAPOkokrhDEZumIZqAWI
         hXF0y8V7ldYNd9inD5GOJ5UhkxIT8CqTLS2sewtOlYWn6achhoaG5m1DPfEzMtqO2byC
         q7CIEt3Y4sMOBPxQpQ2WLRBGxUt0GnDLqkwGlqJhdBugYzB8k2mwMs9OL0BsIEls+lDS
         dKIOgnIMKBTKli0zpnfkjbiODTmuGZ1L18/m1prRzEEG5oqKds5ACvM6ZeQ5b5nj1YYZ
         MCkcmn+0Pt5fU/V6nCV1l5rFQR7ttLvR8Aar4KZMwWhW209YEY1Vx+oEkich4QqiKFLF
         E6iw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0/iyqm5FCyETl482bmQOeUPInfXCCvKxzakqWEwBh8knx1Z9b7tIRJbQE6TDIDLyM8nVMIaICIMSVZA==@lists.infradead.org
X-Gm-Message-State: AFuF++n5lyoP/1+IiUKeWgJDcZ4xPIkBW0g5s8BtiUuNIcvzaAs4XH+Y
	4i6CXfQPyHzEEL9C0hXjMwADCTw9tXtAWv64NTgm5w4QNqumsr4VUbyUY9etsENEnZ8=
X-Gm-Gg: AR+sD13N1gIdZMwUYNwEZJX90C5ukyGIA3AQaHMpH02nKhVPWeYAZQ6aJATBJQBTYVU
	O4FZN2xAMoxNYV4uDPc6E6ExFjU6ETjuzLiOjQA+JuimQ2bZaTGpZywRXaZ9qZXGTYH5mD6XX7v
	+HG88muAwadOOrNF3OlLq1Hen7iHqzFcNSPpCqWb+81s3i6OE0unp+mwEKB9oNiazjlF+zm/iHE
	oNuAO4fQUucIgmgdfYMG9Lq32yBsg6hxASFBBQv7QndyxEQLXb76cjrK6taJF3C2l0KyArGXBQa
	Nf6lzhKzrqluIiQ2zpTEuyDrTiAWvN8urfAmdRVMGZmPHDJsuGaTDGwZ9aa/ZzQWZ9tsxR6qlYk
	igxCnCc2EKFLx1q9aI0woSx1DfbjcLHtdleCJC0gV9zx5a0FcgEdt0CPUbb4vnL86x9+TkojCSD
	ycH/EG7jm5K2wWJ2TLclORvAhLB+UdM0kh9eTtDS7uoNxaV7p6CdjfoNin0sF0XNzHwAG6+Ev7q
	zK1
X-Received: by 2002:a05:6402:505b:b0:69c:811f:8f5 with SMTP id 4fb4d7f45d1cf-6a42f1b9325mr25356134a12.6.1787523160405;
        Sun, 23 Aug 2026 15:12:40 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6a59e00108asm7547158a12.2.2026.08.23.15.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 15:12:39 -0700 (PDT)
Date: Mon, 24 Aug 2026 00:12:38 +0200
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
Message-ID: <aotteDcc588iwC6g@monoceros>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
 <20260819-sysctl-module-aliases-v3-3-aab90569365d@igalia.com>
 <aomlfGJM61qZKxx2@monoceros>
 <4e3eaf1d3419e808be046035f114bf6c@igalia.com>
MIME-Version: 1.0
In-Reply-To: <4e3eaf1d3419e808be046035f114bf6c@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_151244_234041_C0FDF73A 
X-CRM114-Status: GOOD (  27.49  )
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
Content-Type: multipart/mixed; boundary="===============6833198515318681918=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6833198515318681918==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6dsww6grbwx7uy7i"
Content-Disposition: inline


--6dsww6grbwx7uy7i
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC v3 03/13] sysctl, mod_devicetable: add macro
 MODULE_SYSCTL_TABLE
MIME-Version: 1.0

Hello Mauricio,

On Sat, Aug 22, 2026 at 01:57:24PM -0300, Mauricio Faria de Oliveira wrote:
> On 2026-08-22 10:41, Uwe Kleine-K=F6nig wrote:
> > On Wed, Aug 19, 2026 at 03:16:16PM -0300, Mauricio Faria de Oliveira wr=
ote:
> >> The MODULE_SYSCTL_TABLE macro emits a struct module_sysctl_table varia=
ble
> >> with pointers to a sysctl table's path and entries, and table/entry si=
zes.
> >=20
> > That new struct doesn't seem to contain any pointer?
>=20
> The struct module_sysctl_table fields .path and .table are pointers,
> although with kernel_ulong_t type so that the same 32/64-bit size is
> used in file2alias.c based on KERNEL_ELFCLASS (and not on the host,
> which might differ with CROSS_COMPILE).

Cross compilation isn't an issue for the already existing device id
structures; many of them also contain pointers.
(While modpost doesn't use the pointers, the size of the structures must
be known to correctly interpret the arrays.)
Also sizeof(long) differs between architectures and I can compile for
arm(32) just fine on amd64.

Additionally there is hardware out there that has sizeof(void *) =3D 16
but sizeof(long) =3D 8. Up until recently I worked on mainlining that (and
it has business reasons only I stopped, so I guess and hope I will
continue at some point in the future). See
https://lwn.net/Articles/1037974/ for some details if you're interested.

I would be great if your series didn't introduce a new obstacle for
that.

> >> That symbol will be handled by file2alias.c (modpost) with the changes=
 in
> >> mod_devicetable.h and devicetable-offsets.c.
> >>=20
> >> The option macros MODULE_SYSCTL_TABLE_{DISABLE,UNIQUE_ID} can be used =
on
> >> a per-file basis to disable the macro and change the symbol name patte=
rn.
> >>=20
> >> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> >> ---
> >>  include/linux/mod_devicetable.h   |  7 +++++++
> >>  include/linux/sysctl.h            | 42 ++++++++++++++++++++++++++++++=
+++++++++
> >>  scripts/mod/devicetable-offsets.c |  6 ++++++
> >>  3 files changed, 55 insertions(+)
> >=20
> > Please put the new struct in a separate header. Apart from not being
> > about a device table, I'm currently work on removing
> > <linux/mod_devicetable.h>. See commit
> > ad428f5811bd7fb3d91fa002174de533f9da94d7 for more details.
>=20
> Sure; I looked at that earlier (thanks for the instructive commit
> message, by the way) and found the new struct to be similar to "struct
> cpu_feature isn't really a device_id struct" (not moved), but apparently
> missed the trailing "fow now", which is clearer now. Fixed for v4.

Yeah, I didn't move that because it was an outlier in the header as it's
not a device id. IMHO it should go to something like
include/linux/cpu_feature.h.

Best regards
Uwe

--6dsww6grbwx7uy7i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqLcFMACgkQj4D7WH0S
/k74fgf+L2E+C5s7/Uv60MggM8SluqqYOIYVRQMrJ0YZ292Po2lSpcrxuhUuQU2B
oXhO4fsc1HgZsK331x/O/bMuTOPLltQaKOsxLiMi24UglNQqmujyzSUFLnsr9NlL
1xjI1icd6tMaie8k1PK7ynotnvtfYE9Fbl/52MAUgNFbTbWqnaXhNv+fzm/C72Cc
xjp+GuDi0DimbriiFBYP3aUccUEUCgsrwh3Zwss3iQSaV2gZ3Y+jYlUBB3YlBSZQ
+m5a8ZWC4FeqCD+8NXyqc01adbOF9gkilqmoa2KsUhRY9+jPqn0pQhpfPxEl6Lf9
/YNG96sk855Er0BHcQ1R8Pg+AcsRrg==
=t37g
-----END PGP SIGNATURE-----

--6dsww6grbwx7uy7i--


--===============6833198515318681918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6833198515318681918==--

