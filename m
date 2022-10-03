Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E34C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 02:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=e5LCVACGylNImDGTKXHfxQ0gFSuIVPSe9ePdNs1tgys=; b=HTXOV0Y3DegVVs0/wg/MTqm9DZ
	4a4jLaQ6otFAxdfb2gl+uxYlzBSRKgvb2lavIwiShY2feYoq88nHbeJZo2xDUSdtqU9R0dXkQb9FB
	6i9yTe/15IYdHh+yw+E+Ie5TuLZ0QXyeN5PI7BVtpscbvWAmjJgknRkO1+vxNl2p9npCFeECz1Iyy
	SM1MqqIk35LADfgfSDROTwxrpAFZZNlG9x68ztxwhSHbOY2YCRo97BIkCsUCfgCAsGtuYMICITPrd
	U5Na/0q5DdLUX+K/ss+W+v7WulBEypb4pzHlfqs8oZ2py2jZAtgh3jETmTOyhh60VD+bqX4yG6Gf4
	Q2A6jSgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofBPz-003XJm-E8; Mon, 03 Oct 2022 02:42:55 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofBPv-003XHA-KO
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 02:42:54 +0000
Received: by mail-oi1-x235.google.com with SMTP id s125so10204585oie.4
        for <linux-riscv@lists.infradead.org>; Sun, 02 Oct 2022 19:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=kZ54JuJ/U11o6QZTC2tSUVSElKXkiA2E63Q+E0+5Ows=;
        b=M1kro5I7v0dN31CoUeGS0m8+9Yf45ZG6QCrky+SzJN7D4wnopN5pJ1iD4DKfrqhsd7
         934qA5PX17Ao3ydsvtEhSgZTHMUBPtu9uNl6vusKBV/tkvItvV7gEknxWTsRhMdrLnr7
         aTywdmbcaSLkjs79ZkeUk79OrjF/ylKboifLPFppb3jJFw2413QcVXHbF/Q3wCsNNnLE
         iOITOomXo7ldNNpnYi9z0wDF/PInT0aSIDKnQloOkU8uB+WqmqBx36HVPhH8yLTBe46j
         f4uOuwUtsnAaxRH9Z1trhygCxS190M6IkQj2h2d4WdUJiqa8Km70cxZ6PfucdC7AljWf
         wOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kZ54JuJ/U11o6QZTC2tSUVSElKXkiA2E63Q+E0+5Ows=;
        b=S0rjmqmycD1iIsKf+fapCT+gXdzyC0I7n2tqeeoxQrpw2MFRMhlZPI9CGsllV6yeR/
         zY8Hq0H9SVSO7GRKSK6vI1mvKCjVYVb2pT5y0ISOJxJddY8WfS215QpUJCrGfD7Zj43C
         Yh857seTDdVEV+OKqbmqcC4z2QnDKs3JHlXpbqYMEeVQDEu8ENk94tIElnRhPF4pvR/Z
         6naUZ9tAP7QbE1yHRmq4JzpkgnEUokEi0adF9D5R5a2AUZ7vQ9lfbvAdwHIz8DYuGsbZ
         V6tSrKcuJgefKzkhDOj+uLgHecC/vYjl+Vu18gP02ZxyKFY357EfTHEAqC1AVljbWR4N
         fIOA==
X-Gm-Message-State: ACrzQf38fTJaqvhIbhRJoAI7QfJ1ONBMXWsXTAIcYaxPld6Nk5yrRcMF
	aVS0UUPq1UZmS7FWiHDRT9+UeIYMEl1drpRZx2XTrA==
X-Google-Smtp-Source: AMsMyM5DzDNSJT7AYl3fCNPwDNPYomK9PSogJsIgE6W4jeqpRQGpNrt9ZTjcXZGRKMdL84uSEn0+9KxizakSfJAtYG8=
X-Received: by 2002:a05:6808:150c:b0:350:df64:edf6 with SMTP id
 u12-20020a056808150c00b00350df64edf6mr3125398oiw.283.1664764966993; Sun, 02
 Oct 2022 19:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220913061817.22564-1-zong.li@sifive.com> <CANXhq0qG-aEEHxWbtRgC+RO-wC36MtPUfu+eMpX89wOtqGJL0w@mail.gmail.com>
In-Reply-To: <CANXhq0qG-aEEHxWbtRgC+RO-wC36MtPUfu+eMpX89wOtqGJL0w@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 3 Oct 2022 10:42:34 +0800
Message-ID: <CANXhq0qnvUytyLOgGUiTP3nnic=FgRrezM_9vYwaGNaooU9J3w@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Use composable cache instead of L2 cache
To: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Greentime Hu <greentime.hu@sifive.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Dooks <ben.dooks@sifive.com>, bp@alien8.de, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-edac@vger.kernel.org, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221002_194251_708594_BD16318E 
X-CRM114-Status: GOOD (  28.97  )
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

On Wed, Sep 21, 2022 at 1:09 PM Zong Li <zong.li@sifive.com> wrote:
>
> On Tue, Sep 13, 2022 at 2:18 PM Zong Li <zong.li@sifive.com> wrote:
> >
> > Since composable cache may be L3 cache if private L2 cache exists, we
> > should use its original name "composable cache" to prevent confusion.
> >
> > This patchset contains the modification which is related to ccache, such
> > as DT binding and EDAC driver.
> >
> > The DT binding is based on top of Conor's patch, it has got ready for
> > merging, and it looks that it would be taken into the next few 6.0-rc
> > version. If there is any change, the next version of this series will be
> > posted as well.
> > https://lore.kernel.org/linux-riscv/20220825180417.1259360-2-mail@conchuod.ie/
> >
> > Change log in v5:
> >  - Add a patch to modify aux vector for sysconf
> >
> > Change log in v4:
> >  - Change the return value from from ENODEV to ENOENT
> >  - Apply pr_fmt refinement to all pr_err
> >
> > Change log in v3:
> >  - Merged the EDAC patch into L2 rename patch
> >  - Define the macro for register shift and refine the relative code
> >  - Fix some indent issues
> >
> > Change log in v2:
> >  - Separate the rename and diff to different patches
> >  - Rebase the dt-bindings based on Conor's modification
> >  - Include the patches of Ben for refinement of printing message
> >
> > Ben Dooks (2):
> >   soc: sifive: ccache: reduce printing on init
> >   soc: sifive: ccache: use pr_fmt() to remove CCACHE: prefixes
> >
> > Greentime Hu (2):
> >   soc: sifive: ccache: Rename SiFive L2 cache to Composable cache.
> >   riscv: Add cache information in AUX vector
> >
> > Zong Li (3):
> >   dt-bindings: sifive-ccache: change Sifive L2 cache to Composable cache
> >   soc: sifive: ccache: determine the cache level from dts
> >   soc: sifive: ccache: define the macro for the register shifts
> >
> >  ...five-l2-cache.yaml => sifive,ccache0.yaml} |  28 ++-
> >  arch/riscv/include/asm/elf.h                  |   4 +
> >  arch/riscv/include/uapi/asm/auxvec.h          |   4 +-
> >  drivers/edac/Kconfig                          |   2 +-
> >  drivers/edac/sifive_edac.c                    |  12 +-
> >  drivers/soc/sifive/Kconfig                    |   6 +-
> >  drivers/soc/sifive/Makefile                   |   2 +-
> >  .../{sifive_l2_cache.c => sifive_ccache.c}    | 200 ++++++++++--------
> >  .../{sifive_l2_cache.h => sifive_ccache.h}    |  16 +-
> >  9 files changed, 158 insertions(+), 116 deletions(-)
> >  rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive,ccache0.yaml} (83%)
> >  rename drivers/soc/sifive/{sifive_l2_cache.c => sifive_ccache.c} (31%)
> >  rename include/soc/sifive/{sifive_l2_cache.h => sifive_ccache.h} (12%)
> >
> > --
> > 2.17.1
> >
>
> Hi Palmer,
> I was wondering if this series looks good to you, and could you please
> help us to take it into riscv-tree?
> Thanks.

Hi Palmer,
The new merge window is going to open, do you think is it suitable to
merge this series this time? Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
