Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013A6E77184
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 14:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lxC6JLFK0/dt1q1BkbQ+Vz2Uv9ciQAWN2HkdtARJk8=; b=b8FE1QGQ5FIlN6
	7XsO22KutVPbcMdzIfCKpui7uiVVBUcwWHw2VBHcnBQ10u207yyyQ64Dnr4rNLkjlAegPhdveYptD
	pbCKIQM93aVaNGgZs9zQy+h2n23kruuSBRfJxzKnWpHEZ7UWEGdbv76Mu2NH2UQXHdoQ43V5GVkvG
	mBkzeIQpveVpK3M+FKZ2GL4DjzIWWY7K/2lWQ/+1Kzzhg1nfiB+zaoUEEs1ylhW6GOyTviAIJxwRJ
	0Ymtsef7CxIl6nkNuNvCqR+9dzV85Cka15LlGqz5rFRcxxXytYYeY7DJ6Nch6QNea09xVFxTCXfQd
	Kwqw0EPRAf/NO4cX8M9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHHa-000000021u5-0oFh;
	Thu, 19 Dec 2024 14:13:42 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHGU-000000021kS-1fzX
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 14:12:35 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa543c4db92so161189266b.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Dec 2024 06:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734617552; x=1735222352; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bYZfhJN3xjhl5FzQe3FwhGZ9PYwoYEG36K8SQ6MbDoY=;
        b=o2B3ZnI+rbIIQ3jUBGu74VBpy900p7OxGInfI6fVDPFkjCGQjnl+W/xP2vg7drdnCs
         /GW3da15k6Axx5cYS6DsJ57sC/dwm1XqArvbDWv1+ZHZurVzvNwTnUte/E0RiKf37/xy
         nMy4ayxQyEMmMUOaIxE9sJ/OBKhj5H2ICrUf9qP6KllXeoCAe4Ly8SycNhknDFppy/NG
         sIfsXi7Q9XyreebbA2YNGntp8BYgAY3qgSk2/wgOejVI5LhGOVtrqKA+frNizQmGVlV7
         FKEedgVcb4VtL8gI0rb8KU3JMg7bUp6wWT45vUHZuMdS8nr0BU6v26ijI0QSOI+tgvtf
         CxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734617552; x=1735222352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYZfhJN3xjhl5FzQe3FwhGZ9PYwoYEG36K8SQ6MbDoY=;
        b=iVYKTFy9BYIah7e/iBLJ87+QLjp6fEUPTvwtVZ60R1Syx39ah5fN05rW46XBuc3lA+
         5Fwx7LrW5c9NyqoWi1Sg95ld863255vpSm/QQZPRMMT1zy2rNEXau1YzK2kc/kx4a5Pv
         iDxHJhusMtcx7LmdecNfRuQper/c9NcORfZpweWQkRk0dmFPoBtPtbni7G41MKBqmNyQ
         Me3HIfQGzFPrTyTO3Fohz4wGr4fv+XhyjGxjBLgXTmCxrt0kAtiUYcjIRdiad0C1mEna
         s/vIkTVMWB7HQml8gaf8Fnbh8K6Ih5F3yuEMTvWK1zdWrNCty7bgDyA0Q/Jw1BiGRg0+
         txcw==
X-Forwarded-Encrypted: i=1; AJvYcCVcMJzG65hRK4AhpYVyowlHoaOyaSfx+Yev3ZEtCzKQcLynbIv3DAPwq5BJgx42f+t6xKmTJ6t6Liw9qA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxnRsXrllWO62ebR8RGgtSqGgb7ZKhcc/2OMsrRfh/DKS2SxF5
	zzpXz/mFFgzD6KFjBjFNsKz0Ac2fvkKCUW6SkC6x14VVLzM4U/tLF/kDZ4UoHog=
X-Gm-Gg: ASbGncv3jCwAQDdh36pUf7nI0SglD4rEN/87ZA8t2q2mA2ET/n2mVo8+u8WvaYtXqaK
	4CJgdZpc/Wfw/fbQFXl+RwbQ7izTH6MW+K9FW8iKBN08COGvT086rRyt+f/in6EJ34nYaWerboW
	V3MlLB41DOts4ge+9PPj27OA9FdDl4SHRywpixeWJNojgwFwC1udLvjd7gygP/iw/HQ0yyKBctO
	/osLtp708Fw0gvM9ulQKTpo8VxOHI5SI+xV2GMJVHYorzX/qMmoagzomvqC62l/1SSK/8TnR8MT
	UW1uhf3gvOjXcSH+d0CcT0TeJ8NB09aXZ2ZCUtfH3Q==
X-Google-Smtp-Source: AGHT+IGavr29Utnq4WmD+wsHdu23d/58h13gqQtlqYkeXzkCJ2aSGZXwjvlkHz4V+MWGGTPzgLHUrg==
X-Received: by 2002:a17:907:849:b0:aa6:abb2:be12 with SMTP id a640c23a62f3a-aac07a51f0dmr299960966b.37.1734617551708;
        Thu, 19 Dec 2024 06:12:31 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f621sm69398766b.40.2024.12.19.06.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 06:12:31 -0800 (PST)
Date: Thu, 19 Dec 2024 15:12:30 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor@kernel.org, cleger@rivosinc.com, 
	charlie@rivosinc.com, evan@rivosinc.com, samuel.holland@sifive.com, andybnac@gmail.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: Enable Zicbom in usermode
Message-ID: <20241219-4332cfcb6bd63baf5d0328d7@orel>
References: <20241025091527.57825-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241025091527.57825-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_061234_438561_D57AA31E 
X-CRM114-Status: GOOD (  17.75  )
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

On Fri, Oct 25, 2024 at 05:15:27PM +0800, Yunhui Cui wrote:
> Like Zicboz, by enabling the corresponding bits of senvcfg,
> the instructions cbo.clean, cbo.flush, and cbo.inval can be
> executed normally in user mode.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 1992ea64786e..bc850518ab41 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -924,7 +924,7 @@ unsigned long riscv_get_elf_hwcap(void)
>  void __init riscv_user_isa_enable(void)
>  {
>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
> -		current->thread.envcfg |= ENVCFG_CBZE;
> +		current->thread.envcfg |= ENVCFG_CBIE | ENVCFG_CBCFE | ENVCFG_CBZE;
>  	else if (any_cpu_has_zicboz)
>  		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
>  }
> -- 
> 2.39.2
>

Hi Yunhui,

Do you plan to send a v2 of this?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
