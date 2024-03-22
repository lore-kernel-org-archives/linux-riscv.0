Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097ECC54E71
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 03:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BQ5n7OXbDvQf7H9XxeKX0l6ZGax1i8STrvLxogOy8w=; b=D3reCms5ldyYce
	G/vjTn+Xkn3H7PihnS3xeQjB3qQBgkviMJWzaG22mD6//Xy/otBApqApdip9x6rCQvtu9NtgaQunr
	JzOoFMn45uhtRYBIzQ0o45kjdcLcxamHfKDtosWKd2LXn2LitLKaiE4n624C2EjDiLY6srlyldfnk
	fQJhf0XFHU2K8q+I2xi0gHGEgDFJTBDKjDNQ4dszjjfhDhqQ8BvnQ0wXjB1pecIrzMuZ4fj2DJ98N
	lmhLtuCKjeL+nXV0ogafp9lPN+iEZLClTaYjzb8ojJC1FHmNSbKObtpUuJpU+pwwRYWTQHFUs1bU+
	Fy1YPl2uidHQ7/JBDTHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnVoZ-00000005feX-2McD;
	Fri, 22 Mar 2024 03:43:31 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnVoU-00000005fbC-0Mrt
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 03:43:28 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-366c49ee863so7214715ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 20:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711079004; x=1711683804; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TxrwCimaFyIjWf+99S22XQ+0Yy92SbX36MYkSACyHkI=;
        b=nIM6b/AitYtApYjXncn9vrfLVgUS0w2q3EUBgU+v5BcLda63FyTn5x5rhaGG43mqwv
         5HPzoCBP++hFXl89SswQ6rc8GQODatxooqfhfHyTkunWiglvOOet/IJ3dXocyAICWJ6p
         92YjfZI02+a1Eihix9CJJYKxPwdicZnD2yvgLNhVbTaQy+W1nU8mrGfqMaOByf/rTP8b
         ltG2TGEJALk/7LG75rfICjodnYf4tDLVsli+Gf7SVX3xKu28KVCKdc/TDyDTneb44jeB
         AiUNxQxEXgwljXXqNccRAZckdnoshBSCbT7pl5H0J2T1omD+SITDYYzzLPGuBc/3Vcoe
         x9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711079004; x=1711683804;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxrwCimaFyIjWf+99S22XQ+0Yy92SbX36MYkSACyHkI=;
        b=kjTujp1V1alQBJA7NYwUCRSNDaAt0e26N5Ru8AwwooAQFLp1UpJRp9EaFXXOyiAYEr
         3RNRfsji8wKWJkvB0J8TMhXU0mjLCnGAYQ5XexbjqE2W0h01N6TKx3gZE4++O6ti3Ej/
         xcR93dSSZ8mQZFwFDJCTohG1SBba7DV7ezBCBVwEceUY7anZow00I3KctVRZb6l6vLVL
         DJ5IKJ+6BmtSE+DjpeDPUnlUStEchWi8rI3rLrnHGdCPGbXRwIwpKa7VMgaypX7bwScm
         LxdLZpESYXd+rOqEpprHULWb9QoEfUqB5fBXlDy83uyHht4nzceX1DK5XhIcwjVTZiAU
         S5ww==
X-Forwarded-Encrypted: i=1; AJvYcCV2GPRmAIT3lERulxlI84Pgs02kFmtuouIUUgyzIuNV63s52INjtnAobhkJReiMN2BXp552XlJipiHJSDduKJQTxylqhb0T8LW9rl5aGXF8
X-Gm-Message-State: AOJu0YxB/urusF/KdJypUtwYcsn8v4wWSEJZpGlHjz0C0UA02lXj0C7b
	njMwGBzipElaCT7/YsMMR+znc7QA6RzAX+BqavxLQ8Dn9T9yfFkvTeT/n/dfZAc=
X-Google-Smtp-Source: AGHT+IGa+dG0fyL4hUTG3Wy0ov3wmOZJUbL2ipN3/WL93ib/M1xknmSqCPFZ/ccGlI5KyXkXVSO+Hw==
X-Received: by 2002:a05:6e02:e07:b0:368:5ee4:e5ab with SMTP id a7-20020a056e020e0700b003685ee4e5abmr1564361ilk.4.1711079004428;
        Thu, 21 Mar 2024 20:43:24 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.86.189])
        by smtp.gmail.com with ESMTPSA id u8-20020a056e02080800b00366c4a8990asm329288ilm.27.2024.03.21.20.43.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 20:43:24 -0700 (PDT)
Message-ID: <5c8c01be-d847-48bd-aea8-bf40a2576372@sifive.com>
Date: Thu, 21 Mar 2024 22:43:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RISC-V] [tech-j-ext] [RFC PATCH 5/9] riscv: Split per-CPU and
 per-thread envcfg bits
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, tech-j-ext@lists.risc-v.org,
 Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com,
 Evgenii Stepanov <eugenis@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
 <20240319215915.832127-6-samuel.holland@sifive.com>
 <CAKC1njSg9-hJo6hibcM9a-=FUmMWyR39QUYqQ1uwiWhpBZQb9A@mail.gmail.com>
 <40ab1ce5-8700-4a63-b182-1e864f6c9225@sifive.com>
 <17BE5F38AFE245E5.29196@lists.riscv.org>
 <CAKC1njTnheUHs44qUE2sTdr4N=pwUiOc2H1VEMYzYM84JMwe9w@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAKC1njTnheUHs44qUE2sTdr4N=pwUiOc2H1VEMYzYM84JMwe9w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_204326_195465_2C66B636 
X-CRM114-Status: GOOD (  24.39  )
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

Hi Deepak,

On 2024-03-20 6:27 PM, Deepak Gupta wrote:
>>>> And instead of context switching in `_switch_to`,
>>>> In `entry.S` pick up `envcfg` from `thread_info` and write it into CSR.
>>>
>>> The immediate reason is that writing envcfg in ret_from_exception() adds cycles
>>> to every IRQ and system call exit, even though most of them will not change the
>>> envcfg value. This is especially the case when returning from an IRQ/exception
>>> back to S-mode, since envcfg has zero effect there.
>>>
>>> The CSRs that are read/written in entry.S are generally those where the value
>>> can be updated by hardware, as part of taking an exception. But envcfg never
>>> changes on its own. The kernel knows exactly when its value will change, and
>>> those places are:
>>>
>>>  1) Task switch, i.e. switch_to()
>>>  2) execve(), i.e. start_thread() or flush_thread()
>>>  3) A system call that specifically affects a feature controlled by envcfg
>>
>> Yeah I was optimizing for a single place to write instead of
>> sprinkling at multiple places.
>> But I see your argument. That's fine.
>>
> 
> Because this is RFC and we are discussing it. I thought a little bit
> more about this.

Thanks for your comments and the discussion! I know several in-progress features
depend on envcfg, so hopefully we can agree on a design acceptable to everyone.

> If we were to go with the above approach that essentially requires
> whenever a envcfg bit changes, `sync_envcfg`
> has to be called to reflect the correct value.

sync_envcfg() is only needed if the task being updated is `current`. Would it be
more acceptable if this happened inside a helper function? Something like:

static inline void envcfg_update_bits(struct task_struct *task,
				      unsigned long mask, unsigned long val)
{
	unsigned long envcfg;

	envcfg = (task->thread.envcfg & ~mask) | val;
	task->thread.envcfg = envcfg;
	if (task == current)
		csr_write(CSR_ENVCFG, this_cpu_read(riscv_cpu_envcfg) | envcfg);
}

> What if some of these features enable/disable are exposed to `ptrace`
> (gdb, etc use cases) for enable/disable.
> How will syncing work then ?

ptrace_check_attach() ensures the tracee is scheduled out while a ptrace
operation is running, so there is no need to sync anything. Any changes to
task->thread.envcfg are written to the CSR when the tracee is scheduled back in.

> I can see the reasoning behind saving some cycles during trap return.
> But `senvcfg` is not actually a user state, it
> controls the execution environment configuration for user mode. I
> think the best place for this CSR to be written is
> trap return and writing at a single place from a single image on stack
> reduces chances of bugs and errors. And allows
> `senvcfg` features to be exposed to other kernel flows (like `ptrace`)

If ptrace is accessing a process, then task->thread.envcfg is always up to date.
The only complication is that the per-CPU bits need to be ORed back in to get
the real CSR value for another process, but this again is unrelated to whether
the CSR is written in switch_to() or ret_from_exception().

> We can figure out ways on how to optimize in trap return path to avoid
> writing it if we entered and exiting on the same
> task.

Optimizing out the CSR write when the task did not switch requires knowing if
the current task's envcfg was changed during this trip to S-mode... and this
starts looking similar to sync_envcfg().

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
