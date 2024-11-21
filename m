Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439CAD743C9
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 10:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NNrQn/Y0G1AvI4eHCmjBeKVpG1V+NeoBrWEjP99RjA=; b=nOEmwr+o9EjDTx
	uVUvWIy7EYKWZE2snCJNHr5xK0IOCBFBYt2275z61GH+uCC5bOatDdTD2WnYg/TMvfFjPOtjO1ayw
	8HJAFFLJ1H6M/nC1wLbjc/cGgeQ5NQuNKssvNTL4FgCUVMxFLzby1yaozcrExaYrtFQjDbMU4XOZD
	wrm9esntvDzvdSvPdC1KjQY20v9tkygQ3OcLFhvSmZN8PLnTP6Lrybuv1AxY+uDNIm7amabCY5Rv7
	jlMLxVxWYPPwkwuWOWkZoncdPfuPWAlJGC34liTyec4XTAPIBnBEJEQIs/M1xTQK6n9lupokSNXOJ
	zP3eN0rpuktmbmOdPBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4YI-0000000HNWu-1OpO;
	Thu, 21 Nov 2024 10:36:46 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4YF-0000000HNWK-3NF9
	for linux-riscv@lists.infradead.org;
	Thu, 21 Nov 2024 10:36:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B388820016;
	Thu, 21 Nov 2024 10:36:34 +0000 (UTC)
Message-ID: <0456b6b4-1453-444d-8cd8-38715dc9f845@ghiti.fr>
Date: Thu, 21 Nov 2024 11:36:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: Call secondary mmu notifier when flushing the
 tlb
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240328073838.8776-1-alexghiti@rivosinc.com>
 <20241121-e97820f8c09de9bcedfe885d@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241121-e97820f8c09de9bcedfe885d@orel>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_023643_975311_9942A269 
X-CRM114-Status: GOOD (  12.20  )
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

Hi Andrew,

On 21/11/2024 10:32, Andrew Jones wrote:
> On Thu, Mar 28, 2024 at 08:38:38AM +0100, Alexandre Ghiti wrote:
>> This is required to allow the IOMMU driver to correctly flush its own
>> TLB.
>>
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>
>> Changes in v2:
>> - Rebase on top of 6.9-rc1
>>
>>   arch/riscv/mm/tlbflush.c | 39 +++++++++++++++++++++++----------------
>>   1 file changed, 23 insertions(+), 16 deletions(-)
>>
> Hi Alex,
>
> Is this patch still something we need?
>
> Thanks,
> drew


Yes I think so, hopefully it gets merged.

Thanks,

Alex

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
