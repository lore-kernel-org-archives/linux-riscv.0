Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78207CD4F59
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:References:In-Reply-To:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oHIx0HYMLeNq8EtrgYf32zy/A9TTGJiaElxMkh3soc=; b=abkAqRFHeIUbIr4PYTt5JJwIVd
	Rvqwai248g/4s+U60XdXCW05MdFt2FESK6mFgDFRvYXbN+O0LAFyzX+diHwu5JhTRTYRmMb94LQxj
	TvqU/JtR582FP3vljTHSZ5CZIwfuR4sntyoEQXDE6Hte+dm8VXHwBu6aDurlbCGEtLqhr97xSPSBe
	v/UKhne8MuxP4M0rWU0rUYjRWZHoarxBMai51YOiTJBd/sowkZpNcUT53NOTAOe+xRm86/LiG4rRf
	NQKALB/8J9bPFVPGBEMiCjT/AbfA2xvCCgbgX6FczAqzhbxvcx2W6tI3ZkvBE4q4mMJ1azCI3I2+W
	A6gJ08XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm76M-00000007OkP-1etA;
	Thu, 05 Sep 2024 07:40:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm76J-00000007Ojv-2OLK
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 07:40:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42bb8cf8a5bso2967245e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Sep 2024 00:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725522017; x=1726126817; darn=lists.infradead.org;
        h=mime-version:date:references:organization:in-reply-to:subject:cc:to
         :from:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BrJWzT+oqpfYL0FaPO0Aylp3pJEr+z8sjt0+5/naJYU=;
        b=lqsm5O7rqf0zOVjqsRYT5Wgtcwzv3+q3fzAN5tTfkhwlpqQMz0jvvUvhbqrsjMeDTx
         kkd6Qceo/OLZlBS0pWNxqbfilhmptn79MahMr4Te7isvU+5vL6t//W2D9F68PCjmw2Le
         lLwsUa8fDGXxHOYkCQizP3AR3o/PAgXpAc455YpGBGTcL6wETWoWJPAOVept7Hw0uvmz
         tV5hSfSEO3f49vGPw3szWHfHhOOsJa6b6oROL8scT3eZQi4tk45a6lbB6N9uvYl0tX76
         W8PIq8XASo/tyyDANqb+wUtS/riKrZR7TlzyUSgKMHe16b0BniTeOS0eTg4P3sK7IfSM
         5Niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725522017; x=1726126817;
        h=mime-version:date:references:organization:in-reply-to:subject:cc:to
         :from:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrJWzT+oqpfYL0FaPO0Aylp3pJEr+z8sjt0+5/naJYU=;
        b=qvLuwCdQjCZSVc6yGSk9ik41262W7DqYcVAaZ5OZKzCzSp4i8MPB9Ua7JfsW/hDTS/
         kn1umAScj3eVOZErgKR83yQdymG/4MLoA1fB4o5P0q5AZ15ftHn2AuVOMX+cN0PmylfQ
         gwIs6J4F5W3vbmkvq2WZC7xr5k0eSMXepLIQWH/2SkRv1uYH7Kr5u6oGT223qpjoOh2M
         OsA56EZes/UyoaT0nWHDdxHhLXVY8yhEM/zKarsFFmo/PBiTpYewWE1Vuaj5tyCq1Orc
         e4SSMFNVv8tNtcWtvppvBxPswHa2iM9O/vojbWKbiT5ZlVFyH5ezABChb5sbEEv0Cz6a
         y+hg==
X-Forwarded-Encrypted: i=1; AJvYcCVb8rD88HsEuyWZtyH0SpidIMFwXMATNWMnh8lbFiwjnHk8Dvxb6LA2WbJKv5s0zKol8QSVDZpUetOp2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBdTBR6jgW5vBN6beIkx/i7l/H6D0Df7q+ISRU6CfGo0dltr0L
	bTUpltnEBfX1KIo9l3dcJg9Kg9eo69OK8RYW8sgOCk60FZVWdCJW
X-Google-Smtp-Source: AGHT+IHhY+hjD4ev3F0K4g/Zu8goQEHzNXqZkyZnaPvkXywWr1n17U3NOrSqtqZv4mj7W4/7YnTZHg==
X-Received: by 2002:a05:600c:4691:b0:426:4978:65f0 with SMTP id 5b1f17b1804b1-42c9545e5bbmr37987805e9.18.1725522016842;
        Thu, 05 Sep 2024 00:40:16 -0700 (PDT)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749eea60e2sm18611100f8f.62.2024.09.05.00.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 00:40:15 -0700 (PDT)
Message-ID: <66d9605f.5d0a0220.3dabb6.3586@mx.google.com>
X-Google-Original-Message-ID: <87plpilfa9.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: paul.walmsley@sifive.com
Cc: palmer@dabbelt.com,  aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,
  jesse@rivosinc.com,  conor@kernel.org
Subject: Re: [PATCH v2] riscv: hwprobe: export Zicntr and Zihpm extensions
In-Reply-To: <20240820044749.557349-1-mikisabate@gmail.com> ("Miquel
 =?utf-8?Q?Sabat=C3=A9=09Sol=C3=A0=22's?= message of "Tue, 20 Aug 2024
 06:47:49 +0200")
Organization: Linux Private Site
References: <20240817075629.262318-1-mikisabate@gmail.com>
	<20240820044749.557349-1-mikisabate@gmail.com>
Date: Thu, 05 Sep 2024 09:40:14 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_004019_669827_7B08564A 
X-CRM114-Status: GOOD (  17.46  )
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
Content-Type: multipart/mixed; boundary="===============5857852259568157119=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5857852259568157119==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dt., d=E2=80=99ag. 20 2024, Miquel Sabat=C3=A9 Sol=C3=A0 wrote:

> Export Zicntr and Zihpm ISA extensions through the hwprobe syscall.
>
> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mikisabate@gmail.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>  arch/riscv/kernel/sys_hwprobe.c       | 2 ++
>  3 files changed, 10 insertions(+)
>
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index 3db60a0911df..cfd2929d0562 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -183,6 +183,9 @@ The following keys are defined:
>         defined in the Atomic Compare-and-Swap (CAS) instructions manual =
starting
>         from commit 5059e0ca641c ("update to ratified").
>=20=20
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICNTR`: The Zicntr extension version 2.0
> +       is supported as defined in the RISC-V ISA manual.
> +
>    * :c:macro:`RISCV_HWPROBE_EXT_ZICOND`: The Zicond extension is support=
ed as
>         defined in the RISC-V Integer Conditional (Zicond) operations ext=
ension
>         manual starting from commit 95cf1f9 ("Add changes requested by Ved
> @@ -192,6 +195,9 @@ The following keys are defined:
>         supported as defined in the RISC-V ISA manual starting from commit
>         d8ab5c78c207 ("Zihintpause is ratified").
>=20=20
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZIHPM`: The Zihpm extension version 2.0
> +       is supported as defined in the RISC-V ISA manual.
> +
>    * :c:macro:`RISCV_HWPROBE_EXT_ZVE32X`: The Vector sub-extension Zve32x=
 is
>      supported, as defined by version 1.0 of the RISC-V Vector extension =
manual.
>=20=20
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index b706c8e47b02..098a815b3fd4 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -72,6 +72,8 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
>  #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
>  #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
> +#define		RISCV_HWPROBE_EXT_ZICNTR	(1ULL << 49)
> +#define		RISCV_HWPROBE_EXT_ZIHPM		(1ULL << 50)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index 8d1b5c35d2a7..910b41b6a7ab 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -107,9 +107,11 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *p=
air,
>  		EXT_KEY(ZCB);
>  		EXT_KEY(ZCMOP);
>  		EXT_KEY(ZICBOZ);
> +		EXT_KEY(ZICNTR);
>  		EXT_KEY(ZICOND);
>  		EXT_KEY(ZIHINTNTL);
>  		EXT_KEY(ZIHINTPAUSE);
> +		EXT_KEY(ZIHPM);
>  		EXT_KEY(ZIMOP);
>  		EXT_KEY(ZKND);
>  		EXT_KEY(ZKNE);
>
> base-commit: dc1c8034e31b14a2e5e212104ec508aec44ce1b9

Hello,

Can I get a review on this version of this patchset?

Thanks,
Miquel

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCgAzFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmbZYF4VHG1pa2lzYWJh
dGVAZ21haWwuY29tAAoJEJa+jG/YnWVluYoP/A1lDIQtj5Md7JVB1iPmxF/VAfeV
+sW5RsLPOGlPiU+yMTrjNN4cht2zcW49rC9EdQwEE0rRMcX6PzaCW0l+k8N+OZ0e
FAKng3GGRMPOcTgGogz1kB2ZqpT7Sg/kUB2+6m+aJniUDTvX6VoqcRtHyWFUsaz7
mHra0/Cos/1tfl80blyv0Rk5sGXJTDYAjS+K01YzLrJiLqQ1/WbEAFerBde2M8Vh
8WV3tmofbtUs40gD0Kc6hO29RdXAzXr3NzeSlyIVmpNDaK+rUEYbMcwugdUoCR5S
EHM5o7Ky4rr0SmjsDpepp/gr9CEjwInj6PAZNm7TXh4Ebc/WoalQ67SYQyWGbPOQ
z1266zxcAooOcWXAbquyzHnbONrLc9VxSCBazb9/n9Kcv9CZrhFSmGsoleHsoyND
0euA4nUF1/2oGg2VGpdWutArhBbOfTsLBAB+DGmBhfMlKELOpbGm+G8DcbjTMF4d
sxvDDcmV4VBHWFORCc61xmkVhhGGqd5zR7ouj2lZEVIBYTOel9PY9nNR7gD6I/98
h8RECViJIEEtCAkeqi1Y5ue0g0i84Zuor7QD6SgXc3kCJfq/oYNikviSGOqEwX9T
R4e15GBU5NKCUKKpMydlec/eJ4Iocu3mMJ3tfHv2rpAubnyacObV2mSvgVX/cAPh
pQBNJvV014ek1Gnn
=4v9i
-----END PGP SIGNATURE-----
--=-=-=--


--===============5857852259568157119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5857852259568157119==--

