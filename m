Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19795C4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 01:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndS9NZkBLgowaV/vvlewpcisTgHN5as2Z2zfKD5nRw8=; b=MJhiyvUXbtyKA1
	UBAPYNAL2Kr5fPb/Pw28jrIYJCqyrWslOVHvQnU62Gc2o1JBtWbJ4gjFYqg9GIo/Q1BqsegpwDvMC
	qRSzMzAGwgdz0h+lBChdHV1+8WxfypDPNqiY40Vv1FPXXDp8MtdCYM6sbhkfNGzznuBv+bHW0b6o1
	MqrUi3c0V/lV34Qr4fnlr5Bx90zkLs0WWYhbWa3vKUf3OaXZ8Gokn4ZJL9u6WTacXUqi8kEo4Eb0i
	68VlbPp1lJLsLw+tG/imifGQwoXj09nTSur9F1wCG5neeqq9c/5aQBcn5D66t9+JAB72Tzzmlcksg
	gbdTGMOd8OPOnNAjKn2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Wz0-0000000EacY-1cy2;
	Sat, 27 Apr 2024 01:36:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Wyy-0000000Eabt-04Og
	for linux-riscv@lists.infradead.org;
	Sat, 27 Apr 2024 01:36:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 797266215B;
	Sat, 27 Apr 2024 01:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C975BC113CD;
	Sat, 27 Apr 2024 01:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714181762;
	bh=FgfvRvIIdKg5M8VTG3GygY/t5MgGGpquPipWcwa1BbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=crPCgKfTrZI69WjN8uB5eiXzpb46kN+36v9HtC11O3fsfXHLHCxx4LumYSIVXGZpT
	 GFChac4esj36x6sTMDjqAysyEJsaPuTEWkvtMccXpAwwU2Yh4ruGaPZGnI6HxnewQ/
	 4dG4NxFuN2z88eMrNpP8EYtaBiUiWizerlJcCqv18uLVpMpU/8g16sknhT9VI/24Ak
	 Bn7vtTKjfPi8C9KApCmf86JnFIDRAamOCKfy9dkblIZz+ZUA0//6+pxHIh2L3fBbVm
	 em9eaZqR8Re8l806rzxaBfTFvzK9UVPHTY9YCJgEp2XqpNaxm6v6aom0dn0Dh31pAu
	 vg7ungBkC2sTg==
Date: Fri, 26 Apr 2024 22:35:59 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org,
	Beeman Strong <beeman@rivosinc.com>
Subject: Re: [PATCH v2 11/16] perf parse-events: Improve error message for
 bad numbers
Message-ID: <ZixWfypP4FtKgv0F@x1>
References: <20240416061533.921723-1-irogers@google.com>
 <20240416061533.921723-12-irogers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240416061533.921723-12-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_183604_136199_5989DFD3 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

On Mon, Apr 15, 2024 at 11:15:27PM -0700, Ian Rogers wrote:
> Use the error handler from the parse_state to give a more informative
> error message.
> 
> Before:
> ```
> $ perf stat -e 'cycles/period=99999999999999999999/' true
> event syntax error: 'cycles/period=99999999999999999999/'
>                                   \___ parser error
> Run 'perf list' for a list of valid events
> 
>  Usage: perf stat [<options>] [<command>]
> 
>     -e, --event <event>   event selector. use 'perf list' to list available events
> ```
> 
> After:
> ```
> $ perf stat -e 'cycles/period=99999999999999999999/' true
> event syntax error: 'cycles/period=99999999999999999999/'
>                                   \___ parser error
> 

This ended up in perf-tools-next, will have to look at what this problem
is:

   9    11.46 amazonlinux:2                 : FAIL gcc version 7.3.1 20180712 (Red Hat 7.3.1-17) (GCC) 
     yy_size_t parse_events_get_leng (yyscan_t yyscanner );
               ^~~~~~~~~~~~~~~~~~~~~
    util/parse-events.l:22:5: note: previous declaration of 'parse_events_get_leng' was here
     int parse_events_get_leng(yyscan_t yyscanner);
         ^~~~~~~~~~~~~~~~~~~~~
     yy_size_t parse_events_get_leng  (yyscan_t yyscanner)
               ^~~~~~~~~~~~~~~~~~~~~
    util/parse-events.l:22:5: note: previous declaration of 'parse_events_get_leng' was here
     int parse_events_get_leng(yyscan_t yyscanner);
         ^~~~~~~~~~~~~~~~~~~~~
    make[3]: *** [util] Error 2


Unsure if this will appear on the radar on other distros, maybe this is
just something that pops up with older distros...

Ran out of time today...

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
