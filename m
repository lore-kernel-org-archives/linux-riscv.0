Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A30C61DB2
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 08:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xb2RiPMgxnGFJ9iLaBobxRDkctV2FZVEP0/yqBSV5FE=; b=n58wffVgeq+dme
	uXVSB/PoPxXjjK7tDAgs+skaNaugCVMnRqNF7mwOBXHIcseTF1+O1yEYZEq5Om4/Ve+km5L2Fbwj4
	05ST7YztHlq3W/a+LsdrMLhA/+Ab/XDcMhDMQb7MEMnKjbLbknzVoWBTEBI5WqoWqEtGsJhwaK5XK
	6D25KSEJnywgPs0Z+Q7OWrNKtmtR5myt2X4uplVVf17PnhD+adsEjVzVJtcro+IlDw3EJqEcGjCD7
	d25dAxan2qNCRQKi/BAkKr/H54XoTtchOLRUvjTBjQ4sfIMeWWV2KodyvQ5+RqVKknIhaXjjntJIt
	xjKz67cLFPODXYXZrfAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ037-0000000FnBY-2wIk;
	Fri, 13 Jun 2025 08:46:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ035-0000000Fn5m-3LVt
	for linux-riscv@bombadil.infradead.org;
	Fri, 13 Jun 2025 08:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pPysXILCfU+u1glPGM8ddsYMEL8PciSkqWZBDbfqi5Q=; b=NCZeK5L8nILaZ3JuxUDb1Q7naK
	IASoenNZFq31ypu0kOpcsYQPPqwnjNPgsK1XsAT4onL6zgEAKVMwu3XDRywSDcZVcrCgcQ992TESe
	bQLTdCnNW9dSP+L3Psi5esCYTfwkvus+4YzvWR6lXEdmltrLLK3ywJMcUtUT6/M4ew/ihaW8O5aNV
	sqCHhRP+HuNKrm1ZHC+t5x55s+0k+F3VAGlMOMxJ4R0xw5d73g3+hRlDzUtYNqnK1mEkAf/n03xbE
	Re9o504kSg9nvtuXVcDHxMYqur3Ys14u35sscf5tlWHSLPRa0pRF/DTb969ax/yT0Su0io4P6IbFw
	MSoY/jiA==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ031-00000002w6j-2oSn
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 08:46:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so1133590f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 01:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749804360; x=1750409160; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pPysXILCfU+u1glPGM8ddsYMEL8PciSkqWZBDbfqi5Q=;
        b=P+U9ZhrfqBF2WQrMwfUlJjjY1QtqE85fXN3iaeutDyLYVvTHMKnG9vdIXzTWJOjcfB
         LKKpFwPpEJJxBIkXm+SP96mzHnfMw55JCaQQgYkE/f3w1Mf3FXp5GdKkSbpvxBC9TtrC
         JmnSNvqfIK7QGeZhgThTyAqB78cQDr3Qd3894addXsA00Le5xDzYggIUS8pEw8uCNX0s
         xI5CCXXISE+5k+DSiQ7FBn3XULSWy2xbDlfEMANc4F1AfLFN6EJS2KT/+uyHphF4AcOs
         NiWziD84YwANva7KZpRNxFxK5BVl0HCcTjzvy/JAKJVeNn5XKMJu6vxB6xUVQigAvxI0
         Jq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749804360; x=1750409160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPysXILCfU+u1glPGM8ddsYMEL8PciSkqWZBDbfqi5Q=;
        b=H+C+zEMgCplW5884VrnFBH0epBq1YncRdZzhexFin/DR8egfkFP/NMEjUf5LHNZLmP
         1v6gXrv/ejKeCqW2vZspVEv74JRhOh0/zPnzfQ0HFxYvBFbaxUxBaS9f55ZaGiiIAT17
         ZVWlobgMFktO4zcIQPPLtNtlgMvDs0g8r2Bf9VzmzLGHEb/3ifM+76zz91VgesX2n9MI
         K+gkrEKsKqb5NxLgNU+yRqEg8RiMjgjUU9yHdJH5nVtc10EiiAXVvB6uXNkD1cSufVEg
         fYRbZ2li4g7af10RVgkoOl6wKOgMBlKAH5w3bYJlmYv7Sz25r0mVnY/p4tOfjX17/to3
         G5Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVac6JMBwslnZOyQajy9458BrcbvKp7x0RzMsE0NryvzAtGxodZ33b7wA++uDMUOKOGnAt2/iobCC3KTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKp+KwwKetF592JcXA9Gd/BGlVvIdzTdWYdV/L5Yzt1jxzxZF6
	1YRRFE+jL8IMRLXEluLoxdsX1/S6o0rsujeSFPNQM867lXNsO9p/n+LgSxovwgWzC90=
X-Gm-Gg: ASbGncsADuX3IF2yz4DIAfUZIrA14kHDpMa1sjHdbS0tyHFMjw5JQZEJ71cgfKXXI66
	d+1aZrFgLLFgOR3kOKWspoGu42sNAPW/hssMZ967dK4ekS+li213IYTz17qrWxg2XgNOR8ycDAz
	9LI9hwh2QZ5WBfIkIkLL3XwKUGB0lwIKKkTOMQvdlL48c2WFHJzTbFzhoasAbpTIA4CD+huWMHQ
	QlPaRYuD4T46gU0xquS32ECfIDkqYTNMOgrO/5XYEK7YrtXyhBgLGztYkd6BK96pC09IpqyZgA1
	HnxdJtCizmvcZuUDXsxARzzdiRojw6nkUcuAP7orKLLn3hKqoQ==
X-Google-Smtp-Source: AGHT+IEQkzpf/GCapCoD2b5zMQetkWxlSYPIz9FgJgDLq+nYarNZ+dQ9zrl0ZkcjsNfdKzttk0MElg==
X-Received: by 2002:a05:6000:1785:b0:3a4:f7e6:284b with SMTP id ffacd0b85a97d-3a5686e46e7mr2096211f8f.10.1749804359658;
        Fri, 13 Jun 2025 01:45:59 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25e89fsm44115675e9.33.2025.06.13.01.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 01:45:59 -0700 (PDT)
Date: Fri, 13 Jun 2025 10:45:58 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] RISC-V: perf/kvm: Add reporting of interrupt events
Message-ID: <20250613-10b9c7df0043617e466a7212@orel>
References: <9693132df4d0f857b8be3a75750c36b40213fcc0.1726211632.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9693132df4d0f857b8be3a75750c36b40213fcc0.1726211632.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_094603_890392_FC6F94AF 
X-CRM114-Status: GOOD (  19.41  )
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

On Fri, Jun 13, 2025 at 03:53:38PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> For `perf kvm stat` on the RISC-V, in order to avoid the
> occurrence of `UNKNOWN` event names, interrupts should be
> reported in addition to exceptions.
> 
> testing without patch:
> ---
> Event name                    Samples  Sample%       Time(ns)
> ---------------------------  --------  --------  ------------
> STORE_GUEST_PAGE_FAULT   	  1496461   53.00%    889612544
> UNKNOWN                        887514   31.00%    272857968
> LOAD_GUEST_PAGE_FAULT          305164   10.00%    189186331
> VIRTUAL_INST_FAULT              70625    2.00%    134114260
> SUPERVISOR_SYSCALL              32014    1.00%     58577110
> INST_GUEST_PAGE_FAULT               1    0.00%         2545
> 
> testing with patch:
> ---
> Event name                    Samples  Sample%       Time(ns)
> ---------------------------  --------  --------  ------------
> IRQ_S_TIMER                   211271    58.00%  738298680600
> EXC_STORE_GUEST_PAGE_FAULT    111279    30.00%  130725914800
> EXC_LOAD_GUEST_PAGE_FAULT      22039     6.00%   25441480600
> EXC_VIRTUAL_INST_FAULT          8913     2.00%   21015381600
> IRQ_VS_EXT                      4748     1.00%   10155464300
> IRQ_S_EXT                       2802     0.00%   13288775800
> IRQ_S_SOFT                      1998     0.00%    4254129300
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  tools/perf/arch/riscv/util/kvm-stat.c         |  6 +-
>  .../arch/riscv/util/riscv_exception_types.h   | 35 ------------
>  tools/perf/arch/riscv/util/riscv_trap_types.h | 57 +++++++++++++++++++
>  3 files changed, 60 insertions(+), 38 deletions(-)
>  delete mode 100644 tools/perf/arch/riscv/util/riscv_exception_types.h
>  create mode 100644 tools/perf/arch/riscv/util/riscv_trap_types.h
> 
> diff --git a/tools/perf/arch/riscv/util/kvm-stat.c b/tools/perf/arch/riscv/util/kvm-stat.c
> index 491aef449d1a..3ea7acb5e159 100644
> --- a/tools/perf/arch/riscv/util/kvm-stat.c
> +++ b/tools/perf/arch/riscv/util/kvm-stat.c
> @@ -9,10 +9,10 @@
>  #include <memory.h>
>  #include "../../../util/evsel.h"
>  #include "../../../util/kvm-stat.h"
> -#include "riscv_exception_types.h"
> +#include "riscv_trap_types.h"
>  #include "debug.h"
>  
> -define_exit_reasons_table(riscv_exit_reasons, kvm_riscv_exception_class);
> +define_exit_reasons_table(riscv_exit_reasons, kvm_riscv_trap_class);
>  
>  const char *vcpu_id_str = "id";
>  const char *kvm_exit_reason = "scause";
> @@ -30,7 +30,7 @@ static void event_get_key(struct evsel *evsel,
>  			  struct event_key *key)
>  {
>  	key->info = 0;
> -	key->key = evsel__intval(evsel, sample, kvm_exit_reason);
> +	key->key = evsel__intval(evsel, sample, kvm_exit_reason) & ~CAUSE_IRQ_FLAG;
>  	key->exit_reasons = riscv_exit_reasons;
>  }
>  
> diff --git a/tools/perf/arch/riscv/util/riscv_exception_types.h b/tools/perf/arch/riscv/util/riscv_exception_types.h
> deleted file mode 100644
> index c49b8fa5e847..000000000000
> --- a/tools/perf/arch/riscv/util/riscv_exception_types.h
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -#ifndef ARCH_PERF_RISCV_EXCEPTION_TYPES_H
> -#define ARCH_PERF_RISCV_EXCEPTION_TYPES_H
> -
> -#define EXC_INST_MISALIGNED 0
> -#define EXC_INST_ACCESS 1
> -#define EXC_INST_ILLEGAL 2
> -#define EXC_BREAKPOINT 3
> -#define EXC_LOAD_MISALIGNED 4
> -#define EXC_LOAD_ACCESS 5
> -#define EXC_STORE_MISALIGNED 6
> -#define EXC_STORE_ACCESS 7
> -#define EXC_SYSCALL 8
> -#define EXC_HYPERVISOR_SYSCALL 9
> -#define EXC_SUPERVISOR_SYSCALL 10
> -#define EXC_INST_PAGE_FAULT 12
> -#define EXC_LOAD_PAGE_FAULT 13
> -#define EXC_STORE_PAGE_FAULT 15
> -#define EXC_INST_GUEST_PAGE_FAULT 20
> -#define EXC_LOAD_GUEST_PAGE_FAULT 21
> -#define EXC_VIRTUAL_INST_FAULT 22
> -#define EXC_STORE_GUEST_PAGE_FAULT 23
> -
> -#define EXC(x) {EXC_##x, #x }
> -
> -#define kvm_riscv_exception_class                                         \
> -	EXC(INST_MISALIGNED), EXC(INST_ACCESS), EXC(INST_ILLEGAL),         \
> -	EXC(BREAKPOINT), EXC(LOAD_MISALIGNED), EXC(LOAD_ACCESS),           \
> -	EXC(STORE_MISALIGNED), EXC(STORE_ACCESS), EXC(SYSCALL),            \
> -	EXC(HYPERVISOR_SYSCALL), EXC(SUPERVISOR_SYSCALL),                  \
> -	EXC(INST_PAGE_FAULT), EXC(LOAD_PAGE_FAULT), EXC(STORE_PAGE_FAULT), \
> -	EXC(INST_GUEST_PAGE_FAULT), EXC(LOAD_GUEST_PAGE_FAULT),            \
> -	EXC(VIRTUAL_INST_FAULT), EXC(STORE_GUEST_PAGE_FAULT)
> -
> -#endif /* ARCH_PERF_RISCV_EXCEPTION_TYPES_H */
> diff --git a/tools/perf/arch/riscv/util/riscv_trap_types.h b/tools/perf/arch/riscv/util/riscv_trap_types.h
> new file mode 100644
> index 000000000000..854e9d95524d
> --- /dev/null
> +++ b/tools/perf/arch/riscv/util/riscv_trap_types.h
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#ifndef ARCH_PERF_RISCV_TRAP_TYPES_H
> +#define ARCH_PERF_RISCV_TRAP_TYPES_H
> +
> +/* Exception cause high bit - is an interrupt if set */
> +#define CAUSE_IRQ_FLAG		(_AC(1, UL) << (__riscv_xlen - 1))
> +
> +/* Interrupt causes (minus the high bit) */
> +#define IRQ_S_SOFT 1
> +#define IRQ_VS_SOFT 2
> +#define IRQ_M_SOFT 3
> +#define IRQ_S_TIMER 5
> +#define IRQ_VS_TIMER 6
> +#define IRQ_M_TIMER 7
> +#define IRQ_S_EXT 9
> +#define IRQ_VS_EXT 10
> +#define IRQ_M_EXT 11
> +#define IRQ_S_GEXT 12
> +#define IRQ_PMU_OVF 13
> +
> +/* Exception causes */
> +#define EXC_INST_MISALIGNED 0
> +#define EXC_INST_ACCESS 1
> +#define EXC_INST_ILLEGAL 2
> +#define EXC_BREAKPOINT 3
> +#define EXC_LOAD_MISALIGNED 4
> +#define EXC_LOAD_ACCESS 5
> +#define EXC_STORE_MISALIGNED 6
> +#define EXC_STORE_ACCESS 7
> +#define EXC_SYSCALL 8
> +#define EXC_HYPERVISOR_SYSCALL 9
> +#define EXC_SUPERVISOR_SYSCALL 10
> +#define EXC_INST_PAGE_FAULT 12
> +#define EXC_LOAD_PAGE_FAULT 13
> +#define EXC_STORE_PAGE_FAULT 15
> +#define EXC_INST_GUEST_PAGE_FAULT 20
> +#define EXC_LOAD_GUEST_PAGE_FAULT 21
> +#define EXC_VIRTUAL_INST_FAULT 22
> +#define EXC_STORE_GUEST_PAGE_FAULT 23
> +
> +#define TRAP(x) { x, #x }
> +
> +#define kvm_riscv_trap_class \
> +	TRAP(IRQ_S_SOFT), TRAP(IRQ_VS_SOFT), TRAP(IRQ_M_SOFT), \
> +	TRAP(IRQ_S_TIMER), TRAP(IRQ_VS_TIMER), TRAP(IRQ_M_TIMER), \
> +	TRAP(IRQ_S_EXT), TRAP(IRQ_VS_EXT), TRAP(IRQ_M_EXT), \
> +	TRAP(IRQ_S_GEXT), TRAP(IRQ_PMU_OVF), \
> +	TRAP(EXC_INST_MISALIGNED), TRAP(EXC_INST_ACCESS), TRAP(EXC_INST_ILLEGAL), \
> +	TRAP(EXC_BREAKPOINT), TRAP(EXC_LOAD_MISALIGNED), TRAP(EXC_LOAD_ACCESS), \
> +	TRAP(EXC_STORE_MISALIGNED), TRAP(EXC_STORE_ACCESS), TRAP(EXC_SYSCALL), \
> +	TRAP(EXC_HYPERVISOR_SYSCALL), TRAP(EXC_SUPERVISOR_SYSCALL), \
> +	TRAP(EXC_INST_PAGE_FAULT), TRAP(EXC_LOAD_PAGE_FAULT), \
> +	TRAP(EXC_STORE_PAGE_FAULT), TRAP(EXC_INST_GUEST_PAGE_FAULT), \
> +	TRAP(EXC_LOAD_GUEST_PAGE_FAULT), TRAP(EXC_VIRTUAL_INST_FAULT), \
> +	TRAP(EXC_STORE_GUEST_PAGE_FAULT)
> +
> +#endif /* ARCH_PERF_RISCV_TRAP_TYPES_H */
> 
> base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
> -- 
> 2.34.1
>

LGTM

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
