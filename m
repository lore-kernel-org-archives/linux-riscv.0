Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE89EC8742
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 17:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xKs+hKt5RxJTa6FI7rL3nNAiuEYXjne0m9/SlqrbMo=; b=rtqVSPSfSsEIFb
	3d7kEr3+Wpx8GZdi6P7TQckFBS8NLt4fTaLi6v7jaXyKh10xZHz4uUf/fDRdvVec+9V8btV59tafn
	9Wg1I4qOUMkDkYGkQ59R9RxpBTywNtfBPGyGn8vKKmxPZuoPZGGXEzHiDyaPEDMbR0yOmt+uoSSFv
	OuRQKR0eActm5AAoIBade51v9Olcs+Y8so6Qb2wD0u8O8FskxXj104eGBGEkWNjxOK3nsQJyDWnFZ
	D2B1u70zZhE/l0Te5S6imC6Nx0vjz4TKeaA/Dw6qu0eGYHz6sLeat68grdrXo62r/VsbugpBd55tU
	6YPfB10lZMrELyxBdRfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeJ67-00CV3T-1r;
	Thu, 07 Sep 2023 17:47:19 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeJ65-00CV35-0v
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 17:47:18 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-68e403bb448so589249b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Sep 2023 10:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694108836; x=1694713636; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HkNuLpADsq1HxO6p8F6ChifHRIKFqFA3PCMXwO6LXU4=;
        b=sF1SbbIK62trMFsKwKajbvJx6Ghz1grQDXS/bn4DPO7lYROHdVH/aaYUYul1j/gv+h
         /TkCgxjULJb+p+PtiSVGgH7qeViKyGH+Z0D0tIDPhS3OO1dY894Ye+g+JOmMPuC38+uI
         sntKtNM08mQhkvq+LZ/iI3SrpgJucYO+XT6ek6kci9v5nEdUsV6QzJE9vSmPB5DXjcYI
         65YRJc8PTotWq03+KNR6I2mkOOn2ZAu2pez1HRyYHyo3gf61x1bCgcmhigYPvHkoYfXr
         27426YPt7433rTQ/FTYA0DvevV+ku7/FQso3XB8BCsOQaXBI1u4maNGu9rkMXJb3Tchp
         76DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694108836; x=1694713636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkNuLpADsq1HxO6p8F6ChifHRIKFqFA3PCMXwO6LXU4=;
        b=v1UZ0PfuVu8/8dPlaHrF49WjZTG+6RYAiPSjgEG/r8iycdraZFT/XLCpJ86pfixS49
         WJKv/kvpZo/+W7umP6VXwIqINXRCtPVQW1/8/apYCo5OScVMUcfbQtHL+AFux1EGXSqA
         oCPnWP8iRU7ZkpTITgywnEMjY/WJP1k/qy5ED7XalwLLEca0zE8dhtA49BNHkhJBQ7Hr
         ZbId5De84SIu9w1iLmFNJUIziwNn92b90wd4BJOxVZC17yhifSYLEjd5Y1/G54iv/hQA
         Bt3nGlC0VxFQianOd8L/lMyLejTntAu/Q8Ve0Wm+1Kc/KA5MCWcWGcTUOQYGVnrFcJZL
         8Ltg==
X-Gm-Message-State: AOJu0YwJ4EsuZYiWJw37Qr1/POVxDl1BHM1R4nB+QZudNxNqjNmkGODA
	uIzdr7LG8WVcqFBW71BDWWJsq2yLbd/48+Xoptc=
X-Google-Smtp-Source: AGHT+IHtGyzHQWdfOQOsK2cxB6aenF+V0LcJKTzFVrUzD4aaSH/IBNPbrk+n11AmEY9FSvaZ0QhLeA==
X-Received: by 2002:a05:6a00:2995:b0:68e:38cf:9de8 with SMTP id cj21-20020a056a00299500b0068e38cf9de8mr3964462pfb.9.1694108836223;
        Thu, 07 Sep 2023 10:47:16 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:84f6:5055:9180:822])
        by smtp.gmail.com with ESMTPSA id z12-20020aa791cc000000b0068844ee18dfsm11025pfa.83.2023.09.07.10.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 10:47:15 -0700 (PDT)
Date: Thu, 7 Sep 2023 10:47:13 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 2/5] riscv: Add checksum library
Message-ID: <ZPoMoVnUjNzr+OXI@ghost>
References: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
 <20230905-optimize_checksum-v2-2-ccd658db743b@rivosinc.com>
 <20230907-9d5d2e7ef2a20edd75514470@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230907-9d5d2e7ef2a20edd75514470@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_104717_324902_CD39FF47 
X-CRM114-Status: GOOD (  17.02  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 07, 2023 at 10:52:35AM +0100, Conor Dooley wrote:
> On Tue, Sep 05, 2023 at 09:46:51PM -0700, Charlie Jenkins wrote:
> 
> > +#ifdef CONFIG_RISCV_ISA_ZBB
> > +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> > +		/*
> > +		 * Zbb is likely available when the kernel is compiled with Zbb
> > +		 * support, so nop when Zbb is available and jump when Zbb is
> > +		 * not available.
> > +		 */
> > +		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop",  0,
> > +					      RISCV_ISA_EXT_ZBB, 1)
> > +		    :
> > +		    :
> > +		    :
> > +		    : no_zbb);
> > +	} else {
> > +		if (!__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ZBB))
> > +			goto no_zbb;
> > +	}
> 
> Again, do these constructs have an appreciable benefit over doing
> if (!riscv_has_extension_likely(<ZBB>)
> 	goto no_zbb;
> 
> ?
> 
> That encaspulates the fallback to a non-alternative mechanism for you,
> in case you had not noticed.
I got caught up in the other patch where I did not want to fall back, so
then in this patch I forgot I could use riscv_has_extension_likely. I will
make the change.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
