Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56647606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 14:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2y8KIDfn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J5sHknHB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V/Sjju8nMV3jLJQIw4rUzoIXatSQpO95jEwKHydj+10=; b=2y8KIDfnVD/xtVvLYpYAHOdv7e
	mmeLrEzfXpQMDKzF6PuCe8ocXMbasUHkHmGf7qzh53QRH1uXLtvxL69GugkEkyIuC4c3gM0HYzD7g
	8bS4Bmr9fLZbEifC0z3RQoCajIHex8dfxPTCrTgyryynHsRtaXref7ktm6tEcbeLr+w40QAF2qlU7
	5SCv7faPWl54mOxspftfguMRSl3ixql+/8sLdkeefz3Ygz8W0Xlv8yEtB4lBVxEe44yIp9ACmLNe1
	y70PdKYVUHA40/1G8oToFjez5/ujQmcg3O3+ZwV6QRpFopIHGZKSF6xLGOtP9udOfgWn+ekUwaqvu
	/YqZPeWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDe9-0000000A6At-2rdz;
	Wed, 25 Nov 2026 14:06:53 +0000
Received: from mail-dl2-x07.google.com ([2607:f8b0:4864:38::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDe7-0000000A68f-01Kk
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 14:06:52 +0000
Received: by mail-dl2-x07.google.com with SMTP id a92af1059eb24-139b659a45eso659350c88.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 06:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795615608; x=1796220408; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MP09FK8BKciK7H/NzSBFI5ee4XjfPiGr8z/17qMy3kI=;
        b=J5sHknHBY8ROd2WtYYSYd5C+F9fmYg01+YLkkXzU6c/22N9nHvVKReJxt291lCjYi1
         DLJfHIGRXgU+eZ2IX/NOFYgAoOXdGqhPieIua2bVids1JFrdRea2LXbxh6IrWSY0+odP
         trUvtHlW8YM3Xtoak0Clb1QQXZaYRxT7teKA1Ddhz2eyJmZoHNUXxC464GlS/IkKrSpR
         65jVidziop/nbVmoy7JOCUrEw2rrtzgcOvrD1OcRblHErpkY4Mqc5AAdl6jI3PySvdb6
         SSXNoTQmYw2NCvRdaamuc/Q63QYnHomW7LWjadnxUx8a1lf96VWOFeHhV3IGmUdPP/VV
         e5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795615608; x=1796220408;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MP09FK8BKciK7H/NzSBFI5ee4XjfPiGr8z/17qMy3kI=;
        b=fWqIvr3zR9Q+B8jqb3NuTbFGP7vlrUBdl4OFfmzUuB9znaG0gInepD6qB3eaayWLms
         wX5XrNoOfN4nguZO+upjo+pNckagxKFMEpvRMzumzeg3KQ04o9y86QegY7EOWYpfpX/E
         /Ekad6Aaif/UGo9e5c2d606NMzV9xCUsENCMgAhEtgvmRBGeWN2T9JX2yohMGn9evLED
         ggt88o4PGfs3LKM1tGgJZYtLR+7vIpPMVZ+4GFtBiTVilh/Y7N6mK0frRPoHhPbIMd+J
         y3qnTKCobG/nPNlCUyAOq07SqQ4TpySQenSkiRn8R3bg8Uk1yV+Gob975wo1OXwniO1a
         k/tQ==
X-Forwarded-Encrypted: i=1; AL+hErFYED2zhfOytKaGfx//6aJVmQalJuHjnSmDLODgVzo9+dwe5PAw+o6w5dy3pQsj7Nr3bnfId4VirOXVjw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/XFrZtXQ+mZu6T+P8KdySDpFtl0D5YaD7Urud9H4296SoTXwkH
	QsPhd6jD1yHCczS2OxuyaGIFPaee4Ed421HZoLfSQSjZOuMyZD+0UBfv
X-Gm-Gg: AZFdTZd5QTsocQB3WYLX55x5rVOBxqdBm0nO3xQoTjzKru941FlKAal/O5ujBzImhYd
	udyeM5qDBi9m/NuVBZYW2FGL/03FLndJrH6WqlPxpUUtG00uQrP7ZbKUkZf51jlCh6DJtkyCb5j
	gMHlgvPazFw9bSyjvAOSMjdDbLAmIVUZhCJt+NEHK5+OtHZ8VXZUxcBIaknILCYpoS1E+gkiX1w
	WMpBd9A9s1Agth3J2788yiJ8S6XnlsVYkaoIbxw2DSCMWyIPWgfjUxLUKoPu3wi0SMX5AUckvrP
	UHJoX60Whvbc1RDDjAtCSOxh2kq0ViGECczlJ0b2745d54dblEcrd0JtDI/xukNYZuTT/3FsX4C
	SUoG3ZT4dJU8ypl6SEVgdxhBZd/14C9VX/7fBNe9q0gj4jmR99Z/jBF09ILNlgSlpHW2En3h+J6
	FRhyeYIBiAeZxTh49zHFW+FkJWx2HLQy9hbVBtEmBr7IST6aF+ehzkWfgle9TOaXCuv49LHxKc5
	OinhzzZUaq0D9n/gmApLbxDyO9M+4OHXUEZ+WENM96KbWmkvHrO48fVBkjhy3GRWDgOoaIFSYjo
	5LztgB2iS0Cl6qaCLPSBN1wYo1n4Rw/EAnP/UtQoCg==
X-Received: by 2002:a05:701a:844e:10b0:1b0:20:6444 with SMTP id a92af1059eb24-1b56e185990mr10444498c88.39.1795615608143;
        Wed, 25 Nov 2026 06:06:48 -0800 (PST)
Received: from localhost ([2604:a840:3:1e0::3003])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm61981028eec.26.2026.11.25.06.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:06:47 -0800 (PST)
Date: Wed, 25 Nov 2026 22:06:43 +0800
Message-ID: <eccf3f1e6dc94fbe847d112e8804c053.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: James Morris <jmorris@namei.org>
Subject: Re: [PATCH v3 00/17] drm/spacemit: add SpacemiT K3 display support
In-Reply-To: <87eaeb2-b6e9-9198-b9cf-7e9f96bdcbc@namei.org>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <87eaeb2-b6e9-9198-b9cf-7e9f96bdcbc@namei.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_060651_144039_34DD9894 
X-CRM114-Status: GOOD (  19.44  )
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
Cc: Guodong Xu <docular.xu@gmail.com>, Yao Zi <me@ziyao.cc>, Michael Turquette <mturquette@baylibre.com>, Sarah Emery <sarah.emery@canonical.com>, dri-devel@lists.freedesktop.org, Ze Huang <ze.huang@oss.qualcomm.com>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Thomas Zimmermann <tzimmermann@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Brian Masney <bmasney+clk@redhat.com>, spacemit@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>, Dmitry Baryshkov <lumag@kernel.org>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi James,

On Tue, 24 Nov 2026 19:53:11 -0800, James Morris wrote:
> On Sat, 21 Nov 2026, Cody Kang via B4 Relay wrote:
>
> > This series adds display support for the SpacemiT K3 [2], a RISC-V SoC:
> > a new DRM driver, a new PHY driver and three new bindings.
>
>
> Tested-by: James Morris <jmorris@namei.org> # CoM260-IFX, DisplayPort
>
> Assisted by an LLM.
>
> v3 on v7.4-rc1 works on a SpacemiT K3 CoM260 IFX with an Acer EDB323QU
> (2560x1440, 144 Hz) on the DisplayPort connector. The DRM, DP and PHY
> drivers were built in, and Linux ran from an initramfs with
> clk_ignore_unused.

Thanks for testing v3. I will add your Tested-by in v4, on the PHY,
DRM driver, SoC device tree and CoM260-IFX patches.

> The board has the vendor U-Boot 2022.10 built on May 21 2026, not the
> uboot-for-k3-display-verify branch. That link in the cover letter
> returns 404 for me.

I will drop that link in v4.

[...]
> Two observations:
>
> 1. The HPD interrupt never fired. /proc/interrupts stayed at 0 for
>    cac88000.dp in both boots, also across the unplug and replug, when
>    the stream was running. The connector poll caught both.

Same on my CoM260-IFX: the count stays at 0, also across an unplug
and replug with the output on.

The external DP connector is polled on purpose. The interrupt needs
the pixel clock, so it cannot report a plug into an idle port, and the
bridge leaves out DRM_BRIDGE_OP_HPD there.

> 2. With the monitor asleep, nothing was displayed. It kept HPD high and
>    returned a generic 1920x1080 EDID. Link training passed at
>    2.7 Gbps x2, but the monitor stayed dark until I woke it by hand
>    and a later modeset retrained the link. The kernel got no event
>    when the monitor woke. I found no DP_SET_POWER write in the driver;
>    could the sink be left in D3?

Right, v3 never writes DP_SET_POWER. v4 will set the sink to D0
before link training.

Cody

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
