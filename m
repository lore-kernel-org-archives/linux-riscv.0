Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD55C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Feb 2022 19:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Yzh68iXNE3bi1t/B33/7fn1IoERu2NUJmIO1JeptYM=; b=PYt3z/8hO8g6yY
	Swwf5b1py/M0N6d1VviCIVqwr8EATuiWik8jK25QUSSOakJrB5ypXSZv5VH3cpQkaCSaeMlvzENTy
	AbXc4F6JPsp/7eH8sai9r0DAHdDixv1ivYq2Tc+15ezkog16z7TE9BA2pt2IHqFUPEb0beDMRbndR
	54voz9o+c6egcgH6BnxOKNbcxjtb5Gr5vrWqrB7w5mPWMk5loG+t+BhIj3ykUMFmEIUkpuUX6nI3Z
	u5detzZ0efGy/JMjQnxgyiT520kExM50y2iD7QL8gVG4dRLBbd7/pkrdkPByxCNtAhBEvvZDwanVp
	Q3mZ1jSGCJYJf4KCYwKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKmFX-00BrUJ-08; Thu, 17 Feb 2022 19:15:31 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKmFR-00BrPL-7k
 for linux-riscv@lists.infradead.org; Thu, 17 Feb 2022 19:15:28 +0000
Received: by mail-ej1-x632.google.com with SMTP id gb39so9613027ejc.1
 for <linux-riscv@lists.infradead.org>; Thu, 17 Feb 2022 11:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+RZ8CAgnGa1bk5gBxds4oezzFjZLQMV+wOvrmesI1Hw=;
 b=aC4vKGs+W+TwIvfSuol31sXb0DdwmBd+7ynpizLCKhXxCJFdEAZpxJvcWGa/FztIyE
 kaM//DxAJXCDh5aNx4GSOgCqArnp/pPXpeZOwL6NCOz09LePB9aHf9rLmhVNdEQhmOfG
 zcHXwBp2FYlRXI6tXnhZ/KCBgXws1BhNZED9tFrHvUNz3V476fnXQSLMeM+Shpqaev6m
 W07DvhrokY4sorGqrqwhi0S/cnzs7UTqO0cIGR6WWEAN8VmZadQ9VO/+zsTblOwHPeWg
 SsUN3Cw66rH7ga20AFYG5KTR6BdWsnByVkv9VANJJ9bhC1jZcqQ2NhN41BgDZLcdhMyk
 TY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+RZ8CAgnGa1bk5gBxds4oezzFjZLQMV+wOvrmesI1Hw=;
 b=whYbdCtBhA9458LCCz2yPMP0jHf92Ro7ZlT2S8GzPLGyHFbBWYRhq113op/vWj3o6F
 Zis+8RDxM0V7CfIL8yRcaMkIg17ogHR3oFMh27ZeCH0LW767P7hvObE+CNVjCZoBlsG9
 MqdYZTTex2OeRrn0WwQGKjEmbqIsZxazymqMpSmJtZVXaJSPykzV/1DuEjaF2QeU6Q8q
 hZEQLUaq0hK/CW68j8+gz7TkXLd7kDMEFEjPM6oE4gH/w7xMcmINr7fLUDX3mN5pn4Gp
 MWsYKMunhRP4fRtdm4eKcEKLOUYm5Qrg117dPTNPD68upz6nhMf20E/AbHK9xa2AHXDG
 ayYQ==
X-Gm-Message-State: AOAM531+/HehCkdLxYWcK6xIFtr4lN7y1NtnpVjv7Htu3p0QDfk3yrrk
 5uSI6inwMSmsQmAd/AeoRzsvw8o5d5vZgctsPy8Pww==
X-Google-Smtp-Source: ABdhPJw48Oadf8QR2zY/o5TdRU0UiMjXS1n08+Rvo/jef0cepMooOXBMnDr3m4SH0a9wsDyMLo89s3cuvktj12QRONA=
X-Received: by 2002:a17:906:4b52:b0:6cd:3863:b35e with SMTP id
 j18-20020a1709064b5200b006cd3863b35emr3488094ejv.415.1645125322737; Thu, 17
 Feb 2022 11:15:22 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-14-arnd@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Thu, 17 Feb 2022 11:15:11 -0800
Message-ID: <CALCETrVOvYPN4_6hS8wpm2v9bGZupZ5x4=vZAseG57OUgvLGfw@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-api@vger.kernel.org, 
 arnd@arndb.de, linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk, 
 linux@armlinux.org.uk, will@kernel.org, guoren@kernel.org, 
 bcain@codeaurora.org, geert@linux-m68k.org, monstr@monstr.eu, 
 tsbogend@alpha.franken.de, nickhu@andestech.com, green.hu@gmail.com, 
 dinguyen@kernel.org, shorne@gmail.com, deller@gmx.de, mpe@ellerman.id.au, 
 peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com, 
 hca@linux.ibm.com, dalias@libc.org, davem@davemloft.net, richard@nod.at, 
 x86@kernel.org, jcmvbkbc@gmail.com, ebiederm@xmission.com, 
 akpm@linux-foundation.org, ardb@kernel.org, linux-alpha@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org, 
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
 linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_111525_414364_DADB47BA 
X-CRM114-Status: GOOD (  17.23  )
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

On Wed, Feb 16, 2022 at 5:19 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> There are many different ways that access_ok() is defined across
> architectures, but in the end, they all just compare against the
> user_addr_max() value or they accept anything.
>
> Provide one definition that works for most architectures, checking
> against TASK_SIZE_MAX for user processes or skipping the check inside
> of uaccess_kernel() sections.
>
> For architectures without CONFIG_SET_FS(), this should be the fastest
> check, as it comes down to a single comparison of a pointer against a
> compile-time constant, while the architecture specific versions tend to
> do something more complex for historic reasons or get something wrong.

This isn't actually optimal.  On x86, TASK_SIZE_MAX is a bizarre
constant that has a very specific value to work around a bug^Wdesign
error^Wfeature of Intel CPUs.  TASK_SIZE_MAX is the maximum address at
which userspace is permitted to allocate memory, but there is a huge
gap between user and kernel addresses, and any value in the gap would
be adequate for the comparison.  If we wanted to optimize this, simply
checking the high bit (which x86 can do without any immediate
constants at all) would be sufficient and, for an access known to fit
in 32 bits, one could get even fancier and completely ignore the size
of the access.  (For accesses not known to fit in 32 bits, I suspect
some creativity could still come up with a construction that's
substantially faster than the one in your patch.)

So there's plenty of room for optimization here.

(This is not in any respect a NAK -- it's just an observation that
this could be even better.)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
