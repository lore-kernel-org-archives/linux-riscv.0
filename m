Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28A3C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 20:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wLqxSTaCyR9ORMfSma4HLQ0z9DX3ey2uI/0R/Jo7c/o=; b=g5P82ZTiibNgAx
	UNj6OZ19ix4y/nB1w/jH0dR58Xxlj/fdEF5Ojh8Br3d6NPRLjehkRTCcb4lNH4+sKUQejPtpyLdZ2
	A2RAJAYrupI+MHzzDEITgJhQr3KaOjMh1vYfzyzOx7twRletZlDBiTVqyppJCknOOsU2kxYXxGTC7
	TFeZFRJV5xAd7QWQdX7nuyMAYSXPtxLa3GqJL1cM4IyFyEripfbQ3hFQ7SF2bKMnFRPJtVWZ+hB0z
	vKmeFYLl0bau2D8MSb/Pk56UWGMeEJygtnhEiWFnLX/MjIP8ImDsBkzkkq+1uwv2jt/eWyqoUrBDQ
	vtNspxn7xYAkBjZszV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbTcn-00GOJr-BL; Mon, 04 Apr 2022 20:48:33 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbTcj-00GOIq-VZ
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 20:48:31 +0000
Received: by mail-ed1-x52a.google.com with SMTP id f18so7515969edc.5
 for <linux-riscv@lists.infradead.org>; Mon, 04 Apr 2022 13:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hwk8wNBo32OmqYHy/lorDp6jxAIWbUvyfxVID6NQWMs=;
 b=MgQmlEUX2awo9FGSPrgoUcYWe7XJZtfBcbV29fxnVVbjc3fXXrfVTWrbf2FEFcWonc
 f0aKsGNt8xLswvAf+ZPhMd5j5QzbyREtH5EG01bJE669ZjjMFoCvsLGPKRLoJVuom9dZ
 kYDVGColrzu6iRkzxv5ZReRUd9ML2sggd3BMjTtGMEkH1295xZhX2QGenYIfKlQxetMx
 wEl7pjgvYdNikY+mO/2Nm0tMPt7LhohPkX3Rwa6Aslkud3EOtvKb96eSd5wNJblieh0R
 40OeE78e2N7TGKbSRYTN0wXN/vb0WgldQS9luj+/MJkrgEZ2kqq3FNMc4ahhO48f2+pr
 C7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hwk8wNBo32OmqYHy/lorDp6jxAIWbUvyfxVID6NQWMs=;
 b=tMtf3scs9bQDWDGbv1etnjip+HwUnLkU4Terh9//+cEuWqW5AIYIZi9aHVRVr+pCb5
 c/5Mnap/Ox27i2iK7Gmse7pbHDobQd8wJZRDS3MslItNuPS10HIxuWRs6cV8hANFvxQW
 7OB+DXpummWjCyWQSVyv+VUJJlKlmD2vYwRfZnNwcwmJxd15YdlR7NW17YFxViZBJkYl
 4UthE5zASH3wG/oX/b9m0cORimoGXcHy4x3rx3E7rkA4lWvo8+mbQu6RtiM9BPFRyKIa
 66uod9/vHkn2+eV6VvxixQFrYrOBGb5ySW4AXKK0JdbbUhOwbIKX2j5ASyaHB8UI0Z7V
 Pt4w==
X-Gm-Message-State: AOAM533MVbjf/NRGAhTc77ZdY5Q7TqGEouKDrDHqeDBBtgRN1xnU4qoZ
 plM02ODtRLBIkiEZI8YRHqSH87eUVOlbuZCab/4=
X-Google-Smtp-Source: ABdhPJwcTZ56W4jcHhaPz18ivbz2Gd1BIwaysH0yZIitWtcgDhHrV8MgH68GVFQRRYpSZqIgJE5hbn6sHjvo6V1CGTw=
X-Received: by 2002:a05:6402:27d0:b0:419:5184:58ae with SMTP id
 c16-20020a05640227d000b00419518458aemr4939ede.314.1649105307534; Mon, 04 Apr
 2022 13:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMo8BfKgn0T5RtUTb89fPvygNJJYLy7r1=RZTmTTm=jiDfx1hQ@mail.gmail.com>
 <CAK8P3a0J1--WSyWY+TptFa0nn5d-mOxapadCE1csGRkfhSPbVw@mail.gmail.com>
 <CAMo8BfLT8vMw3aGQPs1+9ry7W63SQphmDc4Tt4A3JvADHJhxiQ@mail.gmail.com>
 <CAK8P3a3iFb+ZacZ40d8PC_xcJpLVFXT0Qc-oYEZNkFqXdsfNZw@mail.gmail.com>
In-Reply-To: <CAK8P3a3iFb+ZacZ40d8PC_xcJpLVFXT0Qc-oYEZNkFqXdsfNZw@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 4 Apr 2022 13:48:15 -0700
Message-ID: <CAMo8BfJJXTTbeiUSgU=FLoDMM89fjybjKO+sPz2wu4f=2obAxg@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_134830_073423_5FFB22EE 
X-CRM114-Status: GOOD (  21.80  )
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

On Mon, Apr 4, 2022 at 12:36 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Apr 4, 2022 at 9:14 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > On Mon, Apr 4, 2022 at 12:01 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Mon, Apr 4, 2022 at 7:57 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > > > Please let me know if you observe any specific build/runtime issues.
> > > xtensa-linux-gcc-11.1.0 -DKCONFIG_SEED=
> > ...
> > > /git/arm-soc/arch/xtensa/kernel/head.S: Assembler messages:
> > > /git/arm-soc/arch/xtensa/kernel/head.S:87: Error: invalid register
> > > 'atomctl' for 'wsr' instruction
> >
> > Sure, one cannot use an arbitrary xtensa compiler for the kernel
> > build, the compiler configuration must match the core variant selected
> > in the linux configuration. Specifically, for the nommu_kc705_defconfig
> > the following compiler can be used:
> >
> > https://github.com/foss-xtensa/toolchain/releases/download/2020.07/x86_64-2020.07-xtensa-de212-elf.tar.gz
> >
> > If you build the toolchain yourself using crosstool-ng or buildroot they
> > accept the 'configuration overlay' parameter that does the compiler
> > customization.
> >
> > Perhaps the documentation for this part is what needs to be improved.
>
> It sounds like a bug in the kernel Makefile. On all other architectures,
> you can generally just pick any (recent) compiler and build any kernel,
> as the compiler arguments set the exact target machine type based
> on the kernel config. You can't normally rely on the compiler defaults
> for kernel builds.

It's not just the defaults. The binary instruction encoding is configurable
on the xtensa architecture, configuration overlay replaces parts of
the toolchain that do that.
The additional CPU state is configurable and the kernel gets customized
with the code that loads and stores this state when someone builds it for
a specific xtensa core.
These customizations are done by the users of the xtensa architecture and
there are hundreds of configurations in existence. The toolchain has never
been supposed to support all of them at once.

-- 
Thanks.
-- Max

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
