Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06B5C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 13:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwTvhWxBvQeMrZJM3HMLkCnqYeZyHdUekkC4FN+HxS8=; b=AS7kreb+Pvelio
	N2/5y+oLshAfo4DsRk49N3fHczj2bmMWr80N2QAVh7DvDEYI0K3LdVxww+yg1FzGbbW12N60s6YKK
	B3xGdsC+KkbjS7ilNIr+Wl8quLABC7Gm+ix2D/KtZsnzqlhywKLyyFgdzhTfd2xY5VOF00HAdGYBf
	GrFuuGg3RnRGOWl8DGhVqd8OkaswqGY89U70ZJzAmFB+8tDzm1i/MzGSCqsByu+brZFz9a11vhDqQ
	9YNS1lyqFtVHYV4eqtjGOlaT0qQLW2FucNYbDZ+8W5ql6v6Og+Ceob0VfEiY6NrinMsW765itdIbj
	pQ04vvEe5TcZQmrZxlqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJwth-00HMUN-5C; Mon, 23 Jan 2023 13:30:05 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJwte-00HMTa-Ri
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 13:30:04 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id c124so14673567ybb.13
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 05:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mJYRO6ISS1JoIw+4NoLJhtAN47TpIgRoVsNhuK1TFTQ=;
        b=IDsxW6oxemUUha/V75Vosm332PzzzREw0bxiFe8xpVDc+BcoK78TYTYhJ+8x7kVJyg
         6icG8fdkvIC0fJNSxN9UCYR1HnpJLtDhApszUpFrHUU2yJkBN6z3l1GLjkY7MomJCdU7
         hrXoOFt24yZ5YXg2Kxd9DbDdscHpkne8M+kdQ5u3K5J7l2txFP79BeyH8zq3T+KExtXM
         85JhXnSfyaoEh2oc8sqUGxBdOAZcSpra88wtNATRoIq3Gue8b5Dze034Ad5/UUvz6ZFg
         6liocWgINOKq1A5nWwlRtfvzOi7TkW4RU1nY8130w3BQ1XhGCbArMNi20cpPvHySQGwW
         eVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJYRO6ISS1JoIw+4NoLJhtAN47TpIgRoVsNhuK1TFTQ=;
        b=JWK+NOrqGZkypIAgHYFtV4J2mOZepfSxnFmduv4Ga4YFGij4XGp/jA3QPfThV0Nyil
         vGai+Rpgw+2UH69v6BO8z5FfW/wwlGVOj+TKLYvZ3fd3eWbBx7xWFbJYJt7CFJOvA1+t
         WhVBikcUm/jkWLJkL80yMncM01+Iapqg8gV3flMA0JKyp3xJTG076D1B3eY+bWSIGhHw
         tcT8OYv+q9/jnyfgiGHy2XEINNxYmM0nRNu0XECAY8xQIrrZoz6E0qTM3gD6eFe+x7AY
         Im4f2pE7BCs/xRwjkumkkhND3Sf3yVuId+cHdBpWM9RKYt/HMSeIBq7ukohn+Byuog69
         6DfQ==
X-Gm-Message-State: AFqh2kofOOffSxh3dYkh7lQ+6vzdF9FXslJC2vJP2hwW0Y7NpZ04bCn+
	etEIEu/mtUSJjbZTA/LH9PbsrpiJOqdfa247ImJI8g==
X-Google-Smtp-Source: AMrXdXvkOvyevRYP9wVIGsDLGwRGBxvRFwas2rVYr1z71qDvnBKuuHs1Kv57S7A2C72yUVvVJAUUbg29Bx0rSeLAKqw=
X-Received: by 2002:a25:1082:0:b0:803:b8c9:810a with SMTP id
 124-20020a251082000000b00803b8c9810amr1104435ybq.345.1674480599538; Mon, 23
 Jan 2023 05:29:59 -0800 (PST)
MIME-Version: 1.0
References: <CALLt3ThJyH3yihiwq-ZDeP1v5UgQZEsUWNwxOewZBeuocciRJg@mail.gmail.com>
 <b440aeaf-03e6-aa4e-9636-adbf3f841b40@rivosinc.com> <3923eeee-e4dc-0911-40bf-84c34aee962d@linaro.org>
 <119da65f-e976-f382-3fe1-1585be738352@ventanamicro.com> <8be4d673-f435-429e-9a61-bb49e7820529@linaro.org>
 <6d13e63f-69b3-6e48-b811-bbfcf3ffb3af@ventanamicro.com> <CABgGipUAhZNt3gaxEx7mPm20Xw7WNVVppRZ4fxZX-XswA5VG2g@mail.gmail.com>
 <e2a2ef3a-bb5e-0bda-20e5-a2344e7c4cef@ventanamicro.com> <CABgGipUCoykzeS5B1wSQxcxumCweRi2RDTKdD8u6ON63DV3EnQ@mail.gmail.com>
 <CABgGipVE3RnrNy1=8nsXUvW0w4XopHQuAzufQ66z6OWvU7wbwA@mail.gmail.com> <Y8566x/wr31sWKyP@wendy>
In-Reply-To: <Y8566x/wr31sWKyP@wendy>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 23 Jan 2023 21:29:46 +0800
Message-ID: <CABgGipW0kY15MxRivib3OhsACA=c4fChRyVOV=Q_vbZX1u+vmw@mail.gmail.com>
Subject: Re: Auto-enabling V unit and/or use of elf attributes (was Re: Adding
 V-ext regs to signal context w/o expanding kernel struct sigcontext to avoid
 glibc ABI break)
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jeff Law <jlaw@ventanamicro.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Vineet Gupta <vineetg@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Vincent Chen <vincent.chen@sifive.com>, 
	Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, 
	Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Aaron Durbin <adurbin@rivosinc.com>, Andrew de los Reyes <adlr@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, GNU C Library <libc-alpha@sourceware.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_053003_024643_3C6C9089 
X-CRM114-Status: GOOD (  12.32  )
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

Hey Conor,

On Mon, Jan 23, 2023 at 8:18 PM Conor Dooley <conor.dooley@microchip.com> wrote:
> Meh, all of these discussions seem worthwhile to me!
>
> Now that things have died down though, I'm curious - what are your
> plans? Still going to submit another version of this series?
>
Yes, we have implemented most of it and are planning to send the
series in recent days. Thanks to Vineet, he is helping me to sort out
some last bits before the submission. Here are some points related to
this thread that will be in v13:

1. allocate V context in the first-use trap
2. drop prctl V-controlling because it conflicts with the idea of the
first-use trap.
2. sigframe/ptrace will not have V context if a process's VS is off
3. If the kernel is compiled with CONFIG_RISCV_ISA_V enabled, then the
auxv always reports size of the sigframe as if there is a V context.
This is because user space may need information from auxv to set up an
alternative signal stack, and it may not know if it would use V. ARM64
also reports the size assuming all extensions are used.

Thanks,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
