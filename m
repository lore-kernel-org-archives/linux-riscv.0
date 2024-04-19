Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B68C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 14:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwMkPaUVjKd+Rp7yXAMj7iWifwU90oqfERyT1q6pXWo=; b=PZbbXF680xuWzx
	PSzh6xlAk9WKozF2euCxxGHemlKn/kZmJCHS/rWXP/wF+VgOjQd8hXYD5bBu7uf1CE2MmIOHw6hSN
	V2bSAZFLuhhnXmRYfV5FH9b2YnNPlZWdaDYRlvVFVV+aSkWl5IwcnVjBQJsMJu38gSAxgUD+1o3Mj
	nR2e0QSlj/o3V7Cm6J7GmTGNHmko9jRDpvMdl6rXGomFcU0/kmH6m73vYye6Y7ZXc5WmPOpzq1ErO
	TQb4JL13S1tRXuEhhpmnKntbFyvXHjrlv0jGF5SLaQPint88uo42uP69Gec55+hR2tP+NrVW8bzTm
	ANNpKSclUED5qzTfTiXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxos8-00000005ss7-2r9g;
	Fri, 19 Apr 2024 14:05:48 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxorx-00000005soa-3dk0
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 14:05:47 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-516d6e23253so2494714e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 07:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713535536; x=1714140336; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jcZX0iTbIwoiKUb5BggVBNG79MAfC9FpmndZpC+sJGE=;
        b=FnlerPS8jR0UYpboDgQiWrLAWL4rVFTcLMnzSdpH27dC7PPUJ/29I43vQjda0oJZGE
         AgkCRimzOwzO5HXhL84rXLvziJtLKiHtL7GEOqfrleR2tPlB0PEptlnpc8J7UeriR6+b
         O6Fmhuscuf7LypCqyfoOVQMR3/TpkDdVTYQNsN+qO57VuQXKuN8tBc+EoDD4TvSe6ORQ
         NZ3K7Qq69y52UmOJi3xFLqHxMGdNtZpP/QfPS1IzInIrOAQCRpoenq77VTcCrd/VgOxy
         F7QMFI02RXlkGnQjCTHBTv+tIjpInxo9VkKsmI7DGL83BqM+gAmA3weKtl3M3kaerBII
         0Ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713535536; x=1714140336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcZX0iTbIwoiKUb5BggVBNG79MAfC9FpmndZpC+sJGE=;
        b=EJQGo1U4691ZDIhGZrQu9w6+ADneO1mFpgobsnhO9Y/SVZ510LvmY8lH/Q0aW8/tfn
         71/Fl4W4pwH1rw+LZXOVa4jTOkSvV5oTn4Bwx+GdaOmdPGnlS47aw5CEsJUPGv7+rHC3
         N/5vsv+mzbewonYwFxM6tf/r0HQb9cwhgdaKcw9rVhCtMgiJwKMQwVLfrTxsV/oyFM9k
         1LOcpjvXN/kmTY7HMxMSnaWdp7RXvnM1zfDTytVhMrL9Xyw0sCPjlfhRbn/G7laTUkmC
         ZaMRYSHgAIP9ep1MnmigsmuVyNx6yap3reTbMZU8WYJJo25Wa5YHaL1KH3caeSPtyyz4
         G+Vw==
X-Gm-Message-State: AOJu0YxoSer1uREf59qbkyW3fVPj6ImKHGyHiPskHGkCAADEePjHB4G/
	JtQLOXPBjvLiWGccvThCKRAVX0vvyycvVg1dyYnpFUkNjf4amYnaMrpfX19rZuY=
X-Google-Smtp-Source: AGHT+IHs3qlXn7Awn9fZxIK3le0e9UTgAGysw6UwaUwZMzdcqQR0qEL9rQ2VUMMj5fKP5f+/lKDjmA==
X-Received: by 2002:a19:5f07:0:b0:516:b07a:5b62 with SMTP id t7-20020a195f07000000b00516b07a5b62mr1875404lfb.54.1713535535583;
        Fri, 19 Apr 2024 07:05:35 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id nb33-20020a1709071ca100b00a55778c1af7sm1854476ejc.11.2024.04.19.07.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 07:05:35 -0700 (PDT)
Date: Fri, 19 Apr 2024 16:05:34 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Pu Lehui <pulehui@huaweicloud.com>, 
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] RISC-V: clarify what some RISCV_ISA* config options do
Message-ID: <20240419-b5dbe7b133a749afdc0af416@orel>
References: <20240418-stable-railway-7cce07e1e440@spud>
 <20240419-ea2b867f6bde90e711464c95@orel>
 <20240419-excretory-dwarf-ba817cc725ea@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240419-excretory-dwarf-ba817cc725ea@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_070537_933793_8F342264 
X-CRM114-Status: GOOD (  30.41  )
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

On Fri, Apr 19, 2024 at 12:06:59PM +0100, Conor Dooley wrote:
> On Fri, Apr 19, 2024 at 01:01:52PM +0200, Andrew Jones wrote:
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 6d64888134ba..c3a7793b0a7c 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -503,8 +503,8 @@ config RISCV_ISA_SVNAPOT
> > >  	depends on RISCV_ALTERNATIVE
> > >  	default y
> > >  	help
> > > -	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
> > > -	  time and enable its usage.
> > > +	  Add support for the Svnapot ISA-extension when it is detected by
> > > +	  the kernel at boot.
> > 
> > I'm not sure we need the 'by the kernel', since I guess that's implied by
> > being in a Kconfig help text, but either way is fine by me.
> 
> I think we do, given some of the options are required for userspace to
> use it and others are not. Distinguishing between them doesn't cos us
> more than a few characters so I think it is worthwhile.

I agree we should ensure 'support in the kernel' type of text is present,
but here we're saying 'detected by the kernel' which I was thinking was
implied since this is kernel code. Maybe we should just add the 'the
kernel' text to where the support is rather than where the detection is?
I assumed it was left off of the 'Add support' because Svnapot is for
S-mode.

> 
> 
> > > @@ -686,7 +687,8 @@ config FPU
> > >  	default y
> > >  	help
> > >  	  Say N here if you want to disable all floating-point related procedure
> > > -	  in the kernel.
> > > +	  in the kernel. Without this option enabled, neither the kernel nor
> > > +	  userspace may use floating-point procedures.
> > >  
> > >  	  If you don't know what to do here, say Y.
> > >
> > 
> > Zicboz could also use some clarification, right? Or is the fact that
> > RISCV_ISA_ZICBOZ enables the use in both the kernel and userspace the
> > reason "Enable the use of the Zicboz extension (cbo.zero instruction)
> > when available." looks sufficient? Maybe Zicboz should follow the
> > "Say N here if..." pattern of V and FPU?
> 
> Yeah, I think I just overlooked Zicboz. If the kernel option is needed
> for userspace to use it then yeah, it should follow the same wording as
> V/FPU.

Actually, never mind. I was thinking we only set the envcfg when this
config was selected, but that's not true. We'll set it whenever the
extension is present with or without this config. So I guess it can
follow Zicbom's pattern.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
