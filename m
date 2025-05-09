Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0AFC3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 22:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31yZ9WjT4Z56gaC8V0Ciik4cAVJSe902xJM2y6STuqQ=; b=HDcbTXdfumZjs+
	+UpBKftlRCyejy1FE/ej2ETgNqkHp8JSDxg39XNtEM/DUIIOJD3/MS/IACZ5X0DqNPDeCU7e9NDCv
	iTyWBeishQ2qKIJncbtLkimCD4yytu2Wj0/Hyp+5Hwh+bzYea5JuxyRjsB+XflKIWpqpVhmaqH9S8
	z1EhZ93L8ZG6gxT9s4r06TbfFcJwqJ38geO39TU6EKhMZ8p+wbXjxEfkSDcerNR0eNwwe0F3v9vS6
	DL5/V6Na/GVqYDmismZxcsxQJ3S9SYeFU33PAyo9nriFN9DPmwCsd0QQB7yumPmQ9JHRyR9stggIR
	9UQyvZh46woUFgiwXtQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWQL-000000055Zc-3sP4;
	Fri, 09 May 2025 22:42:33 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWQJ-000000055Z1-0aLM
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 22:42:32 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7c54a9d3fcaso294317885a.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 15:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746830550; x=1747435350; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=msHOztbjyq9yqEIUeoH3IVEEQXo53ZrXdjUyNVKV2Yg=;
        b=XKx0GoPJLSF9hVnzoHJ+JiJi7bOhe2+syJziaCwf5tV01sKHrNSPxT2IQhY1bW+dHr
         CMWtIq+kcAv98jzBiaS6Pm5taHOYGJyv8xOUnkVLi6xATvsyjE0i+ct+hB9mUlQfvAUW
         YLEUiyVrIbGvYeBmmpgof8gzHoK5h8Uqz601G4/VOJIpjtiKcwpgm/TVhKnERg0C91ZZ
         vgXnpL1zHnapgv8k+J1/XSKDyGQEooVnfYtXn2bkRvphsfot4LcbDdk5lGHvjssjzm6h
         ibiwUsAc5pziBWRgxbXK2ldHbvNKuvrZzTd+0EXFGC04ambLAZwSY0+5WRY3X2E89nuX
         VsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746830550; x=1747435350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msHOztbjyq9yqEIUeoH3IVEEQXo53ZrXdjUyNVKV2Yg=;
        b=Db/aywEgutclK6EIPIKGXDm9Q6LRw2cUfBcHBdlI05krAASvm8yK+DTnpY7p7Uo681
         t+Gnlm8SjaqAEKrO0DqAe5wpt8dSSDILBESb3T6QNPdVEQN21Gy4t3x0+RUgqCON3tgU
         VnW5pBaa85VPwEtNQc/MvblbuO58IoBy+2/6HOB+cLIgTbQ0w9fZ9skCakGwDGQ9KPtY
         8w8TzsPlPfL4jENSLPTvrYrrhejFJUez9NP0FGBtZg58AQjFX74noWNI7g+7j8Pr2LqK
         ISmvf5YRLU/TByfgSyeV5hAZzW9fvUzMXbuaijScWaYYeiyTVjRJi034dBk76EbgHCQZ
         nQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGAShL6XZ/VJQP7yekpSfD4qnbCRDoMKeTFr/AHoce542V4zobaaIcmN0m7fLBtDcsVIwHjQethInopw==@lists.infradead.org
X-Gm-Message-State: AOJu0YywNupY0UTMtM4x1o/v+Ta1KKoCqZbMWQrnFd+JTu9rVAOR7khQ
	jybyXsJQwU7ec4usi0rOQIbjoz/qG40cLBcTYjrEN5ZDhw7HuFUI
X-Gm-Gg: ASbGncv2VWG4abgxm1OqtbDf6uwXQuGmQvzEqksEsHmAeGwlT8Id8laWgnyXXFTqI8O
	C2igl6HEwpGjHsmPJaxy8ebpqDAVYkkb/wKXsVVqdNUHSq11jV3amNSxSeq25/QCNaKuJdEDszO
	769u04AWmLhYFJydXPxrfmvo/m6L4vbHODhKaOLhmstle7woTbBivAfv85Y4y/Vl4rrMwzf0TRy
	CDFqtTLC4YYHXXRU2g2r7RkCYbNZ/KDRRZy8FoiC+gzRUS5SrhLHVyOK1fl6qxqMwc+ht4AH/VM
	C4O9Nf2GKMXVUUp220JeQUXckvI=
X-Google-Smtp-Source: AGHT+IF2nmpQrGYnNJ3kGt9vg2TNZfXedBd1efP8m/k0Dzwcc27Blqyf+tRDQHXu1l4xl93RzqHNeA==
X-Received: by 2002:a05:620a:4549:b0:7ca:d9e8:d722 with SMTP id af79cd13be357-7cd010f7058mr657732585a.17.1746830549496;
        Fri, 09 May 2025 15:42:29 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00f98a89sm196704185a.53.2025.05.09.15.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:42:29 -0700 (PDT)
Date: Sat, 10 May 2025 06:42:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: add ziccrse for sg2042
Message-ID: <yan76lhmlemqxw4ytpinvwuiucgqgmqxrekiepsygjqcmpw3i3@k67zshipj273>
References: <cover.1746828006.git.rabenda.cn@gmail.com>
 <13d3da8f0979f50e561888164f1fbeba8cd11a3b.1746828006.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13d3da8f0979f50e561888164f1fbeba8cd11a3b.1746828006.git.rabenda.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_154231_189961_FCBCA9CC 
X-CRM114-Status: GOOD (  11.78  )
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

On Sat, May 10, 2025 at 06:11:23AM +0800, Han Gao wrote:
> sg2042 support Ziccrse ISA extension [1].
> 
> Link: https://lore.kernel.org/all/20241103145153.105097-12-alexghiti@rivosinc.com/ [1]
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 128 ++++++++++----------
>  1 file changed, 64 insertions(+), 64 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> index 927e0260acbd..04a6875574bb 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> @@ -259,7 +259,7 @@ cpu0: cpu@0 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <0>;

I prefer to keep the maximum 74 chars per line. I suggest wrapping
the string. This apply to all the change of this file.

Regards,
Inochi

> @@ -285,7 +285,7 @@ cpu1: cpu@1 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <1>;
> @@ -311,7 +311,7 @@ cpu2: cpu@2 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <2>;
> @@ -337,7 +337,7 @@ cpu3: cpu@3 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <3>;
> @@ -363,7 +363,7 @@ cpu4: cpu@4 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <4>;
> @@ -389,7 +389,7 @@ cpu5: cpu@5 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <5>;
> @@ -415,7 +415,7 @@ cpu6: cpu@6 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <6>;
> @@ -441,7 +441,7 @@ cpu7: cpu@7 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <7>;
> @@ -467,7 +467,7 @@ cpu8: cpu@8 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <8>;
> @@ -493,7 +493,7 @@ cpu9: cpu@9 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <9>;
> @@ -519,7 +519,7 @@ cpu10: cpu@10 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <10>;
> @@ -545,7 +545,7 @@ cpu11: cpu@11 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <11>;
> @@ -571,7 +571,7 @@ cpu12: cpu@12 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <12>;
> @@ -597,7 +597,7 @@ cpu13: cpu@13 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <13>;
> @@ -623,7 +623,7 @@ cpu14: cpu@14 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <14>;
> @@ -649,7 +649,7 @@ cpu15: cpu@15 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <15>;
> @@ -675,7 +675,7 @@ cpu16: cpu@16 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <16>;
> @@ -701,7 +701,7 @@ cpu17: cpu@17 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <17>;
> @@ -727,7 +727,7 @@ cpu18: cpu@18 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <18>;
> @@ -753,7 +753,7 @@ cpu19: cpu@19 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <19>;
> @@ -779,7 +779,7 @@ cpu20: cpu@20 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <20>;
> @@ -805,7 +805,7 @@ cpu21: cpu@21 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <21>;
> @@ -831,7 +831,7 @@ cpu22: cpu@22 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <22>;
> @@ -857,7 +857,7 @@ cpu23: cpu@23 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <23>;
> @@ -883,7 +883,7 @@ cpu24: cpu@24 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <24>;
> @@ -909,7 +909,7 @@ cpu25: cpu@25 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <25>;
> @@ -935,7 +935,7 @@ cpu26: cpu@26 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <26>;
> @@ -961,7 +961,7 @@ cpu27: cpu@27 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <27>;
> @@ -987,7 +987,7 @@ cpu28: cpu@28 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <28>;
> @@ -1013,7 +1013,7 @@ cpu29: cpu@29 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <29>;
> @@ -1039,7 +1039,7 @@ cpu30: cpu@30 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <30>;
> @@ -1065,7 +1065,7 @@ cpu31: cpu@31 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <31>;
> @@ -1091,7 +1091,7 @@ cpu32: cpu@32 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <32>;
> @@ -1117,7 +1117,7 @@ cpu33: cpu@33 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <33>;
> @@ -1143,7 +1143,7 @@ cpu34: cpu@34 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <34>;
> @@ -1169,7 +1169,7 @@ cpu35: cpu@35 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <35>;
> @@ -1195,7 +1195,7 @@ cpu36: cpu@36 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <36>;
> @@ -1221,7 +1221,7 @@ cpu37: cpu@37 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <37>;
> @@ -1247,7 +1247,7 @@ cpu38: cpu@38 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <38>;
> @@ -1273,7 +1273,7 @@ cpu39: cpu@39 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <39>;
> @@ -1299,7 +1299,7 @@ cpu40: cpu@40 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <40>;
> @@ -1325,7 +1325,7 @@ cpu41: cpu@41 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <41>;
> @@ -1351,7 +1351,7 @@ cpu42: cpu@42 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <42>;
> @@ -1377,7 +1377,7 @@ cpu43: cpu@43 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <43>;
> @@ -1403,7 +1403,7 @@ cpu44: cpu@44 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <44>;
> @@ -1429,7 +1429,7 @@ cpu45: cpu@45 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <45>;
> @@ -1455,7 +1455,7 @@ cpu46: cpu@46 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <46>;
> @@ -1481,7 +1481,7 @@ cpu47: cpu@47 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <47>;
> @@ -1507,7 +1507,7 @@ cpu48: cpu@48 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <48>;
> @@ -1533,7 +1533,7 @@ cpu49: cpu@49 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <49>;
> @@ -1559,7 +1559,7 @@ cpu50: cpu@50 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <50>;
> @@ -1585,7 +1585,7 @@ cpu51: cpu@51 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <51>;
> @@ -1611,7 +1611,7 @@ cpu52: cpu@52 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <52>;
> @@ -1637,7 +1637,7 @@ cpu53: cpu@53 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <53>;
> @@ -1663,7 +1663,7 @@ cpu54: cpu@54 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <54>;
> @@ -1689,7 +1689,7 @@ cpu55: cpu@55 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <55>;
> @@ -1715,7 +1715,7 @@ cpu56: cpu@56 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <56>;
> @@ -1741,7 +1741,7 @@ cpu57: cpu@57 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <57>;
> @@ -1767,7 +1767,7 @@ cpu58: cpu@58 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <58>;
> @@ -1793,7 +1793,7 @@ cpu59: cpu@59 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <59>;
> @@ -1819,7 +1819,7 @@ cpu60: cpu@60 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <60>;
> @@ -1845,7 +1845,7 @@ cpu61: cpu@61 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <61>;
> @@ -1871,7 +1871,7 @@ cpu62: cpu@62 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <62>;
> @@ -1897,7 +1897,7 @@ cpu63: cpu@63 {
>  			riscv,isa = "rv64imafdc";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> -					       "zicntr", "zicsr", "zifencei",
> +					       "ziccrse", "zicntr", "zicsr", "zifencei",
>  					       "zihpm", "xtheadvector";
>  			thead,vlenb = <128>;
>  			reg = <63>;
> -- 
> 2.47.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
