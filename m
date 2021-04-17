Return-Path: <SRS0=TuAZ=JO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DE4C433B4
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 17:25:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F29556109F
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 17:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F29556109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3duvnzDI4fNKLPw+VhWqgy1PjV8Luxiky8qaVKbdzQY=; b=KDasqrnW5B/DMu72KryycF2Jg
	3ZXtHjr1UHexr1pZuBzYUUuekOIaDxjxUmg7D2tHQt6Hlu95Xgvy6JVQJASOJOWDiQZVQ4IpUdZP8
	E1weyyFeiojYrwwEXJgFH1wfDJS3mtHGF0G/BcNUxsTKTG+iZOxTNaDeLG9YLjtbmFAQFzZ1bNfga
	vPksaAyNkbH8+k80C6uXRMYlYXPdfaA6+b0pO76KA2mezgEb73+k4aK61lxQdu/uptI5tS8CUvLFy
	hWlHrfpYlJeLqNmtAcCcQby7Sqqc2nzKrF7ZC0VBBQP3l2ZtAfAAqv8D9p08EfCWD0h8h76WJ5y6v
	hUoHIwIeg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXofY-005pqh-Uk; Sat, 17 Apr 2021 17:23:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXofX-005pqV-DE
 for linux-riscv@desiato.infradead.org; Sat, 17 Apr 2021 17:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=S0cSJjkUH/S8SZSJwUfAt3HMwfoA8lXcrgWomg/s0p8=; b=SblXfVJ0efqlN5MrWCx1qvijJZ
 IbZV6UXnlLkvu8B3FVdC/Hg/LqJyszK0SSH7GdCx1onROcoXsRBAbnZH+0TG9JIhf2pXGzNuRIYTa
 d204vjhnsSbfm1BiDu8B6QeJDn13HOE95rq0wH+TDPwkkU28fKHI3hVqG4Fpzkn9CC1MVNjQx1LTU
 olune7Jpf5riF+SDpRjEM5vt33SXOnDQtl9Gnlt9/YbCV70Ad/LMPWMZjdAWbxUZecs9WGWxAeQLO
 WcTP6OvCrkmGMmIiu8n5d5za4D3OH6BhdB5Lx0BGC/w2UOuv6dk+CWnse+hJ1FesjSjl9EDw8zYJv
 b/GmCi+w==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXofU-00A7d2-9E
 for linux-riscv@lists.infradead.org; Sat, 17 Apr 2021 17:23:42 +0000
X-Originating-IP: 2.7.49.219
Received: from [192.168.1.12] (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C6153E0003;
 Sat, 17 Apr 2021 17:23:33 +0000 (UTC)
Subject: Re: [PATCH v4 1/3] riscv: Move kernel mapping outside of linear
 mapping
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
References: <20210409061500.14673-1-alex@ghiti.fr>
 <20210409061500.14673-2-alex@ghiti.fr> <20210416185139.GA42339@roeck-us.net>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <8c23ed42-d8c7-70be-71d8-0eb74ace8e67@ghiti.fr>
Date: Sat, 17 Apr 2021 13:23:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210416185139.GA42339@roeck-us.net>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_102340_617828_A6F26380 
X-CRM114-Status: GOOD (  23.79  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Guenter,

Le 4/16/21 =E0 2:51 PM, Guenter Roeck a =E9crit=A0:
> On Fri, Apr 09, 2021 at 02:14:58AM -0400, Alexandre Ghiti wrote:
>> This is a preparatory patch for relocatable kernel and sv48 support.
>>
>> The kernel used to be linked at PAGE_OFFSET address therefore we could u=
se
>> the linear mapping for the kernel mapping. But the relocated kernel base
>> address will be different from PAGE_OFFSET and since in the linear mappi=
ng,
>> two different virtual addresses cannot point to the same physical addres=
s,
>> the kernel mapping needs to lie outside the linear mapping so that we do=
n't
>> have to copy it at the same physical offset.
>>
>> The kernel mapping is moved to the last 2GB of the address space, BPF
>> is now always after the kernel and modules use the 2GB memory range right
>> before the kernel, so BPF and modules regions do not overlap. KASLR
>> implementation will simply have to move the kernel in the last 2GB range
>> and just take care of leaving enough space for BPF.
>>
>> In addition, by moving the kernel to the end of the address space, both
>> sv39 and sv48 kernels will be exactly the same without needing to be
>> relocated at runtime.
>>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> =

> In next-20210416, when booting a riscv32 image in qemu, this patch result=
s in:
> =

> [    0.000000] Linux version 5.12.0-rc7-next-20210416 (groeck@desktop) (r=
iscv32-linux-gcc (GCC) 10.3.0, GNU ld (GNU Binutils) 2.36.1) #1 SMP Fri Apr=
 16 10:38:09 PDT 2021
> [    0.000000] OF: fdt: Ignoring memory block 0x80000000 - 0xa0000000
> [    0.000000] Machine model: riscv-virtio,qemu
> [    0.000000] earlycon: uart8250 at MMIO 0x10000000 (options '115200')
> [    0.000000] printk: bootconsole [uart8250] enabled
> [    0.000000] efi: UEFI not found.
> [    0.000000] Kernel panic - not syncing: init_resources: Failed to allo=
cate 160 bytes
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.12.0-rc7-next-20=
210416 #1
> [    0.000000] Hardware name: riscv-virtio,qemu (DT)
> [    0.000000] Call Trace:
> [    0.000000] [<80005292>] walk_stackframe+0x0/0xce
> [    0.000000] [<809f4db8>] dump_backtrace+0x38/0x46
> [    0.000000] [<809f4dd4>] show_stack+0xe/0x16
> [    0.000000] [<809ff1d0>] dump_stack+0x92/0xc6
> [    0.000000] [<809f4fee>] panic+0x10a/0x2d8
> [    0.000000] [<80c02b24>] setup_arch+0x2a0/0x4ea
> [    0.000000] [<80c006b0>] start_kernel+0x90/0x628
> [    0.000000] ---[ end Kernel panic - not syncing: init_resources: Faile=
d to allocate 160 bytes ]---
> =

> Reverting it fixes the problem. I understand that the version in -next is
> different to this version of the patch, but I also tried v4 and it still
> crashes with the same error message.
> =


I completely neglected 32b kernel in this series, I fixed that here:

Thank you for testing and reporting,

Alex

> Guenter
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
