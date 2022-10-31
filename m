Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F575FA3740
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 08:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuhU97efxACf4/uBUQEx+NpjwAPkvinZSh+bCIVwFOc=; b=Xk3WQXPsNuSYFc
	jnzwCF4xY/VUx3wvl5gMCqUOJKae820HUUEJCq/BJ8wSarG1Kc9sVe1L11oTIQhuaUdQlA7KvpLTo
	xNCg8trMqwM0DbfKLU/fMNbAVS/Xg/z/i3Zy7fbI1GvpRqtx9igse7VLd9r3gVmKILdBhJo0bnhtU
	dp3vf5W3Knf7Wee2Gu/WEtiLe/5XIatqOKvVJO8tbDUGlJFQ5HjRHn4n3C+NpIWHJCBK512RJM9PM
	Ev8yaj9n9UNB+E+N6SajqIxWc1oCeULNalMOJeEkm1qRpqj7nc5Pl70uv4WEyxrmFOuUuEyfmijC9
	/2DltLwcO88ZHMMLLEQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opPoE-009QFf-Uv; Mon, 31 Oct 2022 08:06:14 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opPoA-009QAr-3h
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 08:06:13 +0000
Received: by mail-ej1-x634.google.com with SMTP id b2so27423964eja.6
        for <linux-riscv@lists.infradead.org>; Mon, 31 Oct 2022 01:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=poxA0LEev9jPrhZnkwyY7vsWe/HDoG5TgR6taboptUU=;
        b=LYy0CICIyprTOFQXJbmxldQgszdggru36ppt8BlYlS/6Fadz4lG7+PvpBInXK3sEwl
         9c19coxXN6zfPF621QDiLFySz9+w3De89yPYhIqd1pl1g1LL2OTgeS0IT7F60LNAXCBj
         TF4jCAkyzHckAHw+4NbUXCJlkXC8jqinNwGBAo650tUVkm4qOCdpQOyA6+CxyIo6oVJI
         KHTpD5kEOyKveHPx/t7FAd8yS3EE8MPg+seA2KF22Fmhl2l8FspTrr8RgWX++cf2eZMF
         xm3SjqbAjsK1sVWszFcL2x0alWobxfqRnsQgl+JbUXYc2ZUSVa7+sfBfsb+bIQSHYlqq
         KjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poxA0LEev9jPrhZnkwyY7vsWe/HDoG5TgR6taboptUU=;
        b=ao3aE/YXKqp617rq8CJ0Kbemby3xopCbuXPN15Nju/nRqzbQfASAyfQsh9QMf/fvUG
         ZM0eYV86JJsT4fxwcpeeD6DLWMbLx2VnGEW58FX0MrMc3YKnkLJ0Yk+HQ8wR0p3mdDp8
         4sVnENhP44oWFrlL4qI9PNOr7qoNVUDWaW/yiEhhrvrqvwXWUcHSthIxw9tfsOAzqi8T
         Bcpqj1KF3Uukibl2ZkcpNjyQYXvquLjQiSk4qZ9hg/NLjWmwMSd3mS26kxkh9pFSUfQq
         FJBvHcPH3aHXvRl1kw5Verm3x5XjxrO1ZQW3TaZO9zM0yFFYTXXyJdtbwGlej3jLAxgh
         K3bA==
X-Gm-Message-State: ACrzQf0UPdt0+aIJg5i+gerlU8g8FPC6jIBawshhUnFdlhH8wtZDJKlD
	c09dfFRQV+AQvmfN2gAr5Mxpzg==
X-Google-Smtp-Source: AMsMyM5muTvUIOECduCaxj0EnA1GyAIhvxzQvG2kLFyGrfnTCKJuYOT5siPGSm+xWiTGjY/PqNGVtg==
X-Received: by 2002:a17:907:80b:b0:77a:86a1:db52 with SMTP id wv11-20020a170907080b00b0077a86a1db52mr11721653ejb.294.1667203565981;
        Mon, 31 Oct 2022 01:06:05 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id kz4-20020a17090777c400b0077b523d309asm2663665ejc.185.2022.10.31.01.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 01:06:05 -0700 (PDT)
Date: Mon, 31 Oct 2022 09:06:04 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Yury Norov <yury.norov@gmail.com>, x86@kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>, openrisc@lists.librecores.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	"open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Message-ID: <20221031080604.6xei6c4e3ckhsvmy@kamzik>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
 <20221014155845.1986223-3-ajones@ventanamicro.com>
 <20221028074828.b66uuqqfbrnjdtab@kamzik>
 <Y1vrMMtRwb0Lekl0@yury-laptop>
 <Y1vvMlwf/4EA/8WW@zn.tnic>
 <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
 <Y1v+Ed6mRN9gisJS@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y1v+Ed6mRN9gisJS@zn.tnic>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_010610_320543_2C74EECB 
X-CRM114-Status: GOOD (  16.79  )
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

On Fri, Oct 28, 2022 at 06:06:41PM +0200, Borislav Petkov wrote:
> On Fri, Oct 28, 2022 at 10:13:28AM -0500, Yury Norov wrote:
> > Because it's related to bitmap API usage and has been revealed after
> > some work in bitmaps.
> 
> So first of all, that "fix" needs to explain what exactly it is fixing.
> Not "it fixes this and that warning" but why the input arg to
> cpumask_next() cannot be nr_cpu_ids because... yadda yadda...

Hi Boris,

I didn't realize you were still looking for improvements to the commit
message for this patch. I could add something like,

 The valid cpumask range is [0, nr_cpu_ids) and cpumask_next() always
 returns a CPU ID greater than its input, which results in its input
 range being [-1, nr_cpu_ids - 1). Ensure showing CPU info avoids
 triggering error conditions in cpumask_next() by stopping its loop
 over CPUs when its input would be invalid.

Thanks,
drew

> 
> > And because nobody else cares.
> 
> Why do you assume that?
> 
> > If you're willing to move it yourself please go ahead.
> 
> If it fixes a real issue, we are taking it. And pls note that x86
> patches go through the tip tree.
> 
> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
