Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C68FC52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 18:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hth+sykVObcSDTbMauW8/EEppk0mROSXhNaKZ1mWAZY=; b=D3uo/0gU9BQNfC
	MsJOEfRFjqb4Nl6jjmb6eiOTpOJD5J9Lumxj2e8mDkhFSLmusGkoqmpr3xKLpeAUQGiwk5m9Az4yi
	qsNoCPu+dMpH9N0gJYamY67RP2Xmc+T9Sd/QKd08ntq6r6QwtGkkQk6qGQ2eNp/BxJPC9d5Sy90pg
	9+8ZpOIxnM1tEuVzr3QPv2rKpoBgHlDY7Rioc28DjAeF5HvmaRHVl8m0fSTyW3hJbb8Evwc2WlHHO
	x9OK0E88ewvPQcHJe+EpcUBLt6V8fqC0LIUhnwPmCeBNYrOfCjXGbNMb8HtFQkK6O0YKs1TcK6bNo
	2/iQfYzSg3QeHzV5ve6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg6qx-00000002W4F-3Xg8;
	Mon, 19 Aug 2024 18:11:39 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg6qv-00000002W3W-0tGo
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 18:11:38 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-712603f7ba5so3678614b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 11:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724091096; x=1724695896; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vYDHGgJN71LoTtjJp/4v5I3zXOy8Lpidv1xHx/d3UwI=;
        b=aXQYGWl7WvslyrUyeXtIiZJphimyHBAudnBErudPLtjn1Ty4/bpBFrCZw+9AQJXOfq
         4tJ1MQ4ZLVWcFfHOUAQ/mZUis5Xg0BrayBz4EzIpD7HtYIBJTZdd057rfskUyDHyJ0Mt
         mR+wDSVgFzFeCAKDkhyEUkwyaZy4dLO30AwwhhBHZXIRoS8864Rrq+R4mjwvvCgaoLOe
         VKDhxdYJXv1CWe5mbXjSc3HF2KTd768yjYv1u1EkrTag4PqovUEnFalkYzBo+ConxKUV
         C5pzb9pU7nW9hi1eIcUA4VVL8iTgQsso+VDjLBPt1auGVrtf0jRk3GdfilNZLHfA7TVe
         wXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724091096; x=1724695896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYDHGgJN71LoTtjJp/4v5I3zXOy8Lpidv1xHx/d3UwI=;
        b=IHIdPZv9bGPVjF0QfUl8bRI9GqIu+I0lN5iEzreSLvHogNmtCjuFnN7J9GgfGwcMNn
         vIBmEpsxuFY2iDGSaMHE8wXrG1eb1aTxbmqR8ik2ZFEj4sc117ajIYqK4scg3PSQkEZ0
         ohbqiiumlPUsQSOJNbeloSorYDW+ezAV9eUsTK2Ryn4wHUEJzsRg0/zPqIBOaQZenyVD
         1d2M824M/83QVX4BusJsnWT4TPWetFFmKpTToWZU+352WQMcb3qEemYlPWPYuWM7pU0v
         edJUZNct5XlmnWhVnKVizXNC4g1xPIiuszmpuKa2Spssb68jS/Pxs3QCOmdF26z8dRnu
         lc2g==
X-Gm-Message-State: AOJu0Yz3PrW8Vo7kQqHGM9Z+wvkGI7CBqRkaC9LPHcaNa4a0KaWrfuar
	WRSPMe/fxzA38gGGNhh1ZImois94yCVp8TBjioPtL4qFX9yERZBHbX6+h3UL5qw=
X-Google-Smtp-Source: AGHT+IGsAw7s8B/onOqSBkHQHwBaC3lk/QipjP8EXDXBC7ou+6mircvQsdDdvqKmLSLgz4oe08BXDw==
X-Received: by 2002:a05:6a20:c90e:b0:1c4:ae55:2b5a with SMTP id adf61e73a8af0-1caa360c14amr9772943637.18.1724091095927;
        Mon, 19 Aug 2024 11:11:35 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add7cc8sm6847892b3a.36.2024.08.19.11.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 11:11:35 -0700 (PDT)
Date: Mon, 19 Aug 2024 11:11:33 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] RISC-V: hwprobe: Use BIT macro to avoid warnings
Message-ID: <ZsOK1bY7MrbYRKYs@ghost>
References: <20240819180443.1774641-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240819180443.1774641-1-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_111137_290836_4DDB672B 
X-CRM114-Status: GOOD (  16.20  )
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

On Mon, Aug 19, 2024 at 02:04:43PM -0400, Jesse Taube wrote:
> In uapi/asm/hwprobe.h file, (1 << N) is used to define the bit feild
"field" not "feild"
> this causes checkpatch to warn. Use BIT(N) and BIT_ULL(N) to avoid
The grammar is slightly odd here, I think replacing "this" with "which"
makes the sentence less awkward. 
> warnings.
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  arch/riscv/include/uapi/asm/hwprobe.h | 102 +++++++++++++-------------
>  1 file changed, 51 insertions(+), 51 deletions(-)
> 
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index b706c8e47b02..d0874ff2fd37 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -21,57 +21,57 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_MARCHID	1
>  #define RISCV_HWPROBE_KEY_MIMPID	2
>  #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
> -#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
> +#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	BIT_ULL(0)
>  #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
> -#define		RISCV_HWPROBE_IMA_FD		(1 << 0)
> -#define		RISCV_HWPROBE_IMA_C		(1 << 1)
> -#define		RISCV_HWPROBE_IMA_V		(1 << 2)
> -#define		RISCV_HWPROBE_EXT_ZBA		(1 << 3)
> -#define		RISCV_HWPROBE_EXT_ZBB		(1 << 4)
> -#define		RISCV_HWPROBE_EXT_ZBS		(1 << 5)
> -#define		RISCV_HWPROBE_EXT_ZICBOZ	(1 << 6)
> -#define		RISCV_HWPROBE_EXT_ZBC		(1 << 7)
> -#define		RISCV_HWPROBE_EXT_ZBKB		(1 << 8)
> -#define		RISCV_HWPROBE_EXT_ZBKC		(1 << 9)
> -#define		RISCV_HWPROBE_EXT_ZBKX		(1 << 10)
> -#define		RISCV_HWPROBE_EXT_ZKND		(1 << 11)
> -#define		RISCV_HWPROBE_EXT_ZKNE		(1 << 12)
> -#define		RISCV_HWPROBE_EXT_ZKNH		(1 << 13)
> -#define		RISCV_HWPROBE_EXT_ZKSED		(1 << 14)
> -#define		RISCV_HWPROBE_EXT_ZKSH		(1 << 15)
> -#define		RISCV_HWPROBE_EXT_ZKT		(1 << 16)
> -#define		RISCV_HWPROBE_EXT_ZVBB		(1 << 17)
> -#define		RISCV_HWPROBE_EXT_ZVBC		(1 << 18)
> -#define		RISCV_HWPROBE_EXT_ZVKB		(1 << 19)
> -#define		RISCV_HWPROBE_EXT_ZVKG		(1 << 20)
> -#define		RISCV_HWPROBE_EXT_ZVKNED	(1 << 21)
> -#define		RISCV_HWPROBE_EXT_ZVKNHA	(1 << 22)
> -#define		RISCV_HWPROBE_EXT_ZVKNHB	(1 << 23)
> -#define		RISCV_HWPROBE_EXT_ZVKSED	(1 << 24)
> -#define		RISCV_HWPROBE_EXT_ZVKSH		(1 << 25)
> -#define		RISCV_HWPROBE_EXT_ZVKT		(1 << 26)
> -#define		RISCV_HWPROBE_EXT_ZFH		(1 << 27)
> -#define		RISCV_HWPROBE_EXT_ZFHMIN	(1 << 28)
> -#define		RISCV_HWPROBE_EXT_ZIHINTNTL	(1 << 29)
> -#define		RISCV_HWPROBE_EXT_ZVFH		(1 << 30)
> -#define		RISCV_HWPROBE_EXT_ZVFHMIN	(1ULL << 31)
> -#define		RISCV_HWPROBE_EXT_ZFA		(1ULL << 32)
> -#define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
> -#define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
> -#define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
> -#define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	(1ULL << 36)
> -#define		RISCV_HWPROBE_EXT_ZVE32X	(1ULL << 37)
> -#define		RISCV_HWPROBE_EXT_ZVE32F	(1ULL << 38)
> -#define		RISCV_HWPROBE_EXT_ZVE64X	(1ULL << 39)
> -#define		RISCV_HWPROBE_EXT_ZVE64F	(1ULL << 40)
> -#define		RISCV_HWPROBE_EXT_ZVE64D	(1ULL << 41)
> -#define		RISCV_HWPROBE_EXT_ZIMOP		(1ULL << 42)
> -#define		RISCV_HWPROBE_EXT_ZCA		(1ULL << 43)
> -#define		RISCV_HWPROBE_EXT_ZCB		(1ULL << 44)
> -#define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 45)
> -#define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
> -#define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
> -#define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
> +#define		RISCV_HWPROBE_IMA_FD		BIT_ULL(0)
> +#define		RISCV_HWPROBE_IMA_C		BIT_ULL(1)
> +#define		RISCV_HWPROBE_IMA_V		BIT_ULL(2)
> +#define		RISCV_HWPROBE_EXT_ZBA		BIT_ULL(3)
> +#define		RISCV_HWPROBE_EXT_ZBB		BIT_ULL(4)
> +#define		RISCV_HWPROBE_EXT_ZBS		BIT_ULL(5)
> +#define		RISCV_HWPROBE_EXT_ZICBOZ	BIT_ULL(6)
> +#define		RISCV_HWPROBE_EXT_ZBC		BIT_ULL(7)
> +#define		RISCV_HWPROBE_EXT_ZBKB		BIT_ULL(8)
> +#define		RISCV_HWPROBE_EXT_ZBKC		BIT_ULL(9)
> +#define		RISCV_HWPROBE_EXT_ZBKX		BIT_ULL(10)
> +#define		RISCV_HWPROBE_EXT_ZKND		BIT_ULL(11)
> +#define		RISCV_HWPROBE_EXT_ZKNE		BIT_ULL(12)
> +#define		RISCV_HWPROBE_EXT_ZKNH		BIT_ULL(13)
> +#define		RISCV_HWPROBE_EXT_ZKSED		BIT_ULL(14)
> +#define		RISCV_HWPROBE_EXT_ZKSH		BIT_ULL(15)
> +#define		RISCV_HWPROBE_EXT_ZKT		BIT_ULL(16)
> +#define		RISCV_HWPROBE_EXT_ZVBB		BIT_ULL(17)
> +#define		RISCV_HWPROBE_EXT_ZVBC		BIT_ULL(18)
> +#define		RISCV_HWPROBE_EXT_ZVKB		BIT_ULL(19)
> +#define		RISCV_HWPROBE_EXT_ZVKG		BIT_ULL(20)
> +#define		RISCV_HWPROBE_EXT_ZVKNED	BIT_ULL(21)
> +#define		RISCV_HWPROBE_EXT_ZVKNHA	BIT_ULL(22)
> +#define		RISCV_HWPROBE_EXT_ZVKNHB	BIT_ULL(23)
> +#define		RISCV_HWPROBE_EXT_ZVKSED	BIT_ULL(24)
> +#define		RISCV_HWPROBE_EXT_ZVKSH		BIT_ULL(25)
> +#define		RISCV_HWPROBE_EXT_ZVKT		BIT_ULL(26)
> +#define		RISCV_HWPROBE_EXT_ZFH		BIT_ULL(27)
> +#define		RISCV_HWPROBE_EXT_ZFHMIN	BIT_ULL(28)
> +#define		RISCV_HWPROBE_EXT_ZIHINTNTL	BIT_ULL(29)
> +#define		RISCV_HWPROBE_EXT_ZVFH		BIT_ULL(30)
> +#define		RISCV_HWPROBE_EXT_ZVFHMIN	BIT_ULL(31)
> +#define		RISCV_HWPROBE_EXT_ZFA		BIT_ULL(32)
> +#define		RISCV_HWPROBE_EXT_ZTSO		BIT_ULL(33)
> +#define		RISCV_HWPROBE_EXT_ZACAS		BIT_ULL(34)
> +#define		RISCV_HWPROBE_EXT_ZICOND	BIT_ULL(35)
> +#define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	BIT_ULL(36)
> +#define		RISCV_HWPROBE_EXT_ZVE32X	BIT_ULL(37)
> +#define		RISCV_HWPROBE_EXT_ZVE32F	BIT_ULL(38)
> +#define		RISCV_HWPROBE_EXT_ZVE64X	BIT_ULL(39)
> +#define		RISCV_HWPROBE_EXT_ZVE64F	BIT_ULL(40)
> +#define		RISCV_HWPROBE_EXT_ZVE64D	BIT_ULL(41)
> +#define		RISCV_HWPROBE_EXT_ZIMOP		BIT_ULL(42)
> +#define		RISCV_HWPROBE_EXT_ZCA		BIT_ULL(43)
> +#define		RISCV_HWPROBE_EXT_ZCB		BIT_ULL(44)
> +#define		RISCV_HWPROBE_EXT_ZCD		BIT_ULL(45)
> +#define		RISCV_HWPROBE_EXT_ZCF		BIT_ULL(46)
> +#define		RISCV_HWPROBE_EXT_ZCMOP		BIT_ULL(47)
> +#define		RISCV_HWPROBE_EXT_ZAWRS		BIT_ULL(48)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> @@ -85,6 +85,6 @@ struct riscv_hwprobe {
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  
>  /* Flags */
> -#define RISCV_HWPROBE_WHICH_CPUS	(1 << 0)
> +#define RISCV_HWPROBE_WHICH_CPUS	BIT(0)
>  
>  #endif
> -- 
> 2.45.2
> 

Thanks for doing this. It will be nice to not get this checkpatch
warning anymore.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
