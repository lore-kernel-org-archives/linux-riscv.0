Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDAAC2D0A3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 07:11:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8893A20791
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 07:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gB3fpFvR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="infdVfgZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8893A20791
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=blUvIYwXkx/jvuKKAQTnOUYgZy02fQHuhz4gsuD3pzI=; b=gB3fpFvRTJUWXquNs/L7EwcOJ
	T3pqU39Fnmgyz14eWwlyexzCRT3v6geuNrPEWbuW2U+c3xPK3erSpsKGaWEZtWzy1D0I+DUCIXIRh
	HvyzGY/hbd4sXvli/I1rfAJncW+zkvzRzPj0kI8Kws447CeF6j+MX2v7yGRzNNAa5xTLuTXvz8Puj
	EdMbri9surgnKdE28xW1qy+e0J89mECq3jG3gLvQGZpFSICVXTZW9puDqQi0MlidvOo5p+AzdVkOn
	3nTYI/ZsAbe12QyJNBFfX42/keB9FO43Xjob/rK0JFN7yHvayFJLygwSgLWxvSxZDETU+S48zWAWm
	OlzdyPMmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd6kz-00042W-82; Thu, 12 Nov 2020 07:10:57 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd6kw-00041d-Hj
 for linux-riscv@lists.infradead.org; Thu, 12 Nov 2020 07:10:55 +0000
Received: by mail-io1-xd44.google.com with SMTP id t8so4951600iov.8
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 23:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x3qIC02aMBU7bwmmFa7s3H2WXjDciS6Bc5PFtVV1SjA=;
 b=infdVfgZLF9zpL4X+QvXKqKQcD5jNlVxw8lr47XLICbY2pcGn6x1BnEXNzFopjnsJc
 1/TwSF2FYH8ttkDggsqxEaZyRPLZ3fJmYZSO+Qgxen23emkha2Ubu+61z+KkUezvxT8Q
 az5Q/1HdXClJa+4yioyqKVWhZC2oivv1f/Hds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x3qIC02aMBU7bwmmFa7s3H2WXjDciS6Bc5PFtVV1SjA=;
 b=Sqt4x1g4fQBdQN68BvjGlCkzjE50iCbRCm5NeDgP191077VjGO/+kFGiBxrANig6Ko
 DpRjSDl4eCA4nEw/lliAqVzZJuRPkfjP2CrurWguqJh9KFMqq0Xc3OHMbSwr1+Z8OTCo
 SZX4oH1C8nte3xLi0qzTkrMR/Gm3Ggmlx1dKvG80jfxR9wXKxksH09fefqvHAlCjVCCa
 t9bqhravAj4qp9bugAEa9r2FMfZSUAvKCc6iGUhpz5oMjJSGkCCf1IiVSXm14CNOpFBP
 B7QKjCAnktvzKmDYg36FGtQw/l6FQdmjjXVNBF0kJi9HaOdHeouQ5V2uKD94hDFTPYFf
 3W4A==
X-Gm-Message-State: AOAM533Yi3zfCjG16IDnBn0ukFLAn+3/zcyflLvh2cU/o3PUQbLdaV7N
 p7xHok+u7MdPsWFGnhdSc2JoNpC/zcutQMUu4bk7
X-Google-Smtp-Source: ABdhPJy0jyiNEFTxb/pu9VSS6tVaLZgw1sNaM+QalZr7M6KiRVIPv5mNg4oGxGkMWp+UQ3yvBg+oO4WH/beqHZljAsU=
X-Received: by 2002:a02:dc3:: with SMTP id 186mr23578989jax.141.1605165049121; 
 Wed, 11 Nov 2020 23:10:49 -0800 (PST)
MIME-Version: 1.0
References: <20201112064855.99578-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20201112064855.99578-1-wangkefeng.wang@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 11 Nov 2020 23:10:37 -0800
Message-ID: <CAOnJCU+y4-ghEBm45HMhHxf5oVb-6CR9wa6amp0OCgEzFfiEag@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix W+X mapping warning
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_021054_693766_73941718 
X-CRM114-Status: GOOD (  16.93  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 11, 2020 at 10:44 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> When boot with DEBUG_WX triggers the WX warning,
>   riscv/mm: Found insecure W+X mapping at address ffffffe000000000/0xffffffe000000000
>   WARNING: CPU: 1 PID: 1 at arch/riscv/mm/ptdump.c:236 note_page+0x248/0x25a
>   ...
>   Checked W+X mappings: failed, 512 W+X pages found
>
> The kernel_page_tables shows first 2M(kernel image) is with W attribute,
> Use _start instead of text_start in mark_rodata_ro().
>
> Before,
> 0xffffffe000000000-0xffffffe000200000    0x0000000080200000         2M PMD     D A . . X W R V
> 0xffffffe000200000-0xffffffe000a00000    0x0000000080400000         8M PMD     D A . . X . R V
> 0xffffffe000a00000-0xffffffe001000000    0x0000000080c00000         6M PMD     D A . . . . R V
> 0xffffffe001000000-0xffffffe17fe00000    0x0000000081200000      6126M PMD     D A . . . W R V
>
> After,
> 0xffffffe000000000-0xffffffe000a00000    0x0000000080200000        10M PMD     D A . . X . R V
> 0xffffffe000a00000-0xffffffe001000000    0x0000000080c00000         6M PMD     D A . . . . R V
> 0xffffffe001000000-0xffffffe17fe00000    0x0000000081200000      6126M PMD     D A . . . W R V
>

This is already fixed by the following series.
https://patchwork.kernel.org/project/linux-riscv/list/?series=377843

> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/mm/init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 1d330bde9cf1..d739a46d9fc4 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -624,13 +624,13 @@ static inline void setup_vm_final(void)
>  #ifdef CONFIG_STRICT_KERNEL_RWX
>  void mark_rodata_ro(void)
>  {
> -       unsigned long text_start = (unsigned long)_text;
> +       unsigned long start = (unsigned long)_start;
>         unsigned long text_end = (unsigned long)_etext;
>         unsigned long rodata_start = (unsigned long)__start_rodata;
>         unsigned long data_start = (unsigned long)_data;
>         unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
>
> -       set_memory_ro(text_start, (text_end - text_start) >> PAGE_SHIFT);
> +       set_memory_ro(start, (text_end - start) >> PAGE_SHIFT);
>         set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
>         set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
>         set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
> --
> 2.26.2
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
