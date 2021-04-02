Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4E6C433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:13:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A257B61056
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A257B61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xidzg70LAklIDghQuJbrN0ptbCYbGOlYTx1IvNaRw14=; b=fVbLzUPU2DKLDFM1AHUDMm/C4
	ikI383UIx8+goSEvYo+/BcYSj2vV2YIs/lyp/oH30GvJTq8oFBnHkwvXefss9997xrwcogorAv4Vr
	+TDhDSaGB+Jv/PLsVyqDhrC93JyUOzBqPHOy1Fr/DtMBstqXhEGGBd+Hw3gviIjOvjy6UoMY0XY23
	SDvu9NA2Fpqerzjl1Jnlt6tZt6UG0K7+c8hfFb48zAtR+lH81AOTbSK16KSbnk/hi8BeJi3fLeevo
	R+lri3QHRqMPUeCiDrsB3F+J5ppqWHNEWeI/QXpqJwLClVLJfL9LEVZy3JnPbSVqny5su3d9qRnwf
	DJMOSRgeQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSBB4-00Bu5l-K4; Fri, 02 Apr 2021 04:12:58 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSBAy-00Bu5F-KI
 for linux-riscv@lists.infradead.org; Fri, 02 Apr 2021 04:12:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id c8so3656482wrq.11
 for <linux-riscv@lists.infradead.org>; Thu, 01 Apr 2021 21:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Ab9mXgnZVMv96jlr6O1hIj0YRsCl0wKzDzAenTSuZc=;
 b=xf/w8QzI+ZBwFIoabuDx3ObP6k759O1uCoWKy8RIkcmvbjl+DGebyX85YYxjgYo4sX
 PaHW64tHXrgYHQBDApeA8ph+hznPztWlLMwAuqexcuiajj5rV0IdISu7vxJlEx7koGkb
 cmxXFNAz9rVUj/h3eC9Chtfz2c3nvzDmCxjioinaxE8P7iQpnz7fL0B9DCgyeWWYflH7
 mTp7kJmwjDBAqoitDCZoxKxQrbvyuWrDiprfRCtkRx9Sga5ojkbpKWXVVgbwg5Nudq3D
 5TARSmVvgAdFsa5vtlxP2J5AzOqXeuDc0OKVeaVKw/l+P/4hKIyB4i5N8arf5pBVZPya
 XjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Ab9mXgnZVMv96jlr6O1hIj0YRsCl0wKzDzAenTSuZc=;
 b=ExHBg0lFHBdFVSwx0aJWHVCFtKliyAqsQWy6McRGWpYjQKuB2cE6Q3uV2vgYNvY+GV
 qNwvk/mQh9zlm+KwoalOIsTS+fBW0ylpiScxXT0RD/C05S8kHbhcvm/tZ+Z5EkLVFms3
 dL4J9qrjo3RodYiBndyelWMwEhHrOLXNushV4AHyPQT/GwrTs41kvLLaqPhLRUM+k/IH
 FSx5e8VheNMYBSCddmGnIn3IcJ7FhU8iEDb/cV3JiZPtcjhx3REv10kSk0SoeZ46tfqI
 gyI9XCmEQ1FY3jfHJ7ca3jaqVzJMp8R8EWzJXAFEy/MttxgSEOHKxyYn1lyydprfBlyI
 Af+Q==
X-Gm-Message-State: AOAM532k/kxknlO73jBNrDvncB7WgUz+uMahPTIwllVV7VsNZLE+0sZp
 tmH12eDFeTZgOn96JYPCqQyiIa8TiVoYV+ecOiajLw==
X-Google-Smtp-Source: ABdhPJzce57ZbjTnYu4jCQZ2VOeAbeFZGI80++FdsSrgqHui+/61LSGd1A4m/MCwzZEPoTJBilxreUdun/rWvR5X5xo=
X-Received: by 2002:adf:9544:: with SMTP id 62mr12956426wrs.128.1617336771963; 
 Thu, 01 Apr 2021 21:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210401002442.2fe56b88@xhacker> <20210401002651.1da9087e@xhacker>
In-Reply-To: <20210401002651.1da9087e@xhacker>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Apr 2021 09:42:41 +0530
Message-ID: <CAAhSdy18AwkvNj5bgq6nLV29UNBQcs2MTDCwf_9GL5dC+4=8og@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] riscv: Constify sbi_ipi_ops
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, netdev@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_051252_757065_589E0BFF 
X-CRM114-Status: GOOD (  18.56  )
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

On Wed, Mar 31, 2021 at 10:02 PM Jisheng Zhang
<jszhang3@mail.ustc.edu.cn> wrote:
>
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Constify the sbi_ipi_ops so that it will be placed in the .rodata
> section. This will cause attempts to modify it to fail when strict
> page permissions are in place.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/smp.h | 4 ++--
>  arch/riscv/kernel/sbi.c      | 2 +-
>  arch/riscv/kernel/smp.c      | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> index df1f7c4cd433..a7d2811f3536 100644
> --- a/arch/riscv/include/asm/smp.h
> +++ b/arch/riscv/include/asm/smp.h
> @@ -46,7 +46,7 @@ int riscv_hartid_to_cpuid(int hartid);
>  void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);
>
>  /* Set custom IPI operations */
> -void riscv_set_ipi_ops(struct riscv_ipi_ops *ops);
> +void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops);
>
>  /* Clear IPI for current CPU */
>  void riscv_clear_ipi(void);
> @@ -92,7 +92,7 @@ static inline void riscv_cpuid_to_hartid_mask(const struct cpumask *in,
>         cpumask_set_cpu(boot_cpu_hartid, out);
>  }
>
> -static inline void riscv_set_ipi_ops(struct riscv_ipi_ops *ops)
> +static inline void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops)
>  {
>  }
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index cbd94a72eaa7..cb848e80865e 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -556,7 +556,7 @@ static void sbi_send_cpumask_ipi(const struct cpumask *target)
>         sbi_send_ipi(cpumask_bits(&hartid_mask));
>  }
>
> -static struct riscv_ipi_ops sbi_ipi_ops = {
> +static const struct riscv_ipi_ops sbi_ipi_ops = {
>         .ipi_inject = sbi_send_cpumask_ipi
>  };
>
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 504284d49135..e035124f06dc 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -85,9 +85,9 @@ static void ipi_stop(void)
>                 wait_for_interrupt();
>  }
>
> -static struct riscv_ipi_ops *ipi_ops __ro_after_init;
> +static const struct riscv_ipi_ops *ipi_ops __ro_after_init;
>
> -void riscv_set_ipi_ops(struct riscv_ipi_ops *ops)
> +void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops)
>  {
>         ipi_ops = ops;
>  }
> --
> 2.31.0
>
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
