Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AD1F506CF
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 13:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRdb69Jfb9saVG+uUDAnSFBzzulaxdSV8obsTIdj8po=; b=n+XVvB96eBqmtL
	JRiMTSWp+5ZcEU/JEHM6pngkZdPK2lnHuw3fno0ja6TknKixVmhyG2/w75V70Ez+XC5J2Jj8Ak5qZ
	dTie490pRxT+FU7/8eQd6ONICT61I2QXUvpwFsvjlatPswF8BrDYV0q1NVvMWiiVdF2vW21inoT6B
	xA0PEzU0CGeBnOsBOA2JI7ARA1j3CFSobEuc1HjvpAvmNwjFE5Qizj+O+h3fLon3oQcFz3QeXdQHa
	B5GwXvW4nC1WvHVMe8BkBJF7O0aZL/v1LFabmkHUlXzttanwmnNWzL9Y1QMHxIy153DUlcOntT0ca
	xKdTHsvOs6L4qQhMu9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w27rK-000000043vv-0RH1;
	Mon, 16 Mar 2026 13:19:50 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w27rH-000000043vD-0SlD
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 13:19:48 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-466f935a82fso2963011b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 06:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773667185; x=1774271985; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcUQdthu3w3MmzOBiSvMw8yvWhLEb2QVxffY5zYz7z0=;
        b=fg6g2P3rPjyx+HZ6CANbvu9XgQ7MHJiidU8ktP/C5QaDrVAHm7Hr7F+kzXAG1ge5ux
         6MqbPEWj4pixUmJ+vRpXu4OBIhWOLkPL6u1IN75WQk9hOfLsC3Fya5+RB3ZhEHL2khPA
         dL/b4epW1Rxm1PTQ/gL470r3ej8p76o2Mw3untNjUN+0BnyLm/2gbNwixYmM/KSpcljg
         o1Sm09Xhav8tPCoriLZCKANB7/iOIcREmcxg8gShiHvr1Pj+zX5wQ1tVWzKvzT/4U7+x
         xE+OY8gqAzEuj8gHqfo/dGTIlSF+sNjLwLaglfyhKoMH/lcU3UQP7JeOCbHPoQ52NEMA
         JLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773667185; x=1774271985;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcUQdthu3w3MmzOBiSvMw8yvWhLEb2QVxffY5zYz7z0=;
        b=O1NEhXOcJlyOQZO29vrkiGB/XODVKzbDeGTANx0G4x0cTYi0FQm/pE+SZWGU5YxwDJ
         H+CKVS1qqOg6l+6D1JbTHIGISZ/HtdBVr5qhEhc9wOrq1tnDH11tgKUX/KXL+gSXXyBe
         w39YIZ54W/3kHhFyqFdYqXFDaspruC95eizNi/V2fKArOM8xTPdWgnO9I2788Gq07VXs
         JAigMNewj0TaFKOfDFvq2oEkKS8hZ6Nal3VKTR7AdfXmbnysNNIB9znIPi9KBgkjF1aj
         O1rLhiyHk3MxTuZIEiM3DOqvV6Y8AHcx4TlGxu9N6YU9iJYTWL2mZK2o4/VHJK9RMN1+
         5r6Q==
X-Gm-Message-State: AOJu0YylNNj1ucBsJK5iCkj3kqsY03LWDtHwShtIb7Zq+XTzs2TqP2a/
	sQeDn5c7RyifICM8Gzm/ymHAhl55oNW0uXbgOiNkR18F5eTQAYkqmD5+m1xXM18lsp0=
X-Gm-Gg: ATEYQzxtwmaoPyp9Ygj8crmN+OzsjpVr6kb7r2e7YhA+1GUyUAAe7F4Jc0T2pwvDjoh
	VbllWkMBKsd1RouWwfMgXXHzVE17VDCKFt0mCk2VGwpPOCEPHBuYF7v90kRT1GrfgfAZSs+lMTl
	gkbevRWNeCf4IxbbiCQWQr393LvGWei7xYoc42FtmWPE9HRBlu0pSxd8qr+sef2Sej96Bg9v2gL
	F4W9v5hretSeqhFLrkvoDbZFBTsLOjI+UBIaqSauwDoFgRzinTWR79ooLmcli5hLNtqg7Ktc8DR
	h91/F5FGS2Ne5RVT3P0piSX8AbyMZ7bIqGiP/xydr7AT1Qw4fJZciIdojwbBysMUXkyCU1u9Oe6
	PmbfbMlGsNSXcywrNdr/kDjFiRyxZjBY/Vbxr1Hk7FLJc4Z3HcZr9K9mf00OJLSPu68LANVOfTA
	Md2fxoWqu3e1Pti1AQzm0pBGBEYmuHRqEIE3RuGnD9
X-Received: by 2002:a05:6808:a596:20b0:467:1ad3:7ee with SMTP id 5614622812f47-4675753157fmr5424703b6e.40.1773667185289;
        Mon, 16 Mar 2026 06:19:45 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46734164245sm9151715b6e.8.2026.03.16.06.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 06:19:44 -0700 (PDT)
Message-ID: <c1f466f8-4e76-43a2-a7a2-126415fd1f56@sifive.com>
Date: Mon, 16 Mar 2026 08:19:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: disable local interrupts and stop other CPUs
 before restart
To: Troy Mitchell <troy.mitchell@linux.dev>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev>
 <f9079774-1d16-4b84-bf85-bc8444e93446@iscas.ac.cn>
 <DH40Z14EHV40.1I443BTRU720F@linux.dev>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <DH40Z14EHV40.1I443BTRU720F@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_061947_202031_E281F1C9 
X-CRM114-Status: GOOD (  14.50  )
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

On 2026-03-16 2:23 AM, Troy Mitchell wrote:
> On Thu Mar 12, 2026 at 11:05 AM CST, Vivian Wang wrote:
>> On 3/11/26 10:51, Troy Mitchell wrote:
>>> Currently, the RISC-V implementation of machine_restart() directly calls
>>> do_kernel_restart() without disabling local interrupts or stopping other
>>> CPUs. This missing architectural setup causes fatal issues for systems
>>> that rely on external peripherals (e.g., I2C PMICs) to execute the system
>>> restart when CONFIG_PREEMPT_RCU is enabled.
>>>
>>> When a restart handler relies on the I2C subsystem, the I2C core checks
>>> i2c_in_atomic_xfer_mode() to decide whether to use the sleepable xfer
>>> or the polling atomic_xfer. This check evaluates to true if
>>> (!preemptible() || irqs_disabled()).
>>>
>>> During do_kernel_restart(), the restart handlers are invoked via
>>> atomic_notifier_call_chain(), which holds an RCU read lock.
>>> The behavior diverges based on the preemption model:
>>> 1. Under CONFIG_PREEMPT_VOLUNTARY or CONFIG_PREEMPT_NONE, rcu_read_lock()
>>>    implicitly disables preemption. preemptible() evaluates to false, and
>>>    the I2C core correctly routes to the atomic, polling transfer path.
>>> 2. Under CONFIG_PREEMPT_RCU, rcu_read_lock() does NOT disable preemption.
>>>    Since machine_restart() left local interrupts enabled, irqs_disabled()
>>>    is false, and preempt_count is 0. Consequently, preemptible() evaluates
>>>    to true.
>>>
>>> As a result, the I2C core falsely assumes a sleepable context and routes
>>> the transfer to the standard master_xfer path. This inevitably triggers a
>>> schedule() call while holding the RCU read lock, resulting in a fatal splat:
>>> "Voluntary context switch within RCU read-side critical section!" and
>>> a system hang.
>>>
>>> Align RISC-V with other major architectures (e.g., ARM64) by adding
>>> local_irq_disable() and smp_send_stop() to machine_restart().
>>> - local_irq_disable() guarantees a strict atomic context, forcing sub-
>>>   systems like I2C to always fall back to polling mode.
>>> - smp_send_stop() ensures exclusive hardware access by quiescing other
>>>   CPUs, preventing them from holding bus locks (e.g., I2C spinlocks)
>>>   during the final restart phase.
>>
>> Maybe while we're at it, we can fix the other functions in this file as
>> well?
> Nice catch. I'll fix other functions in the next version.
>>
>> I think the reason we ended up with the "unsafe" implementations of the
>> reboot/shutdown functions is that on the backend it is usually SBI SRST
>> calls, which can protect itself from other CPUs and interrupts. Since on
>> K1 we're going to be poking I2C directly, we run into the problem
>> described above. So all of these should disable interrupts and stop
>> other CPUs before calling the handlers, and can't assume the handlers
>> are all SBI SRST.
> Yes, we cannot assume that all platforms rely on this.

Why isn't K1 using the SBI SRST extension? Resetting the platform from S-mode
directly causes problems if you ever want to run another supervisor domain (for
example a TEE or EFI runtime services), which may need to clean up before a
system reset.

As you mention, other platforms use the standard SBI SRST interface, event if
they need to poke a PMIC to perform a system reset. Is there something
preventing K1 from following this path?

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
