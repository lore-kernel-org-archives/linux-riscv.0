Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932BAC4743E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 02:14:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4420061164
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 02:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4420061164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JQODe632vYJkmIJ4E2B/o93KzJZx1WipXcSjeUgqxE=; b=bftroyVVgBlGJVPiiuGWh77x12
	h+NkEfrR7wSdPa5hpcBrgRHveWRTAfRMpcewx673BnA929/0H90M2MxPwkQrdbXM75WHmQcMpWMlU
	/aScGuzvSfmtycwRLEE0mwseE9uDVCsyTOZu0wWqXuI3kYwcEbUyq7B/6XW03Tbz1oJD7VBpbLuJX
	RP68MP1pLXC+BDK/P83gkoDh3LHkOdgaJE9/C6dMu7L7K44kFF5o0xmHQwjKEgHun5Rbk3lH18kmE
	+uib4io0WtSygL/FxMUGhi4wCeNBOfVweag7e6YFxaWUrY3VdepxGx1RTULe/JuVesxnMyTsB5R3A
	cOHNPtMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq4lo-001Ehl-8n; Mon, 07 Jun 2021 02:13:40 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq4lk-001Egx-79
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 02:13:39 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FyxcM5BTdz1BJhS;
 Mon,  7 Jun 2021 10:08:35 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 10:13:24 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 10:13:24 +0800
Subject: Re: [PATCH] Documentation: dt-bindings: Fix incorrect statement
To: Rob Herring <robh@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <wanghaibin.wang@huawei.com>
References: <20210521095720.5592-1-wangyanan55@huawei.com>
 <20210604194159.GA3781429@robh.at.kernel.org>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <ee384af8-bdbe-db06-ce56-1c1f5bb7b49d@huawei.com>
Date: Mon, 7 Jun 2021 10:13:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210604194159.GA3781429@robh.at.kernel.org>
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme708-chm.china.huawei.com (10.1.199.104) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_191337_410336_95C969FE 
X-CRM114-Status: GOOD (  18.57  )
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



On 2021/6/5 3:41, Rob Herring wrote:
> On Fri, May 21, 2021 at 05:57:20PM +0800, Yanan Wang wrote:
>> It's found when reading the Doc.
> Please improve the subject so we have some clue as to what the change is
> and what it applies to.
>   
Ok, I will improve the subject to make it more readable.
>> In a SMP system, the hierarchy of CPUs now can be defined through
>> four not three entities (socket/cluster/core/thread), so correct
>> the statement to avoid possible confusion.
>>
>> Since we are already there, also drop an extra space and tweak
>> the title alignment. No real context change at all.
> Since already here, converting to schema would be preferred over trivial
> fixes.
With pleasure to do this. I will send a v2 including this part of work.

Thanks,
Yanan
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   Documentation/devicetree/bindings/cpu/cpu-topology.txt | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/cpu/cpu-topology.txt b/Documentation/devicetree/bindings/cpu/cpu-topology.txt
>> index 9bd530a35d14..8b23a98c283c 100644
>> --- a/Documentation/devicetree/bindings/cpu/cpu-topology.txt
>> +++ b/Documentation/devicetree/bindings/cpu/cpu-topology.txt
>> @@ -6,7 +6,7 @@ CPU topology binding description
>>   1 - Introduction
>>   ===========================================
>>   
>> -In a SMP system, the hierarchy of CPUs is defined through three entities that
>> +In a SMP system, the hierarchy of CPUs is defined through four entities that
>>   are used to describe the layout of physical CPUs in the system:
>>   
>>   - socket
>> @@ -75,7 +75,7 @@ whose bindings are described in paragraph 3.
>>   
>>   The nodes describing the CPU topology (socket/cluster/core/thread) can
>>   only be defined within the cpu-map node and every core/thread in the
>> -system must be defined within the topology.  Any other configuration is
>> +system must be defined within the topology. Any other configuration is
>>   invalid and therefore must be ignored.
>>   
>>   ===========================================
>> @@ -91,9 +91,9 @@ cpu-map child nodes which do not share a common parent node can have the same
>>   name (ie same number N as other cpu-map child nodes at different device tree
>>   levels) since name uniqueness will be guaranteed by the device tree hierarchy.
>>   
>> -===========================================
>> +============================================
>>   3 - socket/cluster/core/thread node bindings
>> -===========================================
>> +============================================
>>   
>>   Bindings for socket/cluster/cpu/thread nodes are defined as follows:
>>   
>> -- 
>> 2.19.1
> .


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
