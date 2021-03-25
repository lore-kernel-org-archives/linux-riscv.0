Return-Path: <SRS0=pLrx=IX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836DAC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 15:56:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FE9460240
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 15:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FE9460240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+UvJrmGBDjvXpS3LfvSx1G6JVYZDLrhoX8QDB8JsgEo=; b=a0iBBPE9r3bcMvPSxUp6UpVEd
	8IjxIYuP+maba0KwcwJf15er5PN9hiQGss1760j9Zxu6Pad9B/N22dHQ2eiRGGHqtVJ9coXC6Tu/B
	2W5j9X9CtpwivXlfOSAFg21sndGaU7qh4znngeTMGKVENr3l6KuC1K4v0nvkOWi4sGuSKOQS3GlmU
	CEk4EVkK6wYhfO261OXoUT1TrZLhgGzNmdwOGZMdp1OsnXwrg+m76pMNa3LOmf3iYYe9tz/eVR2KY
	SIci2ONiLmsVjiZ5NBrqMUlKJqNl3XjkjsjDcPWbW/UUWyY9aio3QzjrV8lV9YwOn64T4+C2FHXl4
	DSDOD1A6A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPSL3-001mwe-Su; Thu, 25 Mar 2021 15:56:02 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPSL0-001mvW-35
 for linux-riscv@lists.infradead.org; Thu, 25 Mar 2021 15:55:59 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so2896697pjc.2
 for <linux-riscv@lists.infradead.org>; Thu, 25 Mar 2021 08:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6n2lhd1tAUerJU3jmezm5RJvOnG3Jo+Q1gBfzhFAzEg=;
 b=Hr38qW+ymlf4XK3GQskrG5LTRw5Rr7BkSLfgM/uKNkkV46+WF5BXbc1c/jIMKWNlAW
 HipEclQ6RFpykbCuOPwzimkRLA9XSeJaTkJM/YV/Xvum38mfP2VAVVQyABSvWygYsGZZ
 pWYI4HkNqA5ybM9nuxTizYxXk9EeV70oDScoPZ/h5SJxYoOnKsw4sZkpVWi+TKMeHrw/
 qY9WfwGEGupe5soAXv7nC5mfynUyvbR9dfD3ceYlO/q91MCZW5aDg/LqurTcocRmniXu
 l0/+vYbfmA5PZb5D6GcNaorGioaHWkRcZLuBb9aZTWA2k+/OGjyrEnf0tB1NhsjZQz0G
 tOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6n2lhd1tAUerJU3jmezm5RJvOnG3Jo+Q1gBfzhFAzEg=;
 b=NzAy24guC1IGuUSEXTjvUFbqGaC2Osts1RJJr7BVgTn84qkeIYLw6ouTx02g0qzpEL
 asQHqzyqAoGp6+v+iO3i+AGHZrbovW+y0EaYmXSqainwJYFeGON4Zeg3lkQ5DwsFoqJW
 KcrTwPU4bqpBub2u3T4ejjrMl3C2k5jr78j6h/CSfoWECCeqHr4LRCT5KSdIJvm/0Avo
 4YaSDK9RQAKIWwAqCqCblDqSUN1FaDqmZ6l5tUL/gIVYD2Hhj7tI1a9e5L37QVeEIPkf
 sZfI7O70YCVQutChFXdRcObwRMSe605JmkuItwvqYsdIXqcYQ7BclrOZpZp/Gh6tje/x
 SQjw==
X-Gm-Message-State: AOAM533yLKz1viHWH2JNdXuJ0GTKLPXQYdNKv4xtcctBqYZCBRm5lTeq
 kMHrYy88Abtmqi7ZOMfo0a0=
X-Google-Smtp-Source: ABdhPJzj2F/PdKLf/AOj/lKUOVKN2j2gVEDEhd545yb/4d1SV9k0REJ5Q0/AUptD5XWiwyGq2D9ynQ==
X-Received: by 2002:a17:90a:8408:: with SMTP id j8mr9498953pjn.1.1616687755667; 
 Thu, 25 Mar 2021 08:55:55 -0700 (PDT)
Received: from mail.google.com ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id bb24sm5931187pjb.5.2021.03.25.08.55.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Mar 2021 08:55:55 -0700 (PDT)
Date: Thu, 25 Mar 2021 15:55:51 +0000
From: Changbin Du <changbin.du@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Changbin Du <changbin.du@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Do not invoke early_init_dt_verify() twice
Message-ID: <20210325155550.udz33f3kivbi7j76@mail.google.com>
References: <20210324150312.20535-1-changbin.du@gmail.com>
 <CAAhSdy19Tpf1D0Q4V7CF0ZOvksHMXxA2fF3L3J2f_Ka8NZgVAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy19Tpf1D0Q4V7CF0ZOvksHMXxA2fF3L3J2f_Ka8NZgVAQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-508-7c9a6d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_155558_180064_25E8B7D4 
X-CRM114-Status: GOOD (  23.54  )
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

On Wed, Mar 24, 2021 at 08:51:06PM +0530, Anup Patel wrote:
> On Wed, Mar 24, 2021 at 8:33 PM Changbin Du <changbin.du@gmail.com> wrote:
> >
> > In the setup_arch() of riscv, function early_init_dt_verify() has
> > been done by parse_dtb(). So no need to call it again. Just directly
> > invoke unflatten_device_tree().
> >
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > ---
> >  arch/riscv/kernel/setup.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index f8f15332caa2..2a3d487e1710 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -255,10 +255,7 @@ void __init setup_arch(char **cmdline_p)
> >  #if IS_ENABLED(CONFIG_BUILTIN_DTB)
> >         unflatten_and_copy_device_tree();
> >  #else
> > -       if (early_init_dt_verify(__va(dtb_early_pa)))
> > -               unflatten_device_tree();
> > -       else
> > -               pr_err("No DTB found in kernel mappings\n");
> > +       unflatten_device_tree();
> >  #endif
> 
> The early_init_dt_verify() set he DTB base address in Linux OF.
> 
> When parse_dtb() calls early_init_dt_verify(), MMU is enabled but
> we have temporary mapping for DTB (i.e. dtb_early_va).
> 
> After paging_init(), we have moved to final swapper_pg_dir so
> temporary mapping for DTB does not exists anymore but DTB
> is at same physical address so update DTB base address in
> Linux OF by calling early_init_dt_verify() again.
> 
> Based on above, NACK to this patch.
>
No problem, thanks!
 
> Regards,
> Anup
> 
> >         misc_mem_init();
> >
> > --
> > 2.30.2
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
