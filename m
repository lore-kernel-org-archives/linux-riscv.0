Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2EAC433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 03:50:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A34BB601FE
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 03:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A34BB601FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2pW3lFrT6LE1HB3reyy6O6CwCoCZhD4Q4qVvW1Ebo78=; b=RqE0LM34dETOWpGrXvEPTCFU9
	v7cEK0GQFX16ewUhLFmf1f9ZgWzaDLlQfdXoZw3RlYHnuhOvFp0v27u6s5MlyckJD2AX7yNratg3c
	X6szVuczZoGCa3AyiJCDYZC71BQED+D/G/XhMPgjsdABRjZtIJ0DJIuCZURUiJ4+Xo9TZVyNGEvW/
	fzu0ZqpvElKCkqOSGmXGY24NTQWbmFTGlb2VasZhoei+N9bCjfuMoAGq0CKSzarFUUJ/7p+Wmboxi
	HjfltG7rzB20mQlQe1QwrZ/9GPIa/eGBAtEjQnO7JyISOjuHMeZIXHp3CS9nQ4rdHxlFcI40ETKfq
	xjpzVoPZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWA4A-008Bw6-Me; Tue, 13 Apr 2021 03:50:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWA47-008Bvp-56
 for linux-riscv@desiato.infradead.org; Tue, 13 Apr 2021 03:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tCLss6L2rlH6nui9SBILYlvnXvgvjlR5gMc5fRIeGlU=; b=YgUjCjhuqQjK+PrG/dAAK702V5
 jtgyi5fHcdz0uUXquszQkduB7/UD5cj+PJeq31Wgw13MhrNLM9kb2plYBXuqDEnRVp5OhfC676hDP
 6O//KEcoXZIatfxX6UDiCah5nkZYV6/yiz9B42nzJlsMqdBIVqmlul9EFWjE+7Q0ggrTrMVVjaaOv
 X4c2suTdSz4tHT3ooaTdHOz9TvNR6+s4RxYFMaOKmxQYRdwul81h20PKOZIF0Tti8DsHvOPtGnRf5
 6dveiMywrbOn7ufhSMBLmCtgkyATYICnFP7Ed23GqMin+HXYgn6l5PImjqU8bxVP5j167CbM5DJ7X
 EIljPeTg==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWA44-006hpw-8S
 for linux-riscv@lists.infradead.org; Tue, 13 Apr 2021 03:50:13 +0000
Received: by mail-wr1-x432.google.com with SMTP id c15so5995058wro.13
 for <linux-riscv@lists.infradead.org>; Mon, 12 Apr 2021 20:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tCLss6L2rlH6nui9SBILYlvnXvgvjlR5gMc5fRIeGlU=;
 b=h8uHMGP+0siogYx0lsEcrSGhqGjozEZiaoZBsIxchbVkOpuUIaAhHcpY8G9peLdBGR
 C4E4ybkDFRHhDn1HchsyJrogB6Ct1j5hm3rsihquEW2obJuEMqOtmFOOwVJqjZ36Ftii
 YOFq+qQ6RVgTxKwr7CiNmwYj/0i6q+eVM7R0vLUVEA9CeoXX0VfqCwzHkgrkeOjhA37E
 Tt0SegHOZxj7+QZ4unqJfFruG3RlGRGBlheNwz8SUeAKEVW6qveFZ/qM8YyVezD5jM3s
 Ahhyhy8I85kdRyH8sRFHLN6Dv1IW5uA+oZ9YEe9b1B6xHMPJoDTAlA5L7kbvich2mncw
 c/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tCLss6L2rlH6nui9SBILYlvnXvgvjlR5gMc5fRIeGlU=;
 b=jlDGe2iNb9RF12E2EKP+OLWMJ7/8kFTpqYkLTkgrVL48Y/fmg2YVr6mkHd/38NodNf
 nNaNqjKRqejBNl9CgJaRG5P/fDFcETCtppcniK43UkdJBAayHUBI1YxMT5P9d0WRerl5
 PsyLs2o1myOkBK20opNwU+BkSPL+FtxLsrBYR/J0/+WLyEVevCOYpHcZM8UoRc3WVsPl
 y3aJR7VDZIraK1bP9QEWlMbLYqU4/grmp4C+7k3q3CNFUiJOpWMc3+ElcHPhCHPqkqkk
 p8LLCHmh9a2t0KWFtPPGixxqEmMyzKvRVdWws/pNlR1r0658fa+6F/rXALpAi/UqxmVR
 Ww1w==
X-Gm-Message-State: AOAM530tUu81QqS+B38X8NMpEkeKW/t5ldzpew9WgSLguhSTmAMsU0aO
 Qa2imhnZ14nTU8jj6B495inimZaf+eCrXIbBV0j2TQ==
X-Google-Smtp-Source: ABdhPJyuTQXUgefe0/dn4tuy+MtAh10eT9dLIEA1gZIrXQl5WgTFytzsbYihpX1KHFQsBs6cIHHWNMXonoNIbaCn2ww=
X-Received: by 2002:a5d:4bcb:: with SMTP id l11mr35673706wrt.390.1618285810112; 
 Mon, 12 Apr 2021 20:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210413001110.7209bae6@xhacker> <20210413001159.341a95d6@xhacker>
In-Reply-To: <20210413001159.341a95d6@xhacker>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 13 Apr 2021 09:19:59 +0530
Message-ID: <CAAhSdy3iiJniE3ubPjSZvtVtT7tf5OW8zNONcEbAvrVmLXAjBA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] riscv: mm: Remove setup_zero_page()
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_205012_456661_A3442860 
X-CRM114-Status: GOOD (  15.02  )
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

On Mon, Apr 12, 2021 at 9:47 PM Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
>
> From: Jisheng Zhang <jszhang@kernel.org>
>
> The empty_zero_page sits at .bss..page_aligned section, so will be
> cleared to zero during clearing bss, we don't need to clear it again.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/mm/init.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 7f5036fbee8c..dbeaa4144e4d 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -57,11 +57,6 @@ static void __init zone_sizes_init(void)
>         free_area_init(max_zone_pfns);
>  }
>
> -static void setup_zero_page(void)
> -{
> -       memset((void *)empty_zero_page, 0, PAGE_SIZE);
> -}
> -
>  #if defined(CONFIG_MMU) && defined(CONFIG_DEBUG_VM)
>  static inline void print_mlk(char *name, unsigned long b, unsigned long t)
>  {
> @@ -589,7 +584,6 @@ void mark_rodata_ro(void)
>  void __init paging_init(void)
>  {
>         setup_vm_final();
> -       setup_zero_page();
>  }
>
>  void __init misc_mem_init(void)
> --
> 2.31.0
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
