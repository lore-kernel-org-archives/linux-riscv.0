Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC24C0755A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 16:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRF/lCI07WVUdlWNbBPy5COX4gVJ3+6a7k6rBF5dF50=; b=YEzcafBcML7Wf3
	MVuWw/pDZtXp5zemJP3YckRME+eS8w2qbFm1mjJH9qwz9SsK5QVF+eXEuj5KTZySL30Wl3dMICB7J
	iHM9h5bedF9wbDFufuBPyhxaHmv0m6swwWBZhy2xTIR7ySm2yrSM+rmW6LTUC8Fn4IWuV0R/JqGVc
	KPASiNm/05IQdW6czkZxSjtjMBDPss7Y3gJb0Ak6YnF4m90BFf5YP0kVJ68oDSKsLI9RD1eNCQCnF
	ejlSLgKkIrwymhiSmGbaqvAz+5sTBuozGFE1IvLTTXsh6+k5doYV1D0LVbFgXTZkikjtUfKkJvXqG
	m8pNu9sONsW0T2CHG42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eB0-002uvx-36;
	Mon, 27 Nov 2023 16:09:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eAy-002uv4-15
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 16:09:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 310CC612ED;
	Mon, 27 Nov 2023 16:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07CBC433C8;
	Mon, 27 Nov 2023 16:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701101374;
	bh=u6iWdo/8a2a6pHkq5FkOccFiPiQNgIqfuW+dZLSH+jU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCr5YsqSSE1eyQWuoDx7kB+6p0HXj51KWg3lgJj2xjaEa31UJr7oPSVFdfEGtUPFN
	 LTh3RJQtSQdFIjByszyBFNUsCWycw8qIENRxJZ3BLpWWQocz3iMx1o/LjKJsa7Ygjm
	 MgW38x9qRQqZepTeKXjYV66/LbzBTzUmW3jpdROIQ626dpnLNGaHXXu+JGdTz098WF
	 Pcl95/5JfKYfHrF48s2CUXdxJpa+uqiyHBN8apQbWW2brUWNdEkmtL6sA921iCFfvb
	 +a6hFgjOMy1b28yBX+7ccOLEh0ZN0K+GF+Y/wCzJHUp6m4K8/vuDaJFa9aUkw6XAIF
	 5o/qdFqBREZ4w==
Date: Mon, 27 Nov 2023 23:57:09 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Use asm-generic for {read,write}{bwlq} and their
 relaxed variant
Message-ID: <ZWS8VYwpsKoc56fV@xhacker>
References: <20231123142003.1759-1-jszhang@kernel.org>
 <20231127-swell-garnish-3f2104647aa0@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127-swell-garnish-3f2104647aa0@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_080936_434769_1C2B08F9 
X-CRM114-Status: GOOD (  12.40  )
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

On Mon, Nov 27, 2023 at 10:39:16AM +0000, Conor Dooley wrote:
> On Thu, Nov 23, 2023 at 10:20:03PM +0800, Jisheng Zhang wrote:
> > The asm-generic implementation is functionally identical to the riscv
> > version.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> This fails to build for nommu:
>   /tmp/tmp.ojumpiEgOt/arch/riscv/include/asm/timex.h:20:16: error: implicit declaration of function 'readq_relaxed' [-Werror=implicit-function-declaration]
>   /tmp/tmp.ojumpiEgOt/include/asm-generic/io.h:342:23: error: conflicting types for 'readq_relaxed'; have 'u64(const volatile void *)' {aka 'long long unsigned int(const volatile void *)'}
> 
>   Cheers,
>   Conor.

Hi,

Thanks for the report. I can reproduce the build error locally.
The problem is readl_relaxed usage in timex.h.

If include <asm/io.h> in timex.h, then we will meet issues which is
fixed by commit 0c3ac289.

If not include <asm/io.h>, then the readl_relaxed readq_relaxed
are not explictly declared as reported here.

I have two solutions:

solA: use __raw_readl and __raw_readq in timex, since I found other
architectures use the raw asm instructions for get_cycles()

solB: remove clint_time_val and export a function in timer-clint.c as below:
get_clint_cycles()
{
	readl_relaxed(clint_time_val);
}

then
#define get_cycles get_clint_cycles

Both solutions can solve the issues. which one is better?

Thanks in advance


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
