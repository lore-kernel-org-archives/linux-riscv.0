Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DFACCA470
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 19:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=34Wko3RliYq5HO7aC+dqz9cKAMhD5A0qsjdVMUtJTZM=; b=PywUSktoyF/5TT
	46XogiwHCuVbtUsT1IuCeHihNNVOq6ohkleqrLzfOoh9hazSTPSUK1o4WfXrQA/54P0HisMamUOLy
	RHpQGFjcXEkQL3ht2X+0GGKJRh3kxKWYTkA4QUHvsPnbCjqrdgKqvt2s5Fw2xcnTFbm69Ul7FFfWp
	2OTXjChJZZr4gUTA4rH7MSGMw+qP6n0gmxNDdfH4NfcnotGosTV7L9RJPzdorE4og+NWardb5jg1A
	HoQfttaXXYf0Wrnd2PjtZcaHUfVnBinpCtk7EIBvRCVOz4Tu5cxghTLUZhi+Tp/ADvq4ooFJOUICQ
	c6vZCqH1fIlpGXq97u7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5rDr-00000000h1A-31i5;
	Mon, 06 Oct 2025 19:50:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5rDq-00000000h14-42E9
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 19:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CE08601A3;
	Mon,  6 Oct 2025 19:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45027C4CEF5;
	Mon,  6 Oct 2025 19:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759780213;
	bh=1iSszkCi0lUsH8176NlUocZ21Z72m+lJn69XxPCJEoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWMID7o46St1R1+e0u5oT4umgvC68KNxBuravp+B8wpfonMdKXT9qBusGxzqwlPOk
	 exl+2XlaU3lO+3s/J87tm9rI/ekPmtjbl9mXvQ6niADFoK22h4ERHExmRJaZZhXPkE
	 swG1I4XLzsvJANxJbMv/GQIKR1M/IRkOKaTjcX3SGGZbCm5TJZHo/1qRG0JcLj7ShR
	 EBmo2MbKxcXj1EOZfMZJQwxdPLkGjzjxgfuwAZ5BLdV+azPs3aMABvzRHujRQxTVc6
	 FA5BqB4f/5jYRRppMA8Xvq300ALFyeOP4LpgxD0N3L1drNd/5ILSfFSSZDU779YW5o
	 +GbqkomIyBBaA==
Date: Mon, 6 Oct 2025 16:50:10 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Leo Yan <leo.yan@arm.com>
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
Message-ID: <aOQdcvW6jURCV8pF@x1>
References: <20251006-perf_build_android_ndk-v3-0-4305590795b2@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251006-perf_build_android_ndk-v3-0-4305590795b2@arm.com>
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

On Mon, Oct 06, 2025 at 05:21:22PM +0100, Leo Yan wrote:
> This series adds support for building perf with Clang, following the
> discussion in [1]. Because the Android NDK uses Clang by default,
> enabling Clang builds naturally covers Android as well.
> 
> The series is organized as follows:
> 
>   - Patches 1~2: Fix two bugs found with Clang.
>   - Patches 3~7: Correct CROSS_ARCH, Disable thread safety analysis for
>                  perl header, and dismiss Clang build warnings.
>   - Patches 8~9: Enable Clang in the Makefile and update the
>                  documentation.
> 
> Testing:
> 
> Tested with linux-tools-container-builds [2], which based on Arnaldo's
> build test container but with several fixes for cross building with
> Clang:
> 
>   - All clang native builds on x86_64 have passed.
>   - The cross builds for arm64/mips/mips64/mipsel/riscv64 have passed.
> 
> Only a pity thing is I cannot build successfully with clang for
> ubuntu:20.04-x-powerpc64el (in below log, it only builds with GCC).
> The cross config does not work well on Ubuntu 20.04 due to failure
> "No gnu/libc-version.h found, please install glibc-dev[el]". I confirmed
> that powerpc64el cross build can make success on Ubuntu 24.04, the
> failure on Ubuntu 20.04 should not be caused by perf build.

Thaanks, applied, testing it.

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
