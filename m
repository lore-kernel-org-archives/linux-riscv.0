Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AB3C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 07:31:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E852075D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 07:31:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RFs/0h1q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60E852075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0Ds2nKuw6gftDsGGSZznNwMEw0MLbowZ2T1q8ZTUgI=; b=RFs/0h1qTdpSZf
	FFUVJiKVqL6C3OQinRU5eSvwhP9bC0jO9opEt3djhjJWi9QknY9gDQ7mgFVzbxF2R83CiXWkHmQ4o
	iLfMMf0T0SvZJS6jfagT69utlV7fWT9ZXXTVawal/Qv+Pp+xuIVAmnT+gXw/19mlHHDeUwClQPCg7
	IvKi/Lp6r1OmADMlWvTuj9hNmUiSZ7oeFWKACub6Nn3l+bw7r1ASIJOQPK5s1jxO2oSmxUYxihs8k
	LH2PCHGvaxvQ4KNhXfe5WwioYETPyvPd79CzY3uO3oPRwRzfCVOyowPgXHj+5Y3BofHBT2fCX/Rl+
	WYnTnJhmRuXoa8qT9zpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9325-0002j2-1f; Wed, 27 Mar 2019 07:31:33 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h9323-0002ih-9K; Wed, 27 Mar 2019 07:31:31 +0000
Date: Wed, 27 Mar 2019 00:31:31 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH v4 5/5] riscv: implement IPI-based remote TLB shootdown
Message-ID: <20190327073131.GA4519@infradead.org>
References: <cover.1553647082.git.gary@garyguo.net>
 <d1c980f2e49192c7cb2ddd4f3e4af577d1eaf539.1553647082.git.gary@garyguo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1c980f2e49192c7cb2ddd4f3e4af577d1eaf539.1553647082.git.gary@garyguo.net>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 27, 2019 at 12:41:30AM +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> This patch implements IPI-based remote TLB shootdown, which is useful
> at this stage for testing because BBL/OpenSBI ignores operands of
> sbi_remote_sfence_vma_asid and always perform a global TLB flush.
> The SBI-based remote TLB shootdown can still be opt-in using boot
> cmdline "tlbi_method=sbi".

I think Anup now fixes OpenSBI.  Do you have benchmarks vs BBL,
old OpenSBI and new OpenSBI?

> +static void ipi_remote_sfence_vma(void *info)
> +{
> +	struct tlbi *data = info;
> +	unsigned long start = data->start;
> +	unsigned long size = data->size;
> +	unsigned long i;
> +
> +	if (size == SFENCE_VMA_FLUSH_ALL) {
> +		local_flush_tlb_all();
> +	}

Doesn't this need a return to skip the latter code?  Also it might
we worth to just split the all case into entirely separate helpers,
that way the on_each_cpu calls don't need to pass a private data
argument at all.

> +
> +	for (i = 0; i < size; i += PAGE_SIZE) {
> +		__asm__ __volatile__ ("sfence.vma %0"
> +				      : : "r" (start + i)
> +				      : "memory");
> +	}

local_flush_tlb_kernel_page?

> +static void ipi_remote_sfence_vma_asid(void *info)
> +{
> +	struct tlbi *data = info;
> +	unsigned long asid = data->asid;
> +	unsigned long start = data->start;
> +	unsigned long size = data->size;
> +	unsigned long i;
> +
> +	if (size == SFENCE_VMA_FLUSH_ALL) {
> +		__asm__ __volatile__ ("sfence.vma x0, %0"
> +				      : : "r" (asid)
> +				      : "memory");
> +		return;
> +	}
> +
> +	for (i = 0; i < size; i += PAGE_SIZE) {
> +		__asm__ __volatile__ ("sfence.vma %0, %1"
> +				      : : "r" (start + i), "r" (asid)
> +				      : "memory");
> +	}

local_flush_tlb_range?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
