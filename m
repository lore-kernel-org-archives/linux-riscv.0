Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47222EFD23D
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 10:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAvVj0jjfP5MbMG0Y2CyyuX/Zu3iyBBcsiYGALo1rbU=; b=TfzUdzu9TsSW/8
	1sT8FYzDjlxDpDxSGd+TJTZ2vY9/YHJwbKv1nXYaGVYh9vY+RTbxPiwegkoWtxxmRN/fOMrInLkCH
	oTGCRhkPjNlG+2N737kMUl4NEgB4/RLECD+dEH819kr9qRIET+GgAYwJuq8uremgjoBfGxItu+ZQV
	sW4n07HeCR0np3pCAMDXWKGJeSO47o+wpt3jZIULoeqvVEEntlZvOsCZuCQatku/H7BmjvjLTUB5h
	2TKwAGlIp5jf0Elye+iZqexiHi2WFAQ0ujs2nMBwsthSRFb9uF24sHYMjSHmwRayOSLC4W3z/mS+V
	id8oFI2gBi4LizSCW/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCNF-00000003pc9-0zxT;
	Wed, 25 Feb 2026 10:44:09 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCNC-00000003pbX-2tyd
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 10:44:08 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-824484dba4dso4917115b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 02:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772016245; x=1772621045; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dOtyPf4DV0kGbhPpq+32kw+kEiZwwmgV8bS/8w37MW4=;
        b=UB3pF3qGZwr0CvEX4y2lwIMkX+NtfyfpmJ+m6z7cMcNK/VJvxAxJjae9rb3j1SeRlD
         09aX5R+hppu7X5a3s3WGCnVFEFe1kLlcJ529covHDFREIQ4cm28RY0C4hjq3Ynur6Luf
         F477knPuRcyLqeWYmcvhEFhRaEQiPbtz+nWrOAJPQn405quRlo9Fpo9rOGjGr0UbYRRg
         fgZxXD9vSiTeoCNDHJ2n15Jiap6sO3bhvvgyr8dVAxJKpCId1OC1+OdtzTVvmJHdlSuH
         4cqpdTRdVUzzPy+XwK4tuNirEMlifYEpxnFq2mW/vyQm29YTWY69HH2iRm3HKCDTEDL5
         XNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772016245; x=1772621045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOtyPf4DV0kGbhPpq+32kw+kEiZwwmgV8bS/8w37MW4=;
        b=GV2q74UxzqDy0c7NK4vgFxrBCm105Z2g1bl5cxKJUm8wO5KLW1QHW5OZfK9w61ndHv
         x4HxumWUe4vLCwLerAHm/p16T8Ddj6IBCDPS7ZhXXIuL2lDDWqSOLTiwY0q9TynvKwOJ
         eM2OPgfKdmJDEfjYjECp3/Apz8BdiTPoev2tDo/R+ZlztcM67W5kxrlaQ8OjNyBrWiHI
         ETZ56GmLKfAc9W0ljdJWIdr34CwxCPJebqZfr9mw+eXp9L8rJd7ActQtVZoQQvFZgS2y
         vNKKVMDQqOwxEbGR4+cpDZ1Hpven2TBAXFs49uoBkCTl62ZhM2ZfhoYe801q20RAWFpC
         oGoA==
X-Forwarded-Encrypted: i=1; AJvYcCVtNBdOPWs4VMhO56U5AKTKLc+qQDUxT+rwVnxUKZQUF6Tsue2AyHv7eKRLZrHUneITbs1mYQKLafWvhA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+acf/WGcUMLTYF9f8bizOygshURcM5Wnf82zQukW713SyxR3B
	6Y7tJ6LxIXy9+PstpKLOJi59PRyemp1d9oU3Mu3jD9i5pz1FCCy/+6bql4mlfPDA
X-Gm-Gg: ATEYQzzYboXMWvklFh/yLkP2xstuF2FaG5G3VS7fY2t+BWknZcoDCEolWehaMESvqhi
	+oep2T1juPZodms4gpzQrCZ/BJ9roAxLmCyqOro4ESQIr6HXs+mIkiGO7Ere6rqSGY+q3SUZbR4
	xvM1yRQVVxkR9AiY317g+eEJ3WD5+UpKJnEG7Bh6W0JrIwTVTyWbnm3m7K/rjetJ5TFmcWU635k
	i9zvD/Mcs5IVy/D5J0pRL/wC8USRXnC1ziyDfIdjMjQPYNXe58HGLuvgXkWh6hkzyZvwYagtwCy
	L1YFVdVl3dw1yju56RyS7vh1uA0sNLTYRU6lVi2ako0OkUDhilH2YyygjrqRDgA07uJwM6/0MXW
	7rL7VlaRBxKEJ+hz2tFh4yFZLcZbC39aGINXyv9PkC+yGFZh/NDcCLD5p8TdGNFxMR+MgpA0bwZ
	pZpqIsfT70ER/oUd2anz5iwg==
X-Received: by 2002:a05:6a00:b8c:b0:824:a4c4:3b3a with SMTP id d2e1a72fcca58-826da8bdbcemr14510549b3a.7.1772016245518;
        Wed, 25 Feb 2026 02:44:05 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd86c93fsm13820247b3a.38.2026.02.25.02.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:44:05 -0800 (PST)
Date: Wed, 25 Feb 2026 18:43:42 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
	Ze Huang <huangze@whut.edu.cn>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B
 compatible
Message-ID: <aZ7SHVTkDeES_r72@inochi.infowork>
References: <20260120013706.436742-1-inochiama@gmail.com>
 <20260120013706.436742-2-inochiama@gmail.com>
 <aZ7PLPFVnWjaBDpa@vaman>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZ7PLPFVnWjaBDpa@vaman>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_024406_753171_3DC77FAD 
X-CRM114-Status: GOOD (  17.01  )
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

On Wed, Feb 25, 2026 at 04:00:04PM +0530, Vinod Koul wrote:
> On 20-01-26, 09:37, Inochi Amaoto wrote:
> > The DMA controller on CV1800B needs to use the DMA phandle args
> > as the channel number instead of hardware handshake number, so
> > add a new compatible for the DMA controller on CV1800B.
> 
> Applied this manually, please check if that is okay after push
> 

Hi Vinod,
 
I have send a new version for v7.0-rc1.
https://lore.kernel.org/all/20260225104042.1138901-1-inochiama@gmail.com

Can you try it?

Regards,
Inochi

> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> > index a393a33c8908..0b5c8314e25e 100644
> > --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> > +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> > @@ -20,6 +20,7 @@ properties:
> >      enum:
> >        - snps,axi-dma-1.01a
> >        - intel,kmb-axi-dma
> > +      - sophgo,cv1800b-axi-dma
> >        - starfive,jh7110-axi-dma
> >        - starfive,jh8100-axi-dma
> >  
> > -- 
> > 2.52.0
> 
> -- 
> ~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
