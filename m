Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3F0C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 21:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tB37O+wP7o+TeW5aKXzqXoH6RFaomgfEVOeNQzlYNL8=; b=LvVAYxtQ0zB5Zi
	DSmSeWtAiY8jzE6BFctEeoMsx5uhNPESI0E8G9ccld0uSppLNehm6o9KmmSSBpShYT4ZLRWBsiGf0
	JbKES2EXukn6Qd+TaA7QVkYyNWMeAJ0v+ZEnU1vqjhiznQ9DTJpUxf+YmUQofZ+QVl1fTluhzuMde
	b9pBcOoK3eDILqixKs63wEcZaUJAZHLhrIBJURMaExpcwiJ4twLlHPHdGatLmQ/V98vM8Kzn3UFzv
	0kchMwUBA+OkF8F+xVDuWBOyhxTxiKsY+z7SRYnzi0mJvpVt0ifBlk7p8LoyIaEcM3axqNJP/e2RD
	SNBgPDFvpwLXCuSYDSDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwsrA-00BTCQ-0l; Mon, 13 Dec 2021 21:27:36 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwsr7-00BTBd-3h
 for linux-riscv@lists.infradead.org; Mon, 13 Dec 2021 21:27:34 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id j2so41455386ybg.9
 for <linux-riscv@lists.infradead.org>; Mon, 13 Dec 2021 13:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tS/h42aoWNvC9F09YRt3IPscSl6Go2TabGZNpFMjr1Q=;
 b=SqJqF6KfjAHG+SeRMuPoCEqf0e/o/Y+PV6/bBLvnCli36DmKOoeFeyh6z46zS/SaE9
 BRRHa/3ViRSvPyYD/GxN0Ze6zMSmy0gkyS8R9ezmn/5L+88Cc8V+c2hb8Rr+y3XFKa20
 qhUqUlPVqlyvZv4YvFxzWzKGuZjj4iwQBmFoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tS/h42aoWNvC9F09YRt3IPscSl6Go2TabGZNpFMjr1Q=;
 b=UPDDdRS0g1YdH8/gTPi1xoQvv1fXxd4wsCYKnQOJDE97udNh6bZaSjdEAfbu1SdzsO
 Zn9zePtOV5/36cvZ0mW7UsA9rkPSFEZOIodfckQ9edvQCJ/uPT7mfQfWtmYAEaPVUCe0
 wyiNQZW3MVuhShZ1S66iXpaEViJwOQb1OAIpKe4f5ESxyNznqVI81PHpfrhu+h4m2j9n
 MoqwD9dZ4mjfTLt3+/NxAymkvIndwonBCVc1mrvzlo04pAx3BNNnsa4hqBPv4aHP/wFG
 dZnQaCBDtWH+PS6fhBUGZj5zDH/vjnAkU+o4vjorkzlv8eMyNw/4YZI2q2noSudfWc96
 fNMQ==
X-Gm-Message-State: AOAM533DSN28d5uVxMN+ARxQ1dDMw9aP44xW/Gs6ujZG+iqQ95DZO+ma
 mcjH7/69re44iY2Wuhw3QuRtyj2tVuA9U2++9Lxx
X-Google-Smtp-Source: ABdhPJzslT8/6oXCsZUd9W7eJu9fAn0X/Rv9oKsdYACWvB/fLMbHtNl1F6uZ+CVQ9FJUh+Dwghg2dQVRfT2vBmV5zUg=
X-Received: by 2002:a25:bf8d:: with SMTP id l13mr1136880ybk.713.1639430852154; 
 Mon, 13 Dec 2021 13:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <Ya4sDX974/dVEOQw@robh.at.kernel.org>
In-Reply-To: <Ya4sDX974/dVEOQw@robh.at.kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 13 Dec 2021 13:27:21 -0800
Message-ID: <CAOnJCUKcYeWaDXY6OxQPrNwKV=4t9zbpSjfQLsL70P+3GE7F7A@mail.gmail.com>
Subject: Re: [RFC 0/6] Sparse HART id support
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup.patel@wdc.com>, Greentime Hu <greentime.hu@sifive.com>, 
 Guo Ren <guoren@linux.alibaba.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Ingo Molnar <mingo@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Marc Zyngier <maz@kernel.org>, Nanyong Sun <sunnanyong@huawei.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Pekka Enberg <penberg@kernel.org>, 
 Vincent Chen <vincent.chen@sifive.com>, Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_132733_191683_05FA4981 
X-CRM114-Status: GOOD (  16.98  )
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

On Mon, Dec 6, 2021 at 7:28 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Dec 03, 2021 at 04:20:32PM -0800, Atish Patra wrote:
> > Currently, sparse hartid is not supported for Linux RISC-V for the following
> > reasons.
> > 1. Both spinwait and ordered booting method uses __cpu_up_stack/task_pointer
> >    which is an array size of NR_CPUs.
> > 2. During early booting, any hartid greater than NR_CPUs are not booted at all.
> > 3. riscv_cpuid_to_hartid_mask uses struct cpumask for generating hartid bitmap.
> > 4. SBI v0.2 implementation uses NR_CPUs as the maximum hartid number while
> >    generating hartmask.
> >
> > In order to support sparse hartid, the hartid & NR_CPUS needs to be disassociated
> > which was logically incorrect anyways. NR_CPUs represent the maximum logical|
> > CPU id configured in the kernel while the hartid represent the physical hartid
> > stored in mhartid CSR defined by the privilege specification. Thus, hartid
> > can have much greater value than logical cpuid.
>
> We already have a couple of architectures with logical to physical CPU
> id maps. See cpu_logical_map. Can we make that common and use it here?

Yes. We can move the cpu_logical_map(which is a macro) &
__cpu_logical_map(actual array with NR_CPUS size)
to common code so that all the architecture can use it instead of
defining it separately.

> That would also possibly allow for common populating the map from DT.
>

I didn't understand this part. The mapping is populated at run time
[1] as the boot cpu can be any hart in RISC-V.
That booting hart will be mapped to cpu 0. All others will be mapped
based on how the cpu node is laid out in the DT.
Do you mean we can move the 2nd part to common code as well ?

[1] RISC-V: https://elixir.bootlin.com/linux/v5.16-rc5/source/arch/riscv/kernel/smpboot.c#L102

> Rob



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
