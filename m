Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CABFC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 08:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2QPELaliXn6EgcleeKlS2Eoo43oCsf14U8LQa28LKQ=; b=zw6N+KkgBDnvv1
	EPja56N2/3SRCrbtZ6bpqBv3vOvkCvx7oOcTwS4Egb3/iPiKE2YwhNOILuqrOC2PwLAlQiUSEalgg
	TuaOXDgIOldGKXSPTLTHnR/+uB2J+1gRQCjrqP5fM0sAE4hOyWuVWh/dYeFcnq5Pf9AAXrJPcIrZU
	Aw8IBmTJttUzosX1Q4McSNbp1+jwFyLHIKsV9jV/gW5k8/Zk3XvFFToucDOzIolBRbs6Rw+LBWluP
	F455frP+QCXU5YUllyL7e4QTtR7uFxCvGfBUTFiG1KoLsfw6A6tIefTrs2N/SCilWBIg5znZWymYB
	I3QD+a5dAoV5o5GkkilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0evA-005qWX-1e; Thu, 01 Dec 2022 08:27:52 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ev6-005qSc-Aq
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 08:27:50 +0000
Received: by mail-ed1-x530.google.com with SMTP id v8so1393015edi.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 00:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+I7iCy6KN9SjmrWdCmm3vCgXjOfriD/ytuDhEGftsH0=;
        b=ccRUEe70S6aLdP/NOuPonIQioXmU4XdSdX10BPrNCR6McvBXW1v2QPnhbtaYAMA64w
         7cze4x1pY4Rki+B4ZfY1T+OsJXs8PHqhztAFRLVATuD1xJxSkHGIAlPoY7TprqioL8AV
         JJ6E06Y8l4/XLKJA9o8gTq8JI/TzNsm8NwtmAIoO3fdGS8XocKj/Ay1Lfk/5UlXQwSgF
         0bn9bIJz/mPzL8SjDC9xfHe/fSycMYN5KFhOP04eijttMG52ADHHpOU60gn6sJenmr8u
         jgdFwOoC/kaVURmCFNZ0AXyeVDn/h7b0nH71sF18iXxHjqgvPYsaofdawrvuyJt2DfXy
         57Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+I7iCy6KN9SjmrWdCmm3vCgXjOfriD/ytuDhEGftsH0=;
        b=XpenJcS5PTWgbmqr4eYQ3TkOzIDimIhNNGj+bxN1Koa+P5pPAvZH0XI+g1RCBagaHZ
         OPD2de5xGG8tslVlHQMSHAaLPMQtVfLXOz61a7ww+INKvlKVpgZSNq9Ce/Pjiczs1vgc
         GhX3k37DG9aRsDYWfui39RUJBa3iMRK4xB9pgVBMSD4o4ML8w1R0/YYmIJzSmlCeOblB
         TKUeFCZmph2jvkGqyJgdsDMgSQc8MbUMW4rxKbhH83PMoi8yE4ELkGz2+DtMxJIRQeaD
         14wb9onvGko5toIu14FvRpi5L7LKzZXkXfI2w9bkHgbL4tmefgEr/Ooc/RabdxSNxA36
         rO4Q==
X-Gm-Message-State: ANoB5pmTiNZG+tdb1Z5YkzQW43eKBcx1yOt86egqNdxGirDFTcMxA8La
	cXDLTbX3SLK5QWGWWPFl/X8h7Q==
X-Google-Smtp-Source: AA0mqf5yjnJVb1/yYiKxeZcGrg+oNQaA6VJ4pfW5oYMIplJzuj6fTM4R1fYk5p4Jdx1EdSgqfBfVdg==
X-Received: by 2002:aa7:db91:0:b0:458:bd09:1b20 with SMTP id u17-20020aa7db91000000b00458bd091b20mr59869948edt.176.1669883264612;
        Thu, 01 Dec 2022 00:27:44 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id f29-20020a50d55d000000b00467960d7b62sm1505465edj.35.2022.12.01.00.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 00:27:44 -0800 (PST)
Date: Thu, 1 Dec 2022 09:27:43 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu,
	corbet@lwn.net, guoren@kernel.org, heiko@sntech.de,
	paul.walmsley@sifive.com, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 1/3] RISC-V: clarify ISA string ordering rules in cpu.c
Message-ID: <20221201082743.xjxcnx7zcwycdwy7@kamzik>
References: <20221130234125.2722364-1-conor@kernel.org>
 <20221130234125.2722364-2-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130234125.2722364-2-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_002748_409491_FE02820C 
X-CRM114-Status: GOOD (  30.15  )
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

On Wed, Nov 30, 2022 at 11:41:24PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> While the current list of rules may have been accurate when created
> it now lacks some clarity in the face of isa-manual updates. Instead of
> trying to continuously align this rule-set with the one in the
> specifications, change the role of this comment.
> 
> This particular comment is important, as the array it "decorates"
> defines the order in which the ISA string appears to userspace in
> /proc/cpuinfo.
> 
> Re-jig and strengthen the wording to provide contributors with a set
> order in which to add entries & note why this particular struct needs
> more attention than others.
> 
> While in the area, add some whitespace and tweak some wording for
> readability's sake.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/cpu.c | 49 ++++++++++++++++++++++++++++++-----------
>  1 file changed, 36 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 852ecccd8920..68b2bd0cc3bc 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -120,22 +120,45 @@ device_initcall(riscv_cpuinfo_init);
>  		.uprop = #UPROP,				\
>  		.isa_ext_id = EXTID,				\
>  	}
> +
>  /*
> - * Here are the ordering rules of extension naming defined by RISC-V
> - * specification :
> - * 1. All extensions should be separated from other multi-letter extensions
> - *    by an underscore.
> - * 2. The first letter following the 'Z' conventionally indicates the most
> + * The canonical order of ISA extension names in the ISA string is defined in
> + * chapter 27 of the unprivileged specification.
> + *
> + * Ordinarily, for in-kernel data structures, this order is unimportant but
> + * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.
> + *
> + * The specification uses vague wording, such as should, when it comes to
> + * ordering so for our purposes the following rules apply:
> + *
> + * 1. All multi-letter extensions must be separated from other multi-letter

1. All multi-letter extensions must be separated from other extensions by an
underscore.

(Because we always lead multi-letter extensions with underscore, even the
first one, which follows the single-letter extensions.)

> + *    extensions by an underscore.
> + *
> + * 2. Additional standard extensions (starting with 'Z') must be sorted after
> + *    single-letter extensions and before any higher-privileged extensions.
> +
> + * 3. The first letter following the 'Z' conventionally indicates the most
>   *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> - *    If multiple 'Z' extensions are named, they should be ordered first
> - *    by category, then alphabetically within a category.
> - * 3. Standard supervisor-level extensions (starts with 'S') should be
> - *    listed after standard unprivileged extensions.  If multiple
> - *    supervisor-level extensions are listed, they should be ordered
> + *    If multiple 'Z' extensions are named, they should be ordered first by
> + *    category, then alphabetically within a category.
> + *
> + * 3. Standard supervisor-level extensions (starting with 'S') must be listed
> + *    after standard unprivileged extensions.  If multiple
> + *    supervisor-level extensions are listed, they must be ordered
>   *    alphabetically.
> - * 4. Non-standard extensions (starts with 'X') must be listed after all
> - *    standard extensions. They must be separated from other multi-letter
> - *    extensions by an underscore.
> + *
> + * 4. Standard machine-level extensions (starting with 'Zxm') must be listed
> + *    after any lower-privileged, standard extensions.  If multiple
> + *    machine-level extensions are listed, they must be ordered
> + *    alphabetically.
> + *
> + * 5. Non-standard extensions (starts with 'X') must be listed after all
> + *    standard extensions.
                            ^and alphabetically.

> + *
> + * An example string following the order is:
> + *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
> + *
> + * New entries to this struct should follow the ordering rules described above.
>   */
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> -- 
> 2.38.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
