Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFF3C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 18:19:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F19F62087C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 18:19:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="riNa0+ti"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F19F62087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJgWQ7D1zDYvZYdWFhvOOAC2PSIrr0t93xxRHd8QBI8=; b=riNa0+tiW0Ic/M
	jviZ/ay0+QeJB4101bYXsRZ8SixOzID7DmLJ4isgt25oa+phiUVZ23pFnLKuj02UZTCSfPK8uzPPj
	us439g1KZ41f71SNHHWRBSp8CuA/mPOQ8syCHC86O8vTdlLwhd0vbrZ7rQ0yYFX1ROHc0sPtThZ8p
	LtjJhVDtR6k7d59/TvF9zoFP0sp8wxBLgfeGQywEz4QICWdi9PbVmpZOf6pOqr+Jcqq9/5FPtQM9R
	uW982ZOc8qXrSXbmaUf7LyF0dE7UXV3pzDO5MxB9A17ifd5A9vYc/2W0y4bten8oS6ZGGFlvJ6/w2
	iGEQj6+xcLCeyv4dYrQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3lzX-00071o-89; Tue, 12 Mar 2019 18:19:07 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3lzR-0006yi-Eh; Tue, 12 Mar 2019 18:19:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 189C8A78;
 Tue, 12 Mar 2019 11:19:00 -0700 (PDT)
Received: from [10.1.194.37] (e113632-lin.cambridge.arm.com [10.1.194.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F195A3F59C;
 Tue, 12 Mar 2019 11:18:56 -0700 (PDT)
Subject: Re: [PATCH 00/14] entry: preempt_schedule_irq() callers scrub
To: Vineet Gupta <vineet.gupta1@synopsys.com>, linux-kernel@vger.kernel.org
References: <20190311224752.8337-1-valentin.schneider@arm.com>
 <e604601e-f8e1-a8b5-d364-69ca967996ce@synopsys.com>
From: Valentin Schneider <valentin.schneider@arm.com>
Message-ID: <a5b1605b-b3b3-7898-30ae-d993050e8c7a@arm.com>
Date: Tue, 12 Mar 2019 18:18:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <e604601e-f8e1-a8b5-d364-69ca967996ce@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_111901_624854_4C51F9E5 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Julien Thierry <julien.thierry@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-s390@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Ingo Molnar <mingo@redhat.com>,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/03/2019 18:03, Vineet Gupta wrote:
[...]
>> Regarding that loop, archs seem to fall in 3 categories:
>> A) Those that don't have the loop
> 
> Please clarify that this is the right thing to do (since core code already has the
> loop) hence no fixing is required for this "category"
> 

Right, those don't need any change. I had a brief look at them to double
check they had the proper need_resched() gate before calling
preempt_schedule_irq() (with no loop) and they all seem fine. Also...

>> B) Those that have a small need_resched() loop around the
>>    preempt_schedule_irq() callsite
>> C) Those that branch to some more generic code further up the entry code
>>    and eventually branch back to preempt_schedule_irq()
>>
>> arc, m68k, nios2 fall in A)
> 

I forgot to include parisc in here.

[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
