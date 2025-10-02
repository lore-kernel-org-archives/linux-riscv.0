Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7BBCAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 14:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNeuVGCZZElROkuPwUu8eD+S3e0ki9Qn80EEYmfYkz4=; b=KrsB7iGXZn0XK1
	6uNmgUlYw9WJms1u+m3ukWt/kVq63Vn3QYJxp+glGCYxQupyO5OnnQ85GWwoKRypmgktUQx3oMq+3
	lXbGSem5CcZMVqCGu0jurttK99ucHJxxnRH198ILkueaMoQ4GU+RbgsEDnK2XFya3wsTH4VNwBa2I
	F0iVV5Qhe/s85nS7E44jIwBN1tAj5rbJK4G977iBU5bwQ4QKcZ/TU+9MQm+wMDI87qOSNuMUX6Exj
	ouuGwyu6gQsB0SPhW9YRO8KDuJJJkqqBRqRXd7BUOkm+GgqpQdPklxSb3Pfw2c8QYrd33J1mv4OGL
	OTU93XA5RQgEbMOR/qaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KeY-0000000Af7j-0Tay;
	Thu, 02 Oct 2025 14:51:30 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KeV-0000000Af7O-3dbu
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 14:51:29 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-9032edd72c1so114487239f.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Oct 2025 07:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759416687; x=1760021487; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a75BPz7d2o5E4jevAPn308DaoxgcUyHxuIQu1GQCLHg=;
        b=nqRWV2fYAI1laXfdgenFpEKK8wd+mjjSZE2z2Z4XCILlxg+L3NE1k+HfKzHKp8XFxZ
         JAASNsRPZPIFATG9iU2rw4aVxPxKjFLKWmKP3IiRGXj/2alKbUk3w4fJuNyU84fEqTiX
         JuYIbruBUxd+Ab3rtMTXXhUJKTYHgYgJZH9ZGOhszIL0hgfBO0uM7RDDKHwm3W+ONYU+
         gq/gWTIiYaQYbOlgnUbr+LCrYpw7758K1WxU3+6EXoCiKGMhLMEItoUMAy+K4okArW5b
         YSoYdYkTZjB/krPoQ0X9MK5Mz8UtbInGXe6FC7w2R7e/SUs4NDOHGOYH9qwjTms/fp/G
         HN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416687; x=1760021487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a75BPz7d2o5E4jevAPn308DaoxgcUyHxuIQu1GQCLHg=;
        b=QI+dPsk37U+pC54UkE1OhF7E7YIQLJNf+zOgd35uHFc4AjEbXEni99MTisLzPTqNyQ
         ShhQF6p/WQK/rudaZVaf0MiHW+XA0F/jL/AU7/6GXwVtVUvEeu2PgFAWu3OQpgkUcg9E
         0WSQiLasjs3VmRsrYM6UhmRnXwVyLn2XRk7RKb02gUU/GuzmGlpz63s1MO7JVjCH6+/4
         ML4wbfXdDYUMSdyOEDdm2LgTnOzRgtPTy79CoYJu9f5C0bSRrWkpGhgMyjLlTgaFc8fl
         2kRbIGzlVwFA60KTFoNFOTb4xF1IknG9lNcG2bCkZNXSECxB3BdKLa/S06K4WQuww4cK
         u85w==
X-Gm-Message-State: AOJu0YxwDacpTe6CvDeLk2D2u9hmr4oMuiFAUDrUEI/6DorD945GHAws
	58dB4QWlwkdMA3ueD78o3HzK7UtXIijiRIiOpQPI1sN/Mgm74hbL4BxatPO3Z3d4ZKk=
X-Gm-Gg: ASbGncuTkiApYpirqGL+m1k0eizCMtCqplVfMBQXESsSPhRpymcrue9d0AccRXtvFnA
	N+Q2cC+bEHa3ZbIZwPbfPhsvkiHa/mMzbIFiQVnU2YvHx4dOZtA823NORdCHQNZR0b30cmMS6Jd
	HTUBzm12fvfWB/aiPIG31RbnEuVMZUFO8FvCfBkHSHW3gf6ZZd8TttnIXiODzjfazN80VB7FbJB
	nPTAFxVMQrQU2jTkVHEIlISwYlNhKsGzvLXkhuLGdHqBY1H2QYh2icvtJiArh53Ja1tPbTmH0DP
	oVFVF5p7EnrnRYd9qc+f4/MvNcuGqhRBgkfZttqpbqMRn2KOulFGclygG8eTg31QXu9CX09w6ek
	Pfis96sKva694+KVCrR8qYEn65mC9F24PvI9pLvL988ku4fue
X-Google-Smtp-Source: AGHT+IHDDIb1KblB8BmU1SbQn8RsCYfhzX7mXwvAi0MRBQmtCVbnAbzudoaDbI4xe+MOIkwKwoWdMQ==
X-Received: by 2002:a05:6602:1482:b0:887:773f:6c89 with SMTP id ca18e2360f4ac-937ad4ae875mr1113875039f.11.1759416686800;
        Thu, 02 Oct 2025 07:51:26 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93a8912c237sm89563639f.27.2025.10.02.07.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 07:51:26 -0700 (PDT)
Date: Thu, 2 Oct 2025 09:51:25 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, -linux-kernel@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
	Javier Jardon <javier.jardon@codethink.co.uk>, Ben Dooks <bjdooks@gmail.com>, 
	Lawrence Hunter <lawrence.hunter@codethink.co.uk>, Roan Richmod <roan.richmond@codethink.co.uk>, 
	Sam Grove <sgrove@mips.com>, Chao-ying Fu <cfu@mips.com>, 
	Mukunda Aprameya <maprameya@mips.com>, Umesh Kalappa <ukalappa@mips.com>, 
	Djordje Todorovic <djordje.todorovic@htecgroup.com>, Kurt Martin <kmartin@mips.com>, 
	allikarjuna Gouda <mgouda@mips.com>, Vaibhav Chauthmal <vchauthmal@mips.com>, 
	wapnil Agrawal <sagrawal@mips.com>
Subject: Re: [PATCH 05/18] riscv: asm: use .insn for making custom
 instructioons
Message-ID: <20251002-c06f1cdf287f9e00c3674942@orel>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
 <20250822165248.289802-6-ben.dooks@codethink.co.uk>
 <20251002-8cb00cce2a2bc7274b3ad503@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251002-8cb00cce2a2bc7274b3ad503@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_075127_910245_BDC8A49D 
X-CRM114-Status: GOOD (  21.14  )
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

On Thu, Oct 02, 2025 at 09:45:05AM -0500, Andrew Jones wrote:
> On Fri, Aug 22, 2025 at 05:52:35PM +0100, Ben Dooks wrote:
> > Using .word breaks with big endian builds, making something which
> > is not a valid or worse an instruction or pair that does something
> > which is not intended.
> > 
> > Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> > ---
> >  arch/riscv/include/asm/insn-def.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> > index d5adbaec1d01..2a3019bc1a3b 100644
> > --- a/arch/riscv/include/asm/insn-def.h
> > +++ b/arch/riscv/include/asm/insn-def.h
> > @@ -256,10 +256,17 @@
> >  	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
> >  	       SIMM12((offset) & 0xfe0), RS1(base))
> >  
> > +#ifndef CONFIG_AS_HAS_INSN
> >  #define RISCV_PAUSE	".4byte 0x100000f"
> >  #define ZAWRS_WRS_NTO	".4byte 0x00d00073"
> >  #define ZAWRS_WRS_STO	".4byte 0x01d00073"
> >  #define RISCV_NOP4	".4byte 0x00000013"
> > +#else
> > +#define RISCV_PAUSE	".insn 0x100000f"
> > +#define ZAWRS_WRS_NTO	".insn 0x00d00073"
> > +#define ZAWRS_WRS_STO	".insn 0x01d00073"
> > +#define RISCV_NOP4	".insn 0x00000013"
> > +#endif
> 
> I agree we should use .insn when possible because it provides validation
> and allows mapping symbols to identify the words as instructions. So ack
> to the change, but without adding a depends on AS_HAS_INSN to the riscv
> CPU_BIG_ENDIAN config, then the commit message should drop the reference
> to big endian for its motivation.
>

And Patch14 of this series looks good, but it should be squashed into this
one.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
