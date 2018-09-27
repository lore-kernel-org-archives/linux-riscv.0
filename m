Return-Path: <SRS0=T2Hi=MJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BADC43382
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Sep 2018 22:29:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73E3321712
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Sep 2018 22:29:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mXu1bh9e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Ab53j7PR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73E3321712
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rOVVS5pg0AzqhLKoeUDWNTYXT0b2vefYZralA+VnfZU=; b=mXu1bh9evsFnsz2NBCyygRN70
	s1xQYcbqjePc8JtQViUF9pO3WyT8Hm9itGpMT16StBqz3ljtOAZqXr4cbCod2Yo8cHuF0g+F1eWOL
	XjLRB8rq6X18ZwQzex8asYIdlYG6WhkYUAIjmjYMV3yhBB1aurlZDFMWbgHLhjXCOj79auSEMxwtZ
	HdTJWDZ0BXzG5A3aVZraNtrRvEw71SiRXZOWReyUQBiY+UWFVWC/vGhQXA5jKIcHXgrSbE6euUOzo
	vUWqtEOcddlNM5hMt3ERUQCzqzYfPBnaG+PPPDGdJL3A9s32U9XkSpvSQ/4XClvPKkoHynx+0tvT7
	68nFWCmkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g5emu-0007tn-3W; Thu, 27 Sep 2018 22:29:36 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5emh-0007pO-7G
 for linux-riscv@lists.infradead.org; Thu, 27 Sep 2018 22:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1538087363; x=1569623363;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=QXGBpjou41IlEYutkrf87r4e6Z+A+gmWSTaqlxwJQsU=;
 b=Ab53j7PRtkXiZJw6yINYeThUbYgGmTnsHm0GxKjga8d2EVFc3lpAcO5D
 Dv4nLAAlln8TZig2Y6PLKXq+Q1l3Bq7Z4n95tNnUQRzybEdQobRYjvyVi
 dOg9qFq1HrDY9yHRzW/TDeB1urVU5C1p3vGf5XdrSDBbxGxw03+5+IYlK
 sYvd5NQg8bWWe5Cadk7ol+9VwbnK3wxoLjtio1K/Wv5ZSeih6OcBzibZy
 cUntvQQ2GPrA1Jnt+cMMeF15ph3WbfpkvIyYHvSfTK45YrXUtMT6m3tYI
 8PNcHBpjwog+qi89RhBUDJ+puMENBJnZtba0a/yMgpEYUk7fR8Y9rW7Li w==;
X-IronPort-AV: E=Sophos;i="5.54,312,1534780800"; d="scan'208";a="95282625"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Sep 2018 06:28:51 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 27 Sep 2018 15:14:39 -0700
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.196.159.148])
 ([10.196.159.148])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Sep 2018 15:28:50 -0700
Subject: Re: [PATCH v2] RISC-V: Show CPU ID and Hart ID separately in
 /proc/cpuinfo
To: Anup Patel <anup@brainfault.org>
References: <20180923133737.22693-1-anup@brainfault.org>
 <a7c64e1a-405e-6a2c-cb42-211c4f89367d@wdc.com>
 <CAAhSdy2ZOXk3fDt8W_G1=h_OrifFsXP3XwZ2xnXwt9ztzW4GEg@mail.gmail.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <d0c811f0-02f0-3503-fb03-4a07ebdfb477@wdc.com>
Date: Thu, 27 Sep 2018 15:28:50 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAAhSdy2ZOXk3fDt8W_G1=h_OrifFsXP3XwZ2xnXwt9ztzW4GEg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180927_152923_378516_45E201F9 
X-CRM114-Status: GOOD (  16.75  )
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
Cc: Christoph Hellwig <hch@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180927222850.gxID9dUPhuFJFReeo8v1tfThY6F2qEYk1sWslwga8xM@z>

On 9/25/18 9:17 PM, Anup Patel wrote:
> On Tue, Sep 25, 2018 at 11:29 PM Atish Patra <atish.patra@wdc.com> wrote:
>>
>> On 9/23/18 6:37 AM, Anup Patel wrote:
>>> Currently, /proc/cpuinfo show logical CPU ID as Hart ID which
>>> is in-correct. This patch shows CPU ID and Hart ID separately
>>> in /proc/cpuinfo using cpuid_to_hardid_map().
>>>
>> I noticed it should be cpuid_to_hartid_map instead of
>> cpuid_to_hardid_map. It was a typo in my smp cleanup patch series.
>> Sorry for the inconvenience here.
> 
> Thanks for pointing.
> 
>>
>> I can include this patch in into my series fixing the typo if you want.
> 
> Yes, please.
> 

Great.

> You can also include "RISC-V: Show IPI stats" patch in your series.
> This patch was reviewed by Christoph.
> 

I already had that included as a part of v5.

Regards,
Atish
> Thanks,
> Anup
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
