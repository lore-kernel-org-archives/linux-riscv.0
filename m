Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B55C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 10:11:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3232720850
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 10:11:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BTTlgIbM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3232720850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8cg8qq/2lV2jNoZhus9ivkm6bAlHBzaKYdHcItpF4g=; b=BTTlgIbMxfHhp7
	JOFytgVeLwNGOF2UmPVXUDW/Bb32Pgv4unHFHIssai43A6UvYQofqbqfr+WEluZX8qRFdbkG1xqHf
	XID/mJvVWqWCqg+T3SJJlY9qyn8UW5TV6PqN0q/XetnojEn8xAFPturXXeMgGBkQcQLgK6dhI3S9y
	z/VYberi8TrwNhuYcnlgtQF3pthnMLWJJAb1mCREHf3jDmNHYItFeVwKgtFCsdq0HCJw3SO4dRCyb
	FJRRkh7ybkmw5yjie5CG4KzNaQnGXBg34IEsteYGeRUFJYu8yV1nXBTIlqT0YHuV4VO4AjYeyZ1SL
	fIOJIuCuJWp08dqjDj6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEACm-0000kl-78; Wed, 10 Apr 2019 10:11:44 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hEACk-0000kB-0Z; Wed, 10 Apr 2019 10:11:42 +0000
Date: Wed, 10 Apr 2019 03:11:41 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 0/5] TLB/I$ flush cleanups and improvements
Message-ID: <20190410101141.GA29411@infradead.org>
References: <cover.1553647082.git.gary@garyguo.net>
 <20190410070446.GA18678@infradead.org>
 <CAAhSdy36Ukh-rCZPnyQh9y8iUi730wBuY_qGO+ctK1_L=sCU1g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy36Ukh-rCZPnyQh9y8iUi730wBuY_qGO+ctK1_L=sCU1g@mail.gmail.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, opensbi@lists.infradead.org,
 Anup Patel <Anup.Patel@wdc.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Gary Guo <gary@garyguo.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 10, 2019 at 02:31:04PM +0530, Anup Patel wrote:
> > Can you clarify the races?  I know Anup had some FIFO-order commits
> > in opensbi about a week ago, did they address you concerns?
> >
> > Anup, do you have performance numbers for the old opensbi vs your
> > implementation of the optimized TLB flushing vs this patch?
> 
> Atish had posted performance numbers on his GitHub PR at:
> https://github.com/riscv/opensbi/pull/111
> 
> These performance numbers are as follows.....
> 
> Benchmark used: A microbenchmark that mmap a ramdisk (1G) and
> multiple threads access 50MB of memory randomly.
> 
> https://github.com/westerndigitalcorporation/hmmap/blob/master/userspace/hmmap_uspace_common.c
> 
> The result is averaged over 25 iterations for 8 threads on HiFive
> Unleashed board. In both cases around ~1M remote tlb flushes are triggered.
> 
>                                  IPI               SBI            Gain
> Average Write Time             2.53183        2.43263           +4.34%
> Average Read Time             1.32198         1.24643           +6.09%
> Total Time                    97.7589         92.859            +5.01%

So what does this mean?  I assume the codebases are latest(-ish)
opensbi and latest(-ish) kernel with the patches from Gary, and
IPI is with the lernel based code enabled, and SBI is with the SBI
calls?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
