Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD92C46467
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUQup6Ev4bQ/D/PepZCeHsabJwgfp6xZMN2LcIh4P0s=; b=yF2aAd00mj3HR/
	ymDbtR4vaoDo0984Kwybbo0qqtI/pft4m0qG5o4sOY2Rrv4702UIb+3l6HhfKSdtmR8PdqS4uA2GR
	lFcGUooMNUFZfNCs7u3LNnwJgM0jdhE7lIe4Si+PVhur3UoF5j+5PD5T0NDiuWyLma4wI+wmLuBOC
	9pFzz4i7e7cY2c5o00vRldlqGNk2iGHKYP+Gi0x7V1yFHiguh0w4eCQxewKpMwuCNpGUUiFqZN0nb
	52WAPdOvE91bcN+kz3mQAzj1GdHyGSy8viTAiBxLKm9V15tXpi2mZ9IKvWjS+i2FTK5jXohCNfiyB
	NKTBwW/VU+eP2TMlKl/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5W6-00A255-SI; Wed, 04 Jan 2023 15:17:23 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD0fM-008J9T-Pd
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 10:06:40 +0000
Received: by mail-ed1-x535.google.com with SMTP id u28so43054948edd.10
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 02:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rUm6uLwCTqi9e5lZl6HUVFT2moR3Qz0//HzwG8DgS9k=;
        b=i0abxbN3cRgRzLiPnmLW/6a5rdRYHgc+8UYeQr0LAvWXi1L6o5LTlqq4eUAlGzdq/T
         7Qha13AScy9A3dqzt1MGAC+7QBXim/6ts3xoYGhiCnuQMIYzd9nAXEjSFnvPFqDRdpt/
         JqvpJi49dl96NOAzr/k/QUbDjXj46N9GFkICXNwJrAssQBkNwox4FPbRUazjHJcnwsXr
         p8Asvh32hpRxbbhFgmqkZKGV2ZvXv+ZHaV1r1REfaYDwcI1pf5/C4pR/x21HtCqagIvD
         hMKB5eJxUv/7NyU6bSVQRq2aufZv3edZUvdbL4jDf3WQJ9kWXrq7pPYTJMDziNCMky3x
         l1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUm6uLwCTqi9e5lZl6HUVFT2moR3Qz0//HzwG8DgS9k=;
        b=H0ciudv6SfRtMv5w0CnjKMfRcD5BV47t3r1It+UNYBUw2qB9TkuwA+/u90lh6P004R
         NHSII+0cECfyKjQAhaokf/9NgdaWlfSLcRbevSVPKfTyTys3kJlkngx2qgJ7Q/HCUoYF
         7kkdOZtC6FLDc6ZqalPqaYxeDjosO5wKCte06or2UkKpu820IeUgeCJi/H8w901TZ/Lr
         QjhL1I/OU74a05OaGvz4yLfpQx7WHepG1IE252Zw5wPTwvrt1n8nABnPohWQBaDwdUHM
         3OsSmboOOuGi9ZEtoNeZoqkzPyB8w63Q8lyTGeqYkpBG3JdWRJgZL1U677cs8ZpY9+WP
         AHlg==
X-Gm-Message-State: AFqh2kqlb/NVW5SI9EOCGE0P38WZrmR3B0rpuMmUlaaU0CXC0qT25NU2
	miehEcWPGKCbFIk8ykJoZfgWdQ==
X-Google-Smtp-Source: AMrXdXscYOhY7yGE/TnmgmTAeLztmAjqzbJIQVjf+99K2S6ubi7iTfaF4Zv7k4+J9PZ7e9darxWKiw==
X-Received: by 2002:a05:6402:4518:b0:46c:b2a7:1e03 with SMTP id ez24-20020a056402451800b0046cb2a71e03mr36219886edb.36.1672826791072;
        Wed, 04 Jan 2023 02:06:31 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id x20-20020aa7d6d4000000b0047b252468a4sm14758224edr.78.2023.01.04.02.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 02:06:30 -0800 (PST)
Date: Wed, 4 Jan 2023 11:06:29 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH] RISC-V: fix compile error from decuplicated
 __ALTERNATIVE_CFG_2
Message-ID: <20230104100629.oyfn6ns7ezhpc6ek@orel>
References: <20230103214228.841297-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230103214228.841297-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_020636_948393_B4B432BC 
X-CRM114-Status: GOOD (  27.11  )
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

On Tue, Jan 03, 2023 at 10:42:28PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> On the non-assembler-side wrapping alternative-macros inside other macros
> to prevent duplication of code works, as the end result will just be a
> string that gets fed to the asm instruction.
> 
> In real assembler code, wrapping .macro blocks inside other .macro blocks
> brings more restrictions on usage and the optimization done by
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

Ouch. I thought I had tested that, but looking now at my test code I see I
only bothered to test ALTERNATIVE(), not ALTERNATIVE_2(). Adding the
ALTERNATIVE_2() test, I can reproduce this.

It appears the issue is that as macro arguments may be separated by commas
or spaces, the old and new instruction macro arguments, which have spaces
between their instructions and operands, get interpreted as extra macro
arguments. There's probably no way to convince the macro otherwise,
unfortunately.

> 
> Going back to the original code for the non-assembler-part makes that
> code work again. So this reverts the #ifdef ASSEMBLY part of that commit
> to the previous variant with duplicated base.
> 
> Fixes: 2ba8c7dc71c0 ("riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
> I was of two minds about either to revert the full patch, or doing just
> this partial one for the ASSEMBLY part. I did go with this variant, as I
> still like the idea of deduplicating as much as possible :-)
> 
>  arch/riscv/include/asm/alternative-macros.h | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index 7226e2462584..e7bdb2a510a4 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -44,9 +44,20 @@
>  	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
>  .endm
>  
> +/*
> + * Using ALTERNATIVE_CFG inside ALTERNATIVE_CFG_2 results in compile errors.
> + * So the common code needs to stay duplicated.
> + */
>  .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
>  				new_c_2, vendor_id_2, errata_id_2, enable_2
> -	ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1
> +886 :
> +	.option push
> +	.option norvc
> +	.option norelax
> +	\old_c
> +	.option pop
> +887 :

We could still share this by creating another macro which only takes old_c,
and then invoke that from both ALTERNATIVE_CFG and ALTERNATIVE_CFG_2, I
think.

> +	ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
>  	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
>  .endm
>  
> -- 
> 2.35.1
> 

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
