Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3ABEC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 10:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sz2BQBrDh++ETl4a0EzhoeqriLwdzq5VUQoyYiyByDY=; b=gvufek2s4Dps2q
	n67CyGzNBdQtIBAvPHl5KkVZT6oIxU8xJgseUKv+Sibcmch5w5ccspui65hnWW4G5TeM1RE8IkC64
	26JTNlt9iJDH6+PI9/1oHvFnHprdh8OyJtiohdBpB41xX47LAuOAutvVZNG8nKOgUp4ktr05+kvJ1
	WePxvbOh1wzmr580jjcfYS+HukKjdy/SrsThfdW7ztKNLZkWQi/qN182s+pVyxAmZVONY1afRexN7
	ziGWU6qvN/r0KHafO9+dC/ss+SRpvFNtHrPEek+AAAGcXlsVGTI4aUqWYfmr/DKWlY+p//y4QYaou
	31wwAU7sZ8w/+vFLUH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9YT-007icW-9R; Thu, 24 Nov 2022 10:34:05 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy9XQ-007hTn-Ed
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 10:33:02 +0000
Received: by mail-ed1-x52a.google.com with SMTP id m19so718021edj.8
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 02:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Fwv0fBaAtUGyjSvz8Eubu4WI6tfxvAGSEBjrtHfM94=;
        b=R+veBmryJx4bjvNU4yQpLYI4xOGK5WSei4TFOGSsJ6CxLP27d+kxKBz3iUR9fA4IxX
         SMnZEu7CLp3KwyXQKgWs+zSP6Ch9iM8GB3nikg+wvH3zL8+5+RqnJaFIDM5q50FmmaWy
         WBi/got/nDXWVhECiF7GU3BYildUNLZmiZMQvsZmXcGs1F307/YNgKlHzUwMT7MwlsNa
         CIgjFYBTVRnp91Om5Kurv7dmm1BT1yENpGc100kF7xxVMpQ22cfQnt0FEqv/FssI/6mC
         Pz1lRORynIO5fCYwPKJ0BHL+uKSV/zZRLrShQdE7QZ05s+dJ1O/1uA7moSbqYz0jMZKx
         hPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Fwv0fBaAtUGyjSvz8Eubu4WI6tfxvAGSEBjrtHfM94=;
        b=yDQOLLXR0E7rp6p/B7PoCRr61/r0dyTZgRVbczeWOWSKUMyfZ/YjN5iySfY3LJJLgZ
         0XKeBsmyOD7FAiBE9dXANIAdwhfYneWOE9skidHuyMyso+2owhreDrIUH5sNhTy0EisQ
         28OL6EhMdJta7H4q7IP56kPXN2/CLItYRRB2B2j+0I/GEttNB12snxPtlHDVx+3m4O/0
         i+Oh1WOmYTR6nKjjduEglhGJR0buHkzeu2mj2HgFWJBiOAbF1P7nQpx8Ww/UIUhLTodk
         g62JCY6gG9yBNh3xMw/id7ub+hfg6hwMlOCOGEY/hi7milu6uLWxMFMIjdBh6BS+dXL0
         fD8Q==
X-Gm-Message-State: ANoB5pl599vJOARoLxSMFguB+BxDxaiLy0pBCxpehCaJxp6e9qPchdd1
	ZNs8lM3zvJh0CSzynuvew7pK2A==
X-Google-Smtp-Source: AA0mqf6l3YnM1QkmkvtGrkaGbUvKvN03fiMpWHkPotubU8vmj+xb1xgCJEkB80pFtKPXCbX1K3IyGA==
X-Received: by 2002:a05:6402:1f03:b0:468:7be6:55e7 with SMTP id b3-20020a0564021f0300b004687be655e7mr29511275edb.345.1669285976903;
        Thu, 24 Nov 2022 02:32:56 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906201200b0077f20a722dfsm266341ejo.165.2022.11.24.02.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 02:32:56 -0800 (PST)
Date: Thu, 24 Nov 2022 11:32:55 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] riscv: vdso: remove hardcoded 0x800 .text section
 start addr
Message-ID: <20221124103255.33prhf3gf6xtwlsk@kamzik>
References: <20221123161805.1579-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221123161805.1579-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_023300_568362_C8D3EE50 
X-CRM114-Status: GOOD (  22.16  )
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

On Thu, Nov 24, 2022 at 12:18:05AM +0800, Jisheng Zhang wrote:
> It seems the hardcoded 0x800 isn't necessary, but removing it brings a

s/, but/and/

> small vdso.so and aligns with other architectures.

This commit message didn't really satisfy my desire to understand why
the comment and '. = 0x800' were there in the first place and if its safe
to remove now, so I tried to do some of my own digging. I found

commit 5b9304933730 ("x86 vDSO: generate vdso-syms.lds")
commit f6b46ebf904f ("x86 vDSO: new layout")

which removes the comment and hard coding for x86 by changing the vdso
Makefile. Then looking at

commit 9031fefde6f2 ("arm64: VDSO support")

we see that it starts with the new Makefile approach and doesn't bother
with the hard coding from the start. As riscv also started with the new
Makefile approach it also could have dropped the hard coding from the
start (I guess).

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/vdso/vdso.lds.S | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> index 150b1a572e61..7be7e618d59c 100644
> --- a/arch/riscv/kernel/vdso/vdso.lds.S
> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> @@ -31,13 +31,7 @@ SECTIONS
>  
>  	.rodata		: { *(.rodata .rodata.* .gnu.linkonce.r.*) }
>  
> -	/*
> -	 * This linker script is used both with -r and with -shared.
> -	 * For the layouts to match, we need to skip more than enough
> -	 * space for the dynamic symbol table, etc. If this amount is
> -	 * insufficient, ld -shared will error; simply increase it here.
> -	 */
> -	. = 0x800;
> +	. = ALIGN(4);

I realize 4 is used here now because I questioned the 16, but after doing
my digging I think a larger alignment may be better. Loading the text may
be done with 8 byte or larger reads, so having the section aligned to a
larger size would be better reading it. We might as well use 16, like
arm64 does, and like you had before?

Also, having enough separation between data and text seems to be
important for cache reasons, based on the comment in
./arch/x86/entry/vdso/vdso-layout.lds.S and other vdso history.
Maybe we should move .note, .eh_frame_hdr, and .eh_frame below
.rodata like x86 has it?

Thanks,
drew

>  	.text		: { *(.text .text.*) }		:text
>  
>  	.data		: {
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
