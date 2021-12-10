Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A2AC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 13:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wydEsBnrI5+L5p7s8U1V2wYAZaDmHwF6k+0lgdvVKOo=; b=yuUhnBSOhu6Qap
	Z50vZyNR3GPBI3qYpOz7bpU77KozsW5WGhZrhUR0ANe7bLTA/Oq0GnUkO7CSdmDcBblck/cY/5Dg5
	lulgXGjXRU0+rQL6RsAqG6VWQIc/TnV/bhlS0GYRnbbV5Yw55iLrbl55WOPwLuJwvr07+5PFZs7Ap
	q6hQlfAsb2LFJlaqEIBFK7rJhIRgEA+bCt+molGxEIOsBUag7j0Cx9oBSZ0nN/So4HNYrWPfgcQbp
	MkMZuZ+ty+ZxGYg0jbfEwTyrjWBgiHiglttau9Vk0rSHdD/08AmH4MD/MNA6Zs5M45qqcgWvkK0m5
	pinwSmFqmxcUYDGV50+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvg7G-0022Um-Nf; Fri, 10 Dec 2021 13:39:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvg6X-00228D-4L; Fri, 10 Dec 2021 13:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=39pjG19fycLQSOhyYkT2ahpigIAdwLZtuHGKvzdL0yQ=; b=XLvBmrpD2y32zRr+BpVZJhP+Bl
 QrZchbJ0e57yZrfdV4crPsntS+USB8mUsg54Pr3FltKe/apF7YRsMsH3k5mXevyoXrUubPEz4JJXw
 THVjPK+RuoPBlId+fKN8VOCbRIL+/JaxcKuJmR6I68JhvWgD1UasjrJIN7FCyzCYspwNA00wPmuyg
 jA0/CaHg+QSw2ftMM6QLzqlwDC9mvUEY2s3rgceg3CmXFldxhgihvfQSGUhU7TUUFSEfnPxk5PSVA
 m6Zio0qrpqoECS7llgH9U8hWYBB1fN37naHVSJtv++4sYtNCD4Vz6zWkaztJa+jgEJfGMDA1zejaJ
 mHVomIMA==;
Received: from [179.97.37.151] (helo=quaco.ghostprotocols.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvg6V-000ZKz-1F; Fri, 10 Dec 2021 13:38:27 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id B2890405D8; Fri, 10 Dec 2021 10:38:24 -0300 (-03)
Date: Fri, 10 Dec 2021 10:38:24 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: kajoljain <kjain@linux.ibm.com>
Cc: German Gomez <german.gomez@arm.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org,
 John Garry <john.garry@huawei.com>, Will Deacon <will@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/4] perf tools: Prevent out-of-bounds access to
 registers
Message-ID: <YbNYUC1poqzrWynP@kernel.org>
References: <20211201123334.679131-1-german.gomez@arm.com>
 <20211201123334.679131-2-german.gomez@arm.com>
 <6705021e-5b02-3323-7dbc-4b774f22a435@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6705021e-5b02-3323-7dbc-4b774f22a435@linux.ibm.com>
X-Url: http://acmel.wordpress.com
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

Em Fri, Dec 10, 2021 at 02:47:49PM +0530, kajoljain escreveu:
> 
> 
> On 12/1/21 6:03 PM, German Gomez wrote:
> > The size of the cache of register values is arch-dependant
> > (PERF_REGS_MAX). This has the potential of causing an out-of-bounds
> > access in the function "perf_reg_value" if the local architecture
> > contains less registers than the one the perf.data file was recorded on.
> > 
> > Since the maximum number of registers is bound by the bitmask "u64
> > cache_mask", and the size of the cache when running under x86 systems is
> > 64 already, fix the size to 64 and add a range-check to the function
> > "perf_reg_value" to prevent out-of-bounds access.
> > 
> 
> Patch looks good to me.
> 
> Reviewed-by: Kajol Jain<kjain@linux.ibm.com>

Thanks, applied.

- Arnaldo

 
> Thanks,
> Kajol Jain
> 
> > Signed-off-by: German Gomez <german.gomez@arm.com>
> > ---
> >  tools/perf/util/event.h     | 5 ++++-
> >  tools/perf/util/perf_regs.c | 3 +++
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
> > index 95ffed663..c59331eea 100644
> > --- a/tools/perf/util/event.h
> > +++ b/tools/perf/util/event.h
> > @@ -44,13 +44,16 @@ struct perf_event_attr;
> >  /* perf sample has 16 bits size limit */
> >  #define PERF_SAMPLE_MAX_SIZE (1 << 16)
> >  
> > +/* number of register is bound by the number of bits in regs_dump::mask (64) */
> > +#define PERF_SAMPLE_REGS_CACHE_SIZE (8 * sizeof(u64))
> > +
> >  struct regs_dump {
> >  	u64 abi;
> >  	u64 mask;
> >  	u64 *regs;
> >  
> >  	/* Cached values/mask filled by first register access. */
> > -	u64 cache_regs[PERF_REGS_MAX];
> > +	u64 cache_regs[PERF_SAMPLE_REGS_CACHE_SIZE];
> >  	u64 cache_mask;
> >  };
> >  
> > diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
> > index 5ee47ae15..06a7461ba 100644
> > --- a/tools/perf/util/perf_regs.c
> > +++ b/tools/perf/util/perf_regs.c
> > @@ -25,6 +25,9 @@ int perf_reg_value(u64 *valp, struct regs_dump *regs, int id)
> >  	int i, idx = 0;
> >  	u64 mask = regs->mask;
> >  
> > +	if ((u64)id >= PERF_SAMPLE_REGS_CACHE_SIZE)
> > +		return -EINVAL;
> > +
> >  	if (regs->cache_mask & (1ULL << id))
> >  		goto out;
> >  
> > 

-- 

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
