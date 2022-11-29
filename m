Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312E0C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxIL9lauGA4lUGamzJdNkeAfMeFDgx4ROp9fhIy9juU=; b=4c3CS5LC4tgNkI
	EDdy60RmbG8AjtdR/wfmCciXp8edM7myDA2VwAlx2pmjZjwRVqlUbu1XBGtzHUccAxFKK9yFlQy/+
	ww5uEeITjSpIi9f85pZ+0LO2CkA0zNStMWVfqZQOEg7YJ9524mC5uh6u2HmrVh0mTfcyvIvK7bPQh
	Fu/2vXgXdv/ss7g+aehwYST6M/sLvLMpu7mKQupa3i0RvKo7kHjgDiTtpk3pgCXy09qLGvAPZ/rZG
	UDlJdG/lWnHYNb+jNJRxSBZjLGjfeCnz9kdgA8EquLdyxHRcr0cN4CitdPWe7TieBKdGi+rzlUAKJ
	ukDSAKa5MXG526qSPtGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03Dk-009zkj-Ls; Tue, 29 Nov 2022 16:12:32 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03Dh-009zhY-Pe
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 16:12:31 +0000
Received: by mail-ej1-x62b.google.com with SMTP id td2so20886477ejc.5
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 08:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a2BTyx6zja/aiP2vpU1kgbIcNE6NH07BMx/8T7jRK2A=;
        b=ANvZAIuNiA+jgFYRHiId7bCAXZ0st4A1Ivv1McCza4miewPJjMOnECcdKk8SgJhoEn
         xtw4y16QpvZ0E/V8080GtKCOvg2LMJMtzgqCEGoPi4rfQR2n84LHNczcRXT+8/xJ3VkU
         LGVDginlRkG/X+io9Ml3rtrtf0oPd7OaXKasWvdj3soNdyxD6fo9D5MBVVcvhF27mJ0f
         lEICX3kOVnfuG+b6ZbisSmnCk3Q30EWVlR9UDBK4wA3NuWRKENrPWb8kZ6ITfxmTD9+k
         kamM45FdTepWPGm9/Lmybfv9ZIQKSYlWOmqCqKOfGJp2a0i1Y+yf+jdYcDM8XbxkEG7j
         LivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2BTyx6zja/aiP2vpU1kgbIcNE6NH07BMx/8T7jRK2A=;
        b=torv0J4GVDUmakqhColfm+lI8zqQI8FwEIQLRKtCF1nfdx5slu4fuPuOhN7VV3a/sT
         KgfUFw9ifPzG3eAbrc/sLcdewaS+qToG05iavUi+CxOiM2FHxPeTXOe0yq3wos2VQrji
         qpQEEc15smhuX9/rGZ4yCt/tNJXZKaB2RFLCbuvy/xwBFn6da63u/liAaj7IIdLjVPjS
         1nmi0ij0K5NHBNVf/R4MOkV1y7V8GS/7ePIfvo2juJOWlSfL8jQSdnt2peX2410S/Hct
         coMbq6kto8dobjVGPAlQNSkUjyijNBY3drRTfx4zeYCDbH8h0sv394wzPLYvoVNJLPmz
         UpSQ==
X-Gm-Message-State: ANoB5pmy1AkLQK5kzmiPCXMfsytbiMrjCCbYR8i89LveyaOQifK1DIIA
	RX2MmOfcXqeZ39Xhd5ylmWt5bOuL5NEYHg==
X-Google-Smtp-Source: AA0mqf4omWTvqDfQ/sdcDi7RTXKGQ4FH+dy9PMnwghOxXXZ8/DddGvb6jwUaQVs9VfnK0zywMUMmxQ==
X-Received: by 2002:a17:906:844:b0:78c:2c03:804c with SMTP id f4-20020a170906084400b0078c2c03804cmr36090401ejd.107.1669738345813;
        Tue, 29 Nov 2022 08:12:25 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id p23-20020a17090635d700b00780b1979adesm6318224ejb.218.2022.11.29.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 08:12:25 -0800 (PST)
Date: Tue, 29 Nov 2022 17:12:23 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
	conor@kernel.org, devicetree@vger.kernel.org, guoren@kernel.org,
	heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org
Subject: Re: [RFC 1/2] RISC-V: clarify ISA string ordering rules in cpu.c
Message-ID: <20221129161223.gelsvctfnqg7pdwb@kamzik>
References: <Y4XvnHIPw8ZuBZEk@wendy>
 <20221129144742.2935581-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221129144742.2935581-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_081229_874040_CE970B3A 
X-CRM114-Status: GOOD (  27.76  )
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

On Tue, Nov 29, 2022 at 02:47:42PM +0000, Conor Dooley wrote:
> While the list of rules may have been accurate when created, it now
> lacks some clarity in the face of isa-manual updates. Specifically:
> 
> - there is no mention here of a distinction between regular 'Z'
>   extensions which are "Additional Standard Extensions" and "Zxm"
>   extensions which are "Standard Machine-Level Extensions"
> 
> - there is also no explicit mention of where either should be sorted in
>   the list
> 
> - underscores are only required between two *multi-letter* extensions but
>   the list of rules implies that this is required between a multi-letter
>   extension and any other extension. IOW "rv64imafdzicsr_zifencei" is a
>   valid string
> 
> Attempt to clean up the list of rules, by adding information on the
> above & sprinkling in some white space for readability.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/cpu.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 852ecccd8920..5e42c92a8456 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -120,20 +120,32 @@ device_initcall(riscv_cpuinfo_init);
>  		.uprop = #UPROP,				\
>  		.isa_ext_id = EXTID,				\
>  	}
> +
>  /*
>   * Here are the ordering rules of extension naming defined by RISC-V
>   * specification :
> - * 1. All extensions should be separated from other multi-letter extensions
> - *    by an underscore.
> + *
> + * 1. All multi-letter extensions should be separated from other multi-letter
> + *    extensions by an underscore.
> + *
>   * 2. The first letter following the 'Z' conventionally indicates the most
>   *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> - *    If multiple 'Z' extensions are named, they should be ordered first
> - *    by category, then alphabetically within a category.
> + *    'Z' extensions should be sorted after single-letter extensions and before
> + *    any higher-privileged extensions.
> + *    If multiple 'Z' extensions are named, they should be ordered first by
> + *    category, then alphabetically within a category.
> + *
>   * 3. Standard supervisor-level extensions (starts with 'S') should be
>   *    listed after standard unprivileged extensions.  If multiple
>   *    supervisor-level extensions are listed, they should be ordered
>   *    alphabetically.
> - * 4. Non-standard extensions (starts with 'X') must be listed after all
> + *
> + * 4  Standard machine-level extensions (starts with 'Zxm') should be
> + *    listed after any lower-privileged, standard extensions.  If multiple
> + *    machine-level extensions are listed, they should be ordered
> + *    alphabetically.
> + *
> + * 5. Non-standard extensions (starts with 'X') must be listed after all
>   *    standard extensions. They must be separated from other multi-letter
>   *    extensions by an underscore.
>   */
> -- 
> 2.38.1
>

Alternatively, we could change the comment to just point out the spec
chapter and provide an example, e.g.

/*
 * The canonical order of ISA extension names in the ISA string is defined in
 * chapter 27 of the unprivileged spec. An example string following the
 * order is
 *
 *   rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
 *
 * Notice how Z-extensions are first sorted by category using the canonical
 * order of the first letter following the Z. Extension groups are in the
 * order specified in chapter 27. Extensions within each group are sorted
 * alphabetically.
 */


Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
