Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10616C7EE2C
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 13:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c269BIPKX0Mj/SHyMOQP9WaWoM+Se3X5mJb0OtfRCME=; b=yAN9ZsEMMs7Tbi
	y9fVWNumtmEYpFtNvfCxZiuf8nA9xpSGjSRdAJTk/thZFuyiAoOzy75DFil3R0GZV3tmVoFhWDBG1
	3gCsHxWUFhJz2Em9quaypZ2eTiGoosPcu9j5knFCneNgt4/LXH3pGpPRx56Cu+OQG+sXp0qbD3l3l
	gtA5lDSRA1hmjH9OYQvrz1UQULxJEGJueh8SSpNqOFs707usQZ4W0/9yu0qbY1PTWeTgEAO9Whz+r
	aYF4kj/ACAf2pEt9LY3vEWAt1f9XlaFzrdjejHfwqf1X2vDRvDbK4Ubbfi+kTwhLCVZo/HoHwxuiH
	+BZrMPkV2JkTJIAC4D9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Ady-00Fgs3-0M;
	Mon, 05 Jun 2023 13:53:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Adw-00FgrV-2T;
	Mon, 05 Jun 2023 13:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QDp0F6JWnxKzASt9pRsADptQiCx37DHZIFeL7bOObmU=; b=uePVuzvL70MPVQPJYmPranDNug
	FjqpV0CO+QnFpz0MgmSxbkjE4X0pjdnvfm5MEdOsh8mcbTVp0VdlEzEp7063CbFN/i7ztaYabKk9y
	AvekDctwrfQYJoRCVkWLiF4A3rB5T+6m3NyYfxInD4G+IqGprI5vYvpKDT1M8+Ie3k8vn5hoBGo7R
	BDpqzsoKjV01g1bGNXWp5DK25u/nX+kZC6fodLLphCP2rQIViqMxRHv8VzFY+YK9Fqkxlyd+sXZNk
	922WeC6fLR9uxclIlaar24eS5+PPWn0fs0xyuGt5daFe5egbGyVcdJyCpvLhjtb5c6MCl4gMvOb38
	kyqWgIGA==;
Received: from [187.19.173.165] (helo=quaco.ghostprotocols.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q6Adv-00C4e4-5M; Mon, 05 Jun 2023 13:53:07 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 6821C40692; Mon,  5 Jun 2023 10:53:02 -0300 (-03)
Date: Mon, 5 Jun 2023 10:53:02 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 10/10] perf: tests: Adapt mmap-basic.c for riscv
Message-ID: <ZH3ovt4WnTJuTinF@kernel.org>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-11-alexghiti@rivosinc.com>
 <20230531-31bd9ddeaca8cb338f81ed14@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230531-31bd9ddeaca8cb338f81ed14@orel>
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

Em Wed, May 31, 2023 at 05:15:15PM +0200, Andrew Jones escreveu:
> On Fri, May 12, 2023 at 10:53:21AM +0200, Alexandre Ghiti wrote:
> > riscv now supports mmaping hardware counters to userspace so adapt the test
> > to run on this architecture.
> > 
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  tools/perf/tests/mmap-basic.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
> > index e68ca6229756..f5075ca774f8 100644
> > --- a/tools/perf/tests/mmap-basic.c
> > +++ b/tools/perf/tests/mmap-basic.c
> > @@ -284,7 +284,7 @@ static struct test_case tests__basic_mmap[] = {
> >  			 "permissions"),
> >  	TEST_CASE_REASON("User space counter reading of instructions",
> >  			 mmap_user_read_instr,
> > -#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
> > +#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
> >  			 "permissions"
> >  #else
> >  			 "unsupported"
> > @@ -292,7 +292,7 @@ static struct test_case tests__basic_mmap[] = {
> >  		),
> >  	TEST_CASE_REASON("User space counter reading of cycles",
> >  			 mmap_user_read_cycles,
> > -#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
> > +#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
> >  			 "permissions"
> >  #else
> >  			 "unsupported"
> > -- 
> > 2.37.2
> >
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Was the kernel part merged upstream?

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
