Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659EDC32789
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 20:34:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05B3B2081F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 20:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="riRDpt6N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ITEPdSvn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05B3B2081F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rFncGRtWvkI3K4WVpUJLLrm2jRltBx4+msSEMqOusR4=; b=riRDpt6Ngyj86S7vDXwHbmFUI
	Ht9X0NDtsD0IxbAnFfuBmjg71QeEyN0mOKSQgyQbr3ZpmOviOMp3oKJDOZYaMjYA3Zo/AwhMg7Iqc
	jdTPmd5XcRg96wVYTuzsY30oTO/8+Utz0YmWEEhm1wyIvQjFSXWPlsI2XVNAXjVuz7JMVsdJcBdbr
	45bp0t6scAKGcF2K+RfnJGMTjcVP6ieOblpNoBW9QuWdelmFfnDVmXYrzFD4lfL/lFXFcp0l/kqr8
	95NM5bwvQa58YEztXidVc+sYZQ6DTY4RjpgfpmVLW6l9B4EI6Ay4SqXENmJjgt6ZXCwzfXj8QD8Ow
	XajtQk8VQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIg98-0002VB-So; Fri, 02 Nov 2018 20:34:22 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIg94-0002Tt-U3
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 20:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1541190859; x=1572726859;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=pW4aDx5pzVmJiBqjnCTvIlhWDrIUp+KXcHKEyjPl4kk=;
 b=ITEPdSvnsulSKNjLVBEfBLLlGAelNEz3ecSIgk4gXlRf0Fmo7ILxbzqr
 Fa4c7gyEi07Rxpr0EVr8vNVbTWBIICG7p/YYRi/OCQB4vtNEadrQDjsxf
 eiTmjHgfn9PgU9TAmFdygldREuNcjD2Ixu1Jq5re5aRxaLvm1mw3KwrPN
 /xLjHcG42bUvZixBB92uKLdrOvJDRZqkpfZ7Pk7k4oTaNNDs5/UHiC6uS
 chXr0OphG1q+VyAWiLvLqdGZEZDP0brpl55iw43B6xPaB0GP5KEnOeBMA
 p5sDqEB4Y1oX6bOC97iPAqbrArWWxnvLkgyPbsZAGBR8aJfnC7fiH63d/ A==;
X-IronPort-AV: E=Sophos;i="5.54,457,1534780800"; d="scan'208";a="93413670"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Nov 2018 04:34:07 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 02 Nov 2018 13:18:01 -0700
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.69.187])
 ([10.111.69.187])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Nov 2018 13:34:07 -0700
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
To: Rob Herring <robh+dt@kernel.org>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <1541113468-22097-2-git-send-email-atish.patra@wdc.com>
 <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <954ec7be-f7ba-4e00-70fe-130cb4b84e61@wdc.com>
Date: Fri, 2 Nov 2018 13:34:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181102_133419_378049_C2708660 
X-CRM114-Status: GOOD (  27.70  )
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
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102203406.CcnMEqnWKHCuLiByeJtE9oow0skob22FT_9_JaCBreA@z>

On 11/2/18 6:09 AM, Rob Herring wrote:
> On Thu, Nov 1, 2018 at 6:04 PM Atish Patra <atish.patra@wdc.com> wrote:
>>
>> Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
>> But it doesn't need a separate thread node for defining SMT systems.
>> Multiple cpu phandle properties can be parsed to identify the sibling
>> hardware threads. Moreover, we do not have cluster concept in RISC-V.
>> So package is a better word choice than cluster for RISC-V.
> 
> There was a proposal to add package info for ARM recently. Not sure
> what happened to that, but we don't need 2 different ways.
> 
> There's never going to be clusters for RISC-V? What prevents that?
> Seems shortsighted to me.
> 

Agreed. My intention was to keep it simple at first go.
If package node is added, that would work for us as well.

>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   .../devicetree/bindings/riscv/topology.txt         | 154 +++++++++++++++++++++
>>   1 file changed, 154 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/riscv/topology.txt
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/topology.txt b/Documentation/devicetree/bindings/riscv/topology.txt
>> new file mode 100644
>> index 00000000..96039ed3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/riscv/topology.txt
>> @@ -0,0 +1,154 @@
>> +===========================================
>> +RISC-V cpu topology binding description
>> +===========================================
>> +
>> +===========================================
>> +1 - Introduction
>> +===========================================
>> +
>> +In a RISC-V system, the hierarchy of CPUs can be defined through following nodes that
>> +are used to describe the layout of physical CPUs in the system:
>> +
>> +- packages
>> +- core
>> +
>> +The cpu nodes (bindings defined in [1]) represent the devices that
>> +correspond to physical CPUs and are to be mapped to the hierarchy levels.
>> +Simultaneous multi-threading (SMT) systems can also represent their topology
>> +by defining multiple cpu phandles inside core node. The details are explained
>> +in paragraph 3.
> 
> I don't see a reason to do this differently than ARM. That said, I
> don't think the thread part is in use on ARM, so it could possibly be
> changed.
> 
>> +
>> +The remainder of this document provides the topology bindings for ARM, based
> 
> for ARM?
> 

Sorry for the typo.

>> +on the Devicetree Specification, available from:
>> +
>> +https://www.devicetree.org/specifications/
>> +
>> +If not stated otherwise, whenever a reference to a cpu node phandle is made its
>> +value must point to a cpu node compliant with the cpu node bindings as
>> +documented in [1].
>> +A topology description containing phandles to cpu nodes that are not compliant
>> +with bindings standardized in [1] is therefore considered invalid.
>> +
>> +This cpu topology binding description is mostly based on the topology defined
>> +in ARM [2].
>> +===========================================
>> +2 - cpu-topology node
> 
> cpu-map. Why change this?
> 
To my ears, it felt a better name. But I don't mind dropping it in favor 
of cpu-map if we are going to standardize cpu-map for both ARM & RISC-V.

> What I would like to see is the ARM topology binding reworked to be
> common or some good reasons why it doesn't work for RISC-V as-is.
> 

IMHO, ARM topology can be reworked and put it in a common place so that 
RISC-V can leverage that.

My intention for this RFC patch was to start the ball rolling on cpu 
topology in RISC-V and see if DT approach is fine with everybody. I 
would be happy to see ARM code to move it to a common code base where 
RISC-V can reuse it.


Regards,
Atish
> Rob
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
