Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAC5C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 01:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twPQ+x2qaSLlhQgYXeidM7LWkkFqnDanROyY67f1a08=; b=ICQH6a6mGaVrdh
	p7isdLIDhvpEVtWdbny3UvByDA1MNm54XxUD9EfeOBhQ8dh6UQPPoRR/p/CxgaIEPr6pKNod/yDdk
	kXMr2FK7qCcwObRubrGDJ61PtyQcaK3hh/nFIVi4Dgt8HAV2mm2dMBi5Ggmk94aGHeLEYgB3hvDH5
	bT10cGzph5BzWl8FD0sCxc8lMYIvxI6hY4DzEMMHcjLsYiW+RGXPveEMnRb5ianC8xUItjGoiczm3
	o8OUeeSB1dCTf9sFYpo2nheuGvZjtd7/Uq1cH0dURi0mAPYQIa8qlGaZsgqFz5mo5+VCPIEmIH+F5
	8OWX/ZU6jfNMPp+7XTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6INS-00000004zZN-3gCq;
	Tue, 15 Sep 2026 01:54:30 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6INQ-00000004zYr-0iBW
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 01:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789437266; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=6WuoFIRFdclRpjmrkgo4Jm1GL0OXC8785WmB5hHzxyM=;
	b=IG/rUgra2bE/slqq+szS8NYmPdPzD+XJ7gusIyttGDeC1wy5LY4a3pdssOCaCRx1vQoJojifbzr2UwsfZYOw5ICAss2XspoiOOO/dZw5+H3lUuLaTfsn+GfxQ108gYYk2X01BRGNcuU3iGSEIa0JwhQCli8SRCG58Yell7tHs6M=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R781e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XB.Sw0u_1789437260;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XB.Sw0u_1789437260 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 15 Sep 2026 09:54:24 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	guoren@kernel.org
Cc: linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf riscv: Add perf_regs_load and enable the dwarf unwind test
Date: Tue, 15 Sep 2026 09:54:17 +0800
Message-ID: <20260915015420.818-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914125814.C92251F000FF@smtp.kernel.org>
References: <20260914124145.1257-1-cp0613@linux.alibaba.com> <20260914125814.C92251F000FF@smtp.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_185428_392022_67700984 
X-CRM114-Status: UNSURE (   7.28  )
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

Both items checked. Neither needs a v2 of this patch.

> Does this file need to explicitly include <stdlib.h>? Since musl libc
> enforces strict POSIX header inclusions, missing the declaration for
> malloc could lead to a build failure regression on musl libc systems.

It is not missing. "perf_regs.h" three lines above resolves to
arch/riscv/include/perf_regs.h, which has #include <stdlib.h> and is
also where PERF_REGS_MAX comes from, so this file cannot be built
without it. arm64 relies on the same transitive include. Checked with
riscv64 gcc 15.3, where an implicit declaration is a hard error:
including only that header is enough to call malloc() and calloc().

> Can perf_sample__user_regs() return NULL here?

It can, but that is not introduced here and cannot be fixed from this
file. arch/x86, arch/arm, arch/arm64 and arch/powerpc all dereference
it the same way, and tests/dwarf-unwind.c:118 does
zfree(&sample.user_regs->regs) unconditionally, so an early return here
would still crash in the caller. A fix has to cover the whole "Test
dwarf unwind" path, or the contract of perf_sample__user_regs() itself.
Either is a separate series, which I can send if wanted.

Best regards,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
