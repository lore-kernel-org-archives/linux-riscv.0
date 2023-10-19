Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E7BCDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 08:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XVpwig/0I7QI3DfzAZwSWg5Fv3QCbENTW+/GL/ZVJS0=; b=WHaRraS7ic+E2d
	p878PM2HNa5AkQeAr+wS827wgg0cPF2SFHykiymsgl73qnEzx+MdeIgR1mrTD7oyLTt7c/+57gzWP
	HMwatVLxfJOtAJ4cxfw/VbbfWFg62xxcCoFJz2kB03Q5EgpPnBK22NiE5DOUABy63a0/E/82x4jM3
	F/v+DTR+/CbCv7bQXzF0PHLoh1w1R0kLWyvUagSivrfpVHaaG3tUlbuemDj9Weq5nDf/urQozZvhY
	d4x2o484LPoVkJdxEEfHJPUaJr03qRHBPD1BW+7PNir6nx7l9Xke0wRoXOMCD/UxCGxMdKpMq3uTu
	6rYBxjOxGuV5CrSiRiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtO0U-00GfOx-0L;
	Thu, 19 Oct 2023 08:03:50 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtO0R-00GfNO-1S
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 08:03:48 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32d9d8284abso4970415f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 01:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697702626; x=1698307426; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PH3CTrts87/bU27l3EN5JAWxWDeGWRQ9EMGON+8aZg4=;
        b=Vz1BORO4g8PL2emicfgmH4TKr+iwfh65WqT5PMcqaJbdrhfOh2y8n20ZgYyBmu+Asl
         lCKFxDEc4SYBbQTdksnMo/MgtjtWfctjSYRHd0sDigY9/EMmJvAz2CiiDdnCZruh3l4v
         rjRymdwwTZle480s2VDrfhSrPw0oicrc4Zeh5ra9/TEuy1/8VfVHWslQDyZttHiyd8m5
         DhFLmG0cPbkobSZbziolKE3WKYNFwToVIAFrCiGK7eORlgx8M1McilQyH+cwZPqqPzd0
         HNhkAoIe1HbQr2OprhRvbFPiKZaXv6pgczPEeKT1GMaE8JNl6fST3AeiKUY+uQg7jzsw
         GrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697702626; x=1698307426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PH3CTrts87/bU27l3EN5JAWxWDeGWRQ9EMGON+8aZg4=;
        b=LNLupsrfNSE0NUGRILlrC/0HpjljzZlrbsPdnA0iVwSZJO9pnJjjIpvAORa78zRXep
         KDqDc/daK+7yppX1GZqeQlxQgDKUIBAcH3zwTWMKH6RwoMfjMI9Rkj4cIAQpfg8rhgdl
         JGkoaaaPc+YtmZwZfJTW2NoO5vzAsXY4dGdMKj3PHe+x61YIx5G9GDPa99dyy7wgGj1T
         WSAoBCZUFhrIb6Wks0bdBBEU6Gs6HT3EBqCj1trCLYNjJcrD4qlVYmLB0vPhfbiu/hDy
         vtQitj7bGdhQWUTDWj+auDi5uityF+qQUOzSaLHmznR+ktdIYxkL3RsDfuYXHyzHkzYF
         x2Dg==
X-Gm-Message-State: AOJu0YxbCB+ceFyThRe0n+MTA8imvWIr8TB2XphWvOZnDrY+bb88FByJ
	a0sCOXFLZrHbwqcuTNA2bJ8pGQ==
X-Google-Smtp-Source: AGHT+IHYgrLP95m19T8VV4j4IIENiIUl+y5B0n5FUWHPqZ/oM3kMO8SamCcDgZ0NeNrUiRnd8JBlpA==
X-Received: by 2002:a05:6000:11c9:b0:31f:b120:143 with SMTP id i9-20020a05600011c900b0031fb1200143mr887639wrx.59.1697702625844;
        Thu, 19 Oct 2023 01:03:45 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id c12-20020adfe70c000000b0031c6e1ea4c7sm3818471wrm.90.2023.10.19.01.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 01:03:45 -0700 (PDT)
Date: Thu, 19 Oct 2023 10:03:44 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] RISC-V: Add inline version of
 sbi_console_putchar/getchar() functions
Message-ID: <20231019-61b3653a98a1c021623b091e@orel>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012051509.738750-6-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_010347_493283_B4F016C2 
X-CRM114-Status: GOOD (  16.40  )
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

On Thu, Oct 12, 2023 at 10:45:06AM +0530, Anup Patel wrote:
> The functions sbi_console_putchar() and sbi_console_getchar() are
> not defined when CONFIG_RISCV_SBI_V01 is disabled so let us add
> inline version of these functions to avoid "#ifdef" on user side.

nit: Here and in the summary I'd probably use the word "stub" instead of
"inline version".

> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 12dfda6bb924..cbcefa344417 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -271,8 +271,13 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg3, unsigned long arg4,
>  			unsigned long arg5);
>  
> +#ifdef CONFIG_RISCV_SBI_V01
>  void sbi_console_putchar(int ch);
>  int sbi_console_getchar(void);
> +#else
> +static inline void sbi_console_putchar(int ch) { }
> +static inline int sbi_console_getchar(void) { return -1; }
> +#endif
>  long sbi_get_mvendorid(void);
>  long sbi_get_marchid(void);
>  long sbi_get_mimpid(void);
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
