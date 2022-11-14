Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84104C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKe5JRRlzuRU+dMcC5MrENtVkD+LJzD5QW7rl4wJGGU=; b=ydr643GPQZ6uGH
	OIEGNYrFb/Pp5MN16pkl+TWEhnnXKDMaqwPZWwaPM5yy0CcH1XZfA4l7vTFrZ6jcr/8MLo32YinS8
	LSnQcJZZuQibsBP5LnAG6K+FBYIzom/+Mpm4jMyAn+ffn74GtYGNmYoShEl3L5ASxJdgYAxH7v/oz
	SbgMxwdWze3f0xxaycFijiZxhJh/cTYiBHdXgl2Rvs6QRmVgOyQS+ziFVDMzsqG18LFwpZQ+MtXXI
	cWPbCbea7S9d3sSmRL/asRzbKkuHiCanrRv8JIs2GknI3SN9wKuSCtHNburmPaZumxggSKk04MMbk
	CCCZxQbBmvP8I+Qy9YvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXkw-000Qap-3M; Mon, 14 Nov 2022 11:36:02 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXks-000QYO-1R
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 11:35:59 +0000
Received: by mail-ej1-x62b.google.com with SMTP id n12so27497553eja.11
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 03:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ukxnEwvthjmINjyepYvYa1QvJfDkuoX53zv72tMhQhc=;
        b=cBtJq/FeFIHJ8j2nB1ATAddTPPRla9z/qasCD6cgUTqou6pKvffN4KcHjzVRKwctfD
         2rMldgj3Huqyu+q6peI43U25i18qQNe8GXAjGD9Onpn774iEhIycr0BPBqeM1y0YA7Gf
         gSB7weZUTt0dbQwTLHPqGW1tZ2scBKz1KHj9h6VVrRT2XgCrqEANH7twNxGa3WDL9K6R
         nYdu87q3/r5DjTGHvFNsvl8Zx9Sqeo2tB7c/9xn6svmPKjeaT0R5pO9NT3fwa7+S6x/c
         x3J/1SOflrsnNVO1S7ZjQH8XeuIb9AJxK6Ec1HQ/soIJsiCvA02TGaP/vfuu8x+kknb5
         UZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukxnEwvthjmINjyepYvYa1QvJfDkuoX53zv72tMhQhc=;
        b=j1z6ud3hx6Ck+3wf0O7i5qAg0+lev4UH6MF4nR7G3jC60f0YTsqm9BymNrmwDA/CrN
         Qfoexbb4yTyVvaOeRPwYUYWyCQ0cnfITO82cEBzhln3Aug16uviyAY8lVJ65j/VkFDcK
         TyqHAe8Z90YqGFc1NCA1WNuXLnEk0y6rIRZArA42sCMWVjs8aaBOY3nd5WoriExblNrH
         PxU8FtpqyqxRJW30x0RMbB2U1j/6a0FeVRT4tIBimbMmdCcjMA5WSLLEn2h6Q7xm4cim
         YHCdxfdv5ed4xcgqp0zGCDUOrgVyWYeuTgt06L4BCRNAjFwrU7WhSapwE/r5067qRLcL
         tTvw==
X-Gm-Message-State: ANoB5pk9xOgcV5tIvC1/KC3ASmS8IGMeABZu5FCmBkpPBfQrgA3cvbN/
	rRbVGS/3O5G21+JBXIhhyflMgYxGS/OHUw==
X-Google-Smtp-Source: AA0mqf4fZmJQnoOTora3drF4OyBmCbxgudwbCvcVZo3XXT6AtKmrx32VNNEcOsDu9WUdzGlbWcaU2w==
X-Received: by 2002:a17:906:7ca:b0:7ad:934e:95d3 with SMTP id m10-20020a17090607ca00b007ad934e95d3mr9841081ejc.393.1668425755113;
        Mon, 14 Nov 2022 03:35:55 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id r18-20020a17090609d200b0077f324979absm4077106eje.67.2022.11.14.03.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 03:35:54 -0800 (PST)
Date: Mon, 14 Nov 2022 12:35:53 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com, conor@kernel.org,
	philipp.tomsich@vrull.eu, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched
 alternatives
Message-ID: <20221114113553.3dxrumhk72jouzek@kamzik>
References: <20221110164924.529386-1-heiko@sntech.de>
 <20221110164924.529386-6-heiko@sntech.de>
 <CAJM55Z8PBGWr6ej1GSfks8nCvK0q=sF8qDK6f8w=+Nh1mr4sSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z8PBGWr6ej1GSfks8nCvK0q=sF8qDK6f8w=+Nh1mr4sSg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_033558_122927_9E7351B6 
X-CRM114-Status: GOOD (  14.48  )
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

On Mon, Nov 14, 2022 at 11:57:29AM +0100, Emil Renner Berthing wrote:
> On Thu, 10 Nov 2022 at 17:50, Heiko Stuebner <heiko@sntech.de> wrote:
...
> > @@ -316,8 +384,15 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
> >                 }
> >
> >                 tmp = (1U << alt->errata_id);
> > -               if (cpu_req_feature & tmp)
> > -                       patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> > +               if (cpu_req_feature & tmp) {
> > +                       /* do the basic patching */
> > +                       patch_text_nosync(alt->old_ptr, alt->alt_ptr,
> > +                                         alt->alt_len);
> > +
> > +                       riscv_alternative_fix_auipc_jalr(alt->old_ptr,
> > +                                                        alt->alt_len,
> > +                                                        alt->old_ptr - alt->alt_ptr);
> 
> Here you're casting a void pointer to an instruction to an unsigned
> int pointer, but since we enable compressed instructions this may
> result in an unaligned pointer. Using this pointer will work, but may
> be slow. Eg. fault to m-mode to be patched up. We already do that in
> other places in the arch/riscv, but I'd prefer not to add new
> instances of this.

Alternative instruction sequences (old and new) have compression disabled.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
