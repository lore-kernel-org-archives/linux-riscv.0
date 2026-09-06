Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A026C79F99
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 11:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Date:Cc:To:From:MIME-Version:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NCkoldwOdVZxwD2vSCzAcsZi7y2cv78apeX9wR7rSZE=; b=dFS0EY9Vud2FNi
	Y0m4HY7B90nYrW6zVBBbQHYHetHorTQx6ebs9z3WAEulvSzuiyrFwizulj5Layf4xmDe1/euBdT4I
	0y4Uzj8QltmwMvDIDhdmPbp9UsIIT0lFTqjVhClOsGl4zk8T12RHAiYuOAGrna8pfqWR04TKR2WhY
	6grIDK78XatMIPro1cGcQyG0RpAI58xLHr9Akb24BaMgiUMeNU5PfsrgiwqnQpuOQuPwjEH3ImuEH
	yFyg0MCXeMGBGhM3XqwzUOtcftdbc8Uef0XAwK/7O1+5tAAKA1j19+izt3w9Yjet66KVGCrrpHvDa
	KFgWaQP+Uq3GL0r09eJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ApD-00000004ypH-2ghn;
	Sun, 06 Sep 2026 11:14:15 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ApA-00000004yow-2BSK
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 11:14:13 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso1822867a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 06 Sep 2026 04:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788693251; x=1789298051; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DEdh5HmNzXfseZwOB17l9FeOx8g8N1pY3V9IexD1Wc=;
        b=Qi9YtesBiaMmEhUcr97QtX/dj31xLbVcEIzg9KTLxNIlyOqTwegaqA1AWikOtIvWwP
         yr851jiigq84fBCri6FR+3aJUC50NRVqopvWHg+Pl0CQnR7cs9LkkAKTNovEsb69krQ8
         M9onFGA4Uc/U8dSSP7LEgyjsawHkq51eQVu8qGO0NGzkr2u+c9Pp36kmM/vbTSXheA5n
         3yYwniwUhWMmAuSaJqkO8WBlkaNjl4IAwKKkN5mPoKwXsV++Y7ROPhumYv9GVMBQytmz
         ev6EeJme6Gj/OZdwxkP+6DTA7rFbiogsyWEA45XxMUlFkHnk1JXRIVQaVxCY9LvEJNHX
         Y8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788693251; x=1789298051;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5DEdh5HmNzXfseZwOB17l9FeOx8g8N1pY3V9IexD1Wc=;
        b=smkkv9j+Qc0GrtEWrZhCvWpneV6/7ekFtjrRXddr9Qo/F7gGQGhB+ifmMwEgbtSH2i
         mufhWbJ40dNiMt9aTniz9j2Vz/lZkfNGA6jsI1BPohOk16i+kmv4qVofb6Uq8KjZDBx9
         wrCkuaroTVuUqYaScX5+bAQQ6oWQ3QGTeiwLhe3s4oHHBoykQkXfcC3pLQf4eLZBQ9/C
         e8cfl+pJ5M7Xebs8tlBu2biYrdScyRMYO+T1fWAg8CNhnEClTcUgNnpnm/cI6hO4Iw6e
         ACKZSDCU/wOiYkaJcU3fUtsD4RXSVgriDJuL14Ts/+YH6ta7m76PYfeTIhTkhMj0LruI
         Z2sg==
X-Forwarded-Encrypted: i=1; AKwUvBxS9C+Hy5x54IPj+Ey8rMfpF9UZ3eZgJyWQwPbPoRpwAJ3gq0bW/yGo49xJFooeZv99atWX8rikpGFmcw==@lists.infradead.org
X-Gm-Message-State: AFuF++l13l6pZY4+DQU3w7Pn64Gtav26jcgZ4cZF40JGwkzRzMs21d7i
	/mJ+ofDo1Nd1h0my1HlyuzqBxo5BQhhOy5j60ipOvFlSSA3AjwQrzqsh
X-Gm-Gg: AYBFou1bFwWHnR18e56oQbTbC8/DMnEfLXtIGXg0gvWgx6Z4vBmmJtS9j8rq2bhf5E7
	+8WA+AUMNrDi8qCDyojlvxBuj4qhHsL5gk5IVVOTrXlC2u4yTIg58a6HJ+zXAOZp0+TMxAPBJbW
	rstFr9s9uf2P9JI0qcXeIUYIN3zoUXSTLtyEy3xOJhjvwY8E9chJ3msQy6zIBmpIt6YvSoNPoXM
	vIpXbBYvYdkMyuKViZgj/pMCQdCGs2mU7E/HcCg0QZTOlTldkQL8ku+AOYykcf4VRp/U8WL75Ex
	7RAI0srC5HZHgXL+k6BDenkFpFrUXbN9d00DgomUaO+6P6JMrTOKmjQUsHYyOeOasV/zAtoTLnm
	oU6RS7r0/5vWwoznghin1KxW3mwibaUJpct/Esa7De055eayqPszLWUWmFjAGVVPHt3HkFD2Kqu
	3dEhay/vFXT1cS2sUav31szspX9MlCWzByUUnfJtp1WZz8+6gOs7zg01rhQqjYmAkL7csKgoAPD
	C07GLG+9k8W4j9bDzPX5+/tiKRnP85ycwmuYmexXVQBpnPanxKHfCDgL101XZBojwQv
X-Received: by 2002:a17:90b:17cd:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-39b26272b4dmr25093820a91.13.1788693250979;
        Sun, 06 Sep 2026 04:14:10 -0700 (PDT)
Received: from manush ([2406:7400:94:7a79:f149:be84:942d:9300])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33517b57ac8sm10400667eec.28.2026.09.06.04.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:14:10 -0700 (PDT)
Message-ID: <6a9d4b02.7d74b517.206c4c.75f8@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
 alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: 6 Sep 2026 16:44:09 +0530
Subject: [PATCH] rtc: mpfs: fix unchecked devm_clk_get() error pointer in
 probe()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_041412_585079_671E0E45 
X-CRM114-Status: UNSURE (   7.27  )
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

devm_clk_get(&pdev->dev, "rtcref")'s return value was passed straight
into clk_get_rate() without checking it for an error first, unlike the
"rtc" clock a few lines above which is correctly checked with
IS_ERR(). clk_get_rate() only guards against a NULL clk, not an error
pointer:

	if (!clk)
		return 0;
	...
	rate = clk_core_get_rate_recalc(clk->core);

so if devm_clk_get() ever returns an error pointer here (for example
ERR_PTR(-EPROBE_DEFER), which is the normal, expected outcome if the
clkcfg clock-provider this RTC depends on has not registered its
clocks yet by the time this driver probes), clk_get_rate() dereferences
that error pointer instead of returning 0, crashing instead of letting
probe defer.

Capture the clock in the existing 'clk' local and check it with
IS_ERR() before calling clk_get_rate(), matching the handling already
used for the "rtc" clock in this same function.

Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
---
 drivers/rtc/rtc-mpfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
index ece6de4a6..60596b0ea 100644
--- a/drivers/rtc/rtc-mpfs.c
+++ b/drivers/rtc/rtc-mpfs.c
@@ -256,8 +256,12 @@ static int mpfs_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	clk = devm_clk_get(&pdev->dev, "rtcref");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
 	/* prescaler hardware adds 1 to reg value */
-	prescaler = clk_get_rate(devm_clk_get(&pdev->dev, "rtcref")) - 1;
+	prescaler = clk_get_rate(clk) - 1;
 	if (prescaler > MAX_PRESCALER_COUNT) {
 		dev_dbg(&pdev->dev, "invalid prescaler %lu\n", prescaler);
 		return -EINVAL;
-- 
2.46.2.windows.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
