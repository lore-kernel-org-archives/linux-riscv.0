Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA8BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Dec 2021 11:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mPBxVpjEUvyVseZ89uv7pD8AnP7hxNz/eCH4iChQt8Q=; b=g1eTf9Dxn3ehGI
	JiAocX3aNi8iEiV9mNc+7A5aAIjaSDdt32LOHgnjIbyXzKNeTRwTWSTdgp7Ci1CWwSxRx4fhfhyk3
	LgkeWyYgjU1uoonuBC2ijhJo8NJbXhCZfift4xr/9374CYwryAlssB7+67Ks8O+uisRsHOPeJmMzO
	MBBluMtVWEf2LRcV2P9kRafAzKYuD5WOk6jxY1ZfUczFV2UHITypW/q6wkaTazOp0R+pnTiUNHSgE
	8A9cm87ROxfMp5/T1Kks1A31uykw9cNYRNcb8frpxIpkvpcByofVkws6Qpa626FO0/dWMdikQIUWb
	uyZP4m8IwIZp+6fYu14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxSQO-000YhL-0L; Wed, 15 Dec 2021 11:26:20 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxSPU-000Y8w-Ai; Wed, 15 Dec 2021 11:25:26 +0000
Received: by mail-pj1-f52.google.com with SMTP id np3so17097541pjb.4;
 Wed, 15 Dec 2021 03:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IDgK5WljJsEE72tHFtmh4oft8f0ktjQWWP2F9+hZzz4=;
 b=h9s7OMziLgCbHFmpGR3ypxIIlvmJAxYF1mbpQtvEak3ev8o4gRVxNhqWZfg1l+tlZU
 2SZxIPZql8ZLyqxRRoL9reCYsYM0dYJ7ZzqhsOGWW6K3jKfXsiWh4jS+YCkwrrhTqIap
 AaLWe+2Pony1YMsC7eurpu3qfxXBKG7LgV09r+Z+5hGhxXQpqHzrkrnyC2XMvvogm+Kt
 M3VmhDmXk1bLXR5FPS63ZebtiR37KL7XeAfEiXraB3B7WjIKW2qTLUc40zLfRHF2H6r+
 fzOidWqvpuXcFcSj/8F/PDcI5/NRm94qAmKwlGGisQeDwVcfRz08sGaux3PI3CZ0BOmy
 PMlA==
X-Gm-Message-State: AOAM531ABrGnf24PwjwnKbb+qyTHf8F8ccpF6VI+YAwQ05YVj40sw4ko
 kvb3odY6p1CnJclP3sLaXv7/moVl3Njfnso9TX8=
X-Google-Smtp-Source: ABdhPJxTjHnpffSsJmC6035WY0c2cEKJBF+ezsbT8VP/RTa/MAIljU1RvMTr65MIjBK9RD0SZSLczAStlVujCTlQBMg=
X-Received: by 2002:a17:902:7616:b0:143:a8cd:ef0 with SMTP id
 k22-20020a170902761600b00143a8cd0ef0mr10339972pll.48.1639567518745; Wed, 15
 Dec 2021 03:25:18 -0800 (PST)
MIME-Version: 1.0
References: <20211128200647.147058-1-kernel@esmil.dk>
 <CAK8P3a1NvT=f2vOvgk4HdBc48A+63B_0SBQ5AVOO6cu0MiMFiQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1NvT=f2vOvgk4HdBc48A+63B_0SBQ5AVOO6cu0MiMFiQ@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Wed, 15 Dec 2021 12:25:07 +0100
Message-ID: <CANBLGczcO298ADMjVpuB8p-yYfD7aO11A=BUYU7Ws94yksbGxw@mail.gmail.com>
Subject: Re: [GIT PULL] Basic StarFive JH7100 RISC-V SoC support for 5.17
To: Arnd Bergmann <arnd@arndb.de>
Cc: SoC Team <soc@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, 
 Fu Wei <tekkamanninja@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_032524_413251_D36DAE3E 
X-CRM114-Status: GOOD (  19.11  )
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

Hi Arnd,

On Tue, 14 Dec 2021 at 22:30, Arnd Bergmann <arnd@arndb.de> wrote:
> On Sun, Nov 28, 2021 at 9:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> >
> >   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/esmil/linux.git tags/for-soc
> >
> > for you to fetch changes up to 398d6e139782d1ce2c9822beb8effba0c9c51cc4:
> >
> >   RISC-V: Add BeagleV Starlight Beta device tree (2021-11-28 20:07:09 +0100)
> >
>
> Hi Emil,
>
> I just got through my backlog of pull request and got to yours. All of
> the contents look
> fine but I noticed that there is no tag description. Please sign the
> tag with a gpg
> key and add a description that explains the contents of the branch in your own
> words, the same way you write the introductory mail of a patch series. This will
> become the description of the merge commit.

Ah, gotcha. The thing is that I don't actually have a gpg key at the
moment. I can generate one and use that to sign it, but then it won't
be part of the web of trust.
Alternatively I can just send it as a series of patches with a cover
letter like I did before. That would be a little easier for me, but
what do you prefer?

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
