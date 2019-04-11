Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2625C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 16:06:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83B452133D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 16:06:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T3NcwnVv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83B452133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fhkdq2NWkdeCH25+Yhi9ip4DwX9aNl2gPXEZ0ZMiEcs=; b=T3NcwnVvq53Ixf
	HCJNNJ8nUNkJ0JMsdkhg7dWSaHHIeUCARVg+jIM2YrY4DVVrTMFjV7TOnoDG42uElF9O/e3fcrx3q
	SnTlVwVncN05UkfuFKIOuIooF3GQAAPAYhJxCZ8EeFz34ddcafSp8lfus3LGNNzt0lvMhjYyrEtEN
	iPNmQh8bTZ2KsOjd7eX3mbRbPqxypni6d7OA9Zne72w78V/WhSzuPF5SZcalVBaQ+3tjyozpr61ZL
	V26uIfEINIBfIoy8oR8YMK3Tjllg52PV0oV011GAlXadEYqO28iGQPGoF2+ShnS/SCR/+LT8L9n1m
	WKY976XZembkx9UrNvuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEcDW-0006VK-E3; Thu, 11 Apr 2019 16:06:22 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEcDT-0006UR-JZ
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 16:06:20 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id CCB7368B02; Thu, 11 Apr 2019 18:06:06 +0200 (CEST)
Date: Thu, 11 Apr 2019 18:06:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [PATCH 7/9] riscv: remove duplicate macros from ptrace.h
Message-ID: <20190411160606.GA24210@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-8-hch@lst.de>
 <25d179157667295a1cb1bf53e5eb66ee@mailhost.ics.forth.gr>
 <8e0db47120668612b1814504a7054462@mailhost.ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e0db47120668612b1814504a7054462@mailhost.ics.forth.gr>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_090619_794892_B8B100E8 
X-CRM114-Status: UNSURE (   6.48  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 11, 2019 at 06:55:09PM +0300, Nick Kossifidis wrote:
>>> @@ -83,7 +83,7 @@ static void notrace walk_stackframe(struct task_struct 
>>> *task,
>>>
>>>  	if (regs) {
>>>  		sp = GET_USP(regs);
>
> Ah just noticed this, it should be user_stack_pointer(regs) instead since 
> you removed
> GET_USP.

It should.  And given that at least my full nommu tree had plenty of
buildbot exposure that made me wonder why it didn't blow up.

It turns out RISC-V unconditionally selects ARCH_WANT_FRAME_POINTERS,
which then turns on the FRAME_POINTER option unconditonally.

So this branch is entirely dead code and I should just remove it with
the next respin of the series.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
