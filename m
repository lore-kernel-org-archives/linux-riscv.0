Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA26606D80F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 12:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0M+y0UBS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ADbjDhmL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UF0FYzSDQm9CxnfE8o/S34xtVpc7o7Ftnm48qBHJdXs=; b=0M+y0UBSKVZYpMsoaydJPCDNv/
	mDqCQGK6KoG4JI++Yo6clfoRO22zgS5vcHYDo8JVRMrPsylvazcE6kBDbTYGuMIMtC21qeuD85KeC
	l4dQlbr3iELxuNWvsI6zeg91uT7I4kxVW98ZHdwDdYUzq5IvqqJkuAmZ+C/HAfpynHYKMkT6Fyiri
	lekZmf5af3/L+T0ONZx6FYVo7KA0wAi5Fmpnv6sSVZ4yWkxN0LvbnMLTVN+5w8bSAGVAyNTPceMDQ
	moJukYDPzO4UV8g7+dB+ttTnKJOqEoRV4jQ+iYYYGs4g2iFHbGT3cGxvmBQz0LW5gFJsDou8F/jWB
	dVWA1DmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwhB-00000008ynI-0utm;
	Thu, 05 Nov 2026 12:35:57 +0000
Received: from mail-wm2-x09.google.com ([2a00:1450:4864:31::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwh8-00000008ymP-1W54
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 12:35:55 +0000
Received: by mail-wm2-x09.google.com with SMTP id 5b1f17b1804b1-4a5f76661b5so8532105e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 04:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793882152; x=1794486952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/jFN8eJhh5ybkPCJN1GH5EEF9QQtG/kp2iWAhig7A8=;
        b=ADbjDhmLNfW0oN34SHoKamkODS/zKpkOQ2WQ6VTMYg9p4JBJFXKbDd5wfs39tpEdCE
         ixarQBVAdS+MdXVudpulkKkP2aNdrRXwHTA21JMExaodnycut1u8h8fqBj3MDLyz99Kj
         w0k6I/0/2WCnPVw/I4ijsGE508h+KcQiRYUEaRJMTqJHldfHWn17FjYVOl4OE6wiOsgt
         Erge4OjiZFpNX2aczER8Y5KkyttxSXmrbj7HMk6bQcwR3EFhohWzlOEKj+xLstrINorX
         IqCAVPbkemtkCT2YUiuOhpcTUz8sauRAUbdJA9v2rbaSgVqJFPX5oyK/NcQx1bQ0bJr7
         nq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882152; x=1794486952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/jFN8eJhh5ybkPCJN1GH5EEF9QQtG/kp2iWAhig7A8=;
        b=p3NY/+NEJmiCqXwTS6srjWL6kBEAhCvCiAKLLoDibdNr+NkmqyI2D2m09xjDBQHvbS
         htscnDAtwRpM92kPgMPFe69T+GzHpkvOfYbT8HkZY3egef+WC1sGUAwcieQFQkxE6wsN
         3mRqzTDqUJfbL4ZF6TD8XPULiy6zwguMEGoDhF6avQghZMzkSf4T0oldSKgx46X3fp2y
         d0wjIdgyYNjZFZ3lmCXbT3tvRRdWjzN92xqUFPw8YQ3LgEj9w+bsKEJN6LqjnEi4kJZb
         Xm+07PI08vOc4gCK2kOgtWux3tPWXm+1G7H5DpoXRMMQvbOaoNfQZGl33/N9FdN6x+Op
         +5Tw==
X-Forwarded-Encrypted: i=1; AKwUvBwZS9itdkqwSYGMjSZGkymuzPOVlz8X3y2lX12rLulFFXDWvrVk3ScneAAmM/hkQyqupaYWKABLxPjSTg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/6mhqDpz76WqXgGQJhITOe0653YyDzboaitcAQAx0rXegVD09M
	89/ZzBUekSQ8vXcY8gaGVj3R/LjlO94FNXVRfU0rUs1XteeAo6jh5NbstCRQzq3RPIc=
X-Gm-Gg: AYBFou15JNPxrW3Oetmb3RwNCqwhNl116Gyz+u8PPbI1uuWUiEmDenuh9fhRQS2j7Kh
	DVVBt7+4sK62JXJpJ9TxmA5nEGqGzGDIEwWH85hDWG5IO6V8YeGJL73PVwcJjMEt4uv/a7s3Q/x
	SBQg8Ne81ABeya1DGW62TzfqMgM5XDlo9IvGoVDRjJ9EAU5Q4D8ksbPqgGHzADk19bqGQx51eDz
	olR/TTUcr+DBvhSuBJU/I6r0VCqpSxqoQn4Joh/QMMMKhurbyL/CQ0tBSWVJgE1Lw8OENOQVNmX
	R7Q3u37vuV7y4CHAKCoUyJmIaslqY183LtVXllvKD/h+AmuyEdKFvKcU2dbEKYxSryDr+xxJCak
	Jx+8qwNgL4bNFNXdbFyo9koaC/331d7+v+k8MfLSSqsIwb243EST9GahiuyQN5IVaIoDT49CxzO
	Ga9PYBDwS6Zq62mhVVov0Vd4tckRzH05nXiGb8i/rC7hQ874xS0JCUzeKEYKjGN8OU7V6N+HNwI
	28Rj07yfyuy8sNQ2c24HdIk9BBNqJA7C07K+nZzVWCM+/xmvkGr/EvG8QDBEdU7dyNja4gWIr5A
	/CW1tsoNb4q+W6OM3HUgXQwHGKt8EL5AdS2G
X-Received: by 2002:a05:600c:3547:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4ac1889d442mr421740485e9.22.1793882152080;
        Thu, 05 Nov 2026 04:35:52 -0800 (PST)
Received: from workstation.. ([182.180.105.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm114419535e9.3.2026.11.05.04.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:35:51 -0800 (PST)
From: Ali Tariq <alitariq45892@gmail.com>
To: netdev@vger.kernel.org
Cc: Ali Tariq <alitariq45892@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Tomas Hlavacek <tmshlvck@gmail.com>,
	Muhammad Bilal <meatuni001@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and emac_suspend()
Date: Thu,  5 Nov 2026 17:34:37 +0500
Message-Id: <20261105123441.2524171-1-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_043554_412287_8B5AB6B3 
X-CRM114-Status: UNSURE (   9.77  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The emac_resume() calls the emac_open() and emac_suspend() calls
emac_stop() functions directly without holding the lock through
rtnl_lock(). These functions rely on phy_disconnect() which reads pointer
with rtnl_dereference(). But since no lock is being held,
rtnl_dereference throws a suspicious RCU usage on
Orange Pi RV2 (SpacemiT K1) warning when lockdep is enabled.

WARNING: suspicious RCU usage
drivers/net/phy/phy_device.c:1831 suspicious rcu_dereference_protected() usage!
Call Trace:
phy_detach_internal+0x490/0x5f2
phy_disconnect+0x90/0xc0
emac_stop+0x114/0x626
emac_suspend+0xac/0x126
platform_pm_suspend+0x72/0xe4

Hold RTNL lock before emac_open() and emac_stop() with rtnl_lock() and
release the lock when functions return with rtnl_unlock().

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
---
Warning Log: https://kernelci.cloud-v.co/scheduler/job/549#L2168
Fixed Log: https://kernelci.cloud-v.co/scheduler/job/557
---
 drivers/net/ethernet/spacemit/k1_emac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 71a80838bffd..aca25a9e1e9e 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -2033,7 +2033,10 @@ static int emac_resume(struct device *dev)
 	if (!netif_running(ndev))
 		return 0;
 
+	rtnl_lock();
 	ret = emac_open(ndev);
+	rtnl_unlock();
+
 	if (ret) {
 		clk_disable_unprepare(priv->bus_clk);
 		return ret;
@@ -2056,7 +2059,9 @@ static int emac_suspend(struct device *dev)
 		return 0;
 	}
 
+	rtnl_lock();
 	emac_stop(ndev);
+	rtnl_unlock();
 
 	clk_disable_unprepare(priv->bus_clk);
 	netif_device_detach(ndev);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
