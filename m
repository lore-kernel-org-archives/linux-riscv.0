Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF122606BFC8
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I+BquMQ2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fLeo+r/Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fjbCU3EL6BsT/Z8w131UWe9bQbgrYdIehUpii4THy/k=; b=I+BquMQ2wskxSB5RFcOiR+OVfO
	zoBS5T/+UTJlAH18ivaPhC+Q9VNXDxQpMae6EB4FaxHxK0UOjkNxZuxETE+2c35NSzVtoTNNd4f7a
	lE42Hs2qIhLVVSBKqFFXpmmAdn0E9qJf3pWHBmH5jeXKTiQBR5Oj/9Fc8g3cnPqOjCV21FLnV0Ajb
	MhPCnNU1N7N2nS7REBvWG4mP4kS6Kj9tHUX4y6+NvNx3o7fuML4dn1uEzTVNKKB7ek3VkSiHqE69O
	piRUjjek/Ncvcqe4zyMcvig2UJ8AfflqulbCopUtQge4KSqGwsi+2VWA2xYXz8hNKIuqmn33kAH7l
	8HJD7xxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrKV-0000000Cwq3-1s2G;
	Fri, 13 Nov 2026 13:28:35 +0000
Received: from mail-wm2-x05.google.com ([2a00:1450:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrKT-0000000Cwnl-0MWt
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 13:28:34 +0000
Received: by mail-wm2-x05.google.com with SMTP id 5b1f17b1804b1-4b886ebe069so3475995e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 05:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576511; x=1795181311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zMluFC78cIvBikYbcX1+ABfXuc1qd1361x5Cr08z8xQ=;
        b=fLeo+r/Yop75qTnFiTM1yTB1q506b1yVvzLn13T1pFAU9VReLBn7sqJEyn4ompE7S0
         hmQjLbjRrlwZ+T8YLbgXxAf6kBB8xtLS3jfvRcwcgN83NwX8ZUR/hAge1e50hqUAL74Y
         0ZCli8OPnbm8Axkh26Mod2ZIdhmI+MWOJNUHOetSO8hCi10q2ibiOSWD/xlleU7xepEP
         6wFNXkAfc+hdWs9onrUPkf4JdzEwu4SEHFp8t3Amv/OMt9joenaStnp3SCR+KrKbvNPz
         lM03R2z+nsh6wOEVddIYnBfzMCeWjD30ZqTmGdhUFKR+4O/ZElF1rXLzMjyX0L13UhOy
         6GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576511; x=1795181311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMluFC78cIvBikYbcX1+ABfXuc1qd1361x5Cr08z8xQ=;
        b=eV00EPTsfngLAdtCVts/rxN9MhjVKlB4MRsIBBCaAUReZ+ol83L+ZWq9bmJzch89A5
         YyMkNWsSkD6w2fvr6Nupr9LLyaTNpOS59qZOb/AJ3iYRVMXLanD/I6h8GMidnvlWqexv
         PyyrlKkxjWgQNI8d7yJ/k/B0wJU1YmoEffrZzx2zOIJqNm5/4RnvP4F/aMJQVoPthc6Y
         04mOGWqYYi5h7nkfIyZL+9Ap0XQ+YvdLBd968W9+uqJ3CkY/KFCPbtoQ8XtDhy+EXJeW
         dOov+7p88J+njzqwnClEBlIhMBTh5/ipy4rckJHNvugBz/4VkBBbtgLjQsl+YhpqiezF
         700g==
X-Forwarded-Encrypted: i=1; AL+hErGIhSaYQJSCHxIMy/nCChfGEAJqVla56I6f42ugI/uUw8AZgFKrDrvruXt7tnPtVTAVnXoqnJLUe968ng==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Lg1eRL6JhOsZtuAGyMjiwmfmM2Y764w5qAeaRNe4GWgRfUSjj
	Benk4dCxHYd2qyDhrtp4ATEaZGHEJoeiP887AQAc81nnO37tLVK6gfar
X-Gm-Gg: AYBFou0/T7nQPkSkMTyuK1C+YtATCMvZx2Bitof79Nh/T8JHFKfW3Q8M+10g0tKAA6J
	hTYJnkeQvPHk3HcVztqr99ud16UPrbRqYm/kt1+84L6gVlkXYtwZSjcpSqjvmLpeZhv1hxnJFyg
	z+Wsmmg9S9d3I+lRoH19ahUqgFp1FBimouLo6YYLoymBjn3P+qFTlf1e1VtWTy/VafPAkYt7yC+
	X9isXr4yjzYwx4pfduVtLSmHcYifThjGOHrq7AmFWiyZdUvqbEq10TLzT8PeG+cgll2gkfmug5U
	ti9eVva0BdU6MndmQNn2yMy9oMKMC77LrfyFcEvuQb0vsOwzrzi47gIuPfig4ion0/TJMbUTESP
	9ig5bLb7rMZtUZUN7WQiCPOUh+ON7MALCfB/co5ECx/7o48EKA1PR8CtrAlwt+StwgYBBKKwiHq
	/PyCN8dPd2ZNj6Ik8GlkbpA/VW9qUQIDl4MwVaCxhy+jjYoYmYq6s37cVxfio/bvQykdy+ycZSY
	5buMg1CCpcYbqtEyEuxUI60VDZbcapDuq6LhpulNRnLOowAynMe5yfFZWAoGg4On7ANOxNMn5l6
	Xgm/WYqnuoUYgkbhCg==
X-Received: by 2002:a05:600c:8905:b0:4ba:4395:5755 with SMTP id 5b1f17b1804b1-4bb55a6a5fbmr35028905e9.5.1794576510932;
        Fri, 13 Nov 2026 05:28:30 -0800 (PST)
Received: from workstation.. ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm4802673f8f.27.2026.11.13.05.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:28:29 -0800 (PST)
From: Ali Tariq <alitariq45892@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Ali Tariq <alitariq45892@gmail.com>,
	Tomas Hlavacek <tmshlvck@gmail.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	leitao@debian.org
Subject: [PATCH net v2 0/2] net: spacemit: Fix TX timeout work deadlock and RTNL in PM callbacks
Date: Fri, 13 Nov 2026 18:24:33 +0500
Message-Id: <20261113132435.434615-1-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_052833_190395_F83D0BE7 
X-CRM114-Status: UNSURE (   7.60  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes two locking problems in the SpacemiT K1 Ethernet
driver.

Patch 1 fixes the TX timeout work, which ends up waiting for itself
through cancel_work_sync() in emac_down(), so every TX timeout leaves
RTNL held forever.

Patch 2 takes RTNL in emac_suspend() and emac_resume(), which fixes the
"suspicious RCU usage" warning from phy_disconnect() on suspend. It
depends on patch 1: suspend disables the TX timeout work before taking
RTNL, so it never waits for the work while holding the lock.

Tested on Orange Pi RV2 (SpacemiT K1) with a lockdep kernel: 12
suspend/resume cycles without the warning. The board loses its network
after about a dozen cycles with or without this series; that is a
separate issue.

Changes in v2:
- New patch 1 to fix the TX timeout work deadlock (reported by Troy,
  approach suggested by Vivian)
- Patch 2: take RTNL before the netif_running() checks
- Patch 2: drop Breno's Reviewed-by, since the patch changed

v1: https://lore.kernel.org/netdev/20261105123441.2524171-1-alitariq45892@gmail.com/

Ali Tariq (2):
  net: spacemit: Fix TX timeout work deadlocking on itself
  net: spacemit: Hold RTNL lock in emac_resume() and emac_suspend()

 drivers/net/ethernet/spacemit/k1_emac.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
