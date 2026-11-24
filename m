Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18315606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 02:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wBgv3Swm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lhD05pIX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ANCC35QPD3YXCxwJcmiNnwGHn9Y9JSHVj1CCMMkeNic=; b=wBgv3SwmNaUTxaIpxH9HXqU4M2
	4qV+tbkRmnoZmUe9j3D1kJJucWMVH765UURzror+TurtwxjBXbTZGfxOeJxrSfbHjgFzMugGtIpR+
	bc0fSPlNv05xaKYlS7Ch3BBPFG6VpAUENA6Lqufe43ba8Yy5SJ77ukNcMTAttBPz+GkNFozzTplwF
	KLMF4UYY7KSITUFpVTK5wvGxA6UDSaQh+MaXX+kTHM9LT/8K1rpQC39R3vnlFefncPauULELrFkyr
	JjnUqyL+hqMOFfYriKmnYSuRrDV/lT74RwIIVKIOTbJ+Uqm1+5vGGPcxkWI9bkdyY7b59sxrqXPFp
	dm1XCWGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVg1B-00000005M1y-2cyR;
	Tue, 24 Nov 2026 02:12:25 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVg18-00000005M10-2fIH
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 02:12:24 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-3b3d125637aso777418a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 18:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486341; x=1796091141; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYJhcyx23MYrdnoVW3nJljPvokUxcXGxcoFSW0aOJ4Y=;
        b=lhD05pIXj8AeF/QHTPqQD7jJ4cXvsrpkf+dtsHCzgz6/h+JTvTBeIaaG0sIuPeynSD
         RrkdVzPWKx+RVVJtV+vdsAHh30p9T2dsM9Dg/2OY5EgkY/XLk3OdIzhwAmdAFeL4rMsh
         9JBv/6pJssxKOFLCixRBS6B8dvMhhPinKS9mWeg+ESsaU3CpxNo04JP7ey6fF2Stc8bF
         PZFaZS2dzzoSunAzWoRTXQUbxS8AAmBlbKZssijilOFYRYpczu/SysRyEh9ArlQ0Cdk8
         u8PmZ/BtL1Nnikvuvt+SipiTvoz9L0sxC6m7vfXKWy2LmbGiJ/72KAgSiWQGv3O4njK6
         IG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486341; x=1796091141;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYJhcyx23MYrdnoVW3nJljPvokUxcXGxcoFSW0aOJ4Y=;
        b=p94A1YcntiEuCHC139wnNkKPvPlvjQvkXFDweCYscmdvo8YKcGEnip8/rlf3qwKkiB
         7r60KJ+LRY0ba7QkfO6qVv33rnpA5M7MwKfyI9NjpQdigB0zZldt+TQ3Urb7Rx7j+2ud
         eKTo2XDJWg6JT9WRkK3siybfHLxg9ZQmlKCkC1wL/VVdjA0gWby0BPAfyxkEA9SiT47z
         6sAgEmDZCKh90RHcBoSLeDqzeQFoES3XPWW/SoUkjOksaKDkacby3gzGparJqYWc/GrR
         8OvaEtVn6TQRl2ZOXLn+q5UZBd+Sut64ArLKFYw8K2iBTJm+WlYbxTo2mL1a/QFd4jYO
         EXuw==
X-Forwarded-Encrypted: i=1; AL+hErGUm4DaXJTi5fbtOJmFlKCWF5N20xaB7uWSmtL3DAXQfIXL1UuNQKzw7OLtHCPCFBPKJ2ufydQ+t8+y9g==@lists.infradead.org
X-Gm-Message-State: APuU4Z9lZ0+wSJqK8s5S4OKIdFa7IRFgG+JCvP1D7lmGbWyDN4LGYp7v
	IJgCScPqaWF4a/7uEvr//27yfSK07ihq7gFDUmzkQ1hTuTJwQsvNgeIY
X-Gm-Gg: AZFdTZcTtMI8WozMfe5L+D4J9FceEd+DvbUj2Za7rCW1mATPZFRNv35hJolu/JMLg9L
	SFhRzKN40qMo9APxTC0T9L1fOfHUFQKgYj15tPNwLyNdyOJ0vpG02gwkJ5xyWoQ4AodqWr74NJW
	GdgaHNPqVJ8FA3dItfUtnQE09TxsNPUrk8NsZ1Dg2/6cUY3bqoCBpZ6uGOOa3TE8/n8sFDpye3m
	AjxHIU2VBjs0YMznES8PdQ4m0oV6zK3MAP/Qz0ctJd4nhJAnw1d9J6Mjwi5pLELssha35qbPDCI
	T9tjlJpA22nVFcIGoLZnW7DL14cJl28heEaGQb1yUtGHyOU/HWaY822mD+XHLuIOXSH8FaKNlJA
	nc9TwRfhFd49v0rOAc03i1N9EkMNbwhOGJdHEPPnI2T5MsSN2LNdB4a5KprGLfiBeyixZOPYUFU
	8qhpDzlRSj8YdcYPSO9CF4/ZxRxc0JgB8IiC6e6R1B12Qk1G6ZrOBicZ2zkok0hzFvq2dhhGj2u
	tPejQ7kM9t31NwS8+zFSgNplLp3UeHzqPg1cqPqkbJx3dEoOBlCp0JSoMB2LbhSVu8Cuy+2RZt9
	ACL0OtkVq4JgSv0SvOqv05HCEDrzPzjI+TD6cGOM3r2lXsZTbAuczxuUUQ==
X-Received: by 2002:a17:90b:4ec5:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b41c9476d3mr12780728a91.37.1795486341377;
        Mon, 23 Nov 2026 18:12:21 -0800 (PST)
Received: from localhost ([2403:2c80:6::10a9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm9869004a91.9.2026.11.23.18.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:12:19 -0800 (PST)
Date: Tue, 24 Nov 2026 10:12:15 +0800
Message-ID: <3b4d214b53b64cd7941260875bbc88d7.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/17] drm/spacemit: add SpacemiT K3 display support
In-Reply-To: <DN2OGZ2JLHQ1.3PK0UZ3K1VYKF@oss.qualcomm.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <DN2OGZ2JLHQ1.3PK0UZ3K1VYKF@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_181222_685371_D3ABB7A3 
X-CRM114-Status: UNSURE (   7.94  )
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
Cc: Guodong Xu <docular.xu@gmail.com>, Yao Zi <me@ziyao.cc>, Michael Turquette <mturquette@baylibre.com>, Sarah Emery <sarah.emery@canonical.com>, dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Thomas Zimmermann <tzimmermann@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Brian Masney <bmasney+clk@redhat.com>, spacemit@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>, Dmitry Baryshkov <lumag@kernel.org>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
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

Hi Ze,

On Mon, 23 Nov 2026 22:59:10 +0800, Ze Huang wrote:
> Thanks for v3. I tested the series based on v7.4-rc1 on the K3 Pico-ITX
> with an external DisplayPort monitor.
>
> Modesetting and page flipping with modetest work at 1920x1080@144Hz,
> and kmscube renders correctly using Mesa softpipe.
>
> Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>

Thanks for testing v3.

Cody

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
