Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6DFC71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 23:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5v7gIzQ3LgzwM0PHAFxt0np7TeouqgcdJBVMqQh8x3o=; b=Uw8WQyd1qCC8Le
	4XQtxFD+1RMg8zUf3dcil5K2SCh4ZEQUMP/x5EYVzjXmTzi3x/GQvf2LU8mebbVIEHPozLJ8/Y5pG
	ykh4H3vPiGTHbmaaIFI4LZs0ty2YGjQcKHdrtZ4zRSbgCVtBUWxZSFmXfRqq6mOpCf43SLY6iaC7c
	Cmh4d5WcsL1oP1MHlQUWY8k3D840chGHbzcgIgUhKu0/uGWJreyuC3e+NdRZ4iK4J+j3olLpQPuLi
	lR1tz8YusF9eVuJhriCa2xHPaggAWAYSV5BjxH7n3viWjWkKni87FPRgu9W1GPIRA3h4A70f4D8Yh
	dIN9QQ0GJ1R2JsYbbocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPr32-0000000Epxn-1zaB;
	Thu, 12 Jun 2025 23:09:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq23-0000000Eiuh-1FbI
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Jun 2025 22:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Fr4KrCMJQ5nXA8cX+HqskZUQjva7UZ3MKq/H78lqt7M=; b=S+m/LWERJwLR2AvqQEmqjaCBZO
	RGV+MfP4H8QKFJGdWvBmbv6pn/yeybH4Ba9r66JStOrdzVl71C3bowy184FNLezyT8YXknpX8XRoe
	9lr3Buk79YPU8a1MCL0niuDXDKEsizOTXSGFEJ4BdEvegKusn/rA3TKlqWiFgZ/E5T4Ca2JnF+uaZ
	so265kEAzzHCtvEtSEB+g3GU4C3ahOdLzPtIcOw2eB60VJC7bFK1D8ey1URIF5wVhYzmYh2dYeerY
	DQaktuzsmvN7Wa1M5ljIYvhiD7GYLqanFRBKmyoQCAty/kKh+Rz76bnO3aXvMNgNOHaYD1GuC9ldd
	W17YipzA==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq20-00000002kCA-3ThZ
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 22:04:22 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-748582445cfso990554b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 15:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749765857; x=1750370657; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr4KrCMJQ5nXA8cX+HqskZUQjva7UZ3MKq/H78lqt7M=;
        b=EB7Si5O0izY8nWGwODp3MZ1nW/tmHPTR4Pimtf5DAID9+WFZ9Y/lbobaOD3E9taKmD
         HFI86hFvjPSVJzQp3YnBcRg6n/VvpMD/OZMM0SBdhRu/3HQUXy1MeXL5Nv4xmWm1UTCY
         8/3ltuMHxCvf1SZbRdKac1frVM9q+s6Bfkbsn4NCxDJOODhBJJIpYhtYRkXpqLpdSGaC
         fFFWvug8zJiyYqOIMLNKFkb1Nv5wRf5/oB/xcN28J5966qCtKc8xMsVMqKps3cBLQ14z
         ApJqdQ1a6dyTOEdkLBGekhRmyECp+shMW5XPZeRMXyJOS2xBKu3FQyQ97Pyw0gOpY7wo
         kjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749765857; x=1750370657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fr4KrCMJQ5nXA8cX+HqskZUQjva7UZ3MKq/H78lqt7M=;
        b=MnfTd5FwrWipq9nS7MhP3yloNyDY03OZxeYfhA3QAk58UlrNZko4R9fOwswKEvOHt4
         8ADwNJrH35feuc1nzn/206ACZh3P6r5Yk4FC4WAmQo9lr/2EpMGb2njfYliCp5D1SKfb
         6FbdbSmrc1cS4tObo9xF4qf7zQI+3yvwGFEl6LKRXqX6vjvyA0/mXGsVA7D9A+1zOwC7
         ntasbKltErnL6yCtQVj5tYq0hoLs/4NQX44XznQa0i5hY0XDJVMnPZtvPAmqCV4fXkaZ
         VlONIAbhZQUz/tiC9qv8nBsUUr9ZCMtI5NZGcjdJ0eCX19d3qmaX0A9rcHS2/OB+Q73N
         bb6g==
X-Forwarded-Encrypted: i=1; AJvYcCXtuWJzpuxFG6lu76Ip4P9C84AzAgqY1/FFhiCccsGNlxvk4unQ8Xz/7tbApVAL6lpoPJagkoAJo8Lryw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyRZ49bfJ/jeNz6yt6GmxXNn+GVoogVQgPBFF2dWJkOfm6mdwd
	D5F5WMBLhIKLfrrY7i78gChCfS8J28dzC/2TgjSX72QaAx2qm5DkE1uD
X-Gm-Gg: ASbGncsIMyTvY10/azjpZcwdOD/DXpmBCPH79URde97a0VG+uHo4IZKLHmmWKPmeEE+
	Z1JXN/uvGQRQacl4MjeiZtKcukldQ91E6F65iPcDzjHYDMmlXEv7u7CF8kNMhXQ+dVVAcyAS1/n
	q92P8UYuLvmD6EtuBy3OrWNstajaGZiNmTnTqBxIZOcNwbHo4GIjxpfVpmxLd/kVJAlU6Dzm79N
	oUk5PKfmAZsw95kMkrVcp8tdUMu3mr31oZMIrnZEKLaR34u3CR/hejAWv2x6wvjqDEyoWCPLhyD
	nBG3M+wL/ZldVcF9gqhFAFTvLhn3Hw37Ggs+iaD8PhDdN+RpydlESvWJXfKY78a6n8bpFvw=
X-Google-Smtp-Source: AGHT+IEBFgndZ4ma3VrBmFJWbwgQqLDt8H4cuSSrnRjAzD9LoUAsVC3TnK5FcePSUnq9KPVeQ5WVFg==
X-Received: by 2002:a05:6a00:3a04:b0:736:5438:ccc with SMTP id d2e1a72fcca58-7488f70d83amr1057601b3a.9.1749765856965;
        Thu, 12 Jun 2025 15:04:16 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-748900d1ceesm230724b3a.161.2025.06.12.15.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 15:04:16 -0700 (PDT)
Date: Fri, 13 Jun 2025 06:03:08 +0800
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
Message-ID: <wyidzvmwepooa2pnmceea57x7ggvar6vyowgom47qgcjbhf3dr@2hxq466muptb>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611-doodle-storage-f1f23230adee@spud>
 <t26cj5xhmkqro5wgf3vqycvgwqhtwv3x6mo25hde3zretbl5uu@xy5igj6vqejx>
 <20250612-specks-banter-adac9a126ec4@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250612-specks-banter-adac9a126ec4@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_230421_066984_C1CB4D2F 
X-CRM114-Status: GOOD (  15.86  )
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

On Thu, Jun 12, 2025 at 04:58:39PM +0100, Conor Dooley wrote:
> On Thu, Jun 12, 2025 at 08:30:17AM +0800, Inochi Amaoto wrote:
> > On Wed, Jun 11, 2025 at 05:14:59PM +0100, Conor Dooley wrote:
> > > On Wed, Jun 11, 2025 at 04:24:48PM +0800, Inochi Amaoto wrote:
> > > > Add top syscon device bindings related DTS change for CV1800.
> > > > 
> > > > The patch required the following 3 patch series.
> > > > 1. https://lore.kernel.org/all/20250611075321.1160973-1-inochiama@gmail.com
> > > > 2. https://lore.kernel.org/all/20250611081804.1196397-1-inochiama@gmail.com
> > > > 3. https://lore.kernel.org/all/20250611081000.1187374-1-inochiama@gmail.com
> > > 
> > > What is RFC about this?
> > 
> > I use RFC to ignore the patch check, as the dependency are not merged.
> > This series itself require the binding from link 2 3, which provdes
> > binding of the USB2 phy and DMA multiplexer.
> 
> In the future, please provide a reason for things being RFC in the cover
> letter or patches themselves. 

Sure, I will.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
