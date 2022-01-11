Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AED3C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 17:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZQhRoP1z1np0wv/Mm+VhA2iExjwrvpQUA8AeK0tzufU=; b=HTP5TTTKrsrP60foaCcgWpJSZW
	ztlVSmUCMEikAMp9cwv8s8VT9E6pjN89p4xU/uz7tMEpklr9zTmqQ2/HYwF6Yf7slo6BmNlKS23VK
	SK5vWNcPtmIa6etOGtLuvhaSilRb19XfEEBCrpP3+FogTpBfqc8F950Sdji6F0/z8Vgsa5ufgnXXS
	usMN1BNWOznDvwcwupR2YuCkU89vQZUqGrPAcbEsBzP0PqXLM1/a0Uz421T7WkbFWVrJ4e134mKOn
	Eb+olol6KZR9WYZPU3C9J4YtIa+2OHmMRb0DvA3D5Pwz4bfEvOazmxkyhvmNfYAA4oR2iNoH4zoRR
	7PX451HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Kxk-00H3Yf-S5; Tue, 11 Jan 2022 17:29:36 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Kxg-00H3WU-9X
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 17:29:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id q14so18289410plx.4
 for <linux-riscv@lists.infradead.org>; Tue, 11 Jan 2022 09:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=0KOZZtBBHeRkDdzPa5q1c2gpML5kGszF4xNBuuJ1X9U=;
 b=BY+u4bbQYNdmyC//Bv7GXEy44FwwMX1t8rhum6wd1C6taLrxSBJ8VnvLfUTJnhLyJc
 zkEyjQdABPJozjs5FtWLufh9s2aO4dwtnYExrwqXs+hJJTnK5YlFQhjhsWkFbKtMrwnQ
 hl5sUhV/kCsZLAmq1IMR7VyZvWX7/qOulYJL0ipcijr+6TfmxELjjtkxcW3L9/OcEjW0
 fiKatqDE+DAJDX1tiNaHAZm/Vp7xNdxll0cDi1MXedP3l/FCC0AbKopQYeBue/Um2a5w
 C1FEf9NdCrpehpHgC8xbGi6InBo4FYj91x8oFnAmiR1gRdpd/KpLHtKG3DbKJlznmVu6
 T/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=0KOZZtBBHeRkDdzPa5q1c2gpML5kGszF4xNBuuJ1X9U=;
 b=yFMpP3mN+6qWO9nu+ExRxeekVD/GLHmORxhs6E2VgmzCWtod7oej+oYUme6DVqXB6t
 6eG5nWg6+5QprVMwbR6RDeO1SwgF2Ts+dbMSBemy/fVrdVSq4iE2fzyzABuMa8qU79/H
 WOe/bvGw42Rw0SFuUYP892LfjI2wPXOMusY5A1Qyj3ahCG8hTG3BzleNGQX8W/xBh6M3
 NzzqGt6ePWQ4Rdmzu4x1Qk9dgd7tfCKAQOQ0PWUYjCXGTZE7mGUDc48CATkttEslcn4l
 KibYB/3Hr8R8m/GJY6KY4e1vZafRA9mMUO7vOj9zVUGsB8N7NitQd+jpmBG8sdGRTAiV
 IRoQ==
X-Gm-Message-State: AOAM532VzAxiIkaMvgAe3Bk7UBcokKRASnyU9N+PnNAgswvm2meOVsg2
 RXaGMdeYiEmoTE3x7w12SHgDQg==
X-Google-Smtp-Source: ABdhPJyUE27xqXcOOzoFLUBZ4NAdrQAHxnQ+OXs+EEHJQJXAtXGuafe0Df391hbXvZogvp0dzrXr4Q==
X-Received: by 2002:a65:5589:: with SMTP id j9mr4910464pgs.119.1641922170977; 
 Tue, 11 Jan 2022 09:29:30 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k13sm11560322pfc.60.2022.01.11.09.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:29:30 -0800 (PST)
Date: Tue, 11 Jan 2022 09:29:30 -0800 (PST)
X-Google-Original-Date: Tue, 11 Jan 2022 09:29:03 PST (-0800)
Subject: Re: [PATCH v2 2/5] riscv: mm: init: use IS_ENABLED(CONFIG_KEXEC_CORE)
 instead of #ifdef
In-Reply-To: <20211206160514.2000-3-jszhang@kernel.org>
CC: linux@armlinux.org.uk, catalin.marinas@arm.com,
 Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 ebiederm@xmission.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-ef554c87-32d1-443f-805d-3f74b88cd1f0@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_092932_373701_9AF914DC 
X-CRM114-Status: GOOD (  22.55  )
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

On Mon, 06 Dec 2021 08:05:11 PST (-0800), jszhang@kernel.org wrote:
> Replace the conditional compilation using "#ifdef CONFIG_KEXEC_CORE"
> by a check for "IS_ENABLED(CONFIG_KEXEC_CORE)", to simplify the code
> and increase compile coverage.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/mm/init.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index a15640eeb334..84879a5ce818 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -748,7 +748,6 @@ static inline void setup_vm_final(void)
>  }
>  #endif /* CONFIG_MMU */
>
> -#ifdef CONFIG_KEXEC_CORE
>  /*
>   * reserve_crashkernel() - reserves memory for crash kernel
>   *
> @@ -765,6 +764,8 @@ static void __init reserve_crashkernel(void)
>
>  	int ret = 0;
>
> +	if (!IS_ENABLED(CONFIG_KEXEC_CORE))
> +		return;
>  	/*
>  	 * Don't reserve a region for a crash kernel on a crash kernel
>  	 * since it doesn't make much sense and we have limited memory
> @@ -805,7 +806,6 @@ static void __init reserve_crashkernel(void)
>  	crashk_res.start = crash_base;
>  	crashk_res.end = crash_base + crash_size - 1;
>  }
> -#endif /* CONFIG_KEXEC_CORE */
>
>  void __init paging_init(void)
>  {
> @@ -819,9 +819,7 @@ void __init misc_mem_init(void)
>  	arch_numa_init();
>  	sparse_init();
>  	zone_sizes_init();
> -#ifdef CONFIG_KEXEC_CORE
>  	reserve_crashkernel();
> -#endif
>  	memblock_dump_all();
>  }

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

LMK if you wanted me to take this through the RISC-V tree, otherwise I'm 
going to assume all these are going in together.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
