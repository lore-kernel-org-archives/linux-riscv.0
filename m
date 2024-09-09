Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D551FECE579
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 12:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:References:In-Reply-To:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QovTa5/Q6ThPYMNAq+IiKtPwmOAdhfWCehlXe/2ygtg=; b=dfug9YposAhP/WGANNr5OuKo8l
	UcggaQGjwT6fJrNTuEw8FntFcoDncU5aPrHLK+N7xq4F6QYxnnn2ZH4CPqR6yThNTdmuzUBGiancn
	FvgWFKLaS2ipktqjgm+vMW5Gl+91PmAMe6DRvKGqn40NvHbjQegE8fyOGuk3qdwjZyZdu0Kf5afW4
	9Ykqvhuwprknrt2NvVpBAM5KtzMgohiqD7stbfyUSF7gw58admRsfim2uMhpmDeGkGDXUfusAP8jX
	rzJ3Q7Aeh4jb/UtqRtRdTtgjiKf9300WgsCGKz5tzfLCWbg6oTK7jKnepYiVgc/Vom1QZlk4qvd0o
	4V+4qRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndnw-00000001udp-3Y8l;
	Mon, 09 Sep 2024 12:47:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncjZ-00000001hp5-15RE
	for linux-riscv@bombadil.infradead.org;
	Mon, 09 Sep 2024 11:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Date:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=W26nZdJnLBsIfHz/s3jK5jdIhMQf+KGV6UKCsoG9vuM=; b=UTFae2GXyDQXOtzdnPa/iJkmYw
	nZM5K0Q8qFSfPTfqvjkhpQtea6xvEAeL1atULX97Wmy/llWpqxd+9qyrbkPRpbr+rgmNAJICMqm4B
	KVpzxCZk2mhTpGxYT4/ObY6o3B66Xft+pMq5Bv7foVwfAPoBszCM+LZInjg6OeNii5aa+oYz4YQUW
	lmwDeOY1Z3AIIcNK1e5PmD9h+uHfcbcPhl+UYU9YyWvJOGuiTRVojLrlmiG7tuvC7jLFn9/++lu3W
	6tpv+REr6W8uGaqOOQtet6PloR/0ubFfpJPZpi9RABGAxpu+rOIKDcB9l0XFJth3Vc6JIW0WhBQq3
	4x2Hk09g==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sncjU-00000000PJY-0ra4
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 11:39:02 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso16707345e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Sep 2024 04:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725881936; x=1726486736; darn=lists.infradead.org;
        h=mime-version:date:references:organization:in-reply-to:subject:cc:to
         :from:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W26nZdJnLBsIfHz/s3jK5jdIhMQf+KGV6UKCsoG9vuM=;
        b=EucwWKjjyb2QN4KFkVQLJLN6ke9wZdNZ+CL9gW8gcA/OXEndyzGYt+O7fwlPuxDYOP
         jOwxzef0wadzN6EZ6HBEEmXS35RjJ/qxzMf4oQp1tpUnOcN09XDpUPEJ1fHsod5WY10n
         4AtMDi2/6/GNGs2IkUs2HQs+OgLx5ylTDtzRk/MT5vnWljfztS81qud8JvPV+YTaaZZx
         6B2XCjeRqjWiLhMUNr7kpwbJ8eFF+0YhNw/MFDSpif77azxIbJUJvhtpukQQ7h2Z5B2m
         7SHzmljSY1pU3EG/jhAL3K/sZliOAqiazzrkyjRbqx7HyCO3klOzr2VpseoT1rZU57Uw
         BMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725881936; x=1726486736;
        h=mime-version:date:references:organization:in-reply-to:subject:cc:to
         :from:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W26nZdJnLBsIfHz/s3jK5jdIhMQf+KGV6UKCsoG9vuM=;
        b=kPcvv7IJq8gkBuDY2FiOJg8hemgADXHqpR2s+2HHYjURVwgKEhTuUhIVt85TqD6jw6
         HV2gpwbUywtqugpmmsk08HrBaDcduzq5Qg+C7lz5DVg/fhNn70LDUBb1NfO5qOtICKnR
         1MGaGoMFM2Wgb0UTLuJriw6w9iKVwJj4os/jE2P5eQ8c7/aMQA0knUHslvT7MnqptpMx
         M+8J7E1ZV4YCCHERIYzvyNUY+7e1s3M+aydg6KiZUImVQWn4QmCslHFQlhsBG27PJt2R
         U21BXqZcrkBoWiZjBFMM2WqBUBTgKF+o8j4EPjyhXNVbvTCNQ1zEPy+k6MH9On/VRX2m
         2nyA==
X-Forwarded-Encrypted: i=1; AJvYcCWAdQS8y0VsnPwK0dn20MzrFubqO5Q9vu6jCTXK02EexVG6ZTK2Bi99bXkB5wm/vBEi7cb105iQwMRtuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUqEQzE6Y1IxHriAp7tCn+viPn05zJfjALajuiLS72yxeFpUKb
	fsnf1SqEJj6d41qmCwAbcSh0k2HLzrMyiBHeZwFmaYWk7dMJ/nYG
X-Google-Smtp-Source: AGHT+IEGeIzBSBnr7TPWOE+RFt3Bxl7/u8wxu6JoWx2W06vU993cayEWH0d1yjJvBoxU3/Ef6ZYzDQ==
X-Received: by 2002:a05:600c:4707:b0:426:5dd0:a1ee with SMTP id 5b1f17b1804b1-42c9f97bc2amr79572585e9.2.1725881935677;
        Mon, 09 Sep 2024 04:38:55 -0700 (PDT)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d3743sm5846883f8f.79.2024.09.09.04.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:38:55 -0700 (PDT)
Message-ID: <66dede4f.5d0a0220.1ef0e1.c922@mx.google.com>
X-Google-Original-Message-ID: <87mskhjbue.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: <paul.walmsley@sifive.com>,  <palmer@dabbelt.com>,
  <aou@eecs.berkeley.edu>,  <linux-riscv@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <jesse@rivosinc.com>,
  <conor@kernel.org>
Subject: Re: [PATCH v2] riscv: hwprobe: export Zicntr and Zihpm extensions
In-Reply-To: <20240909-raving-reproach-74431f57896d@wendy> (Conor Dooley's
	message of "Mon, 9 Sep 2024 12:11:46 +0100")
Organization: Linux Private Site
References: <20240817075629.262318-1-mikisabate@gmail.com>
	<20240820044749.557349-1-mikisabate@gmail.com>
	<66d9605f.5d0a0220.3dabb6.3586@mx.google.com>
	<20240909-raving-reproach-74431f57896d@wendy>
Date: Mon, 09 Sep 2024 13:38:49 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_123900_290082_732C0E6C 
X-CRM114-Status: GOOD (  22.80  )
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
Content-Type: multipart/mixed; boundary="===============8820962177756087237=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8820962177756087237==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dl., de set. 09 2024, Conor Dooley wrote:

> On Thu, Sep 05, 2024 at 09:40:14AM +0200, Miquel Sabat=C3=A9 Sol=C3=A0 wr=
ote:
>> On dt., d=E2=80=99ag. 20 2024, Miquel Sabat=C3=A9 Sol=C3=A0 wrote:
>>=20
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
>> > index 3db60a0911df..cfd2929d0562 100644
>> > --- a/Documentation/arch/riscv/hwprobe.rst
>> > +++ b/Documentation/arch/riscv/hwprobe.rst
>> > @@ -183,6 +183,9 @@ The following keys are defined:
>> >         defined in the Atomic Compare-and-Swap (CAS) instructions manu=
al starting
>> >         from commit 5059e0ca641c ("update to ratified").
>> >=20=20
>> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZICNTR`: The Zicntr extension version=
 2.0
>> > +       is supported as defined in the RISC-V ISA manual.
>> > +
>> >    * :c:macro:`RISCV_HWPROBE_EXT_ZICOND`: The Zicond extension is supp=
orted as
>> >         defined in the RISC-V Integer Conditional (Zicond) operations =
extension
>> >         manual starting from commit 95cf1f9 ("Add changes requested by=
 Ved
>> > @@ -192,6 +195,9 @@ The following keys are defined:
>> >         supported as defined in the RISC-V ISA manual starting from co=
mmit
>> >         d8ab5c78c207 ("Zihintpause is ratified").
>> >=20=20
>> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZIHPM`: The Zihpm extension version 2=
.0
>> > +       is supported as defined in the RISC-V ISA manual.
>> > +
>> >    * :c:macro:`RISCV_HWPROBE_EXT_ZVE32X`: The Vector sub-extension Zve=
32x is
>> >      supported, as defined by version 1.0 of the RISC-V Vector extensi=
on manual.
>> >=20=20
>> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/includ=
e/uapi/asm/hwprobe.h
>> > index b706c8e47b02..098a815b3fd4 100644
>> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
>> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
>> > @@ -72,6 +72,8 @@ struct riscv_hwprobe {
>> >  #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
>> >  #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
>> >  #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
>> > +#define		RISCV_HWPROBE_EXT_ZICNTR	(1ULL << 49)
>> > +#define		RISCV_HWPROBE_EXT_ZIHPM		(1ULL << 50)
>> >  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>> >  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>> >  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
>> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_h=
wprobe.c
>> > index 8d1b5c35d2a7..910b41b6a7ab 100644
>> > --- a/arch/riscv/kernel/sys_hwprobe.c
>> > +++ b/arch/riscv/kernel/sys_hwprobe.c
>> > @@ -107,9 +107,11 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe=
 *pair,
>> >  		EXT_KEY(ZCB);
>> >  		EXT_KEY(ZCMOP);
>> >  		EXT_KEY(ZICBOZ);
>> > +		EXT_KEY(ZICNTR);
>> >  		EXT_KEY(ZICOND);
>> >  		EXT_KEY(ZIHINTNTL);
>> >  		EXT_KEY(ZIHINTPAUSE);
>> > +		EXT_KEY(ZIHPM);
>> >  		EXT_KEY(ZIMOP);
>> >  		EXT_KEY(ZKND);
>> >  		EXT_KEY(ZKNE);
>> >
>> > base-commit: dc1c8034e31b14a2e5e212104ec508aec44ce1b9
>>=20
>> Hello,
>>=20
>> Can I get a review on this version of this patchset?
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> By the way, I totally missed this first time around because the v2 was
> sent as a reply to v1 - it's pretty common for people to view their
> mailbox sorted by thread, and sending new versions as a reply will bury
> it.
>
> Cheers,
> Conor.

Thanks for the review!

This is my first contribution to the Linux kernel, as you can tell :)
Will keep in mind next time!

Thanks,
Miquel

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCgAzFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmbe3kkVHG1pa2lzYWJh
dGVAZ21haWwuY29tAAoJEJa+jG/YnWVlj+sP/iAqt4EMHI+8kZlVyGUdndX5I0hP
ABdwK8prk09tVOkt7VBEjQI61Ibn/ZimfrRLaGwZB+UYmpb2kXBZzO/CLUhaya2f
Lsj/cr8Cr5sqlZiRoYGDVOUfVdNoQSn7vqURb1KWHHTMLdg8jgFJVCDRTudROCn9
vyWxmNuVWiZRoBvK61alPwHJYbVqCEJN+vIz8bw3yv5fZgRsGqxQM/L0ZUmI52gZ
eHFfoKQEFYoWxKVypTV/wn4jtl2VwOJJQ5iT6sEnKfyWh84XF0phBbQPpQz9S/8S
Aa2/eE+w/frmwo3Nh+43aCwvtUXGRxc147nQ6CuY68flW4SUnayndQlYindTBQDw
Nq6NgkXpj3Pixa/Ntw7dTHgVbFAeWcuuQWgBXwXgyyd26bFXcETLR4TkV/ANHWKi
eEG9+cRTF9LqB5FxDFfBtddtnVhnMiZBeXmwA1PCy3nZaBghhN+ctWgXDvu4f27U
JXn9BzpTH8VwDMzi4+cIsgeQCZiPdZ4JOIP5LhOXNRHaZHi+JceBhVUIMHYd7urB
KRtSrau5O1p6WyEi+JdF0ydafkRx2Gmc5MpVpXB9gBCeT0/jurS62oL4aXP4D4Np
cQthVm2Xirq3XitRMylGKt2iOOz8Uks1BKnBKHB1xAGcdnTZvM2/Pwv7LicxCHnh
827assRBdYKjkbgR
=MCFy
-----END PGP SIGNATURE-----
--=-=-=--


--===============8820962177756087237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8820962177756087237==--

