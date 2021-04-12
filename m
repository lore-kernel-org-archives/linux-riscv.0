Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B39C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 01:09:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E04260FDB
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 01:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E04260FDB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=vVcFk0+3hMIpkA3DKBcHez6NmYiaGlHEH9yX3nBlvOM=; b=Sas9XKFt8mFsMb003JE9kD4Ln
	JkCBk9d/9/8JmakxXpbYor76/K3sc8bzorxJZjhzEZf33uNTzpuhDy2NU9+1+iHlVN8YSx1khpM8z
	1n/o9oMVLG5gZOaHEQ4LXXbPFzwfiTJ3Pcx86+R6gKwcT2/XSC5f/RPUL+S5m+al1AIXw5BEk+8cN
	PyrjoWsPRKiiMxRalU3ogAsqWILI0dvu2qFY2hz3TwnAsxru0yqsKYZfB6Lk5Wq7/5/pvXMk8lRPN
	N1V+fFkPUrZbbDF9PFAKnK5EvP5m32JZbobbyldECE5dASjHLgZr9G7+nedQjnSekFqFKm46t6Mjm
	bL0OW373g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVl4l-005PBK-5H; Mon, 12 Apr 2021 01:09:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVl4h-005PAg-9U
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 01:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=8ZVBss4/3ekyTIH1ouL6bPm/k9eU1VUeYjR3azQV62c=; b=NYV70CGW5QNnScG7QTSOwvjsBJ
 LwYuVC9nzfyTnfZyT/XXhCrZn+w3GhlMXBPXBII8evdFB8eK7QE2rhS/9ICK3FhE+MUuJKBQUrAHK
 ySorTBGPGLgHhttvtFP6BU/fAOfXpf4EjPFmitLJ8zfwFnTcWMso54YO4WjwHbTgs8qPTpSI6uu88
 DCRBSKNpwmETVtjQYJrW9Q8gfohc3P/JqbmzhdsouCgV/4dAkdBZpckqxvzpERXAcz3wnbcFt/zJf
 Feu5wfHTVqTEvn2jjSRkDjuOkBEA+i1mHcbTQ2nCTjg2EbYU+kK7hTmOfcKwXJ2r1Gd1O/rgzCUWf
 dAB0pIiA==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVl4e-005ooi-QL
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 01:09:10 +0000
Received: by mail-pf1-x429.google.com with SMTP id y16so8130788pfc.5
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 18:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8ZVBss4/3ekyTIH1ouL6bPm/k9eU1VUeYjR3azQV62c=;
 b=IR66+KeOkOLdyMnM8msMSje5sU5MC4MAptc+qLv1U0FVQkWXZ5CwCbZTzw/SGQ0TQl
 VRG0fiNF/WE/jeQMCB1iHovSPHVGM4EUNfxT0LamN+u8UI2Bq2bC7fl8CVr9mEB5TK1s
 HAwcsrApxvPFHZfz2kmxyRIhYt2n+1Y54tAgZ/NQavuhlSYkz+cehErZX9n/xOelLV68
 hH4ivaoWIU6vndS/ie6lTsoFRrmPtnAglDNcI4ihHW37dRqYc0CSjf2ZOfoQXCr7F0Fl
 7oshUaU3Nyks87TFq4NoU1P1cR99bzYtKXtv8/1DFUwpEKbUySmcydCoGPnkaPEySGhO
 N+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8ZVBss4/3ekyTIH1ouL6bPm/k9eU1VUeYjR3azQV62c=;
 b=RYklMtiNaHLoBvNxDi3jzFWl5C/DnoGDOa1qvn5BEFF2T23z7UK8OngolJkbuYLXfr
 N6XnujdejH8m1RQcMDahJho52V8wkxRl0biMRtyhPA4cwC5Lk6JtKtQTJSGPa9tPvE7Z
 3GDD6bfj6RWhJQlh3j5Og60hTQemVAG6eKnf/oyw7bXyjYlXEjRudhNEE+MTFacJozKs
 CWxjuyyEaY/bom19Ynbov/mlEFErXKKkgybeK2gN0hZ2OA8Oy/+/4ONNBM/nUEy+8xma
 TMg8TLjbaov12XAU/rEgWC9gysOeaDIlDuK2uK46z/d9htLNNlNsL0iEzqePd6V/IARl
 TtDA==
X-Gm-Message-State: AOAM533GIIROHgodyvBfOEpUn5T4YlLaEvyHPebKivUzZi+YGVxFQBSs
 OzoM6OKfWM8RkAAX4GpURctXFQ==
X-Google-Smtp-Source: ABdhPJwvJHzqk4ALT52DIaXKxdmhHchtsvItXuCmZ4JAOIMAyWpEbTACKByV3SSo9Ep60xmLezqsFg==
X-Received: by 2002:a62:2943:0:b029:24b:f35d:2565 with SMTP id
 p64-20020a6229430000b029024bf35d2565mr4211322pfp.52.1618189747978; 
 Sun, 11 Apr 2021 18:09:07 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id l25sm10052449pgu.72.2021.04.11.18.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 18:09:07 -0700 (PDT)
Date: Sun, 11 Apr 2021 18:09:07 -0700 (PDT)
X-Google-Original-Date: Sun, 11 Apr 2021 17:44:48 PDT (-0700)
Subject: Re: [PATCH] riscv: kprobes/ftrace: Add recursion protection to the
 ftrace callback
In-Reply-To: <20210330021440.44280b7f@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 mhiramat@kernel.org, rostedt@goodmis.org, guoren@linux.alibaba.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-b1f80b4e-5e45-4ad0-8a80-1f0d8522e4dc@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_180908_873394_D452E073 
X-CRM114-Status: GOOD (  19.22  )
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

On Mon, 29 Mar 2021 11:14:40 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Currently, the riscv's kprobes(powerred by ftrace) handler is
> preemptible. Futher check indicates we miss something similar as the
> commit c536aa1c5b17 ("kprobes/ftrace: Add recursion protection to the
> ftrace callback"), so do similar modifications as the commit does.
>
> Fixes: 829adda597fe ("riscv: Add KPROBES_ON_FTRACE supported")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/probes/ftrace.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/probes/ftrace.c b/arch/riscv/kernel/probes/ftrace.c
> index 17ca5e923bb0..aab85a82f419 100644
> --- a/arch/riscv/kernel/probes/ftrace.c
> +++ b/arch/riscv/kernel/probes/ftrace.c
> @@ -9,10 +9,16 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  	struct kprobe *p;
>  	struct pt_regs *regs;
>  	struct kprobe_ctlblk *kcb;
> +	int bit;
>
> +	bit = ftrace_test_recursion_trylock(ip, parent_ip);
> +	if (bit < 0)
> +		return;
> +
> +	preempt_disable_notrace();
>  	p = get_kprobe((kprobe_opcode_t *)ip);
>  	if (unlikely(!p) || kprobe_disabled(p))
> -		return;
> +		goto out;
>
>  	regs = ftrace_get_regs(fregs);
>  	kcb = get_kprobe_ctlblk();
> @@ -45,6 +51,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  		 */
>  		__this_cpu_write(current_kprobe, NULL);
>  	}
> +out:
> +	preempt_enable_notrace();
> +	ftrace_test_recursion_unlock(bit);
>  }
>  NOKPROBE_SYMBOL(kprobe_ftrace_handler);

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
