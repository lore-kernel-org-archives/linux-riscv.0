Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0929C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 02:08:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EDA0218D2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 02:08:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rNc3co7s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LhJs262P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EDA0218D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTWD9RvEDCDEHabBnaS99AtFwWAdhnFMHvEJ+PX5270=; b=rNc3co7sED2GSP
	5gRARjUctIwzKyBHQILewzuI1MiAoC9AKElZi3ve5VBlD9YX0Yah9RvqQy0Pnd5k4MG3VqWr5x1dF
	TsU4mI/zYazdD2W04VZyoL1NRthvKpLriSyM+ZGsaT/P/n6chyNDNcnCOZP3TeuqCP1FQH1MyXF4m
	svoO11/t9Ejwgr0E4cNnR6aMQeLFd9NvjBqEi+EXVgNnzmRo1wWxcclqJgVjJSLR6eb7YTFmuwI+f
	4MWG05PCksZj/F9SBuGPAZJ5cnxWwbd5VFwzmfh6/F6HKzZk0m6l4wqIw45BlCBn/uIyYji3Ya1BV
	nR6AyZi5soOn1Mf/3KGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJ7Kd-0002FQ-5f; Wed, 24 Apr 2019 02:08:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ7KZ-0002Et-Tp
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 02:08:17 +0000
Received: from guoren-Inspiron-7460 (23.83.240.247.16clouds.com
 [23.83.240.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F987218D2;
 Wed, 24 Apr 2019 02:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556071694;
 bh=gvHSlNwytK2oKYnJClL+LsmOetPenEFvr1DB+Sej11Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LhJs262Pkd7I96qWBCSiDSiESMYMcCQDjT7cZEtx5M10Y1qrBt/bFiwG2I6M+bJMb
 HS7CCGAnnh2lL05VSn1bIKfR3Es8sPhEc9yB/60HVPMAeoNOZy2LLNeCthCZ/xUin5
 n1/7rZMqFH6zINgVGL1iRC5+Oysv95Gt7ovR6qFU=
Date: Wed, 24 Apr 2019 10:08:04 +0800
From: Guo Ren <guoren@kernel.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH] riscv: Support non-coherency memory model
Message-ID: <20190424020803.GA27332@guoren-Inspiron-7460>
References: <1555947870-23014-1-git-send-email-guoren@kernel.org>
 <20190422161814.GA30694@lst.de>
 <20190423001348.GA31639@guoren-Inspiron-7460>
 <20190423055548.GA12365@lst.de>
 <20190423154642.GA16001@guoren-Inspiron-7460>
 <d1988350-7da9-37bb-3d8b-93bedea0b732@garyguo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1988350-7da9-37bb-3d8b-93bedea0b732@garyguo.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_190815_996941_FF155633 
X-CRM114-Status: GOOD (  17.08  )
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>, Andrew Waterman <andrew@sifive.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup.patel@wdc.com>,
 Xiang Xiaoyan <xiaoyan_xiang@c-sky.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Vincent Chen <vincentc@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, "ren_guo@c-sky.com" <ren_guo@c-sky.com>,
 Scott Wood <swood@redhat.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 "tech-privileged@lists.riscv.org" <tech-privileged@lists.riscv.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Gary,

On Tue, Apr 23, 2019 at 03:57:30PM +0000, Gary Guo wrote:
> >>> Another point is we could get more attribute bits by modify the riscv
> >>> spec:
> >>>   - Remove Global bit, I think it's duplicate with the User bit in linux.
> >>
> >> It is in Linux, but it is conceptually very different.
> > Yes, but hardware could ignore one of them and in riscv linux
> > _PAGE_GLOBAL is no use at all, see:
> > grep _PAGE_GLOBAL arch/riscv -r
> > 
> > In fact, the _PAGE_KERNEL for pte doesn't contain _PAGE_GLOBAL and it
> > works on FU540 and qemu. As I've mentioned page attribute bits is very
> > precious, define a useless bit make people confused.
>  >
> 
> The fact that it isn't used yet doesn't imply it is not useful. We don't 
> use ASIDs at the moment, and without using ASIDs the "global" bit is 
> indeed not useful. However with ASIDs the bit will be vital for saving 
> TLB spaces. Without the global bit, the kernel pages become synonyms to 
> themselves (i.e. they have different tags in TLB but refer to the same 
> physical page).
> 
> The global bit also exists in many other ISAs as well. It's definitely 
> not a "useless" bits.
> 
> Moreover, this bit is already implemented in both Rocket and Ariane. It 
> is also in the spec for quite a while. The fact that Linux doesn't use 
> it at the moment is not a reason for removing it.
> 

Look:
linux-next git:(riscv_asid_allocator_v2)$ grep GLOBAL arch/riscv -r
arch/riscv/include/asm/pgtable-bits.h:#define _PAGE_GLOBAL    (1 << 5)    /* Global */
arch/riscv/include/asm/pgtable-bits.h:                                    _PAGE_USER | _PAGE_GLOBAL))

Your patch tell us _PAGE_USER and _PAGE_GLOBAL are duplicate and why we
couldn't make _PAGE_USER implies _PAGE_GLOBAL? Can you give an example
of a real scene in PTE about:
  _PAGE_USER:0 + _PAGE_GLOBAL:1
or
  _PAGE_USER:1 + _PAGE_GLOBAL:0

Of cause I know USER & GLOBAL are conceptually very different, but
there are only 10 attribute-bits for riscv (In fact we've wasted two bits
to support huge RV32-pfn :P). So I think it is time to merge these two bits
before hardware supports GLOBAL. Reserve them for future!

Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
