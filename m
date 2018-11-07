Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CC7C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:19:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BAFF2081D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:19:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IyzPuSsO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MNtmSPmF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BAFF2081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oc7+QqpjcC+gSjqkp2eJfp2KESvNuH8AqcXka4R047g=; b=IyzPuSsOb6rzan
	u4V2cBJ/raaOSlTzIVhyO9xfpfMdmaqMcgV1AgpxYIaLM+z7R4DKoONCaz5TDLzx6pXK3RKQtkVla
	CSzSsUsICJo9n96gXrpBlMiYHPqJsOeMJF3BwTFU+wD54+h3wupd1eB65LDXnFF6O9gIl4BrztJFr
	qzOTtuuBrHcMrsBm6fV9oKUOFMmelzVdH/JXQlq3VO+JWIWRY73opBrB2pIWEMlkBe7tQT0z+5pg9
	PtVWlgB2GaOXnKtkaWmqhSSxVOTm9TbrhJoRGnOM5YygQL1Z6DVF+gcd1T3n8p8gUIOYVGFSHS1b2
	ZbiD6psU5TgFQMSe/EQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKUIf-0006LG-4Q; Wed, 07 Nov 2018 20:19:41 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUIY-0006DO-3b; Wed, 07 Nov 2018 20:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Subject:Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e8GLscr0lbrtBxoHjh30rdpafOz5FO4KRUSl2yGt4II=; b=MNtmSPmFlGLmIy2J8SbjYAzafp
 D3iMBLZKjD1+6yuRzAP/2Pv7BBZq/NXIx9ap3YwVVSdUyNYOLFuPXPna9dcBrdI8WFeIFr79YOlM9
 JzkmLxp4k4Jj7b/AJrz6Q4ctgmGv/9Ma6kojnKn6YnFOxI9t6/dhw9b2Ih4ZL0zjbuDGXnFqG44I/
 MhT2J517lhJDnyK5LuiG2Y7fmUZrJy5OJ6uHBb54XYN+eCvV/eaYjcJ5TDm8kRTqvA0nDoJargQdc
 SdmEIVvx9GW9DH1he00PTbH3o67cs+AVCgMHFSxBFpd7HojtMQJq+nBSPdjtiw95j/hygSkzSx2+M
 zTTkIPKg==;
Received: from ale.deltatee.com ([207.54.116.67])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUIV-0002GX-LE; Wed, 07 Nov 2018 20:19:32 +0000
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.89)
 (envelope-from <logang@deltatee.com>)
 id 1gKUI9-0005jQ-Sq; Wed, 07 Nov 2018 13:19:10 -0700
To: Andrew Morton <akpm@linux-foundation.org>
References: <20181107173859.24096-1-logang@deltatee.com>
 <20181107173859.24096-3-logang@deltatee.com>
 <20181107121207.62cb37cf58484b7cc80a8fd8@linux-foundation.org>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <724be9bb-59b6-33f3-7b59-3ca644d59bf7@deltatee.com>
Date: Wed, 7 Nov 2018 13:19:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181107121207.62cb37cf58484b7cc80a8fd8@linux-foundation.org>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: osalvador@suse.de, vbabka@suse.cz, mhocko@suse.com,
 arnd@arndb.de, hch@lst.de, aou@eecs.berkeley.edu, palmer@sifive.com,
 sbates@raithlin.com, linux-sh@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH 2/2] mm/sparse: add common helper to mark all memblocks
 present
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_151931_796030_CB322329 
X-CRM114-Status: GOOD (  15.41  )
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
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107201908.gGcaz0tuI7yMOl7W7fLpH-_d6XAA4oFGccDtlvDrXX8@z>



On 2018-11-07 1:12 p.m., Andrew Morton wrote:
>> +void __init memblocks_present(void)
>> +{
>> +	struct memblock_region *reg;
>> +
>> +	for_each_memblock(memory, reg) {
>> +		memory_present(memblock_get_region_node(reg),
>> +			       memblock_region_memory_base_pfn(reg),
>> +			       memblock_region_memory_end_pfn(reg));
>> +	}
>> +}
>> +
> 
> I don't like the name much.  To me, memblocks_present means "are
> memblocks present" whereas this actually means "memblocks are present".
> But whatever.  A little covering comment which describes what this
> does and why it does it would be nice.

The same argument can be made about the existing memory_present()
function and I think it's worth keeping the naming consistent. I'll add
a comment and resend shortly.

> Acked-by: Andrew Morton <akpm@linux-foundation.org>
> 
> I can grab both patches and shall sneak them into 4.20-rcX, but feel
> free to merge them into some git tree if you'd prefer.  If I see them
> turn up in linux-next I shall drop my copy.

Sounds good, thanks.

Logan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
