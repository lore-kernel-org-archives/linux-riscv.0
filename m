Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D8B8C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 07:54:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D0E020811
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 07:54:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LUeo46j6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D0E020811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DP24AZQ1tyIxe2EKC/oMuUUZZbAeFch7qP7GYSoZT9g=; b=LUeo46j6BxO1rI
	JTw0y/A+dAJlLTkW2FehqVykLI27lxOk7hyKOWF8bMmQ0mpEOboLbnYRyxlHRFYkk4CoS25v2EHMG
	7Ga3h37m2Lc1+SYpkmef9Hx3Ns2b6q6F7GqUrxf51bkdEA1T/1EiHihU/oWlMI5PafY3Bxpohu+QE
	EvtYdHPTGdS8h9Rei1stSg37GJS5i91v90DM2u9ArSCYbNcAmgJwywnxzZiCJE8J3nywSD6V2OIXj
	sCngwF6HeH3zaHt9dTUjXTq4QiJ/An/lsnd34JxzYlsMIDW0+t+bVpexyzNZLDSudQe5jHEFMlX+q
	uInvWsNILr2rJPQ3qUpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h93OV-0001Dm-S8; Wed, 27 Mar 2019 07:54:43 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h93OT-0001DD-Fo; Wed, 27 Mar 2019 07:54:41 +0000
Date: Wed, 27 Mar 2019 00:54:41 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v3 4/4] RISC-V: Allow booting kernel from any 4KB aligned
 address
Message-ID: <20190327075441.GA29894@infradead.org>
References: <20190325092234.5451-1-anup.patel@wdc.com>
 <20190325092234.5451-5-anup.patel@wdc.com>
 <20190325113935.GD27843@infradead.org>
 <CAAhSdy2dds7pp8=XX+zbKbMoWbgjPxP6r4aMZJeHyqHV2MP4CQ@mail.gmail.com>
 <20190325145919.GB14826@infradead.org>
 <CAAhSdy2je-_=AHPawbV-8cUR0P7WvqDZ5wNdEmDVQkR-a88Eog@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2je-_=AHPawbV-8cUR0P7WvqDZ5wNdEmDVQkR-a88Eog@mail.gmail.com>
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 25, 2019 at 09:46:59PM +0530, Anup Patel wrote:
> > Why do you even care about kernel mappings for non-existant ram.
> 
> We care because there will always be some buggy kernel driver/code going
> out-of-bound and accessing non-existent RAM. If we by default map all
> possible kernel virtual address then behaviour of buggy accesses will be
> unpredictable.
> 
> Further, I think we should also make .text and .rodata sections of kernel
> as read-only. This will protect kernel code and rodata.

All of that is useful at the final_setup_vm() time - but none of it
matters during early setup_vm where life is complicated.

Mike suggested on the previous iteration that you only do smaller
mappings when setting up the final mapping to avoid the ops churn,
and I fully agree with him. 

So I would suggest we avoid complicated the fiddly early boot changes
that just add complxity, and you instead redirect your efforts to
say implemented proper ro and non-executable sections using 4k mappings
in the final VM setup only.  That should actuall lead to less code
and complexity, and provide more benefits.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
