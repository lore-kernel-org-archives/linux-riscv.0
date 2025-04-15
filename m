Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA9FC369B2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 00:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOffiLoO2OfFNS82cZ/Jfr3KfUZbffwHqf9lbicWN6c=; b=iRApyMWCNzueqQ
	kwipnyCdWFt2zJQkJN/vnRM+nETbvl5fIFoBAqhNSc3HhszRibL2D52tDUGnJ9kRtWI/kn0aVmDRf
	H835RM1tzUtWY8ZtsJ8DR6ejGCrKIA185gKtnSd5LWvcivzFU8u+1GjlJ35PzkqNfiBl0LBqNL+vP
	NcN9aE6VUYI6BgvlEmL53xQSRN/f+EdKoAStBTjKARnHv2TUf8MZphh5a+hdc+Kfkjkt83ES77IBR
	oWqbpdDu5wfVxfcwySWkzQJ74+WEYIvaZNDMF3jgOZLmP28T0FBTpwYA7SyHLek0kasQmW42cagwl
	bZEGMod2TANqEon0uvyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4UZw-000000043nq-2yt1;
	Tue, 15 Apr 2025 00:55:08 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4UZS-000000043ja-0n8J
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 00:54:39 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c08f9d0ef3so300666785a.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 17:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744678477; x=1745283277; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YEdjQ1o+VNN956ebuUdrdZKlZGMV3rwstW2yOoX5VUI=;
        b=SqfAVap/2kjHLs62mByrSKv2wHwhbHnUous7JJK7EPtdjRaQt4TRPXUZzOuMThErdj
         hMw5GnTbYM6zhq6aBbCC6TFF39OgbKbhUemSL4CGOpwhZb7mNuZhLN3SUY+2YYLHTS9D
         Cr4Am94r/6PeTfoJ4SPoT0cDDzdtNdGg7620u9TqXmoJQ8hGPiUvJ3f6h/z5bhSM+URU
         u9Lsc+5wVbrbJxlUov9Rs9COu984koj7IBhYqa8YCeInCkU5ypHi4UzLwQXh3mQZknIS
         b+0/KZvKB7XqZN0aDyugo4zARIqljh0lD/XR65qQ+KbF1jaaGHuJJHhL5a4COePPZbI3
         GiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744678477; x=1745283277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEdjQ1o+VNN956ebuUdrdZKlZGMV3rwstW2yOoX5VUI=;
        b=I8e0FoNW4UgyPc0w7dG8BRDHm+KnFy7QNJzMrULtbdNhv86eiVG8WFDkSKCFF2jQsH
         cwioimwWGWL4yvl35znAFwtO/nB3bmKlJcxcBAvhpQ4f/roMWai4QpXksmQ6eVIAfyax
         oXfg6ZA7emLbFWHXvTeKhQAHTJYQP5EkbZgbftYNJT8rNbs2gekciSjfENHNXHTRBfCc
         MHiI1Xd+SyAl8gbI8HRRpnqUEM09zRgfF8LBHIfImGkk4m3JRGcZUdMF15+IwHIxTcgE
         J5FPEaK9xFUwhNwLO5bLRXogvwaqBKhePBffwrB8PAEJRUNcGxxXll1MRN88JBDzzZc0
         S7qw==
X-Gm-Message-State: AOJu0YywiAgh8LoIHA7GN5ft2KXvMwzuOuWTj/6yVtEa7bNOiMkAPimZ
	PORIMi0+cwq985p7DoL+U77CNqWXr7TarPEwIRYsqNihoKeII+VU
X-Gm-Gg: ASbGnctySSyfNLIdh/sY+BUAhYjmysn2Jp7HNl1q60V50lAUsZx3+6DbdtqJLnUp874
	3hNadJyqBKpHRyja87zk4GUlPig/Srd+jcPFFeDD/usnSZS8oQdnPcKOKP2EFTZ/Tf6q/gnmZlp
	nSJhmveuIAPwfvChpo0HKSS2CBNlM9KplRdXPP9XBhSuAq9R/tde9FO5KTXAc5L3brLS5W0soiL
	ilHwrc4YRFj/nyIEPO3V7ko3x1njoiILx4nmdna8iGTGyzWLnwbfHV5MkmRN6v67elQ2Xqr6In1
	8jB4V2wRtpbL0Vzt
X-Google-Smtp-Source: AGHT+IEcFMzFgzOuAefnSoezpAomkQ7g6BkNkYnHYntZ7e4If6A8R5STXqAMatQY2FwcPEjpF4L2qw==
X-Received: by 2002:a05:620a:4055:b0:7c5:4be5:b0b1 with SMTP id af79cd13be357-7c7af1133b7mr2147815585a.35.1744678476628;
        Mon, 14 Apr 2025 17:54:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a89f9938sm816112785a.69.2025.04.14.17.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 17:54:36 -0700 (PDT)
Date: Tue, 15 Apr 2025 08:53:53 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v7 6/6] riscv: defconfig: spacemit: enable clock
 controller driver for SpacemiT K1
Message-ID: <f2gpmtaxfbt3ltgrz26uyu2gzffrp6gstov22qvguiz4md33lw@y26mzzc4wnnd>
References: <20250412074423.38517-2-heylenay@4d2.org>
 <20250412074423.38517-8-heylenay@4d2.org>
 <eadb0ac9-f46b-4525-a198-0c6c289084f3@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eadb0ac9-f46b-4525-a198-0c6c289084f3@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_175438_245177_DB7D6EE5 
X-CRM114-Status: GOOD (  14.93  )
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

On Mon, Apr 14, 2025 at 01:12:32PM -0500, Alex Elder wrote:
> On 4/12/25 2:44 AM, Haylen Chu wrote:
> > Clock controller unit, or CCU, generates various clocks frequency for
> > peripherals integrated in SpacemiT K1 SoC and is essential for normal
> > operation. Let's enable it as built-in driver in defconfig.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> 

> I know Inochi wanted this to be "m", but you can see that
> SOPHGO sets it to "y".  Meanwhile SIFIVE uses a default
> value for its CLK_SIFIVE and CLK_SIFIVE_PRCI config options.
> 
> I'm not going to solve this, so I'll just say this looks good.
> 

The clock and pinctrl are exceptions for me, It is OK for me to set
"y" for these two device in defconfig. The thing I only asked for is 
a tristate entry in the kconfig, so we can go with a module if 
necessary.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
