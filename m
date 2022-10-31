Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE0BFA3742
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 08:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bB7kjzdO8FiZyJ6m8s5vjBvLrPwxsfIkylpk+0wCsKQ=; b=nhyP+BUDkUhfrD
	z8Zxox+qzr8qnaE+Rv7vhHjJWnoJ/sAtH6vyCxxClZ+ygRD4OcfuxH7CyzFSfM/juEljRKQ3xTDUh
	eYBbW+YvWkadHHHZy+g9qf+HxBJM6b5wyJzDbmIMJxLZgFVxIbeFcW6r1B2nBoUvnaHHdX/pqZRfQ
	IfyUXCcJmMxRDb13G71i2C7QzqJih4uKPaswQeg2ihT/bYbdNJHHUqTSN4Y+hzyCVKUOZqf6B0OlX
	GByBuj6ZiuS9Mk8gu8qUtxgDTOqqAQkQJ1o8Kr4SIIa1wXgUwpyP25Nv4KDP/bjgOnFX1v6LTKifi
	jDtyCyPH8MYKtUiTE02Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opQCN-009cFi-8y; Mon, 31 Oct 2022 08:31:11 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opQCF-009cAM-2z
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 08:31:07 +0000
Received: by mail-ej1-x633.google.com with SMTP id k2so27563915ejr.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Oct 2022 01:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D5GGfQwm0B4ZnhCjinCr3zYhJ7ZAwVhlMFtLy+nqXO0=;
        b=SFlIwhGwDBlefwUJydV5droavDDSoCOrUgmUMPKnnjqM0o8tpIkG5pkRmKIrxK/K6p
         xbW9NxKRRGKvCdOPxpjNz/s/9oPKHFgf9t4UQj5O7GEfUTysvn9TLoO/28NDeCJVMXuK
         rrX1zUV88W3YFY3As+0GPWEghOcP47AdnRiCzjiEFz8cXT7vCzZgmUh7IR0ysQ4PdqdR
         MGZX93M2F7UwADK3VqELRAFTLhegXFy53KErIa9NYKYB+O8XfTgLuZwVneQvLi1WWjor
         BpJxJ77pLdMX8YBveafQGHx3RQ2FiaKFCr+U1EtwCRsdmoubglDjo6wa6UXKxSvZXmdF
         SWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5GGfQwm0B4ZnhCjinCr3zYhJ7ZAwVhlMFtLy+nqXO0=;
        b=mfr6X7XmjhqD+cEMQV+1TZhbFWrrEWA/zhxmnUbGOJv5n8iDTFnsh4SYUZGUZJDvnX
         r/H24313it/4wsPzSu20F7hpEkwf8yVwXnyXfvf/Uas6vBnuYLOlzskFhjDIVUJyqbq+
         1tl/T0HLLMRrrEa+SG7TPn7YxaZUNs3gFvNWLHWTcvrwqwiF+xEIm0DWtAA6Fk6DIaD1
         qnU797m/JvWv44Wz5odnsSUlU4JZRujstQiVU8dCBGB6P0anutiaSwWUl28vQCaI13f4
         zO86z8EzcIWYAEHhLuAhqXd86WYQ/z9GlU+4OoaIuQrke92fPI2pE1GbOrPNfXIMrJUa
         ZAiw==
X-Gm-Message-State: ACrzQf1jt6/46xanaIuby3jQb1BGjrz9E/rbk1JKqdu9LED442CEL+sz
	XvxSdFntO0p9ejUoBR86MiuOzA==
X-Google-Smtp-Source: AMsMyM496USuNV6x5TNFHiEi2T277AnOHC2KtAmjgZ5fvQ+SVyB5cX12mEEzrqiSRIiONzOu1DWUVQ==
X-Received: by 2002:a17:906:6a1b:b0:7ad:ba1e:879b with SMTP id qw27-20020a1709066a1b00b007adba1e879bmr8552119ejc.311.1667205060460;
        Mon, 31 Oct 2022 01:31:00 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906210200b00779cde476e4sm2708092ejt.62.2022.10.31.01.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 01:31:00 -0700 (PDT)
Date: Mon, 31 Oct 2022 09:30:59 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 9/9] RISC-V: Use Zicboz in memset when available
Message-ID: <20221031083059.u6m4n73edx4ap2t5@kamzik>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-10-ajones@ventanamicro.com>
 <Y178Q/szFZNlaFej@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y178Q/szFZNlaFej@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_013103_506685_0D64FE74 
X-CRM114-Status: GOOD (  30.60  )
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

On Sun, Oct 30, 2022 at 10:35:47PM +0000, Conor Dooley wrote:
> On Thu, Oct 27, 2022 at 03:02:47PM +0200, Andrew Jones wrote:
> > RISC-V has an optimized memset() which does byte by byte writes up to
> > the first sizeof(long) aligned address, then uses Duff's device until
> > the last sizeof(long) aligned address, and finally byte by byte to
> > the end. When memset is used to zero memory and the Zicboz extension
> > is available, then we can extend that by doing the optimized memset
> > up to the first Zicboz block size aligned address, then use the
> > Zicboz zero instruction for each block to the last block size aligned
> > address, and finally the optimized memset to the end.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/lib/memset.S | 81 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> > 
> > diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> > index 74e4c7feec00..786b85b5e9cc 100644
> > --- a/arch/riscv/lib/memset.S
> > +++ b/arch/riscv/lib/memset.S
> > @@ -5,6 +5,12 @@
> >  
> >  #include <linux/linkage.h>
> >  #include <asm/asm.h>
> > +#include <asm/alternative-macros.h>
> > +#include <asm/insn-def.h>
> > +#include <asm/hwcap.h>
> > +
> > +#define ALT_ZICBOZ(old, new)	ALTERNATIVE(old, new, 0, RISCV_ISA_EXT_ZICBOZ, \
> > +					    CONFIG_RISCV_ISA_ZICBOZ)
> >  
> >  /* void *memset(void *, int, size_t) */
> >  ENTRY(__memset)
> > @@ -15,6 +21,58 @@ WEAK(memset)
> >  	sltiu	a3, a2, 16
> >  	bnez	a3, .Lfinish
> >  
> > +#ifdef CONFIG_RISCV_ISA_ZICBOZ
> > +	ALT_ZICBOZ("j .Ldo_memset", "nop")
> > +	/*
> > +	 * t1 will be the Zicboz block size.
> > +	 * Zero means we're not using Zicboz, and we don't when a1 != 0
>                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> I find this second half a little hard to parse. Do you mean "we don't
> use zicboz when a1 != 0"? IOW, is my rewording of this comment accurate?
> "A block size of zero means we're not using Zicboz. We also do not use
> Zicboz when a1 is non zero".

Yup. I'll use your words in v2.

> 
> > +	 */
> > +	li	t1, 0
> > +	bnez	a1, .Ldo_memset
> > +	la	a3, riscv_cboz_block_size
> > +	lw	t1, 0(a3)
> > +
> > +	/*
> > +	 * Round to nearest Zicboz block-aligned address
> > +	 * greater than or equal to the start address.
> > +	 */
> > +	addi	a3, t1, -1
> > +	not	t2, a3			/* t2 is Zicboz block size mask */
> > +	add	a3, t0, a3
> > +	and	t3, a3, t2		/* t3 is Zicboz block aligned start */
> > +
> > +	/* Did we go too far or not have at least one block? */
> 
> This one is a little hard too, I think it's because you're switching
> from "did" to "have". Maybe this is only an issue for me because this
> stuff is beyond me in terms of reviewing, so I relying on the comments a
> lot - although I suppose that makes me the target audience in a way.
> 
> I think it'd make more sense to me as "Did we go too far, or did we not
> find any blocks".

OK, I'll also take those words for v2.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
