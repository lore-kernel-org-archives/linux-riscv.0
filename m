Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1B4D0D17D
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 23:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oroGFOtBttgddnEMNyN7nO8h0qBhLMffffyq6pt1mY8=; b=CeO0DIL3SVYp5t
	XTbmSCUZiKQn2dtEGDm6IDFJjVRkDjULOwYtm5FdWPn9oh/zTFOr2v5E+ETF1+NDwyNeMWK9W2pni
	H+E+MZPZk4Yrdp88zDEyp59GrK1coRMe5DolleOE5A8+yMxU0HvIpZ+Ep2Xltf4ynOfCLRyeMqHTn
	V/6iWSke+Yk0eCqmsc159BggxSocjXZGejMgXTGlHLeZQuwHKIzGzsrlzTQkjObwv5CflmHlU3OWJ
	ZHsyprK6d1ugAn0BmtfdbyybTLtktdCSdwp3LkcV6Wye3U8W2FuZn42yjPXK+lj5sIkUNh+R8Hntp
	8BnNaKS9HDna2ivvDEQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdcyg-0000000FkJB-2IJU;
	Wed, 07 Jan 2026 23:30:10 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdcyc-0000000FkIp-1svr
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 23:30:07 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-3e3dac349easo2247361fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 15:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1767828604; x=1768433404; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DD3+WPugILA6AK9V3BgRQ69JbKdSsxscgzBr4aMHJyI=;
        b=HZNJ7h/dxOon2Y2dreu5n/W+ZtDPZj9XAZlMLkfIhhdrBsODgt/wCGNR4lWq/cSM0I
         +PvA0rQSZVVPCq5+XLwLfEJGh4W1BDs1HHXLwkEsNaGsw+skbfrRdym6uxxLTxbfNZpI
         PLAdBTpgdfP0YeByw4hbT4xPXVqzo1Y/eppxt+Zsv3qUzJfS2pNglRi+SqfY0PGyoXZT
         pbEO6tNpII1TRS5MAC5ti1sTRIG9OI8gVgJBgbxbxPFxRLmAt7lkdB3KL2i2XqgVtr42
         Pz701RjKkp8sqSVsP2O1EMQVU6dNfnOvkoW54eLk3emeC6pnMUfCZvYHu/djHmroa75v
         EmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767828604; x=1768433404;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DD3+WPugILA6AK9V3BgRQ69JbKdSsxscgzBr4aMHJyI=;
        b=ZR3lnYOWrqw3ysAGVQGS8Gf3kyoY30af41rIg41k0e3U3yUpcwsIXbSZ+2mQ5hxpok
         Z2YqAmTralFaqyHGSPpFfMSblFQNDhvro5Xd4/luKg0pLkCcoV/2uopTipVY0nQx8GQS
         jxNbf83go31HLwT1Octu85hZojxbrIIZ8nyiJIYvvB1rGk+Q0155GthmPvWTvj9dW6rv
         wt9F9wd3UqPC8sO7r2mAkSs4mEfJ7dwJRRL2J1iNpvhI73SqieTfurT1fdjKW40eMPRA
         KvNzJQDZ606U/VlahZlUhvwpPGlg6PnvssNWNKZ1n/r65JIpUjs1flDl4ZO1GRTQs/tM
         0HDg==
X-Forwarded-Encrypted: i=1; AJvYcCUROsEOSXlAqqeeLL5o9NxMJVLHwg3Oe/L/n0BZRnoXamIM0Ad0migNZefIV7R8QbOOL/rjXq08d+Z9Ew==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOYzZjOo1HAXbsVvYbtg7uW1cuiVUmewW3k9WSyUTYKD0ElKx0
	16xVu3b9OwdcbkDEMZjMcglrvy/lLr+WvRAR3Fo1VxoJ92FMjgWFcyEuOzO/d3ptVio=
X-Gm-Gg: AY/fxX7NDUSHwhTqdMj7E/ke/QQ8Gj72NDMD4gvzxBqctv7DSOyRTSHJFkp31r+GUT1
	788xeUSHyY+/Eb/N2Nt1GED/mAyXFZWfV4RV1z7DJvIoPUrtOxj3+YC/jkQw6JS8G5u30ocU+wy
	Y2AgqGHhZ+hV8mikOLYw1Tei5WMtTYRAQsWi+U+b8s5Zq4521mjFh0D3Sq5UFIZm60ErVV4Ux2N
	GFCs28hmCMaW7wxuS08qL7F0RAv0vd3TiYWeTNkBWKiRouXq48EpTfNMunR6AAPIzPpgX2YpVTV
	PqNrhOg3F80tIikcV4bMe9gNBVXtIjAI7wdOOPi8RlW0pnCoeO7XwNVUoxwlQp9bV1J+ZVanLtV
	MbGR7AymTsRUCczdXBe8nronf/bz5F9y59v4l/21yoJwaY7uawXXpq681QkH9jxEIB8lwrfxBQa
	Ce7nq1dnYQIz7iq4nAQIGfq1PPtYvI
X-Google-Smtp-Source: AGHT+IEbrWosXtHfAjh0EHHCNxNQExF8ZdJBVaTpWjr+5/PED+E0A/kj02pUGytgAZFj/rBktqDFKw==
X-Received: by 2002:a05:6870:934b:b0:3f5:aced:c441 with SMTP id 586e51a60fabf-3ffc0993d08mr2061071fac.4.1767828604589;
        Wed, 07 Jan 2026 15:30:04 -0800 (PST)
Received: from [100.64.0.1] ([170.85.11.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa4de8cbfsm4035171fac.3.2026.01.07.15.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 15:30:04 -0800 (PST)
Message-ID: <06ac0b87-d398-4cb0-a614-760bfe41cf7f@sifive.com>
Date: Wed, 7 Jan 2026 17:30:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv, bpf: Emit fence.i for BPF_NOSPEC
To: Luis Gerhorst <luis.gerhorst@fau.de>,
 Lukas Gerlach <lukas.gerlach@cispa.de>
Cc: ast@kernel.org, bjorn@kernel.org, bpf@vger.kernel.org,
 daniel.weber@cispa.de, daniel@iogearbox.net, jo.vanbulck@kuleuven.be,
 linux-riscv@lists.infradead.org, luke.r.nels@gmail.com,
 marton.bognar@kuleuven.be, michael.schwarz@cispa.de, palmer@dabbelt.com,
 pjw@kernel.org, xi.wang@gmail.com, cleger@rivosinc.com, palmer@rivosinc.com,
 conor.dooley@microchip.com, andrew@sifive.com
References: <87y0m996b2.fsf@fau.de>
 <20260107095406.4082-1-lukas.gerlach@cispa.de> <87sechz4x3.fsf@fau.de>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <87sechz4x3.fsf@fau.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_153006_531867_9E6CBEBA 
X-CRM114-Status: GOOD (  34.65  )
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

On 2026-01-07 11:52 AM, Luis Gerhorst wrote:
> Lukas Gerlach <lukas.gerlach@cispa.de> writes:
> 
>> Regarding bpf_jit_bypass_spec_v1/v4(): currently this is per-architecture.
>> What we need is per-processor granularity, so we can disable mitigations
>> on in-order cores and keep them enabled on vulnerable out-of-order processors.
> 
> Yes, sorry this was unclear. I just wanted to point out that once you
> have that infrastructure you can implement them as follows:
> 
> bpf_jit_bypass_spec_v1/v4() {
>   if (RV_CPU_IN_ORDER())
>     return true;
>   else
>     return false;
> }
> 
> But you are right that the definition of RV_CPU_IN_ORDER() is still
> missing of course.
> 
>> Regarding fence.i being an extension: all RISC-V processors supported by the
>> kernel that are vulnerable to these attacks support this instruction.
> 
> I am not sure if I misunderstand the "that are vulnerable to these
> attacks".
> 
> If you mean that vulnerable CPUs always have fence.i: What if a CPU
> still does not support the instruction (no matter if it is vulnerable or
> not)?
> 
> If I understand the RISC-V JIT correctly, it will then still generate
> fence.i with this patch. When this eBPF program is then invoked the
> CPU will panic upon reaching the fence.i which is a invalid opcode as
> far as this CPU is concerned. Or is there some ifdef I am missing here?
> 
> I would assume you need something like this:
> 
> case BPF_ST | BPF_NOSPEC:
>   if (riscv_has_extension_likely(RISCV_ISA_EXT_ZIFENCEI))
>     emit_fence_i(ctx);
>   break;
> 
> Or is there some guarantee that this extension is always available? I
> read [3] as implying that this is no longer the case with the 2.0
> instruction set for unprivileged. Does this also mean it is an optional
> extension for the privileged ISA?

The Zifencei extension is no longer a mandatory part of the ISA, but it is
mandatory for Linux. Linux requires at least "rv32ima or rv64ima, as defined by
version 2.2 of the user ISA and version 1.10 of the privileged ISA".

Notably, in version 2.2 of the user ISA, the Zifencei extension was still an
unnamed subset of the I extension, so it is included in the above requirement.
It was later removed from the I extension and given its own name, which is why
we have weirdness like the code below. (You can see in arch/riscv/Makefile where
we unconditionally add either ISA version 2.2 or Zifencei to CFLAGS.)

> 
> RISC-V cpufeature.c had this in [2]:
> 
> 		/*
> 		 * Linux requires the following extensions, so we may as well
> 		 * always set them.
> 		 */
> 		set_bit(RISCV_ISA_EXT_ZICSR, this_isa);
> 		set_bit(RISCV_ISA_EXT_ZIFENCEI, this_isa);
> 
> But as of [1] it was changed to:
> 
> 		if (acpi_disabled) {
> 			set_bit(RISCV_ISA_EXT_ZICSR, source_isa);
> 			set_bit(RISCV_ISA_EXT_ZIFENCEI, source_isa);
> 
> So based on that I would assume fence.i may not always be supported.

This is just a quirk of the parsing code. As mentioned in [1], older devicetrees
were written while Zifencei was an implicit part of I, so we don't expect it to
appear in the devicetree. The ACPI table definition was written after Zifencei
was a separate extension, so we do expect Zifencei to appear on its own in the
ACPI table. But it is still required. (We don't currently check that all
extensions required by the kernel are actually present; this will be done as
part of the RVA23 enablement.)

> But I also found that 921ebd8f2c08 ("RISC-V: Allow userspace to flush
> the instruction cache") seems to assume that fence.i always works (see
> local_flush_icache_all() which I assume runs in the kernel).

Yes, the kernel definitely won't run if fence.i is missing, so we don't need to
worry about such hardware. We could probably document this better.

Regards,
Samuel

> Even if the CPU is known vulnerable but does not support the extension,
> it will be better not to generate the instruction. If we still want to
> do something about these CPUs, maybe add a warning message to advise the
> user that unpriv eBPF should definately be kept disabled on this CPU?
> 
> [1] https://lore.kernel.org/all/20230711224600.10879-1-palmer@rivosinc.com/
> [2] https://lore.kernel.org/all/20230607-nest-collision-5796b6be8be6@spud/
> [3] https://docs.riscv.org/reference/isa/unpriv/zifencei.html
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
