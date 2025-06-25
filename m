Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2D0C7EE2A
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=49E943oU3rqsH+bPuMu7hLG38NDi+thz92v1xcwSuxQ=; b=Upj6xygBCMwMog
	xldz0hxmMpRLWjkN1JYca3ATF2jJc5ZYtgKIOAbdv5Nq70SgCfLTDLbqQKwN/2EYpf83xkj9Jld5E
	YHU3wE6EUpINCRP4Eu/nv3waS38Dkzif1cdBB5Tx0+bJQfj7X96pp+Wi73a3VF7xTdrtflqQSPMxk
	kEWz72b29y8B5pbpgHOZE7SFI6ac0OnYN68c5i2ioskpia/bRxSSxYyA5pwSMSBD8VMEOOmwXWb2W
	nKrFpqI22FvqdujHDdnlt81dsCLok4zSHphwudgr5Hj8qdhCkte1i7yF6RWFRH3ACdufH8gPc2yRJ
	CXatGRHEaxiR0nMj0WMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUsH-00000009aDb-1f9g;
	Wed, 25 Jun 2025 18:29:33 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUS10-0000000970H-0v7F
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 15:26:23 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-234d3261631so121785ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750865181; x=1751469981; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gE8jHxo+PQ6FPeXXY1t5SkeB5q8vcyLGyWcRWobT2vU=;
        b=2qpFeu1l6N5t1x6MBn1SjlKGVRZdz6LWx4HrXSrk9sxXMc/LLYC3HBuLz0Kow4qO7k
         VWGzbWaVeLYSIt6iamrZBJbFhGP6/a0UQC6xUnSPbziUIGXnyQy/CVzmxVhgCP5f6Ncn
         KES4XqezO4u+ycNXz9M9QefRfvwXPBkYB664kqEtalU1OLdnD64Y+gca4s7EkZfDdurM
         8yNxrx496P0Jpgz3GS0gm9q/AYhfQIq6A3Do8wWFK7t7dDwJLqYrr57xeDagq6iSfxRB
         4bV78EODjpKb9laRVFH0PqTRx5wlxahQq0fPs6TPFIP6QDQSaNm9HHrpdfH7hBcRptzB
         vOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865181; x=1751469981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gE8jHxo+PQ6FPeXXY1t5SkeB5q8vcyLGyWcRWobT2vU=;
        b=vkqhaF1PLsAQSY88YTxhQb1f5S4YySY3VUnOTheGMNkLePBvJUVR/vsfOjOKVmbUU9
         g+i8JxkKkalqrIgmLMKiGYdkJ57l2sBaWQc24K8SdEd6CHb5RrJfG+Qud4Z1or0XQHp5
         N9cU+hdu07BoXVDJ4CTfzoC69j1WDPKXcXR1SDDBWEgLZfShs794R6SGCd0Ns8VZvG3h
         Inf8IjA731eWotlMqQCuBrCN65xuUbiEidkqqTBKvtcg/Lg20UkwNZnvLmjPepMO+vds
         E/jbXK/Xkz8Cdk6Omlg4Ffyolfph731kdLQfSQhnEZJ3O1958DoSxzNDQjYkgGxgQ/Xz
         2m7w==
X-Forwarded-Encrypted: i=1; AJvYcCUatROuUJ2ITBQUCU34+bT1YMhGrNdSKjMZ9Bou9a2fQrIR1yseIPGFqEGMrxuOF6xJ2AeeLXvB58Qj2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyDdhpCwCfvXSkw8fhKeJBm8OHugCcyj4eyGSWl37fLrYIGFKb
	oo5ksl/19Z938SHn9jxWjHcbcgsB1mkj30dm+Z8rQcVnQr6ii3Og3r2X7rs4N+yX4qI=
X-Gm-Gg: ASbGncs49DH2PuCXL/HV05N2uvtqesxna4MSBD5cgU/8MBceB0HSwMliNGqIEHnRdCO
	V7bDj9eIXAWGj5mFZBnW3d3+yw6tlqENXdwPBCBJDrcdNXbfDOLbpUdeXmN4y+yjcfUy9u9se0Z
	edG5JugGyY8VeH/gUxuxHpraI/KjKwEPMzqtWgf9a4o2DoDB1xbNQeZMiIijzQDTKNSXfwukyGo
	Dap2IwrhOACl96jCAFmTmziE0W7rd9aIzjytkFzsFG3j/yhm6CaarzLIYJytUGnMJBBi/Hyki/y
	SW18FW41lgDaM0oyX3e05p9hqzCRPSJIWm8PVfwOVvciouMc4wdPVyy2tyaCFmohV1kgVaxknc8
	ZqsZarXvb
X-Google-Smtp-Source: AGHT+IHrt+1gjc7s6rRerhB4Z7Hf4zvb7Zi6obxep/7tJ3hlo/78JEJ8gL2cW7XB4z6XD8DMAOJnew==
X-Received: by 2002:a17:902:f552:b0:235:655:11aa with SMTP id d9443c01a7336-238243620b9mr62700495ad.39.1750865180734;
        Wed, 25 Jun 2025 08:26:20 -0700 (PDT)
Received: from x1 (97-120-252-192.ptld.qwest.net. [97.120.252.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d839354esm137239885ad.16.2025.06.25.08.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:26:20 -0700 (PDT)
Date: Wed, 25 Jun 2025 08:26:18 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 0/8] Add TH1520 GPU support with power sequencing
Message-ID: <aFwVGkAbRUm0j1hv@x1>
References: <CGME20250618102225eucas1p129b1172bf54521c1eb0f718cb31af468@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <aFNrRtbWzeRa7GmQ@x1>
 <12eed587-a8f3-4a67-8808-5e32617ded93@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12eed587-a8f3-4a67-8808-5e32617ded93@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_082622_493726_040E49C5 
X-CRM114-Status: GOOD (  14.60  )
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

On Mon, Jun 23, 2025 at 10:17:36AM +0200, Michal Wilczynski wrote:
> Hi,
> 
> Apologies for the late reply, it was a long weekend in Poland and I was
> away without access to e-mail.
> 
> This is the Imagination repository that hosts the firmware [1].
> Admittedly I'm not using the newest firmware blobs available, as per
> discussion here [2] I downloaded mine last year so haven't tested the
> new ones yet.
> 
> For my own testing, I  embed the firmware directly into the kernel to
> avoid issues with the initramfs. If you're compiling your own kernel,
> you can do this with the following configuration options:
> 
> CONFIG_EXTRA_FIRMWARE="powervr/rogue_36.52.104.182_v1.fw"
> CONFIG_EXTRA_FIRMWARE_DIR="/home/local_user"

Thank you, that worked.

[    1.041146] powervr ffef400000.gpu: [drm] loaded firmware powervr/rogue_36.52.104.182_v1.fw
[    1.049654] powervr ffef400000.gpu: [drm] FW version v1.0 (build 6734358 OS)
[    1.062024] [drm] Initialized powervr 1.0.0 for ffef400000.gpu on minor 0

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
