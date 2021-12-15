Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B954AC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Dec 2021 12:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4g23RZYCH4INJpEpfkoLY3Rd7I2i40Gw6hR1ppI4Zw=; b=z+HlMOKTLaVqBp
	/G2aIgQJq5QJvAYHXyTmmzORkpWKq4XMWupClp97C/2XPGdkxLRXA/3frK2kB0YSJQvkPWlMLUGnX
	VvGJMzF9xwomTGtd0HR+BNM0Gt61iPnLoAPJ1tMXAS8Zw08ppMp3EKqM5XiN50zExG31CxeIWldci
	m0fBWohNG/ow3WtPqGDQOjZeox9zWNvN8VsiyDZdPegV3zULez5jEKuwWiQ6BKQHp36YYZzvHesil
	CugAQPhnCZouUhSu8yCushBpobraWkH82ezcw3vJHnV27Mj+MVYrt5ton8jREEFSNudUjKyM9UNEQ
	37sf3RdjUdgbumSdW2Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxTNT-000n0p-Db; Wed, 15 Dec 2021 12:27:23 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxTNQ-000mzc-5W; Wed, 15 Dec 2021 12:27:22 +0000
Received: by mail-pl1-f170.google.com with SMTP id w24so3582754ply.12;
 Wed, 15 Dec 2021 04:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cdrzgxxaZww/l2rcuws83urbBn8Do58NhJhBwCmMimg=;
 b=ZlsMdL+J2nBZeJPEwZyE7qV3VcIfp6++Odzyw33tcwnU6XWiYlihAUuNclAC3aeLj1
 vW2i4bYEHfhqmCEVWlQZOavTOrb3XbnUf1O9b5gkBiYOP3tpQvTjk2CJ4XSiSPLg0MGP
 BzVvz4YwZhFAp0yRcdv7wK0hLEAeZx6cpDma8fAJYDuqBfbhCn/euZLAFDN8X3pwrbaY
 VgCHih3nrSpSDW6wjWtZM0kPPiInehnfvj77Rlkq/kLZEqEfs484IeTqkk/w4wxLzchK
 ps1ac1pcfnlxALgw3FRKxRDMOccSj3rIjqeA9bdUpOBhaNGiBYQKBxvQzDZ7Zp/v6OVS
 dyBw==
X-Gm-Message-State: AOAM5333l1Na4UgoGSmitDNL/RA74mpvZocH4jtfCQ0Zl7Yd3fijKwER
 G0CuLZX07QlyBKCjUat5UH1Z+ySyW4YkocAc7N7pyIGfrVmi4Q==
X-Google-Smtp-Source: ABdhPJzWiB8wF41D06DYo6PG+1QNnBepipzq/MOuOKTyB4bOog9Jp145EzqkGXttyXYbnSXsvMrFXkPJGZtAX6aYHO0=
X-Received: by 2002:a17:90b:4b0e:: with SMTP id
 lx14mr11591436pjb.160.1639571235268; 
 Wed, 15 Dec 2021 04:27:15 -0800 (PST)
MIME-Version: 1.0
References: <20211128200647.147058-1-kernel@esmil.dk>
 <CAK8P3a1NvT=f2vOvgk4HdBc48A+63B_0SBQ5AVOO6cu0MiMFiQ@mail.gmail.com>
 <CANBLGczcO298ADMjVpuB8p-yYfD7aO11A=BUYU7Ws94yksbGxw@mail.gmail.com>
 <CAK8P3a3-ZSHsJJ=kS_tRWqkv013DR24_20Uqsm1U3vs60NkPbg@mail.gmail.com>
In-Reply-To: <CAK8P3a3-ZSHsJJ=kS_tRWqkv013DR24_20Uqsm1U3vs60NkPbg@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Wed, 15 Dec 2021 13:27:03 +0100
Message-ID: <CANBLGcxzdx=Rr1J=UnOTVpYybCpZPFYfPLWtd7QP8k9E-G=CQw@mail.gmail.com>
Subject: Re: [GIT PULL] Basic StarFive JH7100 RISC-V SoC support for 5.17
To: Arnd Bergmann <arnd@arndb.de>
Cc: SoC Team <soc@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, 
 Fu Wei <tekkamanninja@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_042720_233025_5A2F9C64 
X-CRM114-Status: GOOD (  27.97  )
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

On Wed, 15 Dec 2021 at 13:17, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Dec 15, 2021 at 12:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 14 Dec 2021 at 22:30, Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Sun, Nov 28, 2021 at 9:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > I just got through my backlog of pull request and got to yours. All of
> > > the contents look
> > > fine but I noticed that there is no tag description. Please sign the
> > > tag with a gpg
> > > key and add a description that explains the contents of the branch in your own
> > > words, the same way you write the introductory mail of a patch series. This will
> > > become the description of the merge commit.
> >
> > Ah, gotcha. The thing is that I don't actually have a gpg key at the
> > moment. I can generate one and use that to sign it, but then it won't
> > be part of the web of trust.
> > Alternatively I can just send it as a series of patches with a cover
> > letter like I did before. That would be a little easier for me, but
> > what do you prefer?
>
> I'd prefer a pull request. The most important bit to me is actually the
> tag description, not the signature. I'll go through the contents once
> more anyway, which should be enough for me to merge it.
>
> A signed tag is still better than one without a signature, that way at
> least your key is part of the git history and we can confirm that another
> pull request came was signed with the same key, even if we don't know
> who you are ;-)
>
> When you create a new key, please follow the directions from
> https://www.kernel.org/doc/Documentation/process/maintainer-pgp-guide.rst
> andyway, so you can add it to the keyring after you have collected the
> signatures.

Nice, I'll try to follow that then. Thanks!

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
