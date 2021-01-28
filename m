Return-Path: <SRS0=TFiT=G7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34AEC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 15:26:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66BC764DEF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 15:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66BC764DEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nzyll+ZwRM76dRqfjp/S62ink3pxGP9c6wssG7lo2Ro=; b=LWE4ZUV9NPaXvQHFKS5MmGMFp
	nO7qLhjlTe1ss0PbnxBA7qjjkB+hT8RqCwXYsoWle7w6VvdPGxo7g6BBpn+9b4mKndNSHCnSwqhbe
	4wTFamtB2AlfRAO7epAxZ6c8MM5He5k9pfxIxVa4F6z+f5bHNdL1UbqaHKf7cMdwV+05Ox0B0Y/OS
	bsv30IUdzdk5aZFyPiefiIgsRvlzitzDFXoAEiOHz4NmpNLIV6rMbdU/kvPxZAxUua94iAOAPLihw
	+bu1+H0C5JCcphLOxLT4zL+5m99921ULXolQRtq7NVIXWCW1lqU/ezz/AK6k+qmlCmWUTb8oL19e2
	1CJQ9INsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l59Bk-0007Gz-Ob; Thu, 28 Jan 2021 15:26:28 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l59Bg-0007FE-2v; Thu, 28 Jan 2021 15:26:25 +0000
Received: by mail-oi1-f176.google.com with SMTP id a77so6389137oii.4;
 Thu, 28 Jan 2021 07:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=22NNIJdwFVtaiYnEXy306Fq0ou0H+TSG6fT0yU8Xc64=;
 b=IGVQsbhVsvs73ofYiWpbdhHKPZF/m/8MqwIh/CCcdGmb1iug7TOangh0npMfJXad7+
 fhECksCA2zEA3xOLqPMqtYhTe5marZ4LMJSNYlqeln6D619kynsQ07aZc++3HjRi3lVP
 +SYmROEaRqrrZxWuaN3ZS/+Bu8FoxBuwzyCpHYPPWIowhYxcHLEBUi9qAeKd3W4dKQBv
 RsEUdNJvlxcQ3DJly4fTHniv6yuwIwfj4dm8Vuo9/JCmyFPgOd8QeObNEKZcrgAZ3PR9
 dtfiSlYp/IU+cV9NgqDUYUKSodJkSqYJVPDIa7zPEf97UjILg7afUwB5BmIUW46pXKqF
 XD5Q==
X-Gm-Message-State: AOAM533TjZQCZBPzSfhREP7ZZ0beotODg6+cvCitd1jTVGGHB4JBDbPs
 NF4QoVftUoeBqMxi9cLKc9H+Eti1pGdiBn966Ko=
X-Google-Smtp-Source: ABdhPJwtbqub3RLU0ojGN/DhaJhbIQp0M2FPhLkgMFxBJXtpYqt2MlrWj8HIYEH5Ijo/ju/HPcDtnyakbL0+WizWBWY=
X-Received: by 2002:aca:4d8d:: with SMTP id a135mr6655596oib.153.1611847580638; 
 Thu, 28 Jan 2021 07:26:20 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYta_uOLktmMnZHUTK9Uqx-rjtmQSSvHFCsvQsVdZDdm8A@mail.gmail.com>
In-Reply-To: <CA+G9fYta_uOLktmMnZHUTK9Uqx-rjtmQSSvHFCsvQsVdZDdm8A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Jan 2021 16:26:09 +0100
Message-ID: <CAMuHMdUzCFuuUcgMwh+numoCnr_p0tfTucybytymUceyPV0TBQ@mail.gmail.com>
Subject: Re: [next] mm/nommu.c:1671:6: error: conflicting types for
 'filemap_map_pages'
To: Naresh Kamboju <naresh.kamboju@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_102624_173535_9B715ADA 
X-CRM114-Status: GOOD (  11.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-mm <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Naresh,

On Thu, Jan 28, 2021 at 3:25 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
> arm, sh and riscv architecture build failed on today's Linux next tag 20210128.
>
> FYI,
> # CONFIG_MMU is not set on these failed configs.
> config file attached to this email.
>
> make --silent --keep-going --jobs=8 O=/home/tux  -
> build/.cache/tuxmake/builds/1/tmp ARCH=arm
> CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
> arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'
> mm/nommu.c:1671:6: error: conflicting types for 'filemap_map_pages'
>  1671 | void filemap_map_pages(struct vm_fault *vmf,
>       |      ^~~~~~~~~~~~~~~~~
> In file included from mm/nommu.c:20:
> include/linux/mm.h:2578:19: note: previous declaration of
> 'filemap_map_pages' was here
>  2578 | extern vm_fault_t filemap_map_pages(struct vm_fault *vmf,
>       |                   ^~~~~~~~~~~~~~~~~

Care to give "[PATCH -next] mm/nommu: Fix return type of
filemap_map_pages()" a try?
https://lore.kernel.org/lkml/20210128100626.2257638-1-geert@linux-m68k.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
