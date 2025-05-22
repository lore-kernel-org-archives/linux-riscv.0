Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8F4C54ED1
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 11:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:References:In-Reply-To:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjTo32F9IcpttdmrF1o5ORfR9Y1XWlMgalxvdmuFehs=; b=1dNyDIjOw6ul4zCd0kwarZ9zjI
	p3mfTK8mSm8TDHCDvcgixg+JwhNCiwjQZKPQgxunA2qdJpU0L9pyA53LH0VrL/qzG85N3phwJVM+E
	2AmgJXR94L8Vh80BAXeCCXGga8w+l8zjrQE3nvPC8ZtpGnOdpmez+N1vtU93RqgKpCcihRZ409Btr
	oIfa0ljPBLzdOlzM/QvM5fYeRIKTS5WiHppEY2gxeEskMoijCFXhIzpzqwzJrt4jsF5K9kbgI+erk
	I8W6/i/Ty+TTQVQyXIOrynAtmzV29QwErINqJnEVnQIUsndVwy2SVcjoloZWawtrqxtQJyilGH+hE
	DJcn7XuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI49U-00000000sFl-22xx;
	Thu, 22 May 2025 11:31:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI48f-00000000s8g-3dGS
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 11:31:07 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a37535646aso2931762f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 04:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747913463; x=1748518263; darn=lists.infradead.org;
        h=mime-version:date:user-agent:references:organization:in-reply-to
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzT1xLCCCdI/Z4mzpdUgqTWKsIF5xI+KCQ7RSMnDKTI=;
        b=mM/0fA1SkfH/c150ydpgfxmsS/tT/bRvgDW+69T42T2Dro20wkPENzaFh4Oxy75awP
         1j3B/jvkiz5J09FiBq+/z5YSMkXtD4HjYGVtO9krtJuBgXzs7NEOjh/yuMpCLUyAt3uN
         yuAvAZ3AbO9sjHaNccZMVKilD40nIrVWiJDW/V7ZkfgjU4C85Ne6SG60yPqCwzjgaMC0
         v3ehLUW/+6R1nd8Mg4l+LqeSp0a1gXCWVbKxKj0tuyVf4QL6FQCK4Kn1/00UWMpJPLdE
         0DUMfEK/yrZijXFTkJQkqNFV8B1uniaBR0Bu1e6VUV7PcdGAa8d9L9RAos0AR3CMpbbw
         pzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747913463; x=1748518263;
        h=mime-version:date:user-agent:references:organization:in-reply-to
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BzT1xLCCCdI/Z4mzpdUgqTWKsIF5xI+KCQ7RSMnDKTI=;
        b=C6BmHuVuJ5UdJZRHW4xslHssWVKIaWnOMFQchuu7kxyZmtpTQmC374FmLd1+059XAl
         aRaHTLlIpDX1feUgJuERYnDwWGUWdECNRCqZnjnyU9SdyyFbBZgmZjNq5RT1oelXoh9B
         R03/OBrJt4uK7cO7e+YqtXhyEiAdpsywArGD3AP9gmhl5Jw+C2hsVzNZx9ttsGUbqJrG
         P39+Dz+Ndn31ClVHIG3Q5TMIA5xUTFMWwsBjpU9FRpH9d/asll1gxsMRXk8IKdRqhUv3
         ldFaArd9Wf6j2RLOt9iorsz+cTtbNTBiqvm5KcyQl+/eJxlbM1wXuAxYMEJa7zE47ON3
         r3FA==
X-Forwarded-Encrypted: i=1; AJvYcCWRg9K4L/SsFvC3zWJ3x6RMgX0eGNaGefprWZuam8HPMbZKO91J4Mlju8GLyPlOPIHtstYdQUz66yQSRA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0X2pDuMwPxOwOC0t9zPRzLde4WkGi2Mbb/106avz7Bph/+47W
	mWtCLUogej/uegRNKCrDiVqf38BYQ9HSXoYH5sYek+N5Mjs3NUFyNnAOs2ZpOg==
X-Gm-Gg: ASbGncuiEnOEpH1aGBhueBFlG1Ux64Rto7t2Wh8T6sXh4coVelDKKcmzETPUiDpgBzI
	Wi5pQatHSXxiGTMNgGcYM4OTToW7Z2mTneTEwITuZDJtL6UJKdCeQO3E3SbP8/yel4P6grL4pIB
	aTy01lLLgCkYg8ccoVaUjgoHlByVEu5wsazJFXMdnajyUvHFFMY9NNYu8ZkZggTqVLyBSTg1i5c
	TS24mlIRM8garMLQyRtP0gJKZOvyFDWbJoXusnAvrQA1nt0uobwozk8GqWVK7UXkSDfF4+GA5RU
	Z8M+oEQBlTwPbh7NBYpjwJS6vDoWkxaMQAPE5/4DBbZ4
X-Google-Smtp-Source: AGHT+IHHAlGZLwQDWMOy/lZX6nXXLJWkdAJWHdjbfDJNVVWZJ16f0ZyDIi3Jr2j/gwT33iRVQJxAnw==
X-Received: by 2002:a05:6000:3105:b0:3a3:64bd:ca5e with SMTP id ffacd0b85a97d-3a364bdca8amr18514025f8f.25.1747913463165;
        Thu, 22 May 2025 04:31:03 -0700 (PDT)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca88735sm23340480f8f.69.2025.05.22.04.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 04:31:02 -0700 (PDT)
Message-ID: <682f0af6.5d0a0220.41f76.9502@mx.google.com>
X-Google-Original-Message-ID: <87jz68g9vy.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>,  linux-riscv
 <linux-riscv@lists.infradead.org>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [RFC] Making sense of RISCV_HWPROBE_EXT_* (new flags in version
 6.15)
In-Reply-To: <0370ee4f-bf79-40a1-94ab-e57c2ad19a12@irq.a4lg.com> (Tsukasa OI's
	message of "Thu, 22 May 2025 13:16:54 +0900")
Organization: Linux Private Site
References: <5967b18f-37bb-42c9-b8cc-6abf0e0bee3a@irq.a4lg.com>
	<3f1c4a0e-aaba-4adf-a6c3-421def945400@rivosinc.com>
	<ac58daa5-7f36-4211-9be4-588e7723ad0e@irq.a4lg.com>
	<682c886f.050a0220.e0f8b.72eb@mx.google.com>
	<0370ee4f-bf79-40a1-94ab-e57c2ad19a12@irq.a4lg.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Thu, 22 May 2025 13:30:57 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_043105_909930_AA7236AF 
X-CRM114-Status: GOOD (  43.42  )
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
Content-Type: multipart/mixed; boundary="===============0146896471388286806=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0146896471388286806==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dj., de maig 22 2025, Tsukasa OI wrote:

> On 2025/05/20 22:49, Miquel Sabat=C3=A9 Sol=C3=A0 wrote:
>> Hello,
>>=20
>> On dt., de maig 20 2025, Tsukasa OI wrote:
>>=20
>>> Hi Cl=C3=A9ment,
>>>
>>> On 2025/05/20 16:30, Cl=C3=A9ment L=C3=A9ger wrote:
>>>>
>>>>
>>>> On 20/05/2025 07:25, Tsukasa OI wrote:
>>>>> Hello Cl=C3=A9ment, Miquel and all.
>>>>>
>>>>> It's too late to make changes for the Linux kernel version 6.15 but at
>>>>> least we need to clarify something.  I would like to hear from Cl=C3=
=A9ment
>>>>> and Miquel about your original intent of your changes and hear from a=
ll
>>>>> about your thoughts about the argument below.
>>>>>
>>>>>
>>>>> Background
>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>
>>>>> While I am preparing for the riscv_hwprobe support in the Rust standa=
rd
>>>>> library (for target feature detection) looking at the master branch of
>>>>> Linux, I found three extensions in the RISCV_HWPROBE_KEY_IMA_EXT_0 key
>>>>> that would be redundant if we read the documentation pedantically.
>>>>>
>>>>> cf. Original riscv_hwprobe support for the Rust standard library
>>>>> (supports all flags as of Linux 6.14 except OS-dependent "Supm"):
>>>>> <https://github.com/rust-lang/stdarch/pull/1770>
>>>>>
>>>>> Here's the list (all of them will be new in 6.15):
>>>>>
>>>>> Commit 4458b8f68dc7ab8309291f1667157d0250938291 (by Miquel):
>>>>> 1.  Zicntr
>>>>> (Zihpm is excluded because the argument below does not apply).
>>>>>
>>>>> Commit 9d45d1ff90a6888f6138eb7e1f2619ef427831d3 (by Cl=C3=A9ment):
>>>>> 2.  Zalrsc
>>>>> 3.  Zaamo
>>>>>
>>>>>
>>>>> Base Facts
>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>
>>>>> The RISC-V hwprobe documentation states that
>>>>> RISCV_HWPROBE_BASE_BEHAVIOR_IMA is either RV32IMA/RV64IMA (user ISA
>>>>> version 2.2 and privileged ISA version 1.10 with a few exceptions) and
>>>>> RISCV_HWPROBE_KEY_IMA_EXT_0 lists extensions that are compatible with
>>>>> the RISCV_HWPROBE_BASE_BEHAVIOR_IMA base system behavior (I'll call t=
his
>>>>> the IMA base behavior from now on).
>>>>>
>>>>> cf. <https://docs.kernel.org/arch/riscv/hwprobe.html>
>>>>>
>>>>>
>>>>> 1. Zicntr
>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>
>>>>> The user ISA version 2.2 has RV32I / RV64I ("I") base ISAs, version 2=
.0.
>>>>> However, "I" base ISAs at that time contain features now ratified as =
the
>>>>> "Zicntr" extension.  To be specific, the "I" base ISAs in the user ISA
>>>>> version 2.2 have changed as follows (with some extras):
>>>>>
>>>>> User ISA version 2.2:
>>>>> *   RV32I / RV64I ("I") version 2.0
>>>>>
>>>>> User ISA version 20190608:
>>>>> *   RV32I / RV64I ("I") version 2.1
>>>>> *   The "Zicsr" extension, version 2.0
>>>>> *   The "Zifencei" extension, version 2.0
>>>>> *   Non-extension: Counters
>>>>>     *   3 counters originally available in "I" v2.0 (later "Zicntr")
>>>>>     *   NEW: Additional up to 29 counters (later "Zihpm")
>>>>>
>>>>> User ISA version 20240411:
>>>>> *   RV32I / RV64I ("I") version 2.1
>>>>> *   The "Zicsr" extension, version 2.0
>>>>> *   The "Zifencei" extension, version 2.0
>>>>> *   The "Zicntr" extension, version 2.0 (New as an extension)
>>>>> *   The "Zihpm" extension, version 2.0 (New as an extension)
>>>>>
>>>>> In other words, "I" version 2.0 is roughly equivalent to:
>>>>> *   RV32I / RV64I ("I") version 2.1
>>>>> *   The "Zicsr" extension, version 2.0
>>>>> *   The "Zifencei" extension, version 2.0
>>>>> *   The "Zicntr" extension, version 2.0
>>>>>
>>>>> So if we think pedantically, the flag containing "Zicntr" makes no
>>>>> sense.  Of course, there are a few cases where this flag becomes vali=
d:
>>>>>
>>>>> 1.  IMA base behavior should have been changed
>>>>>     (a documentation fix will be required to justify this)
>>>>> 2.  Denotes that native hardware support of basic hardware counters
>>>>>
>>>>> In either case, we will need to clarify somewhere.
>>>>>
>>>>>
>>>>> 2/3. Zalrsc / Zaamo
>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>
>>>>> This is easier to tell but harder to justify flags' existence.
>>>>>
>>>>> 1.  The IMA base behavior contains the "A" extension.
>>>>> 2.  Both "Zalrsc" and "Zaamo" extensions are subsets of "A"
>>>>>     (in fact, A =3D=3D Zalrsc + Zaamo)
>>>>> 3.  Is there any case where the IMA base behavior is available but
>>>>>     lacks a part of full "A" extension?
>>>>>
>>>>> For me, it just looks RISCV_HWPROBE_EXT_ZAAMO and
>>>>> RISCV_HWPROBE_EXT_ZALRSC are always-on flags.  If the value containing
>>>>> these bits (key RISCV_HWPROBE_KEY_IMA_EXT_0) just lists extensions (w=
ith
>>>>> no conditions), that would be meaningful if the Linux kernel is chang=
ed
>>>>> so that the full "A" extension is no longer needed.  But because the =
key
>>>>> RISCV_HWPROBE_KEY_IMA_EXT_0 lists extensions *compatible to* the IMA
>>>>> base behavior, justifying this is pretty hard.
>>>>>
>>>>> If there is a case where these flags can be turned off and still vali=
d,
>>>>> I'm happy to see an example and learn.
>>>>
>>>> While not technically required right now, there has been a series to u=
se
>>>> ZALRSC to implement AMO (from MIPS) [1] and thus remove the kernel
>>>> dependency on the full "A" extensions. The goal of adding ZAAMO/ZALRSC
>>>> was to have a comprehensive support of RISC-V extensions that might be
>>>> useful for the userspace. Rationale was also that it was better to
>>>> express all the dependencies rather than letting the userspace make so=
me
>>>> assumptions that would be hard to remove later.
>>>
>>>
>>> Thanks for the background!
>>>
>>> In this case, meanings of the key RISCV_HWPROBE_KEY_IMA_EXT_0 should be
>>> changed in the future (when the requirements are lowered and a different
>>> RISCV_HWPROBE_KEY_BASE_BEHAVIOR value is defined) but otherwise looks
>>> fine (and documentation update is only needed once that happens).
>>>
>>> And I understand that this is not worrying state for the userland.
>>>
>>> I appreciate that!
>>>
>>> Thanks,
>>> Tsukasa
>>>
>>=20
>> From my end and the Zicntr inclusion, I have to admit that given the
>> documentation and the arguments you are bringing to the table, it is
>> indeed redundant if we look at things pedantically. That being said, and
>> as both of you are mentioning, maybe the requirements could be lowered
>> to enable the flexibility which is inherent on the RISC-V architecture.
>
> Thanks for the background!
>
> I wasn't keeping my eyes on the Linux kernel and I'm sorry for that.
> I would have replied with concerns if I was there at the time but I
> understand that this is quite hard to notice.  So don't mind too much.
>
>>=20
>> Thus, I'm fine if you want me to provide a patch removing Zicntr in
>> hwprobe if that is inconvenient to user-space. That is, I'd still keep
>> it just in case, but if you feel that it's inconvenient or that it
>> breaks user-space in any way, I'm more than happy to provide a patch for
>> that.
>
> I support to keep it (even if this is *currently* redundant).
>
> As Cl=C3=A9ment quoted, we'd like to follow the rule: "Do not break the
> userspace".  As the current requirements can be lowered in the future
> and the Zicntr extension constant will perfectly make sense if that happe=
ns.
>
> If that happens, I would propose adding the constant for the Zifencei
> extension (which has a history similar to the Zicntr extension but not
> in the extension list for riscv_hwprobe).
>

This is already the current behavior, as the extension for Zifencei is
already defined (see arch/riscv/include/asm/hwcap.h) and the extension
is properly detected, but it's simply not exported to the riscv_hwprobe
interface. Hence, no patches required for now.

Thanks for the feedback,
Miquel

>
> I appreciate that both of you (Miquel and Cl=C3=A9ment) gave me the
> backgrounds and happy to confirm that no userland problems will occur on
> the kernel version 6.15.  I (or someone) might change the behavior on
> handling the Zicntr extension on the Rust standard library in the future
> but it will be still compatible to the documented kernel behavior.
>
> Best regards,
> Tsukasa
>
>>=20
>>>
>>>>
>>>> BTW, there are a few mechanisms that are unlikely to be used as well in
>>>> hwprobe (per-cpu extensions for instance, I do not think we yet have
>>>> seen such hardware yet ?). Ditto for per-cpu misaligned access support.
>>>> While potentially not popular, we try to cover the majority of the use
>>>> cases, RISC-V hardware being, by nature, flexible.
>>>>
>>>> Thanks,
>>>>
>>>> Cl=C3=A9ment
>>>>
>>>> Link:
>>>> https://patchwork.kernel.org/project/linux-riscv/patch/20241225082412.=
36727-1-arikalo@gmail.com/#26192228
>>>> [1]
>>>>
>>>>>
>>>>>
>>>>> Rust (userland) Behavior on version 1.88 or later
>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>>>>>
>>>>> From Rust 1.88 (currently in beta and will be released on the end of
>>>>> June), the RISC-V feature detection logic (backend for the
>>>>> is_riscv_feature_detected macro) will start to use the riscv_hwprobe
>>>>> system call on Linux (before that, only auxiliary vector is used).
>>>>>
>>>>> cf.
>>>>> <https://doc.rust-lang.org/beta/std/arch/macro.is_riscv_feature_detec=
ted.html>
>>>>>
>>>>> Currently, these flags are not read by the Rust standard library
>>>>> (because Linux kernel version 6.15 hasn't released yet) but the behav=
ior
>>>>> is determined considering existence of these flags (new in 6.15):
>>>>>
>>>>> If the IMA base behavior is detected, following Rust target features =
are
>>>>> enabled:
>>>>>
>>>>> 1.  Either "rv32i" or "rv64i"
>>>>>     The IMA base behavior contains "I" base and extensions "M" and "A=
".
>>>>> 2.  "zicsr"
>>>>>     This is inferred from the fact I explained in the "Zicntr" section
>>>>>     above.  It is also justified by the fact that Linux requires
>>>>>     the privileged architecture, which depends on the Zicsr extension.
>>>>> 3.  "zifencei"
>>>>>     This is inferred from the fact I explained in the "Zicntr" section
>>>>>     above.  Linux also has the CMODX feature which makes the Zifencei
>>>>>     extension in the userland valid but riscv_hwprobe doesn't provide
>>>>>     a flag for the Zifencei extension.
>>>>> 4.  "m"
>>>>>     The IMA base behavior contains "I" base and extensions "M" and "A=
".
>>>>>     It implies the Zmmul extension but this one is not supported by
>>>>>     the Rust's feature handling system yet.
>>>>> 5.  "a"
>>>>>     The IMA base behavior contains "I" base and extensions "M" and "A=
".
>>>>> 6.  "zalrsc"
>>>>>     This extension is supported by Rust and implied from "a",
>>>>>     making RISCV_HWPROBE_EXT_ZALRSC ineffective.
>>>>> 7.  "zaamo"
>>>>>     This extension is supported by Rust and implied from "a",
>>>>>     making RISCV_HWPROBE_EXT_ZAAMO ineffective.
>>>>>
>>>>> But the IMA base behavior alone does NOT enable:
>>>>>
>>>>> 1.  "zicntr"
>>>>>     I implemented the RISC-V feature detection logic in Rust more
>>>>>     conservatively than the documentation suggests.
>>>>>     It may make RISCV_HWPROBE_EXT_ZICNTR effective on Rust depending
>>>>>     on how future versions of the standard library is implemented
>>>>>     (possibly Rust version 1.90 or later).
>>>>>
>>>>>
>>>>> Reiterating RFC
>>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>
>>>>> 1.  (To Cl=C3=A9ment and Miquel)
>>>>>     I'd like to hear the original intent of your changes.
>>>>> 2.  (To all)
>>>>>     How do we handle this situation?
>>>>>
>>>>>
>>>>> Best regards,
>>>>> Tsukasa
>>>>>
>>>>> p.s.
>>>>> Just in case, I'm talking NOTHING about Rust on Linux (kernel mode).
>>>>
>>=20
>> Thanks for looking into this!
>> Miquel

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCgAzFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmgvCvEVHG1pa2lzYWJh
dGVAZ21haWwuY29tAAoJEJa+jG/YnWVltm8QAKoVSe2ccbmRH57qQRR8wfhbaFF8
AJew7un7Qc/2Tog8GFp4G/HE7vSa4oDlreSqn9z+tZRCn4RCF02av1eDiM+AEI6w
/gkIU011t2SoQqDdfmTefkXi6mn1xhpY5wKswEDEaV0qjOKGn/2b2Sb6b/weJmZH
Iwc35jQjgpHoCj0/MWd3mZnaQV+oTS1XPdZKVoarPedFiaCklt0nBkz2Qe1DfH07
URzO8Fq4am6BCCqNtsYoTmSiXSUFLMjYZgFm+TLLyA2oPaLXZcnEdbofZ4dncfK/
5ggb34y6vSR5jGeg3FDWlGyjrPOTSxlxz0OAR5RgoNs4ZlRDRmYPiRPA4fiNCXUP
HYngdo4DM5n3jPK6O4s4ZBMGSohX+nB9rlwViyws1vE0ZXcLWSl5uND8BkxzlMs7
Ul9WhKt7Zi+Ww+wZ6Se27V569N3ag5+o7ViM1z7IDK9ZjbGj49QbnZFGgp8u7vg9
AK7xTsOUbkn/dRlvpC4akA0iS3BlJ/ZIXweijOBeexiw33DA1HkuLso0impDDlKb
rVtjRnVf/xOrmTC3jzrFBopGy4CNvXGq464EtllaPojxwNXTcJ+nr+M+ar8qNLia
lpUBP3xXQNo2/6QgJb3CVkv0be4VPBxP6QtyYF5Lg/58R8qO4jtr33N/5Dw+2+Av
yqEZKki1RxgFQfSz
=hZY1
-----END PGP SIGNATURE-----
--=-=-=--


--===============0146896471388286806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0146896471388286806==--

