Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CDFCA1017
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+xKxfpBLu9iqfJqffTD0BWAIFNprCxwFPoqATWiG5k=; b=e+gnlxGLEwivur
	+trFZs17Sr19dKdwON0RuFoskDjcfGNPMju27oWWcQZix2Qie5s9JeGfQKG9A5jtZ8M5M40doDW3e
	DwQrD0UV55B5ReYdSr/FuQWDXRj4pFe55HwKBdKrFsoruWW4NN1FNmVgVSHPL6mCPCIfitRegcgWU
	4f/doNvWng5M1UnmlF3Dc6Y54DCmGk45NaNAKngIZhcGz7U9SB357zjHP1DwoUNuG0Q1jCBowDZpl
	8hlsxNaoC/ieHp5htNkg0bTR4qm4F2DuIGrXgInYQPwhqnF4cOIkQXdN9as32gV9fY3clYqVI1NUd
	8rNXFJUZ6zgcdD3DYyrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6K-0000000G5IK-0tFA;
	Fri, 05 Sep 2025 02:22:56 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuIfB-0000000EwPF-2cKe
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 22:42:43 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so1520128b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Sep 2025 15:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757025760; x=1757630560; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7stybUMWipO5YZxvvicGiMS8w2Tz02CtPeQiBqJzrfg=;
        b=QPKaJvjA+DJIiA2alBxuZGUZ9FHVclVi6Mcz/328mzpkpE4hTZke7AE8yBZWxgcGSE
         hL7L9VuqY7bMK43UiW/8/xQgmJu0F7pZcaYmLOZgrHDEBiEeBt0EbfdMpfqZZ6kRW1Ni
         /yTDn17dC4hNy68RNZf6c1dNrtp8sUleK9BdU5DGpDYBiCUoih3CgC0754fdSqpRgLd0
         uiIraaOp6S0w1esXvIR5tIAwDPhIs9Az7wYjBAhnbx32eZXS1siUNBHgcVDW+m2Bxh6Q
         qp2MBO8E9CGD9ds8XsUo+izaW+L4nPBEtMa2K1LqSLHVtai4Odzq9lbPfrUZtUjaxlNA
         qZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757025760; x=1757630560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7stybUMWipO5YZxvvicGiMS8w2Tz02CtPeQiBqJzrfg=;
        b=EhR/NKXGmOvyFCXNmPqXADEbHdeRz48v/9yoitiXomTnp5mTiyXSRO5Ov0CtlETxVP
         PH1hHaL+glErGFi1m4tg9yUzXhz1KoA4puhHvThGf9KYcUwanIhBl/38P6PM7DUy9Ise
         KMPvDmxTEheFkyf3dlzda7WX8a1hrWbpZoTJRjWJg5Mgi69pwejubUKPixTzg/2a0nV/
         BMXa4qMNRL8cenHvVozMtH6VaowkKZwzwcXBbMTXNwZhukqj1W/VelahcKzZZRoowtlU
         O/RGFy6SEb4kyFHgHy8ZrfuMo92mM8HN25NJ54oN2nJChkc269Qmk+uFeb+WaZGglf/s
         G4PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdyyPDU2EfrncAV98q5BX+j+dpY/rIyNd2dkpQ0sEJj3CxVCUfIDRdGqX2WiBCtSCAKqq+GgDuFAWkSA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn13VjUdpvbkAJsWmQY3E42GlgO70/guwj54EmbBKAZhs9S9Vb
	7BvmnBHbrORmhuz4mzA9KdjvitBN/7daWPMPvf0vaMyfo1jCA1/26Ukf
X-Gm-Gg: ASbGncs/VL6fx4hpRhaT4xbZ8rQqUD0p0Y+bLvc6J7mNQtuwRumbe8YOy1F/8wy6rue
	dYYuibHhBb+hICBV1k23XW/6RYVK1NyxplCsxB4ZfiYMqpXyKzZkB+Pkasknf+wBtxe+x+Rav9P
	INLzZdQe/L9Rruh63BwtuuUd8QdcXbu/5EKpHGbaQiJtbtgZOVkngM9pplLC4p2+mSTBrjgk4Ff
	a9EAU9yGPG9S7VoIPi0LFUlkMefy4kiJ3zO9jIhft4D85qu3ayEYTQEKd9uXot7UP/oY9OVl8t8
	143CVfMnsM7VIXVbVCGTL/H5oqqTgPBPy5pwvW0ce1ubL1GXxzwK6/smXDbZk48jJ+0XSa66qaS
	730PIVvOhTSFdPBfP2eteim7wWPJ6vdh9fIMIfgKMOtBNisecyKkFU7mRl0pbIIRHVIORD+7fRd
	pLpjtjdAqI
X-Google-Smtp-Source: AGHT+IHaGhQFBh5KvECXojrlO5oM4f210/DrGBke61FWUGGCk6SouPwLYBbDYbh1r6mgA4iOB0psbw==
X-Received: by 2002:a05:6a00:1495:b0:771:ebf1:5e45 with SMTP id d2e1a72fcca58-7723e393f29mr24193241b3a.22.1757025760425;
        Thu, 04 Sep 2025 15:42:40 -0700 (PDT)
Received: from [192.168.1.77] (c-76-146-12-100.hsd1.wa.comcast.net. [76.146.12.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b78d7sm20362170b3a.30.2025.09.04.15.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 15:42:40 -0700 (PDT)
Message-ID: <5829abcf-f1b9-4fb0-8811-b6098fdd8a29@gmail.com>
Date: Thu, 4 Sep 2025 15:42:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 bpf-next] riscv, bpf: Sign extend struct ops return
 values properly
To: Hengqi Chen <hengqi.chen@gmail.com>, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20250904103806.18937-1-hengqi.chen@gmail.com>
Content-Language: en-US
From: Amery Hung <ameryhung@gmail.com>
In-Reply-To: <20250904103806.18937-1-hengqi.chen@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_154241_688071_42386F7C 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 9/4/25 3:38 AM, Hengqi Chen wrote:
> The ns_bpf_qdisc selftest triggers a kernel panic:
>
>      Unable to handle kernel paging request at virtual address ffffffffa38dbf58
>      Current test_progs pgtable: 4K pagesize, 57-bit VAs, pgdp=0x00000001109cc000
>      [ffffffffa38dbf58] pgd=000000011fffd801, p4d=000000011fffd401, pud=000000011fffd001, pmd=0000000000000000
>      Oops [#1]
>      Modules linked in: bpf_testmod(OE) xt_conntrack nls_iso8859_1 dm_mod drm drm_panel_orientation_quirks configfs backlight btrfs blake2b_generic xor lzo_compress zlib_deflate raid6_pq efivarfs [last unloaded: bpf_testmod(OE)]
>      CPU: 1 UID: 0 PID: 23584 Comm: test_progs Tainted: G        W  OE       6.17.0-rc1-g2465bb83e0b4 #1 NONE
>      Tainted: [W]=WARN, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
>      Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2024.01+dfsg-1ubuntu5.1 01/01/2024
>      epc : __qdisc_run+0x82/0x6f0
>       ra : __qdisc_run+0x6e/0x6f0
>      epc : ffffffff80bd5c7a ra : ffffffff80bd5c66 sp : ff2000000eecb550
>       gp : ffffffff82472098 tp : ff60000096895940 t0 : ffffffff8001f180
>       t1 : ffffffff801e1664 t2 : 0000000000000000 s0 : ff2000000eecb5d0
>       s1 : ff60000093a6a600 a0 : ffffffffa38dbee8 a1 : 0000000000000001
>       a2 : ff2000000eecb510 a3 : 0000000000000001 a4 : 0000000000000000
>       a5 : 0000000000000010 a6 : 0000000000000000 a7 : 0000000000735049
>       s2 : ffffffffa38dbee8 s3 : 0000000000000040 s4 : ff6000008bcda000
>       s5 : 0000000000000008 s6 : ff60000093a6a680 s7 : ff60000093a6a6f0
>       s8 : ff60000093a6a6ac s9 : ff60000093140000 s10: 0000000000000000
>       s11: ff2000000eecb9d0 t3 : 0000000000000000 t4 : 0000000000ff0000
>       t5 : 0000000000000000 t6 : ff60000093a6a8b6
>      status: 0000000200000120 badaddr: ffffffffa38dbf58 cause: 000000000000000d
>      [<ffffffff80bd5c7a>] __qdisc_run+0x82/0x6f0
>      [<ffffffff80b6fe58>] __dev_queue_xmit+0x4c0/0x1128
>      [<ffffffff80b80ae0>] neigh_resolve_output+0xd0/0x170
>      [<ffffffff80d2daf6>] ip6_finish_output2+0x226/0x6c8
>      [<ffffffff80d31254>] ip6_finish_output+0x10c/0x2a0
>      [<ffffffff80d31446>] ip6_output+0x5e/0x178
>      [<ffffffff80d2e232>] ip6_xmit+0x29a/0x608
>      [<ffffffff80d6f4c6>] inet6_csk_xmit+0xe6/0x140
>      [<ffffffff80c985e4>] __tcp_transmit_skb+0x45c/0xaa8
>      [<ffffffff80c995fe>] tcp_connect+0x9ce/0xd10
>      [<ffffffff80d66524>] tcp_v6_connect+0x4ac/0x5e8
>      [<ffffffff80cc19b8>] __inet_stream_connect+0xd8/0x318
>      [<ffffffff80cc1c36>] inet_stream_connect+0x3e/0x68
>      [<ffffffff80b42b20>] __sys_connect_file+0x50/0x88
>      [<ffffffff80b42bee>] __sys_connect+0x96/0xc8
>      [<ffffffff80b42c40>] __riscv_sys_connect+0x20/0x30
>      [<ffffffff80e5bcae>] do_trap_ecall_u+0x256/0x378
>      [<ffffffff80e69af2>] handle_exception+0x14a/0x156
>      Code: 892a 0363 1205 489c 8bc1 c7e5 2d03 084a 2703 080a (2783) 0709
>      ---[ end trace 0000000000000000 ]---
>
> The bpf_fifo_dequeue prog returns a skb which is a pointer.
> The pointer is treated as a 32bit value and sign extend to
> 64bit in epilogue. This behavior is right for most bpf prog
> types but wrong for struct ops which requires RISC-V ABI.
>
> So let's sign extend struct ops return values according to
> the function model and RISC-V ABI([0]).
>
>    [0]: https://riscv.org/wp-content/uploads/2024/12/riscv-calling.pdf
>
> Fixes: 25ad10658dc1 ("riscv, bpf: Adapt bpf trampoline to optimized riscv ftrace framework")
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>   arch/riscv/net/bpf_jit_comp64.c | 38 ++++++++++++++++++++++++++++++++-
>   1 file changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index 549c3063c7f1..c7ae4d0a8361 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -954,6 +954,35 @@ static int invoke_bpf_prog(struct bpf_tramp_link *l, int args_off, int retval_of
>   	return ret;
>   }
>   
> +/*
> + * Sign-extend the register if necessary
> + */
> +static int sign_extend(int rd, int rs, u8 size, u8 flags, struct rv_jit_context *ctx)
> +{
> +	if (!(flags & BTF_FMODEL_SIGNED_ARG) && (size == 1 || size == 2))
> +		return 0;
> +
> +	switch (size) {
> +	case 1:
> +		emit_sextb(rd, rs, ctx);
> +		break;
> +	case 2:
> +		emit_sexth(rd, rs, ctx);
> +		break;
> +	case 4:
> +		emit_sextw(rd, rs, ctx);
> +		break;
> +	case 8:
> +		emit_mv(rd, rs, ctx);
> +		break;
> +	default:
> +		pr_err("bpf-jit: invalid size %d for sign_extend\n", size);
> +		return -EINVAL;

Will this accidentally rejects struct_ops functions that return void?

> +	}
> +
> +	return 0;
> +}
> +
>   static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
>   					 const struct btf_func_model *m,
>   					 struct bpf_tramp_links *tlinks,
> @@ -1175,8 +1204,15 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
>   		restore_args(min_t(int, nr_arg_slots, RV_MAX_REG_ARGS), args_off, ctx);
>   
>   	if (save_ret) {
> -		emit_ld(RV_REG_A0, -retval_off, RV_REG_FP, ctx);
>   		emit_ld(regmap[BPF_REG_0], -(retval_off - 8), RV_REG_FP, ctx);
> +		if (is_struct_ops) {
> +			ret = sign_extend(RV_REG_A0, regmap[BPF_REG_0],
> +					  m->ret_size, m->ret_flags, ctx);
> +			if (ret)
> +				goto out;
> +		} else {
> +			emit_ld(RV_REG_A0, -retval_off, RV_REG_FP, ctx);
> +		}
>   	}
>   
>   	emit_ld(RV_REG_S1, -sreg_off, RV_REG_FP, ctx);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
