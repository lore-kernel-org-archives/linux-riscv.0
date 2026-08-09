Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0124C5AC67
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 03:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/96MUe7AF76lceCkC1x7ROLTmRHK9tR3GA8t2JZi6q8=; b=tZQZcVsLVV13rl
	tWF73IN8SMRj267eE+xHopOnLI19epYm+GxJtkOPOJaxmxaPMuIEtQezIbldVRetiUdUhx343XB9X
	AHRiU+taNRJ2c2poy2HnOjTFl8OBpTjcihvJ+VerTlW3Lc0vWVT9o3VLvQXVECOTyoBX4HMlBYRNl
	3nL8Zb9nT/u5fIm0F3aQ8PgilO3kpaZQSzXvGoFkTseV05Ikbv4yf/lcUCDyEdTWJc4HUX+GbrDHt
	UHUSCrwwt3KwT4Jal1vO8ulGYJBBL+120+Y9Z4weJF8fMZEka3t0MHd6uLhU5wQV9aikZpEo5dDn7
	aBP3WQNnS7F5JvfcoWcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsuBP-00000009xDT-3lms;
	Sun, 09 Aug 2026 03:26:43 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsuBN-00000009xCh-2a4U
	for linux-riscv@lists.infradead.org;
	Sun, 09 Aug 2026 03:26:42 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-38dbe53179bso323820a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 08 Aug 2026 20:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786246001; x=1786850801; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+2ZP2VpD4hdDzBsnG2msnBM+iMSdLsJB7PET2eMgj0=;
        b=YnHisOsK4l2dsnWXxBO9eJ++CISU+RORuRWipHn8kqPmPht8SW7sPgkTkZI2Q284Iu
         yX0HAuyNhwvI9poqzXTWWglMbFpVRUSkUwq+7ToUsj6xdAZ1nOOL6HOG5ywAO1Jati72
         KCJKkTsMeOV8ymux+MBJh05Epl8CaaDuajIm2JstNs74J4+818j+JGUEf5hzaaioIXyX
         NuR9JPdLu9002RTeWzmmGpvACFyzjWDaImiPygNa3dEOeXx8KWcv5oI08IvltqWyvsnZ
         F6x7EFMHiJO2vfNc0wcihs7FV3T7dgTSejadXE3nFqJ4xeDfYmDQqQvmb/aClqqthujE
         BEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786246001; x=1786850801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+2ZP2VpD4hdDzBsnG2msnBM+iMSdLsJB7PET2eMgj0=;
        b=cAFePuEG0fA2KX/n/jBGJe+D5r7oFJfKPe+/9J+0wyoM3PHKJk/4GRg1pkC473g3eJ
         KfzoEeeQa1cigVVVscF1s0UCSC+wxcfEWmEcut+avBFy40nYlG0mF5kE5yNrki4Ehx8d
         ueZuCfPONo/bpkfmM6unZo7bHjn+Or5AvpQhWRU4moxF57DQ8ej6DpurA6xR4QzG7Zlc
         1Fo91zn38qHNW46+KvV2U8weWLx+psJ2/qXL2nj8YY//q1HSBS+esqXvo8aUHW9+z7w4
         UzuLoMSnukUsHneEKdOFySlS+JqdrLFjeREx3CEKWmrxi26NGmjYgbcVeCA7J4pl/kaI
         CpiA==
X-Forwarded-Encrypted: i=1; AHgh+RpreOneL0BAygumTDO/8lib5uCRLKgKIa1lufVpuzhZUSCQKdMVXLHM5vidQdRx+0UGd00wvzIjRYS2/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YySB/EmnHFJJ6PN3CIBHMEjLJgBrnr0Qq1ED2lvX9rRAz1IyEEi
	HLSn3pcBi8gdfO3NjuioQL4weSkVpODPgbdcvrmYR9XywADLnmlwXGXe
X-Gm-Gg: AR+sD11xOzGesZ+Rcw2sZivJe4ikWFqyX6zsZi63578rHotvdwS+HdvrguwOMV+cKuj
	VuiRHUEZfpTBSQWNDiWh/B/1nllfXvCCD6cBSmcaCCwmCMD95G5MRiPjiFWENNUQwD7YyEGx9R/
	hC35YXDQ56R5IPmJC6xFhpNJv7CHR6z1xD0/yiRkg38CJu6sTWzgUxEVdoeve2pWcid8Gofg0oR
	QaGswe4ltAiJRGBVp3mOHWYac6ttaJ2Q7EpzNvuyWVLD1/pavxDRHkjXQhTgItWwglig5IQxZX7
	q8Xa7+i2W2KXmH9V0iq5O8tnvuRaoQAqU3I0JnTPfOZCFSUkg52FBEIkECfAG5Tf2h1HOosCESr
	g9A3843D+DNfFzuy2hQkTP3gDDrAJnVU5pGAC66v5O2lMx4dCh/nindsLVTCyUOeVWYMDLQ2iAW
	7pEQz2IODlo+rJzJwR4C3G6IOWuYEjtEZIvA==
X-Received: by 2002:a17:90b:390e:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-392823ea541mr9657081a91.16.1786246000598;
        Sat, 08 Aug 2026 20:26:40 -0700 (PDT)
Received: from localhost ([2403:2c80:6::10db])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b35ca2b7sm3210539a91.4.2026.08.08.20.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 20:26:40 -0700 (PDT)
Date: Sun, 9 Aug 2026 11:26:35 +0800
From: Cody Kang <codykang.hk@gmail.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 10/17] drm/spacemit: add Saturn DPU KMS pipeline
Message-ID: <ko2cc6jyezfyqzg2rdftyebeydw6nfd65ajvu46acfewhnrqxi@om2uhqdlhmzv>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-10-6de34d80e86c@gmail.com>
 <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>
 <wr3264hzlya6zep433nr3u2acukizilkrqpkj444kfqeyaeorj@2rc4zo2cqcer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wr3264hzlya6zep433nr3u2acukizilkrqpkj444kfqeyaeorj@2rc4zo2cqcer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_202641_659945_0502C308 
X-CRM114-Status: GOOD (  16.04  )
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

On Sat, Aug 08, 2026 at 01:03:52AM -0400, Guodong Xu wrote:
> On 2026-07-27 09:35, Philipp Zabel wrote:
> > On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
> > > From: Cody Kang <codykang.hk@gmail.com>
> > > 
> > > +	/*
> > > +	 * Assert before gating: a reset asserted into an already-gated block
> > > +	 * has no clock edges to propagate on and leaves the register file
> > > +	 * untouched.
> > > +	 */
> > > +	dpu_reset_assert(dev, "lcd", a_crtc->lcd_reset);
> > > +	dpu_reset_assert(dev, "esc", a_crtc->esc_reset);
> > > +	dpu_reset_assert(dev, "mclk", a_crtc->mclk_reset);
> > 
> > It looks like these three are mirrored, and could be handled by
> > reset_control_bulk_assert/deassert().
> > 
> > > +	dpu_reset_assert(dev, "aclk", a_crtc->aclk_reset);
> > > +	dpu_reset_assert(dev, "dsc", a_crtc->dsc_reset);
> 
> Is there a reason these two cannot be mirrored in order? Please double
> check. As I checked the vendor tree, the suspend/resume side appear to be
> copy/paste rather than a deliberate ordering.
> 
> Please double-check. Unless I'm missing something, I suggest to bulk them.

Agree, I'll check.

Cody


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
