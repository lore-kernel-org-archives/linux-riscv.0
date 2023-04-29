Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E15BC77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 12:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xf2syrh9nbguTlRh8ovYp7Z81jZscXlsGzAj2+uwOw=; b=VN5+EDAVmSAd/n
	djN8XaV1NTtS2/LXENkXHW7ytAMit0skMvrDjq85H3D+3szoS43vjh2wPCQQvVyAy6W8Bov+ciQ1m
	psCbjc5P+pBVAzWNyvs34+dF0T1RLedIylUM6iiC8DT8tPysnELlHKrq7rGBhm9NrAWjGaWFY+st1
	yTw0ENSJvCGaOMXx/IQUcrFE8KyNFqmezXA6nr6qzBETtUnquSmxGIrH8FCVC97596TEdTyG7eHb+
	8CnwPLvG1ioTwNyabQQQ6Tz0oi3BV0K5/0ymEbIMCxSpb7sq4wEQ+QNBI+obS2x64lYwJ7mxlRpSR
	zU7ExGO0kC3AclunCEvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psjmk-00Ck4g-1Y;
	Sat, 29 Apr 2023 12:34:42 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psjmh-00Ck3T-0C
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 12:34:40 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-305f0491e62so382060f8f.3
        for <linux-riscv@lists.infradead.org>; Sat, 29 Apr 2023 05:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682771675; x=1685363675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oyTww+8/zlSGEpH0cgrTBvyiwJFDady3FmCvoDDMgT0=;
        b=A/z5TyUTqwCud45/kIkuGOx165IgVQyxljkiX3LKmU54aJnPA50bxIdVR7ORVbXPJG
         xLzfHVYD1z1C+uol3WpTyDpqwZGSqr1wH51zuS+TNV47qeoqch5NqgvTx9xAeqZY44IU
         XWA4SIStAPzkbCckFU/tbkQYR+hhIYkxqc9rsjeN13oSpTfat4mby2+qQH2b7+vr8MsO
         kVr7vr0bqsw5soMq/oHkc1kaIvmSxzIMNlotFeYuA3/n2lgPhzq76mR9b0G+QsX2p550
         4qYsIkYVYROlXo4IosM1ZtD6Cpm8cJ2fEQNX4jIWRknEVYDHna0vHNyJ5nBrjAXZGr0a
         oGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682771675; x=1685363675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyTww+8/zlSGEpH0cgrTBvyiwJFDady3FmCvoDDMgT0=;
        b=g5Vg8eNG9/OiFI5g3Tev/Y1dpTBj2kPKAAIeYYEf2TtNY2VkedH51qZOZVp+/J/mFG
         TmjNZk6htmMewTshB9/QoIUgQKRIuiDZ2OK+Q+7g+P/sJQhU+XnTeyZ9vKKgRC7zyzry
         jkvHHrak6NMF7FPWdKUbMfTO5KrYc+sYPfg3x1oIQ2pAMviagRqbpYlxfXYVjaia/Emj
         nj4eE7kIdBsVYzeeueEUo3Op9dnUukDdeP6WIqTF1X9slwghoqzd7v+jXQDlb96vLbk6
         szipsOxQVTHfU6I9ieUlMuH1WIuyKwM26XCE98aNMHWCDD7A4wrxukBqQm0nJtL3DydJ
         RH0w==
X-Gm-Message-State: AC+VfDzi97PAoLIzL7y33Yd42oX4ek5WGVd6PpZ6dTcal6Y/pu6k1N0X
	qsN4X2ze4ZP1yZOoQD3x4PgpKQ==
X-Google-Smtp-Source: ACHHUZ6+RfewAuyborC2LIhchXAkHF6ymuqX2qX76Qc+Bj0Gznua6O2fZa1Zh1/JuvhHM0dXQ6rcYg==
X-Received: by 2002:a05:6000:509:b0:2e8:b9bb:f969 with SMTP id a9-20020a056000050900b002e8b9bbf969mr6248178wrf.0.1682771675082;
        Sat, 29 Apr 2023 05:34:35 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id f11-20020adffccb000000b002f90a75b843sm23496085wrs.117.2023.04.29.05.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 05:34:34 -0700 (PDT)
Date: Sat, 29 Apr 2023 14:34:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH 0/3] RISC-V: Export Zba, Zbb to usermode via hwprobe
Message-ID: <20230429-104e430d8f02e587aeff2652@orel>
References: <20230428190609.3239486-1-evan@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428190609.3239486-1-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_053439_099627_5B6E6ABF 
X-CRM114-Status: GOOD (  16.35  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, Andrew Bresticker <abrestic@rivosinc.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Dao Lu <daolu@rivosinc.com>, Celeste Liu <coelacanthus@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Apr 28, 2023 at 12:06:05PM -0700, Evan Green wrote:
> 
> This change detects the presence of Zba and Zbb extensions and exports
> them per-hart to userspace via the hwprobe mechanism. Glibc can then use
> these in setting up hwcaps-based library search paths.
> 
> There's a little bit of extra housekeeping here: the first change adds
> Zba to the set of extensions the kernel recognizes, and the second
> change starts tracking ISA features per-hart (in addition to the ANDed
> mask of features across all harts which the kernel uses to make
> decisions). Now that we track the ISA information per-hart, we could
> even fix up /proc/cpuinfo to accurately report extension per-hart,
> though I've left that out of this series for now.
> 
> 
> Evan Green (3):
>   RISC-V: Add Zba extension probing
>   RISC-V: Track ISA extensions per hart
>   RISC-V: hwprobe: Expose Zba and Zbb
> 
>  Documentation/riscv/hwprobe.rst       |  7 +++++
>  arch/riscv/include/asm/cpufeature.h   | 10 +++++++
>  arch/riscv/include/asm/hwcap.h        |  1 +
>  arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
>  arch/riscv/kernel/cpu.c               |  1 +
>  arch/riscv/kernel/cpufeature.c        | 19 ++++++++----
>  arch/riscv/kernel/sys_riscv.c         | 43 ++++++++++++++++++++++-----
>  7 files changed, 70 insertions(+), 13 deletions(-)
> 
> -- 
> 2.25.1
>

For the series

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
