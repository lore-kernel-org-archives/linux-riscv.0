Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23538C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 23:03:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E577021841
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 23:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kC8FWvGO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="fIiKlTEP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E577021841
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5NgJ/6ZNQOyONmtxwLC7w15PIMNt9jvvdBhROZGiu2E=; b=kC8FWvGO1cv8BfPKiZ97J4ylE
	pADRSi9eBwvcgVQ1EWPYyNen0LZ9Z+WrFq4rmjrtTGOpYuulEsamV36yCEBVeNzsMZSYsHYknQx7n
	/5Pn7hE84O9ZDQE6Xlr3gFb9ZcOQJ7GwwcHwQUUMsb7mI/G/aezym9KiRDaLwb+C9y4M2VA5vNrK8
	XJFchG2S3v+VP8/x935kFY+ZSJgnHaoniv+Coq53YQH2RjLu56qY29TWv1M2Ls1nHe2NaZpQEoA5Y
	zHVVc6csMA7/AJuDBVQ352E5V0HZSJY8zK7c8rSClUarnlGkl0py+cLve0UioBpbnEB+4Kf4P+AsU
	grvtDvpGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsFAu-0000fI-7m; Fri, 08 Feb 2019 23:03:12 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsFAr-0000ew-EX
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 23:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549666989; x=1581202989;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=HJS0dqTZ8pL/wWqfL161CgRt5Xxy3W9rZvtNpfXa3YI=;
 b=fIiKlTEPYPxic5uf56qXVEvtjIv+FCFZBcQERXXKmfVM78IeQdTmCkP7
 QjhEyLFA6M2EBikQ5fKDhi/vTZDB/CbKbNJC/DaQIhqI+ijajANmnUANe
 7LC6p/xlOdTj9jusmD65C1nWeciufSofbBeKRAAjQVz0D68flVtpac1Tg
 wc4ukX3Za1FWQW0PT+OoFSTrRqzYeJAADmxlQstUGIHIH4bWw2WBi+wII
 q6JH8CqcdKuGG6aB32eE6+bcuRB2SQn27yXgr9sskAHrPYi14hMie/ikL
 k+P4gGiNfs+eB3J1eeC55hShQ6peYiP356zqG0DhRnx0Cep73lOU5JpY9 A==;
X-IronPort-AV: E=Sophos;i="5.58,348,1544457600"; d="scan'208";a="102597497"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2019 07:02:53 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 08 Feb 2019 14:43:35 -0800
Received: from usa003289.ad.shared (HELO [10.86.59.147]) ([10.86.59.147])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Feb 2019 15:02:52 -0800
Subject: Re: [v3 PATCH 8/8] RISC-V: Assign hwcap only according to boot cpu.
To: Christoph Hellwig <hch@infradead.org>
References: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
 <1549590681-24125-9-git-send-email-atish.patra@wdc.com>
 <20190208091133.GD16932@infradead.org>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <8f5fd0c8-0320-00b1-4ddf-b1225be352c8@wdc.com>
Date: Fri, 8 Feb 2019 15:02:52 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190208091133.GD16932@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_150309_555076_8FA3E967 
X-CRM114-Status: GOOD (  20.24  )
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

On 2/8/19 1:11 AM, Christoph Hellwig wrote:
>> +	 * We don't support running Linux on hertergenous ISA systems.
>> +	 * But first "okay" processor might not be the boot cpu.
>> +	 * Check the ISA of boot cpu.
> 
> Please use up your available 80 characters per line in comments.
> 
I will fix it.

>> +		/*
>> +		 * All "okay" hart should have same isa. We don't know how to
>> +		 * handle if they don't. Throw a warning for now.
>> +		 */
>> +		if (elf_hwcap && temp_hwcap != elf_hwcap)
>> +			pr_warn("isa mismatch: 0x%lx != 0x%lx\n",
>> +				elf_hwcap, temp_hwcap);
>> +
>> +		if (hartid == boot_cpu_hartid)
>> +			boot_hwcap = temp_hwcap;
>> +		elf_hwcap = temp_hwcap;
> 
> So we always set elf_hwcap to the capabilities of the previous cpu.
> 
>> +		temp_hwcap = 0;
> 
> I think tmp_hwcap should be declared and initialized inside the outer loop
> instead having to manually reset it like this.
> 
>> +	}
>>   
>> +	elf_hwcap = boot_hwcap;
> 
> And then reset it here to the boot cpu.
> 
> Shoudn't we only report the features supported by all cores?  Otherwise
> we'll still have problems if the boot cpu supports a feature, but not
> others.
> 

Hmm. The other side of the argument is boot cpu does have a feature that 
is not supported by other hart that didn't even boot.
The user space may execute something based on boot cpu capability but 
that won't be enabled.

At least, in this way we know that we are compatible completely with 
boot cpu capabilities. Thoughts ?

Regards,
Atish
> Something like:
> 
> 	for () {
> 		unsigned long this_hwcap = 0;
> 
> 		for (i = 0; i < strlen(isa); i++)
> 			this_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
> 
> 		if (elf_hwcap)
> 			elf_hwcap &= this_hwcap;
> 		else
> 			elf_hwcap = this_hwcap;
> 	}
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
