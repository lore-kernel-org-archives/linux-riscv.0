Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B770C3600C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 13:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rPNXISsiRq1aoy4zBtPzpGrh8rLuW+yEWp3h79GJxX0=; b=rXqhY4YvC1s1mw
	iq2pF6+/G9u8EtAOmp/9RSITCuOd28yFc7dOeBU8zophsjz/f3uRUxCk2SM6yYPX3bjRCkTTX+v1F
	/GH+tP1yp7BvuXTLSLSXSz0iMEDWMXk53zBOC8ss8IyC2dqjhMds+P5ouN0sOOC5zIyMcgjTgGF3k
	rMi/d+RY5tIgAUq2r8awLLmzb9Pczw93aiNY744Ku0VFhXBeZPd8CbwbV1OrY9ED7itS6w98l6+yp
	+mcOU7DTmBv6h0iDuKt9Qb3whu3N+UB/LWowBruhvS+NkId/+emR3piPVJCZ5tTBhQSuNEqRPSx+r
	D4sIKQvJ1OHQ6BLNky1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2959-00000004DpV-3Y4F;
	Tue, 08 Apr 2025 13:33:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28bj-000000044HJ-258p
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 13:03:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43d0618746bso40196905e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 06:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744117393; x=1744722193; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yariCUXscgT6CSzi8mecIIs82gQSGVlzPNHiSOA5TSA=;
        b=VcHqw63Fb7NpT1F/NQK1F61LkafajY1Mg4arAyQYW+VWOJz6+ndcfyOMGxOgmcNEIZ
         t6IRwTIItQixFvNrY0F1C8jRkSiWQxIyY9LnlfNHlHABnAjEF6Z5gJRrxq+ppyDBiWff
         BbbCkzO08z+JwR73qa+o6LVhgxG7wEOTxvnKHnpgpGX8tTQAzPXKnU45YgsFy4YKIOyV
         HfQ/0guQ62UPe21/KNdEWgvt5XYbRKJk6zYA7uabzW2LhaXubXviHp7ooZft2BgteJRz
         JUvemIClyOY71QExwrSwvvQULSdYYzVExNKKYlioZP2o+uNTkWENMjBWWtGPTrIXi3/v
         aWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744117393; x=1744722193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yariCUXscgT6CSzi8mecIIs82gQSGVlzPNHiSOA5TSA=;
        b=C/HW0KKAeKzpYNwcchnS+js0RIJ6d+3Mn/rMhDdPDw20Mablt0dlKib6FIfWpNiXFb
         vHIr9ObQx+6mhdW4PLxiCRxfUxmVWN8z/2M7Vn37+xrEWMG+FLL0J9kfDDhRhwrruapz
         GTT1nR/gyth9uRJVg8s8B+L/+RZ7vzdoyGPe/ATrgJxRrlWGiUQ3o9yoWtpK7rxIoQMC
         tLb7ClAYWQ0dZARL4x5m+BAo6llvcpnmSPHFAr4Taz3I8TTQZx3XIPIYszpyphrHDU5d
         F6PG5S69Q3HCLL2nTIsdYMNKhg5Ra1thS9K5UbRzvZD393KQjI6NYNEqsUypiuTViKwD
         0H+A==
X-Gm-Message-State: AOJu0Yx3cJrzWKiwwzHw2nC+HkMpLE8WbmOPRC1qMdDmsou4TxATzfdh
	INuaVeTzjJTxikRXcjuR9UQyxff+bsm5NHtiLyjSMjr/NmWSESjSu70Pgin7hmE=
X-Gm-Gg: ASbGnctHqW+0XdrIwEyVQRJNjLFdmxPNnqazbrVRJ3yT34aCFj8a8A/9FC0f6Oz0Uzz
	3pBM/3q6rE0iCYH0EkH8lRIeXy6LWOXthGXBPSJUKvR+kUvcR95MBpPuhoCryRp/psQABAre+Gx
	Mloi7h8Mm4sjEyhEDepymwxsi5/B43ddUFoN2qmlCvyNsJJr4K39UL7FVnZBSufV8L9oeNkhnK7
	M/CmksGJqlDqtLR9Z4wt/G6Fc7tLBxdY7RnZxogwCIdGVHdSwZokBPVrpr94+35wuD3m7JCO8+0
	ob/fSFLOvmknLF+HE3CogiM5MtZE6JKZ
X-Google-Smtp-Source: AGHT+IF2Vv0rmz/WwZXEsLPeSJxbfCLrHKkL9DK4fFs4t2QUhn6W9THc1pNDbAlCQHOWVpb2Kmxavg==
X-Received: by 2002:a05:600c:c8a:b0:43c:f597:d584 with SMTP id 5b1f17b1804b1-43ecfa0704amr151411075e9.29.1744117391094;
        Tue, 08 Apr 2025 06:03:11 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::31af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm164456275e9.23.2025.04.08.06.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:03:10 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:03:09 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, alex@ghiti.fr, 
	Anup Patel <apatel@ventanamicro.com>, corbet@lwn.net
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <20250408-f3b5934a901bd24c1c800c8d@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_060315_536317_32919A25 
X-CRM114-Status: GOOD (  30.14  )
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

On Tue, Apr 08, 2025 at 02:25:12PM +0200, Geert Uytterhoeven wrote:
> Hi Andrew,
> 
> On Tue, 4 Mar 2025 at 13:02, Andrew Jones <ajones@ventanamicro.com> wrote:
> > Allow skipping scalar and vector unaligned access speed tests. This
> > is useful for testing alternative code paths and to skip the tests in
> > environments where they run too slowly. All CPUs must have the same
> > unaligned access speed.
> >
> > The code movement is because we now need the scalar cpu hotplug
> > callback to always run, so we need to bring it and its supporting
> > functions out of CONFIG_RISCV_PROBE_UNALIGNED_ACCESS.
> >
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> 
> > --- a/arch/riscv/kernel/unaligned_access_speed.c
> > +++ b/arch/riscv/kernel/unaligned_access_speed.c
> 
> >  static int __init check_unaligned_access_all_cpus(void)
> >  {
> >         int cpu;
> >
> > -       if (!check_unaligned_access_emulated_all_cpus())
> > +       if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
> > +           !check_unaligned_access_emulated_all_cpus()) {
> >                 check_unaligned_access_speed_all_cpus();
> > -
> > -       if (!has_vector()) {
> > +       } else {
> > +               pr_info("scalar unaligned access speed set to '%s' by command line\n",
> > +                       speed_str[unaligned_scalar_speed_param]);
> >                 for_each_online_cpu(cpu)
> > -                       per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> > -       } else if (!check_vector_unaligned_access_emulated_all_cpus() &&
> > -                  IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> > +                       per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
> > +       }
> > +
> > +       if (!has_vector())
> > +               unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> > +
> > +       if (unaligned_vector_speed_param == RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN &&
> > +           !check_vector_unaligned_access_emulated_all_cpus() &&
> > +           IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> >                 kthread_run(vec_check_unaligned_access_speed_all_cpus,
> >                             NULL, "vec_check_unaligned_access_speed_all_cpus");
> > +       } else {
> > +               pr_info("vector unaligned access speed set to '%s' by command line\n",
> > +                       speed_str[unaligned_vector_speed_param]);
> 
> On SiPEED MAiXBiT, unaligned_scalar_speed_param is zero, and it prints:
> 
>     scalar unaligned access speed set to '(null)' by command line

Thanks, Geert. I think unaligned_scalar_speed_param is likely 1 in this
case and we should be printing 'emulated', but I neglected to add that
string to speed_str[].

I'll fix this too.

Thanks,
drew

> 
> 
> > +               for_each_online_cpu(cpu)
> > +                       per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
> >         }
> >
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
