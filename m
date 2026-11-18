Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D2F606A330
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 22:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wHbeOkUx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PS6AhOjc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Na6yTrSaYxFPIrtjP6I+YJNz4JRO6r0WYHwPt7VbELs=; b=wHbeOkUx7s0Gihb4Z7GJNC+WEt
	foo59UbekYfrLU2VfZi7VK9++3aTnArRZln3GV0Kv8+KDIlQKsGP03314a1JTAl6oPMn8lqyukCA/
	tn/UWCQnYIuFBGRcMnjQCAj471GYWR6AqhzVJrr/oK0cjN+ADsJPxYuJl+mLJH1D/dX0JatPqYA+n
	TsAQbvZVMOEHvCYvGMVcFzr014Pu3kgpFEJoi1cAhb7pb5+bd454RqsdEH5CaK+NYClacXD1zNi9U
	BK8VQJw3LaU3SViQ+u0GrOxRNf4JIltsjRerwpNc+Zf1sWkqUk5LnJBByvPp7nODrEu1Ch+wGjy/5
	Mz4BjGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnpb-0000000AOCa-19JL;
	Wed, 18 Nov 2026 22:08:43 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnpW-0000000AOAp-1706
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 22:08:40 +0000
Received: by mail-pj2-x03.google.com with SMTP id 98e67ed59e1d1-3b18c01238eso454530a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 14:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795039717; x=1795644517; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=48GpV2tL7XVTAarQnrcMPM8Usr/dY/fptCTJVKAYBQY=;
        b=PS6AhOjcSbrmFxGa7VsGPcSnrPls4Jq/xzPlOK9bvwvuJV4wPuTYixsbt6GEBeh/bZ
         tGcIrF8yWfVnzeoD5nkndCu9f4Xg9hgCmRRoVYJrEvFv/pqNqgOmax0X4iLyJpgTf94d
         ubyy1PB02ytRdJ/3mNz8+QmxU7F/hW2vpXcefkG68ekYN/UiwV+muRgZFHSChTdv2i1q
         aWaVvRGQ0AcmGH1O1QEgpDF3n+ioOyP2JRqmU5dlmX45fQFkMKPmtGCSuukvnFWWN4AG
         fLv1cKv0W88xEuDJtiDSeb3YgTWnXlk5EVrfgpjG9Glp2PxBCI7Tln2tjubzMzB3/po5
         +kJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795039717; x=1795644517;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48GpV2tL7XVTAarQnrcMPM8Usr/dY/fptCTJVKAYBQY=;
        b=tqiRGQ9wBnxunfU2vJY/yE90QodKj92z01vyCBHbcVFkVikmphs6ZgyyrgQu0taWzY
         MBaqnwv+m6TlvKLyG/+dzD/IVfGJWYXOryH0Fp1un13UrHRS2NyG/lYf6T5NzyLOZFIf
         1FSEPCwRNZ36dYi5VI2PBn7PPEKC0q3fItwr6yUERuuI4xdJh+SDsL4pqnZIum03DHm4
         AHPzZROQ/a5cBFGHqUxhNVFf+MC64oL6BP6lpwk3ufflgwypglhlhWZHHFZJMi5l6fTB
         GHx72PrLZZKPZur55Mcw4MbPj5qoil0rbwiIyQjfds0x6CGSNBifRWUwWuFI6xPyxEsN
         FBoA==
X-Forwarded-Encrypted: i=1; AL+hErG7pm0Mz7mqtIvd2F9xAc8UQM9fxU06GgiSo8tfhQV02sJguzYoX/MOUzOOkVbD4ShqNd7xg9Hc+PU1LQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8E2eyI3QRxeZvmpWu88GFnvidcdQKCBY5iPErtvRwfUDPryB+d
	2inVet20So6aCvP0M9XZmwClGG4XyybvoOe8+dT45uHyt6SKiWcgnwTG
X-Gm-Gg: AZFdTZcnIfnQW3+kRVkopYTpZarFqsUtmqTu9oF+FYCvat7cy1OllLcvVkQ4J1Dbn/a
	CXuiRWKkmEBsii0ciljIpf8aCywA8vxJLDlDHIBBovgUBsHgmK34gPGoCt3ycgihU8dSEnL829l
	8Ez3JE5z/10AMnEwW04wzonreQlTkpkNIhwPXfe7gMyhiIUV3eeX3rAHJ9e6OSY+C9bbxzzxHzh
	DLCZuvWvYE8u8J15uImqudHxPkaYcu1cvzzLOPJJ6TKxT3TCw7+fiIXfpEhsp6j+3hVUlpFUCwV
	k3BlzosfZY6Ei5v+zU/FAXn98XMP2OvILrbSaWobuoePd539KF9Xehh+Z+APgYSo+j94rNllt4A
	S6SyQqle1Q3wGae0AG+e/tTGfR0+TdJCCbHhnRF9M23V852V8MyNMYWcrUWSRA6E74PqTIdQqrB
	HtUq+lRhdnlhhFgBg9aIZscP5nLCgC9YtCUMskqHU0h12BOgBS3cpIAI2qO0EioVirJ5egIOj3N
	V8icCre1I7zdHb4Aqq7Q1Cemx4ggZw+Dh0WDL513WHdWKPVZvN0o0/LJmOV5aD9DVTPzpjAYBhX
	F+s=
X-Received: by 2002:a17:90b:2ccf:b0:3b3:cb22:72d0 with SMTP id 98e67ed59e1d1-3b3d07656e8mr4366165a91.29.1795039717105;
        Wed, 18 Nov 2026 14:08:37 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe09df73sm93624a91.9.2026.11.18.14.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 14:08:35 -0800 (PST)
Date: Thu, 19 Nov 2026 06:08:29 +0800
Message-ID: <aef6553f89eba87f753b048a87e3080e.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 10/17] drm/spacemit: add Saturn DPU KMS pipeline
In-Reply-To: <f0b2beb9-d0ad-4870-812a-fef530a964c3@suse.de>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-10-327d7910bf71@gmail.com>
 <f0b2beb9-d0ad-4870-812a-fef530a964c3@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_140838_321657_EE55FC87 
X-CRM114-Status: GOOD (  40.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thomas,

On Mon, 14 Sep 2026 15:58:39 +0200, Thomas Zimmermann wrote:
> Hi,
>
> please find a review below.  I've only mentioned most issues once, they 
> are usually throughout the code. Please fix all instances then.

Thanks for the review. Will fix all instances.

> Am 09.08.26 um 15:14 schrieb Cody Kang via B4 Relay:
[...]
> > +	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
> > +		u32 rdma_id = to_spacemit_plane_state(pstate)->rdma_id;
> > +		u32 layer_fbcmem_size =
> > +				to_spacemit_plane_state(pstate)->fbcmem_size;
>
> If you need to check plane state, please do this in the plane's 
> atomic_check. For atomic commits that only change plane state, the 
> CRTC's atomic_check might not run, I think.

Will do; the check moves into the plane's atomic_check.

> It looks like this code allocates memory. This is is something that 
> should be done globally.

It does not allocate memory: it partitions the on-chip line buffer.
With one plane per CRTC nothing is shared between planes, so the
plane's own check is enough.

[...]
> > +	if (!drm_dev_enter(crtc->dev, &idx))
> > +		return;
>
> drm_dev_enter() and drm_dev_exit() protect hardware access. Given hat 
> you have a tracepoint below, you certainly don't want to return here. 
> It's is better to write code like this
>
> atomic_enable() {
>
>    if (drm_dev_enter()) {
>
>        // do HW access
>        drm_dev_exit()
>    }
>
> }
>
> although not many drivers do this.

Will do.

> > +
> > +	trace_spacemit_crtc_atomic_enable(a_crtc->dev_id);
>
> Why is your modesetting code is filled with tracepoints? Most other 
> drivers don't need them. There is debugging infrastructure available in DRM.

Will drop them.

[...]
> > +		ret = reset_control_bulk_assert(ARRAY_SIZE(priv->pipe_resets),
> > +						priv->pipe_resets);
> > +		if (ret)
> > +			dev_warn(a_crtc->dev,
> > +				 "failed to assert resets: %d\n", ret);
> > +		usleep_range(10000, 20000);
> > +		a_crtc->first_modeset = false;
> > +	}
>
> Just no. This code belongs into driver or platform init. It is 
> definitely not for mode setting.

Will do; it moves to probe.

[...]
> > +		usleep_range(10000, 20000);
> > +	}
> > +
> > +	drm_crtc_vblank_on(&a_crtc->crtc);
>
> I'd say you want to enable vblanking after programming the display mode. (?)

Will do.

> > +
> > +	spacemit_crtc_init(a_crtc);
>
> The code is full of these tiny helpers. Please inline them. And please 
> also avoid the callbacks that these tiny helpers invoke.  The DRM 
> interfaces are your abstraction interface. Please don't introduce 
> another one.

Will do.

[...]
> > +	/*
> > +	 * MMIO on a clock-gated DPU stalls the bus, so an in-flight handler
> > +	 * must finish its status reads before dpu_pm_suspend() gates the
> > +	 * clocks.
> > +	 */
> > +	if (a_crtc->irq_online > 0)
> > +		synchronize_irq(a_crtc->irq_online);
>
> This irq is unrelated to vblanking, I presume?

It is the vblank interrupt as well: the one line carries the DPU's
vsync, config-ready and underrun status. The synchronize_irq() is not
about vblank, though. A register read on a clock-gated DPU stalls the
bus, so a handler that is already running has to finish before the
clocks stop. With the move to runtime PM (next point) the call will
sit in the runtime suspend callback, ahead of the clock gating.

> > +	timer_delete_sync(&a_crtc->cfg_rdy_timer);
> > +
> > +	/* Close the ISR's MMIO gate before the clocks actually stop. */
> > +	a_crtc->clocks_on = false;
> > +	dpu_pm_suspend(a_crtc->dev);
>
> This whole DPU PM stuff doesn't seem to belong here.  There's are 
> device-PM ops for controlling power management.  It might happen that 
> compositors disable the CRTC for simple mode setting. This should not 
> suspend the whole device.

Will do; it moves to runtime PM.

> > +	spin_lock_irq(&drm->event_lock);
> > +	if (crtc->state->event) {
> > +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +		crtc->state->event = NULL;
> > +	}
> > +	spin_unlock_irq(&drm->event_lock);
>
> You need set up the vblank machinery to send the event on the next 
> vblank irq. See [1] for a simple example.
>
> [1] 
> https://elixir.bootlin.com/linux/v7.2.5/source/drivers/gpu/drm/drm_vblank_helper.c#L51

Will do. The event will be armed from the config-ready interrupt
rather than in atomic_flush, since the next commit must not start
before the hardware has taken the current command lists.

[...]
> > +	trace_spacemit_crtc_atomic_check(a_crtc->dev_id);
>
> Please don't add your own tracepoints.

Will do.

> > +	ret = spacemit_crtc_atomic_check_fbmem(crtc, state);
> > +	if (ret) {
> > +		drm_dbg_kms(crtc->dev,
> > +			    "failed to satisfy fbcmem size for all rdmas\n");
>
> Drivers should only use drm_dbg().  drm_dbg_kms() et al are for DRM core 
> and helpers.

Will do.

[...]
> > +	if (WARN_ON(!crtc->state))
>
> There are helpers like drm_WARN_ON() et al. Please prefer them over 
> WARN_ON() and other non-DRM counterparts.

Will do.

[...]
> > +	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
> > +	if (ret) {
> > +		dev_err(dev, "failed to initialize vblank\n");
> > +		goto err_unbind_all;
> > +	}
>
> Better do this after running drm_mode_config_reset().

Will do.

[...]
> > +	/* The programming paths use the raw rectangles, so refuse to clip. */
> > +	if ((state->src.x1 >> 16) != src_x || (state->src.y1 >> 16) != src_y ||
> > +	    (drm_rect_width(&state->src) >> 16) != src_w ||
> > +	    (drm_rect_height(&state->src) >> 16) != src_h ||
> > +	    state->dst.x1 != state->crtc_x || state->dst.y1 != state->crtc_y ||
> > +	    drm_rect_width(&state->dst) != crtc_w ||
> > +	    drm_rect_height(&state->dst) != crtc_h) {
> > +		drm_dbg_kms(plane->dev,
> > +			    "clipped plane rectangles not supported\n");
> > +		return -EINVAL;
> > +	}
>
> What's the matter with this code?
>
> Allocated buffers can be larger than the display mode. If the hardware 
> cannot handle this, it might become a problem in some setups.

It worked around the driver programming the unclipped rectangles.
Will fix.

> > +	/* One-dimensional sources are invalid (only 0x0 = constant fill) */
> > +	if ((src_w == 0) != (src_h == 0)) {
> > +		drm_dbg_kms(plane->dev, "unsupported src_w %d src_h %d\n",
> > +			    src_w, src_h);
> > +		return -EINVAL;
> > +	}
>
> I'm not aware of any driver testing this. The above calculation of 
> state->visible should have detected this case.

Will do.

[...]
> > +		cur_state->mmu_tbl.size =
> > +			((PAGE_ALIGN(fb->obj[0]->size) >> PAGE_SHIFT) +
> > +			 HW_ALIGN_TTB_NUM) * 4;
> > +		cur_state->mmu_tbl.va =
> > +			dma_alloc_coherent(a_crtc->dev, cur_state->mmu_tbl.size,
> > +					   &cur_state->mmu_tbl.pa,
> > +					   GFP_KERNEL | __GFP_ZERO);
> > +		if (!cur_state->mmu_tbl.va)
> > +			return -ENOMEM;
>
> Resource allocation/deallocation like this should better be done in 
> begin_fb_access/end_fb_access when you need them for the commit. 
> User-space compositors might send in a large number of states only for 
> atomic_check'ing. There's no point in allocating actual memory then.

Will move the allocation to prepare_fb.

Cody

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
