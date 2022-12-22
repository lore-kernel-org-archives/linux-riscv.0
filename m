Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDCAC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 03:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jsLt0kbG4dQOoHi/7drpjrlvuutN+7i9tMp/wmdflXs=; b=03gFT+UArXbKZY
	TOSWGt0lw2LdEKytYwrA0/vF30uKcisbmgdCnxG+CVC6/hPyNUcoI0bLFcmpJ9apARcqRZ4AiSj/b
	BFVb5TwQ0PPHTptwZOt0euFDcI0H5xJ1e3dcZFWc0oSk5LP6oCc9uL2y1el3Q2XVVt0PHXPgJgyTC
	4OyNoesLIcy5lsm7PFg8cGHUAlLZX2JjfbGjlHwlIMEbnV+8LDhirRBR+nMecjNtyruLvO9hy75T+
	U5D7jOIn9W4HxaSXyAav0kBSW7UGdQa2D9OSPD6Y0La3utTRjEUfAFTJCyrjgqD8UPJm+CRAU8Pr8
	d6lbX3Fy8NtyunkGJbHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8COu-006Ygk-8y; Thu, 22 Dec 2022 03:37:44 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8COr-006Yfh-8I
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 03:37:42 +0000
Received: by mail-vs1-xe31.google.com with SMTP id m2so603709vsv.9
        for <linux-riscv@lists.infradead.org>; Wed, 21 Dec 2022 19:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R/vuKASG7W9bgoDHU50sqLq1DsBHxj4D4/J7WpqGZVw=;
        b=fxhs6k1yqOJPEMXnjAFGEwzyyQHjKHBEgAjuEM55V6a+RuRG7NNcWN5bnJ8N4niVRh
         nCC1QK2k+SMts+YQ+TKPb7gx3CIdTvnFQOr8LbDdVziZvGUYWYjsYvlSOj5c+9SwkWE+
         4KBJuLlnFu/ERJ0ifwjRIxnO+waISi7O0Ua02ULVrBZn79gGB9RaNsllI3Cu5+F+tI8m
         tCxVwsrkLtIY/w7jgwSAiULiWshJjDmhkG2CxYlOY8am/r5ZLtzf/EYuPUjjjJNWj/4W
         w8GTXXGlzGZjm88fxoMOAwGa1jmWHoikwIdzZI6kPFxXjCgvOSAKVr9gkla4geQhfkiG
         I0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/vuKASG7W9bgoDHU50sqLq1DsBHxj4D4/J7WpqGZVw=;
        b=MdtYTg9HZLJYFpXiT4bkqYXXjxq7dixH2uoRSemjJiNnPZeuiGis3r7i+Rzbk6Tecv
         07lPIT+Iacs1gJnSWqQdKHqo27znn1AfTzvfOW9VVJjiYvkUO2BCMQBX+Mo17B0Rk8/S
         HtQtIv5JbisXdDQqzZDy5D1X2lP3rv/jwSfy1JiOE3N9mYxmSJthQHlgw1Fmfl3Zzjii
         YJh9gi+0nV7ZgTl3W4LoM0g1fvKdKAy/WoXayoAxbiNppVEMDcsIpezt9Z8I2cTJZYjq
         2sxeEb/Zw2ZRBSMCZ3LDn/fVp675bG9LEIFGfz2HHVf+XLVK2UclV8eJt4MdAbceNZwE
         nFFA==
X-Gm-Message-State: AFqh2kol9nX190gmQ3WVh4npyP6W7WNb6nMOYR+1KQRIrGvcVAqtMMeH
	zQfgMSyVLwVsr3B1OfXD3Q6XrlCmr6HrnrUlc7QlfQ==
X-Google-Smtp-Source: AMrXdXsKgxNkBo8IUlCPqOpd8FbH8N2IevLDsBsbpBQPxj/k9xUqy2Kn/utTzEaTyjyBxOGA0gq81sEWEUOJgRLNGf4=
X-Received: by 2002:a05:6102:510e:b0:3b1:2b83:1861 with SMTP id
 bm14-20020a056102510e00b003b12b831861mr502162vsb.10.1671680258707; Wed, 21
 Dec 2022 19:37:38 -0800 (PST)
MIME-Version: 1.0
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <1631497278-29829-3-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com> <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com> <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com> <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com> <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
In-Reply-To: <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 22 Dec 2022 11:37:27 +0800
Message-ID: <CABvJ_xg--0Gia9Za9endcz5kaqfDugrcdpkg-f1u=2mt7AE2cA@mail.gmail.com>
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>, 
	Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Kito Cheng <kito.cheng@sifive.com>, =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Szabolcs Nagy <szabolcs.nagy@arm.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Aaron Durbin <adurbin@rivosinc.com>, Andrew de los Reyes <adlr@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, GNU C Library <libc-alpha@sourceware.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_193741_395598_57F3655D 
X-CRM114-Status: GOOD (  19.02  )
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

On Thu, Dec 22, 2022 at 3:52 AM Vineet Gupta <vineetg@rivosinc.com> wrote:
>
>
>
> On 12/21/22 11:45, Vineet Gupta wrote:
> >
> > 4. Kernel with RVV support + user program using original Glibc sigcontext
> > In this case, the kernel needs to save vector registers context to
> > memory. The user program may encounter memory issues if the user space
> > does not reserve enough memory size for the kernel to create the
> > sigcontext. However, we can't seem to avoid this case since there is
> > no flexible memory area in struct sigcontext for future expansion.
>
> This is not an issue, if we don't change sigcontext (in kernel and
> glibc) - it is essentially the case of existing binaries.
> kernel still saves regs on user stack, in rt_sigframe, its just that
> userspace is not able to access them in SA_SIGINFO signal handers.
> aarch64 have this implemented this approach and it is likely they can't
> do that either for SVE regs.

Sorry, I don't clearly describe the case. As you mentioned, the kernel
will save the vector registers to the user stack or user-specified
memory region by struct rt_sigframe in your patch. But, if there is an
existing binary compiled with the original sigcontext.h, it will
assume that the kernel only occupies the sizeof(struct sigcontext) to
save these registers. It will not aware the RVV extension is supported
and not expect that the kernel with RVV support needs an extra huge
memory region on its stack or specified memory region to save vector
registers context. In this case, the user program will encounter
memory corruption issues if the size of the memory region specified by
the user program is not enough to store these vector registers'
context.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
