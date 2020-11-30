Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9843C5519F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 08:07:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2599B20709
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 08:07:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sp+16Iir";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVdLFF7x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2599B20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ba9wZ598Y/KJVXA7HCKBj3lz0Hh7W02d5ExRA2EmhK8=; b=Sp+16IirMIhgNyH4t4OoeQ7Ye
	zmakAY28LZQzFAZj+7T8lxUavLFew2VAeGnzU2R9e9ZVlaEWBkdT5GGBHU8fiLIIL9WSxuDZDBLD4
	SAS7HM0LfarSYwYmNkz5DpmhfTJqgpdEwdneTkGM2hJCAF8QDY3rmFXhaHihm8M/iLnGd7OHE/anm
	HZ0SfZELSvX1sJwXBRHypE3DuHbMQjUnCa5wieD8+TCjil9EOYWkSt1e515UAd4NPkmR6EU+iVVf1
	8kSizAfi9aRzAafuo4jjA5re810OlR92gdq7rAm3Wpqu9/N062H9nZzGRj/wMUkBsWVZZlauuEPdk
	L3mwnbWrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjeDV-0007Zx-IH; Mon, 30 Nov 2020 08:07:25 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjeDS-0007ZK-Rx
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 08:07:23 +0000
Received: by mail-ej1-x641.google.com with SMTP id jx16so19318645ejb.10
 for <linux-riscv@lists.infradead.org>; Mon, 30 Nov 2020 00:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/sejjbzH1VPFW9nCTItPee2k0fSpsfkmZsIeiucrGOg=;
 b=SVdLFF7xWJW5PzYeW9PtVHqnHFgfFlnAz3/olfCk/llK8OyX90C4rRBhMB3CYrHmOe
 A7EpvTlnGEtmlofIG8Hgiq9r91C59oqB8tfqi1kuujktvDkKf8o7UlUTtlV1hf36aIoP
 ifQTGBWYcYhMS1ppQN/oUk/Q35LyHErN3ZSnwtDCCK6SIZsnvGj2bTD7P+hoviTsF/5M
 TNrdCHepOsPVkyAfaNLGCfPri1BI1J3qlk+oXe01glbyFhcSWSuN6NzPZkz75KIHLrxp
 5DU+d17e4kxx+hktfZ+VSAu9y6z9tVRrCQXh7mWdaQvVr/DNys2HPes/DASFldyXZ/Gd
 N/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/sejjbzH1VPFW9nCTItPee2k0fSpsfkmZsIeiucrGOg=;
 b=U1THEdxtreWteFQE0hrbcQJfoV1b1TvLESSedJ8/wVZga9M+Ykvtyo5Gy2jg5MpDL7
 5ldFxxw+MjSm+HT/ZxbK+1Iwz1pbPae79XIcK4LhYCPouTXix9VhTdqaICANhKIpclce
 ZXoTGhGQm5og6kbkbtR7LJ2LqOXdPpdjmQKjIB16LRBRntP1Ie3dmbTjF7wna19o3FOq
 b6/+WadD+j1hrq3RGf0WCI46prMBtcSGx0rVHUX5kkCL2XYRBFrIglUmthcEnYKEjI87
 KN3tFGp0KZnmvdzOr83fYSJBhAujBP2Yjp1jbqQ5ZPodzK+5Dqvw9tiUF4vHUNViUg9E
 B+hg==
X-Gm-Message-State: AOAM533Yk3nGBfk12VUUyKCbT3gLeJ6fR+gLU7J4NwEqwyXOnDxuMTMK
 syfcBETQDjd2Gj6hD1IeyCiGx4GUMAhCm4prnkM=
X-Google-Smtp-Source: ABdhPJzbpC2c788iOfFVJUuzN0hpuqAqFwFMRkrHuYn24eb+BC3ZwkiRkTEK0k9onIQ08SzxIQAQ7/HQE38FSorlRm0=
X-Received: by 2002:a17:906:d8a9:: with SMTP id
 qc9mr19435353ejb.482.1606723640479; 
 Mon, 30 Nov 2020 00:07:20 -0800 (PST)
MIME-Version: 1.0
References: <20201130053037.27006-1-tesheng@andestech.com>
In-Reply-To: <20201130053037.27006-1-tesheng@andestech.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Mon, 30 Nov 2020 10:07:03 +0200
Message-ID: <CAOJsxLH-tCyvydX_+djXNMpOAxW2Zr7rAZizLUwQVNyU8YreBg@mail.gmail.com>
Subject: Re: [PATCH] riscv/mm: Prevent kernel module access user-space memory
 without uaccess routines
To: Eric Lin <tesheng@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_030722_938090_BB97D91A 
X-CRM114-Status: GOOD (  19.80  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, dslin1010@gmail.com,
 Alan Kao <alankao@andestech.com>, LKML <linux-kernel@vger.kernel.org>,
 Peter Xu <peterx@redhat.com>, Daniel Jordan <daniel.m.jordan@oracle.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michel Lespinasse <walken@google.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 30, 2020 at 7:33 AM Eric Lin <tesheng@andestech.com> wrote:
>
> In the page fault handler, an access to user-space memory
> without get/put_user() or copy_from/to_user() routines is
> not resolved properly. Like arm and other architectures,
> we need to let it die earlier in page fault handler.

Fix looks good to me. Can you elaborate on how you found the issue and
how the bug manifests itself?

>
> Signed-off-by: Eric Lin <tesheng@andestech.com>
> Cc: Alan Kao <alankao@andestech.com>
> ---
>  arch/riscv/mm/fault.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 3c8b9e433c67..a452cfa266a2 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -232,6 +232,9 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>         if (user_mode(regs))
>                 flags |= FAULT_FLAG_USER;
>
> +       if (!user_mode(regs) && addr < TASK_SIZE && unlikely(!(regs->status & SR_SUM)))
> +               die(regs, "Accessing user space memory without uaccess routines\n");

Let's introduce a die_kernel_fault() helper (similar to arm64, for
example) to ensure same semantics for the different kernel faults. You
can extract the helper from no_context().

> +
>         perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
>
>         if (cause == EXC_STORE_PAGE_FAULT)
> --
> 2.17.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
