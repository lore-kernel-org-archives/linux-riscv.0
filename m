Return-Path: <SRS0=jfOo=MI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9F3C07E95
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 10:14:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16168613F2
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 10:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16168613F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1DGdtfMSBtOpKg6ploumJrVsYfOMOQ0m8ODrK890XE=; b=XsyzSpZYDU47Gp
	cklQjALgXSiC118C0TlSPB+Nt0HuCV4qEYvn4ry/orVmzK8BSVj7kIDCDCAW0r91dMDZEspX7HY2W
	YeQR3zDYH0J6u3+pQmK7cjER34uSp13tX871U8YAQ9nVFOpRD3o5/TzPhqRblHE9t8lpyOyTM0G13
	rKwsekECibfohG1hXlkokZC2delP6Rx/B0yVv/nPZ9B0vv6gPPeUhx0ctDRSO0CCK7nAGZfe//kd1
	/BUL/3PntTeVA7aXjaeKICYcfxGHim9OhDryeCjwHvB0zUUtodYas44BTYtTFjChU6eUrdpqvviFA
	g7Jz3gDTSMlK39Ad07Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4KrU-0042nB-AI; Fri, 16 Jul 2021 10:14:28 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4KrR-0042mJ-DU
 for linux-riscv@lists.infradead.org; Fri, 16 Jul 2021 10:14:26 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id b13so14011336ybk.4
 for <linux-riscv@lists.infradead.org>; Fri, 16 Jul 2021 03:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iuGIeqokxksveNDV8VeICX98RmyrNiDBw8DitAGWHLg=;
 b=CRb+ROcYUseCzx1ggWJ4DRbmNH6qFprgQKZKyen8mr3mM8NO86kkvrltKnBN8AurhQ
 T+PQ3lbhzkSa1ovSD/3ptd/0lXtbmjqq7tqe3vcNNCMhJbjMEltG6hCsXuAGwXWCuUUV
 M8CIc/5scR/h0Vy6fOv2XP3BEXMIjYaMH0zLUfrAP5cirPjE/bxIiSnkPpY/mZ/TgCqd
 LgO77fUMDU2sIuw70aF64ytZib0Ko0/cl0YDWT7jMChslHRLzBL+dwONug8CJ6DESikQ
 WNsZWrpRLq3y4sWBHUWsjUe00SljcWCmqlYy7OcylPKOZJ0S3lvYutiSrrXHlGlU9Kp5
 JHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iuGIeqokxksveNDV8VeICX98RmyrNiDBw8DitAGWHLg=;
 b=So8kc8qbQxzWlj4jbukDoOgZiZzq+n4Oc0KOguAh7TnSmuEWT/vQGkI6w1hUoB85Ea
 J98A0LZo8L+rrrdF2YcKEwJzdpX7KiVXymQbwbS+dSL4xgx7sEVdA3Eu2B2HfZIU7FUk
 JBx6IC+0/7fP03kryRwJlJ2U2PuhAmoyWdLzf5l83XbT9PwW43Tj6HGWCLm3dS670bzW
 xwF8KbsWDAQvBX1Yey4+eqG9mB2T1c0G+bW2qhDAz2Mm5G3GsMt+vjDDhcgZsXpMitGk
 w1024UgFyqsHFiUaPdBfK+FSymfPY90QhB7A06NRwUrCY6TIlm5XblMX1ymdpqc+oJsz
 VTKA==
X-Gm-Message-State: AOAM533ZIq/qUY2O+OieE1tE3wuhcKAQAVXpU7UMWPyNkG6o7YPhR9Vx
 uEeoA+tAPdTh85mGUnmqtEDOq7KlfcP0mwe9FG8=
X-Google-Smtp-Source: ABdhPJzo88Lq7bhSroU1MJ9N1q8Wpi6VmrVvjFHrQ8OHEVTbVLlrajUJjP1mKn6mHCAsk/4Qh9gzSpSKtI6I70lOq0g=
X-Received: by 2002:a5b:504:: with SMTP id o4mr11904798ybp.332.1626430464415; 
 Fri, 16 Jul 2021 03:14:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210702014319.1265766-1-bmeng.cn@gmail.com>
 <20210702014319.1265766-2-bmeng.cn@gmail.com>
 <CAMuHMdWpJ194jEnXiUhs5dfC-33rGUm7pE9aMHUTYoMCUdFxZA@mail.gmail.com>
In-Reply-To: <CAMuHMdWpJ194jEnXiUhs5dfC-33rGUm7pE9aMHUTYoMCUdFxZA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Jul 2021 18:14:13 +0800
Message-ID: <CAEUhbmXrSJ2dkXYvoZXTZ+3gV3h9OBx3u0hOitwLvMDKa2A4DA@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: microchip: Add ethernet0 to the aliases
 node
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Lewis Hanly <lewis.hanly@microchip.com>, 
 Atish Patra <atish.patra@wdc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_031425_515339_38643A57 
X-CRM114-Status: GOOD (  19.05  )
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

Hi Geert,

On Fri, Jul 16, 2021 at 5:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Bing,
>
> On Fri, Jul 2, 2021 at 3:44 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > U-Boot expects this alias to be in place in order to fix up the mac
> > address of the ethernet node.
> >
> > Note on the Icicle Kit board, currently only emac1 is enabled so it
> > becomes the 'ethernet0'.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> Thanks for your patch!

Thanks for the review!

>
> > --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> > +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> > @@ -9,6 +9,10 @@ / {
> >         model = "Microchip MPFS Icicle Kit";
> >         compatible = "microchip,mpfs-icicle-kit";
> >
> > +       aliases {
> > +               ethernet0 = &emac1;
> > +       };
> > +
> >         chosen {
> >         };
>
> This should be added to the board DTS (microchip-mpfs-icicle-kit.dts)
> instead.

I was wondering the same thing before doing this, but when I checked
all other DTS in arch/riscv/boot I found the aliases node is put in
the SoC dtsi file instead of the board on so I think that's the
convention.

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
