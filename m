Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCBDC3601E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Ib2rN03hPf4D+07YxFt8MsSVCD8UWQ7tftMbrmzVBE=; b=CYbiBBtytICirI
	5PHsTzy6Z54rjI8UP8v8vTxCVyuVm0YzZk7G4hhC5BeDqdaze/mTQ3a9epsjhubV3WJexyitutNd6
	O0BvEC6vJON+AHC7203qrYGobu1HnMfC0V32mLFf0mMcrambB9PTfYpG5SV0c7cxBMXyeZ9Zosari
	xiZgTclCObWqVUf20auiZuQkkUlZi+mTV4O7EdSMsk2XV6mrlUUI0/EYs9ln3Um3ycqXLHOMSBv34
	fLmd0DpGSP70tn88tHclNQDHY4romcFQ4R1ECrngoNuVCGW77Aort7MgPXODOFGaacREnQzmUgBsE
	oKp0op0NZdGy8J8LruCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jDL-0000000HHYd-17Gg;
	Mon, 07 Apr 2025 09:56:23 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1j7N-0000000HG5t-3PuP
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 09:50:15 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5242f137a1eso1708064e0c.1
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 02:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019411; x=1744624211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwJS9ivezLqTwGll2R8290UTJUlsdkM5bSWL9DkCvyU=;
        b=C01/grs+pXvyDT32krR6pchPyVBiaf1bLunkLbHLRqN9u9rIDHEGKbooUgWxQfb5R4
         NZhPe97bM+82Es/VKP61fHTa+1nBblPgvAwN9wxm7rVzvcFmt96aMctKW9NfHky3279/
         p0agR5dgA5uv0WHqKZN+qord6+/fNvU3Sqk42clR8vHoODgekhBfoBc9QGeI4HynnNVv
         BQBfFaMIwZ0dk7HpkQw7ZO1mFAbvcWasG3N+oq4BP4Cjg5NO2gvMfexM/zWI2A4kEQI3
         sOrQtmJDOVxDrp9jGa/z5A9SlKaegIcaZRCm82ny0MAKLFKMu7h85HmW0QJHeo8BlWIe
         bYGQ==
X-Gm-Message-State: AOJu0YyQuN6GZqpO8ti9DZxApXScprPhKP0cRd2G1L8PuU9DxDs1rAsm
	6IBN4Bvl23h8vUaQcKOmZYE35kV1qD7sjYPD2Jtc79TVpwPjlZbgeqVfhFWb
X-Gm-Gg: ASbGncuqDhAkoKXn2HhmV1SZ2O/zxOxR1VGVyIxpCLPG9IzTwFD+90Mx2ci7XmZWSLJ
	37tfti80tWlmJVzjiC1pC9RfRxMsBgMQjdgmJ1WRYUtzQu0QkqIcYjfLeW/uj4b46BsQV5594kf
	bwRP54V2m2y2TFtecZFMFrAsYEdPrHe3WCqVlVHmu0C0lC5QRVqGgh9UilBFMg2zma/circGRQ1
	6G/AoUGLE2M4nXCeXdgnGrQkHey2pvTMyYM6GiDEXh6qeWXMpT3DrxtgsJgegWust1upErjd2el
	hd8AL1XCKFcW0LIQPbcktiB5tYFdTqM5P4kvus7gsxmlwCDzorBUZWZa7boP1WhQUUGRnUgXL/n
	YBcrWIHU=
X-Google-Smtp-Source: AGHT+IEG34DwL6ENXmbHb+JpcON5LAPnsHdsS9LH3FdRZPspwiNKfX/stXpYKrrSC8CU3yfoJkw3Vg==
X-Received: by 2002:a05:6122:168e:b0:517:4e40:6838 with SMTP id 71dfb90a1353d-52764554826mr7221567e0c.6.1744019411483;
        Mon, 07 Apr 2025 02:50:11 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5275afaabc7sm1776940e0c.44.2025.04.07.02.50.11
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 02:50:11 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86fbc8717fcso1801269241.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 02:50:11 -0700 (PDT)
X-Received: by 2002:a05:6102:2b8d:b0:4c4:e414:b4eb with SMTP id
 ada2fe7eead31-4c8553ddbd7mr9525973137.12.1744019410896; Mon, 07 Apr 2025
 02:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250304120014.143628-10-ajones@ventanamicro.com> <20250304120014.143628-17-ajones@ventanamicro.com>
In-Reply-To: <20250304120014.143628-17-ajones@ventanamicro.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Apr 2025 11:49:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com>
X-Gm-Features: ATxdqUHaYPJ6zIQIXr2E8SkaYlNUmpQxf0qo-hNfWxqixyfdWpOzgNBl8dhQdaY
Message-ID: <CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed tests
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, alex@ghiti.fr, 
	Anup Patel <apatel@ventanamicro.com>, corbet@lwn.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_025013_853820_8E9F5FA0 
X-CRM114-Status: GOOD (  26.71  )
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

Hi Andrew,

On Tue, 4 Mar 2025 at 13:02, Andrew Jones <ajones@ventanamicro.com> wrote:
> Allow skipping scalar and vector unaligned access speed tests. This
> is useful for testing alternative code paths and to skip the tests in
> environments where they run too slowly. All CPUs must have the same
> unaligned access speed.
>
> The code movement is because we now need the scalar cpu hotplug
> callback to always run, so we need to bring it and its supporting
> functions out of CONFIG_RISCV_PROBE_UNALIGNED_ACCESS.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Thanks for your patch, which is now commit aecb09e091dc1433
("riscv: Add parameter for skipping access speed tests") in
v6.15-rc1.

> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c

>  static int __init check_unaligned_access_all_cpus(void)
>  {
>         int cpu;
>
> -       if (!check_unaligned_access_emulated_all_cpus())
> +       if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
> +           !check_unaligned_access_emulated_all_cpus()) {
>                 check_unaligned_access_speed_all_cpus();
> -
> -       if (!has_vector()) {
> +       } else {
> +               pr_info("scalar unaligned access speed set to '%s' by command line\n",
> +                       speed_str[unaligned_scalar_speed_param]);
>                 for_each_online_cpu(cpu)
> -                       per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> -       } else if (!check_vector_unaligned_access_emulated_all_cpus() &&
> -                  IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> +                       per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
> +       }
> +
> +       if (!has_vector())
> +               unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> +
> +       if (unaligned_vector_speed_param == RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN &&
> +           !check_vector_unaligned_access_emulated_all_cpus() &&
> +           IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
>                 kthread_run(vec_check_unaligned_access_speed_all_cpus,
>                             NULL, "vec_check_unaligned_access_speed_all_cpus");
> +       } else {
> +               pr_info("vector unaligned access speed set to '%s' by command line\n",
> +                       speed_str[unaligned_vector_speed_param]);
> +               for_each_online_cpu(cpu)
> +                       per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
>         }

On RZ/Five:

    vector unaligned access speed set to 'unsupported' by command line

However, this is not set on my command line?

Apparently this can be set using three different methods:
  1. It is the default value in the declaration of vector_misaligned_access,
  2. From the handle_vector_misaligned_load() exception handler,
  3. From the command line.
Hence the current kernel message is rather confusing...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
