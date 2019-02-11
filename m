Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3022C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 20:03:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9424720836
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 20:03:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GGn55tPt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="RSuORIMm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9424720836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3/+T2d3pKoDV16tf9ogwnFR/mBcGrClR01qe9Ky5NBs=; b=GGn55tPtLyD9oWpTUW8AIcovx
	f8pHUuQEArh68spOtVSXxYtjfSmYZSntYAzYx1DQ2qv3ocG8WoqieiQthrZGZDPnMUUmSxPShRq3A
	ZDvq4McWFtLVBcrAWWRDdHb5Dvw+JAeeT1fAdANJDVI4BoSSbYn3qFyizIgNX2LWHXTkillDcxugj
	RT6rujPHCWZSt8USqHwh2BipjXOe9EeqLbDwhWPjjQdnuU3BIpBX9EKO20MRxAlACoIaRSjUl48IS
	NdZ2klaAqKapwYL6xvenVZwFluwSHgJqFsDWwdzT83S4uihY/Cgx+i1Cup80iMeOIvecWwTGSClVN
	Lqn8dUYQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtHno-0001Ra-0X; Mon, 11 Feb 2019 20:03:40 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtHnj-0001Q5-Mb
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 20:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549915416; x=1581451416;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dgMKljKrDeD8eESyLJyIVqLOrHbFP/IE6E7imTUziVA=;
 b=RSuORIMmCNUOEXBbQmLYmr6pfjMbVLgItSVq5gBGHPnYqYl2p0Ok0hQk
 Gi810aXJp19RCGAZUTL7GnPHeGPmGrL+aN5IsPzhGz3cbqPrFOH37c0nB
 WXF4SnZNPME10c2QM+TKHK/QiW0CsMkMLQv1JM/IiSpUrZs37ZaexqJlA
 hlX7RCp6JI8AxP3tQGlVa/46yXbBFPZ+EMmcca1m/mNwNnFauIVTI0UBK
 3b1cqZAmApvMRmi5kgUVgTng9LLZ+rOIt3IEixwY7Z3ZEiem29Uh1/6gs
 h1lJIjiskjcO6ueNE+M+rw3BD7d+akZjEfih8H9dScOJl+/aOMR90xX1n A==;
X-IronPort-AV: E=Sophos;i="5.58,360,1544457600"; d="scan'208";a="100944198"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2019 04:03:32 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 11 Feb 2019 11:42:09 -0800
Received: from cnf000690.ad.shared (HELO [10.86.62.97]) ([10.86.62.97])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Feb 2019 12:03:32 -0800
Subject: Re: [v3 PATCH 8/8] RISC-V: Assign hwcap only according to boot cpu.
To: Palmer Dabbelt <palmer@sifive.com>,
 "david.abdurachmanov@gmail.com" <david.abdurachmanov@gmail.com>
References: <mhng-baffacaa-599b-4c89-a5a0-e0c85ddb6d44@palmer-si-x1c4>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <83562b9d-e94b-76ce-7240-aac1dce43205@wdc.com>
Date: Mon, 11 Feb 2019 12:03:30 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <mhng-baffacaa-599b-4c89-a5a0-e0c85ddb6d44@palmer-si-x1c4>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_120335_804847_AFFE8117 
X-CRM114-Status: GOOD (  18.37  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "dmitriy@oss-tech.org" <dmitriy@oss-tech.org>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "me@packi.ch" <me@packi.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 "marc.zyngier@arm.com" <marc.zyngier@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, "schwab@suse.de" <schwab@suse.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "zongbox@gmail.com" <zongbox@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/11/19 11:02 AM, Palmer Dabbelt wrote:
> On Fri, 08 Feb 2019 20:26:07 PST (-0800), david.abdurachmanov@gmail.com wrote:
>> On Sat, Feb 9, 2019 at 12:03 AM Atish Patra <atish.patra@wdc.com> wrote:
>>>
>>> On 2/8/19 1:11 AM, Christoph Hellwig wrote:
>>>>> +     * We don't support running Linux on hertergenous ISA systems.
>>>>> +     * But first "okay" processor might not be the boot cpu.
>>>>> +     * Check the ISA of boot cpu.
>>>>
>>>> Please use up your available 80 characters per line in comments.
>>>>
>>> I will fix it.
>>>
>>>>> +            /*
>>>>> +             * All "okay" hart should have same isa. We don't know how to
>>>>> +             * handle if they don't. Throw a warning for now.
>>>>> +             */
>>>>> +            if (elf_hwcap && temp_hwcap != elf_hwcap)
>>>>> +                    pr_warn("isa mismatch: 0x%lx != 0x%lx\n",
>>>>> +                            elf_hwcap, temp_hwcap);
>>>>> +
>>>>> +            if (hartid == boot_cpu_hartid)
>>>>> +                    boot_hwcap = temp_hwcap;
>>>>> +            elf_hwcap = temp_hwcap;
>>>>
>>>> So we always set elf_hwcap to the capabilities of the previous cpu.
>>>>
>>>>> +            temp_hwcap = 0;
>>>>
>>>> I think tmp_hwcap should be declared and initialized inside the outer loop
>>>> instead having to manually reset it like this.
>>>>
>>>>> +    }
>>>>>
>>>>> +    elf_hwcap = boot_hwcap;
>>>>
>>>> And then reset it here to the boot cpu.
>>>>
>>>> Shoudn't we only report the features supported by all cores?  Otherwise
>>>> we'll still have problems if the boot cpu supports a feature, but not
>>>> others.
>>>>
>>>
>>> Hmm. The other side of the argument is boot cpu does have a feature that
>>> is not supported by other hart that didn't even boot.
>>> The user space may execute something based on boot cpu capability but
>>> that won't be enabled.
>>>
>>> At least, in this way we know that we are compatible completely with
>>> boot cpu capabilities. Thoughts ?
>>
>> There is one example on the market, e.g., Samsung Exynos 9810.
>>
>> Mongoose 3 (big cores) only support ARMv8.0, while Cortex-A55
>> (little ones) support ARMv8.2 (and that brings atomics support).
>> I think, it's the only ARM SOC that supports different ISA extensions
>> between cores on the same package.
>>
>> Kernel scheduler doesn't know that big cores are missing atomics
>> support or that applications needs it and moves the thread
>> resulting in illegal instruction.
>>
>> E.g., see Golang issue: https://github.com/golang/go/issues/28431
>>
>> I also recall Jon Masters (Computer Architect at Red Hat) advocating
>> against having cores with mismatched capabilities on the server market.
>>
>> It just causes more problems down the line.
> 
> IMO the best bet is to only put extensions in HWCAP that are supported by all
> the harts that userspace will be scheduled on.
> 
Fair enough. Instead of setting HWCAP in setup_arch() once, we can set 
it only for boot cpu. It will be updated after every cpu comes up online.

Thus, HWCAP will consists all extensions supported by all cpus that are 
online currently.


Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
