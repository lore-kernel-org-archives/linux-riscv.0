Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5225C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 17:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoy2epGFkl21yZbsZ2S/ZdIm+RPXkI8MacrOW1449NA=; b=QKYgza93F8fR23
	3pU86W3oVpBdujueoNlYmhQNXXrwYkt9mN0gC1Oyn9xpaEDvwA5LH3V/BT7bfohdm0iTp81zaTSWg
	7PZwx/Gnv2D0WRms5nZTYA0Cr5K/jJLUkgBdaCv8Gpd+DtA4gFDYVgUSduxBfphV0w6wYIz+bjT7n
	sor7+wC4UFw8TWFJwqD7ViLxtf5WLVSRPR+9zt2z+WD5sW88IkK1xBrLZWbrg7GKzJ1b3WkFmUy3H
	xjqdaH6OWyEJ80OKnjxbpamjR9Wyj/7Wu8W+lquK6vCYTIhWsGs7li3cHIS8gInxCj2dFShur/tKu
	uE49qGxeTaXcza5XDQmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzimZ-007mnK-SN; Tue, 21 Dec 2021 17:18:35 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzihF-007kJG-LL
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 17:13:07 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N3sZs-1mHxqZ0HVQ-00zrxF for <linux-riscv@lists.infradead.org>; Tue, 21 Dec
 2021 18:13:03 +0100
Received: by mail-wr1-f48.google.com with SMTP id d9so8793006wrb.0
 for <linux-riscv@lists.infradead.org>; Tue, 21 Dec 2021 09:13:03 -0800 (PST)
X-Gm-Message-State: AOAM530zmaasuTHgrMS7k+VMYg65ajnSJ3jY7h+McJhFFIPUyrvwQwxI
 TmKx3rMt/glt0RIcnvA3WzR8u6zEMibBInhewVI=
X-Google-Smtp-Source: ABdhPJxbIqjyU8TaVGGex6NdChPO7fkenTBnB/BLD4Lq+OCkYunXjff2m0E1G3pTqKAWxFdhJPGy7XhHYU7jc7xKAk4=
X-Received: by 2002:a5d:6989:: with SMTP id g9mr3336935wru.12.1640106782679;
 Tue, 21 Dec 2021 09:13:02 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-4-guoren@kernel.org>
In-Reply-To: <20211221163532.2636028-4-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Dec 2021 18:12:46 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3navO2Z2F5zxisby5EBNDo8rwQ6hxSuyniFgFxrQ5qXQ@mail.gmail.com>
Message-ID: <CAK8P3a3navO2Z2F5zxisby5EBNDo8rwQ6hxSuyniFgFxrQ5qXQ@mail.gmail.com>
Subject: Re: [PATCH 03/13] riscv: compat: Add basic compat date type
 implementation
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, 
 Drew Fustini <drew@beagleboard.org>, wangjunqiang@iscas.ac.cn, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:3QWSs2yJlMenmOLMrl5hW70rcW7xobwYtr4FL+glu2FJSTH8tuv
 PhV2c31rOKJ0cAYvfoF6QxZDmTPk7xPRP1S0muNXwXxxS7eCbDaTObw2FV5rlwFIOe07vV3
 3fHGckxKhQC1dTAbpoIeGEhhMfCJ0d5L3+NLhkKzCcAhHT8FSMHn5/NxG1Fon9MceRcSWlc
 7B/lZAlrO/def2+kOW9Ig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AXf2Yzh9xbk=:Lbw9W4wn87KmUeYk2dCRnL
 9HedJD3esbSym3zRCgLkYmx+b1T/u6TQpFB2nODUlZKHTGGz9LCy6TYmikW3aB9IihhFda57S
 J4IrTbATeU2RYliuo9HVmOJW8WMlVpweIvLYx1SwpUoVB41VsvqQFWD/gB1+w9aF4kPxpzDPB
 gnnOwrfbmMh4+f2WnOqqOj2R2u4yB77GwhizlvbaokquKBt3cfFiraBFnXRI+sP2CZSmdljdZ
 IgmRqHI+9Yzq5P3IsBx3DA5q0xXhhQpFZtnZ9K3D4PGobfXE5ZTtSzM56bmuwnhgJUKOuxsdT
 qW+J0I+wZdi8UONoZyUrU/gZp2MyA5c5ZeR0TDzFtssnAIHfcGZzLc6f1xsifFJzMgRFRg/4G
 pXhfIe8LX0TUIhy8sdjQqyhcv/6Ra040+wmkJ5N8sWqaO7FwFI80MKmOrAJXbgcTaAYkMWU/Q
 21LBwGyH7Odhb7uFrKu+WjW/ny4eFCPiZ9oRVE+wtIXf9/wDy9zOIkDxE5u9o63HV1ITT5bhz
 AMKjPdr5odH1l82lVhTZ0zV67INkOfs9YIyv7lJZhdALSrIS7ErL8+kQEV5cG9Ujfw8l6vSs2
 cbQ0SqszRRozj6BfSCAuf2qASLGu6SQTxnAniPY4+ABVgYPKP+eTF1oSY4OKrCS0WQOVTi00V
 bsyFa8W2h1PaP71p1zX3Y+EP8v00BPgeU9xutTjEpGIn/7/BMfHPPkRuK+/qumuwZJNNhsfjE
 fTXLiMfDsHRfw8t2X/YOB+52+6L47YhvzQaLxszQbwNOytOvFGDGDR9Xlyg72Ut9icRIIXfdv
 LOFcGfVesUeEspqt47hpXQbCl727xs1eyZ9Qu1jruXmQqzZ/wE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_091306_040271_90CD5329 
X-CRM114-Status: GOOD (  14.32  )
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

On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Implement asm/compat.h for struct compat_xxx, RLIM_INFINITY,
> OFF_T_MAX, is_compat_task, compat_user_regset, regset convert.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
>  arch/riscv/include/asm/compat.h      | 259 +++++++++++++++++++++++++++

Since both the native and compat side use the generic interface, I think this
should all be part of asm-generic/compat.h, in case other architectures want to
share this in the future. Maybe see if any other architectures use the
same definition
for some of the structures and then remove the duplicates.

> +struct compat_stat {
> +       compat_ulong_t  st_dev;
> +       compat_ulong_t  st_ino;
> +       compat_uint_t   st_mode;
> +       compat_uint_t   st_nlink;

You should not need a compat_stat, because native rv32 does not have a
stat() syscall.

> +static inline int is_compat_task(void)
> +{
> +       return test_thread_flag(TIF_32BIT);
> +}
> +
> +struct compat_user_regs_struct {
> +       compat_ulong_t pc;
> +       compat_ulong_t ra;

These clearly need to stay in arch/riscv

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
