Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BCAC7115A
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 00:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kbl9dFTioth7+Z2VBgD0lLsvAT5wQ+pE57umXyHvUJ4=; b=LexAFLGXmhhzpp
	FnMVtxFWwSvPuvDdX2AuB5O8svYIQqvHN+YfO0ISnqmt3UNq+rA37dh1AldhqFBPPgLN0xPJO+vJm
	UM6GI2dvgccnOSyCjgt4ycyUnYPF+BvoB9Sa61t7+dIqu9aOjOXm0z4NuutOEs110j3QdvbtGBQtA
	nqZEGAfvexOM/FfK7zW/h3OOqmk1c82yT7OkP/cVgkZ+11oRCE06+V58hF8bTaGRb7MXQDwoDYT9h
	tlBqN+lnynR6LUfpJ1pqAOj2LwL/63JEjaVGKW1dECfTNlnU0vIQvWJZze4/oILs++AS/hgR4Zu4g
	mxq86+ERGJCKJIQW17YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSQ5u-0000000EVSo-1V5k;
	Fri, 20 Jun 2025 00:59:02 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSQ5r-0000000EVSJ-0Dis
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 00:59:00 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-237311f5a54so12507155ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 17:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750381138; x=1750985938; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gNfLmL2GJ/LJtjmF47jC/MYcsOmvEuwoo9HPi2OM56c=;
        b=RA2FfoRO2cpihfbAnI0IzWd5O66Q/Pf5o1xjRd+6s5PeQ8t+ap43fBGAU8vXJ5C+Ge
         r+c5D7LYBdl8ntN6xG5VW/Pgint7q5ROJWl3SZrP4CdkIxjr50v5IXAZmCPXaXzto/fK
         A5fLmoR9GuRiTgJbOQRb4FviDKbFK3Nb4HrDi+Hekn/OsXDX4CsMY4nLIizqqynFWfKn
         JjL9LFxeYuWjNk7Nt7ZXXJCI9fOEF1MUX8l9bm25o4gwLS0x3nnFTtpvS/dx9apUkvta
         l5Ui5+5ByJ3zijbFSkGwx8erHZK0oZHLNaY7pi2sdyNrlmY6nWIIGzz3siEGPWU6E8hx
         K07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750381138; x=1750985938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNfLmL2GJ/LJtjmF47jC/MYcsOmvEuwoo9HPi2OM56c=;
        b=rVtahqjG5Ov/T3AY9+ZTN7H2q/EXyQ6ZghJDzfN8RvUqrdaZEZpzpeOVchUwfFvkU9
         YhoOIcPGmC53mtnKZCB9cYtGTExWEVu7E4Hq5czp52ypvQnEwj1SD9HIPvBgjHhl83ih
         cM0iD82WPU8txba9uzaZoEUAj3f4KqvvryyArMNNZJ4G8BMU5Gk/ehNfOv0pw+b+cdXA
         Y/xoFkGOhOkwWDlO4v9GGvXoGnZ4o3eJw3xIuv56QPj/GvNAPP+5ZEngjLa+7JApHCJb
         5Y6T7musGSo3NvbUMbZI2UreZUbx+BbdL8yOaBrJesrlZQTZpFAJTP7cVCQGO2CEJOPd
         93+g==
X-Forwarded-Encrypted: i=1; AJvYcCXskLUMhgXBhcU7oUwUF44wLaJgSIfvW1d/XLu4mD2oUJg3CxQHS2IhmFBOEjZuKVTaQxo/8EhQgOHZNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXEGczVfUuM36HX6OqbCvbSYjHcJdojdjJeEuBCCT2fY+Ph4+w
	eBc0wqSJ+BeWPfUA9TGRcnUAaANZuMfQeelH7R0HWowB3biQdnxuBfZK
X-Gm-Gg: ASbGncupmkI2e58EYqUZPZ/83QMP6RKJirZ+LikxBTTWInXNFlf6q1ijxRn4zCDolB6
	JwvhrV4jPZnezF7TGtFEQQzoWcS4wPKNCaBqBljjoMwcDNqkHN6VYqhshJ8R5YQPVU8gS1MuvDL
	hk0KUnSlXGz+fKrgixtbg+BK0Ozw412iU93OnKXCmfsW/UlVDGNTNldimfjYfUI2vFJ2lcMoSoo
	RHbXIGjd/g58lK4uG/cN19Uspc8SUkjACe/sKk9Z0UBg9nzdzpRgJBSPSWnF8Id2rmGC6Et5RQb
	SWVQxXDHtu8eDUmO6NB0/6ska8h7qLBVN1smr9wrWk1F3xjvgtqO0BsMBRlKnA==
X-Google-Smtp-Source: AGHT+IHi7aECeHZRnPC7vw6NES/MMPC6y4QJZ8P+xcgs4+ESGezFPvNV2kX2PNH9co3DTZQXCAXUPg==
X-Received: by 2002:a17:902:f54a:b0:235:f3df:bc1f with SMTP id d9443c01a7336-237d9ab626bmr11772325ad.36.1750381138271;
        Thu, 19 Jun 2025 17:58:58 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d83cf981sm5109995ad.59.2025.06.19.17.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 17:58:57 -0700 (PDT)
Date: Fri, 20 Jun 2025 08:58:55 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: sg2044: Add missing
 riscv,cbop-block-size property
Message-ID: <os55zbba4lz5dkbrejz6pzsxn3o2brtchxvp5sdjrqubavwoxi@ktyfnjaqchwm>
References: <20250613074513.1683624-1-inochiama@gmail.com>
 <175013680588.1018298.10559632401541865399.b4-ty@gmail.com>
 <MA0P287MB226203FCCC7A25D2140ACE01FE7DA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB226203FCCC7A25D2140ACE01FE7DA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_175859_092993_BDACD6A2 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jun 19, 2025 at 03:30:31PM +0800, Chen Wang wrote:
> Why not apply this to fixes so we can pull this soon?
> 

It is not a critical change, just a forgotten property.
I think it is OK to leave it to the new version and
reduce some work for pr.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
