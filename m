Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6347BC3601B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 21:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNt5LM4tTEV7AfHGeU51+kHABR2/dQVtUN61zNJfuF0=; b=wvCSxGWqCeagAV
	KNiIL9JBh9IOfp8we+/UIo45BqHilUu7gIbKsn/TRXMXOwpsLFu/V8+dYOy/uKHuvTi3clvoq3zkl
	shtY+cAaVb2pTF02r1AaMrc18VEcASQ020WOi02b5/OwsGxuT0XV97DudBBpSaNYrLW5wfInThFLt
	NSGG8Jquj8rgOvQYuwag2HaqL8agQ09bkHxmOmrHWL6CujBwULN/rsi3IBsQesRcYOtGmZfvh+rdI
	Ui4HLCeyfbjPEvuQTtMXpY78W5UzG6NbzVDFVRHEL3PM3v1gEsScHLTtkiDo8/3X3/xeZAkdqCQbE
	wD33Wm4CtATQZxiZgCtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziuN-00000004QAO-2cUK;
	Tue, 01 Apr 2025 21:12:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzikH-00000004OLp-0xvZ
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 21:02:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39727fe912cso2249052f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Apr 2025 14:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743541323; x=1744146123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjmWrNFJq5FsQ91RyEXZTPg7iV8Tf7Wr4X3A+p/WTNI=;
        b=V8nIRT3iJvkqv0bY4MdH6loowuQZZfVE8h2mOZkoThQS1ySSvmpDZKSpyTAsynDraJ
         1A8I5aSxv54VwRHfSKZJuVxPRPR/R7XgRdFMEAFT+gtZ0Fgm4jEfaII1b2kCNlprIeN2
         dgSfnY/bIsiJ/a9B1jeAy3GvoEurziTd/iFxmYh7FZ8JblDcFFP9hQ3LVyLZSJ5KmPS1
         INu5zNytORYAPCqDnF4cgcJhacfKzJlJri9pplmny5YERzoxa13jbcAEuT/XqHkbdTxX
         dPcGdXetlriErIaET4DgmVkL/D0BBnHTDJ7RLBtRIKwDpgHWh5dKbPlLe2rTEue02G3V
         m41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743541323; x=1744146123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjmWrNFJq5FsQ91RyEXZTPg7iV8Tf7Wr4X3A+p/WTNI=;
        b=WQtezbvClvMdzaAya8pcSm1Cd9OyC0/e/fnsc41f9hltk7kjiV7ZM5FNIkMosJqohb
         QeSUOG44F4qbr1hDLrXdz+L6kCyZw0nUSEaC+Uwehn7Wsudsbt/3kvzoBg+tcCOgOkYq
         HDx/rB7U77Rh8U0EhlihxW5LjDXvRMX+c8tfM87jg5nWvuPr+gaeyv2ZZSre9lrkPuAl
         786WEeT0ZbyIzvujakBdt8LqC5LcqNDxJfABH+qX8+hueTxJNQ3FPAwamID5hP4CvjAQ
         pDAUP7vfN9mSIUFXDZz5jLIUEZAOSawSv+8Kw5ZhAGZcR/cADGIGS+enbNMwoFpki5g/
         mE1w==
X-Forwarded-Encrypted: i=1; AJvYcCUvT/Uok/8YpKjS9AG3+nrdoljlnZMpdWwd4jwM6bMr00iJQwsi/ynRmS8vQXUffM/0kfzvZwq+YXXjUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFpEXB/1ARZ/tnIqqo5zndeiLfbbpiLYrmJPqcoS56vXfAlI/G
	KDl4jmA1HJfs3UD4CNLDuGZFPTIh51+V5uA32Xe5n4iYONJEAroD
X-Gm-Gg: ASbGncvt/T2RMsyM5qK27VRVDFtFtBokusYDwDZ9Q93nzjzYxBHzDzt/N5x/Lt2elUH
	u4P9pF9QAc/iZlkxtu62yBkuHiw+9F6DDTTHIfzwktmPg3LbynTYwrtAqQKcEnxHhLM/AQvhBSB
	iBS4XDHrDPiHrqgdusEKGcdd3bGG8lNt8yJZJtioDPwiJQ8B8vHGQbPPiz57sva5gW1sxbDX418
	kcIqS8MSmLDMIyKvSl2StqJ5lIq3CpbYtWX+YNyVpa2inZbZxCr8eTJX0ken97mcXPsPkdpg6tj
	6SQhYWQes+ufaz0JbEBrs/0mMfNK1TiNLE6Otoarll3y6KchQQnjTNMnxompmtGsCqpa86xmOUP
	1Zhf7KNk=
X-Google-Smtp-Source: AGHT+IH9YPMWiON4QM+xaQnB5yqCP10tZKboZ8LNviXyPWzJfgh/M6Q58FlmTI0dL5JuYBp5qZxPFg==
X-Received: by 2002:a05:6000:4023:b0:39c:119f:27c4 with SMTP id ffacd0b85a97d-39c29767c83mr14733f8f.30.1743541323342;
        Tue, 01 Apr 2025 14:02:03 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c1845e66esm9181665f8f.18.2025.04.01.14.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 14:02:02 -0700 (PDT)
Date: Tue, 1 Apr 2025 22:02:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Xu Lu <luxu.kernel@bytedance.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, alex@ghiti.fr, lihangjing@bytedance.com,
 xieyongji@bytedance.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [External] Re: [PATCH] iommu: riscv: Split 8-byte accesses on
 32 bit I/O bus platform
Message-ID: <20250401220201.1fa3ec76@pumpkin>
In-Reply-To: <20250401154412.GI186258@ziepe.ca>
References: <20250325144252.27403-1-luxu.kernel@bytedance.com>
	<9F043708-3BB6-46CF-BEC3-2636E9A388B7@jrtc27.com>
	<CAPYmKFtAWNz7nCDDD7rjGeV2fRBgy5Kt6KR60pEyXAM=bb7r4g@mail.gmail.com>
	<20250401154412.GI186258@ziepe.ca>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_140205_290940_E8024C4C 
X-CRM114-Status: GOOD (  19.30  )
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

On Tue, 1 Apr 2025 12:44:12 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Wed, Mar 26, 2025 at 11:26:07AM +0800, Xu Lu wrote:
> > Hi Jessica,
> >   
> > > Is such a platform conformant to the specification?  
> > 
> > We have talked about this before [1]. I think the IOMMU spec does not
> > mandate the implementation of 8-byte access functionality. The related
> > sentences are listed below:
> > 
> > "The 8-byte IOMMU registers are defined in such a way that software
> > can perform two individual 4-byte accesses, or hardware can perform
> > two independent 4-byte transactions resulting from an 8-byte access,
> > to the high and low halves of the register, in that order, as long as
> > the register semantics, with regard to side-effects, are respected
> > between the two software accesses, or two hardware transactions,
> > respectively."  
> 
> I think the commit message should explain an anyalsis that the code is
> safe against the mentioned side effects due to ordering.
> 
> And a comment should explain this:
> 
> +#define riscv_iommu_writeq(iommu, addr, val) \
> +       ((addr == RISCV_IOMMU_REG_IOHPMCYCLES) ? \
> +        lo_hi_writeq_relaxed((val), (iommu)->reg + (addr)) : \
> +        hi_lo_writeq_relaxed((val), (iommu)->reg + (addr)))
> 
> As the naive reading of the above spec paragraph doesn't seem like
> there are exceptions or why one register has to be the opposite order.
> 
> Also missing () around addr

It is also double-evaluating (addr).

I hope there is a lock, interleaved accesses from multiple cpu
may not work.

	David

> 
> Jason
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
