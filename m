Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39BAC352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 12:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ns+29SnUPEpu3ENsQuvPsgEBrC8+NTDRBaPKflp3HJ0=; b=HT5f55E9+SC1bw
	OVddI6qq3ogrjoo4nkDOxHFPQ9zcbSJmJvJVppz+zz5YuUC8gFDgt3kgCn+/ZjtqlrOICUCUqYO3H
	/KiJNlQf+EseChRvJfX3QJk5+Te8BnExXzDmclazClDftfZIRvmJ2wrX5riqydWfVSeh4bVOjXYLY
	9/nts3EjAYgl3RM7omcJDs9hleFlbgNSjBok3kXabL0dq5kzjVMHEN/PPPiHv8TEGKto5JY20jhPu
	dvuNlKTgGVZAqDPalGZbQveOBL0a8jymie9b1lFNBXKmXnJ0CPIFZwLhxDY+OECKlFzNjBVaoZuji
	5IBMfwMCz8I7qzIndwlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Lrk-00G1nt-IR; Wed, 30 Nov 2022 12:07:04 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Lrh-00G1nU-OQ
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 12:07:03 +0000
Received: by mail-ej1-x631.google.com with SMTP id n21so40774697ejb.9
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 04:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fAUYXFcQCWECGIvR80iltwIsRuZsIO+9gDbH7BuSrow=;
        b=JsevCz1XBR3Fk1uAWje+wX+4QeO/JOnbiMVHnSttZv/Z2B+6pZGICXQKGc3AnxF+l7
         JGBebbmVWczCqNLM3xCPZFen7ShebUp/a9N0eMr1YWegsDRFO5dezFg0c3S4KLxn/q8V
         8xgP9a5hoMeWW4HIuZF0Q/I4Hijnq6/V2plry895LIejYEElZDptrE9w7a1BOb6IEQVh
         500GUKroBjBPeo3TULvtU35us4rfn/sNBl3x39+GlQo/uaUnZn6b3TVHn23arNmExe0f
         AFMHcGa9uLCF5OrFYijSfBzI7T9aHqBjKM/+lVAEUS+LLAsKhZouU/t+tHIMBZ/7UaOJ
         4XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fAUYXFcQCWECGIvR80iltwIsRuZsIO+9gDbH7BuSrow=;
        b=XXMrv0Nb9BnyGtqUcYtNObJx0XiKNLn2846lPAizh93pbcgHCg0s0z5S0fZNDOx8LP
         2RCtxMkz0MPs3Msgnahi3Lf3QaWM50XhZttob3oCjoP0+NB9VYrqadsRata7omI7WKbC
         W1jk6tTWvc1GqQ/YfmxdZvb1U0HsknDdOfgVdoibj6mOGVmDEfT35W0CsH8KsxDpvj8W
         nX1JmOgKpfaDpy1Us2K02pLiGyhku0f5JDQgy8DFpeHWyvGr7/UQLzV7lmtRx7dV0eIE
         aQV7NLvcwtyt3FzgJ7ez7VXtnqicVfY0dBB/DK3Z21MqLtkO30y8eEouchcjfVc2SeYm
         hYTg==
X-Gm-Message-State: ANoB5pmTgyE59fFba2CCIvl3DW+sx9BGVsk0EKmFVj3hRx7Kh+R6Z6Jw
	PEPkKd5WvYlaF0NhNNubVmrsMUeIwghxut4419E=
X-Google-Smtp-Source: AA0mqf5T7aS255cEKon3GJ5pOlhlB8/pVi7KjgL4uQ1sLPsHbkH+vfQ/8PF/I4Lx3HuDwpeVBfmNsnCjpg07AOhQXX8=
X-Received: by 2002:a17:906:79c4:b0:778:e3e2:8311 with SMTP id
 m4-20020a17090679c400b00778e3e28311mr37993287ejo.342.1669810018988; Wed, 30
 Nov 2022 04:06:58 -0800 (PST)
MIME-Version: 1.0
References: <20221129150053.50464-1-ajones@ventanamicro.com>
In-Reply-To: <20221129150053.50464-1-ajones@ventanamicro.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Nov 2022 12:06:31 +0000
Message-ID: <CA+V-a8vUUyZ_ZA631xj+VbXXB3kW6LoXvkEr+KxbK0R9if8XLQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: alternative-macros.h cleanups
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_040701_812292_03CA5265 
X-CRM114-Status: GOOD (  16.90  )
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

Hi Andrew,

On Tue, Nov 29, 2022 at 3:00 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> This series is a collection of cleanups for alternative-macros.h with
> the main motivation being that adding new ALTERNATIVE_3, ALTERNATIVE_4,
> ... will be possible without lots of bloat. For example, adding
> ALTERNATIVE_3 should look something like the diff below and
> ALTERNATIVE_4 the same. This has really only been compile tested, as
> not all alternatives are used when quickly booting over QEMU, which
> I also did.
>
> Thanks,
> drew
>
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index 7226e2462584..be9a09313499 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -50,8 +50,17 @@
>         ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
>  .endm
>
> +.macro ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,           \
> +                               new_c_2, vendor_id_2, errata_id_2, enable_2,            \
> +                               new_c_3, vendor_id_3, errata_id_3, enable_3
> +       ALTERNATIVE_CFG_2 \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1,      \
> +                                 \new_c_2, \vendor_id_2, \errata_id_2, \enable_2
> +       ALT_NEW_CONTENT \vendor_id_3, \errata_id_3, \enable_3, \new_c_3
> +.endm
> +
>  #define __ALTERNATIVE_CFG(...)         ALTERNATIVE_CFG __VA_ARGS__
>  #define __ALTERNATIVE_CFG_2(...)       ALTERNATIVE_CFG_2 __VA_ARGS__
> +#define __ALTERNATIVE_CFG_3(...)       ALTERNATIVE_CFG_3 __VA_ARGS__
>
>  #else /* !__ASSEMBLY__ */
>
> @@ -98,6 +107,13 @@
>         __ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)   \
>         ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
>
> +#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,        \
> +                                  new_c_2, vendor_id_2, errata_id_2, enable_2, \
> +                                  new_c_3, vendor_id_3, errata_id_3, enable_3) \
> +       __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
> +                                  new_c_2, vendor_id_2, errata_id_2, enable_2) \
> +       ALT_NEW_CONTENT(vendor_id_3, errata_id_3, enable_3, new_c_3)
> +
>  #endif /* __ASSEMBLY__ */
>
>  #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
> @@ -108,6 +124,13 @@
>         __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),   \
>                                    new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2))
>
> +#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1,        errata_id_1, CONFIG_k_1,                \
> +                                 new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2,                \
> +                                 new_c_3, vendor_id_3, errata_id_3, CONFIG_k_3)                \
> +       __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),   \
> +                                  new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2),   \
> +                                  new_c_3, vendor_id_3, errata_id_3, IS_ENABLED(CONFIG_k_3))
> +
>  #else /* CONFIG_RISCV_ALTERNATIVE */
>  #ifdef __ASSEMBLY__
>
> @@ -121,6 +144,9 @@
>  #define _ALTERNATIVE_CFG_2(old_c, ...) \
>         ALTERNATIVE_CFG old_c
>
> +#define _ALTERNATIVE_CFG_3(old_c, ...) \
> +       ALTERNATIVE_CFG old_c
> +
>  #else /* !__ASSEMBLY__ */
>
>  #define __ALTERNATIVE_CFG(old_c)       \
> @@ -132,6 +158,9 @@
>  #define _ALTERNATIVE_CFG_2(old_c, ...) \
>         __ALTERNATIVE_CFG(old_c)
>
> +#define _ALTERNATIVE_CFG_3(old_c, ...) \
> +       __ALTERNATIVE_CFG(old_c)
> +
>  #endif /* __ASSEMBLY__ */
>  #endif /* CONFIG_RISCV_ALTERNATIVE */
>
> @@ -163,4 +192,11 @@
>         _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,    \
>                                         new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
>
> +#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,                \
> +                                  new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,         \
> +                                  new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)         \
> +       _ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,    \
> +                                       new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,    \
> +                                       new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)
> +
>  #endif
>
> Andrew Jones (4):
>   riscv: Don't duplicate __ALTERNATIVE_CFG in __ALTERNATIVE_CFG_2
>   riscv: alternatives: Don't name unused macro parameters
>   riscv: alternatives: Drop the underscores from the assembly macro
>     names
>   riscv: Don't duplicate _ALTERNATIVE_CFG* macros
>
For the whole series:

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
