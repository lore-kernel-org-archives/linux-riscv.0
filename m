Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07ED8C27C54
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 19:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDsenPc4dg/5tybdPLeusu0gxnymqx9SIW8yEiBOr5A=; b=cxNOF5NoKs0P6X
	2V+hvTSDM3pAWTnJSlrAxy5dOAAYdnS810aVpWs/KjflZtt77/izFFYBaUQXHVruBjgB/3N7OMTXQ
	QSBnbuWoDebtYpti0YYwdEX4L8E/v7/I11/n5CQqdOICjMKmwVtuyWZon0IMpclxau7htP8epu02a
	u/EOB6ZbHSLCtP9iX1OPyjmj7BjsfF2QMWbRrsmQnIoxZWzo5DHhpCy7SwBrjaM5KU5mTvwH8wA6N
	LgP6sLOeZD+qQ5mJ8GXqQ1e9zbBlWvCMew24i4BJuOlEp/URhzDHuwMWcKO0IlDsntOdUEk9YQcPM
	LS50yt4jswfKD0xNMxAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFILT-0000000B32J-2G49;
	Thu, 06 Jun 2024 19:00:19 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFILG-0000000B2qA-1GvC
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 19:00:08 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1f6a837e9a3so9670225ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 11:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717700398; x=1718305198; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ia5T96X7Cdh71B4P1DUGWX14XzgXv8MDLAXPXG9Rctk=;
        b=rRci4nEg9nJMfD7oeEsLw3fwn+Uf6gLNZV53lijLCbrEmhFuQACIxvfiSC0lIWerjx
         lEcY92JewHc7ys4zV+gQ4n2NCF0RPDeywq1rjBCrB/ubg1sZNB7WVQ8FH+qv21tmu2ns
         YlQR/d+6UzcW3nF5iNYX1mJGtBWqimNduhCfuwJItTtiON8EvVQ0KIGcGYtO3mtQjZaJ
         XN+OAbtTezcFmhfOhjUMbT0SOICuBarwHEkaVVuM4e3wL1lGiMcnI7t0hPMgfRnW8zO9
         OHtbu2/FfYSTqnh+6C5eFjnrxtEUsDkrji8hAyZ+YM6NMRWVIEBs3De4V3f3IfqteWUq
         Jz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717700398; x=1718305198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ia5T96X7Cdh71B4P1DUGWX14XzgXv8MDLAXPXG9Rctk=;
        b=AvnluLJKfm683R02adA39LI4YSF8uq5k5ixQUyXfbKkdviTL9Grg2uT9DiXyrpEBj/
         vUPayX4RufaVU5q6jKe3CjDPYhvpuSS4qpIQl1VScjPtDBLtFhVKuynMlKXgKblAouvs
         rTJ9Cm5CqXwXKXX2fl76AHWK6VF7Awd1tx8G+0sTHxRTpQApNyWLad/DdIJU2CzsZMC4
         WSE6hNgOFOAe9vXJzr2DjtaC994BeiFw7qGGrgy1BrZtTzWy0q4obXrx2/D3HKkwfr8t
         WCVpNkZJ0BVwH1Kllir6WPdhZpJeAsSzVl9zQCIQX/dQqUt14cAII/+nPDSQdiP1GLbY
         ar2Q==
X-Gm-Message-State: AOJu0YyjnEjCn5UE++4zMZQyTDbGD/VeXWDSoOup3UagQsj7BQMshAqr
	WeCMlIJ7BD3/1CsFEB4M+ynKtgLNP6D9X7V/ommENVxu1usfSs7CHK6sejwSGMk=
X-Google-Smtp-Source: AGHT+IG0mTorn4UEEtaw8tMjG5VLaVYsSBfByfTDWyjZz8MAIW4igAg5dCtNVB+4OhFZ69AIpdCMtw==
X-Received: by 2002:a17:902:e847:b0:1f6:782e:da23 with SMTP id d9443c01a7336-1f6d039d1efmr5796465ad.63.1717700398198;
        Thu, 06 Jun 2024 11:59:58 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7e578asm19058455ad.232.2024.06.06.11.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 11:59:57 -0700 (PDT)
Date: Thu, 6 Jun 2024 11:59:55 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nam Cao <namcaov@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andy Chiu <andy.chiu@sifive.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: fix vector insn load/store width mask
Message-ID: <ZmIHKwhEyuQJnymK@ghost>
References: <20240606182800.415831-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606182800.415831-1-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_120006_517735_79EF3E32 
X-CRM114-Status: GOOD (  14.86  )
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

On Thu, Jun 06, 2024 at 02:28:00PM -0400, Jesse Taube wrote:
> RVFDQ_FL_FS_WIDTH_MASK should be 3 bits [14-12], shifted down by 12 bits.
> Replace GENMASK(3, 0) with GENMASK(2, 0).
> 
> Fixes: cd054837243b ("riscv: Allocate user's vector context in the first-use trap")
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  arch/riscv/include/asm/insn.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 06e439eeef9a..09fde95a5e8f 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -145,7 +145,7 @@
>  
>  /* parts of opcode for RVF, RVD and RVQ */
>  #define RVFDQ_FL_FS_WIDTH_OFF	12
> -#define RVFDQ_FL_FS_WIDTH_MASK	GENMASK(3, 0)
> +#define RVFDQ_FL_FS_WIDTH_MASK	GENMASK(2, 0)
>  #define RVFDQ_FL_FS_WIDTH_W	2
>  #define RVFDQ_FL_FS_WIDTH_D	3
>  #define RVFDQ_LS_FS_WIDTH_Q	4
> -- 
> 2.43.0
> 

Thanks!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
