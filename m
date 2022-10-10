Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C31CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 07:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GXQkPTzVudJRQn1UCXXZOCMm7O7vZ2A5caVN5PwOn4Q=; b=tn3aFqJUk/T2Nk
	c5bTCUpwg2HzI0qC9EybLNO1vTMzog8VIzpM8rHbxD9u/jCRJR7Tzin/z07aRWTPjuLZzDI87nrUl
	8BcK8vUNMMizVqNhnZt0m7zODjsLCIbCp5R+3S5qpdiM3RVBmYycQptkkI7nINOaOo2aA8v2xp5dT
	X8fQM89AXYYG28jGXdFbYGcQhjHvW70bec9HXA6LJHR+gfYI8FsY2YdptBSeb++P9Uqh7boNgiBqC
	NygikQJdtPaLvVisZZlZC3GD10U64J2rZqsCHHtxSNtAWZ4HVq7j2NWg/x+zA/rpSK5FZzCEIbFhM
	8K7gK1W24y9ku4PSiMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohmlY-00HIoF-S3; Mon, 10 Oct 2022 06:59:56 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohmlV-00HImI-LP
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 06:59:54 +0000
Received: by mail-ed1-x52d.google.com with SMTP id z97so14602913ede.8
        for <linux-riscv@lists.infradead.org>; Sun, 09 Oct 2022 23:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a1fp9+rKdmUuY9SWEnGxIrNFPj6sCTeRm1jad3ZuU2k=;
        b=FqrGflI7dLXRUElNttQgSWoongr4d8SuEdNC1fduJnVRmwF7qBcfQVFzWid8PMFt+s
         7RqYMvKsPB6GRY/URbX18HMMxazMGYmo2e6kxaqeoi5GesaXhlmxx+N+g1kNAmbczspz
         cGB/PNdhsdJsnzmCEBtMlExsqZ0GQPYU+8pAuj52cRHXqBkpDda2Sj+9fUOMSwYbGNFl
         yLlfy+9767CpJ4Q5wNkXn6WlHi9dVVsRk6LNp1RB1QyUHW2qg2eSerenIa/NX9e0OBQP
         dGftZ/Enkr+aZ+5HG1dOZ7kA2G6h7ORDqQwB3Gsy07ZiW6uO/qRRJ+yaXMfwhsuuL/wz
         8/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1fp9+rKdmUuY9SWEnGxIrNFPj6sCTeRm1jad3ZuU2k=;
        b=URpnMf+V8RUP9rcoD2Gx8McUgxmLyC42p/Rp9VO/RQ5VITIaqH1ZbHNIG2fPp0hHmr
         sORzAhoG5ig2moP+o2xfYQwizgEm/O9KxU2gb2F2QFYc3ap7r0GOiiGAaxDDmRl9cob3
         EWvdWbwYvNgWNM87LWcgpAAUjCCSlhmDkzN8C6U68S2M6Pjq67wa9rZl9VOtUadfFsqq
         EsWTplqdaIGmd+rwujNxxM5yGTE2UYdPCcmelAKQLE1zNIuJFwmjhYiy6p7tk0TuLuXQ
         dGuOy4Zu1lGHcgiMqS4mCMLixoOQvaX5CNbacgdurC52OdYGZ+I+sbn+u3ZolVTe/Iym
         6hPw==
X-Gm-Message-State: ACrzQf0V1/bJPVU/y6VRd1VTKZ3N/p9Gc5cZ0o2gO5GZfplxEt/3qvGL
	jQi/jrKDQUYMPtQRflXfMRygBA==
X-Google-Smtp-Source: AMsMyM5iAaOQ7Q85SCGa9a1GKDPTYFqnf6CENRfzpNWykMCCmv5ldmO3+wQqqF2asmYJsnnE3P9hgg==
X-Received: by 2002:a05:6402:5106:b0:45c:2c80:94a4 with SMTP id m6-20020a056402510600b0045c2c8094a4mr2002943edd.298.1665385190546;
        Sun, 09 Oct 2022 23:59:50 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id m30-20020a17090677de00b00779cde476e4sm4898631ejn.62.2022.10.09.23.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 23:59:50 -0700 (PDT)
Date: Mon, 10 Oct 2022 08:59:49 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Vernon Yang <vernon2gm@gmail.com>, lkp@intel.com, anup@brainfault.org,
	atishp@rivosinc.com, kbuild-all@lists.01.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: KVM: fixup undefined reference to
 riscv_cbom_block_size
Message-ID: <20221010065949.is3kf54ctt2kdmjd@kamzik>
References: <202210091222.xuZquaM9-lkp@intel.com>
 <20221010013329.199167-1-vernon2gm@gmail.com>
 <Y0O+vEC3/fnUKgxw@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0O+vEC3/fnUKgxw@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_235953_715730_7759DF03 
X-CRM114-Status: GOOD (  22.13  )
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

On Mon, Oct 10, 2022 at 07:42:04AM +0100, Conor Dooley wrote:
> On Mon, Oct 10, 2022 at 09:33:29AM +0800, Vernon Yang wrote:
> > When some RISC-V compilers do not support the Zicbom extension,
> > the build system auto disable the CONFIG_RISCV_ISA_ZICBOM, so the
> > source code of the relevant function is not compiled, resulting
> > in the definition of the riscv_cbom_block_size variable cannot
> > be found
> 
> Hmm, my understanding was that riscv_cbom_block_size was not supposed to
> depend on CONFIG_RISCV_ISA_ZICBOM because the thead is able to use it
> even if the toolchain does not support it.
> 
> The code in cacheflush.h looks like:
> extern unsigned int riscv_cbom_block_size;
> #ifdef CONFIG_RISCV_ISA_ZICBOM
> void riscv_init_cbom_blocksize(void);
> #else
> static inline void riscv_init_cbom_blocksize(void) { }
> #endif
> 
> #ifdef CONFIG_RISCV_DMA_NONCOHERENT
> void riscv_noncoherent_supported(void);
> #endif
> 
> It's early and I only had a quick look but I think that this is not
> defined because RISCV_DMA_NONCOHERENT is not defined, not because of
> RISCV_ISA_ZICBOM.

thead is able to use riscv_cbom_block_size because it does its own
initialization of it and selects RISCV_DMA_NONCOHERENT to get access
to it. KVM depends on the initializer in dma-noncoherent.c, which is
guarded by RISCV_ISA_ZICBOM and does not select RISCV_DMA_NONCOHERENT,
but RISCV_ISA_ZICBOM does. I think guarding use of riscv_cbom_block_size
with RISCV_ISA_ZICBOM in KVM makes sense.

> I'm not the KVM maintainer, but I dislike #ifdefery
> in c files, so it'd be nice I think to sort this out in the header and
> not have to worry about guarding the variable.

I also dislike #ifdefery, but unless we move riscv_cbom_block_size to
an unconditionally built file like cacheflush.c (as Anup once did), then
we don't have much choice.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
