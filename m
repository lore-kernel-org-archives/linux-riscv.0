Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B339C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 14:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+lvkA4hKfXN3EJQ5UTxco6nhmBeIw+3Y9/JGjnxKEM=; b=LmrmS1b5BwedzS
	J2uDK2Vyc3ADI0OI6p42qImoP1H8Yiwp7cUtNI4xZvEuCeAIiN8QYGAWQKik8j+EkUaIa1hQWrb/S
	dtS7med9cmMhmOymg829YoTC3uTXYIXjGIlI5HfJXzHQU+ak5OErJ7vhyeSmxQWGaw9da8a7vTEJT
	eN8pj1Yxn+jIw1WFSvX0034OJZ/YEvQifz9hxGvzsL8je5oQMtBh7tCc7/NXL6JeQPke6t3wM9g9g
	UGSSsv29WK247MNOmmRsnad3VX6mpy0qpwnOp2vRFTqR7v/CY2vJJehl8IIBG+d+hM963yXaouLFM
	paLWuuZ6orZMqNj7H7Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYNf-00000006GXG-2Aol;
	Tue, 18 Mar 2025 14:57:23 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYNc-00000006GUV-0NVj
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 14:57:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so35167435e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 07:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742309838; x=1742914638; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8JrbbTTYqsx2At8tXwwXV3DCT75Flxu7MLSme9mxvoE=;
        b=O7UCoTCzRC9/I9/A43L/Yye+hQRCbXAo6Ud7Ra4L8mo0u4FDYJqt54ZgCTlor0PRd5
         QBEvLizWXbG/F6Byt6vON+5qTN6H/NSLj1HO8qk5GV7KcCUvB2EoGPjMwohAkpnLwuxm
         25txJvdiU+9Q/xdFDHa2e59CGFyWdp1Kd9pRgi/SRnypgA+4jdHH3/oUbj7oXQl/Twp0
         L72CoXq/1xMlTwq/34wflFo44CXYpvB2SQBzHGdyKAKUtBygwbHl79wPViEzv2T4U/cB
         6J+GNbp5beleYbDHWIsx6VisfnnUStnsj/hOKLRyTANWBtVHyLJLai1yf0PV5DNRsGVu
         xOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742309838; x=1742914638;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8JrbbTTYqsx2At8tXwwXV3DCT75Flxu7MLSme9mxvoE=;
        b=Q1TYEmh6ooro/zFB9YC54vJAJYlum84770nk5YZqNb8crQZBBMB8a3R/3YdnGObv0P
         Eb7B056Ba7o9mJEgsq7ElMl/V1zq4dTAtpVZxa8n02o0glf6muyCD+Q7/Opu+X05xdq8
         veBoG+djd3jbtKwcfuEjri+ZE1NseeoJtui6mFMRze+yVuP3Vlb+IVL82jYQC/VXzBw4
         Z7PD6QRKyX4miinNe7QJsINPbM1nqiBFFIYhFwmt7Bhra1krQX/dV36bf4AcTG/zXVyz
         8gQwWXAytrPM9AfdU31YFBpH3vMR6fmTkXVg9QqpZjcLse6NkWewF0jc3qMQNbxCzyA1
         zgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9lFXSUw5mINjQLrdT0QVUDRTWjjNFLioBYEZNQ0DFPkcYDdY5MvqrroXqBPKQdIVck9W8rwYTtyObFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfiM3G/gZMUaiWqwnHFtZXabYXibdJnzKKJoolhKVn+BCMPlpi
	2+x+ZVCVj+Hbd2UgiydSirfTAI48R5OaEB/WgtbRyzkfTWYbbkPVJqh15zMSbDc=
X-Gm-Gg: ASbGnctLQhl9Gzez03fPLTHLqFLLRVp/DlTO/CgJrHYR3uKItFGFJ1BJhcGqEx8TSlH
	jWnclINso22Wkh7GD7Ny94iK+iiMtRW2L3mTr2z/JEHqrij+t1jw9C/iR++oE9OVHFLzLfmnRt+
	xmW7Q0nqAq0E79dSWSHnd3sleiTL8uPH5TNoJGStb1H55OqdZyv4eR3rpuWBi0/xtfv2XHjVyRB
	ysMq2rED+rR6q8ck2KbRCbwBdQH5BSlkt6nxbdeH8oyISfoMOO1My+nDipGmTCRWX0r6V3VMKxt
	Eg/MSRHntobEphco0DyDnKWVkWqXpUNG
X-Google-Smtp-Source: AGHT+IHXZ79XlkqSRmU/Q/zKFFol20kZw5HxT+VTDXRKrU5Qs5y3sPBuGNxTg+Htb1G8NWUxJyz+Ig==
X-Received: by 2002:a05:600c:4e51:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-43d3b9ba9d4mr25669455e9.18.1742309838230;
        Tue, 18 Mar 2025 07:57:18 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe065b0sm136153105e9.14.2025.03.18.07.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 07:57:17 -0700 (PDT)
Date: Tue, 18 Mar 2025 15:57:16 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, charlie@rivosinc.com, Anup Patel <apatel@ventanamicro.com>, 
	corbet@lwn.net
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <20250318-58828155d9ca2801a21fa411@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <1b7e3d0f-0526-4afb-9f7a-2695e4166a9b@ghiti.fr>
 <20250318-1b03e58fe508b077e5d38233@orel>
 <20250318-61be6a5455ea164b45d6dc64@orel>
 <ee650a6c-eed8-4a2b-82ee-868a784f26b3@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee650a6c-eed8-4a2b-82ee-868a784f26b3@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_075720_140103_D4CF3829 
X-CRM114-Status: GOOD (  49.91  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 18, 2025 at 03:09:58PM +0100, Cl=E9ment L=E9ger wrote:
> =

> =

> On 18/03/2025 10:00, Andrew Jones wrote:
> > On Tue, Mar 18, 2025 at 09:48:21AM +0100, Andrew Jones wrote:
> >> On Mon, Mar 17, 2025 at 03:39:01PM +0100, Alexandre Ghiti wrote:
> >>> Hi Drew,
> >>>
> >>> On 04/03/2025 13:00, Andrew Jones wrote:
> >>>> Allow skipping scalar and vector unaligned access speed tests. This
> >>>> is useful for testing alternative code paths and to skip the tests in
> >>>> environments where they run too slowly. All CPUs must have the same
> >>>> unaligned access speed.
> >>>
> >>> I'm not a big fan of the command line parameter, this is not where we=
 should
> >>> push uarch decisions because there could be many other in the future,=
 the
> >>> best solution to me should be in DT/ACPI and since the DT folks, acco=
rding
> >>> to Palmer, shut down this solution, it remains using an extension.
> >>>
> >>> I have been reading a bit about unaligned accesses. Zicclsm was descr=
ibed as
> >>> "Even though mandated, misaligned loads and stores might execute extr=
emely
> >>> slowly. Standard software distributions should assume their existence=
 only
> >>> for correctness, not for performance." in rva20/22 but *not* in rva23=
. So
> >>> what about using this "hole" and consider that a platform that *adver=
tises*
> >>> Zicclsm means its unaligned accesses are fast? After internal discuss=
ion, It
> >>> actually does not make sense to advertise Zicclsm if the platform acc=
esses
> >>> are slow right?
> >>
> >> This topic pops up every so often, including in yesterday's server
> >> platform TG call. In that call, and, afaict, every other time it has
> >> popped up, the result is to reiterate that ISA extensions never say
> >> anything about performance. So, Zicclsm will never mean fast and we
> >> won't likely be able to add any extension that does.
> >>
> >>>
> >>> arm64 for example considers that armv8 has fast unaligned accesses an=
d can
> >>> then enable HAVE_EFFICIENT_ALIGNED_ACCESS in the kernel, even though =
some
> >>> uarchs are slow. Distros will very likely use rva23 as baseline so th=
ey will
> >>> enable Zicclsm which would allow us to take advantage of this too, wi=
thout
> >>> this, we lose a lot of perf improvement in the kernel, see
> >>> https://lore.kernel.org/lkml/20231225044207.3821-1-jszhang@kernel.org=
/.
> >>>
> >>> Or we could have a new named feature for this, even though it's weird=
 to
> >>> have a named feature which would basically=A0 mean "Zicclsm is fast".=
 We don't
> >>> have, for example, a named feature to say "Zicboz is fast" but given =
the
> >>> vague wording in the profile spec, maybe we can ask for one in that c=
ase?
> >>>
> >>> Sorry for the late review and for triggering this debate...
> >>
> >> No problem, let's try to pick the best option. I'll try listing all the
> >> options and there pros/cons.
> >>
> >> 1. Leave as is, which is to always probe
> >>    pro: Nothing to do
> >>    con: Not ideal in all environments
> >>
> >> 2. New DT/ACPI description
> >>    pro: Describing whether or not misaligned accesses are implemented =
in
> >>         HW (which presumably means fast) is something that should be d=
one
> >> 	in HW descriptions
> >>    con: We'll need to live with probing until we can get the descripti=
ons
> >>         defined, which may be never if there's too much opposition
> >>
> >> 3. Command line
> >>    pro: Easy and serves its purpose, which is to skip probing in the
> >>         environments where probing is not desired
> >>    con: Yet another command line option (which we may want to deprecate
> >>         someday)
> >>
> >> 4. New ISA extension
> >>    pro: Easy to add to HW descriptions
> >>    con: Not likely to get it through ratification
> >>
> >> 5. New SBI FWFT feature
> >>    pro: Probably easier to get through ratification than an ISA extens=
ion
> >>    con: Instead of probing, kernel would have to ask SBI -- would that
> >>         even be faster? Will all the environments that want to skip
> >> 	probing even have a complete SBI?
> =

> Hi Andrew
> =

> FWFT is not really meant to "query" information from the firmware,
> fwft_set() wouldn't have anything to actually set. The problem would
> also just be pushed away from Linux but would probably still require
> specification anyway.

Agreed. Actually, if we had HW descriptions for every feature in FWFT,
and allowed each feature to have implementation-defined reset values,
then we wouldn't need the get function. The OS would only call the
set function if it disagreed with the value it saw in the HW description.
But this is getting off-topic and we can just agree that FWFT isn't the
right approach.

> =

> >>
> >> 6. ??
> > =

> > I forgot one, which was v1 of this series and already rejected,
> > =

> >  6. Use ID registers
> >     pro: None of the above cons, including the main con with the command
> >          line, which is that there could be many other decisions in the
> > 	 future, implying we could need many more command line options.
> >     con: A slippery slope. We don't want to open the door to
> >          features-by-idregs. (However, we can at least always close the
> > 	 door again if better mechanisms become available. Command
> > 	 lines would need to be deprecated, but feature-by-idreg code
> > 	 can just be deleted.)
> =

> My preferred option would have been option 2. BTW, what are the
> arguments to push away the description of misaligned access speed out of
> device-tree ? that's almost exactly what the device-tree is meant to do,
> ie describe hardware.

Actually, I don't know. Maybe Palmer can point to something.

Thanks,
drew

> =

> As a last resort solution, I'm for option 3. There already exists a
> command line option to preset the jiffies. This is almost the same use
> case that we have, ie have a faster boot time by presetting the
> misaligned access probing.
> =

> IMHO, skipping misaligned access probing speed is orthogonal to
> EFFICIENT_UNALIGNED_ACCESS. one is done at runtime and allows the
> userspace to know the speed of misaligned accesses, the other one at
> compile time to improve kernel speed. Depending on which system we want
> to support, we might need to enable EFFICIENT_UNALIGNED_ACCESS as a
> default, allowing for the most Linux "capable" chips to have full
> performances.
> =

> Thanks,
> =

> Cl=E9ment
> =

> > =

> > Thanks,
> > drew
> > =

> >>
> >> I'm voting for (3), which is why I posted this patchset, but I'm happy
> >> to hear other votes or other proposals and discuss.
> >>
> >> Thanks,
> >> drew
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
