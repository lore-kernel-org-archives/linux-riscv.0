Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C84C87FC9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=9JKSUIs7nbMLRKNxnfKBqIJWYhf3NdDWoG4ItnP7QJU=; b=qgQ5tcjo7p8J3u
	dgsNGOBSxkqhp6IiKc1nNHFnGcsmxjFxn5MBZTzER1XhgdaQjLuTIoUi5phN0/0xyQSO3ZcLzFQ9v
	zwhLRHno3WFjSlUTP9RM2DLn4oM6YKwRxxrpNLA/6bPHGxcjoAFKtB2YTquRKBzQG0eXhcc205Q8S
	4ph/kBEMlG8FUgL6M+bcQbG4DA2A03IGBcmrbxLU1VO00wg/04/mUJ2n3fHFAZVIV+U+UMHQTLybR
	7N/FqkJr6Log5BizO2NdWzB8ArzPzmSjxDoHiMTJv5GC1PGCPMlzyA01BknDBT8GmadwJqrLdUATE
	u06yW3hciPqMZlyGt1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3c6-00000001Bmw-2CvF;
	Wed, 30 Jul 2025 10:00:46 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3c3-00000001Bm8-37Ow
	for linux-riscv@lists.infradead.org;
	Wed, 30 Jul 2025 10:00:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753869630; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mVHba9e1imXwc9oD9l4XIa6BmxmDyMn1i5zBQhdL1EHhgFhOCoBjMS6p+Xu6+AkQKrV+UiyEtdDfxgKxFhbhJuAJ07U4rSgoxmkmTPKKt/AuJ0hLKaJF4t2L7K4AOvfdp5EFnu3Mj78fsV//6cDdVQ/R+0zfY2aSIcJWLNPg064=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753869630; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dJCJxzbcOMXSmaYqhU1ZQU8GEIkWpngcSTaDLY085mc=; 
	b=a7B0WqvQuQRZzbOpb3be2Pa+L+PzdEu8xYwPWcO6HkgCKYmILU3RZp45NltHPZawUXfOoiVL2gGFbfIGBOuRQyqp/8nDcjzKKujEF3/WCYOSRDyjdyTuE+QykeXoPO7sWkXinJFG4qWslKA+/ID9pfd8F8cNK04TUMyk5iNHLtc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753869630;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dJCJxzbcOMXSmaYqhU1ZQU8GEIkWpngcSTaDLY085mc=;
	b=RNigQPZElgWg3b6atXoHhURBwH86YwWzXDl8JABOLq9JHNgbWcJ2FaPCBqfDiCvw
	zg6hxEpoZubFOrlUmDDlsKGESC3cp2rK7SMFWwf+lqONIOk4DwGwOsroZryDclFHl/o
	+ASps9v37kbVzoihpWNMHbSJR2M3FX147xXFh/58=
Received: by mx.zohomail.com with SMTPS id 17538696277121019.2099092907802;
	Wed, 30 Jul 2025 03:00:27 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, 
	"Bjorn Andersson" <andersson@kernel.org>, 
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Inochi Amaoto" <inochiama@gmail.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>
In-Reply-To: <9dd2af04-5109-43e4-b097-d6b1b4c45dbd@kernel.org>
Cc: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<sophgo@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] drivers: remoteproc: Add C906L controller for Sophgo
	 CV1800B SoC
Message-ID: <1856ff20ba2bf450.56ed58d65d21d4ef.5a222480fa1019f2@Jude-Air.local>
Date: Wed, 30 Jul 2025 10:00:20 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_030043_841981_6F44B49C 
X-CRM114-Status: GOOD (  15.18  )
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

On 30/07/2025 11:35, Krzysztof Kozlowski wrote:
> On 30/07/2025 11:27, Junhui Liu wrote:
>> On 30/07/2025 08:46, Krzysztof Kozlowski wrote:
>>> On 28/07/2025 13:03, Junhui Liu wrote:
>>>> +
>>>> +static int cv1800b_c906l_mem_alloc(struct rproc *rproc,
>>>> +				   struct rproc_mem_entry *mem)
>>>> +{
>>>> +	void __iomem *va;
>>>> +
>>>> +	va = ioremap_wc(mem->dma, mem->len);
>>>> +	if (!va)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	/* Update memory entry va */
>>>> +	mem->va = (void *)va;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int cv1800b_c906l_mem_release(struct rproc *rproc,
>>>> +				     struct rproc_mem_entry *mem)
>>>> +{
>>>> +	iounmap((void __iomem *)mem->va);
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int cv1800b_c906l_add_carveout(struct rproc *rproc)
>>>> +{
>>>> +	struct device *dev = rproc->dev.parent;
>>>> +	struct device_node *np = dev->of_node;
>>>> +	struct of_phandle_iterator it;
>>>> +	struct rproc_mem_entry *mem;
>>>> +	struct reserved_mem *rmem;
>>>> +	int i = 0;
>>>> +
>>>> +	/* Register associated reserved memory regions */
>>>> +	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
>>>> +	while (of_phandle_iterator_next(&it) == 0) {
>>>> +		rmem = of_reserved_mem_lookup(it.node);
>>>> +		if (!rmem) {
>>>> +			of_node_put(it.node);
>>>> +			return -EINVAL;
>>>> +		}
>>>> +
>>>> +		if (!strcmp(it.node->name, "vdev0buffer")) {
>>>
>>> Why are you adding undocumented ABI? And so hidden, not even using
>>> standard OF API!
>>>
>>> How does this behaves when I change your DTS to call it
>>> "whateverbuffer"? Does it work? Obviously not.
>>>
>>> No, stop doing that.
>> 
>> Yes, you're right. I will consider introducing a "memory-region-names"
>> property in the bindings, instead of relying on the node labels directly.
> 
> 
> You don't need it. First, you use some old code as template, but you
> should look how or re-use Rob's code rewriting this completely.

Sorry, I didn't catch up with that patch. I will look into it and update
my implementation accordingly.

> 
> Second, list has strict order, so you know exactly where the vdev0
> buffer is. It cannot be on any other position of the list.

Thanks for the advice, I will use the order in the list to identify the
memory region.

> 
> This is why you define the ABI. Use then the ABI.
> 

Understood, I will reconsider this.

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
