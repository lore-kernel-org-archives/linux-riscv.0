Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C75EC71135
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 02:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IU9TJ83JqewOEJW4msvsjnRTbd6OhFXVMWeQx1Y1N20=; b=oP5WvAIz3EMfem
	YdxOJ99GQbXIc0BtITcJFf8DoC6bhGnmwDjg6DbbNjEbpVxxMCFbTVJd//7kkNI0k7Q39oHlBtPz5
	OiejvmDGUY1RnR1cLsZDhcRC3gbySTpSqa6tqtowpw6czk6c/ibjBflpyXZPo8qwjkweuieWFNSB9
	4UqNIhyCvE2sbWds49tNrF7k2mbXJ6tyGPGNNfEy93C/ZyO8l60BlbryBaBSVhZyVoIJJXEIXYZo4
	A+844crpNuYg1VGK+6GOQGsjmNW5zq63j364YTVtmYYygwmZK+f5DGeckjnfglo753aDzJZVKWPxt
	d94CQfSXqyUdZMzFOAsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXuy-0000000Bzgd-1sgg;
	Thu, 12 Jun 2025 02:43:52 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVqp-0000000Bn6j-2tFc
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 00:31:28 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7d094ef02e5so166063285a.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 17:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688287; x=1750293087; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MDViv2kd0c1R0HWjXGJScGRZeTmMy+6a3qoFcXqkWrI=;
        b=YIw1+UwGY1Kn5HSYNJUifkaAGDmtafSZoNyTfjtU6joCqziSa+U1svJKobzzlZq6t8
         aqgsPt4v4m6RhQU4eVXYaYXzuJnNy3B7FW/JVrPFlrUpk4SYCArxawV5++UlzvuBFqMJ
         4IBmQVLd8Jq9Duwo6K3Ut5L3TjB89AKgzoZjBGwhWRBMsQUwFBBs5stjFOa49WTfzsta
         Eo0AfexhmjLrSSGBzOVFPdcZT94yZR+NXY1lnQwfodifCyGzUuRU1H5OgPaZ/7f4wT6u
         eV1Ar/GeVmzgLM98LNhK1m7cWrEplrt2SgwWCLEHLvelw3jm0ClQdD8bEaJwhR57Uw0E
         elbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688287; x=1750293087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDViv2kd0c1R0HWjXGJScGRZeTmMy+6a3qoFcXqkWrI=;
        b=aHBAbHQozRn5eIytXlMoJK1ezDN5B2BZJRSsQmruXwE2maSW+0iWVM8JpQ4nZUtBO6
         yp8aKpT7DJVxbxZRZlZnB/tYyLxyLmpXPWvDd3Fe4MKD3FaXpV5nsj864j74N/04um7Z
         KSD1sXGFkgCZgBm35zX8eLFbMl7R2McevI3NCDbOFy2NmDE81x10FqgDTZW0671dzQpq
         mFx3gE//ZVM4GZepwZkW85S3ue285RJlUCM6NSMPPfUuoMq4AZQxLGw/S/b4KfRnPPyD
         2uNYncYgDtRVw+A/qsuQdtyKtj9xMWjnlOEcwUP7ivItsBPr6wHHYwpRr5DzVvZp/Wvx
         OcvA==
X-Forwarded-Encrypted: i=1; AJvYcCWJwGcu38+XWR3OZD3V7ByXaBolSfQAWeLrgH1ds0iFJB7kK9NtKR+Kp53BorzrUgPuJJhm5ngqs8fxvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnBvb1ILU/BODI0v0Pnf/wED+QXzmN875o0Idt0RFCp7McAb9i
	SKsnLT5YFmRXPI3HllrTxZrLC6hZNfUnyoPkEU4ifILrPQ6OW2Q4B82J
X-Gm-Gg: ASbGncvlzQqmAjQqRR4Oxn8530iWv8tFZg53AZCba/VCAu/P6XcAElyj2klOs9YtDe1
	wvREJpCv0zNteabTVJJT93WvmeVkfQrSz7G6Wm4lygty1fEFkzLbpcOlGbF4CepYz8yRoqEGtYg
	AoQ87CpsU0oBQcn/UwAK6As6pGc6fIkD6SSIaI26xRYU+l0gBpcXjCb7hD0tI8W5Y8LwIevP1OY
	w/Ki0duyegBZYgp5td+48PhV8sSNKLgr4PkDBsACz6Mi1unSDxwlc9kYl19/oVOGYE3kf7fI+LL
	YO7Cmwq2jbZ4P4pZfxh9W00fgv9TPPYl7ZsekgD9/cdpjJgr
X-Google-Smtp-Source: AGHT+IF0my+KIilfiiQsa8f6QCZhL+Zpc88QOn7BlJUczLXOYa1+uUrywXOxrbxyAJNrFRe8whKRkA==
X-Received: by 2002:a05:620a:2711:b0:7d0:99f5:9bab with SMTP id af79cd13be357-7d3b2d16800mr226968485a.14.1749688286679;
        Wed, 11 Jun 2025 17:31:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb35c55ff4sm2510886d6.92.2025.06.11.17.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:31:26 -0700 (PDT)
Date: Thu, 12 Jun 2025 08:30:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: sophgo: add top syscon device for cv18xx
Message-ID: <t26cj5xhmkqro5wgf3vqycvgwqhtwv3x6mo25hde3zretbl5uu@xy5igj6vqejx>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611-doodle-storage-f1f23230adee@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611-doodle-storage-f1f23230adee@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_173127_742162_A5742F7F 
X-CRM114-Status: GOOD (  11.28  )
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

On Wed, Jun 11, 2025 at 05:14:59PM +0100, Conor Dooley wrote:
> On Wed, Jun 11, 2025 at 04:24:48PM +0800, Inochi Amaoto wrote:
> > Add top syscon device bindings related DTS change for CV1800.
> > 
> > The patch required the following 3 patch series.
> > 1. https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.com
> > 2. https://lore.kernel.org/all/20250611081804.1196397-1-inochiama@gmail.com
> > 3. https://lore.kernel.org/all/20250611081000.1187374-1-inochiama@gmail.com
> 
> What is RFC about this?

I use RFC to ignore the patch check, as the dependency are not merged.
This series itself require the binding from link 2 3, which provdes
binding of the USB2 phy and DMA multiplexer.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
