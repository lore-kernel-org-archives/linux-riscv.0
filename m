Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9787FC3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 04:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:References:In-Reply-To:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlZOQZg1H9wqBrjAHTIPzXn48Ky7RZwYGMRK7155uAk=; b=q2RYHV4TLo5ENE/Yzqa63QrXRz
	KcxX3mob/EGpe9IahNhcp3bH8YgsQ0X8Um9/PPfqa0oyDqxZOzdqk4n5tJ/O6kC80fRUOOD/PwBQi
	hFXpfUDdXjE4ZGY/yTBb55vxFnzuuq4P6ML0noaGW7qLjLuhV1KpeCmIApxnbJ8pmfrvz+9WzJQ1J
	bk+4JI76jeiLDkzHo96NUFTq63rKCgArXReYyMp5sO8KRP9LuJgNiv4u4DcUNr/d4n3AxlMgumasS
	/Ti6WqxMAykWd1fAZgJhs86RrhfWNcO1vYl+3dnyW1HOvEmiiO1RuFUDj6T7/2c47X/56OZQeYYxC
	c5PmnV+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgGIy-00000003kgR-3OZ3;
	Tue, 20 Aug 2024 04:17:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgGIv-00000003kfe-0cIc
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 04:17:10 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-429e29933aaso38111385e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 21:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724127426; x=1724732226; darn=lists.infradead.org;
        h=mime-version:date:references:organization:in-reply-to:subject:cc:to
         :from:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6nYfQ+o335s4lQFgidQZ6kpGNIQuA2JJ4wgm0P608e4=;
        b=PidSd+Q+lI/p41WLTLiw5K3nCrrokE0k5d5IFIy9o0o/2Jsd9FNCImoci3bV9vyQxi
         msAWz2LfDTgZI0b5+MzhbyXtW2D9V0Eqa6n23sX+o49Y+P9FTTDGzhBv/bKdaNe+JxsU
         R2Xm1deUv0y+6qSoItdCdRr2/PwsjYPfiTLOUmfSpwCBzQY20v0cYk4uRiUuw33kwSZF
         +LHbMJDM1CqgjV9x6FSp14rmOhQ+00EHnTgbPFKFAy+EsF+8Zy3uQtt+jwobHeLiEZmY
         KTSW4oGfDhBIperkPhCQRM7LejCrpuEENGL1k4jtsd3YizBeWJKIWaqPmWMu52ckaGpn
         9bwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724127426; x=1724732226;
        h=mime-version:date:references:organization:in-reply-to:subject:cc:to
         :from:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nYfQ+o335s4lQFgidQZ6kpGNIQuA2JJ4wgm0P608e4=;
        b=HUjloUTDDopDYv4lJgHoTIyz5QIHlfyP/DgeDnvRs9Z43vnVhCGWUoTVEqmWT6Eh9D
         1D0uL9oOV3vjylxjOkQ5eVeNkxXu56boxidlFl+8I2KGgDOYJzHanDqlwf9WD0PdHZ/a
         JOyKesvtHVpUXZivRIUJssnBeFeukHquWBTDI4QRp4PS7BoA7xnk5pMAkdKCBHnC61uZ
         nfhqmok3jajJGG61PaXMtlvoWEmHf2ELS/IyJSDLCD5EO6eKO8KGsN1TyiOJRHOEGD3r
         wCQatSdY6GpNA7Tt/b0r4Hd9NgtMfdStciL+r7jS8KJM4o803+X3T4h4PaLRkK7uP1nd
         7hKg==
X-Forwarded-Encrypted: i=1; AJvYcCWjfnAdCgQ7wllH7vUPYyrrivZZUVRzF5KMEZNl/nq+3nYAOgM3y89FktxqGmxR7y9PNX2A4K3qeR2ZdY/0gGutz0ldHNZgTM2JT3Kuy9CZ
X-Gm-Message-State: AOJu0YwDgnKsVCFhqBaNvqTtEv0klS5gDDH+aiAjp7AWUH6k5AAT1Lhk
	bxEuPE3WsBCQRF4eAwPOul+CMO5xu5AsOpwdlEVzvr8Fw+LqobqG
X-Google-Smtp-Source: AGHT+IFa5O3qI/O3a1pmL/zJlrIrTISpfHzoSNo9no9vBFGzyQLakuLu7bSel3CoZx32dgrBswTlpA==
X-Received: by 2002:a05:600c:4f89:b0:426:5c9b:dee6 with SMTP id 5b1f17b1804b1-429ed7e42f9mr82235865e9.26.1724127426322;
        Mon, 19 Aug 2024 21:17:06 -0700 (PDT)
Received: from localhost ([2a01:57a0:1620:4000::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed650759sm127209705e9.14.2024.08.19.21.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 21:17:05 -0700 (PDT)
Message-ID: <66c418c1.7b0a0220.6faf8.1929@mx.google.com>
X-Google-Original-Message-ID: <87bk1n7rr3.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jesse Taube <jesse@rivosinc.com>,  paul.walmsley@sifive.com,
  palmer@dabbelt.com,  aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: hwprobe: export Zicntr and Zihpm extensions
In-Reply-To: <20240819-unclamped-cheek-9b4851bed13f@spud> (Conor Dooley's
	message of "Mon, 19 Aug 2024 18:34:09 +0100")
Organization: Linux Private Site
References: <20240817075629.262318-1-mikisabate@gmail.com>
	<CALSpo=ZsZWNm_cXG_4GXyZ9invSS_eKH=9Q-mdoM2XV=HwzOXA@mail.gmail.com>
	<20240819-unclamped-cheek-9b4851bed13f@spud>
Date: Tue, 20 Aug 2024 06:17:04 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_211709_212394_328DDAFA 
X-CRM114-Status: GOOD (  23.68  )
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
Content-Type: multipart/mixed; boundary="===============7969239932922176529=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7969239932922176529==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Mon, Aug 19, 2024 at 01:29:16PM -0400, Jesse Taube wrote:
>> On Sat, Aug 17, 2024 at 3:58=E2=80=AFAM Miquel Sabat=C3=A9 Sol=C3=A0 <mi=
kisabate@gmail.com> wrote:
>> >
>> > Export Zicntr and Zihpm ISA extensions through the hwprobe syscall.
>> >
>> > Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mikisabate@gmail.com>
>> > ---
>> >  Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
>> >  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>> >  arch/riscv/kernel/sys_hwprobe.c       | 2 ++
>> >  3 files changed, 10 insertions(+)
>> >
>> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch=
/riscv/hwprobe.rst
>> > index 3db60a0911df..5bb69c985cce 100644
>> > --- a/Documentation/arch/riscv/hwprobe.rst
>> > +++ b/Documentation/arch/riscv/hwprobe.rst
>> > @@ -188,10 +188,16 @@ The following keys are defined:
>> >         manual starting from commit 95cf1f9 ("Add changes requested by=
 Ved
>> >         during signoff")
>> >
>> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZICNTR`: The Zicntr extension version=
 2.0
>> > +       is supported as defined in the RISC-V ISA manual.
>> > +
>> >    * :c:macro:`RISCV_HWPROBE_EXT_ZIHINTPAUSE`: The Zihintpause extensi=
on is
>> >         supported as defined in the RISC-V ISA manual starting from co=
mmit
>> >         d8ab5c78c207 ("Zihintpause is ratified").
>> >
>> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZIHPM`: The Zihpm extension version 2=
.0
>> > +       is supported as defined in the RISC-V ISA manual.
>> > +
>> >    * :c:macro:`RISCV_HWPROBE_EXT_ZVE32X`: The Vector sub-extension Zve=
32x is
>> >      supported, as defined by version 1.0 of the RISC-V Vector extensi=
on manual.
>> >
>> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/includ=
e/uapi/asm/hwprobe.h
>> > index b706c8e47b02..098a815b3fd4 100644
>> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
>> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
>> > @@ -72,6 +72,8 @@ struct riscv_hwprobe {
>> >  #define                RISCV_HWPROBE_EXT_ZCF           (1ULL << 46)
>> >  #define                RISCV_HWPROBE_EXT_ZCMOP         (1ULL << 47)
>> >  #define                RISCV_HWPROBE_EXT_ZAWRS         (1ULL << 48)
>> > +#define                RISCV_HWPROBE_EXT_ZICNTR        (1ULL << 49)
>> > +#define                RISCV_HWPROBE_EXT_ZIHPM         (1ULL << 50)
>> >  #define RISCV_HWPROBE_KEY_CPUPERF_0    5
>> >  #define                RISCV_HWPROBE_MISALIGNED_UNKNOWN        (0 << =
0)
>> >  #define                RISCV_HWPROBE_MISALIGNED_EMULATED       (1 << =
0)
>
> The sort here, by number, is fine.
>
>> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_h=
wprobe.c
>> > index 8d1b5c35d2a7..30aede1c90ff 100644
>> > --- a/arch/riscv/kernel/sys_hwprobe.c
>> > +++ b/arch/riscv/kernel/sys_hwprobe.c
>> > @@ -118,6 +118,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe =
*pair,
>> >                 EXT_KEY(ZKSH);
>> >                 EXT_KEY(ZKT);
>> >                 EXT_KEY(ZTSO);
>> > +               EXT_KEY(ZICNTR);
>> > +               EXT_KEY(ZIHPM);
>>=20
>> Conor, do we care about ordering?
>
> I would rather that they were sorted alphabetically. Adding to the end
> is nothing but a conflict generator and makes it harder to see what is
> and what is not in the list. IIRC Palmer applied the patch I sent a few
> weeks ago that sorted the entries in all of these EXT_KEY() lists.

Makes a lot of sense. Let me send a new version of the patch with they
keys sorted.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCgAzFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmbEGMAVHG1pa2lzYWJh
dGVAZ21haWwuY29tAAoJEJa+jG/YnWVlcfIP+QEn+d6Py1HGavJblP1Osp5Q3kVS
jv0ay7yWo0uUftbQ/G45D1b/mKyEByEaKIDoNVic0i3jwlEkoGmyom/oqQw4NagC
5tNemOsZ2Z5HpYMfaSPM/qPfDRlmAXLJl+ltJUa8oNRQ8LK45Fg7FfDNNj5S2K22
JuYpTFP+EwqbxFP/ELlSLm4L/djLL95tWnNIgiS5CPrJHPtKD0TU05d/jQRVT2vm
xAcK+/zC1G5sZ9vwHvg6AsXr/5U+8g8vbVD91O4xg8H5E7gETKXSrHi9+jcseDtg
DiQLBkwFdVX9q0VUxCudDjJWmJv6G9K2nNW+GHMQjmzvLQaZAETF8lW5jvJxcMe6
smHKxDFtof1b5CHYJBDfBLptfH2/Lg4Uvg4yyQlou/nnrjQKXeWXkWJtwVkvuPx2
G1GZuarbi2PuPMnZ9zlJ2c1v4T+p4hkTL3B0oFqxmw3ZeCHqtoW1UsOtTLi9IcHI
y5F5GY4M/x5wOamFJcQJ9wPGxvIPjNFvmJospOQv7ULWdj5WHtequcT9SHFJ1VTz
o8u9YfIkhQGTpWtTOeuBdfdhmZSOCJ+oc+7g/R7r3ouxmulaCfCxCwNJofI40prM
sjBV/WsjaKV7bSARzhnZIA7mFn1jrxqHiq1G9NzUwYEjdRaYEBR9pr1c4cJCPKzi
eTNDHaVUxOu1eGJz
=aMf2
-----END PGP SIGNATURE-----
--=-=-=--


--===============7969239932922176529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7969239932922176529==--

