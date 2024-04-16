Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B88CC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 18:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=elx84NoZSeb8zqkQ85SOXr0bDmxhxF84pBAjDnLja+Q=; b=ULTlNYNWr4ZKFv
	mXaiKB5oiP7J/dL9LbZG69NIeSTBOvohAi0C2ISpRdANEwrBIH9OpGrIqA5dbuBpp7byj+KNUAPcG
	6G5nETCulYNp5UI+2B1EiXXWFlICYVbmIrZOOAanR6zXaGvhe2v+lz/6jspesUwnC50BLMmuzfsmB
	HWA+I7YsOKBFqWm7RjRWeecrgab0IiORb8FMLzSBg3P81QwLQ14t9ZchuxrOsOBKbyhN3pC/n2mh8
	kOJc3x352Mv3+w2UKz46WzHLOZuKirmLCfK1MykLEFpp8CQR3YiwPzcQO1xZLElOXnV9tK9Dwtlvf
	2yOdGCTyDDrPPO3iFTZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnCQ-0000000DG21-0vFc;
	Tue, 16 Apr 2024 18:06:30 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnCN-0000000DG12-2iqi
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:06:29 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ed691fb83eso3870847b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713290785; x=1713895585; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SmNr0h+4BuFUgpk/HTyKfOa7gEFZOVHeubFTNh0tBVI=;
        b=CAI8OTIdSsmO0UVyFeFdwmiPtn7tEHonJJxQJgFb2+aqzbE7oBtMgPK+qiQQG1JAYe
         uxxa/k2LC9LMRNYwDm+W0FuquZr8EelZwDb63wFYUtwTgVuDDmvhoAGnKiYZRrnhy9sN
         WRUFLrXgRZjUzURQKlZF7tBzOh24/gDlO8Ig5EkbtY/suN4KTWh0YTAadeoJt75n//e1
         24FLWhf8JW+mjCYEJVSDexosPQuWV/h7aGXiX/2uSOXih3Bar155w22kv8r48ko5bZ4r
         xq4T7/vQ4Sn4tF4g4fslVX7FwlbZ2LiL6cPbM5Opfy/L9xFunnqwimoMCp+pfPfG7ubJ
         3abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713290785; x=1713895585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmNr0h+4BuFUgpk/HTyKfOa7gEFZOVHeubFTNh0tBVI=;
        b=KwVfZWFrkmww+opz9ugXw2AoYl49+6Eg1ki2KupFsp/xTYXsMw/z2Fg8oeyAhSGabp
         gjSckxNO0zwYyi5OvKyusW0aMIp73a3pa3mtN9ZGUIOos4LtqiTk+IKCPgFu9D9/ZupW
         VrrDhwjfpcoFWzUvqePnsTVJE7HVrv4TX7Pmg6ZyVlcY9hSPqWQiVIN+fW7xWBUEvqaT
         9Qe7OxQcoqEBVL6WsLHmNcl9XSzwWsOKGxb2DQTcuJe05Kg6AuJOmqqiDw0oWc7DVMPL
         NtGf5N+HSBaoMRztZeb+OOFfLdUI2Yy0GA51sBRhbFHn3p9PAPAnHFsIZhdEcTHAiUxo
         19xA==
X-Forwarded-Encrypted: i=1; AJvYcCV+1buYe+/oWcyZl08QQH1zGBzIgFmRRRAlxLK1ZN52nRWxuseJnZ+M6yrz9XpR1cm8dmk4HCcIW78YsQE5Et4oDdHqJbSjRYWOq8qlYEer
X-Gm-Message-State: AOJu0YzpY6Ko4th70TJVr/cKhf+aoN1Q3VuEVMulMypKvSdWWpa/U0l+
	pXHsMRZIT/MMpUjKUDbZHhZleqTLqbcKz3SmY3LzI8uKF4tcOXXoXiceGAwe2Oo=
X-Google-Smtp-Source: AGHT+IHrpAn2SwOIF/uXmMPZ5Ood25h2i+Ow5WsbzJxkS/YGJA0jpJQwONosrjVsQ+4tatk4S4Af+Q==
X-Received: by 2002:a05:6a20:d49b:b0:1a9:a3ed:1786 with SMTP id im27-20020a056a20d49b00b001a9a3ed1786mr13368970pzb.38.1713290785329;
        Tue, 16 Apr 2024 11:06:25 -0700 (PDT)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id bg8-20020a1709028e8800b001e4344a7601sm9969996plb.42.2024.04.16.11.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:06:24 -0700 (PDT)
Date: Tue, 16 Apr 2024 11:06:21 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Zhao Ke <ke.zhao@shingroup.cn>
Cc: paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	dawei.li@shingroup.cn, shenghui.qu@shingroup.cn
Subject: Re: [PATCH] Use bool value in set_cpu_online()
Message-ID: <Zh6+HZnsgh9ncvPj@ghost>
References: <20240318065404.123668-1-ke.zhao@shingroup.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240318065404.123668-1-ke.zhao@shingroup.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_110627_875846_6521ACD6 
X-CRM114-Status: GOOD (  16.22  )
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

On Mon, Mar 18, 2024 at 02:54:04PM +0800, Zhao Ke wrote:
> The declaration of set_cpu_online() takes a bool value. So replace
> int here to make it consistent with the declaration.
> 
> Signed-off-by: Zhao Ke <ke.zhao@shingroup.cn>
> ---
>  arch/riscv/kernel/smpboot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 519b6bd946e5..3f7c274653ab 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -229,7 +229,7 @@ asmlinkage __visible void smp_callin(void)
>  	riscv_ipi_enable();
>  
>  	numa_add_cpu(curr_cpuid);
> -	set_cpu_online(curr_cpuid, 1);
> +	set_cpu_online(curr_cpuid, true);
>  
>  	if (has_vector()) {
>  		if (riscv_v_setup_vsize())
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Thank you!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
