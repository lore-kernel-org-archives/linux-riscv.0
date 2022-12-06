Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC0AC352A1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 14:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1npMpcUMFwUxNggLx/Yy6OBxpBdKjk17351FGZgeRhU=; b=1ij7BJ6sdaf0QQ
	8vMzcwiDJT69dD3JaWfvIc1k8p1J+rHcVYQczFD2EUXH7VAckB+tr8+xjGEoXJmODHwHS7fYxPLMK
	ELn3izVFLcA55qK+95wV1GNZpLmZQf48ftupltAX1SHsaoVydOsk5d8C6qOBGejI9+79bJrGFr7zd
	mz04DdxlNM834XfO8B+1ViV1Bbu74zYE7PWIrvshJ8DdXgqE6C+nAFcNJOutsZ3bdIjc0Xgj1tVHJ
	wX5FRdCrDdugTKg+xeGSdi4jZvHDg8DKMNVOMT/NwuxtqW+AAEaq8qq5yi4j23yS6SCA81i9ExYzx
	bagYqJc2MOd98dDhxQOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Yqy-00AYEt-Hh; Tue, 06 Dec 2022 14:23:24 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Yqv-00AY2M-UP
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 14:23:23 +0000
Received: by mail-lj1-x22f.google.com with SMTP id n1so17393224ljg.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Dec 2022 06:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sT1QGkgmhBkSpHiyhRuKPI4cqNjm9QnBwa8ft8tm2b4=;
        b=l+v/q+gX2uTMHA9ZkYaAEAOtqVZdgJNwEosrM3dkEf7jw4tHyTliypQOHtJCtyU/H9
         W7Rb7+6szCYzuywkLj8Zzm8bXfov7G34xh+DWePoSoe3mUbB9RTRgb4Eoe8P5za4HhYo
         dqM6Rl8x97B2IcqV6Bbti5ExuCNlqSZ8XCLIBcuNfbACL6rR0FzgrSP3QuLtkaV1X83p
         WDR8LXEIKzHxXYaMLxwysL+5yuFzANOq60Tmx256kIMgIGLGL+c3zdZhTjoEc6bXyMzb
         mTf2P51kB/RnI5TnC6bBnUbYBNumrfqdbQAc+5FEo9sqIrbg9zjykdwwm5+wVohhP2yH
         79Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sT1QGkgmhBkSpHiyhRuKPI4cqNjm9QnBwa8ft8tm2b4=;
        b=4h+bmigaj50HFehfnq1dOmyoc4WWryvH6QrmpieuK8SY0HT5sI+C24vt7bi7Cm2yzb
         7KdDtPAC5UTa2zJDlXH/i9/eEi9OaT+phlTMJRvJHw7+j6lJIodwOLYU4JS2Y43ZgRJp
         K/o4i3kcyDUI3lMi/PzkboHxnVIiXJR7jUYdyoufrG9zWgxQWDt03jqckDM4Vsvpe/D4
         +M9bYUtJX4/MfuVtQedpahOX6JUnhhUFjzWf2dpz/PxfZce5nvska5HAiPCzyx8dlx0Z
         sq+217fg9nUuxUZC7kvIkLxpb8cwo7G+NWxvSDeQ6IMUog8gz5GYF80kLNCZ3ERt4tvJ
         AN9A==
X-Gm-Message-State: ANoB5pkx5vg6IlVyQqgHmzK7ei8jfN6GCyL6CX98JJKhiNj2Fu3O7DAr
	yOxyW3s44RBUeAgIDr7gFIVYbPfBLZ0vXbUUo7g=
X-Google-Smtp-Source: AA0mqf48L7a4pxzGkZLU939Pac44paZk+6TCPskq0MapimEioj6zash50V+a81kf7aJotA75z78shCuZOCge67gFClo=
X-Received: by 2002:a2e:a22f:0:b0:27a:d4:f94f with SMTP id i15-20020a2ea22f000000b0027a00d4f94fmr2544512ljm.499.1670336596229;
 Tue, 06 Dec 2022 06:23:16 -0800 (PST)
MIME-Version: 1.0
References: <20221205050038.195746-1-bmeng@tinylab.org> <b3aff238-c473-e587-dd04-cc5ef4517722@kernel.org>
In-Reply-To: <b3aff238-c473-e587-dd04-cc5ef4517722@kernel.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 6 Dec 2022 22:23:04 +0800
Message-ID: <CAEUhbmVBLLppJdnw5CUiD+Vpj1jaGQ7FTZGVr4xT0_LaA7qSjQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] serial: Adapt Arm semihosting earlycon driver to RISC-V
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Bin Meng <bmeng@tinylab.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_062321_997267_3A9708BA 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

On Tue, Dec 6, 2022 at 2:47 PM Jiri Slaby <jirislaby@kernel.org> wrote:
>
> On 05. 12. 22, 6:00, Bin Meng wrote:
> ...
> > --- a/drivers/tty/serial/earlycon-arm-semihost.c
> > +++ b/drivers/tty/serial/earlycon-arm-semihost.c
> ...
> > @@ -23,7 +27,18 @@
> >    */
> >   static void smh_putc(struct uart_port *port, unsigned char c)
> >   {
> > -#ifdef CONFIG_ARM64
> > +#if defined(CONFIG_RISCV)
> > +     asm volatile("addi    a1, %0, 0\n"
> > +                  "addi    a0, zero, 3\n"
> > +                  ".balign 16\n"
> > +                  ".option push\n"
> > +                  ".option norvc\n"
> > +                  "slli    zero, zero, 0x1f\n"
> > +                  "ebreak\n"
> > +                  "srai    zero, zero, 0x7\n"
> > +                  ".option pop\n"
> > +                  : : "r" (&c) : "a0", "a1", "memory");
> > +#elif defined(CONFIG_ARM64)
> >       asm volatile("mov  x1, %0\n"
> >                    "mov  x0, #3\n"
> >                    "hlt  0xf000\n"
>
> Hmm, can we implement all those smh_putc() variants in respective
> arch/*/include/semihost.h instead?
>

I think so. Will do in v2.

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
