Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C765C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 08:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+zlGtJ1jEK1MwJ8/Vt0A8K07Pquur/Iu2laPE0UXqQ=; b=xorG0tX13nRMRR
	KHEdtshoU64ptMDMaCiBXH9v/P2WU+QYJ4N+Horgj9ZxrHd4fPgzvpzKURBwFQf9e/PF/+358lH/E
	UTakHw93hZORDDrFGJdeFTsZ/Hgrx20ztGEnCoVT2N5Oy0h/B/04/65zFo0J0y2bgJb6l/Plca+TY
	YMdRUqt1AM0HThELDAmFt967PsxJJAfXqymhRgrE/5f8lSNAUj7mFGbQHt/CMK8EwLvXCwc48CNh9
	EJ4BMkzcwlNiGjCRuBNTYMGgcDglpo7N0fzadb3A57ONPUwABDnyLpv8qjRf1rlYmNZ2fncMJ/kU1
	94J9zIQNIbAK2p4zED5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOg8-006H11-R7; Tue, 22 Nov 2022 08:30:52 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOfj-006Gnj-Bq
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 08:30:29 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 81FEC24E238;
	Tue, 22 Nov 2022 16:30:08 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 22 Nov
 2022 16:30:08 +0800
Received: from [192.168.125.96] (113.72.144.23) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 22 Nov
 2022 16:30:07 +0800
Message-ID: <2fd4d4f0-eade-3496-1b03-d980b190b3d5@starfivetech.com>
Date: Tue, 22 Nov 2022 16:30:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 1/4] dt-bindings: power: Add StarFive JH7110 power
 domain definitions
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
 <20221118133216.17037-2-walker.chen@starfivetech.com>
 <bc853d76-5b65-676a-040a-edf53034c9ad@linaro.org>
 <98866fec-e88a-f241-bb42-78d33f051f11@starfivetech.com>
 <65323df3-1102-8d95-7c13-80d9756c7c33@linaro.org>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <65323df3-1102-8d95-7c13-80d9756c7c33@linaro.org>
X-Originating-IP: [113.72.144.23]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_003027_630142_462455DF 
X-CRM114-Status: GOOD (  13.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022/11/22 16:03, Krzysztof Kozlowski wrote:
> On 22/11/2022 08:46, Walker Chen wrote:
>> On 2022/11/21 18:12, Krzysztof Kozlowski wrote:
>>> On 18/11/2022 14:32, Walker Chen wrote:
>>>> Add power domain definitions for the StarFive JH7110 SoC.
>>>>
>>>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>>>> ---
>>>>  include/dt-bindings/power/jh7110-power.h | 18 ++++++++++++++++++
>>>>  1 file changed, 18 insertions(+)
>>>>  create mode 100644 include/dt-bindings/power/jh7110-power.h
>>>>
>>>> diff --git a/include/dt-bindings/power/jh7110-power.h b/include/dt-bindings/power/jh7110-power.h
>>>> new file mode 100644
>>>> index 000000000000..24160c46fbaf
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/power/jh7110-power.h
>>>
>>> Filename matching compatible or bindings file.
>> 
>> So the file name should be changed to "starfive,jh7110-power.h" and the compatible in the driver 
>> should also be changed to "starfive,jh7110-power". Is it right ?
> 
> I said filename should be changed. I don't remember what was your
> compatible, but if I did not comment there, in means it looked fine.
> 
>> 
>>>
>>>> @@ -0,0 +1,18 @@
>>>> +/* SPDX-License-Identifier: (GPL-2.0) */
>>>
>>> Dual license for bindings.
>> 
>> Ok, the license will be changed to GPL-2.0 or MIT in the patch v2. 
> 
> Any reasons why not using the licenses recommended by checkpatch?
> 
Well, it sounds like a better way to decide which license to use by checkpatch.
Thanks for your tip.

Best Regards,
Walker Chen


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
