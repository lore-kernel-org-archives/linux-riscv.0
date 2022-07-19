Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E94C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 10:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uAkg+3rmqNDgkgRk2lJQnSFtDnKGjVMt2O8q/+LeseQ=; b=lzUdaA5Z8dx6w4
	LhC1qAe629u69mBNoKPlrgYlbzC5KYdS9rPcsTiS9vrS7nHu8udynHOb1k50m1leU3NuAzPxlS3Pp
	G8QP3Np4ukrfOxMoGL8DxWgthQxFJuwsz8uKv7xVcfDOePq8w7VyB9zvm3vu8X3DtfMWSdOFifUVb
	U+s6jdhUeCG+SEStuI1w/7SiXRX0VBsnWaErW2WRbbRX+5BUVX5Eld8RyAqZZcUPNwYve+mTh7f4/
	YxV5FyDok5HgLXaGfQDnWtb0UyMpDsx76ebYNbv0m/XPX3KLZm9B/MdCOPF6FRJgR1SieZLbn7cwZ
	eX2WmbiyIeWS+Kn6DLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkaN-0081wu-0n; Tue, 19 Jul 2022 10:36:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkaK-0081v6-1Y
	for linux-riscv@lists.infradead.org; Tue, 19 Jul 2022 10:36:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7F2A3B81AAE
	for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 10:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37543C341C6
	for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 10:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658226969;
	bh=CuCNXtA9cHsdWHhcfcpKIBxwcqkHceZiT9ABLed1e7U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=msXlWyTQue/dCcPedHG3qszTQK6Gt0P4vWUtopHddB4sjiMLz1gguXvzn2rZpDtAq
	 aBpjPPnJ5DxAYfvaBdjtd9v7XgX0u9hs22vVgxYF8MAygKfP5bQAS7/9OIpamKsCHz
	 hFpJGrtVpLn2/8S+qbEgb0HoB/3t4Cn9ydej7KEWphQk3cqU5Pjj+p5ng9mgbmypad
	 B7dQbC7AIkyH5cNiPZh4YWYoE36ygqPuWARjmHZUWobnGmhY/uoExWY/XG4+G5ZNgD
	 GUC6Q1qLyzCWnKFxkPO4UqELj80dl+XuJttvXabLSLHOuchgn8nIu+/ofvO9bPuGYp
	 o3AdMGUZXyNTA==
Received: by mail-lf1-f42.google.com with SMTP id y11so24033448lfs.6
        for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 03:36:09 -0700 (PDT)
X-Gm-Message-State: AJIora9gUGVbfFG2YqEx4hnQ3bq6jf5rH9PDzvX8UccwGuGpbumHBch4
	oxFHc2ZxkZBiHr5kGWldrw3e2uHdryTe7o/RvLU=
X-Google-Smtp-Source: AGRyM1uFcImQu9/rlgebidNhaapAk4T2VPDHi8d0V1gjkt/QAibFDMpTWt6rX7SSEoltNFTRF6CqAg9YlbjT+LeWw8I=
X-Received: by 2002:a05:6512:1190:b0:48a:14ca:f071 with SMTP id
 g16-20020a056512119000b0048a14caf071mr14315988lfr.542.1658226967238; Tue, 19
 Jul 2022 03:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <Ys/8SFo/oC1TFZYk@decadent.org.uk> <CAJF2gTSS56vzp2K_93P3fnUC4t=2v+jbnn11vMocuwVSrnW7bA@mail.gmail.com>
 <f59e4a64c541c5781bd10dd81c8622249d785c70.camel@decadent.org.uk>
 <CAJF2gTQ3V=TWib_cbw=r-wFtH9Ee=m7tG9OzizQhiZOU11Fa-Q@mail.gmail.com>
 <CAJM55Z8Eq-iUBFb79HJpykgGOFD-QykNdOJ7Xvj2-azeFJehLA@mail.gmail.com>
 <CAJF2gTTtEUL-o9Y+AbxWzT0Uf-8UwUqw8EgihZFn7D7huJvkmg@mail.gmail.com> <e896e651-89ef-6205-b2b5-ad9f4905f698@microchip.com>
In-Reply-To: <e896e651-89ef-6205-b2b5-ad9f4905f698@microchip.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 19 Jul 2022 18:35:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTFg3+0k57kdE4qVAsO=r=76k_rnJ1-CrLoqfTUwURVqA@mail.gmail.com>
Message-ID: <CAJF2gTTFg3+0k57kdE4qVAsO=r=76k_rnJ1-CrLoqfTUwURVqA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix vdso_install target with CONFIG_COMPAT=y
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: emil.renner.berthing@canonical.com, Ben Hutchings <ben@decadent.org.uk>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_033612_364373_3D19468E 
X-CRM114-Status: GOOD (  17.33  )
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

On Tue, Jul 19, 2022 at 6:29 PM <Conor.Dooley@microchip.com> wrote:
>
> On 19/07/2022 11:15, Guo Ren wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Sorry, I missed your patch. You are the first person to catch that.
> >
> > + $(build)=arch/riscv/kernel/compat_vdso compat_$@)
> >
> > The above is also good for me.
> >
> > For that one, Could you add "Fixes: 0715372a06ce ("riscv: compat:
> > vdso: Add COMPAT_VDSO base code ...")" in your next version of the
> > patch from Ben's and add "Ben Hutchings as Co-developed-by:"?
> >
> >
>
> Why would Ben get a Co-developed-by?

Just a suggestion to "Emil Renner Berthing".

My reason is:
1. I think the "Fixes:" is also necessary, and Emil could directly use
it from Ben's patch.
2. He also found that problem and shared the information with us. The
key effect is to make Emil's patch quickly reviewed (Although I missed
that patch).

-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
