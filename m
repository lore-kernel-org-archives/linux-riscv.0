Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BD5C47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 15:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72cFBmzMq9Rl9/WojyH3QOnBkMGmaqNiH+uxTHCGPO4=; b=06eBFKpRfIXIHd
	LWe3rG0WmXt8yfCPzsFU4I1pUv4XLv8Tr3U2lWWiCsf/wxRE5/0v4FBgLT4Th2DyR2ucUPpuAHY4v
	NVtt07TblfN76xIxNO5pHM+GDgSZM5hwrmrlmC/bp2hejhk+thzeBfrZpei0Z/CfUb8e72uiPQNIU
	7m11B7XajEYb2dhsMlgcU7HkUek58q3SzSuEG+xXSFBuHdk/q6+KtDbm7xVtDCGfCKWCcxgyzhY2f
	iC9SXMgVmhtm6h3qQoqtFvDxc/CE6PkvLlZJJsmSTUfDLed6Fe2qjQ/At6WTOwz9aRyGQzdqE0+oh
	j+jL+XLznHIvNU8oZoZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rngxr-00000007mAj-1XHj;
	Fri, 22 Mar 2024 15:37:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rngxo-00000007m9K-0Mj0
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 15:37:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4147b5d8a0dso5437175e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 08:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711121866; x=1711726666; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MS4tNqN5q9dWj+4x8Dlm5CxbpEbr8JLgxekArGzXyyY=;
        b=lQx/c1P8kjut8Jh6mmyRxHWRgGoKmBRws1VYQMJwXeKzY5nhq8jyCV8gxW0m8JhfqG
         JUSlH4d8fmjrEBOBra1t1A96EOEUuD8o0y8k1/PB9bheNSwpYKsSbwq2JI4pc04SJLYo
         IpJLFiABPY75Yu0lZ6omyiy+S6uag1OSJbLk67OpkBwRQ61GujeeoiVisN9g86VTpE/Z
         Is64ikKaw7uctbojGZcvb6tVOSCz+67fNoOx+xByEFRxHVFrfMXLdRHnVu/1tHJ9b7hY
         ONASm9ceZ8jS+Dw3Vrfs7fhjq2xBcM9wRu/z7bxcGdHPW97JQFNK2ceUcDjk6aI+13z7
         d/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711121866; x=1711726666;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MS4tNqN5q9dWj+4x8Dlm5CxbpEbr8JLgxekArGzXyyY=;
        b=kkirZaich4GvfBoCTNqt0d5/sCDP71+w0S6KRYyS2S5A/EXiEuIBP5+e2xdrtRP0UV
         EOBonAsQRNu9I3Kss1wFMLBj/Ko4j7iO5IY9sCfHbcBlfgOX+KFhY9eo5oABE3/SL5TS
         4QtZyKnMksuZt4dmCeMed6bPjV3PJxQ63d/IT9yTshD8qie6AwQNeBhZDvmetYrGGdPa
         +JhOlcqdTJtflLFlTOnqWDhzOHkEAKj62qzwgCU3okQWZFL2oedi1m/za0y1sSx/iRkk
         X856QXIu/1fcgUWSlNAXh1wDRu2ONlDnKr1JoTid2EqGOjfFJAVKuJWPAa2WfD7CEzBj
         h9hQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6d5ByW91cRJXZs1G/CfORY/hfGMpzuUpT9BQ1PzzKLWBD36A1MLHYeWNYD6ZaP1k9rBFD4RdjRFlmzQP8D6bAs0j8UcJtP06jl7grs5rW
X-Gm-Message-State: AOJu0YzyFgXEzwKq9Dgumpfx+gT0LwnGb4s3qQf9yJMfa6uQAUdl3Wiq
	QWjRnUIjf1uO0Pkkg80PJYKIwkMkGIji7YO3HLlD9l1XHhxmKEsQ
X-Google-Smtp-Source: AGHT+IGNKvIOVPGwG4lgNEbYfQOdJ2P5rE9Hv5fMSBgCsjfpyUD+q+3Q5qSdMHJhExZxC3kT0iRsHg==
X-Received: by 2002:a05:600c:5487:b0:414:92e:3b81 with SMTP id iv7-20020a05600c548700b00414092e3b81mr1885946wmb.3.1711121865645;
        Fri, 22 Mar 2024 08:37:45 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id jh2-20020a05600ca08200b004146dd6bfe2sm3322444wmb.47.2024.03.22.08.37.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Mar 2024 08:37:45 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, Andrii
 Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong
 Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>
Subject: Re: [PATCH bpf] bpf: verifier: fix NULL pointer dereference in
 do_misc_fixups()
In-Reply-To: <20240322143829.40808-1-puranjay12@gmail.com>
References: <20240322143829.40808-1-puranjay12@gmail.com>
Date: Fri, 22 Mar 2024 15:37:42 +0000
Message-ID: <mb61p1q82xoop.fsf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_083748_158440_A18E1459 
X-CRM114-Status: GOOD (  22.46  )
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

Puranjay Mohan <puranjay12@gmail.com> writes:

> The addr_space_cast instruction is convered to a normal 32 bit mov by the
> verifier if the cast from as(0) to as(1) or if the user has set the flag
> BPF_F_NO_USER_CONV in the arena.
>
> If the BPF program doesn't have an associated arena
> env->prog->aux->arena is NULL and the verifier currently doesn't check
> for it being NULL before accessing map_flags. This can cause a NULL
> pointer dereference:
>
> root@rv-tester:~# ./reproducer
>  Unable to handle kernel access to user memory without uaccess routines at virtual address 0000000000000030
>  Oops [#1]
>  Modules linked in: sch_fq_codel drm fuse i2c_core drm_panel_orientation_quirks backlight configfs ip_tables x_tables
>  CPU: 2 PID: 265 Comm: reproducer Not tainted 6.8.0 #3
>  Hardware name: riscv-virtio,qemu (DT)
>  epc : do_misc_fixups+0x43c/0x1168
>   ra : bpf_check+0xda8/0x22b6
>  epc : ffffffff8017eeaa ra : ffffffff801936d6 sp : ff200000011bb890
>   gp : ffffffff82293468 tp : ff60000084fcb840 t0 : ff60000084e38048
>   t1 : 0000000000000048 t2 : ff5fffff80000000 s0 : ff200000011bba60
>   s1 : ff2000000101d058 a0 : ff6000008b980000 a1 : 0000000000000004
>   a2 : 00000000000000e1 a3 : 0000000000000001 a4 : 0000000000010000
>   a5 : 0000000000000000 a6 : 0000000000000001 a7 : ff2000000101d000
>   s2 : 0000000000000002 s3 : 0000000000000000 s4 : 0000000000000000
>   s5 : 0000000000000002 s6 : 0000000000000000 s7 : ff6000008b980aa0
>   s8 : 0000000000010005 s9 : 0000000000000004 s10: ff6000008b980000
>   s11: 0000000000000000 t3 : 0000000000002000 t4 : 0000ff0000000000
>   t5 : 00ff000000000000 t6 : ff20000000000000
>  status: 0000000200000120 badaddr: 0000000000000030 cause: 000000000000000d
>  [<ffffffff8017eeaa>] do_misc_fixups+0x43c/0x1168
>  [<ffffffff801936d6>] bpf_check+0xda8/0x22b6
>  [<ffffffff80174b32>] bpf_prog_load+0x486/0x8dc
>  [<ffffffff80176566>] __sys_bpf+0xbd8/0x214e
>  [<ffffffff80177d14>] __riscv_sys_bpf+0x22/0x2a
>  [<ffffffff80d2493a>] do_trap_ecall_u+0x102/0x17c
>  [<ffffffff80d3048c>] ret_from_exception+0x0/0x64
>  Code: b345 9783 0024 4685 8b63 16d7 3783 008d 7f9c 7fdc (5b9c) 83c9
>  ---[ end trace 0000000000000000 ]---
>  Kernel panic - not syncing: Fatal exception
>  SMP: stopping secondary CPUs
>
> Add a check for NULL pointer before checking map_flags.
>
> Fixes: 6082b6c328b5 ("bpf: Recognize addr_space_cast instruction in the verifier.")
> Reported-by: xingwei lee <xrivendell7@gmail.com>
> Reported-by: yue sun <samsun1006219@gmail.com>
> Closes: https://lore.kernel.org/bpf/CABOYnLz09O1+2gGVJuCxd_24a-7UueXzV-Ff+Fr+h5EKFDiYCQ@mail.gmail.com/
> Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
> ---
>  kernel/bpf/verifier.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index ca6cacf7b42f..78945e7b856d 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -19607,7 +19607,8 @@ static int do_misc_fixups(struct bpf_verifier_env *env)
>  	for (i = 0; i < insn_cnt;) {
>  		if (insn->code == (BPF_ALU64 | BPF_MOV | BPF_X) && insn->imm) {
>  			if ((insn->off == BPF_ADDR_SPACE_CAST && insn->imm == 1) ||
> -			    (((struct bpf_map *)env->prog->aux->arena)->map_flags & BPF_F_NO_USER_CONV)) {
> +			    (env->prog->aux->arena &&

Kumar made me aware of the fact that env->prog->aux_arena should never
be NULL if the program has an addr_space_cast instruction. This means
that rather than checking for the NULL pointer here and leaving the
addr_space_cast as it is, We should reject programs that contain an
addr_space_cast instruction but don't have an associated arena.

Sent v2 doing the above: https://lore.kernel.org/bpf/20240322153518.11555-1-puranjay12@gmail.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
