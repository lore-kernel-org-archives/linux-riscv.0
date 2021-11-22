Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7944EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Nov 2021 02:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ior7JLh7TBt28ZSU47xpQsUl7SttUvJ1+0LhkWH7WlE=; b=jAiPLpjg9bnO81
	t+QRP0xQlUYfLMuTIfyfIA6CB0ZGeq2p3Y6gHuYJSO7KVxMZmRmRhKjOAHhnF4ZYpDx1Fx88k2shV
	aWHHS3VJApprGhW0jqJHA7KncKVX3+Xqyup7CIv8uUOvrpRh4HpG/WhicQnu9vaxuNDMAPLmFN9Fr
	ZBE2kqaAou8GR2iv0WuYyi2WMv8mL4vQKcE8ez7OcaItLuxA7U9x9qU3xYPeAbPvQDBcqGKVuBBq0
	t3dsi5Pf83J1mknSnkqtdEbLuzEFierP0GjsbXPiPf2VsSOc2e2vORCPJFBDhIk4BCpwto0kOh1nm
	SHtgtdKqugmHBPq3SPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mozKw-00Eirf-9s; Mon, 22 Nov 2021 02:45:42 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mozKt-00Eiqv-Av
 for linux-riscv@lists.infradead.org; Mon, 22 Nov 2021 02:45:40 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id v138so45945423ybb.8
 for <linux-riscv@lists.infradead.org>; Sun, 21 Nov 2021 18:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YmHBmFl4jo7vhfk+blSj8ZbPLUZ4zHrikv8Urc1dx9I=;
 b=NuHR1v+vZUbP8uoSgZKguTyHWCpdHqVIwQoceOhJvEwTBkmXc2+d05HSQkzIU7JiSR
 ne0h+BWV+2LZZ3krfNBevxk+l7ABlha/ihMqpbrYYR9H9NLZljLUgMLj+YiJMsWftksI
 cZigSH2+bDlQoik8CCe9gk73O351TsiYbbhtkX6Pgi62iiHB+9hUlS+eVW4d2W6ZBYBZ
 PVCGQ6h7zilLPP6b5dx27VEHMcBoy2W54MIJEvwTAmKLUMsxj/X8Kks03HCi8yi6Pawu
 qhhH7qy3QLtFF4+SrM0GOax5zEvf6diMvGA8aiSN5sVhhrMNiAdfhpKgVE8FyaXoxbPj
 S1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YmHBmFl4jo7vhfk+blSj8ZbPLUZ4zHrikv8Urc1dx9I=;
 b=I/STNS0RGfylNykQxboMTF8xotelKCspuk7CHQGSTUDxqMpKIdVhmkUGjpYSe0bOfX
 /zpsEC+I37oWrkSZwtnf1T3ioMdx5P7Sh99AxwzVEnX7OcBO6Kqnz8YeIsCSa+nxUbey
 uaK7U7CHUvfTD4Y+WgtqWILbzaV80EkKTZZKXV7T8wUF5YZcRlsmE9h8kt6sqUWAi/yr
 THhfewO8nfEYn5LSi6BC+2drY7euVtqquTBskynFVF8yU8P666i0b8Of+uwbMPTuodTA
 ZZJmUG4nwX5L2kzgDB6Yj4Wp7pQGQu6g7TMpLfo67jJvxa2Gvfnd3wBrFwqVgPhrLSF3
 XK1Q==
X-Gm-Message-State: AOAM533tfoUFWTMlo2mS7APkoIC/yV7VvLTo+KRcDGTdXF5T6cP5mZ3I
 EmEAAUL3tjAL3i+M+HLiG9xxSoiZc+Qxh1HW4O4=
X-Google-Smtp-Source: ABdhPJxGCXaKyVyG6qx7T8drkmBTiHp/A1h7pCaYfMO/4VuFTTPNCsKLHLz3PH1YkWKTq/unuwrZMJ4MCa0COAQlIII=
X-Received: by 2002:a25:2346:: with SMTP id j67mr59076596ybj.467.1637549135951; 
 Sun, 21 Nov 2021 18:45:35 -0800 (PST)
MIME-Version: 1.0
References: <20211119164413.29052-1-palmer@rivosinc.com>
 <CAAhSdy3LgDmv5dfuOnBXpJsD_noPecgpjzf7V8v2UjM8WVHcjw@mail.gmail.com>
In-Reply-To: <CAAhSdy3LgDmv5dfuOnBXpJsD_noPecgpjzf7V8v2UjM8WVHcjw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 22 Nov 2021 10:45:24 +0800
Message-ID: <CAEUhbmWP_e3_UWf-mO8AFwECw5Li0L=4Ywjb00jUHy2J1RX5Yg@mail.gmail.com>
Subject: Re: [PATCH 0/12] RISC-V: Clean up the defconfigs
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, axboe@kernel.dk, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_184539_406330_9E34D26F 
X-CRM114-Status: GOOD (  21.66  )
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

On Sat, Nov 20, 2021 at 12:32 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Nov 19, 2021 at 10:14 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> >
> > It's been a while since updating the defconfigs, so I figured it would
> > be good to go through all the diff to make sure nothing was lurking.  It
> > turns out there were two minor issues, which I've fixed with the first
> > two patches.  The rest of these are just cleanups that should have no
> > functional change.
> >
> > I don't have a K210 (I might somewhere, but I've yet to boot it) so I
> > can't test this to make sure, but I think patch 2 is the reason we have
> > a special !MMU PAGE_OFFSET config.  If someone does have one it'd be
> > nice to be able to remove that special case.
> >
> >
>
> Using savedefconfig, I used to always get a huge diff so thanks for
> doing this cleanups. Going forward, I suggest that we insiste everyone
> to always use "make savedefconfig" for creating defconfig patches.

Yep, using "savedefconfig" is always required by U-Boot maintainers. I
thought that's always the case for the Linux kernel but it seems it is
not the case.

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
