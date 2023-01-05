Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935A0C3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 23:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NYzTsCusG/hoYx77XmYwaVe2b/c//9WXNX6YIGYWdno=; b=z5YphUIgHCOS8ylgc/bcLTVbIL
	byJzxxgUHuPC5M48U8lqdTxiI7bU8JL1QXIAG9RZcwZEmADOuV2OPNeVMnB6baBNokYQy4kcvtqod
	IhFaNrZwBFSOZ0qR1+FMTh8EvbGYe2+l1JvkQZR9Jdkli/j62kQnaX0K+WPALlPhpvJmyOhMbLN0b
	2nZpCaZVqceIWTL5FGY68BoYb2kUc5TupGJAJQXB8hX4LsVxcn/qF0Z2UiYzo7Oy2HfEzEp2w9Guk
	w6daSpP1WUk9M0VnYW3w2ZgPA7s3TdICBxKulYsNxQV8/0AkPjWnxl7RBQhqnJc+1ydJXtj5WnQJ5
	ZPLtkcaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDZdT-00G84L-9g; Thu, 05 Jan 2023 23:26:59 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDX9S-00Ek3c-He
	for linux-riscv@lists.infradead.org; Thu, 05 Jan 2023 20:47:52 +0000
Received: by mail-pg1-x52b.google.com with SMTP id h192so20484363pgc.7
        for <linux-riscv@lists.infradead.org>; Thu, 05 Jan 2023 12:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pp1Hnj63PffvsCE7OuO3HliBEFrvENgZnWd3AiBMVY8=;
        b=MeV2HGai6tW1Yk+u8L/8udaoNI1prkAfqLG9jz3ext8c5wtf1ZQU9O8EybvFMHr6m5
         jIjSzOtyo0owGDSloRcyRxOrwP0kLBy/5CWBfyIWMTB+1H+A6TBNPby2QjqKXXgcsDwH
         f0pS9jhH7G8YlA9/LeOPcVc5NvyIU/qSzaRHwIqI4nUzgdzhoiTmdLbmVhhyM2YwQAhI
         cVgkqrnrefxeRKMvPs4G9khYaP8rTalsdWXEuDgu0ujW7KaJJ//4LZvUNpvC0dzxpMql
         elGz8tf7rDlPlWGcEAEMQvg0l70CcnVaAVufGIVtvuKlFC92Vanv52bsO605Vv55d3dw
         TPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pp1Hnj63PffvsCE7OuO3HliBEFrvENgZnWd3AiBMVY8=;
        b=gzAOHS+Nypt5e0nwSuLawayGRqhv94fj2EKwl0V8CRDNaxWEFm4lWdKUbHcGbtyMzQ
         tvyl2QYq+ur8Jg74x1dl0ysCiwtC2Vk5ezU4JaZ2Irx0n1Cs65CFzBGa8pWOpJ/soaGg
         Co+e9XhD7MTbQBPxE2PEm+glKVFQg3Z+hM8oP1xJrxKEqvGW1wPp0dvRL1TRqF4fZ0DR
         CIuUKbiOZEOwl/F62OWDgpze8gnTpPTVdllgHdzrE+5GdD8s0FTeBNIsUGmSGhRehy2o
         FjDQHGe8srCmtsvvrjzUd6Q6QMGxrek2yHY3pW/WrbVcWaerQlTzyzGf8DFf1jo+gxWE
         2cxA==
X-Gm-Message-State: AFqh2koX1Zzvttyy19BUOs/4L2OtFEc7Sv6bFLyc6Vhd4d6zjZxcHkS9
	kSWZW/ej5dLNDRSTFZo/K3Upvf1c5MrIyg1n
X-Google-Smtp-Source: AMrXdXsKiwr0Z+4Xe0dvChmkzPK7F8lp7dA38SKkvAJ73eGXHemMzVjfs1LIWioUDnE1WsXAtYUA0g==
X-Received: by 2002:a62:3847:0:b0:582:ba01:a3bd with SMTP id f68-20020a623847000000b00582ba01a3bdmr10603884pfa.10.1672951667687;
        Thu, 05 Jan 2023 12:47:47 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id e13-20020a056a0000cd00b005818643be3fsm16415111pfj.206.2023.01.05.12.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 12:47:47 -0800 (PST)
Date: Thu, 05 Jan 2023 12:47:47 -0800 (PST)
X-Google-Original-Date: Thu, 05 Jan 2023 12:47:39 PST (-0800)
Subject: Re: [PATCH v2] RISC-V: fix compile error from deduplicated __ALTERNATIVE_CFG_2
In-Reply-To: <20230105192610.1940841-1-heiko@sntech.de>
CC: linux-riscv@lists.infradead.org, christoph.muellner@vrull.eu,
  Conor Dooley <conor@kernel.org>, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, heiko@sntech.de,
  heiko.stuebner@vrull.eu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-025b9fe5-fa23-4930-997a-e4aca277fe47@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_124750_826359_C609C022 
X-CRM114-Status: GOOD (  21.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 05 Jan 2023 11:26:10 PST (-0800), heiko@sntech.de wrote:
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

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

I'm going to hold off on this one for this week, though -- at least to 
give it some time on the lists, but it appears this hasn't landed at 
lore/patchwork yet and thus might be stuck.  It is in the mailman 
archives...

http://lists.infradead.org/pipermail/linux-riscv/2023-January/024682.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
