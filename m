Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AD5C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 15:54:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 335412183F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 15:54:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AQyLIpEF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 335412183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fgR1DOl1KbvTVYed+PF9QM/yAt5rrpqr/lXBq6Z3C8=; b=AQyLIpEFLCZhNF
	jtAmbV/iYiqzyYBRnipPtNSk+FKO44+8aTemmNrRH68zX9CMA/iU5yCq0xWM4/6U9RWKst9PXLM99
	WIZ+ulpQuohEExOVGEv7o/lb+Yrz2XDBPEa0IvSyImkXPLgv0SgspyJ1r492gyDMB1BgKa+W8p/uz
	vWU78gVuPZaZ5aTVTl7HUYKOafRji4f+nJlQRtlNVzCI/F7OOM25kc2evpu+wM9j7+vfIwetcNboe
	shW8IGsNX+nPNBwTOpQatmQ0i4jTkoGb5gbRYW/kvAoMj/l6MArjew0DbW+0tdJNQrI+5c92QdU06
	viZkVdvI/h33CFGcQwGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9XM0-0007pZ-2f; Thu, 28 Mar 2019 15:54:08 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9XLx-0007pE-8N
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 15:54:06 +0000
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.89)
 (envelope-from <logang@deltatee.com>)
 id 1h9XLw-0004Sx-2z; Thu, 28 Mar 2019 09:54:04 -0600
To: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>
References: <20190327213643.23789-4-logang@deltatee.com>
 <mhng-fca98e1a-ad61-40b6-abd8-60b0e752dcf2@palmer-si-x1c4>
 <CAAhSdy1UoiGaAph3MnmnBfxhTpscjd5jYrrzr0ES6ZPcz8tH4w@mail.gmail.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <2f4c13d5-6a5c-472a-4a7b-5fd184ffe7c6@deltatee.com>
Date: Thu, 28 Mar 2019 09:54:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAAhSdy1UoiGaAph3MnmnBfxhTpscjd5jYrrzr0ES6ZPcz8tH4w@mail.gmail.com>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: hch@lst.de, linux-riscv@lists.infradead.org,
 antonynpavlov@gmail.com, sbates@raithlin.com, linux-kernel@vger.kernel.org,
 anup.patel@wdc.com, aou@eecs.berkeley.edu, sorear2@gmail.com,
 palmer@sifive.com, anup@brainfault.org
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH 3/7] RISC-V: Rework kernel's virtual address space mapping
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_085405_342834_FE76B2BA 
X-CRM114-Status: GOOD (  11.75  )
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
Cc: sorear2@gmail.com, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 sbates@raithlin.com, antonynpavlov@gmail.com, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 2019-03-28 12:28 a.m., Anup Patel wrote:
>>> For the MAXPHYSMEM_2GB case, the physical memory must be in the highest
>>> 2GB of address space, so we cannot cover the any of the I/O regions
>>> that are higher than it but we do cover the lower I/O TileLink range.
>>
>> IIRC there was another patch floating around to fix an issue with overlapping
>> regions in the 32-bit port, did you also fix that issue?  It's somewhere in my
>> email queue...
> 
> That was a patch I submitted to fix overlapping FIXMAP and VMALLOC
> regions.
> 
> This patch does not consider FIXMAP region.

Correct.

> I suggest we introduce asm/memory.h where we have all critical defines
> related to virtual memory layout. Also, this header should have detailed
> comments about virtual memory layout.

Seems like a sensible cleanup. It did seem like the defines for this
stuff were all over the place. I'm not really clear on all the stuff
that would belong in asm/memory.h so I think I'll leave such a cleanup
to you.

The second patch in this series added documentation to describe the
virtual memory layout which matches how it was done in x86.

Logan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
