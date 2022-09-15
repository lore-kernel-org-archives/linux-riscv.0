Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1BBECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 17:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=kT9Jfta+RjSz/oQOxJ/YQO7vOvNFkG9oMjWvu599ghk=; b=G3IELvYHMmpeK1nILk+oLGCZQv
	JiBEstxfLlIyNJfDHhuq6I4FmSsV3ULEOSmPJ6ALA5froySRfXY3oBLKvaYmdNfdx29JCoh50DA7A
	nAbfaunKpWKFDukUxrsXAw2kgtzUQB3e25mr0cV3VKwu6SljctVECUErAAE51oV7ZKbOVPCeYEIgR
	OhPD7oAQDFitutv6b/NpURWqsUw3W4+Nd69aJO6mSWl+rIAz/zLA7u9xYjtfASO1e3TupwAPjJcKt
	R3ER82PqZdeUrMofmpw6UnF9AeNpkJIU0CH17kBCYGZz46vSvUQeeO18vyFlLl02e7mGWaJ2oEzW4
	tQ+kq1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsMg-00DuTv-WE; Thu, 15 Sep 2022 17:09:27 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsMd-00DuQu-A5
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 17:09:24 +0000
Received: by mail-pl1-x62c.google.com with SMTP id c2so18971836plo.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 10:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=820aiP5wgSGtYt0XY19C9Wxp+Ljq2FQO9ZvTLtewRwY=;
        b=r+SUBST+O38sGIZ2I+jaD/K9DW3VQ55Ob1WS96HdGprtHoGHQKXhIQnnZFB5lNW+Kd
         7sJsXb3HhRfPJuiuu1qroGWVfCjNkaVzUaUYwGkDXL0Oy11UsyxUUKWcU1l/D5TDXRPc
         rHI1aBhaiZWWDJjVy1iIG+hTlFYvKSgJpiO5RXOPhk2+9zYQtPOEtHsXaGwDMG5WLYpR
         /qZjV6g5McA1yzwbbQ2yCeU3vc34bQ2gpOedbXKHv2kOwD/zkLuqyhskyQtDkaIS6Pvk
         1STn3qwoWbSlB9hwlPGAuMpxXm6mw4F0Ets6yoDxNz9I/bV3bkPUerWCzFUw4r/awc8Y
         YJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=820aiP5wgSGtYt0XY19C9Wxp+Ljq2FQO9ZvTLtewRwY=;
        b=CqzlSx/ksvmFOZhoJ0GnDrj4ecnN81AFsFRwrxwue8ihJPHDFt8S6xY3145uBXlm9b
         JwotE8YSlLi2LEi66A2MfbVFBNoH1ruom7R/JIpGtgRaNtJgg2tz0Bi2vxlasahr17uB
         txYnDam61EJcAFQJ+tNsCFBB5NFMtd3qzZpTrbjmdmPJvtuk3lpzzQynMPtDDuvV6TJb
         P6TdkhD9zLzHMGuxnxokY95F3iy052ZxnKIg+hUFnnHli63N1kN9JblYdOF4EHp/jVR8
         OSYmMN2XkjPuJAzmipOLCkjPptjViDjIswCRWX9DVqLN2FD2/LJYY6QFeX/oStrrwbjl
         9CRQ==
X-Gm-Message-State: ACrzQf1nEMPaKoIKqg+bjoKfpE5FrgtWHBF1eECB6CK98rZKWfNcO001
	02KWzy7N6DH4wiivZCkBrC1ONuWWTF8NZz7L+WY=
X-Google-Smtp-Source: AMsMyM6NqnmZuQDHTRL3TwU74oTt16r0B2S2qPeNotNbeAWdlNUuripL2egbG224+bt5/m8SKuqRBw==
X-Received: by 2002:a17:902:d3c6:b0:178:37e0:2e72 with SMTP id w6-20020a170902d3c600b0017837e02e72mr563249plb.28.1663261760402;
        Thu, 15 Sep 2022 10:09:20 -0700 (PDT)
Received: from localhost ([172.58.30.147])
        by smtp.gmail.com with ESMTPSA id v62-20020a632f41000000b00430c6fd7ffbsm11922447pgv.84.2022.09.15.10.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 10:09:19 -0700 (PDT)
Date: Thu, 15 Sep 2022 10:09:19 -0700 (PDT)
X-Google-Original-Date: Thu, 15 Sep 2022 10:09:09 PDT (-0700)
Subject: Re: [PATCH] RISC-V: move riscv_cbom_block_size to the correct #ifdef block
In-Reply-To: <1905154.PYKUYFuaPT@phil>
CC: Conor.Dooley@microchip.com, linux-riscv@lists.infradead.org, nathan@kernel.org,
  mail@conchuod.ie, atishp@atishpatra.org, ajones@ventanamicro.com, anup@brainfault.org,
  lkp@intel.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: heiko@sntech.de
Message-ID: <mhng-4781e413-015e-45ca-8b0f-91dada450b3a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_100923_371488_E042A4AA 
X-CRM114-Status: GOOD (  23.05  )
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

On Wed, 14 Sep 2022 15:19:51 PDT (-0700), heiko@sntech.de wrote:
> Hi,
>
> Am Mittwoch, 14. September 2022, 21:32:01 CEST schrieb Conor.Dooley@microchip.com:
>> On 14/09/2022 15:36, Heiko Stuebner wrote:
>> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> >
>> > riscv_cbom_block_size is used by all current non-coherent dma operations,
>> > not only the zicbom variant. So move it over the block also containing
>> > the riscv_noncoherent_supported() prototype.
>> >
>> > Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
>> > Reported-by: kernel test robot <lkp@intel.com>
>> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>>
>> I accidentally fetched palmers repo rather than riscv & noticed he
>> pushed a fix there for this too:
>> https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=zicbom-fix
>>
>> I think Palmer's solution is slightly nicer, but to me either makes
>> little difference, just getting things squared away for 6.0 is all
>> I care about at this point.
>
> yeah, Palmer's solution is nice and incidentially should also
> not only make LKP happier but maybe also Anup in one go :-) .
>
> So I'd guess disregard this patch and move Palmer's patch over?

OK, I'll go post mine and then merge it -- I was writing it at Plumbers, 
I guess I forgot to send it.

>
>
> Heiko
>
>>
>> Either this or the one on Palmer's branch is:
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> > ---
>> >  arch/riscv/include/asm/cacheflush.h | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
>> > index a89c005b4bbf..5c16d901d3da 100644
>> > --- a/arch/riscv/include/asm/cacheflush.h
>> > +++ b/arch/riscv/include/asm/cacheflush.h
>> > @@ -43,13 +43,13 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>> >  #endif /* CONFIG_SMP */
>> >
>> >  #ifdef CONFIG_RISCV_ISA_ZICBOM
>> > -extern unsigned int riscv_cbom_block_size;
>> >  void riscv_init_cbom_blocksize(void);
>> >  #else
>> >  static inline void riscv_init_cbom_blocksize(void) { }
>> >  #endif
>> >
>> >  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
>> > +extern unsigned int riscv_cbom_block_size;
>> >  void riscv_noncoherent_supported(void);
>> >  #endif
>> >
>> > --
>> > 2.35.1
>> >
>>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
