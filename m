Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4C1C531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 08:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsK/RC4uZmU8ow+gQfLz83tAuj8s5P/3hZ/N70MiMYU=; b=peL2RCzbB8uwZh
	1qK3QsKA4S2qIk9m5/7ApGO8y7Cquz1kEJlmVRo0znbt73Ys1bAeHT+irL+o6tusRGFlFuqPg9gwG
	HvB/N6+1r3ABEOzA8CrPLIFb8Mz/TqoOoOykbBCbbMZzZSP7SBTA20Y2HmyKXzTrHw+popdX2bckS
	3MeZLbOpTqIp7/ENs9rUylwrq4U02yyDFg/5p3wg/Q4fF1098p/idkMKwxdlCsvt4a01VUfIUYLaw
	1Kt6Ib/msJuFj2A/z5FlWKgJjvwBj6n9Cw5aB+p5aQUAdGFCvQF6YbFNaxPBGE9cLo113+xdSnRE4
	MyDEQmao9N5U2BTB3K2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnXW2-00000000Anh-27KP;
	Sat, 25 Jul 2026 08:13:50 +0000
Received: from mail-ed2-x09.google.com ([2a00:1450:4864:33::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnXVz-00000000AnO-307x
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 08:13:49 +0000
Received: by mail-ed2-x09.google.com with SMTP id 4fb4d7f45d1cf-69c290c7676so581082a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 25 Jul 2026 01:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784967225; x=1785572025; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gPeXPPGLbFmRB2bRAKpa2gFojTcQTquw5RAY2mSvs50=;
        b=CGHUP700m6VS4NVwordS6XGpkK4ikDezjxv6SMrHLvAk9HW1adOsrdnPxj7FJaf7zu
         D9GYiF1mK3IE1Oh30ItXr9QBBYulhIkC+MDCrNx176qRR+5nmc99CVSvzOOE1zpPhajw
         2fW3FPlP5eHk0DD6MXPktiuPVMrLkGiDE0lxulvU5r6iAbw1cJLUwJCUOqRKgPXcBSOp
         ZRJdxXqSGbk4/RSOc7YM7dgCdg4wEcgLnY2wZNsuuKf2gClsZkYoFWl/+ObrAsxjrBHV
         fhqh4eGCXjaE/19WjQIo+IRFhs+3ZMh0x5lk36smQJMSCdoCs6a5YwIYNoJzI2g3zAXG
         tgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784967225; x=1785572025;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPeXPPGLbFmRB2bRAKpa2gFojTcQTquw5RAY2mSvs50=;
        b=m9Pe0GPvZD0D3v8XhK86xbRmBGvlM50rYl5LQTJEG68lULmnJj/ZulmqeY2M2U9z1L
         2vmy5HH5aCMKtv+8v8M5dQFG3T5IWN2u43nu1oZCGMwnib18UkZJ/8cTsNd6xwU2spZC
         y0U5ZACqHqvSLbA7SwzYzyeezAPfkkQASxIfq5CF4NXsC4R7kXv2G4fVG4qm8mCUrS7d
         niSDS4SPYfou0THHz+XMOxpZB/tsAJkWAl1uv8nvc3YcPHSeLma8jdSKNUhsDQSkIOyI
         KeOoDkgl/E50eToVVy9JpyVTMs4GKE8inIQMKVlYQ/3JKK73pFfF/nxZGw6XKf/Rtorx
         k3LQ==
X-Forwarded-Encrypted: i=1; AHgh+RofQpNJwMSBa3wGXUijqN6wqsFQGoMJZR4ZPaV6cAljpIwbGbdAnR9q6BhZ638T266TuvEXbPNWNE6Zbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFTeosJ+CuXo5qfiRZmIlTAl0QDxFyBSSm/OYKMq82SngLyKIo
	oHAzJLTM+TDcU4TedakWDPVT9veWNP3h2myZeCfk3cf6BFnEtE1tfNQ+PsjxLQsF30kqrA==
X-Gm-Gg: AR+sD11iUmyln/CXlT7VhPxOa6gaiKfq+rd5rk7mIJYrWmR+mfdYc+fWvb+d9f2srGh
	iutGzpRl5PTBxfSzf1biQNfQZg8SkCDBThHpwT8aCUZAEfQK0pYIpNBPi9fQRKjKzqIDo5Bw1v8
	D6x02IMK1XaFh+7Hd6aOeROlO2HSKQDpo5FG6NTthbYFD6Zsb75ALz5NunZ7//jsSBVrD0o+rAC
	T+5lO1VAjkYHcL+tjMHvXAhk++77w7CE+kNiLSWE8dz/8QpH+sUmVZjhJ3V38/89NXGSo2TZ9PH
	ya63YlcAIab4+6fNADr8cbs4zNte2dokYD+8Wd8OnumLu/1db+houuxlnQoOC9zRCdz0WRZS4Dq
	POL8FGdSiiKKF01Z9+845L6vMiNv6zhnGK+Kw1R494fJBVAUhgJKa
X-Received: by 2002:a17:907:1caa:b0:c15:ccd6:79c5 with SMTP id a640c23a62f3a-c1f1eecc34bmr64140366b.33.1784961423771;
        Fri, 24 Jul 2026 23:37:03 -0700 (PDT)
Received: from localhost ([2a0c:59c0:1::208f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebc828sm440790366b.43.2026.07.24.23.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 23:37:03 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Cody Kang <codykang.hk@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 00/17] drm/spacemit: add SpacemiT K3 display support
Date: Sat, 25 Jul 2026 02:36:26 -0400
Message-ID: <20260725063628.3499-1-codykang.hk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_011347_844336_0A60FC06 
X-CRM114-Status: UNSURE (   7.78  )
X-CRM114-Notice: Please train this message.
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

Apologies for the duplicate posting. The patches are identical in both
threads, this series and a resend series, see [1].

Please use the resend [1] for furthing review comments:
[1] https://lore.kernel.org/r/20260725-k3-display-v1-0-6de34d80e86c@gmail.com

A delivery failure on gmail side appeared to have lost the cover letter
and eight of the patches from this thread. For about two hours I can
only find 9 (4, 6, 7, 11, 13, 14, 15, 16, 17) of the 17 emails in the lore
link. So I decided to resend the series with a different mail server.

Sorry for the noise.

Thanks,
Cody

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
