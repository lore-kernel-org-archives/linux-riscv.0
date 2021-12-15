Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0CBC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Dec 2021 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIxjCraC/MzJx1SJNLtWZYU8rjeJ9qe94Qp2KhCR4Bw=; b=LfgWeJW1ep1baF
	AZ36fo5I5Yz+po9dYE1Imm1wWsPTa7Yk17PiiygvMkie9eS6g7pMl3ItylsbEc3mgwBOLN9wtbapO
	uH6bC843uukBL8lHsHjLRR6ySaRosManfv1+TrHi1BI+uvTudDBJbaMtoQjCSqjClwe6SYgjRJrsC
	T3iek0NrM7hzFvpixUsCe0jtRRtCj2Pcojo9DzjeAKw32k3QwDieXfFwWXNnJ/J25I/fiayC/SwfN
	yZApiA7ODRHgAYlh+04WB0f+txjBpjAP6tkzyuFLxQKor+5HPIJbABvrjDLNbL9XA0dRU205m2Q3V
	GsaAxxfdjhEPeDXE4DHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxTEA-000lYo-0g; Wed, 15 Dec 2021 12:17:46 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxTDw-000lWy-EJ; Wed, 15 Dec 2021 12:17:34 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M4bA6-1mz7Nv2pYE-001g0r; Wed, 15 Dec 2021 13:17:29 +0100
Received: by mail-wr1-f54.google.com with SMTP id t26so1535428wrb.4;
 Wed, 15 Dec 2021 04:17:29 -0800 (PST)
X-Gm-Message-State: AOAM530wT7QXf8PajK6wqVUNu+mgnhdWKztwaqz8D6/U6c1Ne2ef5bTd
 Tnag2nU8XAuOhYtB2FTQqC0nDSTj7oVK502p9Ok=
X-Google-Smtp-Source: ABdhPJy4UKqRtvfW6cQvay0TouvbgOcKUZFX6EhOJsYe0gXztFfMaTeFyMMU07ylgV4KhXO0AgB9iHRCI3fQ2oooVhs=
X-Received: by 2002:a05:6000:52:: with SMTP id
 k18mr4239230wrx.192.1639570649252; 
 Wed, 15 Dec 2021 04:17:29 -0800 (PST)
MIME-Version: 1.0
References: <20211128200647.147058-1-kernel@esmil.dk>
 <CAK8P3a1NvT=f2vOvgk4HdBc48A+63B_0SBQ5AVOO6cu0MiMFiQ@mail.gmail.com>
 <CANBLGczcO298ADMjVpuB8p-yYfD7aO11A=BUYU7Ws94yksbGxw@mail.gmail.com>
In-Reply-To: <CANBLGczcO298ADMjVpuB8p-yYfD7aO11A=BUYU7Ws94yksbGxw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Dec 2021 13:17:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3-ZSHsJJ=kS_tRWqkv013DR24_20Uqsm1U3vs60NkPbg@mail.gmail.com>
Message-ID: <CAK8P3a3-ZSHsJJ=kS_tRWqkv013DR24_20Uqsm1U3vs60NkPbg@mail.gmail.com>
Subject: Re: [GIT PULL] Basic StarFive JH7100 RISC-V SoC support for 5.17
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, 
 Fu Wei <tekkamanninja@gmail.com>
X-Provags-ID: V03:K1:qKBMQv92JErDNQF8Plh1pL+kHHdxI4YI/xv5MeQ2tHBuAHwKwHo
 2hjJGdeAOkmnlV2BxY9B9fUaVLKIbs4XoItNcBoeXKnl8JYG1FKIDOH3NklsUXgs/sZzddT
 MblTE0imEB/XQaEhqx7HigFfubda6mWhasIASUuYDM0WNTPE+1Q6sKNJgeiaOC0pLC8czCU
 dTvJ2WNuqC+xyP/HbjhRA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1caCuaqZjjI=:GTFqRZ6zEVEWeC+R291eLI
 PgIv7x9ua6RgcG/ivGImfSE4qdLKjG5KcJgW3Bp3XAVobxzz9AMAsZlgjCXh64KQEDWNlM9YD
 ZVUCIDfpqR+dsCQRk/gz/W5UYATJ8rlpiB8TFVaVNjsAbBAkSEfvC9SLomcW/KDUhLgEn+Umt
 yN+jEgSRe58sPYM8kA+a62kcphi4VOXYv0ZJBvSKJaZeI7cSJFmPoFDzejbgZMEhNIVplJh3v
 fFSOBkYgulOa+71usOn0b/nsJ6qU19rGuV44MKY+vMowEealINP836WxGjZcuax+EvGnTur92
 pyOodQmdKbflNOYlPIWUJaMj66wDisyYuJQkAm3oe0fjjzzijRijgCAVjJHFeKGGkLc8UJ9D5
 Wsvg8l/QkZnqXHCfQtkxvB+KSsxzJqON+uwItvL+59i5jmwVZjt/LiS9i2NAHs+71uzN/Hgwm
 2iVXRH7fHMW8lrZvnEasL1cppkFctTdDLXksWJbx3DPWZurQQJpSVVd5VB5PA5/di5/VLyNV9
 PbDOs+lJ6OMidRks6KDqGyyiKXF4l52qZMEB9IwB4kohHhmdJDkf9DEzp0Vu4HOIY28c3ifn5
 rfteQ2x5Z7Z5OEH8wT7fxtiwvVcoWFYFRrt05GxL1XuQVKbCcWSirOPw/LBRat0CMlf9wFIgV
 bO6UqNjpsBJ7N7ucSZyuYeavGiJu17BEge4tfEWVd6jJ+SafjTZ7AeOETc33WDxMpwUg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_041732_802364_FE0C4210 
X-CRM114-Status: GOOD (  23.14  )
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

On Wed, Dec 15, 2021 at 12:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 14 Dec 2021 at 22:30, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Sun, Nov 28, 2021 at 9:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > I just got through my backlog of pull request and got to yours. All of
> > the contents look
> > fine but I noticed that there is no tag description. Please sign the
> > tag with a gpg
> > key and add a description that explains the contents of the branch in your own
> > words, the same way you write the introductory mail of a patch series. This will
> > become the description of the merge commit.
>
> Ah, gotcha. The thing is that I don't actually have a gpg key at the
> moment. I can generate one and use that to sign it, but then it won't
> be part of the web of trust.
> Alternatively I can just send it as a series of patches with a cover
> letter like I did before. That would be a little easier for me, but
> what do you prefer?

I'd prefer a pull request. The most important bit to me is actually the
tag description, not the signature. I'll go through the contents once
more anyway, which should be enough for me to merge it.

A signed tag is still better than one without a signature, that way at
least your key is part of the git history and we can confirm that another
pull request came was signed with the same key, even if we don't know
who you are ;-)

When you create a new key, please follow the directions from
https://www.kernel.org/doc/Documentation/process/maintainer-pgp-guide.rst
andyway, so you can add it to the keyring after you have collected the
signatures.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
