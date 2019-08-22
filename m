Return-Path: <SRS0=8Mks=WS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6BEC3A59E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 01:46:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9278822D6D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 01:46:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rqo+8MMq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9278822D6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ep4nXqnaDrLRuRLupQAwPCelIZWiKdmjTfuy2j7CRUI=; b=rqo+8MMqWM8X+e
	U13rz7YdiFeHKcdM4GtPyGELFjDF885+rOOwKJje7+VBNznILudlJYxtyncdTfz6gxiAFL7b7KmM0
	JGX6gGfjp0doA+YOIuSU6ex39Ah5pcbOBfL81RJLWWvRUp8HziP96MJHp6yXE2amEikWYBYCd8/8k
	5JXhxRWq0G53bhEgWxfE3X6/46HT3n1C/E0FtV5IPfYrsncyUL9TF9AQv1ODdJ68ISVeCUqJ5KBee
	QnWr7TP8STQMCPViB5sEHxX+6KX6ZVh4rkxFZGlDrLH8pqAWiZdld/TbsGuMemJWocsGfPyQOmT9q
	MfQuH6sx3vtK8fTVBBew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0cBc-00016b-Sv; Thu, 22 Aug 2019 01:46:48 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0cBZ-00016G-S2
 for linux-riscv@lists.infradead.org; Thu, 22 Aug 2019 01:46:47 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 79BEB68BFE; Thu, 22 Aug 2019 03:46:42 +0200 (CEST)
Date: Thu, 22 Aug 2019 03:46:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v3 1/3] RISC-V: Issue a local tlbflush if possible.
Message-ID: <20190822014642.GA11922@lst.de>
References: <20190822004644.25829-1-atish.patra@wdc.com>
 <20190822004644.25829-2-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822004644.25829-2-atish.patra@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_184646_057832_A2A40B27 
X-CRM114-Status: GOOD (  15.74  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Anup Patel <Anup.Patel@wdc.com>,
 Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 21, 2019 at 05:46:42PM -0700, Atish Patra wrote:
> In RISC-V, tlb flush happens via SBI which is expensive. If the local
> cpu is the only cpu in cpumask, there is no need to invoke a SBI call.
> 
> Just do a local flush and return.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/mm/tlbflush.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index df93b26f1b9d..36430ee3bed9 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -2,6 +2,7 @@
>  
>  #include <linux/mm.h>
>  #include <linux/smp.h>
> +#include <linux/sched.h>
>  #include <asm/sbi.h>
>  
>  void flush_tlb_all(void)
> @@ -13,9 +14,23 @@ static void __sbi_tlb_flush_range(struct cpumask *cmask, unsigned long start,
>  		unsigned long size)
>  {
>  	struct cpumask hmask;
> +	unsigned int cpuid = get_cpu();
>  
> +	if (!cmask) {
> +		riscv_cpuid_to_hartid_mask(cpu_online_mask, &hmask);
> +		goto issue_sfence;
> +	}
> +
> +	if (cpumask_test_cpu(cpuid, cmask) && cpumask_weight(cmask) == 1) {
> +		local_flush_tlb_all();
> +		goto done;
> +	}

I think a single core on a SMP kernel is a valid enough use case given
how litte distros still have UP kernels.  So Maybe this shiuld rather be:

	if (!cmask)
		cmask = cpu_online_mask;

	if (cpumask_test_cpu(cpuid, cmask) && cpumask_weight(cmask) == 1) {
		local_flush_tlb_all();
	} else {
	 	riscv_cpuid_to_hartid_mask(cmask, &hmask);
	  	sbi_remote_sfence_vma(hmask.bits, start, size);
	}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
