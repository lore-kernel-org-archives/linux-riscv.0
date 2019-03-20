Return-Path: <SRS0=bcqy=RX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A048C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 17:43:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F6D72184D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 17:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kp/USnAH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F6D72184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DaFI22vIhFelQuAi3TUpwWN+aoT3Gzx6v4hnv9cwL4c=; b=Kp/USnAHtOt7Hl
	38Crpj9rSwpy1Eu0YhJqrXzEm4DTY7YmLSFvGcGd6P5Z+a5UxHTj6Y1wB74fffqbvm/08AS1IUqew
	pbZJZ4Ck87tuKayngwx0xboeoQanCdnYk1Val9KvHQbz5jIXcEivm2+vrnIZhSWzloqE3K5Daymbd
	hWYRtLu/CC7beZZNA/Foal2NDdvWfm0Npmt4CK5zts9yFPCE6zVrmairMU5/ja0kdGqeqby0ZSFec
	nukKuXJq+7AngCXTjCLD03GB7JZw+L6bpUE7XPdL6XOaiFj0Filh5eokmZc9gc5IHUfKSS+Eojz9Y
	T5J2kt7GoczUWwkKRqZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6fFG-0004tR-Iu; Wed, 20 Mar 2019 17:43:18 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6fFD-0004t4-JX
 for linux-riscv@lists.infradead.org; Wed, 20 Mar 2019 17:43:17 +0000
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.89)
 (envelope-from <logang@deltatee.com>)
 id 1h6fFB-00011R-Qr; Wed, 20 Mar 2019 11:43:14 -0600
To: Palmer Dabbelt <palmer@sifive.com>
References: <mhng-bc5a03c7-1387-43e2-bd72-fb03e344e196@palmer-si-x1c4>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <9ac29b0d-4c25-3f5c-3812-44b42332447d@deltatee.com>
Date: Wed, 20 Mar 2019 11:43:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <mhng-bc5a03c7-1387-43e2-bd72-fb03e344e196@palmer-si-x1c4>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: linux-riscv@lists.infradead.org, hch@lst.de,
 dan.j.williams@intel.com, hch@infradead.org, sbates@raithlin.com,
 linux-kernel@vger.kernel.org, ysato@users.sourceforge.jp, dalias@libc.org,
 robh@kernel.org, palmer@sifive.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v4 1/2] sh: mm: make use of new memblocks_present() helper
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_104315_982374_ECB040CA 
X-CRM114-Status: GOOD (  10.22  )
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
Cc: robh@kernel.org, dalias@libc.org, ysato@users.sourceforge.jp,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 sbates@raithlin.com, Christoph Hellwig <hch@infradead.org>,
 dan.j.williams@intel.com, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 2019-03-19 8:54 p.m., Palmer Dabbelt wrote:
> On Tue, 19 Mar 2019 10:56:52 PDT (-0700), logang@deltatee.com wrote:
>> Hey Palmer,
>>
>> On 2019-01-23 12:56 p.m., Palmer Dabbelt wrote:
>>>> @Palmer: if you can just look at taking the second patch, I'll resubmit
>>>> the first one to the appropriate list.
>>>
>>> Works for me.  I'll queue the second patch into my staging branch, targeted for
>>> the next merge window.
>>
>> It doesn't look like my sparesmem patch made it into v5.1-rc1. Did it
>> fall through the cracks?
> 
> It must have, sorry.  Is this what you're referring to?
> 
>     https://patchwork.kernel.org/patch/10754911/

Yes, though it conflicts with v5.1-rc1 due to some code reorganization.

I've updated it and we will submit it later this week as part of a
larger patch set which helps enable p2p on RISC-V.

Logan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
