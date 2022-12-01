Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BDEC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 17:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGx7+n1wZIituOxwc6SSGNmZpAo/7rY9isS0S/DRiBI=; b=Mqb/kIVDUhTt+G
	vZOkFhLcuLe/H9rDAg7ZXWdLqrM0X5xDfDOR0nWx7yYdpv68Uv+pWic/49cZ++5VwjWtUKteZYWut
	QedNfsVzMhtMzlFzzCm0mNX7GAweXK4annZ3+S42UOzcWF4aM6QuJrj5amaCEEIvzNPT6+uLuOWot
	3luTm85xspThjYS5v8MHnenEiw6p3/gxsa5sJWu3znQAkUu6l2hFBjrEcqJRBLqTVjwq/x2YxusG9
	lgdccN5lF/R/FH1CicYygYbaadJ0Y3DCBYGOD5X1LVkl7QyVmVUPt8nn10oWah8MSLZnDGD+yXp/7
	LDOTEu/xwKdzauKd5zIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0n0Q-008oNI-9e; Thu, 01 Dec 2022 17:05:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0n0N-008oLO-Br
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 17:05:48 +0000
Received: by mail-ed1-x52e.google.com with SMTP id z20so3164479edc.13
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 09:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oP1QP0YWS7CJi46I4+pKFvIESUxAUWHyU41+Tg9Gm9s=;
        b=m5v6kE1rY8s1X+MJt3aXSmMNlzCHV8mrPgaShkNqLp1G107XI1WTX0Ae8U8m15u89S
         BXTKItTRXGFcJJn/93mSkh+wT9d31lf9DbuVL2r4VncUHWtwUty5xKalGonxnhQI5YwC
         bA35Apk6NX5y2sqgPXv0ZKtWtiT+ulLcJLeSyoo270GPZimE4GULh33wVMTDTIx9RbWA
         AG7isSxb1CIW3hBHz4uHSgEBRPpurvwe7teAU7/Fei4n9L0JlvYdwGKNiKE6WSvpamWJ
         2NB3mQXEQYPFboNxJP7bPRxkTrknW82ZUS/e7Rp51mWN0FGPi9OT1QCG46GEKyvm8QPK
         IGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oP1QP0YWS7CJi46I4+pKFvIESUxAUWHyU41+Tg9Gm9s=;
        b=4LR6ly8nMvRQeVo8TCftrp7LaqcSrjgtuf7KTOTD9bxeLNqUpR29tVRVQmRmKy/tvC
         QQ3slEVqs1wU+ER8Sjx1EtVqEIMaHXQvDOX8K5mBH3GBaTdHT5S30TXCceVvwpXdrcwC
         zS90AYKPkjE7no5qNjHnOYmYb8dEIakTjO/eLlOKqG96JBXfYgRsMrIOZZMtE6gD1rjW
         XJ8UdGs7TFUF/lslyGdgulHGnBVVCZ4U1McW/crqCI/qHcaEmlPTc84dSMj2u27SzU1T
         QeulPnicVuSr7u/7uSEoXvLky1megqtdUPb++oGKzuw3qb9TYWq1PZXeXeDvpoZc6HHI
         1HWQ==
X-Gm-Message-State: ANoB5pnmLC1ThrcdAIzQxcUpKEwaLP3yLXsrwrRrWSY+3gRy1ZIPs2po
	Cz1wAqjEXf8f88ZwmpAchsHMMw==
X-Google-Smtp-Source: AA0mqf7+sI9sLhanwztWdOBJS0j4o122YNTmOn8CyvzYajpd4MdvKZw+Py/BaeQRuCfXzGWbp3EP8A==
X-Received: by 2002:aa7:c986:0:b0:46b:b010:3f43 with SMTP id c6-20020aa7c986000000b0046bb0103f43mr7915943edt.215.1669914339759;
        Thu, 01 Dec 2022 09:05:39 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id b17-20020a1709063cb100b007b4bc423b41sm1934395ejh.190.2022.12.01.09.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 09:05:39 -0800 (PST)
Date: Thu, 1 Dec 2022 18:05:37 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com, ardb@kernel.org,
	linux-efi@vger.kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v3 01/14] RISC-V: fix funct4 definition for c.jalr in
 parse_asm.h
Message-ID: <20221201170537.mb3o6lybg25muf3n@kamzik>
References: <20221130225614.1594256-1-heiko@sntech.de>
 <20221130225614.1594256-2-heiko@sntech.de>
 <20221201170023.tocmgewlwjrc7t6d@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221201170023.tocmgewlwjrc7t6d@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_090547_424508_B3E2D3A9 
X-CRM114-Status: GOOD (  21.46  )
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

On Thu, Dec 01, 2022 at 06:00:23PM +0100, Andrew Jones wrote:
> On Wed, Nov 30, 2022 at 11:56:01PM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > The opcode definition for c.jalr is
> >     c.jalr c_rs1_n0  1..0=2 15..13=4 12=1 6..2=0
> > 
> > This means funct4 consisting of bit [15:12] is 1001b, so the value is 0x9.
> 
> I presume kgdb c.jalr stepping was broken before this patch and, if so,
> then we should add a comment stating that and also
> 
>   Fixes: edde5584c7ab ("riscv: Add SW single-step support for KDB")
> 
> and maybe to help keep me motivated :-)
> 
>   Reported-by: Andrew Jones <ajones@ventanamicro.com>
>

Oh, and,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

> Thanks,
> drew
> 
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > ---
> >  arch/riscv/include/asm/parse_asm.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/parse_asm.h
> > index f36368de839f..7fee806805c1 100644
> > --- a/arch/riscv/include/asm/parse_asm.h
> > +++ b/arch/riscv/include/asm/parse_asm.h
> > @@ -125,7 +125,7 @@
> >  #define FUNCT3_C_J		0xa000
> >  #define FUNCT3_C_JAL		0x2000
> >  #define FUNCT4_C_JR		0x8000
> > -#define FUNCT4_C_JALR		0xf000
> > +#define FUNCT4_C_JALR		0x9000
> >  
> >  #define FUNCT12_SRET		0x10200000
> >  
> > -- 
> > 2.35.1
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
