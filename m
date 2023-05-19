Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC329C77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 12:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHgtvtcu20GqsZHMRoiGSKeYmoFWbtzi1vkytd9IN7s=; b=nsp2HsWO6OGwKJ
	mDFE+D1O6FhV1/bDfTADeSJj+OJEpyzqMrCf0banu07uC7IrT/7T82hNtsMyHj5re2/3KRvEMv9Wt
	A2Y3OH0LmnbuF7Nq+zAFwFdths6Rt3hjVxi3gZ3pfbZGmG7NuGDPuPKE4IaW92cdKEfbNij3brStI
	wdpVhNEDAmDjoeqN9MMrBi63pqzEwZFcwuYGWCNWmmlc5YtLIy5XJ5dg+8zU7dvv+beqhsx9f9r8J
	sobH5o0BSKvLCwHSBe7cN7ZsWqbR+1+HUllvM3j4Oli5UqjIO+VZwNSfYoaygOlj2F3XergaMXQSG
	FqEoXNjcdKA4uGBbCGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzyvn-00GBrQ-1e;
	Fri, 19 May 2023 12:09:59 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzyvk-00GBpz-1S
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 12:09:58 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 52A6560009;
	Fri, 19 May 2023 12:09:46 +0000 (UTC)
Message-ID: <8cdbe96c-4d89-6f60-7afc-a7a708551f19@ghiti.fr>
Date: Fri, 19 May 2023 14:09:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: linux-next: Tree for May 15 (several RV64 build errors)
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Conor Dooley <conor@kernel.org>
References: <20230515141235.0777c631@canb.auug.org.au>
 <54244db6-ff69-4cf8-894c-c3dd2f12df9c@infradead.org>
 <5d894e71-25ad-8ba0-f632-2eec6e017f46@ghiti.fr>
 <ee3bc2ce-5ebe-927e-5b6d-0b9490ef3875@ghiti.fr>
 <20230519-starlit-grip-ed152fb318cf@wendy>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230519-starlit-grip-ed152fb318cf@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_050956_656333_B41045BA 
X-CRM114-Status: GOOD (  15.34  )
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


On 5/19/23 13:22, Conor Dooley wrote:
> On Fri, May 19, 2023 at 12:42:55PM +0200, Alexandre Ghiti wrote:
>
>>>> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld:
>>>> section .data LMA [000000000041a000,00000000075bffd7] overlaps
>>>> section .text LMA [00000000000f09d4,00000000033562ab]
>>>> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld:
>>>> section .init.pi.text LMA [00000000033562ac,0000000003359137]
>>>> overlaps section .data LMA [000000000041a000,00000000075bffd7]
>>>
>>> I'll check this one too which seems to be related to kernel/pi
>>> introduction.
>>
>> Thanks to Bjorn: this is caused by XIP_KERNEL, which is known to have
>> limited size, hence the overlap, so no fix for this one. Is there a way to
>> exclude this config from randconfig?
> What exactly is the problem? That the randconfig is too big for the max
> XIP kernel size?
> We already disable half the world for XIP, is turning off the pi stuff
> an option?


It's not related to the pi stuff, the problem has been present since 
5.13 (since the introduction of the XIP kernels :)).


>   It's already turned off for 32-bit, right?


Yes, it's only compiled with 64-bit kernels.


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
