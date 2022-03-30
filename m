Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8F3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Mar 2022 00:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=7vYFv4/agzYZ8xAPM9bQ5WyZflBczahb52bOa+KNWqI=; b=1CezQkp2cfLd21IcK8Xmh5HSy9
	kn6OsnliQCLaaWdoeBGQBSzuZ4y56wKGi0+v5JxOuG6lO7xVA62tR/UmSxtr4q2tEcQsQDcOITBy7
	98IONkjzvogHKL3kI67x0B2xmXF8qKmiosyHcirOCI8WKgYy7VRfN98HiDsd2s+Qu6Mu9TUtSu1eW
	bc1sfJuvXlFCip80Q19QSNrPseBC/xPMzYBG5YPdFnZoqsUlVW04qo1T5ScFY/7SbnXIng/LuVA0Y
	DuwdYTOwGMAgyhKjCm5BnbkIg/LYJLaShc3+b7m/6XtJ2f5KPUphlYLCa06QTvlaDZyOzfzeruEGT
	TnF5cA5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZM5i-00DqCC-I1; Wed, 30 Mar 2022 00:21:38 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZM5f-00DqBm-GX
 for linux-riscv@lists.infradead.org; Wed, 30 Mar 2022 00:21:37 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so4564584pjk.4
 for <linux-riscv@lists.infradead.org>; Tue, 29 Mar 2022 17:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7iLxch5y6RIgvR/T0zWqMEJ+cpUfEurleqixAHzR59g=;
 b=d6l2S7X6ubR/3qtqSf1gEAmewrLprB360r1t8kyD8au6PP6Uw3qtG3LFOeEsaJuH0a
 Uosk+2PV7kD+ZX41oUKqASL7vtobWwWbrZJvt2qsw6/kKgMSkxy7Lq84FNozbqUYHRO2
 YT7MYq8O8bUwbqTIN42fVMirVmIwOvEoQttWZbrfSjMBhzCfXvgLFxOX3i4/k5Nw+6KK
 rKsSsKvqZokfFUXKFzNJtCqZW7J1WLvA9xJaPpccQmHui9c8uOmKXzNTQKgFMa987eml
 aZ6D+6PIJZayCZT3qTHhE0yfQFYCmZ2Z+gfvHJDE1AtWZQKN3bGIedg0RDDF8j4CozAR
 cRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7iLxch5y6RIgvR/T0zWqMEJ+cpUfEurleqixAHzR59g=;
 b=SmSnhBmsPpq7Q3e+zAB4HrXHTS/dQLs0l2/5zshUS7S++YDuLyLOljkh7MNEM7vN8S
 G4NExoDFYlbi8BKgUd2kBTFxv/LTexI1HswexFG9MfOjSqNX6ay04OCvLVOdgLxoLvmP
 pdScV8iOeyet+h1ULROeXohLo+5DAG48kfgU6koApy1KZde0rA1ra234MEB61mVL2RRK
 vq5e+wccet9VtlnJoYWsjNYUkBspBvong/a2HHvBWTHr5+Vl2FQaeWG95ywIzMJpvjJ+
 5MSVhtEsueS3zGeoPgzOTVmtsOXN35i7IjlqoAvwdeRZrdeGy6SsVWA7mZxznvllJoOA
 spIw==
X-Gm-Message-State: AOAM5312yB+fkCwP6OkeydKEh6h75/49Llx1STFodkdoVgu2FJAxJrxW
 lCfUKcjQIy/uVQb5UwHQ4ze8wQ==
X-Google-Smtp-Source: ABdhPJxEvni5Sq3KIcfnKaN2LY52DfkeM+nZCKa8T5kJ161E/ZTfTMkikxIcAWzUNAuNKmyxa8oPgw==
X-Received: by 2002:a17:902:7205:b0:156:1a0a:2c39 with SMTP id
 ba5-20020a170902720500b001561a0a2c39mr9686710plb.88.1648599693682; 
 Tue, 29 Mar 2022 17:21:33 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 p15-20020a056a000a0f00b004f7c63cba5asm21702403pfh.21.2022.03.29.17.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 17:21:32 -0700 (PDT)
Date: Tue, 29 Mar 2022 17:21:32 -0700 (PDT)
X-Google-Original-Date: Tue, 29 Mar 2022 14:36:59 PDT (-0700)
Subject: Re: [PATCH v2] riscv module: remove (NOLOAD)
In-Reply-To: <20220322012617.3517297-1-maskray@google.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
 nathan@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 maskray@google.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: maskray@google.com
Message-ID: <mhng-891192a6-d537-444f-b092-5ae92620b233@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_172135_628340_2CBD0B41 
X-CRM114-Status: GOOD (  21.46  )
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

On Mon, 21 Mar 2022 18:26:17 PDT (-0700), maskray@google.com wrote:
> On ELF, (NOLOAD) sets the section type to SHT_NOBITS[1]. It is conceptually
> inappropriate for .plt, .got, and .got.plt sections which are always
> SHT_PROGBITS.
>
> In GNU ld, if PLT entries are needed, .plt will be SHT_PROGBITS anyway
> and (NOLOAD) will be essentially ignored. In ld.lld, since
> https://reviews.llvm.org/D118840 ("[ELF] Support (TYPE=<value>) to
> customize the output section type"), ld.lld will report a `section type
> mismatch` error (later changed to a warning). Just remove (NOLOAD) to
> fix the warning.
>
> [1] https://lld.llvm.org/ELF/linker_script.html As of today, "The
> section should be marked as not loadable" on
> https://sourceware.org/binutils/docs/ld/Output-Section-Type.html is
> outdated for ELF.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1597
> Fixes: ab1ef68e5401 ("RISC-V: Add sections of PLT and GOT for kernel module")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Fangrui Song <maskray@google.com>
> ---
>  arch/riscv/include/asm/module.lds.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/module.lds.h b/arch/riscv/include/asm/module.lds.h
> index 4254ff2ff049..1075beae1ac6 100644
> --- a/arch/riscv/include/asm/module.lds.h
> +++ b/arch/riscv/include/asm/module.lds.h
> @@ -2,8 +2,8 @@
>  /* Copyright (C) 2017 Andes Technology Corporation */
>  #ifdef CONFIG_MODULE_SECTIONS
>  SECTIONS {
> -	.plt (NOLOAD) : { BYTE(0) }
> -	.got (NOLOAD) : { BYTE(0) }
> -	.got.plt (NOLOAD) : { BYTE(0) }
> +	.plt : { BYTE(0) }
> +	.got : { BYTE(0) }
> +	.got.plt : { BYTE(0) }
>  }
>  #endif

Thanks, this is on for-next (it'd be OK for fixes as well, but it's the 
merge window so I'm just on one branch).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
