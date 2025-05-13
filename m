Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3699EC3ABC3
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 09:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CjD9n1aMLUkvjcS1dXjjLkvLPgBNkVFqVBqYNkE+5Xw=; b=aNW89S4KCOSycR
	BL+yBK+J2DKlfWdVJRDnKMkp9O13UoUiJbCiKVMbFuhBrsmlW2XQSpbZDpD+I6zhHbNkqd8RoyrFT
	i7rfFgoQ12FKpknbO4NLdjLE+N8LsIMu1RcNHJ5SsbarInNYtvf6VDG4yJYuPJ0spGZL9N1y/kuyM
	/8DPdsbGlbzrO0/Hi3FTMTqNJKPI0JLcrRHq3DYZru/2vKc9DBiLEU8t5iEJHLTqweUkGIpISQUbh
	9XBXMNwsF6vatgslmNATMgxBglZGXA/JNa3FIrEW+VQ7vYW+z5d1OZLUxAPlfTUIR6hWT9vN4viqm
	v8krETin7QNFhVJXLgrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmJ1-0000000ByEe-3tj9;
	Tue, 13 May 2025 09:52:11 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmGo-0000000Bxi0-2Eh2
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 09:49:55 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6063462098eso3359381eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747129793; x=1747734593; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XnZockJ70/T+GtXsZfpPOO2eLVD0AecxOn25kqzU6Z4=;
        b=bRTl4bopMbug5Rg+hfddMvCKLUTjaDzPAsTme4fhf84iN3tEfmQ8g5rRqKMpeD1SXH
         lA2y+aqS46HNKRwbibKwOeJRByPEpPR0YfU3klwrB4CgoTX7wAEGLJtF6Qle4hrOy+Ht
         NZDTRSOv3rbKX12G/TuoGKQ6wWzaCD+yyLGnavCzTbNsufG1lVQM1bcH1l+CqfdwZa5P
         AOGtyFycFtqWLENI8CPbDOvdYED19f/xF9hst+PVVU7PShF/W+yHEMXRPdsr47C4Yzns
         E7lPny1C+SdjmUO9MsR8+QvDCfQRzmxLx17g6feBMa3Ts2tSJFg1AchHRVzYlL++LJGL
         5jiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747129793; x=1747734593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnZockJ70/T+GtXsZfpPOO2eLVD0AecxOn25kqzU6Z4=;
        b=HzEku3usEwx4xQNhmm1f4oH9RukBvqdwo/iN4u9MgryVk5b4z5dJUIVd1ssYW1bW0E
         GFU5rMIR+EGIF1ax6EepvUwD/fwaRbRoZqBwmfJsT1fNYDiJDG8ms7550UtQWmELCeeY
         TwEQFi2IjARULohcbS8ULEiLrsLEtnh9GM0IWsuNkJkyijmNz30vvUXEmsonLQ/DeBqd
         yTKOrIs24u7I94HaDScntvgQp+2MpdN9LuWnfsfqJFBQv9FdYC+8mVRcHBJ2qkxkQcgi
         sFDmf03NiIaDphGPDPKpYsndJk813QbGY34AqbEYRL0N2uBp+r3MXqdvEf8t0xAubZYU
         6a3g==
X-Forwarded-Encrypted: i=1; AJvYcCVhTVr742ABT4r1RsYzToT9nEuy21UptSxTi1mOtM0AavkdwL8S4E46+bQyDHwf0bXOAkYlo87QcUy/AA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSa065cy+69tetkNpWh8YQya3B9bvErI/MTXeBas5YG046Jej9
	o6/N9/ETGFhOnQGzKaX4lGTN+w9vq8wJbCcWI8R2SK5PAucyqw2vPPfB1A==
X-Gm-Gg: ASbGnctGQK329JH4viUpO8XFQ/mEQQOTk/cCoaoPexxz/nGEXB213UltYlepGMxfjvd
	/SBn3HaKa8NwRmK+L45c5AhqHM6iS85zb+zjFcOnrLih15ILXvvTe+556zzu0xVx24XYM07xg/3
	A6uq5gIiltnWVirYtSBNLD8NXvXtEz2wWinBu1L5dnxs9eRdR/rjFCl0D2DruPI20GKinIjiJ2Z
	dk/oyvrNK2hs3F1Jt1T/IYtIB+xUJThKvueVumSZaBOyDhq/fzBZRPw47uknNYcu6Bxd/PtzyNz
	9U1I/8KxfrpaADjxdM2SC9HUlIE=
X-Google-Smtp-Source: AGHT+IFfVzrPfmR9lhEtNYtojZqrinHsEnhJ2AYCSsKT7gOS5sntpmd7YHRO4LY0VUAQsGIuQN0HTQ==
X-Received: by 2002:a05:620a:5ecc:b0:7cd:145:d652 with SMTP id af79cd13be357-7cd0145d750mr1574381485a.12.1747129782941;
        Tue, 13 May 2025 02:49:42 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00fe6dc4sm691084985a.90.2025.05.13.02.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:49:42 -0700 (PDT)
Date: Tue, 13 May 2025 17:49:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, Chen Wang <unicorn_wang@outlook.com>, 
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: riscv: add Sophgo x8 EVB bindings
Message-ID: <nrtzltuus47rjds3x54e72mtflvjh4najyqdjnagxq5etge5e7@vkikyxa5zf6k>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
 <59c175c7bccbd4b5ad241c39b66b0303e0facf81.1746811744.git.rabenda.cn@gmail.com>
 <MA0P287MB22621824B2FD5E2A64006174FE97A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki9=ROP47hsugf3BS1nXr9oOPHWgjQoGfjAZiwHnXS19Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAT7Ki9=ROP47hsugf3BS1nXr9oOPHWgjQoGfjAZiwHnXS19Pw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_024954_576418_75BA9836 
X-CRM114-Status: GOOD (  11.58  )
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

On Tue, May 13, 2025 at 02:48:44PM +0800, Han Gao wrote:
> I hope it is sg2042-x8evb.
> 
> Sophgo is also making EVB boards for sg2044.
> 
> I think a distinction needs to be made here.
> 

SG2044 evb has a formal name like srd3-10, but I think it should
have a sg2044 prefix. as the name printing on the board has a
sg2042 prefix.

But there is something needed to be checked, like whether the "x8evb"
should be "evb-1.0" and "x4evb" should be "evb-2.0".

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
