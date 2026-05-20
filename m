Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C12BCD4F3D
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 16:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Tg+9zKcRLAyQEUxlk6yC1X92zMS3mYM0+a8aoI4r6M=; b=xoizIKRuV22l3x
	1hSFfEhalo96GDNjeeNn5mNrTFhEyAB6aNZawZ9Hj4YdDENxirJsp6RxQDOjeFfH0YXPRT4lvxmgg
	VrRQ/85wR8VDIxh0vkx3M9a6pKn78hSvQD3E4TfJIATJikqdsWO3N952VcYxlAQyV2g8oN2JsgCSn
	KqaUZ71EOIQLa0fxPCHJWMuto0lUQzocpEBv4pKGaM09GGzM83peSMLBaKpdCVlVUIUNEvuNNJCEe
	JZSC2drOv9jVHEziKdhYI9tKbwTggZ1rJ7V0+hSFrsco0oNLogpuLi8qOqKs1+dt6GQ/cKslI3l9V
	1G1wyxob/18Tj6sTDlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjYi-000000058OX-2yp5;
	Wed, 20 May 2026 16:14:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjYh-000000058O3-2W4C
	for linux-riscv@bombadil.infradead.org;
	Wed, 20 May 2026 16:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=UA8TxjZbSTK65jKuLziFwGYU2QFvL6Uecv4q4a5fTNw=; b=rQMeid89T03p5cqieo3ekDAAG1
	nazHmw4h/MCKo1SOSvterpSkVhrYKQos0vInk4m+Svu/aeOnBqXc2aW11PLymBtZyqJEyx3/0wqGp
	BVjFtdl51FFTXBvLDB69APut5kJ2JYGFrycfZoTOJMHbJsWhv20PElf87jFCohgOClOkRpQBQpWGf
	LjnBTnpLpc/jjN67pkT4JmoYhW8kZJ17ks0LUGXz6q22m0E71tshrU+e+R2iNJmy4yJ934BVXdVdI
	draQEU/fTakh6NQnXyIujqTYkrwGgvXHlxr4yPyozqcdiZGfk/OyDyr3mvcB7YlHi36q8kOVPMrwV
	0oY9qFXg==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjYd-00000007Mfm-3DTY
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 16:14:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B94025DE;
	Wed, 20 May 2026 09:13:59 -0700 (PDT)
Received: from [10.57.34.79] (unknown [10.57.34.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C12333F7B4;
	Wed, 20 May 2026 09:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779293644; bh=97SF2OTzJd/H1caJQialhgZHqe7kO84O/EEUdMecaHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CG95ZInuIVPpUBu6Xfl19RNyqZf8H0QurnIU4lhIh81AZtdzbPoIzFa7ZVt+1V1eW
	 Xz4irlUKZipY5f5jSKAiW2pE8SC2bC6mYQ65YaWwltJopwLzl8G9qLlWFS+Tx05VT6
	 MsX5xoiJLkZxOBujejBKnr4V15lpQXkAFCWqidZo=
Message-ID: <ccfcf795-4f9f-49c6-a891-c69c99c47198@arm.com>
Date: Wed, 20 May 2026 17:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/riscv: prefer WSI on IGS=BOTH when wired IRQs are
 described
To: Andrew Jones <andrew.jones@oss.qualcomm.com>, fangyu.yu@linux.alibaba.com
Cc: ajones@ventanamicro.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 guoren@kernel.org, iommu@lists.linux.dev, joro@8bytes.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, sunilvl@oss.qualcomm.com,
 tomasz.jeznach@linux.dev, will@kernel.org
References: <7dc61855-d916-4659-8137-7f3457f6a56d@arm.com>
 <20260520134416.28552-1-fangyu.yu@linux.alibaba.com>
 <kkx6nqyc3evbfeutxkzwv6kbrotsbxopkvit2e2qh6hljicq5m@x4bb54loffkk>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <kkx6nqyc3evbfeutxkzwv6kbrotsbxopkvit2e2qh6hljicq5m@x4bb54loffkk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_171407_979179_9BE5CE30 
X-CRM114-Status: GOOD (  14.00  )
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

On 2026-05-20 5:03 pm, Andrew Jones wrote:
> On Wed, May 20, 2026 at 09:44:16PM +0800, fangyu.yu@linux.alibaba.com wrote:
> ...
>>> (As a side note, is there a reason this is calling of_msi_configure() on
>>> a platform device when of_platform_device_create_pdata() will have done
>>> that already?)
>>
>> Good catch, agreed.
>>
> 
> This is here for a device creation order issue. We have similar patterns
> elsewhere, e.g. drivers/irqchip/irq-riscv-rpmi-sysmsi.c:268. When the
> device is created the MSI controller may not yet have been probed, so
> msi_domain will be NULL. The of_msi_configure() here ensures it gets a
> second chance. Anup says he has a device driver framework solution to
> avoid this pattern that he intends to post soon. I'll clean this up
> after that.

Ah, that sounds like something somewhere between of_msi_configure() and 
platform_device_msi_init_and_alloc_irqs() needs to be able to return an 
EPROBE_DEFER if a parent is specified but not ready yet, similar to 
regular of_irq_get(). I guess this hasn't been noticed much yet since 
most MSI controllers run off early initcalls rather than being regular 
driver model drivers - OK, fair enough for now :)

Cheers,
Robin.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
