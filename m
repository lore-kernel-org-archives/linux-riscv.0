Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D03C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 16:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:Date:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxQv0y95J+WORfh4+a+2x3j41IlgRXIm5UvJSkMErNU=; b=Vo3qt1B6IhjXAA
	1etpO8bV6zRp5PI8hzW7JFq53/8g0GZPRegCTV+/Ygu8QtrTNDO1A2GSNm9ihmmhTGCkx9zne2bxK
	zVM6sbO+/PfwjrHSBKy2jgDePGKhNcHSw3GEPfphTNDy07tk/JmpsNur3ICuZ+bKxjgWTW6ROFhlQ
	P9InCACBxtk5rc67JmbhnntJAT6Zn4hgSw+JMPv1BpZJoVugNAQTmHrdzBfRkQetM53v4mCM4mCur
	t76RqLUSEFHYwCo+/sjSdagAqV15XsCNpyOvB3Z7lR4WcBA6awYFWXS/DdZO7qezp+L9oTQCBqnu9
	PBRV/4j8E8MSgRxvB3LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqd7S-000hsy-4U; Thu, 03 Nov 2022 16:31:06 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqd7N-000hpA-H8
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 16:31:03 +0000
Received: by mail-oo1-xc35.google.com with SMTP id e11-20020a4ab14b000000b0049be568062bso333511ooo.4
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 09:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2wf8Ox+cqI36jbP+T7p6EKTUvmpF6v5KouIok7EbcyU=;
        b=Jxprr5Yb6GFP2iMDdNYwrv+edL5lsVZ+sskHoEYasypEvTLy4Q6vhTS7qqFC2ZOJ9F
         7UlwmUBWdL8ATQXLGSU2oLt77vVHPXn0OrJO9RZ4ozCxeZSFNH6CKpqcZtCvnwol4zeN
         srTpQmrtC9fSlFcJoeE3VBMkcRHxF4UC77PI0QPdBZOTiLk4O1EgX10WGEBp+gELT/Of
         f0hLEd5d1y3j2mzfUulOKKw9wLwe0rGXdFxYErQK/3o71DkASuqcP1UgrC5XDCQfhx1n
         GSTmaFTFIU7py0xRt57Y61rOd+D7tYEKoK35ZenJvXOnTlTZe3nUPKJMZ1OW7PKQwbP+
         CarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wf8Ox+cqI36jbP+T7p6EKTUvmpF6v5KouIok7EbcyU=;
        b=61Si2oa2XoDjRj2KnLCYEcyT1AB/mReS9w3nzi7iwnxt6YkjTaSS+M2MABwZbp1uVm
         xDpFvNhrp/F7tLXFecwkqj5XUtMmUHlQXRGZeGJ6yoJiYMTKKr02AfMcfFC7mP53BTGG
         e4jR3Wd9Uw2kandwqIZ4fS5RzJ9dccP8eY5nfWF1YTivAlSRF0RZ23Uvb0Q9KglpSgjW
         qPmC14iXJmrUgh1mSQLKJhtj4ZjjMq6snK3LdXmEliJIUmRIgGmB4OYT1hk3nXuq5yRa
         hPwhqwseu8C40kh54IX0eQTUjfg21kWi/ea6p3ljDbn97SC5jnCJwbu1BZwnwFQpK+T9
         8aSQ==
X-Gm-Message-State: ACrzQf1aj+8qoNgpJs75sACwxqgZ/cnSA2+O1itBT5NhZT4eFXBkzZK3
	XTtdCvhIR/BWGY5EQ9ALIqM=
X-Google-Smtp-Source: AMsMyM4XFkvxtx6hYtImOQooUBUuMwcsCe7CNpBD20J79Sc2FfnE52Rm7s0RT965HybTqZXYxmJ8ng==
X-Received: by 2002:a4a:a609:0:b0:499:74ab:f10e with SMTP id e9-20020a4aa609000000b0049974abf10emr12101601oom.13.1667493056510;
        Thu, 03 Nov 2022 09:30:56 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id t15-20020a4a858f000000b00480e1109695sm370965ooh.10.2022.11.03.09.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 09:30:56 -0700 (PDT)
From: yury.norov@gmail.com
X-Google-Original-From: Yury Norov <yury.norov@gmail.com>, To: Andrew Jones <ajones@ventanamicro.com>;
Date: Thu, 3 Nov 2022 09:30:54 -0700
Cc: Borislav Petkov <bp@alien8.de>, x86@kernel.org,
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
Message-ID: <Y2PsvvOWVs9ZLBsp@yury-laptop>
References: <Y1vvMlwf/4EA/8WW@zn.tnic>
 <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
 <Y1v+Ed6mRN9gisJS@zn.tnic>
 <20221031080604.6xei6c4e3ckhsvmy@kamzik>
 <Y1+OUawGJDjh4DOJ@zn.tnic>
 <20221031100327.r7tswmpszvs5ot5n@kamzik>
 <Y2K6clNJBn0SbWU+@zn.tnic>
 <20221103125945.lrr5oxxmylwpam53@kamzik>
 <Y2PX9GfxWYh6+XGT@zn.tnic>
 <20221103153404.uh77nrdkowrxj6cr@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221103153404.uh77nrdkowrxj6cr@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_093101_617064_DE4C0F26 
X-CRM114-Status: GOOD (  27.25  )
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

On Thu, Nov 03, 2022 at 04:34:04PM +0100, Andrew Jones wrote:
> On Thu, Nov 03, 2022 at 04:02:12PM +0100, Borislav Petkov wrote:
> > On Thu, Nov 03, 2022 at 01:59:45PM +0100, Andrew Jones wrote:
> > > The patch I'm proposing ensures cpumask_next()'s range, which is actually
> > > [-1, nr_cpus_ids - 1),
> > 
> > Lemme make sure I understand it correctly: on the upper boundary, if you
> > supply for n the value nr_cpu_ids - 2, then it will return potentially
> > the last bit if the mask is set, i.e., the one at position (nr_cpu_ids - 1).
> > 
> > If you supply nr_cpus_ids - 1, then it'll return nr_cpu_ids to signal no
> > further bits set.
> > 
> > Yes, no?
> 
> Yes
> 
> > 
> > > I'll send a v4 with another stab at the commit message.
> > 
> > Yes, and it is still an unreadable mess: "A kernel compiled with commit
> > ... but not its revert... " Nope.
> > 
> > First make sure cpumask_next()'s valid accepted range has been settled
> > upon, has been explicitly documented in a comment above it and then I'll
> > take a patch that fixes whatever is there to fix.
> 
> That's fair, but I'll leave that to Yury.

I'll take care of it.
 
> > Callers should not have to filter values before passing them in - the
> > function either returns an error or returns the next bit in the mask.
> 
> That's reasonable, but cpumask folk probably need to discuss it because
> not all cpumask functions have a return value where an error may be
> placed.
 
Callers should pass sane arguments into internal functions if they
expect sane output. The API not exported to userspace shouldn't
sanity-check all inputs arguments. For example, cpumask_next() doesn't
check srcp for NULL.

However, cpumask API is exposed to drivers, and that's why optional
cpumask_check() exists. (Probably. It has been done long before I took
over this.)

Current *generic* implementation guarantees that out-of-region offset
would prevent cpumask_next() from dereferencing srcp, and makes it
returning nr_cpu_ids. This behavior is expected by many callers. However,
there is a couple of non-generic cpumask implementations, and one of
them is written in assembler. So, the portable code shouldn't expect
from cpumasks more than documentation said: for a _valid_ offset
cpumask_next() returns next set bit or >= nr_cpu_ids.

cpumask_check() has been broken for years. Attempting to fix it faced
so much resistance, that I had to revert the patch. Now there's
ongoing discussion whether we need this check at all. My opinion is
that if all implementations of cpumask (more precisely, underlying
bitmap API) are safe against out-of-range offset, we can simply remove
cpumask_check(). Those users, like cpuinfo, who waste time on useless
last iteration will bear it themselves. 
 
Thanks,
Yury

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
