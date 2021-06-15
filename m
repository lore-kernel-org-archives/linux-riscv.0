Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADA2C48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 20:26:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2099613B3
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 20:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2099613B3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAPpCTVX00hPuFdAI0InpnU3Zqb8voK3oGpYu6gJlkY=; b=3UgpseZ69TB05F
	CSRWIIaFdyhoNoL0tJVAEQ4yXe8LWJPF4CTNJnwlYvC6KPGv/6wK0yG1xbSLVjq0KPH2omyooTlBi
	cbdoGqXLNUkJ5NRGpPU2jIYdAIw1nCIJG4ZWOS7N4AJ9TD1Ol+01nJP0aFC9J3jNAFRzBFaskPrfL
	ox0hKLQ85igXLh5d/doYJj1B13UjBgqFB9EcqfN2qDzQX4pJoe746ZBmIE+uVZNiMwB4OAyEqeamG
	/KDoya/9jKAkcrYbJo5JZXs3b1Nai34gT/NTG7dmOObQnQJ++k4uxFrRbj+xCuhWU9V5y6+3DNlXl
	c6KneDc78YMz0iMmL6sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltFdA-002mRb-Cj; Tue, 15 Jun 2021 20:25:52 +0000
Received: from mail-yb1-f182.google.com ([209.85.219.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltBgE-001G4H-TA
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 16:12:48 +0000
Received: by mail-yb1-f182.google.com with SMTP id g142so21291299ybf.9
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 09:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Wv7CHWzkockHzF8pGG/3fcdtGeJKMuare4U3i4RVgA=;
 b=mNmtymVIDgkHpbT/Ghr+E2uCfD6u+uglAetp2EHeg/ul5+WUgg8fcsznEH9ybsjuKX
 Qh803JYeqlngrQudCC5WyC0Jc1jzVCHnybCYsxrYnkt9wJsKHo308+3iq0rYXE2qBRHG
 Um/eSNIT9LxrKomRGTt3p37T1DCq7b712xzx8bhTjMQ8ebs+EUSMS93aJklL8eL3qOAq
 2FZlX/b2nKeDKcoHdrNd11KWBE6Bf+hplBMx8pDF5SLliiurlLuMy8vLcdvh70wL3C2j
 rBQ6H6wIn2+vPH1Tnu7B0nmPmtX0ijvpnF8rgNaqfv7zVgRC+bSGjfquG8fKX2pjmGn+
 zDQA==
X-Gm-Message-State: AOAM5336sGBBRT3shqC2OEniIJawTOeDYqSdW+syaDmIAfJcKQsWyh7C
 F1sCuRxuV/l62TKwNvmmF6POgTK/KVkxdHDwsmA=
X-Google-Smtp-Source: ABdhPJzem0nOOYC0h+0gvK/9pLOrRYLo1iiurmeFo4Dna/ffTj8redI7Hw0vk+bc5/9Buy9+CHwRZcgMNeRx5wRB8ac=
X-Received: by 2002:a5b:d11:: with SMTP id y17mr33994254ybp.18.1623773562254; 
 Tue, 15 Jun 2021 09:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210615023812.50885-1-mcroce@linux.microsoft.com>
 <20210615023812.50885-2-mcroce@linux.microsoft.com>
 <6cff2a895db94e6fadd4ddffb8906a73@AcuMS.aculab.com>
 <CAEUhbmV+Vi0Ssyzq1B2RTkbjMpE21xjdj2MSKdLydgW6WuCKtA@mail.gmail.com>
 <1632006872b04c64be828fa0c4e4eae0@AcuMS.aculab.com>
 <CAEUhbmU0cPkawmFfDd_sPQnc9V-cfYd32BCQo4Cis3uBKZDpXw@mail.gmail.com>
In-Reply-To: <CAEUhbmU0cPkawmFfDd_sPQnc9V-cfYd32BCQo4Cis3uBKZDpXw@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 15 Jun 2021 18:12:31 +0200
Message-ID: <CANBLGcxi2mEA5MnV-RL2zFpB2T+OytiHyOLKjOrMXgmAh=fHAw@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: optimized memcpy
To: Bin Meng <bmeng.cn@gmail.com>
Cc: David Laight <David.Laight@aculab.com>, Gary Guo <gary@garyguo.net>, 
 Matteo Croce <mcroce@linux.microsoft.com>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_091246_980162_701C809D 
X-CRM114-Status: GOOD (  13.43  )
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

On Tue, 15 Jun 2021 at 15:29, Bin Meng <bmeng.cn@gmail.com> wrote:
> ...
> Yes, Gary Guo sent one patch long time ago against the broken assembly
> version, but that patch was still not applied as of today.
> https://patchwork.kernel.org/project/linux-riscv/patch/20210216225555.4976-1-gary@garyguo.net/
>
> I suggest Matteo re-test using Gary's version.

That's a good idea, but if you read the replies to Gary's original patch
https://lore.kernel.org/linux-riscv/20210216225555.4976-1-gary@garyguo.net/
.. both Gary, Palmer and David would rather like a C-based version.
This is one attempt at providing that.

> > I'm surprised IP_NET_ALIGN isn't set to 2 to try to
> > avoid all these misaligned copies in the network stack.
> > Although avoiding 8n+4 aligned data is rather harder.
> >
> > Misaligned copies are just best avoided - really even on x86.
> > The 'real fun' is when the access crosses TLB boundaries.
>
> Regards,
> Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
