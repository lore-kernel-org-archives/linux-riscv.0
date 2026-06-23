Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C34CDB471
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 15:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKGBpH2q5g7/ncM9iWLgD+wMKjOTEIJQbCvhYL8oiPI=; b=GMP4EDxi6loity
	z6CdtENYt9jO7OWzAdWHIqO7H+YEkXk64+EHu/MJJLrvmcp1hOCLYRtdd68jIbEklbtnWUTwb26X/
	1oJ3zsiSDxjXDlUwXBedFbN8h8HCqyCcCTE3VgfWJ1OfspbR5BRBS0RtSYEfTZgF3qujIw4SUm8xi
	3IJU3trQ21tCfS6o4zkE1V3VrSdGjeJ6CYWKH6yhhtSsESNCh9ntHqAL+0ZY/HVDw/63sK/Oh0Mlr
	fU3f76x5sD5y+L++YPuFoO1DTcBolH09V1cfh3n+5SKm2uhnEuKHIJVgME5xhRKJ+kE0f+OTQWlYG
	WB4OxEkU/ha5KNMCFalg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3RF-00000006ZcM-3NkX;
	Tue, 23 Jun 2026 15:53:25 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3RD-00000006Zbh-1YEw
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 15:53:24 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7e93f93ed01so24986a34.3
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2026 08:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782230002; x=1782834802; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I++JfVnVFsPw1yoo9hJi6dyEkF7CGlb7WVfrcCKidlU=;
        b=Cdf1BIl/0XwoiEizd7PbOz/ob9B5IT+wpWewggxw6/2hGH3jbB2JgjrLYfGmrm4lq6
         MHAE8YftgLTsjX3imqvY201MTSYlDXpXdtoBmAEsc2weHg6Byf4/XnQ6/FnajnAXqCa0
         DU/0TyrBD797GuDil/gQ/bKPagoiqElsaZZNIn977a5N34+l7OQ4w8S8yaDfacdfwb6J
         G1krQ0N18XOwudraGI+wx+VWPe+enj36obEm3r7tqPZVrtPRdBX5Ntg5SAQzbdx67vRx
         c8GjrS7W4BqMGFPyu2xJFZtczUUquNvxEb2WqQoT0IokeG9BSuQe9Sgh9/uKUfhMZPZZ
         39Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230002; x=1782834802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I++JfVnVFsPw1yoo9hJi6dyEkF7CGlb7WVfrcCKidlU=;
        b=sp/Wd0A5EzTi9II8ADAP0Pn7hugrMNa/vyHCmBZEpjYZWd7D5I3WJK2yAYbtXwfscw
         Dvjz/mM3YLr3YhdrUNeVnLsZvE4vIZjFEdYr6LVOnkiMgx0ndc2L86eSA0pik94ShOt9
         CPOapnJTZZGScTcQH6Lm2uR6V+N0W9bNjlxvgi+VHVru0BI+90OT5b61KjMC2J+fVlSX
         05Ouqcw/+SD3EOGtSbdveFlDKfMHlrzqd/hCxc9Py3BgVuFf/4cD6SS9EokLaLiaIRoT
         DC0FQH3LdLu1gkKXtsb9EILwcU6PlETQv7RbjA/82DppyTyRr3El8jvZ03iHowdZNTXJ
         xrhw==
X-Forwarded-Encrypted: i=1; AFNElJ9JjGKWxVQf1xC0PuxjkJsc3hsLeGzIRlJtBYlpFAkuCsSKTEjF7Ma2KfbZf+FipFIpStiKvPV8X63pfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeDauoDOkeEK6zWiujQ+udQnC02qgjfVby0Y/rFKiBIyb0lflb
	+ZX2q9OmVlYAxc6TLzkIj5hjSw1cP/vBiu/7bDw7zE1+Vptq5pRUOWNf2Ji9m/zOCQI=
X-Gm-Gg: AfdE7ckbRGqUg6q+vjhKCPxD+grRmiBXrNqOfKyRyfNKTQz3UUB/AmkWK/xgT0xwtBY
	d78wkvu155DkxnCYs5o+QP85gQfV1+0ozdhl8vPngz8RqjMOF9361EnQbEuTUIcD++oqPBtfP7g
	9p1/qaUOsVRHTgqaPxb1WiHDkbQPWT3h8RUxVMvehHYTEXgHdWiuWD2Yn85hctPVrORajTKoz/N
	cATVG/YaSip6moGeVs+brXTUIECW64WmyAXKNParZIzEedrRFhZQqVxFBLoMIoydBYqOfgMT7QM
	PK1HM+olqIJ5z+wN1RycjtvdY5o1gtsVejPYo3NSs/A5eXrxeC79HlJ3acYmsm/T7ss05MZlSY9
	bBTVdQuvK0HnirtCaQtIZUesiv9BxqegSXEQ+6mW7b0mLarc+OJ9ZfROQiv3f7KZ2CF7DhaWrie
	zMxAFy+EVm2mbVNVkol8UZzCctOz8SwgOw5wylFZBzBoj3RTw=
X-Received: by 2002:a05:6830:6a94:b0:7e6:e0ab:416a with SMTP id 46e09a7af769-7e940b27070mr15147982a34.18.1782230001699;
        Tue, 23 Jun 2026 08:53:21 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.100.209])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9442e98e9sm9126112a34.25.2026.06.23.08.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 08:53:21 -0700 (PDT)
Message-ID: <80773b89-f333-4c82-99b5-3fca44ea93b3@sifive.com>
Date: Tue, 23 Jun 2026 10:53:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rcu: Use an intermediate irq_work to start
 process_srcu()
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Boqun Feng <boqun@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, frederic@kernel.org,
 neeraj.iitr10@gmail.com, urezki@gmail.com, boqun.feng@gmail.com,
 rcu@vger.kernel.org, Tejun Heo <tj@kernel.org>, bpf@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrea Righi <arighi@nvidia.com>,
 Zqiang <qiang.zhang@linux.dev>, linux-riscv@lists.infradead.org,
 Sarah Emery <sarah.emery@canonical.com>
References: <ab2yd35rm6OgZUmb@gpd4> <20260320222916.19987-1-boqun@kernel.org>
 <CAJM55Z-hiNDuu5UwoBe7m0wq+_WJrRY0cwopALUgpG+r3ixj8g@mail.gmail.com>
 <ajQPAk_ALP-84obp@MacBook-0RXW5>
 <CAJM55Z_15U7GssTOims1=J34CYSj=8CDE_di1kJYs5hE3=J53w@mail.gmail.com>
 <ajlW4oSzEqav6gxc@MacBook-0RXW5>
 <CAJM55Z_7N40ARWGoZg04p-NnAy-w10v4=Em-e4Bx4+oNYMGBLg@mail.gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAJM55Z_7N40ARWGoZg04p-NnAy-w10v4=Em-e4Bx4+oNYMGBLg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_085323_438423_E503E32D 
X-CRM114-Status: GOOD (  23.49  )
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

Hi Emil,

On 2026-06-23 4:34 AM, Emil Renner Berthing wrote:
> Quoting Boqun Feng (2026-06-22 17:38:10)
>> On Sat, Jun 20, 2026 at 05:25:25AM -0400, Emil Renner Berthing wrote:
>>> Quoting Boqun Feng (2026-06-18 17:30:10)
>>>> On Thu, Jun 18, 2026 at 08:11:36AM -0500, Emil Renner Berthing wrote:
>>>>> Quoting Boqun Feng (2026-03-20 23:29:16)
>>>>>> Since commit c27cea4416a3 ("rcu: Re-implement RCU Tasks Trace in terms
>>>>>> of SRCU-fast") we switched to SRCU in BPF. However as BPF instrument can
>>>>>> happen basically everywhere (including where a scheduler lock is held),
>>>>>> call_srcu() now needs to avoid acquiring scheduler lock because
>>>>>> otherwise it could cause deadlock [1]. Fix this by following what the
>>>>>> previous RCU Tasks Trace did: using an irq_work to delay the queuing of
>>>>>> the work to start process_srcu().
>>>>>>
>>>>>> [boqun: Apply Joel's feedback]
>>>>>> [boqun: Apply Andrea's test feedback]
>>>>>>
>>>>>> Reported-by: Andrea Righi <arighi@nvidia.com>
>>>>>> Closes: https://lore.kernel.org/all/abjzvz_tL_siV17s@gpd4/
>>>>>> Fixes: commit c27cea4416a3 ("rcu: Re-implement RCU Tasks Trace in terms of SRCU-fast")
>>>>>> Link: https://lore.kernel.org/rcu/3c4c5a29-24ea-492d-aeee-e0d9605b4183@nvidia.com/ [1]
>>>>>> Suggested-by: Zqiang <qiang.zhang@linux.dev>
>>>>>> Tested-by: Andrea Righi <arighi@nvidia.com>
>>>>>> Signed-off-by: Boqun Feng <boqun@kernel.org>
>>>>>
>>>>> Thanks for the patch, which is now upstream as
>>>>> 7c405fb3279b ("rcu: Use an intermediate irq_work to start process_srcu()")
>>>>>
>>>>> Unfortunately it seems to halt booting on the Allwinner D1 single-core RISC-V
>>>>> SoC both on the 7.0 and 7.1 kernels:
>>>>>
>>>>
>>>> By "single-core", is it only one CPU in that system?
>>>>
>>>>> https://esmil.dk/d1-7.0.txt
>>>>> https://esmil.dk/d1-7.1.txt
>>>>>
>>>
>>> Yes, the SoC only has one CPU core capable of running Linux at least.
>>>
>>>> From the callstack,
>>>>
>>>> [  243.002818] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>>> [  243.010681] task:kworker/0:0     state:D stack:0     pid:9     tgid:9     ppid:2      task_flags:0x4208060 flags:0x00000000
>>>> [  243.021858] Workqueue: device_link_wq device_link_release_fn
>>>> [  243.027587] Call Trace:
>>>> [  243.030079] [<ffffffff80745b66>] __schedule+0x232/0x530
>>>> [  243.035365] [<ffffffff80745e82>] schedule+0x1e/0x94
>>>> [  243.040298] [<ffffffff8074aa7a>] schedule_timeout+0x6e/0xa8
>>>> [  243.045929] [<ffffffff8004d6a0>] wakeup_preempt+0x8c/0x98
>>>> [  243.051380] [<ffffffff80746aee>] wait_for_completion+0x3a/0xb0
>>>> [  243.057267] [<ffffffff80087226>] __synchronize_srcu.part.0+0x4e/0x60
>>>> [  243.063712] [<ffffffff80084414>] rcu_tasks_get_gp_data+0xc/0x10
>>>> [  243.069699] [<ffffffff80490898>] device_link_release_fn+0x14/0x80
>>>> [  243.075850] [<ffffffff8003dbd0>] process_one_work+0xf8/0x1c8
>>>> [  243.081583] [<ffffffff8003e282>] worker_thread+0x11a/0x254
>>>> [  243.087127] [<ffffffff8003e164>] rescuer_thread+0x3a0/0x3a4
>>>> [  243.092755] [<ffffffff8003e164>] rescuer_thread+0x3a0/0x3a4
>>>> [  243.098381] [<ffffffff8004499e>] kthread+0xbe/0xe4
>>>> [  243.103231] [<ffffffff8001349e>] ret_from_fork_kernel+0x6/0xd0
>>>> [  243.109127] [<ffffffff800517a8>] schedule_tail+0x8/0xac
>>>> [  243.114410] [<ffffffff800448dc>] kthreads_online_cpu+0x0/0x4
>>>> [  243.120121] [<ffffffff8074be0a>] ret_from_fork_kernel_asm+0x12/0x18
>>>>
>>>> I will guess for some reasons the irq_work was missed or the IPI never
>>>> happened. Is it possible for you to enable trace points ipi_send_cpu and
>>>> ipi_entry to get more information?
>>>
>>> I have to admit I've not used tracepoints before, but it seems like only
>>> ipi_send_cpu and ipi_send_cpumask is available on RISC-V.
>>> I've now added trace_event=ipi:* and tp_printk to the command line, and this
>>
>> Thank you! Yeah, this is what I meant ;-)
>>
>>> is what I get:
>>> https://esmil.dk/d1-7.0-2.txt
>>>
>>
>>
>> [    0.071132] rcu:     Max phase no-delay instances is 1000.
>> [    0.077837] ipi_send_cpu: cpu=0 callsite=irq_work_queue+0x22/0x4c callback=srcu_irq_work+0x0/0x58
>>
>> Is this the last line you can see from your (serial?) console, or we are
>> missing a few more lines? Maybe it'll should the same hung task
>> messages?
> 
> Yes, sorry for not being clear about that. This is the exact same binary booted
> without the two extra command line parametrs:
> https://esmil.dk/d1-7.0-3.txt
> 
> But with the two parameters added the board reboots before getting to the hung
> task messages. The bootloader enables the watchdog, so I think what happens is
> that the kernel halts earlier with the tracepoints enabled, and doesn't get to
> load the watchdog driver to keep the machine from rebooting.
> 
> The same happens with just trace_event=ipi:* added, just without the last
> message above.
> 
>>
>> The ipi_send_cpu message means RCU was able to send an IPI, now if there
>> is no ipi_handler between the send and the hung task, that would mean
>> the IPI was missed.

Assuming that your OpenSBI version is exactly v1.3 per the boot log, and not
"v1.3 + patches", then you would indeed not be receiving IPIs. You need at least
this commit: https://github.com/riscv-software-src/opensbi/commit/446fa65eb579
(included in v1.4) or alternatively to add the CLINT to the M-mode devicetree.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
