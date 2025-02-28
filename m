Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB97C19F32
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 00:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=op1KxJu3jHjEdq/YK0qtDE1aZO1X0GozEty10LV3i48=; b=rKs8vOzC7N3uWh
	5TaTuhhr/05ripbsi0AxNndlgtQ/ElhrOcbJo+acIF60jCVHBC3WQIWcDFJPQVU6GBu379UZD4Y1u
	x0i9m083lI0I97ntZQiZ/fVA4tGeoC7YhNlMRU4ctieJR52dPUAGJ2emLyqinMA0JhYacw9xsqgLn
	x6jlNr1OqYzs63lNKTTFg5+XQ/H2KfYA3KCRht4TnybieDxVZVqnVYAoe16BjtqmrNph+1LI6wybM
	kjf/tAUq18IP939XKoDbeEiAciIle4aJDgo95FK8ypqoavjfDZWzxk2MEPkd8GHpGYPaYrnZdVnBd
	1VGultmUFIYKkZY4jy/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnoPu-00000009IrC-14A9;
	Fri, 28 Feb 2025 00:39:50 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnoPr-00000009IqC-36GC
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 00:39:49 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6ddcff5a823so13409526d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 16:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740703186; x=1741307986; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NS+/iUnzQt3rNEJ1NDY4uxNPpsgUI17G/QJLjXrYJFg=;
        b=DxYxfru1QIfiSPBb6vFiAjTQvzC6QDa/mdHttfQwt/fI7dyh18olednpuqyana9RsU
         2j3oE77BG5AN4gQKVq3NfDmPWh8TGDZyuCgd0igNyXjXLejM1SMYvUy1GdhvEPNN/dqR
         HZZpJQoFb+HYY3ZiErmHsdItND30MZcnDTW+Wfd6/i0Twry6WBXuwNsSANZZQKIkvSNC
         l+7gtf4q5k5aRDWdfPz6FLh/sHfbQxwt4WbsV6HSc9gtrZvpRozlr4B4lH1qkg3Jo+bc
         HZjfCVnwESkTOf75ySEBhuQmfK5OJ0go7GAek7qGSFRFWG5Dh0RxitrRLEiG2UB7txpZ
         7MIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740703186; x=1741307986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NS+/iUnzQt3rNEJ1NDY4uxNPpsgUI17G/QJLjXrYJFg=;
        b=U/SfPawArD9x93eFWfsQNbEezJI2EwCd0fS1wt2WUjHCT8cfF6E3QNGLkoKYiAzrdi
         5Ayz6aQGVBFqG5oEHFL0SPSgzcMLqk3MZ5m73jR4QAqejHC8ZZlwqTqa9AQND1x5Har+
         AQMlxHNjvbhF0cvhfhoiVg+fuomnvCug4l54NIPrQWQzix//wUS1bQ/wmdAg/fy9Sx5d
         vcKhO+/ohasokIwDjZun8jEn3NBcj8hpX3QRe7mLOvoCQXrL9lfiBiGvhFTl7QEmupJ9
         9jj544woEw/utjgaz8spgDXYrT+5TIdfvJWbBkOG2Jug0LFqu7zeKFL5jsUaTu7CyDIA
         wR4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQLd7lGWEkBZ5LilnXdjcnqAPUUiPV2NhxXWPaNf+WUBVqV1+lpAdPCQPeihVNwCf7JnxuO+wtiSmguw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJLz68+99+xBAZM2Ru1q/QCkHiVmiugti0liI+KvYAXyKd1rcB
	2jSA2JhS7MSpbJbyOh2rem46IGh9jwc8wyGVHck161KbWU7LYlIj
X-Gm-Gg: ASbGncun/0PFVTUYyms2npWo01+WqXC7VlNhpGjSXI3KrPZYUSS7wclI3n0biOOhl7K
	rr3NvtAIxt9zuI0TSR7YuEivyeKXcDu77Mb792zj9FngScWNOIvo8Dmab8xXbih8swQnYeIJ8Tg
	R1Wzm9ZiK1bKwoqzj5SZ693wOPkZCDGK6rOOLjdKmYgYcZpEOq1qPC+1iLD7ehx6w/ga97gLOXx
	qWV4K4ympDvb3GAwYh2xDmC0yhh8rIrIog0GY4Rru9aivNnGuJJ2iAbX6tyMU+bO6QIYWgFDs1t
	6w==
X-Google-Smtp-Source: AGHT+IGW6OtjFhte78/y7mXicDWR0r1px1BSDbRwNbpZXXNdzJwgIrFoEnObj2orAz8Dtj3dyg6Yrw==
X-Received: by 2002:a05:6214:21e7:b0:6e8:86d3:be78 with SMTP id 6a1803df08f44-6e8a0d94b6cmr23116156d6.37.1740703186527;
        Thu, 27 Feb 2025 16:39:46 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e89766166esm15959336d6.61.2025.02.27.16.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 16:39:46 -0800 (PST)
Date: Fri, 28 Feb 2025 08:39:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Guo Ren <guoren@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: reset: add generic bit reset
 controller
Message-ID: <57tveujqmthjxdaad67i3qv732zwmjcyymnsluyf65xdpmfvkd@cqrwhuylthmd>
References: <20250226234234.125305-1-inochiama@gmail.com>
 <20250226234234.125305-2-inochiama@gmail.com>
 <20250227133509.GA2021892-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250227133509.GA2021892-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_163947_780142_8176725B 
X-CRM114-Status: GOOD (  18.03  )
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

On Thu, Feb 27, 2025 at 07:35:09AM -0600, Rob Herring wrote:
> On Thu, Feb 27, 2025 at 07:42:29AM +0800, Inochi Amaoto wrote:
> > Some SoCs from Aspeed, Allwinner, Sophgo and Synopsys have
> > a simple reset controller by toggling bit. It is a hard time
> > for each device to add its own compatible to the driver.
> 
> It's a 1 line change. That isn't hard.
> 

Yeah, it is not hard. But it is annoying and sometimes
I felt it is a waste of time to add a device id to the
reset-simple driver.

> > Since these devices share a common design, it is possible to
> > add a common device to reduce these unnecessary change for
> > the driver.
> > 
> > Add common binding for these kind generic reset controller.
> > Check the binding description for its requirement and
> > suitable scenarios.
> 
> We generally don't want 1 register per node type bindings. That level of 
> detail in DT has proven impossible to get right.
> 
> Rob

It is not 1 register per node, but a contiguous range.
In most SoC satisfy the requirement, only one reset
device is added. This is what the reset-simple handle.
1 register per node is too crazy for everyone....

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
