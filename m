Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29406C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 22:57:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED16C21841
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 22:57:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HGWZ/hhd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="A4HmFncb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED16C21841
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IBEMBXUMSO3C/VKAZer7VPUI8Z2IqbCXLBC0HX2afTg=; b=HGWZ/hhdMuNtS5op8HJqUj1Jn
	Ck4rz7WPC1SaX/reSX0OiBfRV8bCSkYpdpVOruBblOEUbLwmKoNkdg4DtpXoanGoRDUARWwKUcU42
	2e2z+p9Wr7Pz/v6Rx5vgBucJgxdBQZh1zJ49Kcr8t757SFi3aNeV2xDk0cKYCyelQ20gpdp+JACTG
	P4LR9g8XxaLK3q5i28bqABBA5nvSjfpteYCrpKpNW1jZN3RJrgX2zlxstz9tft7XtvaNdpcnDVAR4
	qHlWc+QpNLKLvsUZqpaZ0C4j5RmyVBqu4uVn0SK1miKFYcdqokY26g4qNfCILvCISysnZkCcmVfJQ
	OK1xtf7cA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsF4x-0007Cd-Jw; Fri, 08 Feb 2019 22:57:03 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsF4v-0007Bo-2e
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 22:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549666621; x=1581202621;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=AaXLsLkp5lCyJS9vlcxg9SAChjUSNy6OwDD0PjlSrYA=;
 b=A4HmFncbj+Wck12a6uJiUfnNyWnniwOH8LctKsA9LviDhf7ZBAsRiaG2
 03mlu3oX+PfCHuJOqeG5qibUmIVG+BDGHvfzkyEvSJKGO5Vx/rZVopAIE
 T/YzjvNmUfmL/z3CL4EjfxsJc/CC9dlYpWNLm21bwtaDlBgyIOOOYG7xF
 Xj6iUNHXLflquHw2IEOQVoGpl0nPuqRhn7NNFrhbZReRcHS2gHznVjWXH
 v8i9hmU8HFhkcCiB6Pnb0htdLq5Wx5/bcNPmWx0TQpJpsiIof9hCxzkTk
 bu0QbxoNwOi7mhrq+OAIyDpMTc956DqzS7uJOKzFEFziCypS16vJwEXoc g==;
X-IronPort-AV: E=Sophos;i="5.56,564,1539619200"; d="scan'208";a="102116337"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2019 06:56:59 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 08 Feb 2019 14:35:40 -0800
Received: from usa003289.ad.shared (HELO [10.86.59.147]) ([10.86.59.147])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Feb 2019 14:56:59 -0800
Subject: Re: [v3 PATCH 2/8] RISC-V: Move cpuid to hartid mapping to SMP.
To: Christoph Hellwig <hch@infradead.org>
References: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
 <1549590681-24125-3-git-send-email-atish.patra@wdc.com>
 <20190208090316.GB16932@infradead.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <1090db6a-f4c1-a522-7c2d-d7367846df35@wdc.com>
Date: Fri, 8 Feb 2019 14:56:57 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190208090316.GB16932@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_145701_260088_69DED2D1 
X-CRM114-Status: GOOD (  17.33  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 =?UTF-8?Q?Patrick_St=c3=a4hlin?= <me@packi.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marc Zyngier <marc.zyngier@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/8/19 1:03 AM, Christoph Hellwig wrote:
> On Thu, Feb 07, 2019 at 05:51:15PM -0800, Atish Patra wrote:
>> Currently, logical CPU id to physical hartid mapping is
>> defined for both smp and non-smp configurations. This
>> is not required as we need this only for smp configuration.
>> The mapping function can define directly boot_cpu_hartid
>> for non-smp use case.
> 
> Please use up your available 72 chars for the changelog.  (probably also
> in other patches).
> 

Sorry. I will fix all patches to use 72 chars.

>>
>> The reverse mapping function i.e. hartid to cpuid can be called
>> for any valid but not booted harts. So it should return default
>> cpu 0 only if it is a boot hartid.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>> ---
>>   arch/riscv/include/asm/smp.h | 14 +++++++++++---
>>   arch/riscv/kernel/setup.c    |  9 ---------
>>   arch/riscv/kernel/smp.c      |  9 +++++++++
>>   3 files changed, 20 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
>> index 41aa73b4..21fd2d75 100644
>> --- a/arch/riscv/include/asm/smp.h
>> +++ b/arch/riscv/include/asm/smp.h
>> @@ -22,12 +22,13 @@
>>   /*
>>    * Mapping between linux logical cpu index and hartid.
>>    */
>> -extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
>> -#define cpuid_to_hartid_map(cpu)    __cpuid_to_hartid_map[cpu]
>>   
>> +extern unsigned long boot_cpu_hartid;
>>   struct seq_file;
> 
> We usually try to keep forward declatations at the top of the file.
> 
> Can you add the new external declaration below the forward one?
> 
Sure.

Regards,
Atish
> Otherwise looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
