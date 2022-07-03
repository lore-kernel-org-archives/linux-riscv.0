Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80CAC433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Jul 2022 13:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LihklVE3iX9bV95aEOl3+bAUxv5ZsrlKbZLieHbGJXs=; b=2G11gnt1XbVnGv
	+Sa/jt6MDlfxNVb3rYw4s/q11EAneK7trNYrgbkJ+sa7zjDuiIWjM8QpNXqbGdE9LdmfFQIzlTvWJ
	HMOFttZGd5eValopSl8kqkmF4T9RhF/9YGbACyUwENlWB7x/TYpTRInEnrctYN9ldxzBy+Wl2ndSz
	qisONBjM7GXob9sSX7uWw6cOyr+79fLu08O4eEvn7Tq9UqwSzxOM2/3CL4HY12MngDo3KiRlm+YHz
	Pomi9mrh0v7zKHevSM+C3/5N+SFO3vCH1IaNK8Nu8lQxw2DQtYH9jedGv+KPBwX5YAB33QbP/G7mc
	AadnI51UXrNIVOm6RGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7zOl-00G6UO-MN; Sun, 03 Jul 2022 13:12:27 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7zOi-00G6Qu-12
	for linux-riscv@lists.infradead.org; Sun, 03 Jul 2022 13:12:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id k7so9666667wrc.12
        for <linux-riscv@lists.infradead.org>; Sun, 03 Jul 2022 06:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=b2qZjru2AawbgH9jyJa3uiCOU1FEJ+Z4cEYmO5LMBTI=;
        b=Vqo0MXFxvrz0CdYVFug56sJ0ZOEnGDrO/jKRHUiIHMmO5KoJf/kNYRSR9U7CeI/etA
         NO3vH4GS3TfaGrKbzumHWt/WrwE3XH6Ak0LfGPAD9mSBJ3unOdk0cO3+j+rariAvDLfr
         PceDbxaeUXLc2LbQaxVcfFvWWHMnRlgrZBUeFzBFHRZtJW6XfqAsR5bCy+YKOciDZ+0G
         NRYE5lhGEgTZMyfo+UmSD/Yxmj0nR/bPx7OWuNI6FWHH+MJypRrx7o0c3AqKH7jO4a/l
         uKY7FLfyt9rAD7cMEvf9Or882hrIfuprgqBti8ijLZD4YRDsRSsQjzMwye7SvL9nWtHe
         lNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=b2qZjru2AawbgH9jyJa3uiCOU1FEJ+Z4cEYmO5LMBTI=;
        b=e+WpaYB0Dw0fmqWy2r2Q42Br8uZlSxtOyBpyZ/I2chvps7wwuCRy1lHhWumJbNRw8A
         6VUzpp6vqm0czpiSKX1xEaCoKodmTEWXlWv6YeSD1wGezVtTx8+if7tkHE4jtRliHggJ
         gddNzfGqUUgZvwB8ju/sqYkwfCKnLIx+jiUqFmAM8dVeJBItJsKqrODQmA2WbqQ/ixWJ
         r1AXizGE7pVC8QTeLvEwWcbbpUVHHdZA5N0/R3dBFn1PHkBlZPHSoJ4ooVHI4RTLApng
         bpXTYKHNAKk/ksYN4qBUsWHhgiX7hmUGgWY4WLvKqele1kFI/geYUJx4EmTTB3LfNgBn
         N6xQ==
X-Gm-Message-State: AJIora+F99IlJGQOcOUAvovQXvqucoDU7ogIWQUerH3XQ69G0IVRDQyH
	wsketrpY4JeuhYmcicU7mGWYew==
X-Google-Smtp-Source: AGRyM1uXArjvOOMo1FwzrB3m4V1RuMD/HIns9AME3FbmZRXJYIgUQQRLJuq4YI4OHIaEVsz16Zt6kw==
X-Received: by 2002:adf:fb08:0:b0:21b:af81:2ffd with SMTP id c8-20020adffb08000000b0021baf812ffdmr22820107wrr.685.1656853941578;
        Sun, 03 Jul 2022 06:12:21 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id h13-20020adff4cd000000b002103aebe8absm27452656wrp.93.2022.07.03.06.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Jul 2022 06:12:21 -0700 (PDT)
Message-ID: <c373eec7-2cc4-a41d-916c-f073aba5494b@conchuod.ie>
Date: Sun, 3 Jul 2022 14:12:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] RISC-V/bpf: Enable bpf_probe_read{, str}()
Content-Language: en-US
To: Yixun Lan <dlan@gentoo.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org
References: <20220703130924.57240-1-dlan@gentoo.org>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220703130924.57240-1-dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_061224_132806_9F4091B1 
X-CRM114-Status: GOOD (  13.96  )
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

On 03/07/2022 14:09, Yixun Lan wrote:
> Enable this option to fix a bcc error in RISC-V platform
> 
> And, the error shows as follows:
> 
> ~ # runqlen
> WARNING: This target JIT is not designed for the host you are running. \
> If bad things happen, please choose a different -march switch.
> bpf: Failed to load program: Invalid argument
> 0: R1=ctx(off=0,imm=0) R10=fp0
> 0: (85) call bpf_get_current_task#35          ; R0_w=scalar()
> 1: (b7) r6 = 0                        ; R6_w=0
> 2: (7b) *(u64 *)(r10 -8) = r6         ; R6_w=P0 R10=fp0 fp-8_w=00000000
> 3: (07) r0 += 312                     ; R0_w=scalar()
> 4: (bf) r1 = r10                      ; R1_w=fp0 R10=fp0
> 5: (07) r1 += -8                      ; R1_w=fp-8
> 6: (b7) r2 = 8                        ; R2_w=8
> 7: (bf) r3 = r0                       ; R0_w=scalar(id=1) R3_w=scalar(id=1)
> 8: (85) call bpf_probe_read#4
> unknown func bpf_probe_read#4
> processed 9 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
> 
> Traceback (most recent call last):
>   File "/usr/lib/python-exec/python3.9/runqlen", line 187, in <module>
>     b.attach_perf_event(ev_type=PerfType.SOFTWARE,
>   File "/usr/lib/python3.9/site-packages/bcc/__init__.py", line 1228, in attach_perf_event
>     fn = self.load_func(fn_name, BPF.PERF_EVENT)
>   File "/usr/lib/python3.9/site-packages/bcc/__init__.py", line 522, in load_func
>     raise Exception("Failed to load BPF program %s: %s" %
> Exception: Failed to load BPF program b'do_perf_event': Invalid argument
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Do you know what commit this fixes?
Thanks,
Conor.

> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 32ffef9f6e5b4..da0016f1be6ce 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -25,6 +25,7 @@ config RISCV
>  	select ARCH_HAS_GIGANTIC_PAGE
>  	select ARCH_HAS_KCOV
>  	select ARCH_HAS_MMIOWB
> +	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>  	select ARCH_HAS_PTE_SPECIAL
>  	select ARCH_HAS_SET_DIRECT_MAP if MMU
>  	select ARCH_HAS_SET_MEMORY if MMU

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
