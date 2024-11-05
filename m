Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5068D1266B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 09:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PlJ8/leLfkE7EtIuCDyPAxY+HgYaYpEA+1vA2wkciGo=; b=yeBYDmOBSwTb88
	npJYIsTfyy9mvR1juyo9yCpMzEQQDl7QuoeBOGS39qZokksiAJ8eJFljR6JodPuIWswbCC3DI0Lqs
	RRoodtoX7soC1E8SgwCt2BqoqxEdMH6gtDyba3c5VvjANTitDcoHNdWFe8gcA1TOTjcxT3fETMNs3
	Qvc+C+bUEcu099ASKJJ8OrWVhDefMTxzskTSs27hWi3BWAXpStWtERlojyjZafPrNhmtAuaK31P4s
	xntq7CEVN9CUzonfhBdDOL+kTVXL8iDN6Ovb+eF5VMqvHWnXyo2LEwJClPAONUVDnzn48oPuGw6K0
	PuFKKxxJsq87LMWkz7vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FfY-0000000GT91-1E04;
	Tue, 05 Nov 2024 09:16:12 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FeH-0000000GSjv-33qM
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 09:14:55 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso47898581fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Nov 2024 01:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1730798091; x=1731402891; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P4G0QFpDZpyh7jivQuglDMqb6yzlT1rpR4Jl1yN+DF0=;
        b=TtnGLoBQS+zgfif6HzVYa5FKsvkRXfB3oLBsfW9xSUM41aSMjmZedrCbskwfQ0nyQa
         3mKdcUWz72b/Z9dE9ZC4pxKZXnO3ggBPjt0hllh7wE37Ef7fzts25OY5ai7mvfe8jLpi
         RBKOh9jPAPAob0vlHzcpA1nN7Y4Qk+XPxveId+wtT8K85uUH/45AnjmO4lixN8WjU/a4
         O5s4HUV8R39jSFhRyExvcp70LTNNHtAwTrgPbPWcchvaCNMeNmnWFKMEwfyiBbXjPlvL
         E5beeToH+PWDCb9Jlu+s/DLxJkXaZL6FRXPoY4xWHOuqhK6jXRfX6hyY9YpTU2oo0+F4
         gWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730798091; x=1731402891;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P4G0QFpDZpyh7jivQuglDMqb6yzlT1rpR4Jl1yN+DF0=;
        b=AechZCIdM+uECL4sbkiWH8MYkt0+pseMjSjIC2oorzgdPFpt9JpK5AK6lBW5mwqcro
         4YXIQLc/KCa6WXnH8Qvw1aH4qPFEhHoJ8/kSE48nGvyuIF6f7S9DS385mApbKAtFXF5w
         ufp65QcqM9ICL2F418FjmZVggwkA4X4BXBaGLX0Tt6UwdSZhLVLojS4K6QJcZJQQSgTJ
         IablrkF+NB4/dMK2u34/D5FxTFlGloNhr1LPpPeshmhAMF+eExyjq3fWoXtu596KmBiN
         TPbF6DeRt8AHyrpvArHrvr2q6Jls+6J1ld5KWt0j3x+r5ZvsBNYsxr0Z6SFS5cx83GDj
         m0Bg==
X-Forwarded-Encrypted: i=1; AJvYcCU4bTxk2dp5n4V8qk+hroW7R2xw81btgNOMxFRijvCiIOHlQnr7oZDhfsh842BzPqJK0ilDA0NyHOwDww==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGFLYieWWVD3r9jp7JeKz0KqOlsL7TNCADuJ56BO/GrqTnloLG
	B2lkl6MDL6J36jYnzLUQz27M4ll34fnEG9wZdPJPFO5OoeCoJLKZsOBrpFsPg0w=
X-Google-Smtp-Source: AGHT+IF89JsMTBItvysTiIBkAGPevhb1tYo18xBJg4bMSuMI6an6frnp4kuVBULT6FlhF3ie/VWuRQ==
X-Received: by 2002:a2e:a543:0:b0:2fa:cc50:41b with SMTP id 38308e7fff4ca-2fcbdf5fa9amr179020771fa.5.1730798090168;
        Tue, 05 Nov 2024 01:14:50 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm209635175e9.5.2024.11.05.01.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 01:14:49 -0800 (PST)
Date: Tue, 5 Nov 2024 10:14:48 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Will Deacon <will@kernel.org>, 
	Julien Thierry <julien.thierry.kdev@gmail.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH kvmtool] riscv: Pass correct size to snprintf()
Message-ID: <20241105-546ce4236046e9742cf081e7@orel>
References: <20241104192120.75841-1-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241104192120.75841-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_011453_801665_CC844467 
X-CRM114-Status: GOOD (  21.18  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 04, 2024 at 08:21:19PM +0100, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> =

> The snprintf() function does not get the correct size argument passed,
> when the FDT ISA string is built. Instead of adjusting the size for
> each extension, the full size is passed for every iteration. Doing so
> will make __snprinf_chk() bail out on glibc.
> =

> Adjust size for each iteration.
> =

> Fixes: 8aff29e1dafe ("riscv: Append ISA extensions to the device tree")
> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> ---
>  riscv/fdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/riscv/fdt.c b/riscv/fdt.c
> index 8189601f46de..85c8f95604f6 100644
> --- a/riscv/fdt.c
> +++ b/riscv/fdt.c
> @@ -157,7 +157,7 @@ static void generate_cpu_nodes(void *fdt, struct kvm =
*kvm)
>  					   isa_info_arr[i].name);
>  				break;
>  			}
> -			pos +=3D snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN, "_%s",
> +			pos +=3D snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN - pos, "_%s",

Just above this we confirm strlen(isa_info_arr[i].name) + pos + 1 is less
than CPU_ISA_MAX_LEN, which means we should be able to use anything for
size which is greater than or equal to strlen(isa_info_arr[i].name) + 1,
as snprintf won't write more anyway. But, it's understandable that
__snprinf_chk doesn't know that.

>  					isa_info_arr[i].name);
>  		}
>  		cpu_isa[pos] =3D '\0';

Not part of this patch, but part of the context, so I'll comment on it
anyway, this '\0' assignment could be removed. It looks like it's a left
over from commit 7c9aac003925 ("riscv: Generate FDT at runtime for
Guest/VM") which could have been removed with commit 8aff29e1dafe ("riscv:
Append ISA extensions to the device tree")

Anyway,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
