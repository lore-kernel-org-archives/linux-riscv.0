Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F94EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 10:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCHXtZZAa92euXUNUAua8rty0uuW5sPhRsU4qIsAI0s=; b=jyhlQrNMtO/dRO
	Fsro1NmWmyI60kTM1rJDhNRxF+QGjFm2+BnW2T6Y9INR6qZuMq9J/JlhqO7iZUJWBBZpeHnklKFLR
	wqTpd7wDEGabfuU+ONPX7CrQkCS0nhWhEAIrF+5SFmxrYm/OBMI+BTnf8MUIOZLpxn7L3gEyalEar
	6t3qd2Kde8F3RiqUTRURf7zkYct2dZVZqRWRdSOmJoKHM1oTvO9yUJH30eHcj/FRZwGt6eGlvJo/G
	XNdIDXJgBLS0bIwnx7KL1nmtUJa0n9QZNYXrRTJLPhou9X5iQTyY47vRNtJzLAi8ewkoIU4GrWU6r
	HhB5khi1D9hyHy7lwnkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA6qW-00069Q-1C;
	Fri, 16 Jun 2023 10:38:24 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA6qT-00067W-2G
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 10:38:23 +0000
Received: from [167.98.27.226] (helo=[10.35.6.111])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qA6pq-009MRH-P8; Fri, 16 Jun 2023 11:37:43 +0100
Message-ID: <8525e073-90cd-dde7-5d4b-e4309cd3a657@codethink.co.uk>
Date: Fri, 16 Jun 2023 11:37:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
Content-Language: en-GB
To: Conor Dooley <conor.dooley@microchip.com>, Eric Lin <eric.lin@sifive.com>
Cc: conor@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 maz@kernel.org, chenhuacai@kernel.org, baolu.lu@linux.intel.com,
 will@kernel.org, kan.liang@linux.intel.com, nnac123@linux.ibm.com,
 pierre.gondois@arm.com, huangguangbin2@huawei.com, jgross@suse.com,
 chao.gao@intel.com, maobibo@loongson.cn, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dslin1010@gmail.com, Zong Li <zong.li@sifive.com>,
 Nick Hu <nick.hu@sifive.com>
References: <20230616063210.19063-1-eric.lin@sifive.com>
 <20230616063210.19063-4-eric.lin@sifive.com>
 <20230616-renovate-country-12b9873b4494@wendy>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230616-renovate-country-12b9873b4494@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_033821_739140_08774A03 
X-CRM114-Status: GOOD (  17.83  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 16/06/2023 11:10, Conor Dooley wrote:
> Hey Eric,
> 
> On Fri, Jun 16, 2023 at 02:32:10PM +0800, Eric Lin wrote:
>> This add YAML DT binding documentation for SiFive Private L2
>> cache controller
>>
>> Signed-off-by: Eric Lin <eric.lin@sifive.com>
>> Reviewed-by: Zong Li <zong.li@sifive.com>
>> Reviewed-by: Nick Hu <nick.hu@sifive.com>
> 
> Firstly, bindings need to come before the driver using them.
> 
>> ---
>>   .../bindings/riscv/sifive,pL2Cache0.yaml      | 81 +++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/riscv/sifive,pL2Cache0.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/sifive,pL2Cache0.yaml b/Documentation/devicetree/bindings/riscv/sifive,pL2Cache0.yaml
>> new file mode 100644
>> index 000000000000..b5d8d4a39dde
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/riscv/sifive,pL2Cache0.yaml
> 
> Cache bindings have moved to devicetree/bindings/cache.
> 
>> @@ -0,0 +1,81 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +# Copyright (C) 2023 SiFive, Inc.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/riscv/sifive,pL2Cache0.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SiFive Private L2 Cache Controller
>> +
>> +maintainers:
>> +  - Greentime Hu  <greentime.hu@sifive.com>
>> +  - Eric Lin      <eric.lin@sifive.com>
> 
> Drop the alignment here please.
> 
>> +
>> +description:
>> +  The SiFive Private L2 Cache Controller is per hart and communicates with both the upstream
>> +  L1 caches and downstream L3 cache or memory, enabling a high-performance cache subsystem.
>> +  All the properties in ePAPR/DeviceTree specification applies for this platform.
> 
> Please wrap before 80 characters.
> 
>> +
>> +allOf:
>> +  - $ref: /schemas/cache-controller.yaml#
>> +
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - sifive,pL2Cache0
>> +          - sifive,pL2Cache1
> 
> Why is this select: required?
> 
>> +  required:
>> +    - compatible
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - sifive,pL2Cache0
>> +          - sifive,pL2Cache1
> 
> What is the difference between these? (and drop the caps please)
> 
> Should this also not fall back to "cache"?

I thought cache is required as the last resort.
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
