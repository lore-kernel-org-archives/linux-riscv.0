Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C13C47DB7
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 21:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qghdBBPHyJcXba2hDgLR3WaVGxxlTfmEqUvhxolO+Dk=; b=qAvbDFdK5yDtFp
	GsgT4hPMcXKLJO+7uogEFNn9D8JZi/f/6DzIb/IjMjUGkmYLTsEixi8CnmvAmrPLt+8ZAiL8flZiL
	/tOQSaSZHU3g5YKvHgevgVBSLsdjMbv5oKhQj631pWgGpfLMVCzMGh1aMYDZ0pRY6Q9TsYwLxPDIq
	va4nBi4GGpaTDzUJcDeK/zixZqSeZP9qlr/UARX3lkMTL8tIg7RsZh9unNgFNXpfkZfMkizoIqZ6N
	0ldR84bDOFEuNIWWDsu+uYLrwkrzTWrrR6ZV3hktGOYAMayJwMAf3BC6YU/hlGWd3h57n7P4CoTyE
	3PjQfGRfmccRqEgUFcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQZsB-003uA4-0w;
	Thu, 18 Jan 2024 21:24:27 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQZs7-003u6o-2L
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 21:24:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF6FC20003;
	Thu, 18 Jan 2024 21:24:16 +0000 (UTC)
Message-ID: <3fc9e255-2363-4255-80dd-602f886cab27@ghiti.fr>
Date: Thu, 18 Jan 2024 22:24:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jan 18 (arch/riscv/mm/init.c)
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <20240118143152.3c34b117@canb.auug.org.au>
 <344dca85-5c48-44e1-bc64-4fa7973edd12@infradead.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <344dca85-5c48-44e1-bc64-4fa7973edd12@infradead.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_132423_916312_34ACB567 
X-CRM114-Status: GOOD (  14.41  )
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

Hi Randy,

On 18/01/2024 18:47, Randy Dunlap wrote:
>
> On 1/17/24 19:31, Stephen Rothwell wrote:
>> Hi all,
>>
>> News: the merge window has opened, so please do not add any material
>> intended for v6.9 to your linux-next included branches until asfter
>> v6.8-rc1 has been released.
>>
>> Changes since 20240117:
>>
> on riscv 32-bit:
>
> ../arch/riscv/mm/init.c: In function 'setup_vm':
> ../arch/riscv/mm/init.c:1063:34: error: 'PAGE_OFFSET_L3' undeclared (first use in this function); did you mean 'PAGE_OFFSET'?
>   1063 |         kernel_map.page_offset = PAGE_OFFSET_L3;
>        |                                  ^~~~~~~~~~~~~~
>        |                                  PAGE_OFFSET
> ../arch/riscv/mm/init.c:1063:34: note: each undeclared identifier is reported only once for each function it appears in
>
>
> PAGE_OFFSET_L3 is only defined for CONFIG_64BIT.
>
>
> Full randconfig file is attached (fwiw).


Thanks for the report, I sent a fix here: 
https://lore.kernel.org/linux-riscv/20240118212120.2087803-1-alexghiti@rivosinc.com/T/#u

Alex


>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
