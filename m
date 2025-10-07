Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F802CCA476
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 18:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V17NV4F6WW+datRWQBNDDTzPh4LhexNfg0JMG1pn69A=; b=B8kQxa1CDUTi7D
	ejLcaW3VhHe8Qy/ev4yQoW2JVPfuKlLtped1HZTin19doyArpQW5rgAfgJX+ml3gmxwA+hPWu7y6K
	e3uFO2sEp9ts3mChEyhyV5wO1xcidht6f89ChEbOwh1S/L7SDDWUeUGAmcj+BIeZf54zJekico6Xq
	oxMnfO4d8X92In+glD05cHpYTBxPX6/XthwWnxAV5H39rOeBvn6wNzRz2uGlIWAnfznAABHvXn0N/
	GsvIbePp6ANB4H2+aqOp59TVCGVCGwTAkudfGgcr4Kzs3IOQgqa2DEbL7XXCMJMbOd1GZrOSuf0zE
	118BlDfut1Zh1FIhs1CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6C5D-00000002X1Y-2poN;
	Tue, 07 Oct 2025 18:06:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6C5A-00000002X0y-3YCX
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 18:06:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED742106F;
	Tue,  7 Oct 2025 11:06:29 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A8823F738;
	Tue,  7 Oct 2025 11:06:37 -0700 (PDT)
Date: Tue, 7 Oct 2025 19:06:35 +0100
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/9] perf build: Support building with Clang
Message-ID: <20251007180635.GB77665@e132581.arm.com>
References: <20251006-perf_build_android_ndk-v3-0-4305590795b2@arm.com>
 <aOQPeqqFn0yxgC4h@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aOQPeqqFn0yxgC4h@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_110640_923271_0525847C 
X-CRM114-Status: UNSURE (   8.47  )
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

On Mon, Oct 06, 2025 at 03:50:34PM -0300, Arnaldo Carvalho de Melo wrote:

[...]

> I shed a tear ;-)
> 
> And thanks for fixing the ubuntu cross builds, I'll apply those patches
> you made available thru github,
> 
> Thanks a lot!

You are very welcome! And very appreciate you shared build container
scripts, this would be a big benefit for CI test! (I have enabled the
test on my local machine and works pretty well).

Thanks,
Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
