Return-Path: <SRS0=UXoG=OJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D62C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Sep 2021 02:36:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16DEC60F48
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Sep 2021 02:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16DEC60F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jSAkDAz9EqnlRiIP3LaLikB16lt0jtHFyuwyN2uRKJ0=; b=w3nrP2iilLoOJn
	UXqvK/ZrUqrJUoO3Wgpni7cYAmGgb3931gGKDq0olGnt4qqKSGjKcVjkOW+Taxwez7r2CWUU7w3VY
	WaekHpPCoNiEAyerwZGqKbt8Ze1xOlgDq6edkbDbMNfQ+/Acl3sOLfUA+crvvq4mJ6k5XD+wzCWIq
	c5mrNYOPMYsmgHdAiH7I1R1LxtMGll+GdwFqSTbw0j6iAvgYnGAftlC+bg6NGxcGN4uuw7o9kAPGs
	Xa8IWwJ8NCf1eY/87qEem2cYjkwRiN5x14wJBduO4L2MqQZXqsw8Z1cVUevngq7X8FVVj5N58U3H9
	1QNMzy8E1tWvOtJFxgbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRmgB-00GctO-CQ; Sun, 19 Sep 2021 02:35:43 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRmg7-00Gcsd-ME
 for linux-riscv@lists.infradead.org; Sun, 19 Sep 2021 02:35:41 +0000
Received: by mail-qk1-x72c.google.com with SMTP id p4so30609805qki.3
 for <linux-riscv@lists.infradead.org>; Sat, 18 Sep 2021 19:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bk4AhLnNfk3EYFQjUK0lAUBPIa1P/jSFZkkuoC+UJA8=;
 b=fbF2hxSNHg0/ExIIdnB5g+Zhy7Uq1b0xHEIuKTJMs62/xEA19OHtbeXx8GJA5e+AZw
 F0AXdQEIqyDtkxKyirrqudgI7tWh7mNU3GQbYg18HM4orwe8H81qA0kK7xGnzn+aWyE4
 uELuzQ2xce70pZeYO8F6GTxIylqJPWucx3aec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bk4AhLnNfk3EYFQjUK0lAUBPIa1P/jSFZkkuoC+UJA8=;
 b=ishUowPxBOcToU6lq/N2PORGcSdVaGZgR21WAhSrR8ayZi8FlP8EQh20LYV2rWp744
 8SEQRddiV0BN9qpHr1j/lJHsDtBQJ0vRS/QpwK66/HsRkgUgxNSqz3UV/4s8lZ07oQDl
 Vu3PkNUKhe7RUhHzUz1fsLQawuv9hguNoh8IAgmGIDPd2P1vaIk79uIxlB1dFw/IzrsS
 qJ/bfTxHSl5Xz3YR+ZH35cYs7fofHvj6dLkWIElP6Hco3pxA2v4iBmfjeGedicr3V9St
 0jdTnKXLksaXVXOMedILbinEnEzg6P8AwW05UlGM82k1piroupliaEEZiZmi/OPb0mel
 EJ9g==
X-Gm-Message-State: AOAM531ccEhMqaaa1q/UK6hC/M6K+T0sddii/9PfcCoZ4fFVFqHOzs3n
 Ex3Okh93GjbJ0+/YWbiq34kxREkEXi4atVjSkWgM
X-Google-Smtp-Source: ABdhPJwhpLY5/KBgGMVSWOLJn+k3TDnINgm6FVVrxdMPHncdxwCwvLkkoJlHrBOJpOLFTpBNyITbDxSPz6aXzlN3UBc=
X-Received: by 2002:a25:c745:: with SMTP id w66mr3323239ybe.505.1632018937524; 
 Sat, 18 Sep 2021 19:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210918160221.111902-1-alex@ghiti.fr>
In-Reply-To: <20210918160221.111902-1-alex@ghiti.fr>
From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 18 Sep 2021 19:35:26 -0700
Message-ID: <CAOnJCU++j8z1f6F8SPKe-SeSJYQYg1Sra27HPPTRFijyGXdOyA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Flush current cpu icache before other cpus
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210918_193539_842845_EAB807B2 
X-CRM114-Status: GOOD (  23.84  )
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

On Sat, Sep 18, 2021 at 9:03 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> On SiFive Unmatched, I recently fell onto the following BUG when booting:
>
> [    0.000000] ftrace: allocating 36610 entries in 144 pages
> [    0.000000] Oops - illegal instruction [#1]
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.13.1+ #5
> [    0.000000] Hardware name: SiFive HiFive Unmatched A00 (DT)
> [    0.000000] epc : riscv_cpuid_to_hartid_mask+0x6/0xae
> [    0.000000]  ra : __sbi_rfence_v02+0xc8/0x10a
> [    0.000000] epc : ffffffff80007240 ra : ffffffff80009964 sp : ffffffff81803e10
> [    0.000000]  gp : ffffffff81a1ea70 tp : ffffffff8180f500 t0 : ffffffe07fe30000
> [    0.000000]  t1 : 0000000000000004 t2 : 0000000000000000 s0 : ffffffff81803e60
> [    0.000000]  s1 : 0000000000000000 a0 : ffffffff81a22238 a1 : ffffffff81803e10
> [    0.000000]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
> [    0.000000]  a5 : 0000000000000000 a6 : ffffffff8000989c a7 : 0000000052464e43
> [    0.000000]  s2 : ffffffff81a220c8 s3 : 0000000000000000 s4 : 0000000000000000
> [    0.000000]  s5 : 0000000000000000 s6 : 0000000200000100 s7 : 0000000000000001
> [    0.000000]  s8 : ffffffe07fe04040 s9 : ffffffff81a22c80 s10: 0000000000001000
> [    0.000000]  s11: 0000000000000004 t3 : 0000000000000001 t4 : 0000000000000008
> [    0.000000]  t5 : ffffffcf04000808 t6 : ffffffe3ffddf188
> [    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000002
> [    0.000000] [<ffffffff80007240>] riscv_cpuid_to_hartid_mask+0x6/0xae
> [    0.000000] [<ffffffff80009474>] sbi_remote_fence_i+0x1e/0x26
> [    0.000000] [<ffffffff8000b8f4>] flush_icache_all+0x12/0x1a
> [    0.000000] [<ffffffff8000666c>] patch_text_nosync+0x26/0x32
> [    0.000000] [<ffffffff8000884e>] ftrace_init_nop+0x52/0x8c
> [    0.000000] [<ffffffff800f051e>] ftrace_process_locs.isra.0+0x29c/0x360
> [    0.000000] [<ffffffff80a0e3c6>] ftrace_init+0x80/0x130
> [    0.000000] [<ffffffff80a00f8c>] start_kernel+0x5c4/0x8f6
> [    0.000000] ---[ end trace f67eb9af4d8d492b ]---
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
>
> While ftrace is looping over a list of addresses to patch, it always failed
> when patching the same function: riscv_cpuid_to_hartid_mask. Looking at the
> backtrace, the illegal instruction is encountered in this same function.
> However, patch_text_nosync, after patching the instructions, calls
> flush_icache_range. But looking at what happens in this function:
>
> flush_icache_range -> flush_icache_all
>                    -> sbi_remote_fence_i
>                    -> __sbi_rfence_v02
>                    -> riscv_cpuid_to_hartid_mask
>
> The icache and dcache of the current cpu are never synchronized between the
> patching of riscv_cpuid_to_hartid_mask and calling this same function.
>
> So fix this by flushing the current cpu's icache before asking for the other
> cpus to do the same.
>

Is this the same bugs described in this thread ?

http://lkml.iu.edu/hypermail/linux/kernel/2108.1/05465.html


> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/mm/cacheflush.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 094118663285..89f81067e09e 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -16,6 +16,8 @@ static void ipi_remote_fence_i(void *info)
>
>  void flush_icache_all(void)
>  {
> +       local_flush_icache_all();
> +
>         if (IS_ENABLED(CONFIG_RISCV_SBI))
>                 sbi_remote_fence_i(NULL);
>         else
> --
> 2.30.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
