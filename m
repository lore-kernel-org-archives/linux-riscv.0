Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8172DC5AE59
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 12:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLCchfUtrRjAAvDNYFaj1DhbYHStzJCH4L5HRWtlOpk=; b=v51MMDuMqKASPY
	Yav1IOB0Fqjo4wU2hQCM9AUTO2h1wFX7/zYqubLH/mnulEZqfBI2TfgLdiCWzXLZJVahzcKMhyXzU
	re54EjGFND0bRRfJxTViFsBfga5yOKoLyawyy2KqOZXhDgggGVpH1iwj7QCnVk2/sN3IUx9g7QdU2
	udBM4k7LN5a5pq/3djA6zvK7/PFlYl0DC/e2d/87BP7Zdv3zntIX0N58OPFPgHStePXTDKEwEtZbt
	RRFBQBmQS2plG6tGt6PpQuF9p5O5P5AHdrHrxNd9PecJKtOWMhjMzO+DGdgsz0FuxsKa0bt4a38PW
	VQbwi6GeEjOd+AaGzXjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQl2-0000000AvPE-3wir;
	Tue, 03 Jun 2025 12:28:44 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQi6-0000000AueT-2CdZ
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 12:25:43 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e8153867f47so1589358276.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 05:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748953541; x=1749558341; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0chqfdrdIvg4hy8yKc8WRhiOM1bdd348viYZ4BbWjw=;
        b=Xj0kfhMkT3O131K5601klpyfSHY2u40ouK7HGGJWSFz7yQ3sp02zQpot8F45KyEgIQ
         e4zq35bqDaKY2ljcbp8MNkarO1K0WfbkfYaLv6Ef3IhNvttkQDQ/0RYk/Us+4yOEJb3V
         Vof5N7r4uC0BhahGZyFfjfCyggc5VC3+tK5RtRVZFXz8o8hROw2sGa6PM4qAWXkJuX49
         ETaHv1LdSuMVjD02/fMfa4JF2ArVLZ83Gtcybu4k3/PphMgP8CPjos4QlEH/pGZigikN
         A95+Mm98nJLU2qHAndpR+WCvkYgEOIeOs6u4nkF+8ozLp/xspO2uA5jqc1GMjrK0uxAb
         vOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748953541; x=1749558341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0chqfdrdIvg4hy8yKc8WRhiOM1bdd348viYZ4BbWjw=;
        b=ece2QwDO+J52DyLgzKtqOpN2m/f+CTUlXjwqtdyg9aw+C9L/2fWqoK7UbecTTaAOCc
         6kfju0BrK5u/AwnRwe4lHWn3sx+uBUCirbpbjuZG0dnbZfdcSumSd0EWDdmpFWgRQ5SU
         fhM6amCIcrE+90UrJYXHkXBs3/EDu9BJdXya51m3nZejMKAfBSOXAE0qdMqomVWRqTvn
         KCK6VkbQ+ThfZZeGy3tVuq/wW80v3pRAf1UkoPo4yysseUeZCOJ+H/hBwVvKrji6S1dJ
         epw+jKY2oyprZJd1JFx/vG8jSdpN57ZXQv/IxCHTW7d1OEn+2F2H9Q2+7PIRqwkyGSxP
         iSjA==
X-Forwarded-Encrypted: i=1; AJvYcCW/jgEMOYdAW0Pf/fKUFC2wO/m/ceklmNhmccFhBkJ2RMsb+3K/OqP+8c2wfXLYoWH+wSgxeWFodOlzPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaHa6RWlQKqJ8sECpkWuXt1RyCfp7tEpVqdTIYdWErC2ARj3/F
	62qmGDv0bytdUQqnghjA4cxw2tUEM/MoWkwKT3yFNtojK5tRxOglBFfc3OIVI5s1quuVuPmtMi2
	erZAN1+Vl9LVktp6QRQTv9wb+LhfT0Nv7s/oJFZ2YiA==
X-Gm-Gg: ASbGncuO9JD9S98eD5SKNVRXBHLVcA/KE7ZYf3APF3MoRWEXPEImPpOrqG7kebPloKG
	5J1omk+rVDQplBGSp54HvJpcpereU7r7jQKvZRqUf92tS8iwTdOvFdEULSqfiJ0abw534y/ZjEb
	ZfK2UNu3cIHKsgED/CFl8zGvzsYbODg/fi
X-Google-Smtp-Source: AGHT+IEJrWfxa9Bh6hqeqnweQzaVkjYvLD0ahWEYQ41oZGruPcsUvZuu97cItSkDZzbw9aGHdeGYbXtGb/PCj/51Oeg=
X-Received: by 2002:a05:6902:2b04:b0:e7d:988e:e7be with SMTP id
 3f1490d57ef6-e7f821a3acbmr24109793276.43.1748953541373; Tue, 03 Jun 2025
 05:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529222402eucas1p1c9e0ddd3efd62e078e5de2cf71655f58@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
In-Reply-To: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Jun 2025 14:25:04 +0200
X-Gm-Features: AX0GCFtQed31aP5hPCNMM0HA628iK-r2BM1mtBEnivi2Jm8ggPrVV8N_s24C_LE
Message-ID: <CAPDyKFqL9Xpau1BDnaa828s066zj=aVOAQOy1tCS=ztKN0ZsfA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add TH1520 GPU support with power sequencing
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_052542_569164_E0C5690B 
X-CRM114-Status: GOOD (  19.37  )
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

On Fri, 30 May 2025 at 00:24, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> This patch series introduces support for the Imagination IMG BXM-4-64
> GPU found on the T-HEAD TH1520 SoC. A key aspect of this support is
> managing the GPU's complex power-up and power-down sequence, which
> involves multiple clocks and resets.
>
> The TH1520 GPU requires a specific sequence to be followed for its
> clocks and resets to ensure correct operation. Initial discussions and
> an earlier version of this series explored managing this via the generic
> power domain (genpd) framework. However, following further discussions
> with kernel maintainers [1], the approach has been reworked to utilize
> the dedicated power sequencing (pwrseq) framework.
>
> This revised series now employs a new pwrseq provider driver
> (pwrseq-thead-gpu.c) specifically for the TH1520 GPU. This driver
> encapsulates the SoC specific power sequence details. The Imagination
> GPU driver (pvr_device.c) is updated to act as a consumer of this power
> sequencer, requesting the "gpu-power" target. The sequencer driver,
> during its match phase with the GPU device, acquires the necessary clock
> and reset handles from the GPU device node to perform the full sequence.
>
> This approach aligns with the goal of abstracting SoC specific power
> management details away from generic device drivers and leverages the
> pwrseq framework as recommended.

Just wanted to share my view. I have looked through the series and to
me this seems like the correct approach, nice work!

Feel free to add my Reviewed-by tag for the series, even if I think
there may be some comments to address from Bartosz etc.

[...]

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
