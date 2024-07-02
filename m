Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05BCC2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 03:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ts6ZFJ9iG2qtHox/PpRZxkWjeanekWpx7/UoFKkOpj8=; b=h+rui/v8OR2D+P
	ZCts+dUM3os9PB/yGuIKOp174bZe6hLXK6qctQ2uMiYcY4sCKiNwYPMQhWwXTC+/ZJTRLwzldQNfj
	gKRbKBWKRil9adgtdQVXr3Dgq7uQEwQEkyWwlxTamGALRqm+DKqN7Kyc5irvSv55fAsaYz6R3e6uv
	kvzuzITtBq4eev2QpJd1r+qTWuryeLAnC2YN/c7U5zuewTIF7kAMZEXXYoormTo2+aa6qdWHKjZoz
	MGYznE0Srlrrc1bHAbUuZfYLXC0AlPX8cVQSqiVVriLupnOqUQPANuwF6GsWeJwBOntLA3m5xZOIq
	cd2FXuEGxzCGIYACmjQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOTmW-00000005Nqg-3N6S;
	Tue, 02 Jul 2024 03:02:12 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOTmU-00000005Nph-3LR7
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 03:02:12 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7180308e90bso2035030a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 20:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719889329; x=1720494129; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ojm2WDT+jRVGV+bXsvRAENxh4cvFhiHctBiMqtse7vA=;
        b=gqUMQ6vjRstZLYiR9YO+Nof3gofBQ0dCUsf1/RSRHVyulTw3HppX/+meQHoaLn0/HX
         un5eTkqUCJxvq/eMp3gMgnK9Xc16xbUMY9pkzLExHkId84Le4ciFk/t6GUh21sSL/JU4
         ctRV0yvgM+qw3AtpZPmzqJzgCAJhG531nkxVs57ktxbLSpCwYsbxyjT1V48nX3Mm/EfI
         UklKdCqFcvrqweUdZq+NwKq5RDRIh00DZZ6f/MOdFNTHyLGYksW4LmioUsw4eIidFJOC
         nR3KRWc4894rmWPC/h8lVEJ58Qa6mWextBviIOv8rtSgOZuSXAcCY56/GneB0dHAtEzn
         tGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719889329; x=1720494129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ojm2WDT+jRVGV+bXsvRAENxh4cvFhiHctBiMqtse7vA=;
        b=VRwOC4NxTCgTGo8pchFqit2AsqVvpMx/d851EugaAbh/0P6PRxTYwlfqb00Aw/Lr0p
         ckKjjtu63HCppK+1yCV0trU2rklb57lBjqNPwZSJy9OZlM7XUUchQM3YfBqHXTpoiuok
         P1YRKIocQE+r7nYL/XwC8HS7CsvUFL8DTUgJ9Ker4gT+kTaX8K/Eu2mCJRN/obIG1MoQ
         ZJ1sL7plg+50mrzacW2adlb3o/VfuQbH4WXLHoGAXFw5020Uyi2ECrUkdJREWLmUiGZW
         CsqVwxCXfVICmEQpp/lp3maaFuiW4EFu3DN5ly+GpObpQU7ro+TOdxWdOs6Wvp3O35vz
         Rx7A==
X-Gm-Message-State: AOJu0Yz36qdPfiajBhBCbw1usM6EUW9m5qpuFJLmXQ3uCl6OT6wkkLIc
	2slSB6PdQI/0sddBdHqEeDrdi9VD75hpd0MQUCpZhHmv2qyAUbY5ApxC5wzRVVU=
X-Google-Smtp-Source: AGHT+IFtzRVBgPoIZ5spdIWYcesTZAiiJeslpnCGATGmgq3SV6QGiwVYg4WyG0rOC5lcz8Vf2zmQxA==
X-Received: by 2002:a05:6a20:cf84:b0:1bd:2699:436c with SMTP id adf61e73a8af0-1bef62066c0mr6579915637.40.1719889329603;
        Mon, 01 Jul 2024 20:02:09 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:a569:328b:99ad:ce17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1538ee0sm72521095ad.149.2024.07.01.20.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 20:02:09 -0700 (PDT)
Date: Mon, 1 Jul 2024 20:02:05 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Wende Tan <twd2.me@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 2/4] RISC-V: lib: Add pi aliases for string functions
Message-ID: <ZoNtrXawP8nvXUds@ghost>
References: <20240701185132.319995-1-jesse@rivosinc.com>
 <20240701185132.319995-3-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240701185132.319995-3-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_200211_006301_14CDD2AF 
X-CRM114-Status: GOOD (  15.32  )
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

On Mon, Jul 01, 2024 at 02:51:30PM -0400, Jesse Taube wrote:
> memset, strcmp, and strncmp are all used in the the __pi_ section.
> add SYM_FUNC_ALIAS for them.
> 
> When KASAN is enabled in <asm/string.h> __pi___memset is also needed.
> 
> Suggested-by: Charlie Jenkins <charlie@rivosinc.com>
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
> V2 -> V3:
>  - New patch
> ---
>  arch/riscv/lib/memset.S  | 2 ++
>  arch/riscv/lib/strcmp.S  | 1 +
>  arch/riscv/lib/strncmp.S | 1 +
>  3 files changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> index 35f358e70bdb..da23b8347e2d 100644
> --- a/arch/riscv/lib/memset.S
> +++ b/arch/riscv/lib/memset.S
> @@ -111,3 +111,5 @@ SYM_FUNC_START(__memset)
>  	ret
>  SYM_FUNC_END(__memset)
>  SYM_FUNC_ALIAS_WEAK(memset, __memset)
> +SYM_FUNC_ALIAS(__pi_memset, __memset)
> +SYM_FUNC_ALIAS(__pi___memset, __memset)
> diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
> index 687b2bea5c43..bc73325b2fd1 100644
> --- a/arch/riscv/lib/strcmp.S
> +++ b/arch/riscv/lib/strcmp.S
> @@ -120,3 +120,4 @@ strcmp_zbb:
>  .option pop
>  #endif
>  SYM_FUNC_END(strcmp)
> +SYM_FUNC_ALIAS(__pi_strcmp, strcmp)
> diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
> index aba5b3148621..b36325a57f6a 100644
> --- a/arch/riscv/lib/strncmp.S
> +++ b/arch/riscv/lib/strncmp.S
> @@ -136,3 +136,4 @@ strncmp_zbb:
>  .option pop
>  #endif
>  SYM_FUNC_END(strncmp)
> +SYM_FUNC_ALIAS(__pi_strncmp, strncmp)
> -- 
> 2.45.2
> 

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
