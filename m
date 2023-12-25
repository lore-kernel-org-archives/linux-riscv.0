Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F948C3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Dec 2023 06:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7CTmOkVY9Mn1u9KkJshg1HCFx0NH2aKQlDxB9tOkBY=; b=Xko5u2KGpeeAht
	T8m3N9bZ53/WPx4Iwg3oSsdk76UQK1Bp9B1rUt53WD125cURnXqOQE1jOxL6vNNqMPYpWVBZG/MLf
	GVgOKJGvUWgNl3Ck9aK3qNCcA8HJ/jKkuCcsH/lJBcvTET3CzVU/IPwxaoRuBvHeCBGSyxuNMew1F
	rFZnDJNwmnNW7KXy/H/8OwF2glO1V0rM7f+6LNMnTq5jv48uXJNs2YUx4gm0OOR0m/EiLhklM17hs
	1Vla45upWYIg6VVkfyxR+FyDoFsDypxibu2SHpuXwwBQh9KCNd9tjs3XaCF9Ck0h99QamPyv+4yFs
	uCIRwvm4E/p9T2pEnc/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHekV-00AHxV-08;
	Mon, 25 Dec 2023 06:47:39 +0000
Received: from smtp59.i.mail.ru ([95.163.41.97])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHekR-00AHum-18
	for linux-riscv@lists.infradead.org;
	Mon, 25 Dec 2023 06:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=ZVQuOYmwEHuM5XKAZpHVSjLI7J3iBPBYdoi//aGKLWo=; t=1703486847; x=1703576847; 
	b=HLuLimDPbSfNqC6LRKU38z60/JC64NGQVPkHGkK7nv6FA5a7hlP8PMP6FePYK7D1LI3iqdfDKm3
	sTiiDBDbtAsmt3j2yTEwUv0RxVlovrlE8xiRqjb5D/67s/YXkjhvt3ix7MWC+CcxCIJj1BkCxELfw
	PYi+D2ip4V8CWQ+1B9Pi5SnZ4T+YsJZIlJcazRuweQ+prqEWKb1Y2/RxabbYqRe/l9GWqOeTKcIga
	q9U7O/kwPOwKwRuLEpCy3UMY/k4VqL+ZEU4gsWJ8xo1iebLWowcIoX668VYZ3FLfN4kbAJhDQfI/w
	WN1knFrVGEbbLghAJ2GloI6fXTZmfRjlt/sw==;
Received: by smtp59.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1rHekE-009eYu-2z; Mon, 25 Dec 2023 09:47:23 +0300
Message-ID: <15b89089-3dcd-4668-8d8b-d12ff0684c29@inbox.ru>
Date: Mon, 25 Dec 2023 09:47:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: set ARCH_DMA_DEFAULT_COHERENT if
 RISCV_DMA_NONCOHERENT is not set
To: Christoph Hellwig <hch@lst.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, mpe@ellerman.id.au,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com
References: <20231221185152.327231-1-fido_max@inbox.ru>
 <20231221-discount-decade-e306e5878c46@spud>
 <f31d929c-fa0a-4046-be05-38e92afa5d92@flygoat.com>
 <20231222041428.GA2803@lst.de>
 <c53c22dd-c482-4808-bdd7-e81c01c04f9e@inbox.ru>
 <20231222-outburst-spoiling-75082a7826dd@spud>
 <be10eb21-a0ef-416e-9c0c-d53326996fba@inbox.ru>
 <7bc138f7-d5e9-471a-ae82-d6c490645623@flygoat.com>
 <6fe34090-656d-491f-8173-217d20144166@inbox.ru>
 <a25d3736-f6ca-478d-8e58-69a7c0e529f7@flygoat.com>
 <20231223045912.GA21836@lst.de>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20231223045912.GA21836@lst.de>
Authentication-Results: smtp59.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9F008C97756F746CA9853402441EE20032119B858DB59C778182A05F538085040986FCBB8A925D5F475F0417F076C73185FB4EA8E402442D05768CE8C622266E2
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE758E3775C3D7FDEE4EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371D5B197C6EC5B4BE8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D83AD0BF8CF0170FB76696B6922158C4156F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE722C7672CDBCC22789FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751F6FD1C55BDD38FC3FD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BECADA55FE5B58BB7A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C22494854413538E1713FE827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B613439FA09F3DCB32089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A5A3C9806DACBCE033377567E5205B5A14023B1F181720444CF87CCE6106E1FC07E67D4AC08A07B9B064E7220B7C550592CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D349DAEDEF7DE8FDCFA67386229D68C71107CF6FECE50B47508A932DE05DA03714EE46E6BE8F284D2A41D7E09C32AA3244C150DE34F8A10177BC229AC083F2D827B8580396430872480AFF760E3CF2A505DB6C6411D86935C892AB2189BCAD71E73D640157F23F2FFE137E69C174A41D00C
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojY17BwQnFUO9L+9ndg73XQQ==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE3318CD48E73CD6507B274A3ACFCC61BC0F98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231224_224735_726626_03024746 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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



On 23.12.2023 07:59, Christoph Hellwig wrote:
> On Fri, Dec 22, 2023 at 04:01:43PM +0000, Jiaxun Yang wrote:
>>>
>>> But arch_setup_dma_ops() is called only from of_dma_configure_id() and
>>> acpi_dma_configure_id(). So it works only for DT and ACPI devices. What
>>> about platform_device?
>>
>> Ah I see, that's the problem, in MIPS's use case all DMA capable devices
>> are following platform's default coherency. For RISC-V we assume all device
>> are enabled by ACPI or DT.
>>
>> Perhaps you can override it in driver, but that will make drivers platform
>> dependent.
>>
>> I'll leave this question to Christoph.
> 
> I've already said it.  You must not have DMA capable devices that aren't
> declared in ACPI or OF, just like on any modern Linux platform.

Ok. I've got the point. Thank you for clarification.

> 
> What devices are you concerned about anyway Maxim?

I have 3rd party external out of tree camera driver. csi, isp, dewarp 
components are OF, but common media device is created as 
platform_device. I will convert is to OF.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
