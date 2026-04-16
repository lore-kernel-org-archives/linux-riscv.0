Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9638F8D746
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2026 13:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RmMiB9zyvPkIUW1uIGy0hhIJIPmi3z+9jhvy0/NWeaI=; b=Hg3urnmMHh3CB5
	x1bYnSEt/3F4LA9N1YK/ov4kFDq7X1GLzgE0HZekojnI0o6SgfJUqfNFfZQxpwyyS+BPDVh1Cc0ei
	1YbXi7HWdqKCcDnv27nDBLt7Qt6PIMtnMklyyki4w3ppVJkmz014/2HhFnm2cf5Vd5t/Qc+H0dRJV
	R6UqGhM/SmbgKmvfIrHOaiifNNfuZ86AVFrMovzina9GuR5lh9KMAMbu+6Ocn+xb0FCd4rGW4P+L0
	ZZXH7yGYxlun9h2HkEoTr2brej28BpY38PBzgxoU0c6vtLc8y+ONX2KQZS5PvLGABz9nZj4mWbB3g
	6C9uJJhbvTgroDLQcFCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDNEb-00000002XGk-1lC9;
	Thu, 16 Apr 2026 13:58:21 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDNEY-00000002XGG-1Msw
	for linux-riscv@lists.infradead.org;
	Thu, 16 Apr 2026 13:58:19 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-651c366f7efso4850248d50.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Apr 2026 06:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776347897; cv=none;
        d=google.com; s=arc-20240605;
        b=daE9QUzZ2Rp1MAiWrXVenQP32POkYBeSdpLt3qKopbIz8Whkqd8G7JmGLA2v1ullib
         rDHJnOcrPjmIVylXckqfviGjdNUOOnELKhw5nbtnSDWr44Moa4bFGunlsCWrcfEy5Zay
         Z/fIdWwbbzgdsOj4fzLMbwGFD6WfumKWNfA7MwP8WMz8oO5UjfYoNrLmmGZsIWkhBRCy
         OvK4YCJhNBb7pHt8b4L8HNtinCzRSog6SvMmrbCREr0AHWVW4v+mjgb/6w8iHxo7kVSS
         hyNYRlu45kP8+v4DmltBUDynVrceMdBKLm2lqmDzYQeK7PoXMhCxaUmqL9roInLjT9j1
         FHLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bkcqnzcdGwh533gIx3Rxb25n/lc97a/7GxLLYQuAYoo=;
        fh=p9CgbITmEBsdySdRFzjT3ra23hmHZ+NzL5ghUrPVBws=;
        b=iWEJU9f1lk40SlGI5yz4UPUBkhLNcJXmBJpPAlM/zvqwqzRfhp1jbL8M3Volqem9r5
         VXiO8dh//M/Jc1ZBrdMJIbx/aNnQlwLsxjn970xM6pcN1E7nf1ph4urIIw5GAvANOhT6
         Cb4gaoLgq6oodpbzdZ75Pwpc/7j+JlDQ2A/PURu5pEuyMf9cRJIXzH81dBWj1stkaQ1J
         JH26DXjJk6flYZkvbSRzyoj+tF7xRLMAKQ2Z96ow0AKQpVRz9WlWjWEkdPQU3F+swlcG
         WizgryoYCdhcR0QqCcdNeplcMqCtq2YOZ5Hmc9r2euo43AjvZOsroY8BpHmv+kVJKHhD
         CNwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347897; x=1776952697; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bkcqnzcdGwh533gIx3Rxb25n/lc97a/7GxLLYQuAYoo=;
        b=J0ZjO7gVNFEyccdXKS4boHdYmuL6CpsWdJojgsUM0zLlJZd7BjbsQZKG26KxDOieAu
         FIMV3t91Hr3dj8xoTXwhBiEGeM2G3LJbyQf9K65fOftSw3X2JzjOlFq3u++6ACFqr5KX
         fmqRQ3Hdsm5XraGxlexj1V0yNnSWBva9cZMDVWE1T35zCh+NS/3WkXUTP7jXrMWUNyc2
         Lyv7Gbrd592MhF7yaToxZHpY3iFv/Dj4k+V95O0Ty/53ci5/dXky7YFInV1VvOBO8hBs
         rnNV3r321NACtWsV+qBvWF+dM94vLzKAeoZIPhySRSmE0XXXqzr1lCdyBLqYYSlJ5lgI
         D+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347897; x=1776952697;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkcqnzcdGwh533gIx3Rxb25n/lc97a/7GxLLYQuAYoo=;
        b=JrnehGVlRbzUp2azsB6gvN5BCYoynyk4F33uMS586tLv3Us+SU0FlsuCyjJJ3FE7yu
         iKJ71hXcuxMKOZKPP9mEfMzxTePt2JN/ZcKnwxWjj7AetIhwXOKPfTMLKNkOLpqS9Iqz
         gp0tqqvHJSAaIAmidlQCsSbyg5J7UE05iovqE5t+RY7HjAru4FcFYdn+IgKCwNjdhQOd
         KeCXAQox+dhCgnUS2/mUM5Y/pFb5RWnLRqT7lk+fdzsk9k4o0agv+WReK2zZTix24pR/
         y1knbi3f47mBHach0darwvD7mOM3y7kUkFMU+8R4cPFSueYtrC9hVnJog2bWDNn+XOek
         XmWA==
X-Forwarded-Encrypted: i=1; AFNElJ/lzgc9St9qXJptiQqKRmccUMY7KVCxs0/846z6z+LwY57CdqFrZk6Y3Z1t7MoF+P4rziz1vUaH4GbYDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHhSZVUu1puvnIdDe9a8e/lbg38UABq5BgeTyEET0FBn30RVy0
	YQvrJGO/PHPDn/qyIC4oyddNkj+JPOY004GnP3FqKeIr4uUGqaFXUvzPpGY4cpfteixYEvAF7Hq
	Qrlvy2MUYeill5d8AKz8OcHzYmq4eGSsBO4eQI4bOXcBa
X-Gm-Gg: AeBDieve/vv/tmLamYEqqdOHRPV/M90IVXqeS4fhSLx6gQ4mrRiSCUsVJj5yhynrZV8
	2bvOx816Z61q9k0/X5EF5YveH5ZqLNNvWEdqgRGCKzTK4c9G8meLgoyegyxyHDVLY/n5XirVatl
	ki3erpXtA17uxkZLVFLcHjzbWHjjIRW4R58eCTA3yuhHJ2CmZhB6SXWxgC/vIBzkoQldVyA7W2K
	HA3MOQDjWmYffENJFQPVfec/y+YhJ6yp43efIjA0BzV3F6yOWOILO8mWcXe5kWclkGMGwG7Wyam
	p93F0Y60IUC3jbnk5h0U
X-Received: by 2002:a05:690e:144c:b0:651:d199:51f4 with SMTP id
 956f58d0204a3-651d1995791mr13902937d50.22.1776347897133; Thu, 16 Apr 2026
 06:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260415181635.3699592-1-lgs201920130244@gmail.com> <20260416-wish-impatient-f69a28478f89@spud>
In-Reply-To: <20260416-wish-impatient-f69a28478f89@spud>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 16 Apr 2026 21:58:05 +0800
X-Gm-Features: AQROBzBcT5nRWC-Jqyb1EIHvUGQB4_h3eHLixuZBdXDLrz4V_7cc1gf7Qn5s7o4
Message-ID: <CANUHTR_d8NjkX8HkvnL4GAC1rb3yGB_vKtvw4u2Nezxz5=2S0A@mail.gmail.com>
Subject: Re: [PATCH] soc: microchip: mpfs-sys-controller: fix reference leak
 on failed device registration
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_065818_373471_30DA1AA3 
X-CRM114-Status: GOOD (  15.47  )
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

Hi Conor,

Thanks for the review.

On Thu, 16 Apr 2026 at 21:32, Conor Dooley <conor@kernel.org> wrote:
>

> Patch looks reasonable, but not urgent so I will pick it up after -rc1.
> Looking around it doesn't look like this will be a unique patch, so for
> other I would suggest that...
>
> >   mpfs_sys_controller_probe()
> >     -> platform_device_register(&subdevs[i])
> >        -> device_initialize(&subdevs[i].dev)
> >        -> setup_pdev_dma_masks(&subdevs[i])
> >        -> platform_device_add(&subdevs[i])
>
> ...you redo this section, as it's not clear to me what this actually
> is trying to communicate. AFAIU, what's wrong here is that
> device_initialize() calls kobject_init(), which needs a kobject_put()
> to clean up after it on failure. But this code snippet doesn't tell me
> that, I had to go look for where the reference count was actually
> incremented.
>

I also think your point makes sense. While this patch may look
reasonable at the caller side, the correct fix may not be to handle
individual callers one by one. It may be better to address this in
platform_device_register() itself if the failure semantics there are
the real issue.

We are currently discussing that possibility in another patch of the
same kind, to see whether fixing the API/core code would be a better
approach than patching each caller separately:

https://patchew.org/linux/20260415174159.3625777-1-lgs201920130244@gmail.com/

Thanks,
Guangshuo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
