Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F1F606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 21:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vFshlvY4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MZIH5mL4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Krp1fcYb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Frc9RYOZWSJY/yVgwqB5ebuumNBFpWPdC2DBViTb+lY=; b=vFshlvY4sZwsSs5KHjJqPEgNMw
	g6jfQ1XNs+nHSqDkGRp6Q1kzserEnuj1YxOBpE95udvMDJcRiBNLQpRoKI+aN3tZ5BD1ghqO5fhNW
	DCTVmGJjINxJeH/enrvgEI0j8p4xsQqkxHCTxX0t1NNops+z+AU7/zWXHcAqidyXkNhZKUDwSqJNf
	XKtLAm2hb16qjgmHgLLyebj3usiB3sVY9jeALA89NXnqxl6VHwGGoH25kO64+yZSvGMCXgyAiP0KQ
	sQx/+lTqnEOcUKNBf6UY12gNUnfABwWE00hhwtSsdR7/tkcyynrV9+vxAyesoSMoBQLzQxM/Cigc1
	Tpu09AKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhHA-0000000Ea3x-1gGK;
	Thu, 26 Nov 2026 21:45:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhGw-0000000Ea03-1FGJ
	for linux-riscv@bombadil.infradead.org;
	Thu, 26 Nov 2026 21:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UYJTRpYCZNTbQQiix5R88SQ1NUZI9ZYUAhpcRTfR3qA=; b=MZIH5mL4uzx3VPuMvKOFL8r+tD
	0kcQeiPA7eMhAYSQ9Ty9uyEHJp5hTWaTf/BuD7Cg1TIhP6mmdYtLVLW5i7TzGST5sH+4B8ufAaI0z
	g/D0d+61cjw4mrfS++XQJ8qLvDOR58Jw/jqR/h/xMrFSNFRNva1NedvUaLzUGnUBBY64z27ZMi2Zk
	+keWbv2tzcX6RTM4Krlki1j1D58eDROdRikkpDNZZXmhN4YJANc10gtlPWkvFP4tEt0nGWdOAY3nt
	LvqZYv4PpuVgboeMgHW88ESBgYwisjFwCjiD1i98BqMKrcSJmrWCL+NeWLYsuR426Jx6jSvQBr9Ay
	8HqqC13g==;
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhGr-000000074dQ-2GNP
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 21:44:52 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-33e48934fa8so1441069eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 13:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729481; x=1796334281; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UYJTRpYCZNTbQQiix5R88SQ1NUZI9ZYUAhpcRTfR3qA=;
        b=Krp1fcYborP9rxScIwHasyS8Q+oOABp0NoDB8OpBH7ULy8nU5T3BNNydhu5mw3Tfwu
         hltCYp85emmWpRHQeczGciOsEILOtyIglGdKdi0o2pPw+xqI8uLGg4SaCrAIMiW/wyZu
         o03wSKNT96EzxJ263gAACYqpEqu1O1K3WjcrK1FesFKQM9uGTq/ZLbOVR7DHxZn/WUDI
         EIN2ZsbKZ8+x+dwPddU9tft6MoDWm0XChC2rBQpkkp/W8A6K0/hsIVEPvJNvTVy0gRvL
         jqQJ2a1Jbd7nw0GU2G4iyuP6Li8/nTefS952uKjDYYoVVsPCWN+/Uff5hOmAY1+03mnG
         yONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729481; x=1796334281;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYJTRpYCZNTbQQiix5R88SQ1NUZI9ZYUAhpcRTfR3qA=;
        b=sGJ49Z9Acja9JOYp8wzhOdEHKUHIQVis/3bB1Oy7wip3tbfLTCBOtNpO3kGknU/o+o
         SQtwvvnQwJ7dEWFdGPX80OgI8RVZj03v5J9dScdeUvi1OMBK2UoHU75sgIRbLdNptVbz
         OQ5bKi2s0vt5zYcYtwyCzAvttMcvTCAFZ0C/H/Q85hojXO3sba6z8+i7oFQktMGjVXZz
         43ch7recg5jlzTHeCJZy1UDXD47vkB5FM2Aro3FNX/dJmF5Nk+q5ZbAvSn0KdZWf5NeA
         mN/ZbkuAuA75b6y6sySw1Xf84kCXoh9CJgKshz+CH7Xl7WQq26je/uKrcnztHatWIja8
         o7Fg==
X-Forwarded-Encrypted: i=1; AL+hErHQPUTqEwenimnPd/upHTgeeICXF1QBFdkjOBiSbnul1+PF8rFRboou37RUvd+oVUmG9fauI06cpDYyRg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZTxWPF1GU0DZd50KYtYfWXxmoZTGUOsKK4I9QOHgTIM3rvORg
	jiv7IT2omqW7rFj1XL9vu6q03OoF750uim067FL5VLS+ika96sQMg9bk
X-Gm-Gg: AZFdTZeeFMvU4rzKjnNC1n2cizEGVJM6ijBF9IJVRfV6nvZmnAVlIXwnz1jXNmGW8Qd
	zEZ3064uDYMx3ZjQXUYhc6KvZ4nlGwMP3SzJS6vk08askDYklKLfF7+/7RodViZlc34dsOV+KxN
	R09d1pYZy1nY10p90WtyPyIz6+ZjXzZvO7vKd1P+/rWlyw57blHibIejOcFCF3n861ufRP2EaT6
	KmUizVSpomORPvXEsMptqsVZZR3hSKsFeWb4pP+OVN1n/TKbeyJ5Z1tjFqfCEtM42UzqS1B+DYv
	2B8jhvbYQyoAKCC9CefpTr9CRmhH2ggFhti5I5Aj758lBHNUf7Sx5YTR2/chiMXxnyBE5rB4Rlw
	nfX5AzbmuC//oE8NwJwAocrRcqCYJgll73n5m7w0PJfWon2JkSXffkoCVleRK8IJPPDvHzn4O8c
	g70aCQvY1lkobiQCe0SVh4CuCODzvX0nFiKPkQ/VxwcxhWOZbNLtcdkmkIsHEGvbupi5GV0uOhw
	vQ7vvZpLf9eS84CTr2HuyuOy0mzX+oxg8Yrfd0H+5YKo0C9D6rkRGBSGgQN72K4fe/xhZxrTgEV
	+SduVw5yY4Mm7EqrbhxU4KDVd9t8WlSPTm4XUHDVjNiE2BfOy3zf9L4I9bs9gOo=
X-Received: by 2002:a05:7301:c089:b0:372:14fb:2573 with SMTP id 5a478bee46e88-3856fd5bf76mr21960944eec.20.1795729481384;
        Thu, 26 Nov 2026 13:44:41 -0800 (PST)
Received: from localhost ([2604:a840:3:1e0::1080])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm79578155eec.4.2026.11.26.13.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:40 -0800 (PST)
Date: Fri, 27 Nov 2026 05:44:37 +0800
Message-ID: <73f6ebde526f60ff64064ef602e0cae9.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Guodong Xu <docular.xu@gmail.com>
Subject: Re: [PATCH v3 12/17] drm/spacemit: add Innosilicon DP/eDP controller
 bridge driver
In-Reply-To: <9ec2f818084f2e723e8b82218a302258.docular.xu@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <20261121-k3-display-v3-12-ec419e8e96b8@gmail.com>
 <9ec2f818084f2e723e8b82218a302258.docular.xu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_214450_302538_978AFC9A 
X-CRM114-Status: GOOD (  12.98  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Yao Zi <me@ziyao.cc>, Michael Turquette <mturquette@baylibre.com>, Sarah Emery <sarah.emery@canonical.com>, dri-devel@lists.freedesktop.org, Ze Huang <ze.huang@oss.qualcomm.com>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Thomas Zimmermann <tzimmermann@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Cody Kang <codykang@vsit.ai>, Brian Masney <bmasney+clk@redhat.com>, spacemit@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>, Dmitry Baryshkov <lumag@kernel.org>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 25 Nov 2026 20:16:25 -0500, Guodong Xu wrote:
[...]
> I noticed a corner case when testing module unload on v3.
> spacemit_inno_dp can be removed while a process still has cardN open
> (say Xorg or kmscube is running and somebody does rmmod
> spacemit_inno_dp), and the DRM device then still holds references on
> the bridge. When that process closes cardN later, the kernel oopses. On
> a CoM260-IFX:
>
> 	sleep 20 < /dev/dri/card0 &
> 	rmmod spacemit_inno_dp

Thanks for reporting this. I can reproduce it.

[...]
> Other DRM drivers with the same structure, rockchipdrm for example,
> put the bridge driver and the DRM driver into one module. I think doing
> the same here (add spacemit_inno_dp.o to spacemit-drm) is the better
> solution.

Agreed. Will fix in v4.

Cody

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
