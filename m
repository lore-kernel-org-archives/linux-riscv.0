Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FBCC63697
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 19:32:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BA69221FE
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 19:32:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jjmngZwL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCHl1LKv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BA69221FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alum.mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CeT+xMqyc6jLKJzMPU9Z4XYohzB3IKvwnZwxP6Ihkn4=; b=jjmngZwLnW3zshxns8ommCfgV
	TjYd2+kCm4hdy2d/7lwFJXstEB2WuOnTeSnwneCrr66moVzY8BQRYEe1RuzWFjDf+GwbsjDIpPZFp
	p/HCp1odtVzVYqj/wFFyDdf1HyVwWpCW6nqnX+vBcryyT7t6keJBRRxKlGjHg3EPjz9wvZkzpK2Mm
	QXawRMFvKZuIti9CrEkYTjMyZP8kUKhbWukYHYYrvNyMcotr4Qh9IgPKY3bTvH9QP6ivQ/X1Akqum
	Q41vCWZHClohieL+0B4EQoxFyZAfv8qZColhL8BD4eK/fxtXmpCBey/aQ7KKekmTtCIfKQpdFwUQu
	pFl9hDGZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf6i3-0000aG-Qs; Tue, 17 Nov 2020 19:32:11 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf6i0-0000ZP-Ex
 for linux-riscv@lists.infradead.org; Tue, 17 Nov 2020 19:32:09 +0000
Received: by mail-qv1-xf42.google.com with SMTP id 63so11326480qva.7
 for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2020 11:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=C1IZO3TidBvZYKM3gtAuU0FLpKg60Lkm/guLU1OMCbw=;
 b=QCHl1LKvfGy4FkAwk+R/lEUdBtWSxkaux81SECaGzBdYki5KH+SA+rb85yGzSpmUBA
 0HRjDNhu16Z2qmwSKghP58Zh47L4YUUy4unwvXWG9exPqDckLJDFBcKg5d3ggyLaxp6a
 od2Rc83bOm/bjVsTo4g6FHdh1j9PMiCmL9oWc+bP8KugXfsXeP1U/BSy/SrUbcIkEJA1
 yV4qrJGC9yVzPCGvaeCmbrEzlXuYla0AcwASkWxXeo4SEBGaZpRmz2lyK+jxJdszBkgn
 pHt9EsQg1LUPAO46EHV1FHzvQBh6sfynK7kESm43yYW+usR73dfYjfkOPIx1NzVrBun5
 7d4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=C1IZO3TidBvZYKM3gtAuU0FLpKg60Lkm/guLU1OMCbw=;
 b=HClNESQ0kGcNMeJPb1GP06VY54JaPZUX8v26HastmKNOyXXWb3AwmiGNFkZ2+E5uLd
 tElz/nxSZABIp9mTbtJJDnLuByrGdnYAfY65Rbi68mqwIxrE4Yd8FnyQlM3elF/GGdDV
 og+12c5g7eXJ+K+eHmFXChTDuf9DrfCgA50qE+GdyIewfX21bU4tUcvfX0mszPRLbSxu
 0Cy1wWPJcIXv4zChFDHQncRDcDOXK1/bjBqHDVzyzocrgYdY1ODff5xWtb5aIstSEWLY
 QVYYhvbRWf8H/yiJ6Oc/7my+MVPz5fgwiQHtfBjrgpAi6PsxOtcUfnK4u5IKNAHkKpp6
 GroA==
X-Gm-Message-State: AOAM531l2VP9AMWWren2Gz4ORO9UFS5HJsESw3lDl7YKxwC+jRowWkDj
 yPHnK8PwAyWfFUO6oIUr/WE=
X-Google-Smtp-Source: ABdhPJx9tYxhlmXMpJyarY0CXNXEJ0RSKALOdBnT1znfnNz6t8O1TPQ2VPiUMIPctVdX5+kC7vPnew==
X-Received: by 2002:ad4:5b82:: with SMTP id 2mr925675qvp.28.1605641524963;
 Tue, 17 Nov 2020 11:32:04 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
 by smtp.gmail.com with ESMTPSA id i4sm3331627qti.78.2020.11.17.11.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 11:32:03 -0800 (PST)
From: Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date: Tue, 17 Nov 2020 14:32:02 -0500
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] RISC-V: fix barrier() use in <vdso/processor.h>
Message-ID: <20201117193202.GA1574448@rani.riverdale.lan>
References: <20201117013951.7827-1-rdunlap@infradead.org>
 <CAKwvOdmESwnF14TLjRfzJg8Dau8XW0LgoDvXtdPjPOqdf211SQ@mail.gmail.com>
 <9ab43756-6c48-c5e8-3a5d-e44bba070a97@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ab43756-6c48-c5e8-3a5d-e44bba070a97@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_143208_517442_BA659E5F 
X-CRM114-Status: GOOD (  22.16  )
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 11:22:39AM -0800, Randy Dunlap wrote:
> On 11/17/20 11:00 AM, Nick Desaulniers wrote:
> > On Mon, Nov 16, 2020 at 5:40 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >>
> >> riscv's <vdso/processor.h> uses barrier() so it should
> >> #include <asm/barrier.h> to prevent build errors.
> >>
> >> Fixes this build error:
> >>   CC [M]  drivers/net/ethernet/emulex/benet/be_main.o
> >> In file included from ./include/vdso/processor.h:10,
> >>                  from ./arch/riscv/include/asm/processor.h:11,
> >>                  from ./include/linux/prefetch.h:15,
> >>                  from drivers/net/ethernet/emulex/benet/be_main.c:14:
> >> ./arch/riscv/include/asm/vdso/processor.h: In function 'cpu_relax':
> >> ./arch/riscv/include/asm/vdso/processor.h:14:2: error: implicit declaration of function 'barrier' [-Werror=implicit-function-declaration]
> >>    14 |  barrier();
> >>
> >> This happens with a total of 5 networking drivers -- they all use
> >> <linux/prefetch.h>.
> >>
> >> rv64 allmodconfig now builds cleanly after this patch.
> >>
> >> Fixes fallout from:
> >> 815f0ddb346c ("include/linux/compiler*.h: make compiler-*.h mutually exclusive")
> >>
> >> Fixes: ad5d1122b82f ("riscv: use vDSO common flow to reduce the latency of the time-related functions")
> > 
> > Hi Randy,
> > Thanks for the patch, it looks good to me.  I only had a question on
> > the commit message.
> > 
> > Is this also related to:
> > commit 3347acc6fcd4 ("compiler.h: fix barrier_data() on clang")
> 
> Hi Nick,
> Yes, it looks like I tagged the wrong commit in Fixes:
> Thanks for noticing that.
> 

Thanks for the patch!

Acked-by: Arvind Sankar <nivedita@alum.mit.edu>

Generally speaking, should compiler_types.h be considered "internal"?
i.e. everyone should include compiler.h, not compiler_types.h directly?

Eg for another potential case that might bite is that RELOC_HIDE is
defined in compiler_types.h, except for clang, which will only have a
definition if compiler.h is included.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
