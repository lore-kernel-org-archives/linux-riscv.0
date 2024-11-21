Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74276D75BDF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 09:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJDraMB+OAwqNz13VK8Dnr4g3zM6pf5RL+/HF2dZ4MQ=; b=SuQueIOYJYYmu/
	1dgVhnSMdws+rdu9yW6l01ljI1IyadR3OTbQZ698U8Clz+GpufUXqBlOGrX87xQNAn40bfEua+sVT
	Bg0eOTZsuvyvcwazO1Y8TLNLvOpd8nX6H/UuLhGlnivpZQ++M5fkU8+jZsCWp633ZW7V9pSynvUeP
	yjC1PZ7qIo2CTLvbnkZVNOt03wKrIkmiVVBPq8KWFFkYkS0WbdPZD6akHHEmDVz2jvmkKmo4ZByqL
	RAkyXX+XbaZ0jxoFVGeogdSriBmfuDH257KS9bMYDRnTQiYVW2wxDdrOhEB12f+kafALBt9xVe0eg
	COw6P6J/M/YIGNxkd1lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE3YB-0000000HFtf-42AU;
	Thu, 21 Nov 2024 09:32:35 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE3Y8-0000000HFt9-2o09
	for linux-riscv@lists.infradead.org;
	Thu, 21 Nov 2024 09:32:34 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53d9ff92b14so667685e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Nov 2024 01:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732181550; x=1732786350; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=opuzTjYFnx1shlOWe4vRrTVSSc8AtRFFWZgXJNFD7tA=;
        b=l/z3SEV3hY1/wIr63UD5AYUYkykxpIFLbA3+U6r01MtX66Lxyipzfs9NwA+IBcZwBg
         1cEKimB/Gpvy3jp2m9QevCJdE2wHv9Z062Qv23yL2A/Epi85GtOkLsPPtK5wQNtp4NGB
         gmZzLLnu3K7LtkYiX6MGPPD2DdTGTR/J/cbn0+ekQnB+k5XoyWOxNOqCvxVN0sOPA+Up
         qaFWA2oqm0mZDZ/GeoZV8OZnni9sxEh0rBTayQQNhZ7mcRmdUncn+jNEP4EIH5/Dm8OL
         kzqLWCY9huO8gtFfBNQO/m++aGMB4acybJ6zQLKXPtYZUQavfNm/04IP3Qfd3ebaePcu
         sHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732181550; x=1732786350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opuzTjYFnx1shlOWe4vRrTVSSc8AtRFFWZgXJNFD7tA=;
        b=tKGCyuIbQ2k9AxSbNoR0HhpTq0lTP/JyUcXTmFpEyZCkm2SdGTvPpYnm8zD3pVG4mg
         QRWzOSI7nYGkOJgHiwmyly+8wdQlK4y/V+eBg5k6lbwvKWMum1D1BGT46qutoYhoYHnt
         owV8ROpdkTa9N7O2bvnHyT6xQc1yQ+DdGpSPw3d5811Up/pXCGQ2jUCYNbOcMvvjqcFi
         9T6/uzGFwYo/dsPpj64ocoDCQHpmJxO6YkLe9R2Vk5ZyiJ4mgDp26fEgWSzHIHvCXQlO
         JdNYQ/gi1owUaW55zXe9A869/hxvWFEiexzrQ73eHXpFTmIR1cgRN3K/fcxwWJd5/Fc1
         7ebg==
X-Forwarded-Encrypted: i=1; AJvYcCUDvNfQL8x05yXdNixM88O1YCJALg2zkiyiKOjb6T35kq2fT0bpjMNaugMST1h4EyOUlMDBErInoYYZsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0iaqOBCeiMQY9aoqQCVqYc30M4VfsjWLCADWVLaIkRZanS1UY
	djdwHZItr8RUDneYKHHOwL93WgZzWJtYNNqv1cRNgS5Hm+mjZjHsIk3fmupHWWw=
X-Gm-Gg: ASbGnctkzvmjeJVCqkWWF0zzpPER3dDKFUBTOWowpZaJqyEfLa9CAo4R56YOViR669R
	RveICmWYQZePiAJnyrQzGc5aJvvhsRWuBzUH2SMGrNjBgkbpA6VcL+WXKNqjpiNnhbJB/N4Bqm0
	/tPXF7TmEx3c7rRDZCcQlYyszNNfJ02bHyqEkkpLX59CQu2BdWk5tyk74LYRZdb3hM65PKsmTc6
	qjsmCcxhIHm/a13N9c5po34xslNsazWT6DsuLAH1EE7n5w0CHDjSWhCOUiOHd+9fXuvOwJqI/0w
	iJgZ5A02giCAsBoyUV/UEvn5aaK0kheNIRo=
X-Google-Smtp-Source: AGHT+IFL59TB3m783wVOF4vRiqRGMGuRzNrlKCikLNXG8Aeg3JjXdtpMhMqy28LdyLbcgbMlwO5A1w==
X-Received: by 2002:a05:6512:2316:b0:539:f9b9:e6d2 with SMTP id 2adb3069b0e04-53dc136715emr3144849e87.35.1732181549734;
        Thu, 21 Nov 2024 01:32:29 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b463abb4sm49876175e9.31.2024.11.21.01.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 01:32:29 -0800 (PST)
Date: Thu, 21 Nov 2024 10:32:28 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: Call secondary mmu notifier when flushing the
 tlb
Message-ID: <20241121-e97820f8c09de9bcedfe885d@orel>
References: <20240328073838.8776-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240328073838.8776-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_013232_709035_B9577ADC 
X-CRM114-Status: GOOD (  11.34  )
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

On Thu, Mar 28, 2024 at 08:38:38AM +0100, Alexandre Ghiti wrote:
> This is required to allow the IOMMU driver to correctly flush its own
> TLB.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
> 
> Changes in v2:
> - Rebase on top of 6.9-rc1
> 
>  arch/riscv/mm/tlbflush.c | 39 +++++++++++++++++++++++----------------
>  1 file changed, 23 insertions(+), 16 deletions(-)
>

Hi Alex,

Is this patch still something we need?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
