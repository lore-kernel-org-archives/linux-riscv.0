Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE52606A32E
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 13:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=szy99wbq;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alpinelinux.org header.i=@alpinelinux.org header.a=rsa-sha256 header.s=smtp header.b=PLiO8SMG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Hgr4zO9HprK2ojaFob2PdaCaqvTV06OZSAszBeEksCI=; b=szy99wbqboFjqfBNdua/A3qkGY
	hUVb1CH52kIkb+KfkcxYIO9l+ClmUkhBdkBrfY/n9X8nsGFVQFH/ImDkTp4VFFxmccz+7RdbHRfS0
	aip5dDRzAFQ6YTGXmYBoRUxHVfZLE1xCiboPvUEQSsoYuDp5mS9Q1WfXEgk5AyhQRHVo3e6SjUWo7
	nPuQoKGsPOxpdTNDoLqQs0kC/EeKi0pHRs/ntO/ffSyFRKCA+f5qctCqpSzWycosI18uQJS23zoE/
	hGI40dGQO2oN79jCqtkx2HSJf9HZ/bbty7DjRSXHxCcCz8gD3zEltrWBacYf8eamdip4G6Fh7NcOe
	21+koeuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR80S-00000006loj-3oHx;
	Wed, 11 Nov 2026 13:04:52 +0000
Received: from smtp.alpinelinux.org ([2a01:7e00:e000:2fc::20] helo=gbr-app-1.alpinelinux.org)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR80P-00000006lnr-3HCD
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 13:04:51 +0000
Received: from ncopa-desktop.lan (unknown [IPv6:2001:4646:fb05:0:3161:925b:8dfd:3d53])
	(Authenticated sender: ncopa@alpinelinux.org)
	by gbr-app-1.alpinelinux.org (Postfix) with ESMTPSA id 953BE224165;
	Wed, 11 Nov 2026 13:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alpinelinux.org;
	s=smtp; t=1794402285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6G+pw+teY+QNpHzmCsxDpYnI0ruF/BglJQxzs6UK3iM=;
	b=PLiO8SMGdBF6l+7TgGcRi1TW3dgupmrEEJVoZVmuBxqEXnsIbBBgAwDgODz1mjNSj8mYk7
	+CVDm0M+kt45YbVugTpYaBGanJLbsO1BAQWFNl+oCVbx2Ec6x2OHCmdTyB/lUvSR0TWEdB
	QnuLnNW2msULPT0JiE/xD9aL4IBU70U=
From: Natanael Copa <ncopa@alpinelinux.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	=?UTF-8?q?Milan=20P=20=2E=20Stani=C4=87?= <mps@arvanta.net>,
	Natanael Copa <ncopa@alpinelinux.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Shuwei Wu <shuwei.wu@mailbox.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] cpufreq: dt: Set the initial OPP to apply its voltage constraints
Date: Wed, 11 Nov 2026 14:04:26 +0100
Message-ID: <20261111130430.10359-1-ncopa@alpinelinux.org>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_050450_055790_BE577FD1 
X-CRM114-Status: GOOD (  12.96  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The cpufreq core skips requests for the current frequency, so a policy
has no voltage constraint on its supply until its first frequency
change. Another policy sharing the supply can then lower the voltage
too far.

On the SpacemiT K1, both clusters share one supply and boot at 1.6 GHz.
When policy0 scales down, the supply drops to 0.95 V while policy4
still runs at 1.6 GHz, causing random crashes during boot.

Set the OPP for the current clock rate of all CPUs before registering
the driver.

Fixes: 3b9c34556fc1 ("riscv: dts: spacemit: Add cpu scaling for K1 SoC")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Assisted-by: Claude:claude-fable-5-2
Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
---
Reproducer, booted with cpufreq.default_governor=performance:

  # echo 614400 > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq

buck1 drops to 950000 uV while policy4 is still at 1600000 kHz, which
crashed my board within seconds.

Tested on a Banana Pi BPI-F3 with v7.3.3 and v7.4-rc2. Without the
patch, v7.3.3 crashed on every boot with schedutil (three). With the
patch, the reproducer keeps buck1 at 1050000 uV, and five boots with
schedutil were clean on each kernel. Not tested on other SoCs.

Other OPP users that never set their current OPP have the same gap. If
you would rather fix this in the OPP core, I can rework it.

Found and fixed with the help of an AI assistant (Claude). I reviewed
and tested the result.

 drivers/cpufreq/cpufreq-dt.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
index eb15650f99bf..2646dda10aac 100644
--- a/drivers/cpufreq/cpufreq-dt.c
+++ b/drivers/cpufreq/cpufreq-dt.c
@@ -153,6 +153,30 @@ static struct cpufreq_driver dt_cpufreq_driver = {
 	.suspend = cpufreq_generic_suspend,
 };
 
+/*
+ * Set the OPP for the current clock rate, so that its voltage constraints
+ * apply before any policy can change frequency. Otherwise another policy
+ * sharing the supply could lower the voltage below what this one needs.
+ */
+static void dt_cpufreq_set_initial_opp(struct device *cpu_dev)
+{
+	struct clk *clk = clk_get(cpu_dev, NULL);
+	unsigned long rate;
+	int ret;
+
+	if (IS_ERR(clk))
+		return;
+
+	rate = clk_get_rate(clk);
+	clk_put(clk);
+	if (!rate)
+		return;
+
+	ret = dev_pm_opp_set_rate(cpu_dev, rate);
+	if (ret)
+		dev_warn(cpu_dev, "failed to set initial OPP: %d\n", ret);
+}
+
 static int dt_cpufreq_early_init(struct device *dev, int cpu)
 {
 	struct private_data *priv;
@@ -251,6 +275,8 @@ static int dt_cpufreq_early_init(struct device *dev, int cpu)
 		goto out;
 	}
 
+	dt_cpufreq_set_initial_opp(cpu_dev);
+
 	list_add(&priv->node, &priv_list);
 	return 0;
 

base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
