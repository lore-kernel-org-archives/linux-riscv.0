Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AECDC3ABDD
	for <linux-riscv@archiver.kernel.org>; Tue, 20 May 2025 13:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:References:In-Reply-To:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPpWwxVebVvEZyk9KTaW4aSb8P2mPneX57F7nLO/Ihw=; b=a60xRjCR2WtCa6Xf/WfD3ISRcd
	MrS9lxH9WJ3HRc2kvie9KodyXW93T53epzQjndT2MI/lXbqHK2+FR5XL5F6NvkfSJzMDf6IuZga38
	TI+nX6ALDFHGdGVjN/DfLaR/QXGo2haixyPyIVEkmTfFHveni1cDJYzECsij03ro1bIIsWjMNw+gG
	JrvZnOyh2hX+qKLHm+zslCC/AnzIrjdKkHPONVoY0ZxBGlMt4gRu1P4Ihby5foUulAhUscNFuxLCH
	QkZM1cLRDPGPgy7Nie+hhgpbhmf7Vx1a8ApVmwcQ+1y7PAcTfO4JMDfhVuYPqq6Z1BpTvYeed1ygE
	d1tmVc6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNLg-0000000D4O2-2fCf;
	Tue, 20 May 2025 13:49:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNLe-0000000D4N2-0Fmc
	for linux-riscv@lists.infradead.org;
	Tue, 20 May 2025 13:49:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-442ec3ce724so46360905e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 May 2025 06:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747748976; x=1748353776; darn=lists.infradead.org;
        h=mime-version:date:user-agent:references:organization:in-reply-to
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/H+J7Y2IQl+KErUeLmfltZI+DISRgsYDRtQcZhoOtM=;
        b=bo1rzdCt/OTU/+OIVJFfwrf9WAs0T+AWIeGr3QWrf4Vz/uN+B3gp+ODPrXaPa1RJJP
         mf/UM/WDTIdJh2X3tMBRJMVVAeAN1Vb4GRyef8knvwEqR0galkqluoEGXjn34vBc6vP6
         4xetWcxjwrXyGIq8b3HJ/L7ZB0l9+4qJ+z5xAQuUbpJ2VXI+zJrw9sd1ho0LO6KjcUmg
         kDQg9MtBet+j0P/eMf1Wymxq+P4V1wf/OBbdFytJF+eEOsOOOyjD8tzZERnt3lxZ7mQk
         Xmlwb6Wm8sIaG/6WFi36epl/OuNT/Nr9RN2AXNG0p1MX4DZaQmjSiMCEHaWlnhlK6JwB
         y16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747748976; x=1748353776;
        h=mime-version:date:user-agent:references:organization:in-reply-to
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e/H+J7Y2IQl+KErUeLmfltZI+DISRgsYDRtQcZhoOtM=;
        b=utMlv54fQb0E+mBZe4hyxhXTGJd4GyDAG56U9TB/JW0tNruusMcT4Prd1r+tng7HTs
         6E98ee5zWJ8qYGU3g3Sj6Jo9FfHERfAvPkpDVAmzhSsgayiCUJQT9G5lKY9Gd+0adH3d
         x+YLJaVLRvGuLedbL8SiCQYjUEmZY4VSFflL/kqlwrV7/XO0ujzd1oWcyOJPxrPw225I
         pp7pFn7+SXi5xadCSrpmnbe3vAMZuDc4wkqQ1YYGnWgxI8dD30jjis6+acny/QbmRC/y
         5hAxJLv3ef9fpdiYMqREPyA+xK5vHR5JVK0aPxN+2eVbBOy8M1iFQGwAGJdcyNY+eBdf
         TMAA==
X-Forwarded-Encrypted: i=1; AJvYcCXbcENYeKkQ4tUtBhywxOy+omfubMFmvuRvIOSNm7G2vHY96D6uubHcL+L6JNF4+tpREeIBk6QjskvFaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRB1JrsU2+sUyGzyBguUBxGhi2a+ka/Hq2e2VFaNtqfP/y8YnZ
	cz5XzmGBd+bHWwpo8R4cYIoFq6iiBQg7NJv+WwsbG/hiaNCLOsa59gvO
X-Gm-Gg: ASbGncsnLSPVJslk+sS+qE1qiz3XTqtZYJkMllBG49E6/ObZXNGI1WuNGVo0a8r7RNw
	j8kw9AoUmX0LnOONltjeOx5p+VR1P5l0iE+Jh2LXgGXwGFhx1iruuzC8I+LzNK3mhTyv4Z3fOFf
	E5GiwcH0pUniNTpTbyR4PDO3PzQ/PTxC4yHOIIzMc2xmRYlvv4nGSMfOk2CezfpO+O+P9ZCPn0K
	W9yIx/R8l7Nedm3TC0rCsxqEIaDFZ8rEYaAyDd97Fc9JMKAie1QqKj35KH3T0Y5zzS3ZkZPMljL
	yJmjQhm1U/vPsuMreOW4hAPRrRqQPAofNL0oLpNK6DXv
X-Google-Smtp-Source: AGHT+IGV7Ik0iErW2R41IzBFCJICNoHsWnaEi7YpCT8Xv7jKL33lMvHAnOXstzYy14Fuxb0xNr95cw==
X-Received: by 2002:a05:600c:35c8:b0:441:d43d:4f68 with SMTP id 5b1f17b1804b1-442fd63c6b7mr183624805e9.15.1747748975778;
        Tue, 20 May 2025 06:49:35 -0700 (PDT)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f3dd94f1sm33268905e9.35.2025.05.20.06.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 06:49:35 -0700 (PDT)
Message-ID: <682c886f.050a0220.e0f8b.72eb@mx.google.com>
X-Google-Original-Message-ID: <87a5778k9h.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>,  linux-riscv
 <linux-riscv@lists.infradead.org>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC] Making sense of RISCV_HWPROBE_EXT_* (new flags in version
 6.15)
In-Reply-To: <ac58daa5-7f36-4211-9be4-588e7723ad0e@irq.a4lg.com> (Tsukasa OI's
	message of "Tue, 20 May 2025 18:32:39 +0900")
Organization: Linux Private Site
References: <5967b18f-37bb-42c9-b8cc-6abf0e0bee3a@irq.a4lg.com>
	<3f1c4a0e-aaba-4adf-a6c3-421def945400@rivosinc.com>
	<ac58daa5-7f36-4211-9be4-588e7723ad0e@irq.a4lg.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Tue, 20 May 2025 15:49:30 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_064938_105519_CEB300E9 
X-CRM114-Status: GOOD (  37.30  )
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
Content-Type: multipart/mixed; boundary="===============5986011789100135284=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5986011789100135284==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

On dt., de maig 20 2025, Tsukasa OI wrote:

> Hi Cl=C3=A9ment,
>
> On 2025/05/20 16:30, Cl=C3=A9ment L=C3=A9ger wrote:
>>=20
>>=20
>> On 20/05/2025 07:25, Tsukasa OI wrote:
>>> Hello Cl=C3=A9ment, Miquel and all.
>>>
>>> It's too late to make changes for the Linux kernel version 6.15 but at
>>> least we need to clarify something.  I would like to hear from Cl=C3=A9=
ment
>>> and Miquel about your original intent of your changes and hear from all
>>> about your thoughts about the argument below.
>>>
>>>
>>> Background
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> While I am preparing for the riscv_hwprobe support in the Rust standard
>>> library (for target feature detection) looking at the master branch of
>>> Linux, I found three extensions in the RISCV_HWPROBE_KEY_IMA_EXT_0 key
>>> that would be redundant if we read the documentation pedantically.
>>>
>>> cf. Original riscv_hwprobe support for the Rust standard library
>>> (supports all flags as of Linux 6.14 except OS-dependent "Supm"):
>>> <https://github.com/rust-lang/stdarch/pull/1770>
>>>
>>> Here's the list (all of them will be new in 6.15):
>>>
>>> Commit 4458b8f68dc7ab8309291f1667157d0250938291 (by Miquel):
>>> 1.  Zicntr
>>> (Zihpm is excluded because the argument below does not apply).
>>>
>>> Commit 9d45d1ff90a6888f6138eb7e1f2619ef427831d3 (by Cl=C3=A9ment):
>>> 2.  Zalrsc
>>> 3.  Zaamo
>>>
>>>
>>> Base Facts
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> The RISC-V hwprobe documentation states that
>>> RISCV_HWPROBE_BASE_BEHAVIOR_IMA is either RV32IMA/RV64IMA (user ISA
>>> version 2.2 and privileged ISA version 1.10 with a few exceptions) and
>>> RISCV_HWPROBE_KEY_IMA_EXT_0 lists extensions that are compatible with
>>> the RISCV_HWPROBE_BASE_BEHAVIOR_IMA base system behavior (I'll call this
>>> the IMA base behavior from now on).
>>>
>>> cf. <https://docs.kernel.org/arch/riscv/hwprobe.html>
>>>
>>>
>>> 1. Zicntr
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> The user ISA version 2.2 has RV32I / RV64I ("I") base ISAs, version 2.0.
>>> However, "I" base ISAs at that time contain features now ratified as the
>>> "Zicntr" extension.  To be specific, the "I" base ISAs in the user ISA
>>> version 2.2 have changed as follows (with some extras):
>>>
>>> User ISA version 2.2:
>>> *   RV32I / RV64I ("I") version 2.0
>>>
>>> User ISA version 20190608:
>>> *   RV32I / RV64I ("I") version 2.1
>>> *   The "Zicsr" extension, version 2.0
>>> *   The "Zifencei" extension, version 2.0
>>> *   Non-extension: Counters
>>>     *   3 counters originally available in "I" v2.0 (later "Zicntr")
>>>     *   NEW: Additional up to 29 counters (later "Zihpm")
>>>
>>> User ISA version 20240411:
>>> *   RV32I / RV64I ("I") version 2.1
>>> *   The "Zicsr" extension, version 2.0
>>> *   The "Zifencei" extension, version 2.0
>>> *   The "Zicntr" extension, version 2.0 (New as an extension)
>>> *   The "Zihpm" extension, version 2.0 (New as an extension)
>>>
>>> In other words, "I" version 2.0 is roughly equivalent to:
>>> *   RV32I / RV64I ("I") version 2.1
>>> *   The "Zicsr" extension, version 2.0
>>> *   The "Zifencei" extension, version 2.0
>>> *   The "Zicntr" extension, version 2.0
>>>
>>> So if we think pedantically, the flag containing "Zicntr" makes no
>>> sense.  Of course, there are a few cases where this flag becomes valid:
>>>
>>> 1.  IMA base behavior should have been changed
>>>     (a documentation fix will be required to justify this)
>>> 2.  Denotes that native hardware support of basic hardware counters
>>>
>>> In either case, we will need to clarify somewhere.
>>>
>>>
>>> 2/3. Zalrsc / Zaamo
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> This is easier to tell but harder to justify flags' existence.
>>>
>>> 1.  The IMA base behavior contains the "A" extension.
>>> 2.  Both "Zalrsc" and "Zaamo" extensions are subsets of "A"
>>>     (in fact, A =3D=3D Zalrsc + Zaamo)
>>> 3.  Is there any case where the IMA base behavior is available but
>>>     lacks a part of full "A" extension?
>>>
>>> For me, it just looks RISCV_HWPROBE_EXT_ZAAMO and
>>> RISCV_HWPROBE_EXT_ZALRSC are always-on flags.  If the value containing
>>> these bits (key RISCV_HWPROBE_KEY_IMA_EXT_0) just lists extensions (with
>>> no conditions), that would be meaningful if the Linux kernel is changed
>>> so that the full "A" extension is no longer needed.  But because the key
>>> RISCV_HWPROBE_KEY_IMA_EXT_0 lists extensions *compatible to* the IMA
>>> base behavior, justifying this is pretty hard.
>>>
>>> If there is a case where these flags can be turned off and still valid,
>>> I'm happy to see an example and learn.
>>=20
>> While not technically required right now, there has been a series to use
>> ZALRSC to implement AMO (from MIPS) [1] and thus remove the kernel
>> dependency on the full "A" extensions. The goal of adding ZAAMO/ZALRSC
>> was to have a comprehensive support of RISC-V extensions that might be
>> useful for the userspace. Rationale was also that it was better to
>> express all the dependencies rather than letting the userspace make some
>> assumptions that would be hard to remove later.
>
>
> Thanks for the background!
>
> In this case, meanings of the key RISCV_HWPROBE_KEY_IMA_EXT_0 should be
> changed in the future (when the requirements are lowered and a different
> RISCV_HWPROBE_KEY_BASE_BEHAVIOR value is defined) but otherwise looks
> fine (and documentation update is only needed once that happens).
>
> And I understand that this is not worrying state for the userland.
>
> I appreciate that!
>
> Thanks,
> Tsukasa
>

From=20my end and the Zicntr inclusion, I have to admit that given the
documentation and the arguments you are bringing to the table, it is
indeed redundant if we look at things pedantically. That being said, and
as both of you are mentioning, maybe the requirements could be lowered
to enable the flexibility which is inherent on the RISC-V architecture.

Thus, I'm fine if you want me to provide a patch removing Zicntr in
hwprobe if that is inconvenient to user-space. That is, I'd still keep
it just in case, but if you feel that it's inconvenient or that it
breaks user-space in any way, I'm more than happy to provide a patch for
that.

>
>>=20
>> BTW, there are a few mechanisms that are unlikely to be used as well in
>> hwprobe (per-cpu extensions for instance, I do not think we yet have
>> seen such hardware yet ?). Ditto for per-cpu misaligned access support.
>> While potentially not popular, we try to cover the majority of the use
>> cases, RISC-V hardware being, by nature, flexible.
>>=20
>> Thanks,
>>=20
>> Cl=C3=A9ment
>>=20
>> Link:
>> https://patchwork.kernel.org/project/linux-riscv/patch/20241225082412.36=
727-1-arikalo@gmail.com/#26192228
>> [1]
>>=20
>>>
>>>
>>> Rust (userland) Behavior on version 1.88 or later
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>>>
>>> From Rust 1.88 (currently in beta and will be released on the end of
>>> June), the RISC-V feature detection logic (backend for the
>>> is_riscv_feature_detected macro) will start to use the riscv_hwprobe
>>> system call on Linux (before that, only auxiliary vector is used).
>>>
>>> cf.
>>> <https://doc.rust-lang.org/beta/std/arch/macro.is_riscv_feature_detecte=
d.html>
>>>
>>> Currently, these flags are not read by the Rust standard library
>>> (because Linux kernel version 6.15 hasn't released yet) but the behavior
>>> is determined considering existence of these flags (new in 6.15):
>>>
>>> If the IMA base behavior is detected, following Rust target features are
>>> enabled:
>>>
>>> 1.  Either "rv32i" or "rv64i"
>>>     The IMA base behavior contains "I" base and extensions "M" and "A".
>>> 2.  "zicsr"
>>>     This is inferred from the fact I explained in the "Zicntr" section
>>>     above.  It is also justified by the fact that Linux requires
>>>     the privileged architecture, which depends on the Zicsr extension.
>>> 3.  "zifencei"
>>>     This is inferred from the fact I explained in the "Zicntr" section
>>>     above.  Linux also has the CMODX feature which makes the Zifencei
>>>     extension in the userland valid but riscv_hwprobe doesn't provide
>>>     a flag for the Zifencei extension.
>>> 4.  "m"
>>>     The IMA base behavior contains "I" base and extensions "M" and "A".
>>>     It implies the Zmmul extension but this one is not supported by
>>>     the Rust's feature handling system yet.
>>> 5.  "a"
>>>     The IMA base behavior contains "I" base and extensions "M" and "A".
>>> 6.  "zalrsc"
>>>     This extension is supported by Rust and implied from "a",
>>>     making RISCV_HWPROBE_EXT_ZALRSC ineffective.
>>> 7.  "zaamo"
>>>     This extension is supported by Rust and implied from "a",
>>>     making RISCV_HWPROBE_EXT_ZAAMO ineffective.
>>>
>>> But the IMA base behavior alone does NOT enable:
>>>
>>> 1.  "zicntr"
>>>     I implemented the RISC-V feature detection logic in Rust more
>>>     conservatively than the documentation suggests.
>>>     It may make RISCV_HWPROBE_EXT_ZICNTR effective on Rust depending
>>>     on how future versions of the standard library is implemented
>>>     (possibly Rust version 1.90 or later).
>>>
>>>
>>> Reiterating RFC
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> 1.  (To Cl=C3=A9ment and Miquel)
>>>     I'd like to hear the original intent of your changes.
>>> 2.  (To all)
>>>     How do we handle this situation?
>>>
>>>
>>> Best regards,
>>> Tsukasa
>>>
>>> p.s.
>>> Just in case, I'm talking NOTHING about Rust on Linux (kernel mode).
>>

Thanks for looking into this!
Miquel

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCgAzFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmgsiGoVHG1pa2lzYWJh
dGVAZ21haWwuY29tAAoJEJa+jG/YnWVlAv4P/31mQNYiJ1Dfte+oEgPjAm/z9Vhg
16/aprG508W+6UstZfwqVYflx/AzE6k+j+kbGAFcNLirXoE25ST/DdOQtO9Igwv8
jkapIQ6zaZhNxXeTFIKDE2rrFET2F/1DRV61SnQb279q+0IkIUr20u7G53nuDv/T
vMPoeVjCbygesWAfrc1vq1v/Tf6npagGhJ2RCDP5b5bS4Q0SPKjdSNa6nQ8aRqp1
+/gNaxvt5iwHN5RhKgx5uQTERK4M0zi9KbGW5Gi9FAU7B0QowlyV+83H5Tc1TkP5
noQi92k5NqY2Ig5lk83xSisPkLDkiYllj9VjwlNZsAGQwBUuhirCRBjb+VqA8WST
XZfcssMtOHnh1dVGQ2GICHjmrn8bnYF680ni7lYa17dydu7p+BcdkxBAS095B7eQ
+Alrq5Px22UVWBhMp7ePb2lz47rFOyWxv/FxPyLTQ1qWrsgf2+cnhFYKUcMoW/iL
a8ii1RTzOhSokDIgQHFg6Q8JopSz+HWB6VBJpqROPcm1z5tCzgLy+ZQonDhRYije
7rg18w7HjZ60JSAJOJjvSQOLRO+mVPTR63w/B46qtVrkXIaJh9sWI8wwc0uphSVL
Edfzm1BCm9RRz1RzGAUis8UzDSJrVBYT1DwmTOCI5cKEUN2QH4ooCEr6fleYEwfv
wbT84hrRxtIhKsEB
=/7fZ
-----END PGP SIGNATURE-----
--=-=-=--


--===============5986011789100135284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5986011789100135284==--

