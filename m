Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9634CC6B38
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 10:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BPLiL7ySOrhIAvP5Fez+eyn0PINlNW+ZI0Bfb7k+1U=; b=BRQTUN/b4Z0b2x
	zvp8GB3xJICFfoatyGtmg8YWGIgilqqldXlUtwN4ZYYYSumxedzfyUCnj6mbdXE5XiuYWYAqWkJ0v
	rpxUiMLSDXvCBNEE3ygv5+UMsVqsqy9C2IalCA8deg9HjZf+Q69wGhUXlFT1NPBfxyF5cu+U0FNMd
	dD/EK5ykYOUl4PbAmQhZ3TlaiReZlJWL1bt51UUiC5dvMGx3YaMaLIGMR1IBaXactg/ZqvvkRpbdk
	FcHIaUhJoFO3u5/HNc6z5eRoYsO2pw95ifF71uo0PnjXfhOkVdYyc8rTrxDLpKBUYeWwjo9YHYIzJ
	J+IdN8YMjrg4eOHFQ96g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfO6-00000002gyh-2MqG;
	Fri, 16 Oct 2026 10:42:10 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfO4-00000002gyE-0Me4
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 10:42:09 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792147326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=epipb8UoYa5GWthCFcixoeMax2SLLfM/Rj85ANexd1w=;
	b=vLf0FZ4g3rNum2yM5/2nRCLLFF98FWcx27XeYwjcgF4q/MH0kVjJGYHaQhdBBU+QXqYX6E
	AdNGoggZGd8TPd8ir5VwzLV3krIZWF91W2FCx1L54v3sMnWmOpb4xDaqsxp1B+5PzuM3DG
	6C88yDXZPFlrKhruG35E5ebTQYENERf68qZ1Xtusim1zwzmr0JOyU0kpPEIup2YObfJKm8
	c1Cvu4AZJ1z79QwxmUs+ZHlZDG6cvd+HVRLpBUC1FPvbS5chtP43Q1OupshtOktj36VFoo
	zA9tKUM7Y0tF1P820FOOJNPlevimzgEEu3ylxJx327thQrhIq7JlW5i0S0YIgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792147326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=epipb8UoYa5GWthCFcixoeMax2SLLfM/Rj85ANexd1w=;
	b=EO7sA8qyfPso319AYSbb7NyPsYzOTG7CwoFSdh/qMxnqgMYlnroole8M+YBbo7MoE9T9H4
	6Wq3i301xBraihCg==
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Naveen N Rao <naveen@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Masami Hiramatsu
 <mhiramat@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Xiaofeng
 Yuan <yuanxiaofeng@eswincomputing.com>
Subject: Re: [PATCH v6 2/2] riscv: kprobes: add KUnit test for LR/SC
 sequence rejection
In-Reply-To: <20261016081706.1085-3-yuanxiaofeng@eswincomputing.com>
References: <20261016081706.1085-1-yuanxiaofeng@eswincomputing.com>
 <20261016081706.1085-3-yuanxiaofeng@eswincomputing.com>
Date: Fri, 16 Oct 2026 12:42:04 +0200
Message-ID: <87pkxa3p1f.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_034208_274860_28A4E90F 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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

Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com> writes:
> +.section .rodata
> +SYM_DATA_START(test_kprobes_lrsc_offsets)
> +	RISCV_PTR .Llrsc_before
> +	RISCV_PTR .Llrsc_lr
> +	RISCV_PTR .Llrsc_inside
> +	RISCV_PTR .Llrsc_sc
> +	RISCV_PTR .Llrsc_after
> +SYM_DATA_END(test_kprobes_lrsc_offsets)

"_offsets" is not precise, as this array has absolute addresses. Maybe
rename to "_addresses"?

> diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.c b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
> index 027424a3f..c2d9c87f2 100644
> --- a/arch/riscv/kernel/tests/kprobes/test-kprobes.c
> +++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
> @@ -43,8 +43,39 @@ static void test_kprobe_riscv(struct kunit *test)
>  	kfree(kp);
>  }
>  
> +static void test_kprobe_lrsc(struct kunit *test)
> +{
> +	/*
> +	 * test_kprobes_lrsc_offsets[] points, in order, at an instruction
> +	 * right before an LR/SC sequence, the LR itself, an instruction
> +	 * inside the sequence, the SC, and an instruction right after it.
> +	 * reject[] must have the same number of entries.
> +	 */
> +	bool reject[] = { false, true, true, true, false };

I am not a fan of coupled code. A change at test_kprobes_lrsc_offsets
mandates a change here.

Instead of this, how about we split test_kprobes_lrsc_offsets into
test_kprobes_lrsc_allowed_addresses and test_kprobes_lrsc_rejected_addresses?

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
