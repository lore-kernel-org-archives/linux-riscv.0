Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9E7C4450A
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 04:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKt3yf8NZkD9dPspS8COJBab6xgHIfFoOdVgiJkcpYk=; b=2+A7PYo6vDYVcf
	9uWsXTKACMoFWH9Syb/JK3foglUrmOxKnQ08ZtXxZX5kkswtc/cKSjkkhl9oSmpXJOK/dl+EyC2e8
	QYLLEPfbzhGROQiPwLCBVths1FBMhAn+4Z2yfKrhC8hx3CFsYJ3jED0xoIOHxJaX48fyn+biIdABi
	ZVIJzpYkO52bT1efY9/IArkBERWmKXRlwXU7/TGPB5SEuZdxiubHk8uSKzck5NWGZNRbvlUPyGXwM
	HbpXqj+X5bOdRXBL63sAc9KRdt/IvHpQGDvo2IORdG1NEjNXjsho977VS3h9pu1P+Os8EE6e1tzmG
	xBsxN+VFpp2BZV7TOxPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjqoo-0000000DiCy-0K75;
	Wed, 15 Jul 2026 04:01:58 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjqoj-0000000DiCN-3w0i
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 04:01:56 +0000
Received: from [192.168.0.104] (unknown [123.116.46.73])
	by APP-05 (Coremail) with SMTP id zQCowACHHREqBldqdp5CGA--.22772S2;
	Wed, 15 Jul 2026 12:01:46 +0800 (CST)
Message-ID: <d20d1eca-472f-4599-925e-5a9519f674c7@iscas.ac.cn>
Date: Wed, 15 Jul 2026 12:01:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: smp: set CPU 0 possible in setup_smp()
To: Paul Walmsley <pjw@kernel.org>, Paul Sherman <shermanpauldylan@gmail.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu
References: <20260714223301.5265-1-shermanpauldylan@gmail.com>
 <0fcf59d9-fbf5-3f1c-910d-3e269fdadf75@kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <0fcf59d9-fbf5-3f1c-910d-3e269fdadf75@kernel.org>
X-CM-TRANSID: zQCowACHHREqBldqdp5CGA--.22772S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFWxJry3Wr4xWF1Dtw45GFg_yoW8Wry3p3
	W7KasIkr97XF1kJay8trsxJFWUtw1vvw17X345Ka15A3Z8X3WfZr4rtr15uFyxWrZ5WrWY
	kw4UAa9agayDXa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jrYFAUUUUU=
X-Originating-IP: [123.116.46.73]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_210154_358397_E497F759 
X-CRM114-Status: UNSURE (   9.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/15/26 09:41, Paul Walmsley wrote:

> On Tue, 14 Jul 2026, Paul Sherman wrote:
>
>> setup_smp() calls set_cpu_possible() for CPUs 1..nr_cpu_ids-1 but
>> never for CPU 0 (the boot CPU). x86 handles this via
>> init_cpu_possible(cpumask_of(0)); RISC-V has no equivalent.
>>
>> Without CPU 0 in cpu_possible_mask, rcu_init_one()'s
>> for_each_possible_cpu() loop skips it, leaving rdp->mynode=NULL.
>> rcutree_prepare_cpu() then dereferences NULL and hangs.
>>
>> Exposed on Sophgo SG2042 (64-hart, 4-NUMA) with Linux 7.2-rc3.
>>
>> Fixes: a4166aec1130 ("riscv: Deduplicate code in setup_smp()")
>> Signed-off-by: Paul Sherman <shermanpauldylan@gmail.com>
> Thanks, queued for v7.2-rc.

I hope it's not too late to object, but I don't see how this could
happen. This is what happens in start_kernel():

    assembly boot code
    -> start_kernel()
       -> boot_cpu_init();
          -> int cpu = smp_processor_id();
             /* cpu = 0 because INIT_THREAD_INFO(tsk) leaves it out */
          
             /* Mark the boot cpu "present", "online" etc for SMP and UP case */
             set_cpu_online(cpu, true);
             set_cpu_active(cpu, true);
             set_cpu_present(cpu, true);
             set_cpu_possible(cpu, true); /* <---- HERE */
       -> ...
       -> setup_arch(&command_line);
          -> setup_smp()
             -> for (cpuid = 1; cpuid < nr_cpu_ids; cpuid++)
                	if (cpuid_to_hartid_map(cpuid) != INVALID_HARTID)
                		set_cpu_possible(cpuid, true);

So CPU 0 is already in cpu_possible_mask. This is also what I see by
adding prints to setup_smp().

* Paul Sherman: How did you reproduce this? Is your boot CPU not cpu 0
(note: not the same as hart 0)?

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
