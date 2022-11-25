Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A93C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 13:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDBIytseaRiOZOUevMlMt6UnIbbRh6frCLRaDkD3gVE=; b=C0wsl9QX811s3p
	5XFX+c7cp9Z9Iizu96U+hPxwcw3p5/hMq4YcZqB+ZndhBv/IKUkE6B5g7sVIuvuRFnMvByHIwBicm
	ikS8r8EDP7GY0kjrt6u0KPjKm1Avbs9JOYoccNRAS+OOgQQXRu2v35FN8xc19qNTPKBdXqLKn8leb
	fB+NWxI34qfPVP40a/OtcREEN61zligdcmr+c3+HZY9YRu1D6FjQdfzBnK/Zml3QVnPjOxQk446xJ
	G+j0GlqaJ1SYhqWe32sVXbHw6WB2XjGtyu8jsq25XUM4KhGN7txot2Q6jJO3p/jkrZxclzTaMhUiB
	pu4bpv0d4Ic9tcItBVbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZ3b-00GmWi-Ld; Fri, 25 Nov 2022 13:47:55 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyZ3Y-00GmU3-Pi
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 13:47:54 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 56C071BF20F;
	Fri, 25 Nov 2022 13:47:47 +0000 (UTC)
Message-ID: <e90289af-f557-58f2-f4c8-f79feab4f185@ghiti.fr>
Date: Fri, 25 Nov 2022 14:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: increase boot command line size to 1K
Content-Language: en-US
To: Andrea Righi <andrea.righi@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221125133713.314796-1-andrea.righi@canonical.com>
 <6fee29f8-8150-e6ec-e2ec-210610a7e27d@ghiti.fr>
 <Y4DGxWLIVx9p9TS+@righiandr-XPS-13-7390>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <Y4DGxWLIVx9p9TS+@righiandr-XPS-13-7390>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_054753_124112_17F3EA14 
X-CRM114-Status: GOOD (  16.97  )
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

On 11/25/22 14:44, Andrea Righi wrote:
> On Fri, Nov 25, 2022 at 02:41:11PM +0100, Alexandre Ghiti wrote:
>> Hi Andrea,
>>
>> On 11/25/22 14:37, Andrea Righi wrote:
>>> Kernel parameters string is limited to 512 characters on riscv (using
>>> the default from include/uapi/asm-generic/setup.h).
>>>
>>> In some testing environments (e.g., qemu with long kernel parameters
>>> string) we may exceed this limit, triggering errors like the following:
>>>
>>> [    3.331893] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
>>> [    3.332625] CPU: 2 PID: 1 Comm: sh Not tainted 6.1.0-rc6-kc #1
>>> [    3.333233] Hardware name: riscv-virtio,qemu (DT)
>>> [    3.333550] Call Trace:
>>> [    3.333736] [<ffffffff800062b6>] dump_backtrace+0x1c/0x24
>>> [    3.334053] [<ffffffff806e8f54>] show_stack+0x2c/0x38
>>> [    3.334260] [<ffffffff806f2d06>] dump_stack_lvl+0x5a/0x7c
>>> [    3.334483] [<ffffffff806f2d3c>] dump_stack+0x14/0x1c
>>> [    3.334687] [<ffffffff806e92fa>] panic+0x116/0x2d0
>>> [    3.334878] [<ffffffff8001b0aa>] do_exit+0x80a/0x810
>>> [    3.335079] [<ffffffff8001b1d0>] do_group_exit+0x24/0x70
>>> [    3.335287] [<ffffffff8001b234>] __wake_up_parent+0x0/0x20
>>> [    3.335502] [<ffffffff80003cee>] ret_from_syscall+0x0/0x2
>>> [    3.335857] SMP: stopping secondary CPUs
>>> [    3.337561] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000 ]---
>>>
>>> It seems reasonable enough to increase the default command line size to
>>> 1024, like arm, to prevent issues like the one reported above.
>>>
>>> Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
>>> ---
>>>    arch/riscv/include/asm/setup.h      | 7 +++++++
>>>    arch/riscv/include/uapi/asm/setup.h | 7 +++++++
>>>    2 files changed, 14 insertions(+)
>>>    create mode 100644 arch/riscv/include/asm/setup.h
>>>    create mode 100644 arch/riscv/include/uapi/asm/setup.h
>>>
>>> diff --git a/arch/riscv/include/asm/setup.h b/arch/riscv/include/asm/setup.h
>>> new file mode 100644
>>> index 000000000000..f4fe549aab40
>>> --- /dev/null
>>> +++ b/arch/riscv/include/asm/setup.h
>>> @@ -0,0 +1,7 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __ASMRISCV_SETUP_H
>>> +#define __ASMRISCV_SETUP_H
>>> +
>>> +#include <uapi/asm/setup.h>
>>> +
>>> +#endif /* __ASMRISCV_SETUP_H */
>>> diff --git a/arch/riscv/include/uapi/asm/setup.h b/arch/riscv/include/uapi/asm/setup.h
>>> new file mode 100644
>>> index 000000000000..5738f93ae437
>>> --- /dev/null
>>> +++ b/arch/riscv/include/uapi/asm/setup.h
>>> @@ -0,0 +1,7 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef _UAPI__ASMRISCV_SETUP_H
>>> +#define _UAPI__ASMRISCV_SETUP_H
>>> +
>>> +#define COMMAND_LINE_SIZE 1024
>>> +
>>> +#endif /* _UAPI__ASMRISCV_SETUP_H */
>>
>> Just for reference to previous discussions regarding this: https://lore.kernel.org/lkml/CACT4Y+YYAfTafFk7DE0B=qQFgkPXS7492AhBdY_CP1WdB8CGfA@mail.gmail.com/T/
>>
>> Thanks,
>>
>> Alex
> Ah! It has been address/discussed already, great! Thanks for pointing
> that out and sorry for the unnecessary patch. :)


Not unnecessary at all, that will hopefully trigger a new discussion 
because no progress was made so far :)


> -Andrea
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
