Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884E2FB5EA5
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 04:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPdKqD9AgreMfgAReaJUpcN8Y17+E4hPiOS5hde/8sg=; b=chtisBlLSi5Chj
	YZU3fNMYDvWzFYXbRW5GDYeX8Bf4MWm/xt7ZHagHPhu3DpT+sjgajRBw79lUC/uC3G89xC0pJValf
	ESmPP3+floIUGK8QK34pbMKY8UQ43FRM7wtR3662TuY69ikRNiwfk6olmObjFN9l0kyGQmms9KhtS
	9qOPmrmKEaCxUiec8SabCaDSICwhFGIwfl66EUsERFnUXFF0Tu/53eItUN3ytXEvo3TtOQkyjZJkp
	u29ay2y0+bkRDQg6SJWkoEO38GeXihwRxaewXZP5yU5dLUUnbEkObStNr9KuH7WO1akco6NQIJuII
	lczdlncFfDTMRXQO2SsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LiH-00000005N8J-0MF1;
	Tue, 17 Mar 2026 04:07:25 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2LiE-00000005N7x-3p5e
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 04:07:24 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-79801df3e42so5345247b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 21:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773720441; x=1774325241; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2lbkkOnh5kD4/iRbY3xB5zIUuMihZJpMrLdKKWvnVCg=;
        b=U7VLi4QKbVbIB+mBZKXksmZPnFycvFpTxlFMklKeQAR2mPfGaAWyA1DWoi2yWQTaVJ
         VbhEflfIntJNNk02wz7FQ9Ke3H7Oh/qcKOSxAflUxUZ4TMjRnKE+exnR+7FW9ZB5uJNN
         AEGiXk7HHPk5nFH7JT5H4bgGO8ADjDP5mSyCdAb5txdqTMyYny+qc8opBmb+Rw5le34E
         kj6cc0y4IttTzlZF1zj7W/JGKUanL2KJI4gXXpdH4HB0syDQifRmFprv3q+mQSWsGPxu
         a8d+mN0cJjYkqiHA5Xv5POdWQpdHWVkxVs8B/ryuMX4Q9zvmouUwfUS2423uUemwKsBm
         Wohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773720441; x=1774325241;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2lbkkOnh5kD4/iRbY3xB5zIUuMihZJpMrLdKKWvnVCg=;
        b=aTrtWfj80l0SxT+OUi3WBOG93G7n314ExpcqmSVoPhx4NJ0FmAgsOt3gezTZDKLNbQ
         zWf5Trnz50DdmV9TV4Ev9RHOtFfktN0MbExP7gImL9cM1Ma9ffPlgwpowXfODrYziuEj
         f8hCiFtb9J7UxNFEEToD4g2xgos44N4yT9Uz0X5RzRVyLFaJcaNh5JqJnWJU3QyJYEqo
         wQ08cBnxXLXI0LdvJwF8qpt8ndzLulaE/nhQA32a8NC1kYPYRgPDys1ixKicP+V25CiC
         hR63H40YJx+Xr09PhzUqoziYg5G8I694qKvaBAZGeJXpv+nUbLnKjVrFLcrdjyn2MkuB
         ro4Q==
X-Gm-Message-State: AOJu0Yz+/MyvkuJmRNKeLGXaceufH4KtYxp/n8IQYjF4SGUh8RVojmTc
	gQLJ/6lLtR5kZBCftygKfO0j/55L9xrzcPnzj/hMG5QYEUxwUmu7X85/O3eZ3ri67u4=
X-Gm-Gg: ATEYQzwuAS4DMPh9GdGyZ5XbT/p/inIIe521aRBg3QUcRrchIR05JUDbX9mYzi9a4hh
	gc0BrJyL7tU/rnIqJmaaH2j56kKMb2jjRvgrqr5e6MJaZPgjlPDBqKnz/gmZpBdXeYayUUu9dlh
	c9AsIQWx1GAw8h7UO8ymkRGIWAkn7zZlqoPrSfKLDB01aS/6w+r44cx+cLYv27Nnq0nS75NARoh
	SNgFlUK00S+5euHI2Cl6r/Gtn5aWseuPM6woAYxDjE6JEC3p0JW1R03GnDLsVDatmYr4VFF7nTj
	S9nyTYJIxcsiaLLv7nOnUe7W56z+/QBf/k+HdRDXDdk6M/18D/UsRadZOBIWWj4szCqrcUmzAlO
	YHITATfubCnk2d3FyQietp80OcxF2bDxWp29vsVZHlbZuu0SjixlP889sdeKc/9JhqZ0M/XtZbN
	OQ5lutuaPmdrYGWXIaXOcd38F/GQPajYVdMpzmqtDr/h83//aLFIM=
X-Received: by 2002:a05:690c:e34b:b0:79a:55d3:657f with SMTP id 00721157ae682-79a618870b9mr17106927b3.16.1773720441621;
        Mon, 16 Mar 2026 21:07:21 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917f0a0ebsm96045627b3.37.2026.03.16.21.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 21:07:21 -0700 (PDT)
Message-ID: <7e80356c-c937-4812-b237-184676a466c0@sifive.com>
Date: Mon, 16 Mar 2026 23:07:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: disable local interrupts and stop other CPUs
 before restart
To: Troy Mitchell <troy.mitchell@linux.dev>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev>
 <f9079774-1d16-4b84-bf85-bc8444e93446@iscas.ac.cn>
 <DH40Z14EHV40.1I443BTRU720F@linux.dev>
 <c1f466f8-4e76-43a2-a7a2-126415fd1f56@sifive.com>
 <DH4PODM2MN9W.V6082HZA6E18@linux.dev>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <DH4PODM2MN9W.V6082HZA6E18@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_210722_982767_C9DCE660 
X-CRM114-Status: GOOD (  36.17  )
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

Hi Troy,

On 2026-03-16 9:45 PM, Troy Mitchell wrote:
> On Mon Mar 16, 2026 at 9:19 PM CST, Samuel Holland wrote:
>> On 2026-03-16 2:23 AM, Troy Mitchell wrote:
>>> On Thu Mar 12, 2026 at 11:05 AM CST, Vivian Wang wrote:
>>>> On 3/11/26 10:51, Troy Mitchell wrote:
>>>>> Currently, the RISC-V implementation of machine_restart() directly calls
>>>>> do_kernel_restart() without disabling local interrupts or stopping other
>>>>> CPUs. This missing architectural setup causes fatal issues for systems
>>>>> that rely on external peripherals (e.g., I2C PMICs) to execute the system
>>>>> restart when CONFIG_PREEMPT_RCU is enabled.
>>>>>
>>>>> When a restart handler relies on the I2C subsystem, the I2C core checks
>>>>> i2c_in_atomic_xfer_mode() to decide whether to use the sleepable xfer
>>>>> or the polling atomic_xfer. This check evaluates to true if
>>>>> (!preemptible() || irqs_disabled()).
>>>>>
>>>>> During do_kernel_restart(), the restart handlers are invoked via
>>>>> atomic_notifier_call_chain(), which holds an RCU read lock.
>>>>> The behavior diverges based on the preemption model:
>>>>> 1. Under CONFIG_PREEMPT_VOLUNTARY or CONFIG_PREEMPT_NONE, rcu_read_lock()
>>>>>    implicitly disables preemption. preemptible() evaluates to false, and
>>>>>    the I2C core correctly routes to the atomic, polling transfer path.
>>>>> 2. Under CONFIG_PREEMPT_RCU, rcu_read_lock() does NOT disable preemption.
>>>>>    Since machine_restart() left local interrupts enabled, irqs_disabled()
>>>>>    is false, and preempt_count is 0. Consequently, preemptible() evaluates
>>>>>    to true.
>>>>>
>>>>> As a result, the I2C core falsely assumes a sleepable context and routes
>>>>> the transfer to the standard master_xfer path. This inevitably triggers a
>>>>> schedule() call while holding the RCU read lock, resulting in a fatal splat:
>>>>> "Voluntary context switch within RCU read-side critical section!" and
>>>>> a system hang.
>>>>>
>>>>> Align RISC-V with other major architectures (e.g., ARM64) by adding
>>>>> local_irq_disable() and smp_send_stop() to machine_restart().
>>>>> - local_irq_disable() guarantees a strict atomic context, forcing sub-
>>>>>   systems like I2C to always fall back to polling mode.
>>>>> - smp_send_stop() ensures exclusive hardware access by quiescing other
>>>>>   CPUs, preventing them from holding bus locks (e.g., I2C spinlocks)
>>>>>   during the final restart phase.
>>>>
>>>> Maybe while we're at it, we can fix the other functions in this file as
>>>> well?
>>> Nice catch. I'll fix other functions in the next version.
>>>>
>>>> I think the reason we ended up with the "unsafe" implementations of the
>>>> reboot/shutdown functions is that on the backend it is usually SBI SRST
>>>> calls, which can protect itself from other CPUs and interrupts. Since on
>>>> K1 we're going to be poking I2C directly, we run into the problem
>>>> described above. So all of these should disable interrupts and stop
>>>> other CPUs before calling the handlers, and can't assume the handlers
>>>> are all SBI SRST.
>>> Yes, we cannot assume that all platforms rely on this.
>>
>> Why isn't K1 using the SBI SRST extension? Resetting the platform from S-mode
>> directly causes problems if you ever want to run another supervisor domain (for
>> example a TEE or EFI runtime services), which may need to clean up before a
>> system reset.
>>
>> As you mention, other platforms use the standard SBI SRST interface, event if
>> they need to poke a PMIC to perform a system reset. Is there something
>> preventing K1 from following this path?
> 
> Ideally, yes, resetting the platform should be handled by the firmware (SBI SRST) to
> properly tear down M-mode/TEE states before pulling the plug.
> 
> However, for the K1 platform, while the SoC itself can be reset via SBI SRST, this warm
> reset does not propagate to the external PMIC. For instance, if the kernel switches the
> SD card to 1.8V signaling for high-speed mode during runtime, an SoC-only reset leaves
> the PMIC still supplying 1.8V. Upon reboot, the bootrom/early kernel expects the SD card
> to be in the default 3.3V state for initialization, which inevitably leads to a boot hang.

Right, so you would need a driver in M-mode that performs a PMIC-level reset
instead of a SoC-level reset when the SBI SRST function is called. Several
platforms already do this.

> Setting the K1-specific hardware design aside, I believe this patch is fundamentally necessary
> to fix a latent bug in the RISC-V Linux kernel itself, regardless of whether the final
> reset is backed by SBI or not.
> 
> The core issue here is the context in which do_kernel_restart() invokes the restart_handler_list.
> It does so via an atomic_notifier_call_chain. If RISC-V enters this phase without disabling local IRQs,
> we are leaving a trap for any generic driver or kernel subsystem invoked during this teardown phase.
> 
> Under CONFIG_PREEMPT_RCU, the RCU read lock does not bump the preempt count.
> Without local_irq_disable(), the preemptible() check will unexpectedly evaluate to true.
> 
> A quick grep shows that preemptible() is widely relied upon by generic subsystems to
> determine safe execution paths (~16 occurrences in kernel/ and ~11 in drivers/).
> This means generic code implicitly trusts the architecture to set up the correct
> atomic context during a system restart.

I agree with the conceptual issue, that do_kernel_restart() should be called
from an atomic context, but may not be. But there seems to be no practical
problem if the first/only entry in restart_handler_list is sbi_srst_reboot(),
which is why we haven't seen problems on other platforms.

> The I2C PMIC crash we encountered is just one symptom of this missing context. If we don't
> fix this at the architecture level, it leaves the door open for other undiscovered panics.
> Any driver (watchdog, display, network, etc.) that registers a restart handler and internally
> relies on preemptible() to choose between a sleepable or polling path will inevitably trigger
> a schedule(), attempt to acquire a sleeping lock (e.g., a mutex), or call other blocking functions
> while holding the RCU read lock, resulting in a fatal splat.

Are you possibly confusing restart_handler_list and reboot_notifier_list here? A
display or network driver would not register a restart handler. And similarly to
the PMIC case, I would expect a platform that resets by watchdog to have a
M-mode driver for it and still use the SBI SRST extension.

> *Aligning machine_restart() with other architectures* by adding local_irq_disable() and smp_send_stop()
> ensures a deterministic, single-threaded atomic context.
> This protects the Linux teardown sequence from SMP deadlocks and context misidentification,
> well before the control is ever handed over to the firmware or hardware.
> 
> Does this perspective make sense?

Yes, I'm not opposed to making this change, because it is conceptually the right
thing to do. I'm only questioning why you are in a position to notice this issue
in the first place: you only see this because Linux is driving the PMIC directly
instead of going through firmware.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
