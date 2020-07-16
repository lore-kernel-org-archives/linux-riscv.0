Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1BDC433E2
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 17:36:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52F692071B
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 17:36:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NUetV8m9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="huwk61sF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52F692071B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iJb/HkRTFR+FninlflVaFUvKNN8atTy4zLh/EZcqMeo=; b=NUetV8m9YBM7zEXNC70EZezfu
	DaVWwgA0gjiHC9P6Fs768jgrteA99Mg8kw4gq5W3OPVMHp2SStUXi9Omp1MRVSjOLRfTCfBzLoqDx
	FeKaEeCf2ss6TlCajZjej/bB6e1fQAFD02w1G05+9J6b5+ayXwttgfbx/6LHVtY4+zxkkEADKGfwV
	tZoXAHeCytreSKFb36ms9ShRNN85L+kIU8fZBR5EQwkbsU5nZ27aXkZRf1VUxdKFtYgAMF9/DUlq1
	fVIvBbXExTq9n/M0b0zehIeTeZp4Zksddqh3WTUi78TAZmoLqx9s/LxZWdQJ9M0uNChYukSbIU94j
	3fUIysHRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw7oJ-0001V4-F0; Thu, 16 Jul 2020 17:36:43 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw7oG-0001UL-Rm
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 17:36:41 +0000
Received: by mail-wr1-x442.google.com with SMTP id j4so7914747wrp.10
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 10:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s1Xe5FVL8v+1eywt+3dcSL0vt8HArhmlt9QDLVKJvGg=;
 b=huwk61sFwgkwX+rIdL1UwMppbVjaotVYKGZ8A1c87Q09jVAU+9tfpA2s5vQAZ8Gx15
 g/QRfs+JBccpOjFiIdnWgLH0/wsJ9ufkB/U+R01i36ToOsxBCHirff1hN4D6aQukV0RZ
 xbGFvFFcEjtVEGHTiNklW1mQqDxP/bqpO9U5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s1Xe5FVL8v+1eywt+3dcSL0vt8HArhmlt9QDLVKJvGg=;
 b=oXwCICSyadCLmPohvrpoa9rQZZNZxH19cxrO+q0adh25tQoNRis7pZlNRelyYPoYWv
 hicJSOJuOslUZlZ3blkxC8wWWNZcrjaLCvfKLCBu3cx/cmcKOEbVERd6PtudqeG5ZIir
 oh3WDi8QMamMfcsaMugI1XI0pB6OOCnevMhnhXUWBFrnNcS//P+/KWwXzp84vPf6ymUJ
 ti1iYcBk5Z0AS2tVPoOyb1WxseSJiOuLFgaxppmBc1BwHDbAzi4Zekx9rM5Tnnh68OeK
 VdDL/1A4Zixtc3okr44MGwo39vKjAXoZN7hqCY/S6Fp18BZhQrlBjdt1tkB7aebWKF00
 7NWQ==
X-Gm-Message-State: AOAM530dMtdq/G+NgsS0oFpSvSlrowEcyI8ZPsMMeed/pI4jVw64DbwQ
 VGtL2JEa68pqbAHuXi38QKHVWK0IVCcoz2hxU7ow
X-Google-Smtp-Source: ABdhPJzH/M6iOldLkAVo+x6vvyzgBEI/A4BlfDJVD8ygpD0sIWEvyuZKTN12qt4Cr9POgbNGwyZtMiFaXIG0XgaIW9k=
X-Received: by 2002:a5d:4c8a:: with SMTP id z10mr5951602wrs.384.1594920996467; 
 Thu, 16 Jul 2020 10:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmV=rThbdZnjY_cbkKBeuRYNL0O2QLoJQGFPRc90SZjHoQ@mail.gmail.com>
 <CAEn-LTqnsygh40cqMf4Z41FuZh-tOO2bubNv7vqZUgMbWJT+RA@mail.gmail.com>
 <CAEUhbmW2UHRFJct=Ftizdb5zgib0ZRCwEot=sT0skrhoJtWLJg@mail.gmail.com>
In-Reply-To: <CAEUhbmW2UHRFJct=Ftizdb5zgib0ZRCwEot=sT0skrhoJtWLJg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 16 Jul 2020 10:36:25 -0700
Message-ID: <CAOnJCUKygJk9E2c_Ye2s+xkAa-Ah2naK-YD=8wFGud+JYXhirA@mail.gmail.com>
Subject: Re: Patchwork for linux-riscv
To: Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_133641_061651_D4CE1354 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 16, 2020 at 1:49 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Jul 16, 2020 at 4:33 PM David Abdurachmanov
> <david.abdurachmanov@gmail.com> wrote:
> >
> > On Thu, Jul 16, 2020 at 7:50 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > Patchwork for linux-riscv seems to be stalled.
> > > https://patchwork.kernel.org/project/linux-riscv/list/
> > >
> > > Or am I looking at a wrong place?
> >
> > Yes, it's stopped updating.
> >
>
> Thanks for the information.
>
> > There was an issue with the mailing list (and emails were lost) at
> > almost the same time.
> >
>
> Ah, I see. OpenSBI mailing list encountered the same problem I remember.
>

Both OpenSBI & linux-riscv had issues because the hosting server crashed.
Unfortunately, there was no backup as well which led to losing all
archives in OpenSBI & linux-riscv.

> > See: http://lists.infradead.org/pipermail/linux-riscv/
> >
> > This might have caused an issue with patchwork.
>
> So could someone re-configure the patchwork to bring it back online
> for linux-riscv?
>

I thought the patchwork server is different from the mailing list
server as patchwork did not lose the archives.
At least that's how the OpenSBI patchwork is set up.

I will check the patchwork admins about this.

> Regards,
> Bin
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
