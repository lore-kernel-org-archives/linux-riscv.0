Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C014DC25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 16:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vuuHT2X8xlZitNC7PbtnQsdF94gbbMlgi2Bfshq8K0E=; b=h7eeq54rzKSOfJ
	LmvJ/+fNZV5JHqptaF/4AkrqwGzqqh0NIPKusaxI+ZfzrBvEcQZSAQ/VQhHGUKEzswcqNCg5cF2xh
	FS0b3hDb3X7FafSjtkHmOjexKrGvozyiy9fUIsMgRZyhZ4v9TTp9X/9vXymxr9Df5YnKYQdidlk/3
	FQECKA8460cg2gleFUJHYq9BMm7JxuJCF/cqRigSK3mVr3nTBno/JESiBxKe6TAXjo8Csv3mIti/B
	X8CaP8tPbSuyhnBItzfyZEnh61iigH4Hxcq4OqABfIyLS+bNzcO2OQHqzgI/BFjmPuacFzogBKsY0
	Cw4kIzJ5YfLKXI7TAleg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5TPx-00000005viD-0y4c;
	Fri, 10 May 2024 16:48:21 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5TPt-00000005vh1-1Ozl
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 16:48:20 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6f449ea8e37so1904671b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 09:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715359695; x=1715964495; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ihZ3Sx8fPzZPf9ilujyNOqj+8UZFSphqaqNUKaRIkto=;
        b=v4aXBWpTvFQizkKZPZQBDXFZGsprRNgb6J8hhiUGgkE7IZTWZQfkr+Txz8m1rVidqD
         mB3ED6hkkZPWzN5mliN/UcS7hTtza71kxEyOuploLGufcNiY+T8eJP2fKWSdZbZoLL3o
         On0y86w9anwI8ohHz2Is4RvCmLFEg5IEZ6Y3wBYlx1WNC7IW96cwnqTaxl9YgG21nYfm
         TI2sSmomi0exCpu1bDcJYnLOvOOHDcTM0HA8ZEaPKXUjSpOkFaf0JXNBP4uBcn2ZrpDQ
         ebxdypTyDTCFvH27RObv96jXrBXlmA540nAEjukjIDodVn2yoaOij4UW+IqqSNnRzz/b
         GRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715359695; x=1715964495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihZ3Sx8fPzZPf9ilujyNOqj+8UZFSphqaqNUKaRIkto=;
        b=jOPkAJ1ax6abkrRC4Cs4NrAOMYT/974O72NBuVWgYeWA9du50+7xNBrXkY6gpa6/1Q
         8dTkrlZtogqA0Rc91zy5xnlKYZVg4Tcix0Eot231wOYxcdpg1p+Uv8pGUp5eHF46m35k
         edc/O7V1/Q8cv1CrVjL157wvA2/Ob6DgP9qqdftYtxT7jtcrh2gqeAYyimHUhyqaTw4F
         24WSS36GwimBSkLPfQQWjAPJxqQqtGKWTnQfPRKJ0eH14fux22f9idd85md/2tjBf5Yo
         /nS/RYoTwMeimFuDVwD5bHXWclfqyunS0g5cE7OgppZefdgDCCDYF2yC/V3oiRuomYmZ
         5ccw==
X-Forwarded-Encrypted: i=1; AJvYcCUcKKpABz579gr9uey+6BpAiy/ZLw4rwJ2rdJdVwDSYwxIMP9mhGpssq06sPUAo4BJg+CIi5xv1DjnYQYQCU1N5W2Ssb/XaFcNmsVe3pRjT
X-Gm-Message-State: AOJu0YwfcCwpFJfqLzaggAuukOwiqtY/ooD2eKnKvPiBxyZIeYqaGTiK
	Nml/kWleM5/6zf9Z/PgLJ1ibkLhq4McUY4sOORRZacvF3te2/DsxRW4IdyWoKsA=
X-Google-Smtp-Source: AGHT+IHpLEI/3ePZ5JdKRtx4wdWEQJ1myHQJQ3vtQl1flGWHwP5k0zJUfUFc7+OdJI6VS+bLHZLVKw==
X-Received: by 2002:a05:6a00:4b04:b0:6ea:749c:7849 with SMTP id d2e1a72fcca58-6f4e02addcfmr3859246b3a.13.1715359693460;
        Fri, 10 May 2024 09:48:13 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:629e:3f2:f321:6c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6341134705dsm3256924a12.85.2024.05.10.09.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 09:48:12 -0700 (PDT)
Date: Fri, 10 May 2024 09:48:10 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Song Liu <song@kernel.org>, Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] riscv: Support compiling the kernel with more
 extensions
Message-ID: <Zj5PykF18T1+RMKr@ghost>
References: <20240507-compile_kernel_with_extensions-v2-0-722c21c328c6@rivosinc.com>
 <20240509-uptown-aging-5bdec4730d70@spud>
 <Zj09IUE5k1EJL08X@ghost>
 <20240509-google-passing-3e7577235c44@spud>
 <Zj1UUIY8RYV1kJLM@ghost>
 <20240510-okay-trade-8826cb134979@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240510-okay-trade-8826cb134979@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_094818_010229_864976E3 
X-CRM114-Status: GOOD (  44.74  )
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

On Fri, May 10, 2024 at 09:25:37AM +0100, Conor Dooley wrote:
> On Thu, May 09, 2024 at 03:55:12PM -0700, Charlie Jenkins wrote:
> > On Thu, May 09, 2024 at 11:08:34PM +0100, Conor Dooley wrote:
> 
> > > Maybe if you read what I wrote you'd see what I was getting at, or maybe
> > > not as I might not have been sufficiently clear. I'm not saying that this
> > > particular optimisation is not worth having, but rather than I wanted to
> > 
> > I seem to frequently give you the impression that I don't read what you
> > say before responding.
> 
> Does it happen frequently? I don't really recall it annoying me before.
> 
> > What we each view as "important" in the kernel is
> > different so we come from different places when approaching a problem. I
> > respond in the way that I do not because I am not listening to you, but
> > simply because I have a different opinion and I am not explaining that
> > properly.
> 
> If you're trying to describe a different opinion, responding to the bit
> I was talking about, as you do below in your latest response is ideal.
> Responding inline but not actually addressing the points I was making
> did make me think you were [un]intentionally ignoring what I was trying
> to say.
> 
> > > see why this particular optimisation was worth maintaining 3 code paths
> > 
> > I interpreted the "3 code paths" as with Zbb + 64 bit, with Zbb + 32
> > bit, and without Zbb. I directly responded to that by saying that we
> > could eliminate all of the code paths that are not Zbb + 64 bit could be
> > eliminated. I should have given performance numbers for these alternate
> > cases too, and somebody should have asked. I agree that performance
> > needs justification, and I understand that I did not provide ample
> > justification in this patch. All other architectures optimized these
> > code paths so I figured that was sufficient justification for riscv to
> > do the same, but I understand that it is not.
> 
> And hey, if you look at the commit in question, who acked it? I'm just
> saying that I think we should have a higher standard going forwards.
> 
> > > for but the commit message does not detail any of the benefits, and
> > > looking at the cover I discovered that it was not tested in hardware nor
> > > seemingly with a real test case.
> > 
> > It's hard when riscv currently is very focused on microcontrollers.
> 
> Zbb is actually implemented in hardware, so testing it in the real world
> is not a barrier. Palmer probably has a JH7110 board that someone gave
> to him is not using...
> 
> > These changes are in order to help future hardware that is more focused
> > about performance.
> 
> I'm not replying to most of your response rn, got other stuff to do, but
> what I was trying to say is that I think the point at which optimisations
> for future hardware/extensions should be merged is the point at which
> those extensions are no longer future.
> 
> > That's why I contribute this upstream with the hope
> > that other people, like me, care about performance.
> 
> Heh, that could be read to mean that I do not care about performance,
> which wouldn't be true.
> 
> Cheers,
> Conor.


This is all a good perspective for me to keep in mind when I look into
performance improvements. I will try to get my hands on some hardware
that I can use to test so I can have some real numbers!

- Charlie



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
