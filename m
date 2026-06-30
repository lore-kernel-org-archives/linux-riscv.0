Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD3BC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WL7V4qxczoe0hABAjUlvMJQro5A0v3zuEFPOemFXWzQ=; b=e8K8CpNxul+s90
	CQBq6XBE4GKI6QIX0hlnj1HLYL/ETXKr1bN7idrUw7RSphOmSITxxxBIeQHDDp73pG3WH2cWGwE4J
	2M1mrRk1AYSkTe2u2GdK7x/QzdF13KX8lE+C09mPODW19XxgEajN29g2sgPSFLjAg0FkbNauMRxUk
	hKbhphjsdefJ7taZ0YmJZ32Ird+Yg4nERYeFkJ+rt9FPwcoZlBjRblYGnaB7BYKAHLVb8VuXoclv/
	9hatyVel6E9PUy3ISWvP/59EJewv9kaeDbVN7/G2Au0Y783hYUo6+3Mf0KbOgFHt/7/qfp9cw2o9H
	IdaHfItw0YRjZ9qPi73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV5Q-0000000GWhD-2Xt9;
	Tue, 30 Jun 2026 09:49:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV5P-0000000GWh7-0FgK
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 09:48:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F096600BB;
	Tue, 30 Jun 2026 09:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45EB1F00A3D;
	Tue, 30 Jun 2026 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782812938;
	bh=Wz2QEdQjtR6RjwHJZO3VyjTyb70C1jKt+To9uiVZSCI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=hsRUnlnjoHMtUp9PyFc2b/IDfatYNC9odnqc7yaijObG1pGLVULuRTK0j3QOFiiLm
	 waWfzZcwM0KGplGdyZ9rcAztOtX7bmdk2c14hn+fF/5olYwd/E7LshddbZFUm7Nq23
	 UIMa1pcSphoVqvBrwbZrXui0OwL0oPTIiPaa7S2TdJ4jCxcckGaRl67/QMAI//bWkw
	 9RgD5uKmm2UOou0hTxpw5+M8F70Ng/hZmXSB73chY3NtbpzYK/KUpA/UJW9GTt6C9P
	 nY0ACq5hgC4TCbOGFAizL7Y+G6NC77hHXWFXQYubsdrsCNE/lP+3/tsyYsotlDn7Tg
	 YNkV1jBTv72YQ==
Mime-Version: 1.0
Date: Tue, 30 Jun 2026 11:48:48 +0200
Message-Id: <DJMAFSKM4K9W.19ED2PVPU6S3R@kernel.org>
Subject: Re: [PATCH 1/7] samples: rust_dma: use vertical import style
Cc: "Miguel Ojeda" <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>, "Alexandre
 Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Drew Fustini" <fustini@kernel.org>, "Guo Ren"
 <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>, "Michal Wilczynski"
 <m.wilczynski@samsung.com>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Viresh
 Kumar" <viresh.kumar@linaro.org>, "Jens Axboe" <axboe@kernel.dk>, "FUJITA
 Tomonori" <fujita.tomonori@gmail.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Heiner Kallweit" <hkallweit1@gmail.com>, "Russell King"
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, <driver-core@lists.linux.dev>,
 <linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-block@vger.kernel.org>,
 <netdev@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "Guru Das Srinagesh" <linux@gurudas.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev> <20260628-b4-rust-vertical-imports-v1-1-98bc71d4810b@gurudas.dev>
In-Reply-To: <20260628-b4-rust-vertical-imports-v1-1-98bc71d4810b@gurudas.dev>
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

On Mon Jun 29, 2026 at 5:38 AM CEST, Guru Das Srinagesh wrote:
>      page, pci,

Can you please also convert this one? Patch 7 also misses at least one case.

Thanks,
Danilo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
