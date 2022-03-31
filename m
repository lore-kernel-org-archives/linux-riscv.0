Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C10CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 23:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=31tu1qkAmPrpECw88Z2B650wQwwqC9AnbwsuAzPFang=; b=HtLs1TjCAU5ulWZhlcmqDVJP62
	YqQnofR3v9+VcgmaOLXwvTJC2PTiUE8rqbXXGWwlvkv0c4uWkSiCFEjFU3TVc0pPtYgD9YvOU2CU0
	/q4AcfPFDktL6AdvSCek+1dctKHcUycokLSg5yP6ETF6U+UfgDeYbQvu1os/m21GlcD1kipKg/BhX
	de0ZOID2miBeydX+uI4p0KB5mjK0FduhSXKCiWaTOfdktiotpUMYX/SiSR58fo3HzrfhUpIgiGBD8
	tTGl4slUdRBVCd+jx3ZwyDVBqNjtHG7AkKWBxaBlVQQxQ7fIXu9NrV4OQGEeM5q2HjtZ6xEenDvdD
	983QvpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na3p5-003uoF-Qr; Thu, 31 Mar 2022 23:03:23 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na3p2-003unL-2M
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 23:03:21 +0000
Received: by mail-pg1-x532.google.com with SMTP id t4so961875pgc.1
 for <linux-riscv@lists.infradead.org>; Thu, 31 Mar 2022 16:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=2CCcpvh2XGWbPM9M/zpJ8AlaZY9fUK8zkZbsqG9HonQ=;
 b=c+4JbtLZYQfpp4UUgiLn3PRoYFBp+b8pB/W22noI8XHsYu2tKZTpcijcrwlgpONvdZ
 C8hXgdKeRLr296aZiEjBMD4bps+jh+QWTYiMLzKZDm/kQ4kMhrpUcLmJqclVGbGIIiTR
 IKhmrBgq9FOwVWkZcBdUe27S23txXiKM/M7d4M9LdmIR9uDRc3bzmz2fmhbwsMwdqJUV
 uhqhsYaPoKK4AneGaXXDun/VrVJK/c6YeELYU8wf0XoXxva4WRij1vNphunQ56c07TDY
 FgJELbeMNeiARCVqD8ATyh2c2VZunm9SR6tsr9HDK7Q5RkAvBfi93io8IHinEX0AJege
 qcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=2CCcpvh2XGWbPM9M/zpJ8AlaZY9fUK8zkZbsqG9HonQ=;
 b=3XKwBWHbUq9CDsMVBR0VkRfOhXj8CGfNviduKKMIE9zIYVfVn+7p1QmZkzwut4rzDm
 hAKosqszrW1J+B5xKUYO/scuGtFesNlwv1MIdFfZRxOun6l4XcWlMDqb9YDvwV7gVhUr
 Qwz/DcztVTuISAegj4WmlGcZXcX/wx1US0CMsO6nSWrS2kI2yCpET03cMNG7jYf6LEmS
 o+SB1YBfDPVJApN0TqOXWaCd3JNUPSk8ZtkFF8ONWC6lr2XkpNZ4SWk1a8Nezcr62Euo
 t3YLvBq9Jtq4p6g8IashMDpu3xca89RqiPlQvz+CWxeISLvZGo04wuEHxaNZNtTpe6IB
 or6w==
X-Gm-Message-State: AOAM531sZtC/YGHz7AXhWhWNnQ5HUz1SI6x57sFg8xgpSrwlPzjolU9b
 YwxV1LhKc9B7o0D99yW7YAAdvQ==
X-Google-Smtp-Source: ABdhPJwSN9YSkiKKWl6PHeYQKi/nk8XbJ4c2EzJfl0Ti/Mqi8zawqKbBU3ZPhgP71CyixCULa+DM+Q==
X-Received: by 2002:a05:6a00:13a4:b0:4fd:acb9:8ea4 with SMTP id
 t36-20020a056a0013a400b004fdacb98ea4mr7401523pfg.85.1648767798489; 
 Thu, 31 Mar 2022 16:03:18 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 b124-20020a633482000000b00382347caeeasm392635pga.22.2022.03.31.16.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 16:03:17 -0700 (PDT)
Date: Thu, 31 Mar 2022 16:03:17 -0700 (PDT)
X-Google-Original-Date: Thu, 31 Mar 2022 16:02:53 PDT (-0700)
Subject: Re: [PATCH] riscv: cpu.c: don't use kernel-doc markers for comments
In-Reply-To: <20220328220417.25675-1-rdunlap@infradead.org>
CC: linux-kernel@vger.kernel.org, rdunlap@infradead.org, lkp@intel.com,
 Atish Patra <atishp@rivosinc.com>, anup@brainfault.org,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rdunlap@infradead.org
Message-ID: <mhng-2a49da2a-fd67-4655-9302-3f44030b7863@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_160320_136273_5D19F1FF 
X-CRM114-Status: GOOD (  16.70  )
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

On Mon, 28 Mar 2022 15:04:17 PDT (-0700), rdunlap@infradead.org wrote:
> Repair kernel-doc build warnings caused by using "/**" kernel-doc
> markers for comments that are not in kernel-doc format:
>
> cpu.c:89: warning: cannot understand function prototype: 'struct riscv_isa_ext_data isa_ext_arr[] = '
> cpu.c:114: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Atish Patra <atishp@rivosinc.com>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/kernel/cpu.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --- linux-next-20220328.orig/arch/riscv/kernel/cpu.c
> +++ linux-next-20220328/arch/riscv/kernel/cpu.c
> @@ -69,7 +69,7 @@ int riscv_of_parent_hartid(struct device
>  		.uprop = #UPROP,				\
>  		.isa_ext_id = EXTID,				\
>  	}
> -/**
> +/*
>   * Here are the ordering rules of extension naming defined by RISC-V
>   * specification :
>   * 1. All extensions should be separated from other multi-letter extensions
> @@ -110,7 +110,7 @@ static void print_isa_ext(struct seq_fil
>  	}
>  }
>
> -/**
> +/*
>   * These are the only valid base (single letter) ISA extensions as per the spec.
>   * It also specifies the canonical order in which it appears in the spec.
>   * Some of the extension may just be a place holder for now (B, K, P, J).

Thanks, this is on for-next (still for this merge window for me).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
