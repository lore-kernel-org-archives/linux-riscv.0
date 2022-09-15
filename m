Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8416BC6FA82
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 01:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6f4ChZ8QpD6UUWMLML/bEm3t0sc50+NnvpE9tYtp5R4=; b=qUsTRBn3U9Gx4f
	fPyJHzBSV8x5o5Paxz/32NPysvmhPNYtSdSqfJcl8c9s6TMPitITpkfjxgnP9/lyLYvIQrT7XVN23
	/ICIVAAwfTsG7VM5sXW17s0+sd1A+Ed3XjDSy6fgHmjbiCqjZYWqaRH0lzPwpCg+1njiuNLvhG9FM
	V/CUow8BUDM73svKVdsYU3jJt5BKggPvwDEmxJh7n7w9OiHIzCHM4L5ondsKUYW5VPfe+2VtgYJaG
	RgXTO+Gr3/xBuVnuv8Jexwe10t6vBYX4wZRjuA4UfIpeH1eR4oIzgJhqRRwje70TXrXEtLITpkF2+
	29FyBfiQgp0kzNhZYiwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYdyU-00EYKC-Rn; Thu, 15 Sep 2022 01:47:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYdyR-00EYI6-3A
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 01:47:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 900ADB81D5D
	for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 01:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4E9C43140
	for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 01:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663206444;
	bh=RjRlXrPg4jGxvr2ni08ERzK1CztHfCD4mrJ9FlW0SHo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ivuyNX2A6TmXRbwCg2heIbJ82PIcVqqHLzHG4AjMkh/KE3ZQtkZLnTALpdK8+oqrk
	 9eeTqTjOdD/88ciJpkr1rzpXEHAfUOM9Y1m8zpaV3kqaJxFxr14WmWsoAdn+tvz3mF
	 s4WkgM1MpCuuZ6mM8kuHdCUztHuv9ZDj1Ow+p1X/tdvHYeA71HUrLlQRRMbrF9vsOQ
	 UY/+NOKVy671ueTWx/sU2UGG4qbAviOm1cATUJkctFAjsxFqc1rrIlZKE5AZGc3MBt
	 6to9/GiCjQs4yR7La8yw6n8eovIxmGa+DkaabjyGIc2c84dxMUK9PhViHx2TosOjG+
	 ft13v71t5x3Ww==
Received: by mail-oi1-f169.google.com with SMTP id u131so511126oie.5
        for <linux-riscv@lists.infradead.org>; Wed, 14 Sep 2022 18:47:24 -0700 (PDT)
X-Gm-Message-State: ACgBeo0GBPqJ6SQan1hHFYTlIYXTxhHIiujmsfi1zqwKJXZjFmYH/bfS
	TLYjGtzGTOQ0K1I80/XnoyYYKvUJZIBPt1U7egE=
X-Google-Smtp-Source: AA6agR4Zqe3rVQ0j6rIb69vkwlJLCXPWQhAvOAh1DgnyfPLPCDIYiSscrtgmgxCkHvAGNbx+r1CuucmAtycQehai0cE=
X-Received: by 2002:a05:6808:151f:b0:350:1b5e:2380 with SMTP id
 u31-20020a056808151f00b003501b5e2380mr2039904oiw.112.1663206443480; Wed, 14
 Sep 2022 18:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
 <20220913094252.3555240-6-andy.chiu@sifive.com> <82E75CB4-3849-455E-807F-A0DBCAEED3CE@jrtc27.com>
In-Reply-To: <82E75CB4-3849-455E-807F-A0DBCAEED3CE@jrtc27.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 15 Sep 2022 09:47:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRc487qEme5tQw4ich5xuf8_DYhTB8fp=TXav3Gs4KWnQ@mail.gmail.com>
Message-ID: <CAJF2gTRc487qEme5tQw4ich5xuf8_DYhTB8fp=TXav3Gs4KWnQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 riscv/for-next 5/5] riscv: align arch_static_branch function
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Andy Chiu <andy.chiu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, rostedt@goodmis.org, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, jpoimboe@kernel.org, 
	jbaron@akamai.com, ardb@kernel.org, greentime.hu@sifive.com, 
	zong.li@sifive.com, kernel@esmil.dk, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_184727_450549_72604459 
X-CRM114-Status: GOOD (  21.42  )
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

On Wed, Sep 14, 2022 at 10:24 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 13 Sept 2022, at 10:42, Andy Chiu <andy.chiu@sifive.com> wrote:
> >
> > runtime code patching must be done at a naturally aligned address, or we
> > may execute on a partial instruction.
> >
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> > Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> > ---
> > arch/riscv/include/asm/jump_label.h | 2 ++
> > 1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
> > index 38af2ec7b9bf..729991e8f782 100644
> > --- a/arch/riscv/include/asm/jump_label.h
> > +++ b/arch/riscv/include/asm/jump_label.h
> > @@ -18,6 +18,7 @@ static __always_inline bool arch_static_branch(struct static_key *key,
> >                                              bool branch)
> > {
> >       asm_volatile_goto(
> > +             "       .align          2                       \n\t"
>
> .align is a horrible directive whose meaning changes between
> architectures and requires careful thought, especially when the
> argument is a power of 2. Better to use .balign 4, or .p2align 2 if you
> really want to for some reason.
Do we really need to align here? Should it be naturally done by the compiler?

>
> Jess
>
> >               "       .option push                            \n\t"
> >               "       .option norelax                         \n\t"
> >               "       .option norvc                           \n\t"
> > @@ -39,6 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key,
> >                                                   bool branch)
> > {
> >       asm_volatile_goto(
> > +             "       .align          2                       \n\t"
> >               "       .option push                            \n\t"
> >               "       .option norelax                         \n\t"
> >               "       .option norvc                           \n\t"
> > --
> > 2.36.0
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
