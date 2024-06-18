Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC70C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 16:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAPg/w8KECKr8cB1of44Qp+sNbmn5Nst+FAskBAQr3c=; b=CKk+jTj1cWDsiC
	aPSZOGIi12p/16vI9HQLjyEDE1qkFQ3q922RBY2ZvnIUbNo/S9fihh679Dbpvuu9JYyLDEHAj5NZp
	UVIaTgSJfJ7opczUK24oMhjhdenvyqtlkJoAzsYDLMxrtrxaSFoZck1MMAJmAGAStes8mj7W9/H1Z
	j3gRTE85oKWCi6m+XL5Qoq/X1hpWLqb036ibqDMDlXc1FM79N3XDyte1n/pju6G67Bq4rgMGQAFZp
	xua322nj0YPYUNJpX7X4h1nxjaDVA0GDAOsBlgXm05VPM1L7I/K3XDCo1EZNaBTjATRMLtNJRMw0R
	kKIBdVEA8HCh0+s5QgPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJbGl-0000000FjFg-3ebp;
	Tue, 18 Jun 2024 16:01:15 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJbGi-0000000FjDp-2q42
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 16:01:14 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2eaea28868dso77020021fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1718726466; x=1719331266; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fyzfPw7nPta0nrq7+bn54u/zAMzgFZf2R3n+jsxGbyE=;
        b=MtGq8yPi5mYuS2y9erJ7rJVUH5cNLe/zgMhgfpveE+IjXtKq3MVVjC6Nd//z5CTz/b
         3MbRTQBSQ/2jfD8aHjkxqg8dvA7vOIBtvvd3nmI5i7X0bWOuCqu9LvP1stnbQcyIRFDX
         l9NOWlSsRfPsatM85rr2iywPfUpjdDWUUt9CeLduThJJ/J9fjLiFg51h3BM0paJLtzFY
         Y9dnv3MqHswmSIWcu2Ql5rnVuZ0/Azs0g8J9oN7AnAGc728pQBi6qDZc+2mVaiHQC/MB
         xQVakdTSZwY7efmyVH+/TLD0lp14SZAO0QhuQzT8WcXD8DtG+dIVhWETy9sZ8XByhb9K
         2haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718726466; x=1719331266;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fyzfPw7nPta0nrq7+bn54u/zAMzgFZf2R3n+jsxGbyE=;
        b=ZXF6pwYMv76TkY2MN5KLvbyCEZm2PIArnytfdzRBLL0nqQ5O4NYpH0rTp0LyzQi8wg
         q37Oiwv/wbv8Y06erGVRN/muqqhNtRDDV319EOZtjgl4or6V728k+ySRKapZ8nTB+87Q
         EZ/wP/Y7bqgmcWGHST/jTH/ZxTH6H5vSt0U/IasKk4om+YOWsV8TYc/e1+ypNND9whWs
         titGkg/RuEATPqVgTgnhtcqvwS6YInb+PsJEX/R9/dLNsTvrX7yVE2ECUc50Pvi9TqUs
         7Qlc0PKgclh7LuprDN3vPZvYylhxF+m1HApywk1u5EF6nadQPecYJiYPJwFBIjvBMZnu
         N3ng==
X-Gm-Message-State: AOJu0Yw8bhe+HDag8sUp12owzoUbqTIVxtUyWAK7gbmsEjSBkYa2Vlpa
	XLhmG5e1aUP2Nwm8XfNC/kTliRpmssnHqysptwW2XGt8wggGxu4sclQtE+/l2kk=
X-Google-Smtp-Source: AGHT+IFmf/CsJAFZdTKuErQLaJl7XiTQDH7Dq7mcT8jSDcNOvwHuMJ/sgNY5CXbzTxSRvpqJhpeLHQ==
X-Received: by 2002:a2e:9210:0:b0:2de:8697:e08b with SMTP id 38308e7fff4ca-2ec3ced12bdmr2211131fa.26.1718726465742;
        Tue, 18 Jun 2024 09:01:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874e6b63sm231018715e9.39.2024.06.18.09.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 09:01:05 -0700 (PDT)
Date: Tue, 18 Jun 2024 18:01:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, conor.dooley@microchip.com, anup@brainfault.org, 
	atishp@atishpatra.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, christoph.muellner@vrull.eu, heiko@sntech.de, 
	charlie@rivosinc.com, David.Laight@aculab.com, parri.andrea@gmail.com, 
	luxu.kernel@bytedance.com
Subject: Re: [PATCH v3 4/6] riscv: hwprobe: export Zawrs ISA extension
Message-ID: <20240618-581fb4c20b4fe05d76eafa44@orel>
References: <20240426100820.14762-8-ajones@ventanamicro.com>
 <20240426100820.14762-12-ajones@ventanamicro.com>
 <d0abe3e0-af0f-4693-b943-57ea3fc2189f@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0abe3e0-af0f-4693-b943-57ea3fc2189f@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_090112_753736_03E813F6 
X-CRM114-Status: GOOD (  26.13  )
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

On Tue, Jun 18, 2024 at 03:48:59PM GMT, Cl=E9ment L=E9ger wrote:
> =

> =

> On 26/04/2024 12:08, Andrew Jones wrote:
> > Export Zawrs ISA extension through hwprobe.
> > =

> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  Documentation/arch/riscv/hwprobe.rst  | 4 ++++
> >  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
> >  arch/riscv/kernel/sys_hwprobe.c       | 1 +
> >  3 files changed, 6 insertions(+)
> > =

> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/=
riscv/hwprobe.rst
> > index b2bcc9eed9aa..e072ce8285d8 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -188,6 +188,10 @@ The following keys are defined:
> >         manual starting from commit 95cf1f9 ("Add changes requested by =
Ved
> >         during signoff")
> >  =

> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZAWRS`: The Zawrs extension is support=
ed as
> > +       ratified in commit 98918c844281 ("Merge pull request #1217 from
> > +       riscv/zawrs") of riscv-isa-manual.
> > +
> >  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains perf=
ormance
> >    information about the selected set of processors.
> >  =

> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include=
/uapi/asm/hwprobe.h
> > index 9f2a8e3ff204..a5fca3878a32 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -59,6 +59,7 @@ struct riscv_hwprobe {
> >  #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
> >  #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
> >  #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
> > +#define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 36)
> >  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
> >  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
> >  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hw=
probe.c
> > index 8cae41a502dd..b86e3531a45a 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -111,6 +111,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *=
pair,
> >  		EXT_KEY(ZTSO);
> >  		EXT_KEY(ZACAS);
> >  		EXT_KEY(ZICOND);
> > +		EXT_KEY(ZAWRS);
> >  =

> >  		if (has_vector()) {
> >  			EXT_KEY(ZVBB);
> =

> AFAIU, when used in userspace, this will actually "stall" the processor
> until an interrupt/timeout happens, so the current process will keep
> occupying the processor doing nothing (up to the next interrupt/timeout)
> right ?

Yes, but of course the OS can always preempt the task as well.

> =

> BTW, the spec also states that "When the TW (Timeout Wait) bit in
> mstatus is set and WRS.NTO is executed in any privilege mode other than
> M mode, and it does not complete within an implementation-specific
> bounded time limit, the WRS.NTO instruction will cause an illegal
> instruction exception." so I guess the process will be killed in this cas=
e ?

We don't expect mstatus.TW to be set. If it is, then wfi would likely kill
the kernel before wrs.nto gets a chance to, but one or the other will
certainly ensure usermode never gets a chance to try it :-)

We have a handful of these assumptions about how M-mode has configured
things prior to Linux starting. It'd be good if we documented them all
somewhere.

> =

> If this is not a concern:
> =

> Reviewed-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
