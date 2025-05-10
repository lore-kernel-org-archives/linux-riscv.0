Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B162C3ABBC
	for <linux-riscv@archiver.kernel.org>; Sat, 10 May 2025 00:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovrbTUA+m/DwMG0V+k4RQGuQNz5psoniO/JADavowNU=; b=MWH+8OklRudn1Z
	rtR1GM0KnnD5rqdxVFfzCto30L89vM4fsLBl2YD6VnFNQBSITy16hoWCN3KJEvaHpH9Rxr0OJWJH0
	NpmqZL4tck8hiUmzwNZFZ5og6Tq1awYEekZ7BVmnelb9Ke7qFL9XDUVO37t1miPlpw2orxsnkI9aF
	5WuZK+OxlxFr9kY9qHczCG+JKNeJnOI9zYDfoqXtAgt8QCo0Y7vLdNqbIUqKTC2PoZ6OjDql9eVv2
	SitQf/OGvdFqocWyODc9uFXQ56ffUt/jaLb32YZsVjVW8NK3RVtcKY/Md1okj+ZMZLPgjvTZG+QTN
	a4fNswKTWYe20FEQoXYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDXt9-00000005BA3-2s67;
	Sat, 10 May 2025 00:16:23 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDXt7-00000005B9e-1KQO
	for linux-riscv@lists.infradead.org;
	Sat, 10 May 2025 00:16:22 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7c560c55bc1so333708585a.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 17:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746836180; x=1747440980; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7SFtVXCVSeg1kTdZcyNbfJ4jRT+3FPuL4xzH9FGtq7M=;
        b=XzdEd8KvX6SjW74n7UuDS2Tp3sFwDEUSFhksoSyUo37z/HNwxz4+X3kzXkppd6OnMK
         PuORqj1k2k1dMTp7pUG3NTaOoZmJfAvCT+Tvai7w8b//1ReY4/wNiiMwXMbfjE9colLc
         vOru1zBivXTuv/Onvjm+MD3JGgv70zElHM/EpCIBt9glhsP/F2FTW5YOqkcpum2GMBDb
         MJXPMLnDJ0GrWGFtdakIoYBTNvvnMSwKUJQzi9yKZAvmPqCmFmTY8Sq/dD763XlkTlr+
         sL62THoc9i+9kJ6/9Pb7ygAaMw9LcXhQxamuEvum1BNiEeqDRcXah4vJM++GvRFflYDq
         qBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746836180; x=1747440980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SFtVXCVSeg1kTdZcyNbfJ4jRT+3FPuL4xzH9FGtq7M=;
        b=hNClj1VDatifJIjspZtw3/GUPAkguKCXfsAmnIOu/isxM5rQG8qXi0RTvGktaKLO5k
         csk67GOXAd+DRlTTO7RF1kYCXxMwnb9xblIIQLrX12vOBJeOU0uPoWrw37vtopCdMWCy
         FXgPLB9N5GRnN1JDn3CKUaM4nnKwKDImrLZyoaX+RxqFHRqmMuzFQ8wZNdYBNpZ3WtMQ
         S0yZZZ7MSgKIO/ny+7/iv4EkYkf33hDKkYR45H0kpeQEXJhbyXJ/P5d7MkYjLesf7AiC
         hVSZYvGb0tNUY1fJdie5MElh0kiLtTdvjACSY3a9aZLasHMA8QonOgil6aodpCge/HDE
         moeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ9QXCISSkaidHvDC/xMqXUVwe2vOki3CBny+XbFgVpzn/TsTUiPW0ykcXGn5+hdBQSqyRBcQbPXCcPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVK2P/XH7buSKKsrmLUFxzsBFoefKrsOpVzAwtGJpNh4gACnWF
	wuCaejdRwOMkd7FdXZeYH5TjbyOd/mncrZxAl3zDqQaOCgZC4KEd
X-Gm-Gg: ASbGnctd0GIWokItRA5SLshN2s23JmnoqASfQLsUzqP1/kU1GbkeqlIlEsQaWSoELu9
	QQs1IclqvjN+SNI6ydwxJP45/gr99sa/CurWQg0z8176Blg85CloOTf0KkOuGq2xdIoLEvBsbXI
	amRddkRubq/p0/goFtswkTYo8agumn8qUH7hhiMPjTeWz8hkEGV2fgOO1hB+610AbHLqKmoZOkh
	T68JOO/HaZhIMTxGjqryVHHCsfcVIPmwcc4KXaAm4KpEhWwrgUnk3dhutBdBkAmaKr7sKTSUmLp
	n96389WmgOH5RYfJKpcTYO5qvmc=
X-Google-Smtp-Source: AGHT+IGsj1/7ro2DBatzM79BSJawe4AwdDgbJzQySrStNjoHX1NPEW35OR2pnN03ieEV/qqsQHjKNg==
X-Received: by 2002:a05:620a:2443:b0:7c7:b4ba:ebf9 with SMTP id af79cd13be357-7cd011053e0mr885707785a.22.1746836179840;
        Fri, 09 May 2025 17:16:19 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00fe75fasm204706685a.93.2025.05.09.17.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 17:16:19 -0700 (PDT)
Date: Sat, 10 May 2025 08:15:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: add ziccrse for sg2042
Message-ID: <clgoceu52ecsdnb3motp6eciiisalwjxgi4msdisgtdy3rxsvn@5hh4lzd4mh7q>
References: <cover.1746828006.git.rabenda.cn@gmail.com>
 <13d3da8f0979f50e561888164f1fbeba8cd11a3b.1746828006.git.rabenda.cn@gmail.com>
 <yan76lhmlemqxw4ytpinvwuiucgqgmqxrekiepsygjqcmpw3i3@k67zshipj273>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yan76lhmlemqxw4ytpinvwuiucgqgmqxrekiepsygjqcmpw3i3@k67zshipj273>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_171621_364220_9F05029A 
X-CRM114-Status: GOOD (  12.50  )
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

On Sat, May 10, 2025 at 06:42:02AM +0800, Inochi Amaoto wrote:
> On Sat, May 10, 2025 at 06:11:23AM +0800, Han Gao wrote:
> > sg2042 support Ziccrse ISA extension [1].
> > 
> > Link: https://lore.kernel.org/all/20241103145153.105097-12-alexghiti@rivosinc.com/ [1]
> > 
> > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 128 ++++++++++----------
> >  1 file changed, 64 insertions(+), 64 deletions(-)
> > 
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > index 927e0260acbd..04a6875574bb 100644
> > --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> > @@ -259,7 +259,7 @@ cpu0: cpu@0 {
> >  			riscv,isa = "rv64imafdc";
> >  			riscv,isa-base = "rv64i";
> >  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
> > -					       "zicntr", "zicsr", "zifencei",
> > +					       "ziccrse", "zicntr", "zicsr", "zifencei",
> >  					       "zihpm", "xtheadvector";
> >  			thead,vlenb = <128>;
> >  			reg = <0>;
> 
> I prefer to keep the maximum 74 chars per line. I suggest wrapping
> the string. This apply to all the change of this file.
> 

So, I mistake something, please wrap the line with max 80 chars.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
