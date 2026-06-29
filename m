Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D51C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 03:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ahpOkIjdYJXiQw9KDPb1M5mkUeK/yuhrDPSteCCp0Zk=; b=A4eZGUMs2fHdNS
	nVdKaeYxcfv9cK0kL2JHIxJMmUt6g/uwXbqc6r1Z7l34XVSOBOBHTcpPKnKyTouXyuKuo+Mx0WiWV
	sPBgM42+P9MaH6FevsT5vNXpRJ7zbgM/gLyxa1yrbIIkhnw750joKESMXpQqIO3Qv2TGTjxbSbmlh
	vMkNpO/2IdYwnuAC6tPOPZF9UfhkUbnjN7iW3JpYbAVuWGmRBWAMk8uAedyQ1FLwVQkQguGcdaL8c
	v5Uj/0J9cTjF1tdHzbVDxDmcFx2NlKtR91G1sI1ixPzAin4GJLj7xzxmE1mXxt6vF6iK1wpwIgL/z
	8EdcRPgE5CMv8GrVqgNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we2pS-0000000Dcz4-40SW;
	Mon, 29 Jun 2026 03:38:38 +0000
Received: from out-03.smtp.spacemail.com ([63.250.43.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we2pP-0000000DcxT-3jCM
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 03:38:38 +0000
Received: from [192.168.1.96] (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4gpX745lPmz8sb8;
	Mon, 29 Jun 2026 03:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1782704306;
	bh=9yoPMHqZhzE3iqqcnolBlcsUAlSSjRhy9gREnWpZKGs=;
	h=From:Subject:Date:To:Cc:From;
	b=g8g5D1ENhx0FQXYOE+JOzorI+irSq/d4W2LRj/WFMzmT6KCIBS7JXZnh9ShOgGvNZ
	 aszSMWYS/ub/pIKYTwqrIon+1uEFqma6r0HBSn5ixt8jZHDbtLJAJAgazxD7fgzEvp
	 kSXsX2UHXYI+HFz5zqXxa2EzMqpV4UuVs3AI/aGF93KLqj93boQneIElJUHAHncIVI
	 3vVp7mGhu/nm8AfBxKI50mwA+0/XUsg2ZFMlSZvNy7WixAEk1oNp1h4/QwPHWDPPca
	 V5Gwm64Bne8LdzuTHGjEOhJy+S3uOPsnvXG4IyE1GsodIRiBDNDOlIa24h9pYwadjK
	 CKuYevZSxFVRQ==
From: Guru Das Srinagesh <linux@gurudas.dev>
Subject: [PATCH 0/7] rust: Use kernel style vertical imports in various
 drivers
Date: Sun, 28 Jun 2026 20:38:14 -0700
Message-Id: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqCQBCF4VeRuW7AFtmsV4kudD3mRKnMrCKI7
 +6alx+H869kUIHRI1tJMYvJ0CdcLxmFrurfYGmSyeXO596VXBesk0WeoVFC9WX5jYNGS4MHfHD
 F7d5Suo+KVpZ/+vk6bVP9QYhHj7ZtB0PCpC58AAAA
X-Change-ID: 20260628-b4-rust-vertical-imports-b46ee6c2479f
To: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Jens Axboe <axboe@kernel.dk>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 driver-core@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-block@vger.kernel.org, netdev@vger.kernel.org, 
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 Guru Das Srinagesh <linux@gurudas.dev>
X-Mailer: b4 0.15.2
X-Envelope-From: linux@gurudas.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_203836_192696_FE0D27E0 
X-CRM114-Status: UNSURE (   6.93  )
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

Came across a recent commit bc58905eb07 ("samples: rust_misc_device: use
vertical import style") and found a few more locations that could
benefit from this cleanup. No functional changes.

Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
---
Guru Das Srinagesh (7):
      samples: rust_dma: use vertical import style
      pwm: th1520: use vertical import style
      cpufreq: rcpufreq_dt: use vertical import style
      block: rnull: use vertical import style
      net: phy: ax88796b: use vertical import style
      net: phy: qt2025: use vertical import style
      drm/nova: use vertical import style

 drivers/block/rnull/configfs.rs  | 20 ++++++++++++++++----
 drivers/block/rnull/rnull.rs     | 13 ++++++++++---
 drivers/cpufreq/rcpufreq_dt.rs   |  5 ++++-
 drivers/gpu/drm/nova/file.rs     |  5 ++++-
 drivers/gpu/drm/nova/gem.rs      |  6 +++++-
 drivers/net/phy/ax88796b_rust.rs |  7 ++++++-
 drivers/net/phy/qt2025.rs        | 10 ++++++++--
 drivers/pwm/pwm_th1520.rs        |  6 +++++-
 samples/rust/rust_dma.rs         |  5 ++++-
 9 files changed, 62 insertions(+), 15 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260628-b4-rust-vertical-imports-b46ee6c2479f

Best regards,
--  
Guru Das Srinagesh <linux@gurudas.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
