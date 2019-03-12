Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E6AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 16:01:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EFA42147C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 16:01:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OA4E3Zo/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Wj6fY5Mz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EFA42147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDAKBY2cvq99MXkjhhUaK8V4qfqlfSnyASPGFKWUSLg=; b=OA4E3Zo/kBnGO3
	bfmjFyy9W9yq+K1NTAXnlq33q2TdGS6lzerDaqiavwMAitt0dk4Pvn7ndtYtidHlZrarmW9b2Y2KV
	NJsbC+HrWmLNeJAa34ZohTDVykQ7N8lx5b8TFxFV/Y9H5nuks9W90gJYehsr8my8bmWqbAssX2LHZ
	c4I9R5TRcOj9FK/PlOFb+ycDNqxTClR2juo232gXr3St+V1kT7bK5jNkBNUJJMQpzqLvRod0315jl
	lTlbof9JDl73U0dBA6mM9+2OPcRW7zDtjPNaobyPpiF3jPmOEd9bRsQSggWyVefGykCN8br1a8VqH
	v01msahuhkBvjRZvqbBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3jqe-0007J4-AA; Tue, 12 Mar 2019 16:01:48 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3jqa-0007I3-LA
 for linux-riscv@lists.infradead.org; Tue, 12 Mar 2019 16:01:46 +0000
Received: by mail-it1-x141.google.com with SMTP id k193so5337199ita.3
 for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2019 09:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=xi4pIXktda0K5UX0LH/n0vGi+5P5NdmOgncnyx2CBB8=;
 b=Wj6fY5MzJ+JtoPgGehtKimC7tqvLCjVEjdHL2Tep1KpnZ/JuZCDED74O6O+ZEzXBSv
 CVFVvMvtbg2/3t0SNfN3QgsdHdqu9gTpCkQZFMgOwTLWshut24g1Bo5G75Do8UAuH8Hm
 AmVembwykSAR9Qs2eKStK/RZoQnmOqjOyYr8Ue6UZLFpohbaUE7DYIb6J4HENs+v2gy4
 sF9jab5MPfhyeDVy6P4bx7c9qta5VsScLY8WKZJjDdKXMEs11aQUm0yVzvE2QkUq4pOz
 5IAOsClxuSjAN7AAEx1oOApywiOimD+yUbDs+OF3yJx3q9JlAEMhLH9bHdrmuCt53xpS
 FDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=xi4pIXktda0K5UX0LH/n0vGi+5P5NdmOgncnyx2CBB8=;
 b=Oo7qzkY7P4Qb/6M9hPUmZptG3qxUtQHGj0BZIvi6ytv6u2HAeLdVgpDQnk7q/2o7px
 Qrsls+0g3MvEzNrYiCgkLOYm4Yp9Fc/i2Qj6ion2Po4aC6EU/68cIojaNObFKNjVP2qP
 sAE4qXS/IIUEX4rs3HHAv4Q/JBpWAhNt/r7u2xIUSxEeAVI+7wHzIBCFt7jcOrrxPSPV
 2hZMGl8LqZSWYlGVHlV+WgObFlXGB4umtrTtwBmQ9Gh0B0dRRVW1/K/sKBpclpapaNHu
 GqJZJjgsJxp74LpIqUhaJ7UAFFG+F4+bncHg2/TZ6AkdzLIxpjVfy9gs5xh+/WIO2ARd
 3uyw==
X-Gm-Message-State: APjAAAXtb26EZrFfQlRvCbsYodCsqdNg2AIp5u41CoriDlEPt958m0ki
 t+Pd9LfUJmtZ6snt+7yjzXn6gg==
X-Google-Smtp-Source: APXvYqyNWX/785ZHJVdB6YI804VQJpme5SEGfJg0V2iDPUAQD6g0SJxbfwL0e2UhKGo6ms9BFVzfMg==
X-Received: by 2002:a24:5f85:: with SMTP id r127mr2718974itb.159.1552406503216; 
 Tue, 12 Mar 2019 09:01:43 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 z132sm437591itb.1.2019.03.12.09.01.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Mar 2019 09:01:42 -0700 (PDT)
Date: Tue, 12 Mar 2019 09:01:41 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Mark Rutland <mark.rutland@arm.com>, Christopher Lameter <cl@linux.com>
Subject: Re: per-cpu thoughts
In-Reply-To: <20190312112349.GA35803@lakrids.cambridge.arm.com>
Message-ID: <alpine.DEB.2.21.9999.1903120736210.26459@viisi.sifive.com>
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
 <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
 <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
 <20190311164837.GD24275@lakrids.cambridge.arm.com>
 <alpine.DEB.2.21.9999.1903111110520.11892@viisi.sifive.com>
 <20190312112349.GA35803@lakrids.cambridge.arm.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_090144_705788_EB19FFC3 
X-CRM114-Status: GOOD (  16.50  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Paul Walmsley <paul@pwsan.com>,
 =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, will.deacon@arm.com,
 Paul Walmsley <paul.walmsley@sifive.com>, catalin.marinas@arm.com,
 Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Mark,

On Tue, 12 Mar 2019, Mark Rutland wrote:

> On Mon, Mar 11, 2019 at 11:39:56AM -0700, Paul Walmsley wrote:
> 
> > My understanding is that many of Christoph's per-cpu performance concerns 
> > revolve around counters in the VM code, such as:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/vmstat.c#n355
> 
> The mod_*_state() functions are the only ones which mess with
> preemption, and that should only mandate a few locally-visible
> modifications of preempt_count.

Also __{inc,dec}_*_state() calls __this_cpu_{inc,dec}_return() which 
tweaks the preemption count.

> Similar cases apply within SLUB, and I'd hoped to improve that with my
> this-cpu-reg branch, but I didn't see a measureable improvement on
> workloads I tried.

That certainly suggests that all of this could be much to-do about 
nothing, or at least very little.  One observation is that some of the 
performance concerns that Christoph is expressing here may be about 
ensuring predictable and minimal latency bounds, rather than raw 
throughput.

> Have you seen a measureable performance problem here?

Not yet.  The two motivations at the moment are:

1. to determine how our initial per-arch implementation for percpu.h 
should look, and 

2. to get a high-level view of whether unlocked base + offset increment 
instructions are worthwhile, from people who know more than I do about 
them.

So far the counters look like a distinct use-case - one that might have 
relaxed requirements wrt preemption changes.

> > and probably elsewhere by now.  It may be worth creating a distinct API 
> > for those counters.  If only increment, decrement, and read operations are 
> > needed, there shouldn't be a need to disable or re-enable 
> > preemption in those code paths - assuming that one is either able to 
> > tolerate the occasional cache line bounce or retries in a long LL/SC 
> > sequence.  Any opinions on that?
> 
> I'm afraid I don't understand this code well enough to say whether that
> would be safe.

That makes two of us.  Have followed up with Christoph in a separate 
thread with lakml cc'ed.

> It's not clear to me whether there would be a measureable performance
> difference, as I'd expect fiddling with preempt_count to be relatively
> cheap. The AMOs themselves don't need to enforce ordering here, and only
> a few compiler barriers are necessary.

OK.  I have been assuming that the risk of a scheduler call in 
preempt_enable() is what Christoph is concerned about here:

https://lore.kernel.org/linux-riscv/b0653f7a6f1bc0c9329d37de690d3bed@mailhost.ics.forth.gr/T/#m6e609e26a9e5405c4a7e2dbd5ca8c969cada5c36

If is possible to eliminate the latency risk from a 'simple' counter 
increment/decrement by creating a restricted API, that may be worthwhile.

Christoph has also been concerned that the AMO operations will carry an 
unacceptable performance overhead.  But the RISC-V AMO operations can be 
written such that they don't have the ordering restrictions that the Intel 
LOCK-prefixed operations do, and thus those concerns may not apply -- at 
least not to the same extent.  Perhaps this is also true for the ARM LSE 
atomics.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
