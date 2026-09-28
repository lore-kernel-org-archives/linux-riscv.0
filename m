Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC94CA5FA2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 16:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=louRcTJiwzyhly6J00KqCVdcWgGYamcKG5cxkyv6N5c=; b=hErkuy56CKQa1w
	ZDFTM6KG98FJoJz4Cvc+sm9jG8ygv2eIvSL/pIfqWdHsa4SfOs1hxqXq9WRkRX8I10cKsyRQ2hS3F
	4Eepr4fOC+kT4INtV8bOOu+J65h/BFGT243/90obNHHqiSM24BZuJ/Ag0e/bTkfAzoQ0nKDDsyzXV
	aqbD1aZe5KhAoJ7rqNw/u8rwnpX4Jz+9g+m/i6m85hFD9VnbL46Q2dnAfzsy27ajRYsHO6WtKJsiF
	sUV+uyKVeNkewi3cqgMvWikI8JyQpPpZyeR6XKLC1X+ts+iEAOD4PJjVDvOTT8Lavv4Qyn6WHC0jL
	Vd2pgBaojO/FKFnMtr+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEJV-000000012jz-1nzK;
	Mon, 28 Sep 2026 16:34:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEJS-000000012ir-2vtG;
	Mon, 28 Sep 2026 16:34:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BAD11655;
	Mon, 28 Sep 2026 09:34:41 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B01ED3F86F;
	Mon, 28 Sep 2026 09:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790613285; bh=obZsD+FWW3oqDzsoLNMqpqUaAsf4d521DemQEYwhIjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PI/8/8J8yrQrFMZmzJQgn4uZ6EucWfJXdonIN5VW9GDb+Fl2Ed+/YbTA2ld8DpBf6
	 xLBfyPEJBbn/pxoChCazWY6CLeHsF/yzNHXbn5zE7xL1YPzyxKpyvvkRvpJYQ9M3WJ
	 BaknA+7RpTNlK65eSpRK9TeSihlbN9KXV2idnFZk=
Date: Mon, 28 Sep 2026 17:34:42 +0100
From: Leo Yan <leo.yan@arm.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: acme@kernel.org, peterz@infradead.org, mingo@redhat.com,
	namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org,
	leo.yan@linux.dev, john.g.garry@oracle.com, will@kernel.org,
	mike.leach@arm.com, pjw@kernel.org, palmer@dabbelt.com,
	guoren@kernel.org, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] perf tsc: Replace the compile-time TSC support check
 with a weak hook
Message-ID: <20260928163442.GG14479@e132581.arm.com>
References: <20260928094739.2605-1-cp0613@linux.alibaba.com>
 <20260928094739.2605-3-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928094739.2605-3-cp0613@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_093446_788095_B6F0D524 
X-CRM114-Status: UNSURE (   9.93  )
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

On Mon, Sep 28, 2026 at 05:47:39PM +0800, Chen Pei wrote:

[...]

> Add a weak arch__rdtsc_supported() next to the weak rdtsc(), let the
> test query it instead of the macros, and have x86, arm64 and riscv
> override it in the file where they implement rdtsc().

The patch itself is fine for me.

Just a bit on refactoring. You could refer to the implementation of
PERF_HAVE_JITDUMP in arch Makefile and "CFLAGS += -DHAVE_JITDUMP" and
do similiar thing for rdtsc.

Seems to me, we can just use build system for configurations.

Thanks,
Leo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
