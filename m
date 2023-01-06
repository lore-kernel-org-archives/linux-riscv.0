Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B518C3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 06:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGd6VgRcC9kv01ZizH5vkBvomyEpRihyh7I0WrAGcKI=; b=KV4jKPJa3Pw93e
	/hqKZRM8Tw97H/KgYVMLoR3kRS3B9Vwa866SdotCDjiYg1L/1T3OVYnpVJMUuTcMzH7hVWWgGs1JV
	Rxr6X1CDUvwE8io9s1stQw6ncfRdd2KFz68hrA2f7N29g96GnVXV7KW1T1y22Lzh+aXbjk9bwtwuO
	YAXSQ114B53B3W9JyoXQcbQZfWO3R8PjjOl37FxklSoUoxpAm8svM4uALUNkcYBk0JdEoNNkysLWt
	Uy/bynY0wrrFvdDrIu6EEQiHTJnudmJDvqIX6iQbIcrwLT1fgLF2oOAxbD9sUCoO3rbxIVW98J9+X
	SOdSR+a9wt026uS11QXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDgcy-006GOh-FV; Fri, 06 Jan 2023 06:54:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDgcv-006GNc-Ko
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 06:54:55 +0000
Received: by mail-wm1-x32b.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso471569wmp.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Jan 2023 22:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OOrZAUbZqBJPsnlAkNr1fGVYGUWyBPvcRgzDjuJp3Ak=;
        b=WcggPTreQtOES53kddfW4cBesttHrv8d+4WPVyc8/QbE/5q8HVsru2KsEYK0PPec5X
         iWBP3TjFyIJ65kizG6vBqruIECbcAbe8wTCKIz/eRZlE/QkrF8mwtLdqhBGCpo9Ckfm4
         7oSWIIgljGcIBq5o0hs6iziBDWfldxKR78i/JYLsLXmn1hZGdoV32ZqTeMKxx5H1rIf/
         ZT/t3QjQPqZ4IsBpJkIBRnWSaZ9wuWC5hkimAInEUL6qXJwSqdutQ3oA5kx65IsSSsZI
         P34xqB79hjqy15IuMoKXO5LUJIl+7BXnJh2zNRB/vms5NYkOQ7FHwWF+WsQ4/I25yGPA
         1IIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOrZAUbZqBJPsnlAkNr1fGVYGUWyBPvcRgzDjuJp3Ak=;
        b=bmkvbT6piHLXz4dlQoLQ1jQ0KtwOoENNjrZnrA3vn+aNeqZ2gGP3NhB8mCa7SxNEGi
         V6Zf2KY6aZWDD4c10uXgemeOOQixM16bACTsJ/Lmxk11xlyyoQ4eOmNfhjMKxXZNcwPT
         97f3y5Z1SVDLLaL38cvTUPcWYttodvTdOO3ELOr6DIfCjKfr7wdzhW8iN5QPTLn56hWO
         it173cnrZhkMtNM1Ho7pLSsxojK4xPESxG80ZOLiKrF7WMcgWD7RCcAH0rLWgFCbC5Aa
         t1wE36pLuUbRn2PsdBA8uoNHpvHmgjcb1JNraLPfD/fbwxiYV5nDccjl7Eag3bw3X1Mn
         FuUw==
X-Gm-Message-State: AFqh2kpJ7DnWjcP9IxlH01pa7TPmmUSk1D702wQ8lt2fOQslOngL+sK6
	dF2kUVQmxwAAD8VMg2rmOQYFt3HhlVIjLrLH
X-Google-Smtp-Source: AMrXdXsFXyJ4oHDhKq8O/vCeRK1M472vtFoWUP+wpUBT5dejjRhiXudPhl5I1DcP33/0iqGxZmMKUA==
X-Received: by 2002:a05:600c:4148:b0:3d3:52bb:3985 with SMTP id h8-20020a05600c414800b003d352bb3985mr38607663wmm.31.1672988091307;
        Thu, 05 Jan 2023 22:54:51 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id q20-20020a7bce94000000b003c6c3fb3cf6sm570783wmj.18.2023.01.05.22.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 22:54:50 -0800 (PST)
Date: Fri, 6 Jan 2023 07:54:49 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2] RISC-V: fix compile error from deduplicated
 __ALTERNATIVE_CFG_2
Message-ID: <20230106065449.nycjn6mlkmrwqfo7@orel>
References: <20230105192610.1940841-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230105192610.1940841-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_225453_713580_1667F9B6 
X-CRM114-Status: GOOD (  21.55  )
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

On Thu, Jan 05, 2023 at 08:26:10PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> On the non-assembler-side wrapping alternative-macros inside other macros
> to prevent duplication of code works, as the end result will just be a
> string that gets fed to the asm instruction.
> 
> In real assembler code, wrapping .macro blocks inside other .macro blocks
> brings more restrictions on usage it seems and the optimization done by
> commit 2ba8c7dc71c0 ("riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2")
> results in a compile error like:
> 
> ../arch/riscv/lib/strcmp.S: Assembler messages:
> ../arch/riscv/lib/strcmp.S:15: Error: too many positional arguments
> ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "886:"
> ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "887:"
> ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "886:"
> ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "887:"
> ../arch/riscv/lib/strcmp.S:15: Error: backward ref to unknown label "886:"
> ../arch/riscv/lib/strcmp.S:15: Error: attempt to move .org backwards
> 
> Wrapping the variables containing assembler code in quotes solves this issue,
> compilation and the code in question still works and objdump also shows sane
> decompiled results of the affected code.
> 
> Fixes: 2ba8c7dc71c0 ("riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
> changes in v2:
> - don't revert the affected cleanup but use quotes around the parts
> 
> Tested on qemu + Allwinner D1 + specially created test-cases using
> ALTERNATIVE_2 in full assembler .S files
> 
>  arch/riscv/include/asm/alternative-macros.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index 7226e2462584..2c0f4c887289 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -46,7 +46,7 @@
>  
>  .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
>  				new_c_2, vendor_id_2, errata_id_2, enable_2
> -	ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1
> +	ALTERNATIVE_CFG "\old_c", "\new_c_1", \vendor_id_1, \errata_id_1, \enable_1
>  	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
>  .endm
>  
> -- 
> 2.35.1
>

I was sort of hoping we'd change the vararg "hack" at the same time, with
a separate patch, but I guess we can focus on getting this breakage fixed
first and worry about the vararg later.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
