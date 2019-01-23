Return-Path: <SRS0=FsxO=P7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CD3C282C0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 20:31:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E30CB2184C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 20:31:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VNYc1tH8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E30CB2184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBRklCkSgljm/gQVzRGA+t79hIIV3W3NCvVm/CyYCto=; b=VNYc1tH8rlk1gj
	opaoP8Ensyx8rbfB5N1c7YWDWH/X4zmpqV1SQFu1L1/Wrzpvl5Gb6YhAB+pI29IG4HDdzUks8PcSv
	73jPHAspcnb4d2UVWcwUNqbgMfkRlFQHgm7n5YeXCKXtGioGwqkKmGr86AEcfSsncm6WeHhIc53/S
	wVRXNSQXhu49TwVzjUqrmz4t9529UNEOAvbap9LAfwGGRxhKFy4HHiS4sOhDJ3Vqhq4RLqHZDNU6P
	pS6gjIlN4AQJYZ8saxhI9VlS7btr10WApqTVgJHg0zgxmvOTyFIt/L/Fg2HqDBAYR3wvRxDnfvHsW
	EgmA8Qpg72GCd5bVM0AA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmPBe-0004Re-Rs; Wed, 23 Jan 2019 20:31:50 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmPBb-0004Qz-Cl
 for linux-riscv@lists.infradead.org; Wed, 23 Jan 2019 20:31:49 +0000
Received: from s01061831bf6ec98c.cg.shawcable.net ([68.147.80.180]
 helo=[192.168.6.205])
 by ale.deltatee.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <logang@deltatee.com>)
 id 1gmPBS-0005d3-BA; Wed, 23 Jan 2019 13:31:39 -0700
To: Palmer Dabbelt <palmer@sifive.com>
References: <mhng-96f28491-e123-459a-b09c-88732de06bbf@palmer-si-x1c4>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <eca31a2b-1e19-0b4b-afd9-0204c9aba125@deltatee.com>
Date: Wed, 23 Jan 2019 13:31:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <mhng-96f28491-e123-459a-b09c-88732de06bbf@palmer-si-x1c4>
Content-Language: en-US
X-SA-Exim-Connect-IP: 68.147.80.180
X-SA-Exim-Rcpt-To: dan.j.williams@intel.com, hch@lst.de,
 linux-riscv@lists.infradead.org, sbates@raithlin.com,
 linux-kernel@vger.kernel.org, ysato@users.sourceforge.jp, dalias@libc.org,
 robh@kernel.org, hch@infradead.org, palmer@sifive.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v4 1/2] sh: mm: make use of new memblocks_present() helper
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_123147_800390_EF1B339B 
X-CRM114-Status: GOOD (  11.30  )
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
 dan.j.williams@intel.com, linux-kernel@vger.kernel.org, sbates@raithlin.com,
 Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 2019-01-23 12:56 p.m., Palmer Dabbelt wrote:
> On Tue, 15 Jan 2019 09:30:44 PST (-0800), logang@deltatee.com wrote:
>>
>>
>> On 2019-01-15 6:58 a.m., Christoph Hellwig wrote:
>>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>>
>>> Probably no need to keep this in a series with the RISC-V code, this can
>>> be queued up by the sh folks independently.
>>
>> Oh, yeah, sorry, I obviously didn't pay enough attention to this when I
>> resent it. I sent the similar Arm changes to the appropriate list and,
>> yes, the sh ones should go to that maintainer.
>>
>> @Palmer: if you can just look at taking the second patch, I'll resubmit
>> the first one to the appropriate list.
> 
> Works for me.  I'll queue the second patch into my staging branch, targeted for
> the next merge window.

Thanks!

Logan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
