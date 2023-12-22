Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C27C46CD4
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 15:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iWCsAKHgTneSLge//syWqrLyPs8NgKs8JpyEd1eABZs=; b=0o7IdardcexTrK
	mzZHqPfyj6ynAST3IKs8vKnCle81cvMBErnPRLN86h4SuY7rwMkgmiS4lpykTiWUUyiJUDV4rKtwZ
	z0Qle4sngmW/f8k9TXAEgsOv91SU48yt9odCfPrKOfqwFm2PIgS+5N1qGhqOPWeSZb8TZh9yhYhgz
	JtSzbL/SMFb5aH71LkC8+lyx2MCdpwcMUcJEkkxWe13Iovuz9IKOqxr0jB2TVKmwVT39VkU7zaQT5
	JJCI7JDHh3XdUbK7sqLEarvxntUknvkupwBYRXjigK6nZStTqCEH+CVZbYaLfSsor0oBrnW+2hvKO
	eCN6qVaJyI4l6P7BjiuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGhba-006GNk-1P;
	Fri, 22 Dec 2023 15:38:30 +0000
Received: from smtp33.i.mail.ru ([95.163.41.74])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGhbX-006GNH-21
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 15:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=85kafTY7KbT+5VtPN9qDg1qFgQrgka1v5iPEHrMhU2k=; t=1703259506; x=1703349506; 
	b=A8ICaG0rX6VgG3JCWAmVZB2mLFOurJEa4KSTH5683Kc8Z+/DanTmNFpcZnssR2ap+HhHGgoyR5H
	ux3ISGaUCrq1tPuJJSji0QsUxODM9G6mhr4zdfU1RUC7aBjtGkp0o9Wk6FHv79NrjTtZzleqPfXLF
	i+hz/f/eXnOoFOk7eObh2Zj03OA/qOkcPb0V3cyHVned/5CDpDWJ1IvRo5dFV/PDemCzolQnpEDm/
	RusefUDXWJm5EUZN1tkOF28GS3lzpc6Sczb6a6qqiKZNjzo2F5WzZj1WrEStjwc8QGvoBpIFWeO/9
	5hAWY8OiwWl/xAHYf1YPvbxmdurYLEVIUC0g==;
Received: by smtp33.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1rGhbT-009rUC-0p; Fri, 22 Dec 2023 18:38:23 +0300
Message-ID: <be10eb21-a0ef-416e-9c0c-d53326996fba@inbox.ru>
Date: Fri, 22 Dec 2023 18:38:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: set ARCH_DMA_DEFAULT_COHERENT if
 RISCV_DMA_NONCOHERENT is not set
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, mpe@ellerman.id.au, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, paul.walmsley@sifive.com
References: <20231221185152.327231-1-fido_max@inbox.ru>
 <20231221-discount-decade-e306e5878c46@spud>
 <f31d929c-fa0a-4046-be05-38e92afa5d92@flygoat.com>
 <20231222041428.GA2803@lst.de>
 <c53c22dd-c482-4808-bdd7-e81c01c04f9e@inbox.ru>
 <20231222-outburst-spoiling-75082a7826dd@spud>
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20231222-outburst-spoiling-75082a7826dd@spud>
Authentication-Results: smtp33.i.mail.ru; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9F008C97756F746CA9F9F626400B4C8CB441F7099A0113699182A05F538085040499B707A292F8483A881DDBE56C0008D58E5AB02939210A3DDD8407079B9EF40
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78044725E6B9C7F2CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006372A1456D053D20C618638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8B963F5DEC411EA029331EB5E595B99A36F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78C592797616C97AB9FA2833FD35BB23D9E625A9149C048EE26055571C92BF10FCB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BEA77C8EAE1CE44B0A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249957A4DEDD2346B42E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6A45692FFBBD75A6A089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 0D63561A33F958A5EA1E7903783D8CAAE0F401BAFC31E2719BBB080C10DF431BF87CCE6106E1FC07E67D4AC08A07B9B082B967D547A19D2FCB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742424CF958EAFF5D571004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34A533D6DF7731C664AC7F76B4FCEA1BEFB0990B5AFB0E23427C2B72958CCAC97D6633305872F7E7A11D7E09C32AA3244CCA61C7B5B7DB41DD740043EEAE3CB8628894E9C85370243EAFF760E3CF2A505DB6C6411D86935C892AB2189BCAD71E73D640157F23F2FFE137E69C174A41D00C
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2irTGYQEnL0dvgbPSlS3lw==
X-Mailru-Sender: 689FA8AB762F7393590D8C940224AE333CD8B99EC2B6F0CA72009BD1587A63E198CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_073827_664503_F0C9EEF5 
X-CRM114-Status: UNSURE (   6.96  )
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



On 22.12.2023 17:54, Conor Dooley wrote:

>> etc..) do not have this feature. These devices will use value from
>> device_initialize(). And we have no possibility to change
>> dma_default_coherent value by disabling ARCH_DMA_DEFAULT_COHERENT.
>> Moreover, changing dma_default_coherent from false to true may cause
>> regression for other devices.
> 
> How can there be a regression when dma has been coherent by default for
> the RISC-V kernel from day 1?

Before ARCH_DMA_DEFAULT_COHERENT patch dma_default_coherent was used 
unassigned as "false" in device_initialize():
..........
#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
	dev->dma_coherent = dma_default_coherent;
#endif
..........
And now it becomes "true". It may change behavior of other non-DT drivers.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
