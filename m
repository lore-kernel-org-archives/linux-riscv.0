Return-Path: <SRS0=vm5i=MN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E34C636C9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 08:26:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2A4860725
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 08:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2A4860725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PBuuE41UUvUZa9qM6s4PwmXrTu2atG/vUcuh1gmCZUA=; b=GnGSVDj8RDLcHPnCIY6VWiJxtc
	FZnB5oXQ9FIXwztVZ6Q7++ptw3JfXpwniMV5z+vqMJOgO6shCm8GqINaoFlGiTOsm5a9QASMMdi6u
	Zocjw2pgNPoUYbadI5e8QktceNfwfWtAwAnH42AQWqq6L6SseP2snTvq0hu6SDdhj0IP/z1s/HlLj
	37Dvi13qC8k/6uwiiR6H3ZjnkIGlVM9Olr3xvWoMtXkx/iX8PM/U3KlaHjXiGDGtkHsoraAPnyqVm
	2nyFUS4iNV8xA4v0N7/tnpNqZGUrN4C1RxY2ZiyNHrEQuAgDbZQFA3cUSVb3ZULTvSicEm9qoXQnY
	RoAS5Ldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m67YG-00Ethj-AH; Wed, 21 Jul 2021 08:26:00 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m67YC-00Etgm-FP
 for linux-riscv@lists.infradead.org; Wed, 21 Jul 2021 08:25:57 +0000
Received: by mail-pg1-x52d.google.com with SMTP id u14so1158299pga.11
 for <linux-riscv@lists.infradead.org>; Wed, 21 Jul 2021 01:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=vBg444yi+87imAkmc8sY7qKHbhkMgnmYwiMleYRcDQA=;
 b=b5dkr5tjmBfNlEhYVPPCwpR6vPr23Iu2UbYhvvovWxTo8/q35vky3waezgPJqeWHg0
 z3fhdpI/Jd4GrKIZ2ZT5325/tdXAfgfsjoRRPBjlgQOJLt6+8Ezt2faQfaSpHJ271zPj
 49gQXK/6I4d2XCEYpyrCZCVPX4QoNKR8r0ehdLTTi1j3Wvt8AmjPr+ac3iLGjl7p9FcG
 3EpT+jEQJCe4EoNziCPeicv/aNffMs6EFP45eIH04Nxc0ENxN6UBqJ4Leyf1k2QTVM5N
 eW/WQ/Y5ktxQ4aD1EUr1nt5iLlQcwf8RxS4uaT4cGR7xR2oXffx6p4ZQ0BP2LdL54EYD
 g6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=vBg444yi+87imAkmc8sY7qKHbhkMgnmYwiMleYRcDQA=;
 b=rQKt0MY69xYmW2d9hgPfl8JCpSlav4O5Fx4BNvZx1+JjvdBByIcou4UZg3OQtCrHCY
 N7PM0nXbRZBJajs6aRnXQEmrsZcxOBVX3KpcDTzvuHxPMtZYivglC/aaoFb7WLr7V2yq
 k6bmwFBfTwkuxBDbqllyjq62i+R+Nq4S9NZqHEJGNDU+1wnExwp/cnfi3otEv/APi1qb
 eK6AIIpWtq3kWBqCykvQ2pkIc4mXNGvFgqbnvz9lKWdKeqcK4+bu6EVgYwjUxGkltdIx
 c+g6EdjywkI7zbk4lsX2lTIBwlkR6L1J5L2S7aYqQ732hC27exxNakGTkw/q5m3eSyFc
 PuDA==
X-Gm-Message-State: AOAM53217eOdt31OG0+VACsXmOMDuTAW+CrnB5eDpt89ygd/NJtgpiHW
 oMU6T6sux1BwZYL7jhELm/g=
X-Google-Smtp-Source: ABdhPJyp3wPifp0Z7RvBWkZXJVkbMCpMF+b+8MUImfdzOYh8IoP2yQ+sf3cBYhAMhyjPLI/eS111uQ==
X-Received: by 2002:a63:470b:: with SMTP id u11mr34901772pga.340.1626855955411; 
 Wed, 21 Jul 2021 01:25:55 -0700 (PDT)
Received: from [0.0.0.0] (jp.bgp.twd2.net. [2a0c:b641:571::1])
 by smtp.gmail.com with ESMTPSA id s193sm26894738pfc.183.2021.07.21.01.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 01:25:55 -0700 (PDT)
Subject: Re: [PATCH RESEND] riscv: stacktrace: Fix NULL pointer dereference
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210716214051.32eea3a8@xhacker>
From: twd2 <twd2.me@gmail.com>
Message-ID: <15a3766f-6958-95a8-2cb8-601b35118d56@gmail.com>
Date: Wed, 21 Jul 2021 16:25:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210716214051.32eea3a8@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_012556_588509_8E99751B 
X-CRM114-Status: GOOD (  17.27  )
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

Tested-by: Wende Tan <twd2.me@gmail.com>


On 2021/7/16 21:40, Jisheng Zhang wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> When CONFIG_FRAME_POINTER=y, calling dump_stack() can always trigger
> NULL pointer dereference panic similar as below:
>
> [    0.396060] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc5+ #47
> [    0.396692] Hardware name: riscv-virtio,qemu (DT)
> [    0.397176] Call Trace:
> [    0.398191] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000960
> [    0.399487] Oops [#1]
> [    0.399739] Modules linked in:
> [    0.400135] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc5+ #47
> [    0.400570] Hardware name: riscv-virtio,qemu (DT)
> [    0.400926] epc : walk_stackframe+0xc4/0xdc
> [    0.401291]  ra : dump_backtrace+0x30/0x38
> [    0.401630] epc : ffffffff80004922 ra : ffffffff8000496a sp : ffffffe000f3bd00
> [    0.402115]  gp : ffffffff80cfdcb8 tp : ffffffe000f30000 t0 : ffffffff80d0b0cf
> [    0.402602]  t1 : ffffffff80d0b0c0 t2 : 0000000000000000 s0 : ffffffe000f3bd60
> [    0.403071]  s1 : ffffffff808bc2e8 a0 : 0000000000001000 a1 : 0000000000000000
> [    0.403448]  a2 : ffffffff803d7088 a3 : ffffffff808bc2e8 a4 : 6131725dbc24d400
> [    0.403820]  a5 : 0000000000001000 a6 : 0000000000000002 a7 : ffffffffffffffff
> [    0.404226]  s2 : 0000000000000000 s3 : 0000000000000000 s4 : 0000000000000000
> [    0.404634]  s5 : ffffffff803d7088 s6 : ffffffff808bc2e8 s7 : ffffffff80630650
> [    0.405085]  s8 : ffffffff80912a80 s9 : 0000000000000008 s10: ffffffff804000fc
> [    0.405388]  s11: 0000000000000000 t3 : 0000000000000043 t4 : ffffffffffffffff
> [    0.405616]  t5 : 000000000000003d t6 : ffffffe000f3baa8
> [    0.405793] status: 0000000000000100 badaddr: 0000000000000960 cause: 000000000000000d
> [    0.406135] [<ffffffff80004922>] walk_stackframe+0xc4/0xdc
> [    0.407032] [<ffffffff8000496a>] dump_backtrace+0x30/0x38
> [    0.407797] [<ffffffff803d7100>] show_stack+0x40/0x4c
> [    0.408234] [<ffffffff803d9e5c>] dump_stack+0x90/0xb6
> [    0.409019] [<ffffffff8040423e>] ptdump_init+0x20/0xc4
> [    0.409681] [<ffffffff800015b6>] do_one_initcall+0x4c/0x226
> [    0.410110] [<ffffffff80401094>] kernel_init_freeable+0x1f4/0x258
> [    0.410562] [<ffffffff803dba88>] kernel_init+0x22/0x148
> [    0.410959] [<ffffffff800029e2>] ret_from_exception+0x0/0x14
> [    0.412241] ---[ end trace b2ab92c901b96251 ]---
> [    0.413099] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>
> The reason is the task is NULL when we finally call walk_stackframe()
> the NULL is passed from __dump_stack():
>
> |static void __dump_stack(void)
> |{
> |        dump_stack_print_info(KERN_DEFAULT);
> |        show_stack(NULL, NULL, KERN_DEFAULT);
> |}
>
> Fix this issue by checking "task == NULL" case in walk_stackframe().
>
> Fixes: eac2f3059e02 ("riscv: stacktrace: fix the riscv stacktrace when CONFIG_FRAME_POINTER enabled"
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/stacktrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index bde85fc53357..7bc8af75933a 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -27,7 +27,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  		fp = frame_pointer(regs);
>  		sp = user_stack_pointer(regs);
>  		pc = instruction_pointer(regs);
> -	} else if (task == current) {
> +	} else if (task == NULL || task == current) {
>  		fp = (unsigned long)__builtin_frame_address(1);
>  		sp = (unsigned long)__builtin_frame_address(0);
>  		pc = (unsigned long)__builtin_return_address(0);

Thanks.
Wende


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
