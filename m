Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD37BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRFNdu+m5TDBzYmZgjqCGo1ST7r15b81cf2VaIkMxAg=; b=nbTbVy1O8CSPT/
	vuy/aGX90GzpL8LVHRNRwgBCojMvxXKeYGfX7xkeWm3sKn0yZVERLvQeoK5j7Cije/vH8VD+GqHKp
	tBEb/P2xpQnXrJ+YWIHdRRHRmnIDYj9ldtnSgeBi6M/OgIbtlWxY9wRMObNqjJ+CIBskq+ue4e0wX
	+1tJH6GuK3IM4Sjm2rgSRfHEzP7KiPHTmHSUA6tkKuPeYg8rnyd4xXuBWM9XRwLNRilepmULrc76R
	QgNc8FsD2GZHtm/gQ7Tw5IIp5x8YRPByLjj8f4ksWmDlr0sNggtNtKO51EC+UcP3ZZJD/A6pChcVo
	95Cx1B5XAb6vRtMmNOoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA6hx-004OcX-G1; Wed, 19 Jan 2022 08:52:45 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA6ho-004OZT-8G
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 08:52:38 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DB00F407F6
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jan 2022 08:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642582348;
 bh=ai0mtCcxBfPYjg/Rd+cRPtcnrmZDCgQL5kNBaw6vXBk=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=MpXAuc4JOEkWUtixkFTJTFfCLuRZ0eTXWaVmYanA8zon1qexqm4Z3ZP+rtfuQ2vtP
 8+CEsifp8jxuMKy8pJ353A67J6lF9Xyy2XMPMj3gd0vr7ux5cWaDmNCAQCD5PYLuRf
 XO7u4G5Ex1qjCDCnN2sFBjysWHdK4502r2vL0uvf8+tDeguN91HL0xkN63f1Z05SCt
 Cdfdt6w9VEhSip1Tr5zxYKcUpBQ90DHkmY3ooG3EmKxtElKA96GufQmc9hQdFKRLHb
 qCbWH0Dp6BvxPM8t8jH1IAEBq3Rrov7Ps9TSlUj8eKAF++8fmHalHXTFlvgXBqhC3C
 nOBIURmQkTySQ==
Received: by mail-ed1-f71.google.com with SMTP id
 h11-20020a05640250cb00b003fa024f87c2so1653970edb.4
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jan 2022 00:52:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ai0mtCcxBfPYjg/Rd+cRPtcnrmZDCgQL5kNBaw6vXBk=;
 b=1cXM6j2NQAAS7NbFf6qQoHAeACdRFoNhs4YRVJBsweAU8qAIgLUw2csouNuaZsy6HY
 aUBvKnaKdBbdrmI3K6udGWXf5lszqieZRteWUJLCxKSDlVuzCwrU47IAoHOgTuSQVDeF
 mpklEyK2JEpR/2ygRG9x5ne+8qUd8dFJSMtvgiek+D4y3ucMCBEPlp0tzl+A/jKmXexr
 /uS77QI7phe+erw3LdLKRMscSQSvtECgEmHZYOIKdGtIdbnauRhmL+AqVJjvqpgqahKR
 lUY50HuNRCa2Z912gJxm9KpoClwvlOeSGT2GqR31Yr6Z4GPEE99qLfOgnEz7+NDeUbBK
 QMcA==
X-Gm-Message-State: AOAM530zGIETAJfxO7mwE3a3Q+hJxf1GrEQV+aLyp5lu2Zmwv/73aGt0
 xi/CMuBlDh5zgZteQn27rCmSEjkM/L2nQb7b2YQ9rL5wu6mLxTgpfelMhnMnVeoVAP5tWiP2ZvA
 IfIOkwBqEIVEz2CM8xZd+7kGst94AJID5TnZG3s4NR5faTr+rnx4zItLebyEKSw==
X-Received: by 2002:a17:906:4fcb:: with SMTP id
 i11mr24904294ejw.297.1642582348229; 
 Wed, 19 Jan 2022 00:52:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvCGsrVfBlF4BoQOo9l1ZqngpC3yvW73O8W0Rn9oOxRM0w3U3Wfwr4FENlXSPIpIE6MAozy60dCLchp0fsayg=
X-Received: by 2002:a17:906:4fcb:: with SMTP id
 i11mr24904268ejw.297.1642582347994; 
 Wed, 19 Jan 2022 00:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20211206160514.2000-1-jszhang@kernel.org>
 <20220116133847.GE2388@MiWiFi-R3L-srv>
 <YebK70Sx4w8zLfj/@xhacker> <20220119080859.GB4977@MiWiFi-R3L-srv>
In-Reply-To: <20220119080859.GB4977@MiWiFi-R3L-srv>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Wed, 19 Jan 2022 09:52:16 +0100
Message-ID: <CA+zEjCvqYAWaWW9hVbHqYm_GbV-BaiOM4c77WHnxDNh+SRDUuw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] kexec: use IS_ENABLED(CONFIG_KEXEC_CORE) instead
 of #ifdef
To: Baoquan He <bhe@redhat.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, hpa@zytor.com, 
 Eric Biederman <ebiederm@xmission.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 kexec@lists.infradead.org, Alexandre ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_005236_493474_BF8FD253 
X-CRM114-Status: GOOD (  29.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Baoquan,

On Wed, Jan 19, 2022 at 9:11 AM Baoquan He <bhe@redhat.com> wrote:
>
> On 01/18/22 at 10:13pm, Jisheng Zhang wrote:
> > On Sun, Jan 16, 2022 at 09:38:47PM +0800, Baoquan He wrote:
> > > Hi Jisheng,
> >
> > Hi Baoquan,
> >
> > >
> > > On 12/07/21 at 12:05am, Jisheng Zhang wrote:
> > > > Replace the conditional compilation using "#ifdef CONFIG_KEXEC_CORE"
> > > > by a check for "IS_ENABLED(CONFIG_KEXEC_CORE)", to simplify the code
> > > > and increase compile coverage.
> > >
> > > I go through this patchset, You mention the benefits it brings are
> > > 1) simplity the code;
> > > 2) increase compile coverage;
> > >
> > > For benefit 1), it mainly removes the dummy function in x86, arm and
> > > arm64, right?
> >
> > Another benefit: remove those #ifdef #else #endif usage. Recently, I
> > fixed a bug due to lots of "#ifdefs":
> > http://lists.infradead.org/pipermail/linux-riscv/2021-December/010607.html
>
> Glad to know the fix. While, sometime the ifdeffery is necessary. I am
> sorry about the one in riscv and you have fixed, it's truly a bug . But,
> the increasing compile coverage at below you tried to make, it may cause
> issue. Please see below my comment.
>
> >
> > >
> > > For benefit 2), increasing compile coverage, could you tell more how it
> > > achieves and why it matters? What if people disables CONFIG_KEXEC_CORE in
> > > purpose? Please forgive my poor compiling knowledge.
> >
> > Just my humble opinion, let's compare the code::
> >
> > #ifdef CONFIG_KEXEC_CORE
> >
> > code block A;
> >
> > #endif
> >
> > If KEXEC_CORE is disabled, code block A won't be compiled at all, the
> > preprocessor will remove code block A;
> >
> > If we convert the code to:
> >
> > if (IS_ENABLED(CONFIG_KEXEC_CORE)) {
> >       code block A;
> > }
> >
> > Even if KEXEC_CORE is disabled, code block A is still compiled.
>
> This is what I am worried about. Before, if CONFIG_KEXEC_CORE is
> unset, those relevant codes are not compiled in. I can't see what
> benefit is brought in if compiled in the unneeded code block. Do I miss
> anything?
>

This is explained in Documentation/process/coding-style.rst "21)
Conditional Compilation".

Alex

>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
