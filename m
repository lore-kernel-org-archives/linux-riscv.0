Return-Path: <SRS0=8WcR=PY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7D0C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Jan 2019 01:07:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A60520866
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Jan 2019 01:07:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h3n7W2WS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iSVF+jml"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A60520866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JjKPE3ewzNhAQJtbuMpj1YONmHSMca4b4mD3tJGIvfg=; b=h3n7W2WSz9JEK4
	LPa6kwx3WNddqMCzg5/jwRo4oAdBsWXjLyp7QobovjjP8NUdXmKM61dILuOjL/6RJcQyCCy5ojiUY
	jWqbgK5ppMVyfSsCPrT2ExMpsVGI20gFFatEtNHYsU1x/JrYkzv8SUyT9CxRbFdW5eRadrRVwvMXi
	h3wJi/ZxeFB7D/JEZcV1dw4z0eWUznvO9Yq34X3WjWVkJo9RXoJUKFP5NMnWx9199DqWwKQg+jFsV
	SNhlryLD7gO7blKexst9PTIZNmHv3zodSiHZJWzRi0aWKK80mNLYDTZ2N4/s90OtIbI6qkymvmtfK
	h5w2voO4V0Qzdl/X0tWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjZgK-0006Yh-T7; Wed, 16 Jan 2019 01:07:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjZgH-0006YE-W2
 for linux-riscv@lists.infradead.org; Wed, 16 Jan 2019 01:07:47 +0000
Received: from guoren-Inspiron-7460 (23.83.240.247.16clouds.com
 [23.83.240.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E848D20866;
 Wed, 16 Jan 2019 01:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547600865;
 bh=ZKHy6uhrsc1OV/zqKQdyUh6VIzyaCN0wZnffuBGFBkQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iSVF+jmlly0DpAVrHjRwcPCszGEAXfIEG1TZOaVWJwPi831eV4DmFvN6v2TFacdCB
 sZ1Wmv465jpU8D0RxbB/zCWrnIDfO2Z8kCvG71AzzAL7ogcG2Nrx1qfpVmids6QIX0
 +7zvZDHEi3lES/o0TLybbFZo9j5YG0eRIb9gWWNI=
Date: Wed, 16 Jan 2019 09:07:38 +0800
From: Guo Ren <guoren@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] riscv: fixup max_low_pfn with PFN_DOWN.
Message-ID: <20190116010738.GA4817@guoren-Inspiron-7460>
References: <1547280987-7630-1-git-send-email-guoren@kernel.org>
 <20190115153613.GC26443@infradead.org>
 <20190115161000.GA22705@guoren-Inspiron-7460>
 <20190115161254.GA19081@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190115161254.GA19081@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_170746_060503_6ACC0D92 
X-CRM114-Status: GOOD (  17.34  )
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
Cc: linux-arch@vger.kernel.org, aou@eecs.berkeley.edu, palmer@sifive.com,
 linux-kernel@vger.kernel.org, Mao Han <mao_han@c-sky.com>,
 Guo Ren <ren_guo@c-sky.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Christoph,

I use PFN_DOWN() every where as possible and seems it's a habit
problem. So let risc-v maintainer to choose "PFN_DOW()" or
">> PAGE_SHIFT".

Also the same with "end_of_DRAM & max_low_pfn".

Best Regards
 Guo Ren

On Tue, Jan 15, 2019 at 08:12:54AM -0800, Christoph Hellwig wrote:
> On Wed, Jan 16, 2019 at 12:10:00AM +0800, Guo Ren wrote:
> > > >  	set_max_mapnr(PFN_DOWN(mem_size));
> > > > -	max_low_pfn = memblock_end_of_DRAM();
> > > > +	max_low_pfn = PFN_DOWN(memblock_end_of_DRAM());
> > > 
> > > I know it is used just above, but can we please just switch this
> > > code to use >> PAGE_SHIFT instead of PFN_DOWN, which just horribly
> > > obsfucates what is going on?
> > ???
> > #define PFN_DOWN(x)	((x) >> PAGE_SHIFT)
> > 
> > phys_addr_t __init_memblock memblock_end_of_DRAM(void)
> > {
> > 	int idx = memblock.memory.cnt - 1;
> > 
> > 	return (memblock.memory.regions[idx].base + memblock.memory.regions[idx].size);
> > }
> > 
> > What's the problem? PFN_DOWN() couldn't be used with function call?
> 
> PFN_DOWN gives you the correct result.  But I think it actually
> drastically reduces readability over just opencoding it.
> 
> > My patch just want to point out that max_low_pfn is PFN not size. In fact
> > there is no error for running without my patch :P
> 
> No, I think your patch is correct.  I just wonder if we could make
> the code easier to read.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
