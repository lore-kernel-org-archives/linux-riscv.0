Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514F2CCA470
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 20:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJ9OFvBPc0G+7JZZEcxPRSTUWgEtoc/niZ6xzZ4m9T4=; b=L/MPbyO1vAsPOZ
	ScLIcAINAmCXzy97QE5AJB3fP7OfhlDtiqKmadJYclO6YAH1f+ZAa8+v74PVQX/DAn3GJDaM4+7of
	r5IIXAIxIH/bAQFs/z4nQcl8YI9rFpBuxtCvVtNHcqbjG37AK73EAPA3JZIEZxZTxovhHtMVAu+Tt
	rHye9YU7vjmN1uTMu6Z5s/1EW9tHSkjyZ7UrJBoq4uNd8lXJSs0Umh66mjQ2J2JszrBNfCYvxA6gq
	ctzQpq75MtC2JMW1ZCdVp5oNQTP8PqLHkG/d63K82laEt1JdtTk1770ppLm/AFxQiE81nMSwl+twh
	RYtZNWwowi+pmvuRbVwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43Jo-00000008u6p-2M7q;
	Wed, 01 Oct 2025 20:20:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43Jm-00000008u67-0j8d
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 20:20:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 902B516F8;
	Wed,  1 Oct 2025 13:20:44 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37A5D3F5A1;
	Wed,  1 Oct 2025 13:20:52 -0700 (PDT)
Date: Wed, 1 Oct 2025 21:20:50 +0100
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
Subject: Re: [PATCH v2 0/8] perf build: Support building with Clang
Message-ID: <20251001202050.GT7985@e132581.arm.com>
References: <20250930-perf_build_android_ndk-v2-0-2ea440b7ef01@arm.com>
 <aN044EY-Ds9-E6iz@x1>
 <20251001152217.GQ7985@e132581.arm.com>
 <aN1yNKxXLnMtQczW@x1>
 <20251001183256.GS7985@e132581.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251001183256.GS7985@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_132054_248012_559E077A 
X-CRM114-Status: UNSURE (   7.50  )
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

On Wed, Oct 01, 2025 at 07:32:56PM +0100, Leo Yan wrote:

[...]

> > + make 'ARCH=' 'CROSS_COMPILE=' 'EXTRA_CFLAGS=' -C tools/perf 'O=/tmp/build/perf' 'CC=clang'
> > make: Entering directory '/git/perf-6.17.0-rc6/tools/perf'
> >   BUILD:   Doing 'make -j28' parallel build
> > Makefile.config:494: *** No gnu/libc-version.h found, please install glibc-dev[el].  Stop.

It does not set correctly --target as x86_64-alpine-linux-musl if
distros are using musl libc.

Now running the container build for updated code.  Once pass test,
I will send new series.

Thanks,
Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
