Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A77C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 04:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHmOAZqBey8wsJFg2J2jlPPNdHoYVzHBBR17rzlQYII=; b=F52TbY3jjweug/
	QXu01qNnKSTYMmnqNXpAzlSBKguOsOneBjBWhFPGbBd0dAXlwEFv0RlOZouprKXzM7QX6YtvrYYW4
	NRph5IWMcGfEWi2B40KBiaxp/AolQmRqTAgT31ddrYb19iwU9qcLt+VCsAt0ErxTPKBdSDCIY8t49
	6ss+v+3/Z7Ad9IZE7Hq8+LbytwGdZqTbArl5AujFa4AwR7j3En9onednzZsZULeD3z3uOWwlYtgzz
	STZ+nZ7v/XXue0fUVcgWAx8Bk1Hj5UekDCqCeDJYdlvdDotk9Htl+TGfEte+NMiqKElK9qCSyUFxQ
	JVJZty3EnrkkENpR1EqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngfYd-001Qy3-2J; Tue, 19 Apr 2022 04:33:43 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngfYa-001QwV-6W
 for linux-riscv@lists.infradead.org; Tue, 19 Apr 2022 04:33:41 +0000
Received: by mail-io1-xd2c.google.com with SMTP id i196so11002865ioa.1
 for <linux-riscv@lists.infradead.org>; Mon, 18 Apr 2022 21:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FRol2Ixdapg4j6Uubg8h/Lz+s9FI9j4eiU5OeuRx7x0=;
 b=LY5NLAdXfjvJQN/FK13ITsFNln7oksLs2VxwloLzdDODmDRlP8fTtetuJDBdGN2Z8+
 CXgjP7UARDBVnBEcsXut3Ghhco5bQkMNyDPSVpGDJwFt1wbqZvlDPL7BjrhUzbFL4eFd
 q0DfaFL9w7IrL2S3KV706XOrc14/JRVnFnWwLJASIB2N/45Hg+6uGrLFT+bOD23lzA2e
 vqj+7PcGJ5yougE3T2dyVzS55k3mXqW6rCHfWzUN8+iJmNR/vNC31CGSDvf4cWeoHcaR
 jEYk4BXCs/EVAc6x2Po5iKbucwjZJ7dIsmuVcPopQpr0T2xJ2LZmS/KULXLBWSkn7ogp
 igsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FRol2Ixdapg4j6Uubg8h/Lz+s9FI9j4eiU5OeuRx7x0=;
 b=AOBwol8MYhT+EiKMx1Q6npvbc/kvtyCeQ2QUINPxz/WG/IkmRS/XJc6AJZfsP2JrkF
 7dKrXeo8/Zwn67Yagm7aONUxhPsgdX2JmNEQEOnSKdbf7imIm9NiQzBRJl601yxNuahY
 bWp+AQLMR1nLrW14gthDVTmzPCVRo/AIw98xun4xOU7xpw1xFHdgtZGWYRjDxNxUmPsW
 ZLXbRf5NnS8wlyMhFbS5nR1szZ9pX/CCvkulH6xQXg8PgCdJMi+0QnV7bspkgT/6rCfq
 dfh8SrNYx147yTZXNJl9VW9DDi3TxhEHEfVY9RgHSLZfkXe5lq+k6u90E/uLfy4/kJlz
 EOKQ==
X-Gm-Message-State: AOAM533LX1pb+OsAcEcxJjk6VpDhVFOoqjQRSMIlULTK3NqUA2C6PcHu
 SRi/11HYwTSOVWkennhsoQWMo8xeigECBgw8KEw=
X-Google-Smtp-Source: ABdhPJw/8+UIm4hFbM+iPSMSY1l5WCy3bScYyt9/mmw1xH4rZvSRp4COfQKVYT2qMXltFgOWDhdYu06slG9UMKl+wXs=
X-Received: by 2002:a05:6638:338e:b0:328:807a:e187 with SMTP id
 h14-20020a056638338e00b00328807ae187mr4322086jav.93.1650342817565; Mon, 18
 Apr 2022 21:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220418042222.2464199-1-pulehui@huawei.com>
In-Reply-To: <20220418042222.2464199-1-pulehui@huawei.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 18 Apr 2022 21:33:26 -0700
Message-ID: <CAEf4BzbavSC=JN=sowFY3t4yOUfe8QtVXhdG+y7a-T1YtfRqXQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next] libbpf: Support riscv USDT argument parsing logic
To: Pu Lehui <pulehui@huawei.com>
Cc: bpf <bpf@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
 Networking <netdev@vger.kernel.org>, linux-riscv@lists.infradead.org, 
 Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Martin Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, 
 Yonghong Song <yhs@fb.com>, john fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_213340_293946_73621BB7 
X-CRM114-Status: GOOD (  20.15  )
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

On Sun, Apr 17, 2022 at 8:53 PM Pu Lehui <pulehui@huawei.com> wrote:
>
> Add riscv-specific USDT argument specification parsing logic.
> riscv USDT argument format is shown below:
> - Memory dereference case:
>   "size@off(reg)", e.g. "-8@-88(s0)"
> - Constant value case:
>   "size@val", e.g. "4@5"
> - Register read case:
>   "size@reg", e.g. "-8@a1"
>
> s8 will be marked as poison while it's a reg of riscv, we need
> to alias it in advance.
>
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---

Can you please mention briefly the testing you performed as I'm not
able to test this locally.

>  tools/lib/bpf/usdt.c | 107 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>
> diff --git a/tools/lib/bpf/usdt.c b/tools/lib/bpf/usdt.c
> index 934c25301ac1..b8af409cc763 100644
> --- a/tools/lib/bpf/usdt.c
> +++ b/tools/lib/bpf/usdt.c
> @@ -10,6 +10,11 @@
>  #include <linux/ptrace.h>
>  #include <linux/kernel.h>
>
> +/* s8 will be marked as poison while it's a reg of riscv */
> +#if defined(__riscv)
> +#define rv_s8 s8
> +#endif
> +
>  #include "bpf.h"
>  #include "libbpf.h"
>  #include "libbpf_common.h"
> @@ -1400,6 +1405,108 @@ static int parse_usdt_arg(const char *arg_str, int arg_num, struct usdt_arg_spec
>         return len;
>  }
>
> +#elif defined(__riscv)
> +
> +static int calc_pt_regs_off(const char *reg_name)
> +{
> +       static struct {
> +               const char *name;
> +               size_t pt_regs_off;
> +       } reg_map[] = {
> +               { "ra", offsetof(struct user_regs_struct, ra) },
> +               { "sp", offsetof(struct user_regs_struct, sp) },
> +               { "gp", offsetof(struct user_regs_struct, gp) },
> +               { "tp", offsetof(struct user_regs_struct, tp) },
> +               { "t0", offsetof(struct user_regs_struct, t0) },
> +               { "t1", offsetof(struct user_regs_struct, t1) },
> +               { "t2", offsetof(struct user_regs_struct, t2) },
> +               { "s0", offsetof(struct user_regs_struct, s0) },
> +               { "s1", offsetof(struct user_regs_struct, s1) },
> +               { "a0", offsetof(struct user_regs_struct, a0) },
> +               { "a1", offsetof(struct user_regs_struct, a1) },
> +               { "a2", offsetof(struct user_regs_struct, a2) },
> +               { "a3", offsetof(struct user_regs_struct, a3) },
> +               { "a4", offsetof(struct user_regs_struct, a4) },
> +               { "a5", offsetof(struct user_regs_struct, a5) },
> +               { "a6", offsetof(struct user_regs_struct, a6) },
> +               { "a7", offsetof(struct user_regs_struct, a7) },
> +               { "s2", offsetof(struct user_regs_struct, s2) },
> +               { "s3", offsetof(struct user_regs_struct, s3) },
> +               { "s4", offsetof(struct user_regs_struct, s4) },
> +               { "s5", offsetof(struct user_regs_struct, s5) },
> +               { "s6", offsetof(struct user_regs_struct, s6) },
> +               { "s7", offsetof(struct user_regs_struct, s7) },
> +               { "s8", offsetof(struct user_regs_struct, rv_s8) },
> +               { "s9", offsetof(struct user_regs_struct, s9) },
> +               { "s10", offsetof(struct user_regs_struct, s10) },
> +               { "s11", offsetof(struct user_regs_struct, s11) },
> +               { "t3", offsetof(struct user_regs_struct, t3) },
> +               { "t4", offsetof(struct user_regs_struct, t4) },
> +               { "t5", offsetof(struct user_regs_struct, t5) },
> +               { "t6", offsetof(struct user_regs_struct, t6) },

would it make sense to order registers a bit more "logically"? Like
s0-s11, t0-t6, etc. Right now it looks very random and it's hard to
see if all the registers from some range of registers are defined.

> +       };
> +       int i;
> +

[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
