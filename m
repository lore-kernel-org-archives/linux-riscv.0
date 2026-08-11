Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39281C5AD7B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 03:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aA4E9iRqtbP9YnCxIBtP+oxkexP8MCur+jzw73ilTck=; b=WnfVldQyXBNGfa
	I6/n+XR5Zp/OHt+KFveTBM3GvC8ukLCMajJshmNjjf54DzKlMqABAczedsGWJZmynx801gDUaiN6z
	iSqH/wUjTqdyjB+6bKDyiDwIvGaivSl0+9hFgnnjubDGeunZWMC/J5Z68st7/nLng6FIFF6/bA5v6
	RL076W1VsUxOcSN8pcywoGGF9yG4Jm2UFnB6irIQhQcYX2j9ZQOFXPSFf2iudcBGr5AM2JK1ONOhv
	Je80PTo1XyOGiG7IM0Y6Wkx1WMX/wEYRh2Z0vqXh8UtaXDn0BhG1bmnnt9gAxw+2YABSIm/+8cymL
	kMurA7ketgx2V5RDbYGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtdVe-0000000DEA3-3rzP;
	Tue, 11 Aug 2026 03:50:38 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtdVc-0000000DE97-3hpr
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 03:50:37 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cfff5f88dbso39625245ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 20:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786420235; x=1787025035; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UzLQVcGZ5l2XVUGPdqbb3e7Oajp0X5+/MxQRIPlN0dE=;
        b=rFOvE++MQwIdvY6XMkf+GbeAuzX3Im1QSebDmt3hM2Wl6xN2zV0ue8WotPYeqvSHjs
         vYf7mmZr/cAssSFJ/ebkPV8NXuF8r2fraUhqVNtEcNYiusjvWyc2D6FivOeM5et7r/wv
         wB4BOFsPDzx94SfY2+7DxTsmY28eNk19tj4yta3HDv7AYuzRZhBKkhBTBE9fhnxgTej5
         HLarqgVOHQo1Q9gJ3OZT5kXL/hSj5rBryQ2li5qGxsDIVNOU7w798aGGpIAxPPKBEDNY
         Le59+amECi3NhEzXDHicY76a4H9GabANnwCMjzApEWaD64PuJ+nmkHWKjRQE7Du6oGRo
         5eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786420235; x=1787025035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UzLQVcGZ5l2XVUGPdqbb3e7Oajp0X5+/MxQRIPlN0dE=;
        b=WL+2qF3pztV4YjF+t8RcwKgm/d8oPMQxNlQBPq8ZgfF5OX9MOt6vjvvfvYcWcZmv4W
         uOTjU4Leje6bQh8M+3bYq22Z7nCjNtOOjFDTsn5IO/ZRit01npak3zPSHRf05RWwFW+f
         SZM7rikxQ2X78V9Dh3D/3tIRvYWmnCNfh8UiZHruSWd3r7C/0juKtjmW+CnGIYmXL0r3
         EVxSIvazWTPsy0CI+vXVdKcHI4hgN9kZLImuxqtxlWk3+EUKBu5HMdNHg5a3VDXOmASY
         6zbAfUYwGfKLjI6c4H6nzhnXUkU2EnjTma/Gf2GPyMaBStq+wqCRGDge4ZAkz9zdOX0c
         Pihw==
X-Forwarded-Encrypted: i=1; AHgh+RpThbUw9bedDRlTmnHWrXaugMRvR9SpCPg0cYDP4rorfZ/zY1ugNL+nhFrlh3pAC/s+ImMcJvBUCgI0cA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpbXdrnGcMJEpT26UlNkldV1igJIRfRqrILFa27UpWss5u8Kpk
	R/xHhq+xk5Ff+ghUKTe2qv0MInU65529Ol1On1aUKzcwGDjvjX1G51fU
X-Gm-Gg: AR+sD10HINjUIGec+dUOISUvEVa0l1rMwHnICI+nsyAoVpE1t10o0UFrim7zqJV0i+6
	ugdaBvXLJTbbJIbxohJcrbkPs43uhHe9N6rRC32OSM/MZ9mTnuzRyvlBYsmSkQzcGLJzpu6rq0D
	YmERAreGX/beeiVc3rR1t1FCR5il0dwkyuog95+tRN4MC/CBYF/vn09jV8uf2S+mmVpC7+MwNSj
	QZGkO9Io5x0CKnAVSL/XEKoPTIFztABvWJHugZhSak7G14Dbpy62F77ROC905dmCLNnpCMU9UlD
	VrIGCPDIySfv0euVqGA1YoQp5/AlGWDsL5vLYYfInwCLZjs2xLayCidyUBnGJAfXL7alA1Q2j4e
	1/DDMUK8QZpfV2JJaz5U/n/oky1nh6oxEdRRxstZLZWxyLfdnM3Wynxp2zP4RZEip4Mkm4pvtbU
	PKm5pblaf85rCn0G8iGuFHfq5FPHSpPPMjXk76CvE5wJaVsLw5/whppeyXUmBd7rHdfedKHnmlG
	wOc2xys3U9X7v77WnYjWHDvvsSvQrmIMg==
X-Received: by 2002:a17:90b:2541:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-392ec2fc235mr451558a91.4.1786420235511;
        Mon, 10 Aug 2026 20:50:35 -0700 (PDT)
Received: from blinky ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d4050557sm1740457a91.3.2026.08.10.20.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 20:50:34 -0700 (PDT)
Date: Mon, 10 Aug 2026 20:50:31 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ian Rogers <irogers@google.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v8 12/22] RISC-V: perf: Modify the counter discovery
 mechanism
Message-ID: <anqcB37PywQpMhkc@blinky>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-12-7909f863a645@meta.com>
 <178453211938.543975.7016109597042850635.b4-review@b4>
 <ba053fa1-9df5-406b-9f92-df0dcc76ff68@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ba053fa1-9df5-406b-9f92-df0dcc76ff68@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_205036_919721_48D104A9 
X-CRM114-Status: GOOD (  30.07  )
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

On Fri, Aug 07, 2026 at 01:08:31AM -0700, Atish Patra wrote:
> 
> On 7/20/26 12:21 AM, Charlie Jenkins wrote:
> > On Wed, 01 Jul 2026 01:47:00 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> > > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> > > index 74d934238821..c20f1e33c65d 100644
> > > --- a/drivers/perf/riscv_pmu_sbi.c
> > > +++ b/drivers/perf/riscv_pmu_sbi.c
> > > @@ -1599,13 +1658,23 @@ static int __init rvpmu_devinit(void)
> > > [ ... skip 15 lines ... ]
> > > +	 * in S-mode via Supervisor Counter delegation.
> > > +	 */
> > > +	if (riscv_isa_extension_available(NULL, SSCCFG) &&
> > > +	    riscv_isa_extension_available(NULL, SMCDELEG) &&
> > > +	    riscv_isa_extension_available(NULL, SSCSRIND))
> > > +		static_branch_enable(&riscv_pmu_cdeleg_available);
> > This needs to not only check that smcdeleg is supported in linux, but
> > also that it is supported in the SBI implementation correct? Trying to
> > boot this on OpenSBI before 6bb6b61c27eb ("lib: sbi: Add support for smcsrind and
> > smcdeleg") will fail on an illegal instruction in
> > rvpmu_deleg_find_ctrs() while trying to access the scountinhibit csr in
> > the patch "RISC-V: perf: Implement supervisor counter delegation
> > support". The proper mstateen bits need to be set for this to work
> > without crashing.
> 
> Yeah. We can do trap/detect to identify if smcdeleg is actually available
> but that is bit ugly.
> The firmware should make sure that it doesn't advertises an ISA extension if
> that is not avaialble
> to S-mode but that model only works for newer firmware.
> 
> if you are running very old firmware with new Qemu/platform, the default ISA
> extension may have
> smcdeleg while older firmware may not even know about it.
> 
> In reality, I am hoping chances of that happening are rare as OpenSBI
> patches have been available
> from a long time and Linux kernel patches are yet to merge. I have not
> addressed this in v9 as I am
> not sure which is the best worst approach yet :)

I had an old opensbi binary laying around and ran into this. This
unfortunately crashes the kernel, but since there is not a good way of
detecting it and newer firmware has handled it for 2 years now, I think
it is acceptable to leave this as-is.

- Charlie

> 
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
