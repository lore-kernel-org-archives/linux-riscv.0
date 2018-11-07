Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1A9C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:37:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D64B2081D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:37:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hbp636ex";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UHLcrR1c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D64B2081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TKMlE5zUjfFLq4bE0Add5Os1jyKGZp69TY+v7lUrqY=; b=hbp636exbNVE6k
	VB+IHI6kt9mB1wVEWj/n2BHiilhhzfvtGLeATxF9OVpItorTqw5Uoa0gv3FpLEjDRPFF858y1za6C
	W3kmTPEAUYKmT0wRCj31Ej5etz+lHHQQ2o1ToZ5maGsUzcsDvdA271dckybagj6lPXOF4tiH2S2Qh
	ae0n2qrflfleL3QBXnc+JdyfFgEQV2dWu1Ntualq9wNbC95D+7Z0axDKOHwc/JAWqvA5H5v6/+h5d
	aiPZhHI2vToVT5JqMTkOtJMaViso4TBpG/PqgdMvj/x5PdFeM52nujlrWoHcEP3rSlvSTuEfDMt0C
	VT9jUiRinNHCfGF0NVtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKUZV-00006B-NE; Wed, 07 Nov 2018 20:37:05 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUZM-0008Ps-J9; Wed, 07 Nov 2018 20:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Subject:Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NUkSsjJyzm5B8QJ2UuwJ65sDXyAt4Q9s3vle4Z3meqk=; b=UHLcrR1cDflyB9m6p8uXy9HDk+
 Qe8+PKSYrqIqfKMAAXRmpkBTpXyI+48vtcd92p9iwX4CLaxJWTnZczOrWj2zIZ7DATJB+x12aB6pN
 2kJ3IWRmCYVxOEjyOEFreVwUntXx58YiJJ36m+w8yMcN8az4bqL/1d1X0px1R0LEVs0kwFW4ouNwT
 2j+5ejmxWwibTZHijhgKDqDkzdB+MS94GE8yh4l3kdYT9tJPNupD3TDh45VVd7FFOtIkuZ+QxFtIo
 X/cUAAq6cqibwpTyPtP0I7P9RKTNfggYIuUEZPGlhS75GguOCe99cCkYQqysl/UIMY6zG7aOe4YP/
 ycuJhfnQ==;
Received: from ale.deltatee.com ([207.54.116.67])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUZK-0002ak-6c; Wed, 07 Nov 2018 20:36:54 +0000
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.89)
 (envelope-from <logang@deltatee.com>)
 id 1gKUZ1-0005qg-46; Wed, 07 Nov 2018 13:36:35 -0700
To: Thomas Gleixner <tglx@linutronix.de>
References: <20181107173859.24096-1-logang@deltatee.com>
 <20181107173859.24096-3-logang@deltatee.com>
 <20181107121207.62cb37cf58484b7cc80a8fd8@linux-foundation.org>
 <724be9bb-59b6-33f3-7b59-3ca644d59bf7@deltatee.com>
 <alpine.DEB.2.21.1811072125280.1666@nanos.tec.linutronix.de>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <b1cc442e-7314-4a8e-3eec-9adc200d7582@deltatee.com>
Date: Wed, 7 Nov 2018 13:36:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1811072125280.1666@nanos.tec.linutronix.de>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: osalvador@suse.de, vbabka@suse.cz, mhocko@suse.com,
 arnd@arndb.de, hch@lst.de, aou@eecs.berkeley.edu, palmer@sifive.com,
 sbates@raithlin.com, linux-sh@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, tglx@linutronix.de
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH 2/2] mm/sparse: add common helper to mark all memblocks
 present
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_153654_357276_849FFD00 
X-CRM114-Status: GOOD (  14.56  )
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
Cc: linux-arch@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Stephen Bates <sbates@raithlin.com>, linux-mm@kvack.org,
 Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107203634.KWIyH6DSaXw6TnCDBKZMK5rmOXmPMtP4sGZczdikmQM@z>



On 2018-11-07 1:26 p.m., Thomas Gleixner wrote:
> Logan,
> 
> On Wed, 7 Nov 2018, Logan Gunthorpe wrote:
>> On 2018-11-07 1:12 p.m., Andrew Morton wrote:
>>>> +void __init memblocks_present(void)
>>>> +{
>>>> +	struct memblock_region *reg;
>>>> +
>>>> +	for_each_memblock(memory, reg) {
>>>> +		memory_present(memblock_get_region_node(reg),
>>>> +			       memblock_region_memory_base_pfn(reg),
>>>> +			       memblock_region_memory_end_pfn(reg));
>>>> +	}
>>>> +}
>>>> +
>>>
>>> I don't like the name much.  To me, memblocks_present means "are
>>> memblocks present" whereas this actually means "memblocks are present".
>>> But whatever.  A little covering comment which describes what this
>>> does and why it does it would be nice.
>>
>> The same argument can be made about the existing memory_present()
>> function and I think it's worth keeping the naming consistent. I'll add
>> a comment and resend shortly.
> 
> Actually if both names suck, then there also is the option to rename both
> instead of adding a comment to explain the suckage.

Ok, well, I wasn't expecting to take on a big rename like that as it
would create a patch touching a bunch of arches and mm files... But if
we can come to some agreement on a better name and someone is willing to
take that patch without significant delay then I'd be happy to create
the patch and add it to the start of my series.

Some ideas for new names:

mark_memory_present() / mark_memblocks_present()
set_memory_present() / set_memblocks_present()
memory_register() / memblocks_register()
register_memory() / register_memblocks()

Logan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
