Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D10D232C5
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 03:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdoL331qWr3eZQSsNcHqEu6jtjsVpWxt8e5nGbcDtcM=; b=K4m3mAMaO7E15u
	rhWn58OFeXQOvUx9kzaWX/4igXrEt9va6KZBFhPWx0gRRnZ26q2EYii7SkwRALoTMIjaUlPyO8Ma0
	hnjpgF6ycy2NGyPHi0jes/kaqRUpsxeibBZK70+cFNzc5PTrdx7aUFFORWkZz7VNHOOPD1/xCjitB
	10FqDKq8tDk8YTCllOUkEcuCh3SE3SPA1Y0NyK1p7Deo6BQNDt2SDGbG3btEg9knE1P38flsaJgwm
	G54ltbF/KSIiBXTpoTZ0h5SwaorB1OTKQdEKXOOJmKxpA0uuLL2hmO1jvB0fyw46Z8N0IcPauV9IH
	LFt3DZEmIRCZ+0WlSiAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve3JI-00000001BZv-1L2D;
	Fri, 09 Jan 2026 03:37:12 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve3JE-00000001BYf-3vuV
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 03:37:10 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c13771b2cf9so2784273a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 19:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767929827; x=1768534627; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xvMgk2ec00T+2tDUQKQimVsmG/1WSzd9XK1gELLELo0=;
        b=Xirk7xGkYeLNQBC7tt33GdNm82kLWJ293LX74mqyw9DbWudLxuRxvCIibNElo9gypf
         Twlmw9cTtaFPZPFpY6cmvWpI8LvD0z/UVQXEaYiw3ZR03TCrElM4HF74v8cK3YsdcT7Z
         73RGKQZ9ndu8VL3U2Kflt1cq8rYJElcRziU8cPK3k9QSPyohbtJ+AbUFpAUUnvRdbGlk
         4SavKv0SHzyNfB3fLW6FxWkX4w9zXJC8nP6ZIqR0yKptIkKn1rWAlO5P+SVdfVQ3xI1O
         Z5RsfkTKeMjBPgu8v8rKs7asCUPJ9mwCZy4rODbwfDKuhOxbnE6zRNMo4Eme80SRDeGh
         UHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767929827; x=1768534627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvMgk2ec00T+2tDUQKQimVsmG/1WSzd9XK1gELLELo0=;
        b=xGz/muHcKn1ndINKUk8Q03HcO+rCbRtN6rYCL12gjpDJ9ilObSL6o9/8TyeBEYguHp
         FcE7Z0/K+By3WYUPCstTQDMlw1vjSidLNtvIX/HsTBaU24ACXPGTlZCFbM1OsXP42lXS
         CvOFPJ5u7F/Wav+zx2gjyWTdfEqYafuIboLsae68ojm2mz2yQ/vtKnhBru6+aX6hrXCi
         Y2ip9ZnyMfSsy9OIoOQpCwGyeqbjOnjky/dhDV3qekg76pzBsLTGYWye4n+/sQrtrb00
         0YzLs+ebcCX8giH3sYOJa9lMBKwPvMhPfHn6oodecNBwOtHZp1baHpnNDnAPfTQVPU54
         +pFA==
X-Forwarded-Encrypted: i=1; AJvYcCWl0cdMzDRALNj9TZjN8Xt14RoBqdEtrEGfaiFAfcqJzTP/USapeSk0GlntmouqwY30GOGvgWKV2pf4cQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKAOSEjsZcETH3dUUir52Yez2ZAKfEGdpF2Couzzr8cqMNkgnP
	LnCzfP+cHMJNjGOreNYL0PnAveX8HXx/gUWLi4hVBXeqSdUhlbFIND6y
X-Gm-Gg: AY/fxX44BnuvdgxWbf+QXsEJ8f59xVJ1ryI7KfxZQZE/O+DLgJZj+z8OwdjqqsqSeaE
	SeW9NhcvVho5R+VMbgQi2k6nlQqEkc6csNt2CGREHtge4yb7mr56jtkf9vQsd2WgCTqsg+/LA1V
	F3oJcGZUiQwtQdAJo7e+IbarKBK5prYwOjE1kFSbQXOsj8ejKjVnYpEU9n0TjEaiYGx3DsEMtNT
	iCIVDaRlzNJ0TjDtwkp1MwFGaWn04RlTpx6nX4WLhzZzyYCQEv/i8xM3KOaZGHTYcS/usC0Ujsr
	hAiM5Kf5L5hFzBbFzxgYdMZAB7aNucyWYBHcdDJNEMVES7eHnBEoeI4+Eu+e36DnJ68ZH0wPQ7W
	LLgXU0rSeanMcBl6BVGrmSE8L0EJyvUKXQnXTi/MrcoMbIOgru8p+uzQ//jB1/yg3LeDFHSMX0P
	SWxMqf
X-Google-Smtp-Source: AGHT+IF7pN2RRcT7o1Bm9PX616WUEnmMreEO0XlKyvrLSnpPAehSojiUVi7qiV5AQMRrUi5ZczuMQA==
X-Received: by 2002:a05:6a21:9999:b0:35e:6a5b:cbc9 with SMTP id adf61e73a8af0-3898f9904f5mr7963005637.50.1767929826972;
        Thu, 08 Jan 2026 19:37:06 -0800 (PST)
Received: from [0.0.0.0] ([8.222.167.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8afba8sm9021286a91.13.2026.01.08.19.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 19:37:06 -0800 (PST)
Message-ID: <702eb23c-7205-4de1-b56d-eedac6feae46@gmail.com>
Date: Thu, 8 Jan 2026 19:41:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv, bpf: Emit fence.i for BPF_NOSPEC
To: Lukas Gerlach <lukas.gerlach@cispa.de>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, sorear@fastmail.com,
 tech-speculation-barriers@lists.riscv.org
Cc: bjorn@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 luke.r.nels@gmail.com, xi.wang@gmail.com, palmer@dabbelt.com,
 luis.gerhorst@fau.de, daniel.weber@cispa.de, marton.bognar@kuleuven.be,
 jo.vanbulck@kuleuven.be, michael.schwarz@cispa.de
References: <20251228173753.56767-1-lukas.gerlach@cispa.de>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20251228173753.56767-1-lukas.gerlach@cispa.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_193708_995914_B935AB57 
X-CRM114-Status: GOOD (  27.29  )
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

Hi Lukas,

Stefan and I have some doubts on fence.i's effectiveness as speculation
barrier. Flushing entire local instruction cache and instruction pipeline
is not absolutely necessary on impl having coherent I/D caches. Quoting
from Unprivileged SPEC ver. 20250508:

"The FENCE.I instruction was designed to support a wide variety of
  implementations. A simple implementation can flush the local instruction
  cache and the instruction pipeline when the FENCE.I is executed. A more
  complex implementation might snoop the instruction (data) cache on every
  data (instruction) cache miss, or use an inclusive unified private L2
  cache to invalidate lines from the primary instruction cache when they
  are being written by a local store instruction. If instruction and data
  caches are kept coherent in this way, or if the memory system consists of
  only uncached RAMs, then just the fetch pipeline needs to be flushed at a
  FENCE.I"

There's the question on overhead, too. Perhaps there's a more accurate and
lightweight insn available? I'm not an expert in u-arch. My gut feeling is
that we should not be dependent on specific impl's behavior and the riscv
SPEC should provide guidelines on speculation barrier instructions and how
to use them. Thus, I'm forwarding this to the Speculation Barriers Task-
Group, which I hope should be the perfect place to discuss such kind of
issues. @Speculation Barriers TG Please share your thoughts. Note that we
are dealing with existing HW, so we expect something to be working with
current SPEC and actual silicon. I'd be happy if I'm proven wrong, and
fence.i can actually be a speculation barrier. That's also a relief. Thank
you everyone.

BTW, per SPEC:

  "The FENCE.I only synchronizes the local hart, and the OS can reschedule
   the user hart to a different physical hart after the FENCE.I. This would
   require the OS to execute an additional FENCE.I as part of every context
   migration"

fence.i is local. I know some core does a broadcast and try to make it a
global fence.i, but this is not required by the SPEC.

Bo

On 12/28/25 09:37, Lukas Gerlach wrote:
> The BPF verifier inserts BPF_NOSPEC instructions to create speculation
> barriers. However, the RISC-V BPF JIT emits nothing for this
> instruction, leaving programs vulnerable to speculative execution
> attacks.
> 
> Originally, BPF_NOSPEC was used only for Spectre v4 mitigation, programs
> containing potential Spectre v1 gadgets were rejected by the verifier.
> With the VeriFence changes, the verifier now accepts these
> programs and inserts BPF_NOSPEC barriers for Spectre v1 mitigation as
> well. On RISC-V, this means programs that were previously rejected are
> now accepted but left unprotected against both v1 and v4 attacks.
> 
> RISC-V lacks a dedicated speculation barrier instruction.
> This patch uses the fence.i instruction as a stopgap solution.
> However an alternative and safer approach would be to reject vulnerable bpf
> programs again.
> 
> Fixes: f5e81d111750 ("bpf: Introduce BPF nospec instruction for mitigating Spectre v4")
> Fixes: 5fcf896efe28 ("Merge branch 'bpf-mitigate-spectre-v1-using-barriers'")
> Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
> ---
>   arch/riscv/net/bpf_jit.h        | 10 ++++++++++
>   arch/riscv/net/bpf_jit_comp32.c |  6 +++++-
>   arch/riscv/net/bpf_jit_comp64.c |  6 +++++-
>   3 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
> index 632ced07bca4..e70b3bc19206 100644
> --- a/arch/riscv/net/bpf_jit.h
> +++ b/arch/riscv/net/bpf_jit.h
> @@ -619,6 +619,16 @@ static inline void emit_fence_rw_rw(struct rv_jit_context *ctx)
>   	emit(rv_fence(0x3, 0x3), ctx);
>   }
>   
> +static inline u32 rv_fence_i(void)
> +{
> +	return rv_i_insn(0, 0, 1, 0, 0x0f);
> +}
> +
> +static inline void emit_fence_i(struct rv_jit_context *ctx)
> +{
> +	emit(rv_fence_i(), ctx);
> +}
> +
>   static inline u32 rv_nop(void)
>   {
>   	return rv_i_insn(0, 0, 0, 0, 0x13);
> diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
> index 592dd86fbf81..d9a6f55a7e8e 100644
> --- a/arch/riscv/net/bpf_jit_comp32.c
> +++ b/arch/riscv/net/bpf_jit_comp32.c
> @@ -1248,8 +1248,12 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   			return -1;
>   		break;
>   
> -	/* speculation barrier */
> +	/*
> +	 * Speculation barrier using fence.i for pipeline serialization.
> +	 * RISC-V lacks a dedicated speculation barrier instruction.
> +	 */
>   	case BPF_ST | BPF_NOSPEC:
> +		emit_fence_i(ctx);
>   		break;
>   
>   	case BPF_ST | BPF_MEM | BPF_B:
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index 45cbc7c6fe49..fabafbebde0c 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -1864,8 +1864,12 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
>   		break;
>   	}
>   
> -	/* speculation barrier */
> +	/*
> +	 * Speculation barrier using fence.i for pipeline serialization.
> +	 * RISC-V lacks a dedicated speculation barrier instruction.
> +	 */
>   	case BPF_ST | BPF_NOSPEC:
> +		emit_fence_i(ctx);
>   		break;
>   
>   	/* ST: *(size *)(dst + off) = imm */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
