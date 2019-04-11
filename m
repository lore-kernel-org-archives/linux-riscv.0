Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C95C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 15:54:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23D9F2082E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 15:54:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kiCx63cV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23D9F2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVY/ajlbn8JJugadEcYoq2vHw4vMqaWLWs+pwjVtGiM=; b=kiCx63cVepJ8Lu
	lIJEqtDakUIjhVN2UO/9PigfkkLp/K3MYgYHUoY4jAbi9nYFvawYfJpTBOPdGv4SVnR/8iQ46nbbq
	xspIKWrxAl0BKnfZHSsP2hkuFWORHjtfNFe8ib+A2HcFHEIt4KsRjwoB1qd/F2x9ikIETP1D8aUtQ
	rg/50XRk21mj6Pv41Y1G3nURpYEwvaA1xkhmMhQQHtOJPSsdR7Hw3syt1FnCA+FeCoGXzJIwb/boH
	Sx+U6oEQxN8i7lNBZ+LapGRi7NoMbpdamv/7+3YdEEx7Ws06a///+BYElzlTJfPPCyAhA8Qo0/WfY
	hDPVzSn1PwYEV0UPzy8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEc2K-0007sb-Kw; Thu, 11 Apr 2019 15:54:48 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEc2I-0007s4-JS
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 15:54:48 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id B67D868AFE; Thu, 11 Apr 2019 17:54:33 +0200 (CEST)
Date: Thu, 11 Apr 2019 17:54:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [PATCH 8/9] riscv: print the unexpected interrupt cause
Message-ID: <20190411155433.GA23895@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-9-hch@lst.de>
 <79115ffcf1cd752c3c0fed37c45d9b8d@mailhost.ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <79115ffcf1cd752c3c0fed37c45d9b8d@mailhost.ics.forth.gr>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_085446_785138_FD7F7C32 
X-CRM114-Status: UNSURE (   6.39  )
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

On Thu, Apr 11, 2019 at 06:52:06PM +0300, Nick Kossifidis wrote:
>>  	default:
>> -		panic("unexpected interrupt cause");
>> +		pr_alert("unexpected interrupt cause 0x%lx", regs->xcause);
>> +		BUG();
>>  	}
>>  	irq_exit();
>
> Did you mean regs->scause ? There is no xcause field on struct pt_regs and
> also there is no such register name:
> https://github.com/torvalds/linux/blob/master/arch/riscv/include/asm/ptrace.h

Oops.  The field gets renamed in my nommu tree to deal with the fact
that depending on the kernel build it could hold scause or mcause.
I'll respin it without this rename.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
