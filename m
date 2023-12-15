Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D35C35274
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHYD9w8azn3ljfTpdczCvWF9mWg0FR+dz6tS+DGNY7s=; b=PN6fIgnUxUPmRw
	YHJFoLth26YGijPrPDeyYM8SOyOVsFvM2LrvFukVwDNCmpgG8YPngymNnZrlNCcrWWE/t9IPdQh31
	RyIt+ie30abhIvm5lfut1wmONi5tZMR3KYBUCxmIGn8uYP8z0nYIWID7A6QPd7IZfePHnSkfUEMZf
	Bz7Ci0iGdJt5KXO+3nUN5bAgHvvE7r+sk8sy4q+9xP+r4ZKuckdQnAuuVjWSGOaxKXwujZ+JefvBI
	E4eJQlFBMLBgk+0DXaQnLzZAoJfi6KLBzv2ZSoT4asFFvr/voKcy2HqyklhvQQZteWS4rGSPof0Yg
	2fvPfQVOAmSMnnhcT/9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8cn-003RIV-2L;
	Fri, 15 Dec 2023 13:53:09 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8ck-003RFf-21
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 13:53:08 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33646dbedc9so574703f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 05:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702648379; x=1703253179; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MFntEVuwxl8t0Tb/9RlOeupPJ1WxP9iI0vaf/icliuo=;
        b=Hu3KcZnwzWAtwG2q7OIu91rCMNOGHv4NHkXYvAT2RA+jb/rCBZv6My8T39t6zDyVT4
         U4HRS5PaQXxpBX7LQCtuK0pNmkMDzJR4pJONxoGVh4SybUwKDN91Ps4d/aWMlzLmyFNO
         EBEb2gbKOn6ietQshltBhAXiVls0f4nlam9A0cjO8W4CIXZRpP29VOUVPDzF5X8mc4Nz
         LJBZ7KPVhxxAKb2vXosfW6Qz1svKu2bPyfcz2gwf3ML20T7NHmNm1cXWK58anpZnaGuD
         pUKLHXu+lWgyPqH3lZDBppIEPIg1enCFQPEFL7xEnZZQfFvuao2TUTkhqmjc/IOFL50/
         nQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702648379; x=1703253179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFntEVuwxl8t0Tb/9RlOeupPJ1WxP9iI0vaf/icliuo=;
        b=gDsNNxLYQQ3FrrX8mvgeGCe9s3BmkuUqHK42qWgYkrkQa95fDX0QhxPu4XZgDeOo6M
         Oeha7LtaRk9Fb6B2xn8qgVXJLMB70P5VMS/W+dljBzXxcxVlfLyuXrv4NI8Lz3iPBnho
         coRr2t3rXdMpw9aNcNkOV1xmfSVbVfjfqNFI1nau95ldNAWe8FtOin8KOywwFeHiiZ7/
         l+d+1wFEVuaqIzjf4Zi4JMdRU3+cevCvT3cyVWKKLOXSPIHzhTG5/vQS/lMPOf2WfnB0
         FlLwD9oFu+S6iYEIHb89QIExVwdA74BnDEd5+OCRpNCKfmJzhFY7iKWisEKyDdglpzy9
         n7kw==
X-Gm-Message-State: AOJu0YzOJU4bm6HJxmbaRTNci6W1Y1deeZRODbYUztpI9FgI5CiJhWJn
	a9KFyNM5W1/QzKmiHrMPS0+ciA==
X-Google-Smtp-Source: AGHT+IHyBOhuCLLWI5zNoJDGwkWHOd0uPLZNmX/JMV6iPV1Fjl40scUz83EEuzFAtc3frOH5uhVXOw==
X-Received: by 2002:adf:e10f:0:b0:333:533d:9ce1 with SMTP id t15-20020adfe10f000000b00333533d9ce1mr6313986wrz.82.1702648379559;
        Fri, 15 Dec 2023 05:52:59 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id b6-20020a5d6346000000b0033650874594sm1677780wrw.48.2023.12.15.05.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 05:52:58 -0800 (PST)
Date: Fri, 15 Dec 2023 14:52:57 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	bjorn@kernel.org, ardb@kernel.org, arnd@arndb.de, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Han-Kuan Chen <hankuan.chen@sifive.com>, 
	Heiko Stuebner <heiko@sntech.de>, Aurelien Jarno <aurelien@aurel32.net>, 
	Bo YU <tsu.yubo@gmail.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Subject: Re: [v5, 5/6] riscv: lib: vectorize copy_to_user/copy_from_user
Message-ID: <20231215-583aa7503721723916a1819e@orel>
References: <20231214155721.1753-1-andy.chiu@sifive.com>
 <20231214155721.1753-6-andy.chiu@sifive.com>
 <ZXvxbbBWXqIy/05b@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXvxbbBWXqIy/05b@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_055306_671366_B229CCC2 
X-CRM114-Status: GOOD (  20.74  )
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

On Thu, Dec 14, 2023 at 10:25:49PM -0800, Charlie Jenkins wrote:
> On Thu, Dec 14, 2023 at 03:57:20PM +0000, Andy Chiu wrote:
...
> >  SYM_FUNC_START(__asm_copy_to_user)
> > +#ifdef CONFIG_RISCV_ISA_V
> > +	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CONFIG_RISCV_ISA_V)
> 
> has_vector uses riscv_has_extension_unlikely, but this is the equivalent
> of riscv_has_extension_likely. It seems like this should be consistent
> across all call sites. Since has_vector uses the unlikely version, this
> should probably be rearranged so that the nop is in the non-vector
> version and the jump is for the vector version.

I think I prefer it the way it is, where the optimized path is fully
optimized and the fallback path also suffers the jump. (I've also
taken that approach for clear_page()). Also, as extensions are adopted
by more an more platforms, and we start to consider switching unlikelys
to likelys, then it would be easy to miss stuff like this.

> 
> A neat optimization you can do here is replace the "nop" with the
> instruction that will be executed first. With how it's written right now
> you could replace the nop with the la instruction. It's just a nop so
> the performance difference is probably not going to be noticable but
> it's theoretically better without the nop. The downside of doing this is

I think I prefer the nop, because it's easier to read and maintain the 
assembly function when the ALTERNATIVE doesn't do anything other than
choose the entry point.

> that it seems like alternatives do not work with macros so you couldn't
> replace the nop with a REG_L instruction, unless there is some trick to
> make it work.

One should be able to use REG_L in an alternative since macro expansion
will result in the string "ld" or "lw", which can then be concatenated
with its parameters, e.g.

  ALTERNATIVE(REG_L " a1, 0(a2)", "nop", 0, 0, 0)

(But note the space before the a1. Without it, we'd get "lda1,")

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
