Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1620C36010
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpC2nE3QfUvHAuwHVDGl8Sau03HUnKP1kIeTisx9Joo=; b=aY3rZCqKnsTfuG
	uQfC7Fsucg7N/9nB8JH9hYlebuofJdTy1nAMkYZSg5O4EmIYBS6EXpsdRP8jNKv/pBbbTNm2gerze
	sYzNVDl55UUShIqZ99y4c45A1CCAb1YhnVoGUP6KAfv5hCqIziCfYs5Qp54RlQuGrtrJQwElLx4zh
	awGXJf6PUNxPZqyVf5epTwqWU6qd98zlqfkQ3fP55K2qXGAuBdv71pBQE7TfUoy3Kyg8vfOcyN0E3
	mhbEWl/V0/7ht2DyL+0j1AXyQa55cTOkXRVN96+zUmVfXaZWse6u/pYmxmWTsur+GXJSX9PJ0gFwJ
	pFtf7uKHNKCO234ihSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdq8-00000003lOR-03uI;
	Tue, 01 Apr 2025 15:47:48 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzdmg-00000003khH-1ObT
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 15:44:15 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7c5e2fe5f17so556873385a.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Apr 2025 08:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1743522253; x=1744127053; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TtdWsRwfUOBxgsIg+kVSTkMJUa8tV9VXtloNeO/dNoo=;
        b=eoasdZSx0dI+u373p168m5IffjJ9CxqUBFAH4JIU3Us/UPdIyuBFdu2oYl+Ehn/5MT
         nbsphA2Yf18dMjTPqdZSXUR3BEim1XscnXNo0IRIpaRNq9P5V+p1PgsUhZqp2QW0Crus
         vQiPkDblRZbL+iu5iIrKqMq0rTL/ckNHc9pWvVBJjM025je1DXEjYGXc13QJJCJpKLWp
         Vj+0T7uipBpuy42Mx5UoSsHJd3U3sQ9GSmIo0d0Zi4vYAniFMPEHOG1cGweQPKEG6RmD
         vu1rFzAgzG9AodCDC1GXMNHVBJKXi0vcwzLLoznl4v9VC4s3vV5KoiRI2/zoFkcZuKjN
         RONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522253; x=1744127053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtdWsRwfUOBxgsIg+kVSTkMJUa8tV9VXtloNeO/dNoo=;
        b=hMuvknuSp+XO4H0+nkrz3jN7eI/Vh/3ewEIBaixDnBhZR+ufpMaNRfGBcu3N8MMvq6
         KdyZrvB5unrZ4BtiULFlJ3NclzZSuUE/ppQvfKfwJFS+11KY9PZI5veDQickaBPWavvD
         BWiWSVKRrpbrai62MEEAz5kjkgGLd2rXHCNoT7HDg0d+0/13BFOF2B9YXp+pS3rBZ3Oo
         wKcS5Ws5VzSHlTozrGGfD8X9WH2dyfZ3RpdwcZ52sxsfYbAty0TEZxYhq8QLOeDS7Llu
         25HyXfkFUU4AoR6ZDNE38ahocKq3NE1St7fm58IGCAHryLPinx7XaWOSfaw1zCJfoj3p
         9mJA==
X-Forwarded-Encrypted: i=1; AJvYcCXPlFG/qLnE9VtyJyPWrFbXNYs8eSk6CAQZAuatawirUGPJ6ckAL/VVTT4TVZzxYawYY8aNDPABilQGXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdxS1QjU6SjkrGMJkVbwP3UGDpHaQZkJGnBsSh8MO4cvdC+z0R
	fLCKq8ANAYWciruORaROxWZ2ROuoDGDNi00bn8nJ8G8682oUlYSKR4M296zxGY4=
X-Gm-Gg: ASbGncsWoT/niBYyL9maR+aIqbpizRDlp6U8RinjGnTvToB9KZaBcprmkzrenq/472a
	WTQo6ilnlLTA85JaF7i8ercDvd18n8RH3T1ML+kvdL+NLZ2AnaHtFotUexfWcQAgAOIo12DJnFM
	/7yQkT8uut7krELGbwr7McxjMbcTWiCfRoJg+cI3GJyBZ8RyBowHVJjKY5xyPfm6EOdpe/3OVlQ
	TmLiQqngRwA4WjYCu3NkouEvTCK8rudTnP2X2b9sfy8Gqi99wLJBmmjecWK97ToPxCbLYpYzEyA
	sM0uHDhjj0pLPelukXdKzapdtxoYf3coVDUJPPdGmyOVqFNt0OKNwHWMCjJLaMMM87hGwKzjaAG
	mD5InJfY7sOSQeR51mm/5F0Y=
X-Google-Smtp-Source: AGHT+IFNoRzI7w1svFEnu6uSg1a7Al/lfHMRAFbRiHbN38KY+jMtZlEEZoz8sPSAU2QwNot8xAw/Fw==
X-Received: by 2002:a05:620a:1a91:b0:7c5:9ac2:2a7a with SMTP id af79cd13be357-7c69089246emr1907329985a.47.1743522253345;
        Tue, 01 Apr 2025 08:44:13 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec97974ffsm62920086d6.99.2025.04.01.08.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:44:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tzdme-00000001MBc-1Y2l;
	Tue, 01 Apr 2025 12:44:12 -0300
Date: Tue, 1 Apr 2025 12:44:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, tjeznach@rivosinc.com,
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	alex@ghiti.fr, lihangjing@bytedance.com, xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [External] Re: [PATCH] iommu: riscv: Split 8-byte accesses on 32
 bit I/O bus platform
Message-ID: <20250401154412.GI186258@ziepe.ca>
References: <20250325144252.27403-1-luxu.kernel@bytedance.com>
 <9F043708-3BB6-46CF-BEC3-2636E9A388B7@jrtc27.com>
 <CAPYmKFtAWNz7nCDDD7rjGeV2fRBgy5Kt6KR60pEyXAM=bb7r4g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPYmKFtAWNz7nCDDD7rjGeV2fRBgy5Kt6KR60pEyXAM=bb7r4g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_084414_375031_99211B6D 
X-CRM114-Status: GOOD (  13.39  )
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

On Wed, Mar 26, 2025 at 11:26:07AM +0800, Xu Lu wrote:
> Hi Jessica,
> 
> > Is such a platform conformant to the specification?
> 
> We have talked about this before [1]. I think the IOMMU spec does not
> mandate the implementation of 8-byte access functionality. The related
> sentences are listed below:
> 
> "The 8-byte IOMMU registers are defined in such a way that software
> can perform two individual 4-byte accesses, or hardware can perform
> two independent 4-byte transactions resulting from an 8-byte access,
> to the high and low halves of the register, in that order, as long as
> the register semantics, with regard to side-effects, are respected
> between the two software accesses, or two hardware transactions,
> respectively."

I think the commit message should explain an anyalsis that the code is
safe against the mentioned side effects due to ordering.

And a comment should explain this:

+#define riscv_iommu_writeq(iommu, addr, val) \
+       ((addr == RISCV_IOMMU_REG_IOHPMCYCLES) ? \
+        lo_hi_writeq_relaxed((val), (iommu)->reg + (addr)) : \
+        hi_lo_writeq_relaxed((val), (iommu)->reg + (addr)))

As the naive reading of the above spec paragraph doesn't seem like
there are exceptions or why one register has to be the opposite order.

Also missing () around addr

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
