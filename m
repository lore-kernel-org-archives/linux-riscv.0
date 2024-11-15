Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AFBD6DDF2
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 12:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuWYZEw65fy/6WK6VtVw7B4EOLJIzrJLN7j18/qAV3s=; b=Df0fpJkB2nzjZM
	Fsjc6zC8lKFFW2KIcqk6aiqUpJ3Qy7vYeLoxlSjU5qqu9gxS0euWJqAVcgZh+1uT1MKfW1qoYiGMx
	qtWHCn5UlVT76Q5u5VVglIYOdI2uICg+CarKFoSGrmHRjYBJfSUh7AlbBKKnRdKYAEfjOA2Z8Xjp3
	aTZXiehEEZfPUKltdrT/x+6SoV7EKTU3520yxDGDMR6exz4NPQd9Zkm46FFaU1fjIgT0OMz6+gcsL
	zy7LNOo7jYoDocwGKDmSc0mx2YtL9kcDkP5A9LHftoBNEMM6ixxSesNXxZaj9dOGRbNME8NF8LDH4
	U11bCZKTF71yTIMf7jRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBvAa-00000002chN-3jsZ;
	Fri, 15 Nov 2024 12:11:24 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBvAY-00000002cgc-3AAm
	for linux-riscv@lists.infradead.org;
	Fri, 15 Nov 2024 12:11:24 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so2760040e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Nov 2024 04:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731672680; x=1732277480; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XQ+AdD1yknk1kRQgfBx7Kwn6AzJEYVnpkDhWcnwpCyw=;
        b=D2rPiOIgnlS19dn7dCnhb9YdnAIj779L08B8FD6N9Zarb/qoOUmjQymovx2Bkvlfly
         JvjL2td+U9gIPn/+/vqUiCQMgDlL2DX0E0YhzA2KQW497uHYgdwkky9l+h8o20os+rqu
         2G2B0YgwuqA11LcVhtNlpvKZmR1BWoFzg5DgnVedWmGAJlDV9CWuZcWXThKbjjMlniBT
         X0m/Ve/gsPqfZAAG1SuGdVQ2x2/HMLHD2K/2gkeLLz7rA8HNCuuGTRXYJ1/sjkJ4bFih
         YbjGeYvp8oypNmXBfLUjcTwyv8Un09G1DSakITtrJkpKuB/XbRqOrRg9uXMqsFWG/42x
         68RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731672680; x=1732277480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQ+AdD1yknk1kRQgfBx7Kwn6AzJEYVnpkDhWcnwpCyw=;
        b=dKAzUdcGUHJ/SeNpEMTTpz7/D478tl7eEoWi+SCavY6Akh3XDaGwHOCTKHw4T6XKdz
         8D/4yl8oDLls9PVj/NyXOEN1o0uOvSpn94vy2INeMz0WUX5AzQj2Zvaiyag5MbtQHgXt
         8wVLjJebDDog1N5Y5uQ5H8ezadHSmQu+ar73YoeZCNfX8QEWWA4y2auMRz1tSIn3BUQ7
         /ehNq76JE9TDCITg7JwyIzA1gUBDyYlsqKs9aX/CeU/xDtwuEx3kSTi68zRbH6ONEqmB
         PPD0utnbgcXAeAM5GOMqiWihCKiF1gxqAEQgWUWL1e8Yxmnlil/x5T7dBoQuzjQQnTt6
         kBPg==
X-Forwarded-Encrypted: i=1; AJvYcCXrXYt9gVqyaxv0Ce98/DuVmdq33jBEdlHirXYcLM//3ft/OvrhgeMAf+h8HgyvFXpsEesvsLtDkzGQig==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMOkHwDHh8iXxmpCQ+EyFRr/XKFHT9X6pIUOgCh77EkMqPgo11
	mt8laR3uwjYV3df718kFPU0v7NUf5Lfud96sOaGr32QdX97LWemlFiXqumSni50=
X-Google-Smtp-Source: AGHT+IEumWSW2u3xlYJBaOGTCxOD92+UWLxyLa8a3IDnjbv/tYMlWpFgTL/S3Vntc2APqXqwBNhTaA==
X-Received: by 2002:a05:6512:1294:b0:53b:1fd1:df34 with SMTP id 2adb3069b0e04-53dab3b16c1mr2002910e87.45.1731672679939;
        Fri, 15 Nov 2024 04:11:19 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df1c53asm173250366b.15.2024.11.15.04.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 04:11:19 -0800 (PST)
Date: Fri, 15 Nov 2024 13:11:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kan Liang <kan.liang@linux.intel.com>, 
	Colton Lewis <coltonlewis@google.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [PATCH] riscv: perf: Drop defining `perf_instruction_pointer()`
 and `perf_misc_flags()`
Message-ID: <20241115-829a0b75f783dad6dac037a5@orel>
References: <20241115111345.17750-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241115111345.17750-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_041122_796373_3003B95B 
X-CRM114-Status: GOOD (  20.18  )
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

On Fri, Nov 15, 2024 at 11:13:45AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> With commit 2c47e7a74f44 ("perf/core: Correct perf sampling with guest
> VMs"), the perf core now handles the functionality previously requiring
> arch-specific definitions of `perf_instruction_pointer()` and
> `perf_misc_flags()`. As these definitions are no longer necessary for
> RISC-V, this patch removes their implementation and declarations.
> 
> This cleanup aligns the RISC-V architecture with the updated perf core
> mechanism, reducing code redundancy and improving maintainability.
> 
> Fixes: 2c47e7a74f44 ("perf/core: Correct perf sampling with guest VMs")
> Reported-by: Chris Paterson <Chris.Paterson2@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/include/asm/perf_event.h |  3 ---
>  arch/riscv/kernel/perf_callchain.c  | 28 ----------------------------
>  2 files changed, 31 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
> index 38926b4a902d..bcc928fd3785 100644
> --- a/arch/riscv/include/asm/perf_event.h
> +++ b/arch/riscv/include/asm/perf_event.h
> @@ -10,9 +10,6 @@
>  
>  #ifdef CONFIG_PERF_EVENTS
>  #include <linux/perf_event.h>
> -extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
> -extern unsigned long perf_misc_flags(struct pt_regs *regs);
> -#define perf_misc_flags(regs) perf_misc_flags(regs)
>  #define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
>  
>  #define perf_arch_fetch_caller_regs(regs, __ip) { \
> diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
> index c2c81a80f816..b465bc9eb870 100644
> --- a/arch/riscv/kernel/perf_callchain.c
> +++ b/arch/riscv/kernel/perf_callchain.c
> @@ -46,31 +46,3 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
>  
>  	walk_stackframe(NULL, regs, fill_callchain, entry);
>  }
> -
> -unsigned long perf_instruction_pointer(struct pt_regs *regs)
> -{
> -	if (perf_guest_state())
> -		return perf_guest_get_ip();
> -
> -	return instruction_pointer(regs);
> -}
> -
> -unsigned long perf_misc_flags(struct pt_regs *regs)
> -{
> -	unsigned int guest_state = perf_guest_state();
> -	unsigned long misc = 0;
> -
> -	if (guest_state) {
> -		if (guest_state & PERF_GUEST_USER)
> -			misc |= PERF_RECORD_MISC_GUEST_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
> -	} else {
> -		if (user_mode(regs))
> -			misc |= PERF_RECORD_MISC_USER;
> -		else
> -			misc |= PERF_RECORD_MISC_KERNEL;
> -	}
> -
> -	return misc;
> -}
> -- 
> 2.25.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
