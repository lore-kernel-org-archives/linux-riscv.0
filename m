Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A326DC369A2
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 13:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=179P6ehJEx1IPfxD0/t0Cn9NUZmdryq1vvFYl0T3Nfw=; b=yuFkgMJBp8drxP
	wDaYQ0HQrsCxirR/TaiYyE+q4i6EFuMPZ6F+XgxvssBJdabIa5Dd2d4YYsJ7jjbJno2QD52KrWCdD
	Kn5Zrvs+tAWUJ/Mo/gYtffhZe4zXlMButXfTi9Hxiu6y9i4yYaJAq8kj86kgYhXoQi9xPmTGZYF/v
	Y/HT1804Jt+PkDXFEYz26uo0UwpOC5dNTZlY9sCgMTPqLe/DObTFR0GV25dL6i3UF19MajaAqDnNJ
	P2GcGeSD59OAh/pkLqay3zLubyEQLuSCKJmTJjbr1sn+ZTLY1fSa+JpjtHe35SI3klgMYUTCFXzGQ
	8N+ApoSDIRn1u+LDC4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28nk-000000049FE-1C4G;
	Tue, 08 Apr 2025 13:15:40 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2819-00000003yoj-2Ec0
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 12:25:28 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5240317b3e0so1996233e0c.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 05:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744115125; x=1744719925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmoVRqhsoNOnjL4BFQMw5QTZ7bwxA2SFbH5ALW0olS0=;
        b=TTuPfIX0puUcl2pWVu6ak02yh4fibN8Bax089fYt/wnLjmryTKV/6Le//Mw3nVRuxL
         Tz+5PEf4080Vkiu0zX8q37vNoDN4aXRObqyoK6SbB4MlpGwK7ELuHklaYwGtqmBD/zo9
         ZrJYtgZuho4SlJnM2svR0Cw9K9HBH53t6cOLgyzsj53q49riSUWNDwyLgyDT9azJ1CIP
         cb/CBQ8ir35L88SGMnqiDhvZENyKZplnsVF86Ng0jWBUqsEtaKwM+uUrC8ELtms5jGcb
         cR878xIsiXpwX2JWeb7omO1HOxreigYzaWBUcpPaOyWZSzMhoS57Ua3DaHXTjjOXL6Zf
         xjvA==
X-Gm-Message-State: AOJu0YxRUmJOcpmEk3iuOcgDKWNIKzziQnAZdcxePMgw5TR+i5rN9Znv
	F7Ssk+FeLFAPWvbn2cLJdtJsVNqPhOivXGNX7X1QTxsIlkZ9YvLEFaadyaGO
X-Gm-Gg: ASbGncvjX7xBZQbe+3QZIODIr/K3/jqWIVUofAPk7zA3D4UitUQXj/F66DLsqBVReQv
	FLppTDmGXsvJ0fI5gdQUeOyQoisa+sxh0nl9QbsMhDUhQc1vuNrM38HeuRHKj3kOT/hMe+LhGa8
	UWx/zzsFabIKXj618MldBnzDNYy3ru0Ox5lbAeNvXmxDnmuJSdBoqVooh+0qvZH5RY8DOX0KMSm
	19GVW5P+uTdbPVah1P2d+/lVa5tHx+0l/6pbqvmWTcXQF3doMtGiAnfeXz3uAtoiDsHyWc7SEF0
	l8B7jlCwjy2rrr0JBkGgXGjmc6ma5fLDOj3TMt6pCOYi2+fNCaNceDi6uEU2ZLnSns3v2nm5bT1
	qp3dfnSuNTW/uhKGe7Q==
X-Google-Smtp-Source: AGHT+IGDd3GsNxCwIe5yC3Doma006z+WGFHzYGons1DVOKlbVVkD7GxOaAbbpLHFI4LGzNuEgrD6jQ==
X-Received: by 2002:a05:6122:2506:b0:518:7ab7:afbb with SMTP id 71dfb90a1353d-52765d6156fmr10490843e0c.8.1744115124609;
        Tue, 08 Apr 2025 05:25:24 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5279b6632f2sm347601e0c.35.2025.04.08.05.25.24
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 05:25:24 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86d6ac4d5a9so2680299241.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 05:25:24 -0700 (PDT)
X-Received: by 2002:a05:6102:26cc:b0:4c3:6568:3e18 with SMTP id
 ada2fe7eead31-4c85690b98amr12382088137.15.1744115124280; Tue, 08 Apr 2025
 05:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250304120014.143628-10-ajones@ventanamicro.com> <20250304120014.143628-17-ajones@ventanamicro.com>
In-Reply-To: <20250304120014.143628-17-ajones@ventanamicro.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Apr 2025 14:25:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com>
X-Gm-Features: ATxdqUEuseQfSHMyqp5jGlJCXh669euLgXjsEcSvlR6s_zvJ4hVoqMyGWzzcwFc
Message-ID: <CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed tests
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, alex@ghiti.fr, 
	Anup Patel <apatel@ventanamicro.com>, corbet@lwn.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_052527_568643_6FF14046 
X-CRM114-Status: GOOD (  24.03  )
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

On SiPEED MAiXBiT, unaligned_scalar_speed_param is zero, and it prints:

    scalar unaligned access speed set to '(null)' by command line


> +               for_each_online_cpu(cpu)
> +                       per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
>         }
>

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
