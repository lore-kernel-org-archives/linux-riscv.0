Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF3EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 15:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Ej5fvdjhzIYcmWpBhiq0OmrCbpi/jBPgLPelekcE60=; b=Rb6lLi4yYt4rQM
	wn4wNzkFCtMieBdYFOWCqbxRfRLVuhmGeaRrghHVdd9Rhw88NGLt/5eKZ3Y5W80KHtU3nWAkxDvvr
	awsotBQ6GdBTair8/SYyBNiSptOtzYcXCLG+uIAmIgWB7XatacUhKhl7yrI8sk4RIqzsH6K4sk0hp
	ROuDGEKdHJPfQxlwpN7kFJt7P3NwuImEo+r4XdJ1DNbuzbMfPlquKRIDqfzWJOo+ct68YVZ8/QhMs
	eJd7ZBvm088yuogHxAE6hcIlsgsa6x3HmW473UmfRWLME/C7l/D/ywo/BN+SD31b3pd+SltgALBIt
	3r9x73GaqMUANZqTSkzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqcQ8-000UjV-3k; Thu, 03 Nov 2022 15:46:20 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqcEQ-000PWq-28
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 15:34:26 +0000
Received: by mail-ej1-x62e.google.com with SMTP id k2so6316554ejr.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 08:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2nyiqtS+4bjeBqC2j1CWjrUOou5+X6yWUKBJ7APuUG8=;
        b=IMzxLKhzewPSr953ozKcvA7MJkFz5aBGxh8wYt4YDDFNkFIw3w1GbuIjjEYSijrvZN
         vrsCGUFhvMNDOgPyJH44HqqAB1ZCby8RagmeEdamwIzh7rWeGkXUJabTgCCG9GgR49p8
         eM1itnPR9VBPRPpXfufcFcUxykqWRbKSPPJgqNhWqyIczmyjaQ6yxBg5KqRewZ7TYZcy
         yquj8IvH/AQtJnsWm9yePrvX+uUI5XSresCTCa3CObXmVX+CRvt3amiWYtwztltaW2u/
         K2vNjxe8ke2YRetylyiUkj+eMGGsypPmIL4gqhk0ENvCLYBb5PdSkY7ojDfwYsl+jzEo
         D12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nyiqtS+4bjeBqC2j1CWjrUOou5+X6yWUKBJ7APuUG8=;
        b=77nzDRMbOpOB5SMnwQNnY25SCs9U0KHOEsZH4nEAqy7/2QbH5jCFvK1Bhpwri4+4U0
         loxYydYvfrdNgGCpBI6YZWZv5LsKbokc0YFu1Sn9U3paYFncu891B+ai6f9sDv+Flvwd
         87R6fOVbKZzCAxFFJkL79i+NtpN3WQVdzRsFK08+jh9UZ/FoOFlhRTXAi0E9Qd7yt6L6
         HhT2NwskVXyp5yYKWv5RosqZvsUnNHdIoY30IB0jEAIvrJwOF60NEwqEFlKDxsAJ3P5B
         6Mh+8gfoDwzPtsNSA3zTj3w/icVLgaZSeHKmpM5QMd9R4XYDpZd0/2L/Q+VBfI10PPAo
         IUSQ==
X-Gm-Message-State: ACrzQf0pZji+E7PDboLouK3FHvcGW3EPeEPtw3q5hosCH02oQfY+qjdV
	O06iVqtQ25kc4ACPjTsOUAqHRw==
X-Google-Smtp-Source: AMsMyM7fW4+lX3GNb3JnmyhpDtENiHSDLEpmcsIq/zZQ8gPf3Wg1SImlQR44FmCt0HiSs2WLUbDJOQ==
X-Received: by 2002:a17:907:6e1a:b0:7ad:ba0b:538c with SMTP id sd26-20020a1709076e1a00b007adba0b538cmr26868184ejc.111.1667489645948;
        Thu, 03 Nov 2022 08:34:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id r5-20020a170906a20500b00787f91a6b16sm627228ejy.26.2022.11.03.08.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 08:34:05 -0700 (PDT)
Date: Thu, 3 Nov 2022 16:34:04 +0100
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
Message-ID: <20221103153404.uh77nrdkowrxj6cr@kamzik>
References: <Y1vrMMtRwb0Lekl0@yury-laptop>
 <Y1vvMlwf/4EA/8WW@zn.tnic>
 <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
 <Y1v+Ed6mRN9gisJS@zn.tnic>
 <20221031080604.6xei6c4e3ckhsvmy@kamzik>
 <Y1+OUawGJDjh4DOJ@zn.tnic>
 <20221031100327.r7tswmpszvs5ot5n@kamzik>
 <Y2K6clNJBn0SbWU+@zn.tnic>
 <20221103125945.lrr5oxxmylwpam53@kamzik>
 <Y2PX9GfxWYh6+XGT@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y2PX9GfxWYh6+XGT@zn.tnic>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_083424_944741_A7275938 
X-CRM114-Status: GOOD (  23.86  )
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

On Thu, Nov 03, 2022 at 04:02:12PM +0100, Borislav Petkov wrote:
> On Thu, Nov 03, 2022 at 01:59:45PM +0100, Andrew Jones wrote:
> > The patch I'm proposing ensures cpumask_next()'s range, which is actually
> > [-1, nr_cpus_ids - 1),
> 
> Lemme make sure I understand it correctly: on the upper boundary, if you
> supply for n the value nr_cpu_ids - 2, then it will return potentially
> the last bit if the mask is set, i.e., the one at position (nr_cpu_ids - 1).
> 
> If you supply nr_cpus_ids - 1, then it'll return nr_cpu_ids to signal no
> further bits set.
> 
> Yes, no?

Yes

> 
> > I'll send a v4 with another stab at the commit message.
> 
> Yes, and it is still an unreadable mess: "A kernel compiled with commit
> ... but not its revert... " Nope.
> 
> First make sure cpumask_next()'s valid accepted range has been settled
> upon, has been explicitly documented in a comment above it and then I'll
> take a patch that fixes whatever is there to fix.

That's fair, but I'll leave that to Yury.

> 
> Callers should not have to filter values before passing them in - the
> function either returns an error or returns the next bit in the mask.

That's reasonable, but cpumask folk probably need to discuss it because
not all cpumask functions have a return value where an error may be
placed.

> 
> This thing:
> 
> 	if (*pos == nr_cpu_ids)
> 
> but then to pass in pos - 1:
> 
> 	*pos = cpumask_next(*pos - 1
> 
> looks to me like the interface needs more cooking.

Indeed, but that's less of an issue with cpumask_next() than with
the way cpuinfo implements its start and next seq ops (next
unconditionally increments *pos and then calls start and start
must use *pos - 1 since the first time its called it needs to use
-1).

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
