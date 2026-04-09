Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8962E98FB7
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 13:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BauTyZQkYQj/Ydc+VrcNfPYRodmdXV6/hxjY1vELoj8=; b=VR+N2OAvg+4Zut
	f9mkJj7B+wnWclpkx2hVU3E6lNzzm7FXMC1eKti9kmuONXLc7DDhebUa2l5sb+Avo31o9dviJN6tX
	UVslN27jtxe4jmfZ4he/rJGdSfUVP7fwRQu2Jbe/26JfNpt1OH3QzTMzRIT8396RBKhuKaYCmgkFZ
	Gt0aJSf3z1WL1bUJibRCNh/ERYbc1lOfvkgNdUGR+XvxgZ979IpLoZKaulbkp96FRUV80Hw6CU0xt
	JMlPW4sIDzsA4qIPXtl9DjngMcl0YtOCG58v5RPwFHOhEL2Xg6jhluXusQE61IAOjP5G4Gi4l1Ch2
	o46gcEgyNP8CGbw0FQhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApVV-0000000AWc7-3Wl2;
	Thu, 09 Apr 2026 13:33:17 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApVS-0000000AWbG-3T3X
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 13:33:16 +0000
Received: from hwang4-g16.. (unknown [183.241.38.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 5424541FB9;
	Thu,  9 Apr 2026 13:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1775741593;
	bh=gjDPIHX4oMhgCbYacXUZmPX9Eq2M5Yv9dvhWWZijtwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=RK4b1e+CikmvHXsoWtzhll3bFWZwFqJ6IezlqERcFgrs7KKBWDlJs/k4tdj0wmuFE
	 ZGoC9TTdojSot5AYogjkrwTqEFo1q/D1E21yy/iTRujB6JQxzCdXZfBWv0EsBQ7s90
	 7d2yaosnTTJ7DDA8QvCy74vyX+jsP3EW747pWdFDsZ+C6Fvhuxcy27kQmBID2HfV1i
	 L2eTIIbPjts5jc5vxnT3z96ptjO/DOmOFLI/CKOTdoAcNQ7eBGujPf5osXD2uMpSpH
	 9zqBm07V7N+qYnwbyC+L53deheItnlA9su3g7Q9okSduX+a3veKVmkCTZw1CpZ4XaI
	 oKBYl40uBzhwM2PyJVlbZBkqToBlCe/HWpx3tvNxXf9QAcOwobvjNFdz14wRk4aoNh
	 Tb8b8V53wbKezTTSTsT1uZm6ySdpmJI76suSABp4ZMgFG8fMM4m2zWtHx7ZuYaBire
	 GWaFlt+p6s2+Ky835Iv3wWGzmKdGyQRYB3yuCoMX6XYKFXDC92XiUyX8loEsFE/ld3
	 ltBtDV8dDGNQrQkUdyEWQNV6mlrTK+w3QMBkj9F4kZRq39L8/CNYXBaGgCDFIsSYug
	 XciDQO56aDvocrXsYcBKE95pML1fknAH8AGq73xPA4gA+rtDVbaJJi5cXugm4IPhMl
	 QRJ6ZgZn7xKLvrecRVOyullc=
From: Hui Wang <hui.wang@canonical.com>
To: linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	danil.skrebenkov@cloudbear.ru,
	ajones@ventanamicro.com,
	atish.patra@linux.dev
Cc: hui.wang@canonical.com
Subject: [PATCH 2/2] riscv: cpu_ops_sbi: No need to be bothered to check ret.error
Date: Thu,  9 Apr 2026 21:32:47 +0800
Message-ID: <20260409133247.76215-2-hui.wang@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409133247.76215-1-hui.wang@canonical.com>
References: <20260409133247.76215-1-hui.wang@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_063315_320743_38805755 
X-CRM114-Status: UNSURE (   9.70  )
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

If the ret.error equals to 0, the sbi_err_map_linux_errno() can also
handle it, i.e. if ret.error is SBI_SUCCESS, it will return 0
immediately, so no need to be bothered to check ret.error here.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 arch/riscv/kernel/cpu_ops_sbi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index a17b7576b77d..07d5752a7b03 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -30,10 +30,8 @@ static int sbi_hsm_hart_start(unsigned long hartid, unsigned long saddr,
 
 	ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_START,
 			hartid, saddr, priv, 0, 0, 0);
-	if (ret.error)
-		return sbi_err_map_linux_errno(ret.error);
-	else
-		return 0;
+
+	return sbi_err_map_linux_errno(ret.error);
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
@@ -43,10 +41,7 @@ static int sbi_hsm_hart_stop(void)
 
 	ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_STOP, 0, 0, 0, 0, 0, 0);
 
-	if (ret.error)
-		return sbi_err_map_linux_errno(ret.error);
-	else
-		return 0;
+	return sbi_err_map_linux_errno(ret.error);
 }
 
 static int sbi_hsm_hart_get_status(unsigned long hartid)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
