Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3ECBC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 13:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/MBY3gx/EeKzi1wC+qFKJ8o/SyvDrygTEZSAFfWZA0=; b=jnf2iqJQcuBCRp
	xMpXMkuusTordN1wydsoJBDqJVc8dN26L1KDYsJtU65JJebKI5t0xsD5AC02LYuHMvfM/BBvQa49N
	/dkV5HuHkhHIXnNzVcDMXInkP8EzdTbC40MVc8Uc9R09rqr3j8okZBz53NNZpXX9lUHvRDKNInzrV
	/ycNEcirQyhJD1Sm2G/5MQj9l6WgsUQTIccdmGO6mvh94wHsWTb/7F1Fi6/vNldpowlPFfKEqEHEg
	ZmrKk1ZfobeIIdqUDI1y8G33u/vwMnMGtZaqTMbboCN2B9v7eepTsxkYKxdQ8uF9XJNKU5JgxUodk
	eUiho0qd4V+8cvvylOzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqZpF-00HQmv-9C; Thu, 03 Nov 2022 13:00:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqZp1-00HQli-Nk
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 12:59:53 +0000
Received: by mail-wm1-x331.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso3295093wme.5
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 05:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IxRwrgpGcbayuw2J5RAtTHB/3ysPD12k+PHRaeFxlKQ=;
        b=GwwrRjkkygx3kA4xo0QuwS+Ne2RINsFO3eCQp6cQ9Ourq60bUc4Bt5AgAPDbQAon6l
         gYwG/q+U+4m65imNxHxEtv/wguv7zVx1FdM6bBSupRiKHQqcJvzgQCj/pXBAzObzeey2
         eIWJHLQuwXCd9OYAJulehF09iAhGGabS+GZ77jdsbOlVSgmaGBS8wMdeEM0HU+61DYEc
         XSM998DKTGw19ogYfqk8LePf/GDY1Q9OaYCfMoPhWyy6X91NirqfboJUiqUVN8Bntsr0
         J4JjRNE0fAbRqdAi3Z8tdryQsJpUsCFo5O3S6BnzL7FXthHoIBTqW543UoTxkVoKFyC9
         j5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxRwrgpGcbayuw2J5RAtTHB/3ysPD12k+PHRaeFxlKQ=;
        b=fRSpbu72yXeus7/R4NEoYISqGfBvKhnGw/Ebq8LSEpjrRaXqWLQmiembnIow0Dfpoa
         butt7FlKphDcPPdUreRm1FnBFPp/Jineirq9lsNtB2gvnAwzOfgMU0qkSQkMlHSdSoMs
         T4nutVc8VQTgT/GlIQwyPzksyUIu3iAkPe/zQZu9seCFZaSn1wiqE261x6sZbUd31DHW
         cJQUTv0dF300Kn3DnIrhvvsqDH04wO/+Hlk68c5Wlr5x5dwOnoh7jN5j41IykfK/hkWN
         n3rAoUbz2tpr0hV68fKmqS+u4EtEJoUMK83FI8dXKOYLEek6AID1XmxMvOArlqPEEgpi
         tu9w==
X-Gm-Message-State: ACrzQf1EHVUGa5/CVfIU4XY68c/q0FexWkkB1VRgc4eS6/W+ULtqalqB
	+K2xdBnm9QLzEuus9vwn2iRaCA==
X-Google-Smtp-Source: AMsMyM4gXpjfMh9GUNM/WaSq7jLD61jpWhHWyPIsDO5O97VJQvdfk1Gffqv1EV4246udjYvGZYs8Pg==
X-Received: by 2002:a05:600c:3b1d:b0:3c6:ff0d:6a60 with SMTP id m29-20020a05600c3b1d00b003c6ff0d6a60mr19364166wms.183.1667480386818;
        Thu, 03 Nov 2022 05:59:46 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id bg36-20020a05600c3ca400b003cf774c31a0sm5977531wmb.16.2022.11.03.05.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 05:59:46 -0700 (PDT)
Date: Thu, 3 Nov 2022 13:59:45 +0100
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
Message-ID: <20221103125945.lrr5oxxmylwpam53@kamzik>
References: <20221014155845.1986223-3-ajones@ventanamicro.com>
 <20221028074828.b66uuqqfbrnjdtab@kamzik>
 <Y1vrMMtRwb0Lekl0@yury-laptop>
 <Y1vvMlwf/4EA/8WW@zn.tnic>
 <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
 <Y1v+Ed6mRN9gisJS@zn.tnic>
 <20221031080604.6xei6c4e3ckhsvmy@kamzik>
 <Y1+OUawGJDjh4DOJ@zn.tnic>
 <20221031100327.r7tswmpszvs5ot5n@kamzik>
 <Y2K6clNJBn0SbWU+@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2K6clNJBn0SbWU+@zn.tnic>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_055951_904629_6057BFA8 
X-CRM114-Status: GOOD (  23.68  )
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

On Wed, Nov 02, 2022 at 07:44:02PM +0100, Borislav Petkov wrote:
> On Mon, Oct 31, 2022 at 11:03:27AM +0100, Andrew Jones wrote:
> > Currently (after the revert of 78e5a3399421)
> 
> After the revert?
> 
> That commit is still in the latest Linus tree.

The revert commit is 80493877d7d0 ("Revert "cpumask: fix checking valid
cpu range".")

> 
> > with DEBUG_PER_CPU_MAPS we'll get a warning splat when the cpu is
> > outside the range [-1, nr_cpu_ids)
> 
> Yah, that range makes sense.
> 
> > and cpumask_next() will call find_next_bit() with the input plus one anyway.
> > find_next_bit() doesn't explicity document what happens when an input is
> > outside the range, but it currently returns the bitmap size without any
> > side effects, which means cpumask_next() will return nr_cpu_ids.
> 
> That is good to have in the commit message.
> 
> > show_cpuinfo() doesn't try to show anything in that case and stops its
> > loop, or, IOW, things work fine now with an input of nr_cpu_ids - 1. But,
> > show_cpuinfo() is just getting away with a violated cpumask_next()
> > contract, which 78e5a3399421 exposed. How about a new commit message like
> > this
> 
> You're making it sound more complex than it is. All you wanna say is:
> 
> "Filter out invalid cpumask_next() inputs by checking its first argument
> against nr_cpu_ids because cpumask_next() will call find_next_bit() with
> the input plus one but the valid range for n is [-1, nr_cpu_ids)."

The patch I'm proposing ensures cpumask_next()'s range, which is actually
[-1, nr_cpus_ids - 1), isn't violated. Violating that range will generate
the warning for kernels which have commit 78e5a3399421 ("cpumask: fix
checking valid cpu range"), but not its revert.

Since 78e5a3399421 has been reverted, the value of this proposed fix is
less, and indeed the warning may even go away completely for these types
of cpumask calls[1]. However, it seems reasonable for callers to implement
their own checks until the cpumask API has documented what they should
expect.

[1] https://lore.kernel.org/all/CAHk-=wihz-GXx66MmEyaADgS1fQE_LDcB9wrHAmkvXkd8nx9tA@mail.gmail.com/

> 
> But that thing with the revert above needs to be clarified first.

I'll send a v4 with another stab at the commit message.

Thanks,
drew

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
