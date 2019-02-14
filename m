Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7F0C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 23:49:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F69321B18
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 23:49:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jfN7nB8l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="YDNCYbBz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F69321B18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=opNjQ2RLfBP8X8n601eGfh7hxtZaaEtGxDUzVuXD9iU=; b=jfN7nB8lDrMv1GbfVLFYbrPyh
	HTb/tAMLxerXhd0w06dGUlIwVAfR4+KvSpnxKsupQqiVPBCO4jupmePPfMpvyIO26/WOLGfe73yeB
	zKBbd+pJhe3FRq544lpJjJeEV6cCQr39a0MWeew5D/BrcE2n/6JUCsFL6oIHHwLgrLzbQsox6gJpe
	1r1WrwTUBJCG2Ie+wf4iLYSFXj0blphex96vXGpUW+JmMy6j4BWA5JHIVaclsIm39uFiCLLcrHn4Q
	QoZfNE4TLept0/CBiOO0WeaAM5ec/2daZ9OpkvZvnVTujyUAEe8RdP3DK6mAmA+mxC+MNpEBkjKCM
	8I90UqLJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guQkm-0002HA-8v; Thu, 14 Feb 2019 23:49:16 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guQkj-0002GT-1w
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 23:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550188153; x=1581724153;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=m/m/GY5maHFTnaGubRna8IuXMU1j8X4Gcoz2PKN+T5s=;
 b=YDNCYbBzI79jnkWHNG176K3MmKjIirbuEjGnFBQY35ww9+wakyuRZNqr
 owoxW+bW2IV/HerB739STyKRu5BedxhBSZfvtXlnWGsFfxtHiCiJ5lyhE
 yCSVlvsdhdrQ4LZTi6rCe5pSxYlsLgqq1nyjoiP5ZexPL39tXKtR4CO7g
 vkrxWh0Rd00k3cus1vpNQNv2Noh84bpkjZuvfYZwuy8jl1kqTu7pXVZp2
 pUwcf5rzhWJKErccL1o/xogZOU/0+wct0uKSh/MXk4Hof+wXEFv1wa30p
 zI1sQS6650WfPbu/SrrHdtTjSZGzNRmAbUkIVSbMORh1Ycad/6gEvxlYX g==;
X-IronPort-AV: E=Sophos;i="5.58,370,1544457600"; d="scan'208";a="106308649"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Feb 2019 07:49:11 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 14 Feb 2019 15:29:43 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.66.47])
 ([10.111.66.47])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Feb 2019 15:49:10 -0800
Subject: Re: [v4 PATCH 8/8] RISC-V: Assign hwcap as per comman capabilities.
To: Palmer Dabbelt <palmer@sifive.com>, "johan@kernel.org" <johan@kernel.org>
References: <mhng-d7d9894c-d6f6-485b-95e8-962c4ab0f3f1@palmer-si-x1c4>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <e3d0cb05-268a-6148-7723-fe6b94d96583@wdc.com>
Date: Thu, 14 Feb 2019 15:49:09 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <mhng-d7d9894c-d6f6-485b-95e8-962c4ab0f3f1@palmer-si-x1c4>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_154913_216663_B82FB531 
X-CRM114-Status: GOOD (  22.06  )
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
Cc: "robh@kernel.org" <robh@kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "dmitriy@oss-tech.org" <dmitriy@oss-tech.org>,
 "schwab@suse.de" <schwab@suse.de>, "anup@brainfault.org" <anup@brainfault.org>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marc.zyngier@arm.com" <marc.zyngier@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/13/19 4:38 PM, Palmer Dabbelt wrote:
> On Wed, 13 Feb 2019 00:44:42 PST (-0800), johan@kernel.org wrote:
>> On Tue, Feb 12, 2019 at 11:58:10AM -0800, Atish Patra wrote:
>>> On 2/12/19 3:25 AM, Johan Hovold wrote:
>>>> On Tue, Feb 12, 2019 at 03:10:12AM -0800, Atish Patra wrote:
>>>>> Currently, we set hwcap based on first valid hart from DT. This may not
>>>>> be correct always as that hart might not be current booting cpu or may
>>>>> have a different capability.
>>>>>
>>>>> Set hwcap as the capabilities supported by all possible harts with "okay"
>>>>> status.
>>>>>
>>>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>>>> ---
>>>>>    arch/riscv/kernel/cpufeature.c | 41 ++++++++++++++++++++++-------------------
>>>>>    1 file changed, 22 insertions(+), 19 deletions(-)
>>>>>
>>>>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>>>>> index e7a4701f..a1e4fb34 100644
>>>>> --- a/arch/riscv/kernel/cpufeature.c
>>>>> +++ b/arch/riscv/kernel/cpufeature.c
>>>>> @@ -20,6 +20,7 @@
>>>>>    #include <linux/of.h>
>>>>>    #include <asm/processor.h>
>>>>>    #include <asm/hwcap.h>
>>>>> +#include <asm/smp.h>
>>>>>
>>>>>    unsigned long elf_hwcap __read_mostly;
>>>>>    #ifdef CONFIG_FPU
>>>>> @@ -42,28 +43,30 @@ void riscv_fill_hwcap(void)
>>>>>
>>>>>    	elf_hwcap = 0;
>>>>>
>>>>> -	/*
>>>>> -	 * We don't support running Linux on hertergenous ISA systems.  For
>>>>> -	 * now, we just check the ISA of the first "okay" processor.
>>>>> -	 */
>>>>>    	for_each_of_cpu_node(node) {
>>>>> -		if (riscv_of_processor_hartid(node) >= 0)
>>>>> -			break;
>>>>> -	}
>>>>> -	if (!node) {
>>>>> -		pr_warn("Unable to find \"cpu\" devicetree entry\n");
>>>>> -		return;
>>>>> -	}
>>>>> +		unsigned long this_hwcap = 0;
>>>>>
>>>>> -	if (of_property_read_string(node, "riscv,isa", &isa)) {
>>>>> -		pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
>>>>> -		of_node_put(node);
>>>>> -		return;
>>>>> -	}
>>>>> -	of_node_put(node);
>>>>> +		if (riscv_of_processor_hartid(node) < 0)
>>>>> +			continue;
>>>>>
>>>
>>>>> -	for (i = 0; i < strlen(isa); ++i)
>>>>> -		elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
>>>>> +		if (of_property_read_string(node, "riscv,isa", &isa)) {
>>>>> +			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
>>>>> +			return;
>>>>
>>>> Did you want "continue" here to continue processing the other harts?
>>>
>>> Hmm. If a cpu node doesn't have isa in DT, that means DT is wrong. A
>>> "continue" here will let user space use other harts just with a warning
>>> message?
>>>
>>> Returning here will not set elf_hwcap which forces the user to fix the
>>> DT. I am not sure what should be the defined behavior in this case.
>>>
>>> Any thoughts ?
>>
>> The problem is that the proposed code might still set elf_hwcap -- it
>> all depends on the order of the hart nodes in dt (i.e. it will only be
>> left unset if the first node is malformed).
>>
>> For that reason, I'd say it's better to either bail out (hard or at
>> least with elf_hwcap unset) or to continue processing the other nodes.
>>
>> The former might break current systems with malformed dt, though.
>>
>> And since the harts are expected to have the same ISA, continuing the
>> processing while warning and ignoring the malformed node might be
>> acceptable.
> 
> Handling malformed device trees by providing a warning and an empty HWCAP seems
> like the right way to go to me.
> 

If I understand you correctly, you prefer following things to be done in 
case of malformed DT.

1. Print a warning message
2. Unset the entire HWCAP
3. Return without processing other harts. This will most likely result 
in panic when user space starts.

Is this correct ?

Regards,
Atish
>>
>> Johan
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
