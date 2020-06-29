Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BD7C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 14:47:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 280E023E1F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 14:47:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JExiQPJL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="v69PIx5K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 280E023E1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s1xvjOldvF01PaMdj2bvdSXGq3BvbJBwuDc/SII6kDY=; b=JExiQPJLMCDD6wuyeHYVrqvCv
	KRyP/G2VDa6fwhTjwAIG4df7DoTeS1vR/PrOroP/NVitKEVZ0jiVGKxp9SAHEqNsQ4Cz3328j6X/F
	Ovjd3G20qBL+Cfo7SFVYZ93/8oh0qDZgCzWpR0nY2MKNUq8zm9UefVWeqU01Alkxh5sG0BdtYr0Fv
	vALJ9FMmz2QJDoKHQ4Jx3IJ+K0xWR4/Ca46jJHf/MkwjxrgoimULmPQYTPtsilza4xI+ZOEvtCPst
	//E58RMJ7isfMqHm7F38ep0p1ArUlASCG61HRXio4z2VeATmxA29hwFrvZOREVJK+uqzH8ZVm6A0T
	HIWsvQBjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpv4N-0006lt-OI; Mon, 29 Jun 2020 14:47:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpv4M-0006lb-Bl
 for linux-riscv@merlin.infradead.org; Mon, 29 Jun 2020 14:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=L1llao+N1ItHwS5WUPVwSSBRDCeyLcOEiY8zovVfOFE=; b=v69PIx5KSzdWQh8SK59WHxTTia
 JQufcT3kBzG6gTMpRXC2znHHEUMzH48XtgDi7mY82m2zdCwkg1oJOxp8BWjeFD/B+5vRhHjCFEE4B
 JtBz3Ybke0cEy6DWktscBI9QmmOg0eoHVvI6ZbSzORFfZvKjXs/rzHhxXeOutzc8uajweJAbmXN/a
 P8kslyKJ+4fND8xCXHVHs5ZWbnPErMH+N/jC16kCvLKvbFjRSlvthCZqICuDLDXyK02L5DOfPGLYy
 1QSYRjMToE1GpU+GOlgmyx9Ov0BIJzq2TrYlUYKU+iqT90IsLED6JEI4BojV21hNrCpaK41t87ECY
 WVNytnLg==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpv4G-0001vx-WF
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 14:47:36 +0000
Received: from [192.168.1.11] (lfbn-gre-1-325-105.w90-112.abo.wanadoo.fr
 [90.112.45.105]) (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id EEEC7240007;
 Mon, 29 Jun 2020 14:46:47 +0000 (UTC)
Subject: Re: [PATCH 0/2] PUD/PGDIR entries for linear mapping
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20200603153608.30056-1-alex@ghiti.fr>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <452647fc-bcfc-c47c-50eb-cb06a94f6d38@ghiti.fr>
Date: Mon, 29 Jun 2020 10:46:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200603153608.30056-1-alex@ghiti.fr>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200629_154733_488116_BCCA4B71 
X-CRM114-Status: GOOD (  25.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le 6/3/20 =E0 11:36 AM, Alexandre Ghiti a =E9crit=A0:
> This small patchset intends to use PUD/PGDIR entries for linear mapping
> in order to better utilize TLB.
> =

> At the moment, only PMD entries can be used since on common platforms
> (qemu/unleashed), the kernel is loaded at DRAM + 2MB which dealigns virtu=
al
> and physical addresses and then prevents the use of PUD/PGDIR entries.
> So the kernel must be able to get those 2MB for PAGE_OFFSET to map the
> beginning of the DRAM: this is achieved in patch 1.
> =

> But furthermore, at the moment, the firmware (opensbi) explicitly asks the
> kernel not to map the region it occupies, which is on those common
> platforms at the very beginning of the DRAM and then it also dealigns
> virtual and physical addresses. I proposed a patch here:
> =

> https://github.com/riscv/opensbi/pull/167
> =

> that removes this 'constraint' but *not* all the time as it offers some
> kind of protection in case PMP is not available. So sometimes, we may
> have a part of the memory below the kernel that is removed creating a
> misalignment between virtual and physical addresses. So for performance
> reasons, we must at least make sure that PMD entries can be used: that
> is guaranteed by patch 1 too.
> =

> Finally the second patch simply improves best_map_size so that whenever
> possible, PUD/PGDIR entries are used.
> =

> Below is the kernel page table without this patch on a 6G platform:
> =

> ---[ Linear mapping ]---
> 0xffffc00000000000-0xffffc00176e00000    0x0000000080200000 5998M PMD    =
 D A . . . W R V
> =

> And with this patchset + opensbi patch:
> =

> ---[ Linear mapping ]---
> 0xffffc00000000000-0xffffc00140000000 0x0000000080000000         5G PUD  =
   D A . . . W R V
> 0xffffc00140000000-0xffffc00177000000    0x00000001c0000000 880M PMD     =
D A . . . W R V
> =

> Alexandre Ghiti (2):
>    riscv: Get memory below load_pa while ensuring linear mapping is PMD
>      aligned
>    riscv: Use PUD/PGDIR entries for linear mapping when possible
> =

>   arch/riscv/include/asm/page.h |  8 ++++
>   arch/riscv/mm/init.c          | 69 +++++++++++++++++++++++++++++------
>   2 files changed, 65 insertions(+), 12 deletions(-)
> =


The way to handle the remapping of the first 2MB is incorrect: Atish has =

issues while using an initrd because the initrd_start variable is =

defined using __va between setup_vm and setup_vm_final and then its =

value is inconsistent after setup_vm_final since virtual addressing was =

modified with the remapping of the first 2MB.

I will come with another solution to this problem since the way I handle =

it for now is not correct.

Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
