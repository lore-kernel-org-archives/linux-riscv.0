Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E383CC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 17:57:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F666223E0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 17:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F666223E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=epigenesys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qD3Hdf2RKY3zvPDe09LdKxplKLUFoH8BuSWL0NbE9TU=; b=qoriKOtJcYZhlL7pI3TZnjo8b
	zY1C+E8fup0NZvd1259AcdigAuJAWFpmHLVerGld5rBeVO/rW+9YR6+YLjF8rxEAU8F31jX/lIAas
	4z8XnmxexXuIb7399EWMOa93g2mYnBOCNQTi6TaqL0N9aLZhaH+LTixy2onu4Oum21kM87EKO+fs7
	ZwLrSZmH6nmNealbR7/rKaIjlV8XQctn4ufcNXo36DwNLH7dv61LrhEEp6GHAxPLSWTi/MXngsTe0
	KIyOzu1Xiz8nnwwgKecRGVycv+nU95AZs7DwZO+8Fb76hyf1vKprrQ5/mQia0Syzc2ISlODDOJZsL
	qITglSQug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Hj8-0002va-IO; Wed, 20 Jan 2021 17:57:06 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Hj5-0002tj-0H
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 17:57:04 +0000
Received: by mail-ej1-f44.google.com with SMTP id b5so18329912ejv.4
 for <linux-riscv@lists.infradead.org>; Wed, 20 Jan 2021 09:57:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BHAPM9Dxt3bNuZfvaRuSHvsdmz04Kmra1nM09Sf0o4Y=;
 b=uKOsDRqUYR0X1A+lVDFpPNgfw+7fz+qu8NO1cQUjA8u+t/b3hO/NxKnOKXYOmubJus
 RBaVTY1uoPWKUHggbKLbD81dMwhIAsOkI+s5t9cotHXhMPFREPwFyuM8OyP+CcLDE4J/
 0HP2dLO/z250rl+kTKdK6OeuThhil+prLaqm+jLCycdmFEB1KCmWkPM9gBJoOp3GU4uT
 qIgjDbM+qQkL3U5lKpqa2fIdkA0RMRHUE+VXWlnRrUOYNsznxqcLxAgylInKIbHy4IvS
 2lh3Oh0kQSOrzq64o/iW1kcNuYjTUxBh6xV/IFxmPaLg1cCbCAb5proqcXBIOC1xXSul
 arWQ==
X-Gm-Message-State: AOAM530AGvz7xP/jrc3m1BUYVrLN//NjMLeoM7ZRHmVKLt4Du4BL+Gyf
 hGSxowED039yjC5PwKroi04=
X-Google-Smtp-Source: ABdhPJwXJLAslAIXHmYQ2he1zQEFscB4L1gD5Ge9bjghqpyayQEBdkyUrw5/JuG9JsoGEkMTprQjyw==
X-Received: by 2002:a17:906:7689:: with SMTP id
 o9mr7029872ejm.324.1611165419627; 
 Wed, 20 Jan 2021 09:56:59 -0800 (PST)
Received: from ingrassia.epigenesys.com ([2.236.81.180])
 by smtp.gmail.com with ESMTPSA id q2sm1486500edn.91.2021.01.20.09.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 09:56:58 -0800 (PST)
Date: Wed, 20 Jan 2021 18:56:55 +0100
From: Emiliano Ingrassia <ingrassia@epigenesys.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: perf tools build broken for RISCV 32 bit
Message-ID: <YAhu579mXEZQc8ma@ingrassia.epigenesys.com>
References: <YAWg6KQt6hAtIR6O@ingrassia.epigenesys.com>
 <CAK8P3a3Vc4wrLvrfwkHd6HCMohk07Yi6P_jKaC_5AybCMBNjPA@mail.gmail.com>
 <YAWqS9YZ0rpXPoSN@ingrassia.epigenesys.com>
 <CAK8P3a31ssD+FS1tAUxVHzrtUz-L9=mYCbv=ShEMci_bDdiTAg@mail.gmail.com>
 <YAcOi0l44VTtd2LS@ingrassia.epigenesys.com>
 <CAK8P3a3q16Fds9bujhjHRwjXoc_8NJBvutNRqajMEPHb9hGdNw@mail.gmail.com>
 <YAhBu/T02m5oFOcM@ingrassia.epigenesys.com>
 <CAK8P3a2y9BC9JDXoJVTi0+TcDvYH-nb27K4r2SybmL-zrxfBtw@mail.gmail.com>
 <YAhQIksHO+xM7wEO@ingrassia.epigenesys.com>
 <CAK8P3a1Kjy14Pxf4_1SOYA5cy1bSYhhxW9_5LefNzJ2dRTJ29g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1Kjy14Pxf4_1SOYA5cy1bSYhhxW9_5LefNzJ2dRTJ29g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_125703_112124_EAF4B3F8 
X-CRM114-Status: GOOD (  33.18  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Bruce Ashfield <bruce.ashfield@gmail.com>,
 Khem Raj <raj.khem@gmail.com>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alistair Francis <alistair.francis@wdc.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, "Maciej W. Rozycki" <macro@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Arnd,

On Wed, Jan 20, 2021 at 05:03:30PM +0100, Arnd Bergmann wrote:
> On Wed, Jan 20, 2021 at 4:45 PM Emiliano Ingrassia
> <ingrassia@epigenesys.com> wrote:
> > > > > rv32 is in the unfortunate position of being the first one that has a glibc
> > > > > port, so it hits a lot of problems that other architectures do not.
> > > > > If the applications get fixed properly, then at least they will also
> > > > > work with musl-1.2 and a (will work-in-progress) glibc that will
> > > > > eventually allow building with 64-bit time_t.
> > > >
> > > > Ok, so in case of perf we probably should limit the needed patch to
> > > > riscv 32 bit architecture, unless we want to solve the problem for all
> > > > 32 bit architecture with time_t 64 bit support.
> > >
> > > No, whatever you do should be written to work on all 32-bit
> > > architectures. It would be crazy to add a special case for one
> > > architecture when it's easier to fix it properly.
> > >
> > > What was wrong with the helper function I suggested?
> >
> > Sorry, I was just trying to have a more clear picture of the problem.
> >
> > I'm totally fine with the helper function you proposed. About that,
> > should such approach be used for every time64 syscall for which is known
> > that there is no libc wrapper?
>
> We have previously discussed adding generated wrappers for every
> syscall, but my suggestion to have an inline function in one of the kernel
> headers was not very popular at the time.
>
> I think futex() is very much a special case here because this is the
> only[1] thing that gets called directly by a number of applications through
> syscall(). All the other time32 system calls have wrappers that are
> provided by any C library, which will just use the correct syscall number
> to match the arguments, or do a conversion if needed.
>
> Most of the packages that use the other __NR_* macros need them
> for something other than calling them (e.g. strace), so a wrapper does
> not help.
>
>       Arnd
>
> [1] technically, there is also io_{p,}getevents, but that is usually abstracted
> through libaio, and only that needs to be fixed. I checked
> https://pagure.io/libaio/commits/master, which seems to be the upstream
> but I do not see a fix in there, so this version is currently broken on 32-bit
> architectures with musl-1.2 as well as on rv32 with glibc. Distros may
> have already fixed this in their downstream copies.
>
>         Arnd

That's OK with me.

Please, when you'll propose the patch cc me so I can test and give you my review.
About this, will you also patch perf to use __kernel_futex()?

Thank you, best regards.

Emiliano

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
