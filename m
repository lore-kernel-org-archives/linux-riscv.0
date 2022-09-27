Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F706C07E9D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 02:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIJDWIUeb7aXAH5T0fZzkVH+UwiX4QtsuhACd06AFLE=; b=A8dvdzIXtB6hQJ
	752aXKvnkdrPeKLDWhE/mqzwRnDGfsYwjKkyxCht3dz2z/JXNw8W/L9peTT4pkph7WYHEggWxSczX
	iOT55T8+4FF4pua+oQvfIpNsqk+EIF5xQdATHbtA5y5JCjVsGe5V+St0r4HhP5uwFXF0yXA7YdNHR
	axweYLC609TppzmxH7tx4bAPcD7a3XJxk+jpOKEopBjw0ntPKgdDp1uBSGUM57x/6Ya7OVWgHxTD6
	ENeIodwFVNJkSaX8zpPzsuPnBjqEIR/H2kcjiKgzupsM6DpT3cHGipsHeDtPzMvEfqn2Wo1J6LP5O
	rI+4yctP1I4JO1qw9npw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocztm-007oj5-LK; Tue, 27 Sep 2022 02:00:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocztj-007ogX-Kv
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 02:00:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D427CB81645
	for <linux-riscv@lists.infradead.org>; Tue, 27 Sep 2022 02:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6FFC433B5
	for <linux-riscv@lists.infradead.org>; Tue, 27 Sep 2022 02:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664244032;
	bh=19gy2EXbjjLD/l6XeEJeQfh5wNSKslif73XxWJJiya4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UycWZTDWCpwFEzNOCYzx0660ef5vI8AHfyoSmAGCveyhYBvSAuNxwgJA/vQsJV97o
	 +S54clXZbOM3d7MoE0FvzwTOK0HGrNwPwp8yX4GWqhg8qZ82AvjLVgQEGkmajpiKal
	 TsNeZ9ZBSWai24xZDwzpQQ4GVsGyCbMMA/TfdFVDQ5f3MQQgwheis7qbNUsWeD7n++
	 oJLT1YOU9vWDnreDLshC+mDdOByl/rfHot2LU7npXCXPz5Z42Vn2zvninr7YXD/+gB
	 KlOFx/YbLe1AcP3WN9HiKszD4IL5nX05NYGl8ii1PxUAJXiQ30CLXgfuivTlPreosu
	 QRnftSuWrko6g==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1318106fe2cso428619fac.13
        for <linux-riscv@lists.infradead.org>; Mon, 26 Sep 2022 19:00:32 -0700 (PDT)
X-Gm-Message-State: ACrzQf2iP3FGd0WjLDxOMY1enl51Oc3BLRiNMHiXMwORztyjcIk04hbb
	YATpMeMJ3wOXxIttQuaOLqrKhKoZDgGdQkqJyzc=
X-Google-Smtp-Source: AMsMyM5ea5e0PE9duPI0AiEm3Ci2ukaIEq7zGlDwmLWiQdey/Aoh7alxANCLZBRyNiFXJfv7kKNa2U+oumBHvVoRuxw=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr937824oao.112.1664244031696; Mon, 26
 Sep 2022 19:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220925175356.681-1-jszhang@kernel.org> <20220925175356.681-4-jszhang@kernel.org>
 <CAJF2gTRFXwu5QtA8GywGaSVRPA7zeexcDHRzcngcY1zD3MFjog@mail.gmail.com> <YzJBXsiWrbmxM6Q2@xhacker>
In-Reply-To: <YzJBXsiWrbmxM6Q2@xhacker>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 27 Sep 2022 10:00:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRkPc7AQsUNZopevey61PD8o6BQBZKjgeLHmOgX+pj6dA@mail.gmail.com>
Message-ID: <CAJF2gTRkPc7AQsUNZopevey61PD8o6BQBZKjgeLHmOgX+pj6dA@mail.gmail.com>
Subject: Re: [PATCH 3/4] riscv: fix race when vmap stack overflow and remove shadow_stack
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_190036_338673_2B1189B0 
X-CRM114-Status: GOOD (  14.09  )
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

On Tue, Sep 27, 2022 at 8:28 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
>
> > >  #ifdef CONFIG_VMAP_STACK
> > > -static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
> > > -               overflow_stack)__aligned(16);
> > > -/*
> > > - * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
> > > - * to get per-cpu overflow stack(get_overflow_stack).
> > > - */
> > > -long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
> > > -asmlinkage unsigned long get_overflow_stack(void)
> > > -{
> > > -       return (unsigned long)this_cpu_ptr(overflow_stack) +
> > > -               OVERFLOW_STACK_SIZE;
> > > -}
> > > +unsigned long overflow_stack[NR_CPUS][OVERFLOW_STACK_SIZE/sizeof(long)] __aligned(16);
>
> If NR_CPUS is large, there's a non-trival memory waste, I have a
> solution for this case, will send a new version today.
Er...

Yes, we can't bypass the percpu mechanism. I also forgot the percpu
basic concept. In the end, I prefer the previous solution, maybe just
simply giving an atomic flag would be okay. (But we only have one
register (sp) which could be used, it seems not simple.)

>
> Thanks



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
