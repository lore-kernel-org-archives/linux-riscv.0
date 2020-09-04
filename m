Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909DAC433E2
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:57:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 562822073B
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 16:57:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zohF96Qw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 562822073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YntaUn1S7Xky0LSqaa6tloR0XlNWiZ4ojX840snt6X8=; b=zohF96QwARTiHRefhe/hKRTTc
	amFGmLIuELkYWpbBLnLj39XszqD34ME4MrUBXCZNPrMO0rjvBbIn62hi/kYAflbybjg4IgdaOmk7l
	4kvflzBfoSRGZ1cNpHrIOL5cPYaosmUVxX98iIotpPAJIjOCfbhg1NBFp9Lp1JC3oaZ8eTr3ARp9g
	GNGRygBuZzswGDC1mOI1o386uD06XFLEZM0i5kE0dpqm/cqlIyspHlxdvqwtkBh75/YDnK6NYgEC3
	WtG526kt8N9qbGTGxhhCTRMzpFd18QA088hi9tgoiuOrKmpBpVDDeM8GhFVjvb5voxswwDXW9dvUB
	qK6nvo9Qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEF1W-0004q4-CG; Fri, 04 Sep 2020 16:57:14 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEF1U-0004pj-Kv
 for linux-riscv@lists.infradead.org; Fri, 04 Sep 2020 16:57:13 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 64FF168BEB; Fri,  4 Sep 2020 18:57:09 +0200 (CEST)
Date: Fri, 4 Sep 2020 18:57:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH] RISC-V: Allow drivers to provide custom read_cycles64
 for M-mode kernel
Message-ID: <20200904165709.GA32667@lst.de>
References: <20200904162121.279578-1-anup.patel@wdc.com>
 <20200904162530.GA32095@lst.de>
 <CAAhSdy2ru2xuOC76UvCBhUoDNEv=f_w0Q4N+9UmQaVnNyMaE-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2ru2xuOC76UvCBhUoDNEv=f_w0Q4N+9UmQaVnNyMaE-Q@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_125712_828184_4FC27ED3 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 04, 2020 at 10:13:18PM +0530, Anup Patel wrote:
> I respectfully disagree. IMHO, the previous code made the RISC-V
> timer driver convoluted (both SBI call and CLINT in one place) and
> mandated CLINT for NoMMU kernel. In fact, RISC-V spec does not
> mandate CLINT or PLIC. The RISC-V SOC vendors are free to
> implement their own timer device, IPI device and interrupt controller.

Yes, exactly what we need is everyone coming up with another stupid
non-standard timer and irq driver.

But the point is this crap came in after -rc1, and it adds totally
pointless indirect calls to the IPI path, and with your "fix" also
to get_cycles which all have exactly one implementation for MMU or
NOMMU kernels.

So the only sensible thing is to revert all this crap.  And if at some
point we actually have to deal with different implementations do it
with alternatives or static_branch infrastructure so that we don't
pay the price for indirect calls in the super hot path.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
