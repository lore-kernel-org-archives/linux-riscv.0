Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9B1606A332
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Zf6vh+/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a03QJM4V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a9iuwxMUcbdDgvy59tUjr4tIQsgVImPSkRx+Rn6hhy0=; b=2Zf6vh+/tf24wodsk6/iCWbgve
	LdTNrf0IkwWxz580T/N2aseDNTLuQxodT3rANCdPEtFF+/6xzzMU2VY7r0WC5oU3EpWAAmBfJLSI3
	cOXJEe2IZ7QFB+AI+qKMAhDuxWIioaEjxOKMhANtWcqNq4VaTFh/3quiYNqNsQtVKjKr058pB6ZUG
	LLKmxrszqVw9gHHSqNZz9WsCE1hxg5714oC1SpN8yBH5Jn/vu5pZFQjuCv8cfxRNhhp8gPTl4WRpV
	5WAs/JmRIuemME2uCbx5kA9ipLXJtPcA/OBPwRTp7tSMBtYGIktMy5uKS+8beyvWLaU+at7J4uYDB
	CQxSmVaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrKl-0000000Cwy8-2mKF;
	Fri, 13 Nov 2026 13:28:51 +0000
Received: from mail-wm2-x0b.google.com ([2a00:1450:4864:31::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrKj-0000000CwxH-11mI
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 13:28:50 +0000
Received: by mail-wm2-x0b.google.com with SMTP id 5b1f17b1804b1-49ff9833fedso1577215e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 05:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794576527; x=1795181327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRo7HIV8yZ/AJq7Hb5Yi36jH8E/ybOv5u/YJ01l5Ztw=;
        b=a03QJM4VfIwNlCPgfZhjDA0zYbq/jLpfzdATZcx5Jw2YOj1NykEgHzOo4shGmBXVk7
         vRprWTxpnjyeHH1l7ZZAi30AkcZyFs/Dg/HhJrICH1xruBkAv8BdKSpTzBRe4h0Yj6fD
         N5n78GEh6JFDdE3n8oULzGRmxEiZMO8Mcx0DYE3NIRNnFmMRahClwDrJO8x5WZElE+BM
         RBKxNkGIb68ceiOTkmx+X73cUayKveqJ7PoE44/N6oZnWS5KBXQEk8GU0xokc0t2b4+b
         jjzmcWbIQpFumI2NpnCLf+meOnBYMvV6HijMMeeIFxhllWBMx6UfnDGMlzRc1R1oiffF
         xZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576527; x=1795181327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MRo7HIV8yZ/AJq7Hb5Yi36jH8E/ybOv5u/YJ01l5Ztw=;
        b=MvGE7fvUckbQa2jqDgjWzK3GmdQKkjjfx8PI1j5N6XCVTEcU5s4Xxt57QAV7t+9Zi8
         cfVuR9rmxlsBN6pWO3ItCT43otO7WfWarUFVatGZKJhi7Vz0l8Tqtn0N650kDY9ri5ti
         LLaNBp1vbe7B9X3Nci5MGoOnTNuhNzErarlJASzorFFR/Ib+QRQtLMGGdIoIIHdcBHVy
         C297XmALYP1kq3a2kw2OGO6KNqcFket+1Vl8Z22/PZmmbPO/a8gQLaiH8Bu/C5f8SpxH
         ci9kJAFbmT0oN5WSUZUl57Th2FhpJHWtQyIySmFHwZ+Q8DIK0+BYSXLMvrpAxx+5OFfu
         9Big==
X-Forwarded-Encrypted: i=1; AL+hErGozbAjlXH4r1p7Gh2ohyZ2FL1oxN54YkuPqWoXHYHsYIUZ5SsZ8LQLTB78XcpwIfV4xcGJpwdp6CFv4g==@lists.infradead.org
X-Gm-Message-State: APuU4Z9SXjp7z77b5vuQweHBOOuEsqwA169suLJ+eDDiOBBEf1gPzBnb
	slrsN7iPLOc2u1v1vUtDN4npYEPIXAnFv/TdhP/VBcswoLKwBF3mPnkf
X-Gm-Gg: AYBFou2wbiupdhdkaE3zL4SZKBqB9ofACyuj98Ipl6J4dQKfOFhup1SwZOuBt6XCRZW
	KzIvoFjrUj4J/dc5uX9e333Jr7jPS4DiuVDO2e+3sDXgjPlepLvDxac3EYC8k9MR9KH1XBoqibI
	LMNxGofZa02Y0JU7uegZz+0DK8BpcdZjamyNacMu6eoClLj604JDuZ7CxXwLPjR44z3k0uD5pew
	hrcXsVFUU5orzLqTqZZrycm7ZXq7fe1kuZ2g+gYSdLBX2ZYkK9viUqDLmjKAmzO0XAsnBqXZdoN
	ThyNY8iXxlDkdXsUNM2UG4key9dy6oXmjhaSxjuXFWlXCSPkYsuBTkTnPuoTywV9EfDwYE1wX0T
	cOZuRiw2kmOkv3mfVDuwAdfmMbC/4p0Qy7uLbuzTHiDuhIxjVIB3ahcTb5JthGIOzbdYgWOdlb5
	WjLLnVTT6o+DQDjn9vJNhF2dvlUtit8JzY1Azp1/pjSU2+fTqTvwnIICbwVvsJNuT3E4ts0QFQP
	+Oqs9E6KfG6mZvF6uT9Y9i1KYY6SbGwnB5dqVUBSWsLarf4qim8eKYY1+R5qFsBWvqMhcNqR3x9
	o+eb5E/2CWzvlAhwy8YQM5mHoRVEg9Cn
X-Received: by 2002:a05:600c:e557:20b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4bb55a583bbmr34500945e9.11.1794576527138;
        Fri, 13 Nov 2026 05:28:47 -0800 (PST)
Received: from workstation.. ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm4802673f8f.27.2026.11.13.05.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:28:45 -0800 (PST)
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
Subject: [PATCH net v2 2/2] net: spacemit: Hold RTNL lock in emac_resume() and emac_suspend()
Date: Fri, 13 Nov 2026 18:24:35 +0500
Message-Id: <20261113132435.434615-3-alitariq45892@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113132435.434615-1-alitariq45892@gmail.com>
References: <20261113132435.434615-1-alitariq45892@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_052849_301562_B2D6449B 
X-CRM114-Status: GOOD (  13.85  )
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

Take RTNL in emac_suspend() and emac_resume() before the netif_running()
checks, so the interface can't be opened or closed between the check and
emac_stop() or emac_open().

Found by CI suspend tests on Orange Pi RV2 (SpacemiT K1). Tested on the
same board with lockdep enabled: 12 suspend/resume cycles without the
warning, and kselftest with no new failures.

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
---
Changes in v2:
- Moved the rtnl_lock() before the 'running' flag check
Warning Log: https://kernelci.cloud-v.co/scheduler/job/549#L2168
Fixed Log: https://kernelci.cloud-v.co/scheduler/job/589
---
 drivers/net/ethernet/spacemit/k1_emac.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 51edc95f54c8..d07d8a1aa5ee 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -2031,11 +2031,16 @@ static int emac_resume(struct device *dev)
 		dev_err(dev, "Failed to enable bus clock: %d\n", ret);
 		return ret;
 	}
+	rtnl_lock();
 
-	if (!netif_running(ndev))
+	if (!netif_running(ndev)) {
+		rtnl_unlock();
 		return 0;
+	}
 
 	ret = emac_open(ndev);
+	rtnl_unlock();
+
 	if (ret) {
 		clk_disable_unprepare(priv->bus_clk);
 		return ret;
@@ -2055,12 +2060,16 @@ static int emac_suspend(struct device *dev)
 
 	disable_work_sync(&priv->tx_timeout_task);
 
+	rtnl_lock();
+
 	if (!ndev || !netif_running(ndev)) {
+		rtnl_unlock();
 		clk_disable_unprepare(priv->bus_clk);
 		return 0;
 	}
 
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
