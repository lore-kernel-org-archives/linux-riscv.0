Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74473C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xflSE0L0hRAAHXzFPzCEZVzTY42oCegJ1S58h8M7a/o=; b=hJ3U7Z5yk/jsNipnVC3fJtrXh1
	FsfElAAIfjNCs4GPBFXdFYuLLdpt0ZNXkIGxnWKjzgMsqTBETJjNPAvJ7n4xQ24kvGxk1+aLXo761
	yCZHcybGZ29Prkp071gMS3IUbN2I66LGRlgWIYeDPbUNZAO68+v7W2SC8cuTjY3yj1pdZEVLch5ri
	PrIXV02KnFF5TURxO+nZNBdMOhu5dLadqJvEBgjIE9ncxOYUzcj+0DlKSSIRKIIkQrpEToWcfjJaJ
	XfhV1PgDDfQVyTaIGAvQGnUbg6GtTe63DKVj/gUBolgraHa1ttYbYUhEpdtkSATuRJn5lk9iw5lDR
	51tKRZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfEtR-00000008Ojz-430h;
	Wed, 28 Feb 2024 08:02:21 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfEtO-00000008OhB-1nT4
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 08:02:20 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e55bb75c9eso576391b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 00:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709107336; x=1709712136; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ihZBz7OwN5ETOgMmy5LVC1SqPJA8PdSxZfkW50G4hxc=;
        b=n0F9ICFUVxZ3tXM7Eil1x4qPsfNITGYx26LJrSQj955XmBmRPylDdLSEmwmNazhjp0
         DLn7YaLTHzqC/4qLlrLRvnqzgliQjZ46q1NfgN4njPBX2+Aiqlueq5ldC1dwWG9Uqh/X
         03sge59RHZnsIhEx7nlKevuk0gNMMnjjvZf08d6BvUjvkZ/NKGyV/aWTB3+EY+55Dqou
         ZE3D6yk5VilLSt4m5ySZi28p7ohIs5EZh6yUBA8ZNqbZUWN3gfxpszg0LRKkIcV0YP4P
         kbonFY+bsvBydVZ2i+uXgOZXLoSxtlEU/yyqNxKKTtp5puq1FsEFyzaSHa3cMZnOvqkj
         hlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709107336; x=1709712136;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihZBz7OwN5ETOgMmy5LVC1SqPJA8PdSxZfkW50G4hxc=;
        b=N0Nlc7dRp21mvCGdapXXeDNaWmqklQq8mOEYgG5zNTbq4oAE+OJzBbcKXYgMfAiJjM
         Ic7zlRuw+a+Xuh0xzolVi6hY2+8/5V7VByemhBbkrS4ARBzqWiOfllIzbTJwkHaiRq8T
         4qtTQdK0Uj4oBn8DEDqpXpM89Vyot8FSk+0ukXlqR2NL/manWWPa8j1/wg4mSlafk10h
         Ffb/thV2u+JzmQF4ltN2GuEGKjaC24WocAmkR19KqTHoDR5OOcUOJlE6uDmI/jPj7ZlB
         b9EVSMM9i6KHxy5EajWmsDWxQNXIwHbvOjubg/L8AZxHfso7bsEUonMaB6Xc3cRgLqZ/
         NdIw==
X-Forwarded-Encrypted: i=1; AJvYcCWOzw7Gm9NmT2le56+NCrciun5nnNbgB5cCznQ8dALjMZiZzPYJq7lK3YBjITB42TBRk7Z4hIe/+TPvG29a69uiqDiXff0anRarmIUcMfCa
X-Gm-Message-State: AOJu0YxjqreK9lACNmz+oqFspET15A3/PhwbzVaeFSOalJl+fhj0sNli
	2v0uUugwyPAZvYr0LCHuyGqO1JRb6UqGgCpHtHvH4EZ9TJFdEDp7Ffg2VAWGDII=
X-Google-Smtp-Source: AGHT+IG0hIgUBsBFWAzvziUqfTJGoXEYw1oTO8UUN72MDxoUA1WaSDnmDxqIvlF5IiMIpnjt92pXzw==
X-Received: by 2002:a05:6a00:320b:b0:6e4:f32a:4612 with SMTP id bm11-20020a056a00320b00b006e4f32a4612mr10099798pfb.16.1709107336044;
        Wed, 28 Feb 2024 00:02:16 -0800 (PST)
Received: from [172.16.0.12] (c-67-188-2-18.hsd1.ca.comcast.net. [67.188.2.18])
        by smtp.gmail.com with ESMTPSA id q5-20020aa79825000000b006e56d880015sm328472pfl.140.2024.02.28.00.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 00:02:15 -0800 (PST)
Message-ID: <6810b450-2c1b-4f0d-b241-1179c1df6805@rivosinc.com>
Date: Wed, 28 Feb 2024 00:02:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf: RISCV: Fix panic on pmu overflow handler
Content-Language: en-US
To: Fei Wu <fei2.wu@intel.com>, atishp@atishpatra.org, anup@brainfault.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20240228053822.2610915-1-fei2.wu@intel.com>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240228053822.2610915-1-fei2.wu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_000218_745672_096ADB2D 
X-CRM114-Status: GOOD (  17.32  )
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

On 2/27/24 21:38, Fei Wu wrote:
> (1 << idx) of int is not desired when setting bits in unsigned long
> overflowed_ctrs, use BIT() instead. This panic happens when running
> 'perf record -e branches' on sophgo sg2042.
> 
> [  273.311852] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000098
> [  273.320851] Oops [#1]
> [  273.323179] Modules linked in:
> [  273.326303] CPU: 0 PID: 1475 Comm: perf Not tainted 6.6.0-rc3+ #9
> [  273.332521] Hardware name: Sophgo Mango (DT)
> [  273.336878] epc : riscv_pmu_ctr_get_width_mask+0x8/0x62
> [  273.342291]  ra : pmu_sbi_ovf_handler+0x2e0/0x34e
> [  273.347091] epc : ffffffff80aecd98 ra : ffffffff80aee056 sp : fffffff6e36928b0
> [  273.354454]  gp : ffffffff821f82d0 tp : ffffffd90c353200 t0 : 0000002ade4f9978
> [  273.361815]  t1 : 0000000000504d55 t2 : ffffffff8016cd8c s0 : fffffff6e3692a70
> [  273.369180]  s1 : 0000000000000020 a0 : 0000000000000000 a1 : 00001a8e81800000
> [  273.376540]  a2 : 0000003c00070198 a3 : 0000003c00db75a4 a4 : 0000000000000015
> [  273.383901]  a5 : ffffffd7ff8804b0 a6 : 0000000000000015 a7 : 000000000000002a
> [  273.391327]  s2 : 000000000000ffff s3 : 0000000000000000 s4 : ffffffd7ff8803b0
> [  273.398773]  s5 : 0000000000504d55 s6 : ffffffd905069800 s7 : ffffffff821fe210
> [  273.406139]  s8 : 000000007fffffff s9 : ffffffd7ff8803b0 s10: ffffffd903f29098
> [  273.413660]  s11: 0000000080000000 t3 : 0000000000000003 t4 : ffffffff8017a0ca
> [  273.421022]  t5 : ffffffff8023cfc2 t6 : ffffffd9040780e8
> [  273.426437] status: 0000000200000100 badaddr: 0000000000000098 cause: 000000000000000d
> [  273.434512] [<ffffffff80aecd98>] riscv_pmu_ctr_get_width_mask+0x8/0x62
> [  273.441169] [<ffffffff80076bd8>] handle_percpu_devid_irq+0x98/0x1ee
> [  273.447562] [<ffffffff80071158>] generic_handle_domain_irq+0x28/0x36
> [  273.454151] [<ffffffff8047a99a>] riscv_intc_irq+0x36/0x4e
> [  273.459659] [<ffffffff80c944de>] handle_riscv_irq+0x4a/0x74
> [  273.465442] [<ffffffff80c94c48>] do_irq+0x62/0x92
> [  273.470360] Code: 0420 60a2 6402 5529 0141 8082 0013 0000 0013 0000 (6d5c) b783
> [  273.477921] ---[ end trace 0000000000000000 ]---
> [  273.482630] Kernel panic - not syncing: Fatal exception in interrupt
> 
> Signed-off-by: Fei Wu <fei2.wu@intel.com>
> ---
>   drivers/perf/riscv_pmu_sbi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 16acd4dcdb96..335171db9647 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -731,14 +731,14 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
>   		/* compute hardware counter index */
>   		hidx = info->csr - CSR_CYCLE;
>   		/* check if the corresponding bit is set in sscountovf */
> -		if (!(overflow & (1 << hidx)))
> +		if (!(overflow & BIT(hidx)))
>   			continue;
>   
>   		/*
>   		 * Keep a track of overflowed counters so that they can be started
>   		 * with updated initial value.
>   		 */
> -		overflowed_ctrs |= 1 << lidx;
> +		overflowed_ctrs |= BIT(lidx);
>   		hw_evt = &event->hw;
>   		riscv_pmu_event_update(event);
>   		perf_sample_data_init(&data, 0, hw_evt->last_period);

Thanks for the fix.Can you modify the other two instance of 1<< as 
pointed by Alex as well. They are harmless because 32 counters supported 
at max but improves the code quality.
With that:
Reviewed-by: Atish Patra <atishp@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
