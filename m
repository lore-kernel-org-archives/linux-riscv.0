Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30635C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 00:12:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B4C2085B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 00:12:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GQMHb37x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LG76icQ3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="VNNNkB5F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00B4C2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C6/uEstLwX12gnsrRxUETe3VaciUTJUs4PO3hQxQwKk=; b=GQMHb37xbu1M9hwnQFuljMr5O
	Fv9+HRsDbQYiO74HP6TNgpTFZu3372mQLhMc87/S/1tGb7YhqIwx6uF8x/3RIe86YyNac5RG6En+n
	MiAAKx17ISVIXUrkiltHvDH/x9LPDmHATnRMhP1D157+ZEBjazmzxjWLj85F41qvApFiOx7gMNFNe
	4NopzSOHT7R2bdkZqC4gjPCanIenyzW0kJszi/T3n1485uNl1T9biY5TXgm7Hr2ZPyIiOg268cu2N
	jI0IbzaNTth4Pot+vCGotzPaNK1R5qYRcAZZw5FhjX85GJcglIQe50W+J0fnUXr8w/I8IHY6SHHOU
	gjPNRJCpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJoyv-0000xg-Fc; Tue, 06 Nov 2018 00:12:33 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJoyt-0000xX-KB
 for linux-riscv@bombadil.infradead.org; Tue, 06 Nov 2018 00:12:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jezPvKc1hJm6dDWaRWT5iq+ZLdyy4/xXH8NKjeIpf8M=; b=LG76icQ3v1N61MIfBC+mb3mvoV
 ws6Hwl9C43NI+EPKzfBTIIW8n6l5n0bDLqhbJUJSDu8wtrSzCtx/7SD0W2SyZjy8OaL1iCet6mZhI
 PPMlEHy/G+ixcwHLoW06+Q1qG7BZ82MV7gvYr+SFoWOBT0Hk/fbKPDbx/F7tRNevxXe8odZ/B+z37
 yDqgmpyjYvkflia1tJU1I+IpTPcbxoKbRN0xAjAPzcC+YmXY4yMPB9w6AyvpkbTbBFa30i3YkODJV
 YdfWMU/HRFLPSkquC/ctbsaa0wCncfXZQbixgP2qHSG1XZnrOQmI5cqmztwP25FuRgSKwcXz4o5Bw
 LUrz10mA==;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJoyq-0002Cs-9C
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 00:12:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1541463160; x=1572999160;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=8a1aL70reaGLohkAFR3PuOjUHcIqIcEdntS639e0iiE=;
 b=VNNNkB5FyhNl7ecv6zoTRkj6PVmqOrA/yQ1zZg6vlTc0NAc8drZsnBUK
 1GGjZZkOBT29g8SLWGiEbcoJdycPraN2B00Y1R4Woi4/+kYIkv/QzWj2J
 ef8hQDeGWJBf0wfsDHmVzZJs3hEMxnmBYoVjvQNjeW9fxdDOlU4QvnsuT
 MBJOodV7SDqghG16F6eEfNAvnrly3NtjeQLxHXrIQEuN9iJE++BqYYIo/
 Iw5FLQc0ewo0dKJZhJyrPxRT6kp5/FfTwbhzbfu71ycsWjSLFy59Fpqfn
 fh9JxI391uAjJDuAvmFKKiBLUt0WVct9aTyg3Bi9KxEF8DqnC2e5dK2S1 A==;
X-IronPort-AV: E=Sophos;i="5.54,469,1534780800"; d="scan'208";a="191317971"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Nov 2018 08:12:16 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 05 Nov 2018 15:55:54 -0800
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.69.187])
 ([10.111.69.187])
 by uls-op-cesaip02.wdc.com with ESMTP; 05 Nov 2018 16:12:12 -0800
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@sifive.com>
References: <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
 <mhng-799bd6f4-e4af-481e-90d8-bdc0e30f2530@palmer-si-x1c4>
 <CAL_JsqJOxdE=gD4MyKuL5XZ57Z6UdM4_SU4qs26BNz6YcqM76A@mail.gmail.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <8b502dca-bf5f-50b8-e1b2-997c6e2ca260@wdc.com>
Date: Mon, 5 Nov 2018 16:12:11 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJOxdE=gD4MyKuL5XZ57Z6UdM4_SU4qs26BNz6YcqM76A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181105_191228_546097_B6FA0782 
X-CRM114-Status: GOOD (  32.95  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "alankao@andestech.com" <alankao@andestech.com>, Zong Li <zong@andestech.com>,
 Anup Patel <anup@brainfault.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106001211.UtTkKK2irfnZvoEKDqbYYAoFIwmh2O4tyQz8D1Eq1CQ@z>

On 11/5/18 12:11 PM, Rob Herring wrote:
> On Mon, Nov 5, 2018 at 1:39 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Fri, 02 Nov 2018 06:09:39 PDT (-0700), robh+dt@kernel.org wrote:
>>> On Thu, Nov 1, 2018 at 6:04 PM Atish Patra <atish.patra@wdc.com> wrote:
>>>>
>>>> Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
>>>> But it doesn't need a separate thread node for defining SMT systems.
>>>> Multiple cpu phandle properties can be parsed to identify the sibling
>>>> hardware threads. Moreover, we do not have cluster concept in RISC-V.
>>>> So package is a better word choice than cluster for RISC-V.
>>>
>>> There was a proposal to add package info for ARM recently. Not sure
>>> what happened to that, but we don't need 2 different ways.
>>>
>>> There's never going to be clusters for RISC-V? What prevents that?
>>> Seems shortsighted to me.
>>>
>>>>
>>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>>> ---
>>>>   .../devicetree/bindings/riscv/topology.txt         | 154 +++++++++++++++++++++
>>>>   1 file changed, 154 insertions(+)
>>>>   create mode 100644 Documentation/devicetree/bindings/riscv/topology.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/riscv/topology.txt b/Documentation/devicetree/bindings/riscv/topology.txt
>>>> new file mode 100644
>>>> index 00000000..96039ed3
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/riscv/topology.txt
>>>> @@ -0,0 +1,154 @@
>>>> +===========================================
>>>> +RISC-V cpu topology binding description
>>>> +===========================================
>>>> +
>>>> +===========================================
>>>> +1 - Introduction
>>>> +===========================================
>>>> +
>>>> +In a RISC-V system, the hierarchy of CPUs can be defined through following nodes that
>>>> +are used to describe the layout of physical CPUs in the system:
>>>> +
>>>> +- packages
>>>> +- core
>>>> +
>>>> +The cpu nodes (bindings defined in [1]) represent the devices that
>>>> +correspond to physical CPUs and are to be mapped to the hierarchy levels.
>>>> +Simultaneous multi-threading (SMT) systems can also represent their topology
>>>> +by defining multiple cpu phandles inside core node. The details are explained
>>>> +in paragraph 3.
>>>
>>> I don't see a reason to do this differently than ARM. That said, I
>>> don't think the thread part is in use on ARM, so it could possibly be
>>> changed.
>>>
>>>> +
>>>> +The remainder of this document provides the topology bindings for ARM, based
>>>
>>> for ARM?
>>>
>>>> +on the Devicetree Specification, available from:
>>>> +
>>>> +https://www.devicetree.org/specifications/
>>>> +
>>>> +If not stated otherwise, whenever a reference to a cpu node phandle is made its
>>>> +value must point to a cpu node compliant with the cpu node bindings as
>>>> +documented in [1].
>>>> +A topology description containing phandles to cpu nodes that are not compliant
>>>> +with bindings standardized in [1] is therefore considered invalid.
>>>> +
>>>> +This cpu topology binding description is mostly based on the topology defined
>>>> +in ARM [2].
>>>> +===========================================
>>>> +2 - cpu-topology node
>>>
>>> cpu-map. Why change this?
>>>
>>> What I would like to see is the ARM topology binding reworked to be
>>> common or some good reasons why it doesn't work for RISC-V as-is.
>>
>> I think it would be great if CPU topologies were not a RISC-V specific thing.
>> We don't really do anything different than anyone else, so it'd be great if we
>> could all share the same spec and code.  Looking quickly at the ARM cpu-map
>> bindings, I don't see any reason why we can't just use the same thing on RISC-V
>> -- it's not quite how I'd do it, but I don't think the differences are worth
>> having another implementation.  Mechanically I'm not sure how to do this:
>> should there just be a "Documentation/devicetree/bindings/cpu-map.txt"?
> 
> Yes, but ".../bindings/cpu/cpu-topology.txt".
> 
> And if we need $arch extensions, they can be moved there. (Really, I'd
> like to get rid of /bindings/$arch/* except for maybe a few things.)
> 
>> If everyone is OK with that then I vote we just go ahead and genericise the ARM
>> "cpu-map" stuff for CPU topology.  Sharing the implementation looks fairly
>> straight-forward as well.
> 
+1 for a common code base. I am happy to take it up if nobody else has 
not already started working on it.

Is there a ARM hardware test farm that can be used to test such changes?

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
