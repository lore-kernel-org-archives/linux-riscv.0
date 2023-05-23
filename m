Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2B7C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 06:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2G15FzKhDY5B1BooGacDzzg7wH8OUXDITuDC+YBmNI=; b=Kbrp90vj3ftH2K
	uib7PLl5x8IZoJ7VdoBhRtoXEqyP9awm19RbDzL2QgC+QvI26CXATdGUVvM5rJe9VjdlxpVLT1gBm
	Ql7/6ewbuo6aJjGp/LYwbfoWeNMPjmQm3te5KBWl4JFREwZU8TFB8AwPHMGnETlYsqxTMJrvw3VQA
	m4QObtJviTWL3grcWm9TGaWvrv4meAatuaV9NyVEg6vFw3/hHfuYnxZbRkMCIHX+L7pAKcGNv/nLC
	4KJbAoj0CyvvL4kL5NLtxmI4PXhqlUmJTXXI/3QY3S7OjZGe3RtAXeqNUUf+BtY2lqBF/dhHvZQoz
	5YM/AMBHMwrNEVGDyOtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Lph-0097Wq-3B;
	Tue, 23 May 2023 06:49:21 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Lpf-0097V5-2G
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 06:49:21 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2532d6c7ef2so3217776a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 May 2023 23:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684824557; x=1687416557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CIN3k3pgEX900re7PcWc+Ixgh9Bvf8RnAPTzy/Q9qA=;
        b=cvzXNBZcONpo9ubWJ3RJzuhpxW2KbOHQ7DyYNvAc6zjsDwkoebi1Cb5OK1Si5f9EkR
         7oTDI3fOalzwEfxtNnjihGdUMwDKSXZkE1HxrdBA6wmIpDrDdXEuHHx+k5U8WxTjUW6a
         mu753zyCxef2tvJdD9aw9+fAS79oQq8BvweBwSgvtEh+sI7C8jHfILbMxxemelnlc3hv
         TQ76LfGIYbtcp4Xin0+PZPpMPCazlIiSEf0zHBPlJ/lt04cX+mrF/dfXBXOD6CJSsLoI
         4UXwZa6kWsBRXaq6cv37NKE/oQi4+8PAY+qFC8UB3Ei+yLADc6sD5PlY57Ui2VfaCgdA
         FoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684824557; x=1687416557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CIN3k3pgEX900re7PcWc+Ixgh9Bvf8RnAPTzy/Q9qA=;
        b=T9pKXaiUGfxaSSGh9NNBE+chDFIZ1I/fv4zWw13d7q33IC+/6tmJryM7or1i3FMzE6
         IgsfP8rzjAPGds2yo2uvJ0nD9Mgp50qmBXb18plSEETtUgulqA45HXRJr03k2G/wcJj0
         ZNsJVnJGcCmMdpHQVJ9fySYl/9RUbFoYUanj+KIb/CqpQuFJdA/RJOCou1sii+PS/NXi
         tQf1mTZNi5fgVdJKylmJICBaYhBFKXSU5e9OnAf312WMRPhQRD4qyS9mbwVzuZVgip30
         E6GVNXJkw3f14sjSJoNYezA50scpQvL0til0lj6H2paL+RSnjVdYvlf+ZT/YWyzYZ/vs
         g5mg==
X-Gm-Message-State: AC+VfDzC3KLdf69RRiGeg+G0XDvtjwzFIDX2a+noqugK5sjReSt2kweL
	IWrJk2pYb6UJCdOrVrlQWm2rOg==
X-Google-Smtp-Source: ACHHUZ7nNz4A5dl27YEbGjluXzF+Iu6AoPCKpNsPdYErA3ftUxN2fDxtCgclj2E7xLaUJ53OH6sH7g==
X-Received: by 2002:a17:90a:984:b0:253:9548:91e1 with SMTP id 4-20020a17090a098400b00253954891e1mr12132128pjo.17.1684824556586;
        Mon, 22 May 2023 23:49:16 -0700 (PDT)
Received: from leoy-yangtze.lan ([107.151.177.126])
        by smtp.gmail.com with ESMTPSA id w62-20020a17090a6bc400b00246774a9addsm7391986pjj.48.2023.05.22.23.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 23:49:16 -0700 (PDT)
Date: Tue, 23 May 2023 14:49:04 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Ian Rogers <irogers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Eric Lin <eric.lin@sifive.com>,
	Kan Liang <kan.liang@linux.intel.com>, Qi Liu <liuqi115@huawei.com>,
	Sandipan Das <sandipan.das@amd.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 2/5] perf parse-regs: Introduce functions
 arch__reg_{ip|sp}()
Message-ID: <20230523064904.GA1969788@leoy-yangtze.lan>
References: <20230520025537.1811986-1-leo.yan@linaro.org>
 <20230520025537.1811986-3-leo.yan@linaro.org>
 <CAP-5=fU-+8Sdw0tfQNYN40tXanrzUgqv0=6jsHqGR9cgjkQa2A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fU-+8Sdw0tfQNYN40tXanrzUgqv0=6jsHqGR9cgjkQa2A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_234919_763003_C768785B 
X-CRM114-Status: GOOD (  20.75  )
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

On Mon, May 22, 2023 at 11:08:12AM -0700, Ian Rogers wrote:

[...]

> > diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
> > index 8720ec6cf147..334c9a2b785d 100644
> > --- a/tools/perf/util/perf_regs.c
> > +++ b/tools/perf/util/perf_regs.c
> > @@ -20,6 +20,16 @@ uint64_t __weak arch__user_reg_mask(void)
> >         return PERF_REGS_MASK;
> >  }
> >
> > +uint64_t __weak arch__reg_ip(void)
> > +{
> > +       return 0;
> > +}
> > +
> > +uint64_t __weak arch__reg_sp(void)
> > +{
> > +       return 0;
> > +}
> > +
> 
> Is there a need for the weak function if there is a definition for
> every architecture?

In current code, some archs don't support register parsing (e.g.
arch/alpha, arch/parisc, arch/riscv64, etc), this is why I added weak
functions to avoid building breakage for these archs.

> A problem with weak definitions is that they are
> not part of the C standard, so strange things can happen such as
> inlining - although I think this code is safe.

Good to know this info, thanks for sharing.

> Not having the weak
> functions means that if someone tries to bring up a new architecture
> they will get linker failures until they add the definitions. Failing
> to link seems better than silently succeeding but then having to track
> down runtime failures because these functions are returning 0.

I agreed that removing weak functions is better way to move forward.

If removing the weak functions, we need to handle cases for below
archs which don't support register parsing:

  arch/alpha/
  arch/arc/
  arch/parisc/
  arch/riscv64/
  arch/sh/
  arch/sparc/
  arch/xtensa/

As James pointed out perf fails to support cross unwinding, I will update
this patch, the new version's arch__reg_ip() / arch__reg_sp() will return
IP and SP registers based on the passed 'arch' parameter; for above
unsupported archs, arch__reg_ip() / arch__reg_sp() will return error and
architecture developers can extend register parsing in the future.

In this way, we also can remove weak definitions, this can give us an
extra benefit :)

Thanks,
Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
