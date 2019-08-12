Return-Path: <SRS0=eWHs=WI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A84C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2019 14:56:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93B4D20679
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2019 14:56:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IH7mpVpE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93B4D20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVnvFslKhquCyp1X2sfhrGEK5UULBoEAErKDAw7dhUI=; b=IH7mpVpEG338iT
	Kx0vuCtjsSzn4yXctWaTxRqoDBk6tfsu58ty6pDLwGUZHFiL8szEX8Ta/RY3hJqmSFmKeCt6prDAe
	MTU15E95piax93S0tWdL9iJPZ3P8uTdv/ylsOJIM6JSMh5qnb/rpGbNTyfmSiZ91fzqV6mdoS8uuj
	p9GqI+hy70rCU3HS6UjpJ43GElDPfpW4xlrcTpofW+lhKwQWsiQYCmn+7S58MNGfljapdFPfKULRN
	it/GBk1FrXxWt34MakYDYKuFhC7bPD592ELzJ0ZQ6/FXxvtmqVFbbKC2IJ9IIeh3FvdOo5/Sb52Tm
	2ywfB3G33VwZimNll07g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxBkP-0003K4-RM; Mon, 12 Aug 2019 14:56:33 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hxBkN-0003Jt-5S; Mon, 12 Aug 2019 14:56:31 +0000
Date: Mon, 12 Aug 2019 07:56:31 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH] RISC-V: Issue a local tlb flush if possible.
Message-ID: <20190812145631.GC26897@infradead.org>
References: <20190810014309.20838-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190810014309.20838-1-atish.patra@wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <anup.patel@wdc.com>, linux-kernel@vger.kernel.org,
 Alexios Zavras <alexios.zavras@intel.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

I agree with the comment that we really should move this out of line
now, and also that we can simplify it further, which also includes
not bothering with the SBI call if we were the only online CPU.
I also thing we need to use get_cpu/put_cpu to be preemption safe.

Also why would we need to do a local flush if we have a mask that
doesn't include the local CPU?

How about something like:

void __riscv_flush_tlb(struct cpumask *cpumask, unsigned long start,
		unsigned long size)
{
	unsigned int cpu;

	if (!cpumask)
		cpumask = cpu_online_mask;

	cpu = get_cpu();
	if (!cpumask || cpumask_test_cpu(cpu, cpumask) {
		if ((start == 0 && size == -1) || size > PAGE_SIZE)
			local_flush_tlb_all();
		else if (size == PAGE_SIZE)
			local_flush_tlb_page(start);
		cpumask_clear_cpu(cpuid, cpumask);
	}

	if (!cpumask_empty(cpumask)) {
	  	struct cpumask hmask;

		riscv_cpuid_to_hartid_mask(cpumask, &hmask);
		sbi_remote_sfence_vma(hmask.bits, start, size);
	}
	put_cpu();
}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
