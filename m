Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F4BDC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 20:00:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51D4A20675
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 20:00:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ah+tRWWn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="XKdqBVmb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51D4A20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YpyLtu09dDCfgIrqynIo9TIdEsCVlv9JO/fL/GMTMJ0=; b=Ah+tRWWnEJ1SmiiuwUfl6g0mA
	xOa3K8vRsW8SxC53v3A8DjaXRhkCPE35fjq90QPOfArYlTMoa3Z5N+U5CVraNGlF+hJbFILnn0QJv
	b+aiqK1Pzl1pHaWFQePD+zPayZjAANJGxgC7LKDEZbjI8BiH04hg4PJHWSA3XIDBhbznk4KZLv7KY
	6siYIG9fHDi3+Xwu7XKn/3V5c9VjqdpgizC+6FZNYOUeJ7nhP6pq3RqhOB/Wbwh0yNfBNN9dz/Yu7
	m2DXPkBt3KZZn3S7vHxxAcaMzi3EQgMyAoliaqC2erwGURWtcuKy+phnB5byvzW4pL48ijYRBRJQc
	DMCOTGFdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu0hN-0003ga-4p; Wed, 13 Feb 2019 20:00:01 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu0hK-0003g8-L7
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 20:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550087998; x=1581623998;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=QpD3dBmdLNraB7mBIU31YrmXvC/z0J19nvCXFBllLiI=;
 b=XKdqBVmbqUGBIhOGy7ONiOxHD/AdKCVJK4DLK2RCfxVrXEJoEjnmBoKY
 Et9vAqzzovT6BlYiKqEvDI1ysY83QM56KakumdSDku9cdfJNMP/N66kIK
 y1XAaPUxl8gqOCrMW5VyZeg4KCzDkMqLF5c6gvDVakMz60+LJdfkGbZfL
 +4zPRTf5L1PzsZ44I4Qomvz4FpSSeHxXOF5VSvW8faBtBTfGqv/m0rltR
 3HsD3mDRX+LiffPXFZL+tENzCmGPWSkPB73fRuo3gjd6enP2NtJyYslO6
 Q7i0ajDMVCQaAs9UY8bxkpA9Mu8+fZ4fjksiZPESvrKEsrz4GXGXLHc9N Q==;
X-IronPort-AV: E=Sophos;i="5.58,366,1544457600"; d="scan'208";a="206317896"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Feb 2019 03:59:56 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 13 Feb 2019 11:38:29 -0800
Received: from 1w4mj72.ad.shared (HELO [10.86.48.145]) ([10.86.48.145])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Feb 2019 11:59:56 -0800
Subject: Re: [v4 PATCH 8/8] RISC-V: Assign hwcap as per comman capabilities.
To: Johan Hovold <johan@kernel.org>
References: <1549969812-22502-1-git-send-email-atish.patra@wdc.com>
 <1549969812-22502-9-git-send-email-atish.patra@wdc.com>
 <20190212112534.GB28278@localhost>
 <61766631-42f4-ec25-3b5c-ae892da44ccb@wdc.com>
 <20190213084442.GD28278@localhost>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <e078563c-6da8-6a33-9a9e-1550504d7b1d@wdc.com>
Date: Wed, 13 Feb 2019 11:59:55 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190213084442.GD28278@localhost>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_115958_811728_DDD70E8F 
X-CRM114-Status: GOOD (  22.88  )
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Andreas Schwab <schwab@suse.de>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marc Zyngier <marc.zyngier@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/13/19 12:44 AM, Johan Hovold wrote:
> On Tue, Feb 12, 2019 at 11:58:10AM -0800, Atish Patra wrote:
>> On 2/12/19 3:25 AM, Johan Hovold wrote:
>>> On Tue, Feb 12, 2019 at 03:10:12AM -0800, Atish Patra wrote:
>>>> Currently, we set hwcap based on first valid hart from DT. This may not
>>>> be correct always as that hart might not be current booting cpu or may
>>>> have a different capability.
>>>>
>>>> Set hwcap as the capabilities supported by all possible harts with "okay"
>>>> status.
>>>>
>>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>>> ---
>>>>    arch/riscv/kernel/cpufeature.c | 41 ++++++++++++++++++++++-------------------
>>>>    1 file changed, 22 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>>>> index e7a4701f..a1e4fb34 100644
>>>> --- a/arch/riscv/kernel/cpufeature.c
>>>> +++ b/arch/riscv/kernel/cpufeature.c
>>>> @@ -20,6 +20,7 @@
>>>>    #include <linux/of.h>
>>>>    #include <asm/processor.h>
>>>>    #include <asm/hwcap.h>
>>>> +#include <asm/smp.h>
>>>>    
>>>>    unsigned long elf_hwcap __read_mostly;
>>>>    #ifdef CONFIG_FPU
>>>> @@ -42,28 +43,30 @@ void riscv_fill_hwcap(void)
>>>>    
>>>>    	elf_hwcap = 0;
>>>>    
>>>> -	/*
>>>> -	 * We don't support running Linux on hertergenous ISA systems.  For
>>>> -	 * now, we just check the ISA of the first "okay" processor.
>>>> -	 */
>>>>    	for_each_of_cpu_node(node) {
>>>> -		if (riscv_of_processor_hartid(node) >= 0)
>>>> -			break;
>>>> -	}
>>>> -	if (!node) {
>>>> -		pr_warn("Unable to find \"cpu\" devicetree entry\n");
>>>> -		return;
>>>> -	}
>>>> +		unsigned long this_hwcap = 0;
>>>>    
>>>> -	if (of_property_read_string(node, "riscv,isa", &isa)) {
>>>> -		pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
>>>> -		of_node_put(node);
>>>> -		return;
>>>> -	}
>>>> -	of_node_put(node);
>>>> +		if (riscv_of_processor_hartid(node) < 0)
>>>> +			continue;
>>>>
>>
>>>> -	for (i = 0; i < strlen(isa); ++i)
>>>> -		elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
>>>> +		if (of_property_read_string(node, "riscv,isa", &isa)) {
>>>> +			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
>>>> +			return;
>>>
>>> Did you want "continue" here to continue processing the other harts?
>>
>> Hmm. If a cpu node doesn't have isa in DT, that means DT is wrong. A
>> "continue" here will let user space use other harts just with a warning
>> message?
>>
>> Returning here will not set elf_hwcap which forces the user to fix the
>> DT. I am not sure what should be the defined behavior in this case.
>>
>> Any thoughts ?
> 
> The problem is that the proposed code might still set elf_hwcap -- it
> all depends on the order of the hart nodes in dt (i.e. it will only be
> left unset if the first node is malformed).
> 
> For that reason, I'd say it's better to either bail out (hard or at
> least with elf_hwcap unset) or to continue processing the other nodes.
> 
> The former might break current systems with malformed dt, though.
> 
> And since the harts are expected to have the same ISA, continuing the
> processing while warning and ignoring the malformed node might be
> acceptable.
> 

ok. I will change it to continue unless somebody else has objection.

Thanks for the review.

Regards,
Atish
> Johan
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
