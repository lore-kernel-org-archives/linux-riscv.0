Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82B2606A326
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PoeJkv2M;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EOkWZXWL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1XQc7gAXqjBVOc7OJ0BZAwrHj7NxSSp/2jk+OVUCQ3g=; b=PoeJkv2MjWjJkFoIdlv2BdZq++
	U0/Hbd52ZcNslWuoLiK7goRh0rWPxDf5z/4vwxzS5wz+3Vm/MaHxCxEPsRVytmIHiGyZrEZrw1MSm
	VnENKGFZLEKfSp4WUzEzpWBY7bgU7fxPRQtr5kbOVzVl1iFO8s6RQO9P1VFli850nr+SHsByAjV7n
	UloEfpDhlYNM+qx4ywXR24ws10+9clG3HM417MGsdajN8K5a2UqN2Hq/nDzcl41DAt6Inxn4T+mr7
	Ycup52yGMkyr4sUSx07DYmwwMnOOfVli3C96Yq9MYGEJDHCYwovCtxi+8/OLw8+cP2Xu+lTTGXpIp
	hRcd0aOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxnv-0000000GlMv-3ss9;
	Fri, 27 Nov 2026 15:24:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxnW-0000000Gl9p-3elE
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 15:23:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso80556395e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 07:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795793017; x=1796397817; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WsBNj7VIMT9Rex1IplHHRSQ8v1QyTHdnKiIH/swHccM=;
        b=EOkWZXWL348FZqw3WpF/BUBzHDVt2SNgxbfu9jq5xAGLEnptYF5XazAEZoGgeRcJCe
         hHLckUcSJyx1696joIt3EiIZk7D22Lq/xKxUvU3voiHFZgjlenBgzFQD3VWEXENXIW60
         HXX1xvrH6l5Nna1L8Tc7J4yi44/ZlbwrkzMby0ZiYPHmp7+PIr3Sli4xFeoJZAmN4nMw
         8g7PjUaUqArTlnLP0hkXlW/1j3p/A4XprmyJXmoQv7CF5lNgewjKb6zY932fplh/wDRr
         rrk/wm8UvUbjXKGE2d9YvUjiEuXFKshUoi0qsS0uq6azx/d+OOeWfrfKAh6ZT5l8yWqG
         5pIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793017; x=1796397817;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsBNj7VIMT9Rex1IplHHRSQ8v1QyTHdnKiIH/swHccM=;
        b=LXDdv5klmV72HX6021k8JnPTcj2otdMoDCIMhHolsnRunZBGy0o8Hcwmkg+Hroh3vW
         YEB7n9xgeQRPA1lY8Kmr3Ll9MhnS9J1LjAvMa0YMBz3w/STBBiyG/yYIvQf4IfL8mTC3
         0dfBO0L2UvsjH25llHbph0q/9yOpKmySCVgUQEQS8qRgh52o7OeURiRTiKtQRDEGnorT
         NoVcjNdEyWPbSezWmX91vB11akNqMKwZ5ioJ9rq5vzYvLdl/OALtvIyZJtdWrnrbegq5
         SFnx4aloZrHyl779uqP6+uNrvk5HLGPrUwafP6FDJt4yvvrp9Xgmav7X5ebFXQs8yXA3
         w3Og==
X-Forwarded-Encrypted: i=1; AL+hErEtWVNTk9m1uoiOrHJEfKi6ztvp29q8mvZGoIZDQpBgHj9mHwY0EHavhQVAru4iU/Le/LHZwGDN1xkPwg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8OeKlQRKE+8pr5geaivrX9BW0ymzs95+jgn8Zk4bLgal4fxT2x
	PVBB7PLdVWCwsdX2P7Ziay2IVcPRzLfnzfyr4v2rYExcVgGW4RAykk15aI6YQk8B54k=
X-Gm-Gg: AZFdTZeqgWonst0eBJD6vBz83W34lbm1IfOIT7TyVr60HE4U3E7P23hYydd5yJe1vej
	P26cbQTnUgWltW11Wc90JqccpWuZSWVxLTcisr4WEmI9wlbybNWZDLgmyE5NlOH0yviYyPDfOyj
	6VK1LrBkO3BznaPjNWlacTgJSs6PhHy7ULY477ec0jd/WmfJFF6YCUEljW5imCNb4j8bHtJ1kY4
	Szo9LmR8oJYj/Ciz54P+/7gsINyHBMR0YLL4j50SHsOzREEGOMRuclWu7Rnc1SyaXPxV36Dv6U7
	s60rrOa71fYZRAQc9q7RbrlwlsZjnjCRzn5Y1DbnruI+xf3LK/ueVnX/+l9oMjZSRVy6PYKIRel
	zzT7G2b9OkA/SDJGeCWjHwTobVmfY7VcP68eNB1lLaoEOiliCWeJbC7TIvQVCXJBWxrO6V0i+kt
	w9IiMLxU9PAwm2tX5pLi8O9xf1SkKxUDIHEJnSU3DczGIPpoupCK1WSH6uQ7/1pffEiZ6iIS99O
	sJGgeNJk4pogTE9YQsOJidxwmD60HRSVNgrRRIJXoQ/wlwDtCD3sj1SeSwb7CRb9t8KNtJIOXDl
	LSNBJxVkLGmJk+iQVsRA6Xb5QlUe+zktwA1ZZV000OIlOgDW
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr482584215e9.7.1795793016430;
        Fri, 27 Nov 2026 07:23:36 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm403008435e9.0.2026.11.27.07.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:23:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/6] clk: starfive: jh7110-sys: Fix memory leak in
 reset controller register
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <179579266081.2809466.15729395589845750540.b4-review@b4>
References: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
 <20261123112053.20400-2-changhuang.liang@starfivetech.com>
 <179579266081.2809466.15729395589845750540.b4-review@b4>
Date: Fri, 27 Nov 2026 16:23:34 +0100
Message-Id: <179579301418.2809466.2771229024752123171.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=581; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Vst0VQm1vcSZ7OfH3CNMLMaYl5sNZoVSXY6fEdIrm0c=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcC8qOOV6JqahZuVC1YoPfnyUabkl6O6p0QvLXS+2c5
 pa4zXNZRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACaybzEjw8GazYsXiQc0lB4L
 cP+a8ElOj3NzsajI3W7Wi+c/FlYf3M/IcCmQ+8aHyZke7Md4fv0MdC5S9PwjXBjd9CTS67x3OyM
 PCwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_072338_933504_E3976CDD 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-27 16:17 +0100, Jerome Brunet wrote:
> > auxiliary_device_init() returns an error before device_initialize() is
> > called, so the release callback never runs on this path and the rdev
> > allocated in jh7110_reset_controller_register() is leaked.
> > 
> > Free rdev when auxiliary_device_init() fails.
> > 
> > Fixes: d1aae0663023 ("clk: starfive: Avoid casting iomem pointers")
> 
> sashiko is right about this tag, this needs fixing
> I'll do it while applying the change

Arf I got confused , you've already fixed it up. Sorry about that

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
