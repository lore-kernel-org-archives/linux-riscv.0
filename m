Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669D3C2BA18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 17:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qoCbkGjPX0z9QCmvpI1M9FU4LJdW3SppW8uc00fmuO4=; b=Tl1qrAuJSfMDGH
	xI/siS6Mbauq72pxp97Rrq8HwpTAPykrOAeu2ov+ufit5evqQqHkqoenEsYtEpb4CGr9npSpxTjuW
	+4Wwi9r2HTCJNyb6KPosVB6Cj3y8tdSD5Y3JHwNcVKR2MOaL6fwcr49CLrwZj0rYxjx0HWzy4M9ZT
	n5R1thXRtlnhJI+gzzh7NEd9p2fncSL7o79OzuFc0fmCuKcttBZ7nmuswdeXsdYqmpvNk1i+skPAO
	YMGncHTwDV8vo8NXrLJ/1DKi4k1tACDUQ3oGEMgd4inijxsu6RF+L5vbcNQaE2P0NsszEvDqyOZRN
	jOXL731BfrQ+kB2mvCBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJcHF-0000000FyaK-0nCY;
	Tue, 18 Jun 2024 17:05:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJcHC-0000000FyXW-17wg
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 17:05:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42121d27861so44783355e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 10:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1718730343; x=1719335143; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SYNcnoNjdw3Dmz7yiOb+Ni+97jdkSaslp62J9wV4gr0=;
        b=K8gIRNiOOoe1sMJJbB9+YCDy0mtulTxebLgGb5oZmZKSv50NUvCcPIsuwGsAiOR4xv
         dPuNDGe13cK6swBRpzS/EvsxthfB/IvtqKO1yT1ozH/84wulRR6meAKLA4fENhGkIjr+
         4QvlI99u/sYnGOwbIizM2s0m24JOU+9jQMb/ngbCvhVHElVkg60xwKZ+uxiB0h1B5ohd
         A1PySFVQowUPQ78gUkFQjVijgP8GJ7hGKqRXCyNwKaTwtKd7ddT6Un2CyfksrxFrFPOT
         V5iIiM9uUZMmCXdxNEZpScykq2N2aG6S8eHr6AKIqXbG8blz69Xi39vHI1CaDVyWgaFi
         SqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718730343; x=1719335143;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYNcnoNjdw3Dmz7yiOb+Ni+97jdkSaslp62J9wV4gr0=;
        b=agJ8SqARqv/XF4rggOrFVl2Khiqh66bkXhm2Un7xUf0BAn/sFvChTYWHDrZUXMXN8e
         4pdv2rf+5ZvnyApxW2DBSqiEsRLqDvDWLE1LwvoI4FJqv9jkV53dMcQ19VRlbVY0330d
         KOOkl2/fnRTj9Xbir0U4rQfpD4b6wIfzvtOfAi7bBqqZ/OXOikTaJamx6/jLxjWL1rW/
         zGRzF/liXm+GSb17uDLt3KKinp6eSpPi8+e3vO21CEZXuQZJ42KxEli3pdUvOZSeXrvn
         UJ6RW9z/Rw7q1PD4JCFC+UqXFaUfJst5JGFhvyDp0wUYxLDmXe0k8Br+y+FLRdBJJalK
         xKFg==
X-Forwarded-Encrypted: i=1; AJvYcCXYRegrdKA3mARhYkp5WkgWY9HmrWVqCEjcPuOm+m69qHGmz1IQKA+fhSIUFP4eNEuVqjgmRoPFh97C5reUaLDP8wVlF2l6W/vCiGcz/SeV
X-Gm-Message-State: AOJu0YxVcbk+X2yTyLdQiEH6Yh6Dyl0SE+oICA79cXWuSwG/bDwlXR5v
	QBhtn2utZV8aVOkwwsh7TZk8klt7djsDl2xMU2lHF62OJ91NcIH8deO+VamKH+s=
X-Google-Smtp-Source: AGHT+IF3Ra7H5kFJPU+893esfPClG/Ot0pmNrmz14TeqiAwd7BVwhpE3vpo2I+VSSM0L8KlYHJTV7Q==
X-Received: by 2002:a7b:cc9a:0:b0:422:aca:f887 with SMTP id 5b1f17b1804b1-42475293575mr749435e9.28.1718730343123;
        Tue, 18 Jun 2024 10:05:43 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f641a64bsm194996655e9.46.2024.06.18.10.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 10:05:42 -0700 (PDT)
Date: Tue, 18 Jun 2024 19:05:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, anup@brainfault.org, atishp@atishpatra.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, christoph.muellner@vrull.eu, 
	heiko@sntech.de, charlie@rivosinc.com, David.Laight@aculab.com, 
	parri.andrea@gmail.com, luxu.kernel@bytedance.com
Subject: Re: [PATCH v3 4/6] riscv: hwprobe: export Zawrs ISA extension
Message-ID: <20240618-e898082d22cbc508c5655f84@orel>
References: <20240426100820.14762-8-ajones@ventanamicro.com>
 <20240426100820.14762-12-ajones@ventanamicro.com>
 <d0abe3e0-af0f-4693-b943-57ea3fc2189f@rivosinc.com>
 <20240618-581fb4c20b4fe05d76eafa44@orel>
 <20240618-deftly-operation-de4f8ac260d5@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240618-deftly-operation-de4f8ac260d5@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_100546_345975_3ACF6594 
X-CRM114-Status: GOOD (  32.47  )
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

On Tue, Jun 18, 2024 at 05:59:22PM GMT, Conor Dooley wrote:
> On Tue, Jun 18, 2024 at 06:01:04PM +0200, Andrew Jones wrote:
> > On Tue, Jun 18, 2024 at 03:48:59PM GMT, Cl=E9ment L=E9ger wrote:
> > > =

> > > =

> > > On 26/04/2024 12:08, Andrew Jones wrote:
> > > > Export Zawrs ISA extension through hwprobe.
> > > > =

> > > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > > ---
> > > >  Documentation/arch/riscv/hwprobe.rst  | 4 ++++
> > > >  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
> > > >  arch/riscv/kernel/sys_hwprobe.c       | 1 +
> > > >  3 files changed, 6 insertions(+)
> > > > =

> > > > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/a=
rch/riscv/hwprobe.rst
> > > > index b2bcc9eed9aa..e072ce8285d8 100644
> > > > --- a/Documentation/arch/riscv/hwprobe.rst
> > > > +++ b/Documentation/arch/riscv/hwprobe.rst
> > > > @@ -188,6 +188,10 @@ The following keys are defined:
> > > >         manual starting from commit 95cf1f9 ("Add changes requested=
 by Ved
> > > >         during signoff")
> > > >  =

> > > > +  * :c:macro:`RISCV_HWPROBE_EXT_ZAWRS`: The Zawrs extension is sup=
ported as
> > > > +       ratified in commit 98918c844281 ("Merge pull request #1217 =
from
> > > > +       riscv/zawrs") of riscv-isa-manual.
> > > > +
> > > >  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains =
performance
> > > >    information about the selected set of processors.
> > > >  =

> > > > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/inc=
lude/uapi/asm/hwprobe.h
> > > > index 9f2a8e3ff204..a5fca3878a32 100644
> > > > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > > > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > > > @@ -59,6 +59,7 @@ struct riscv_hwprobe {
> > > >  #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
> > > >  #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
> > > >  #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
> > > > +#define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 36)
> > > >  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
> > > >  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
> > > >  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> > > > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sy=
s_hwprobe.c
> > > > index 8cae41a502dd..b86e3531a45a 100644
> > > > --- a/arch/riscv/kernel/sys_hwprobe.c
> > > > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > > > @@ -111,6 +111,7 @@ static void hwprobe_isa_ext0(struct riscv_hwpro=
be *pair,
> > > >  		EXT_KEY(ZTSO);
> > > >  		EXT_KEY(ZACAS);
> > > >  		EXT_KEY(ZICOND);
> > > > +		EXT_KEY(ZAWRS);
> > > >  =

> > > >  		if (has_vector()) {
> > > >  			EXT_KEY(ZVBB);
> > > =

> > > AFAIU, when used in userspace, this will actually "stall" the process=
or
> > > until an interrupt/timeout happens, so the current process will keep
> > > occupying the processor doing nothing (up to the next interrupt/timeo=
ut)
> > > right ?
> > =

> > Yes, but of course the OS can always preempt the task as well.
> > =

> > > =

> > > BTW, the spec also states that "When the TW (Timeout Wait) bit in
> > > mstatus is set and WRS.NTO is executed in any privilege mode other th=
an
> > > M mode, and it does not complete within an implementation-specific
> > > bounded time limit, the WRS.NTO instruction will cause an illegal
> > > instruction exception." so I guess the process will be killed in this=
 case ?
> > =

> > We don't expect mstatus.TW to be set. If it is, then wfi would likely k=
ill
> > the kernel before wrs.nto gets a chance to, but one or the other will
> > certainly ensure usermode never gets a chance to try it :-)
> > =

> > We have a handful of these assumptions about how M-mode has configured
> > things prior to Linux starting. It'd be good if we documented them all
> > somewhere.
> =

> Boot.rst :) If you're adding a new assumption, I think it should go
> there.

It's an old assumption (wfi has been counting on it since the beginning of
time). But documenting it, along with anything else similar to it, in
boot.rst is a good idea. I've added that to my TODO.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
