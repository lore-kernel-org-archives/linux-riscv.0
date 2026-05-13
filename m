Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D13FCD4F21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 17:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CdYDtNhj+ZzHFvaLQUeEuV8ZG5/LUyRSN3/x5VSRgb8=; b=YQ1HrshhAaC9pG
	yHRFOJEeKbFFY6oWFu5PD8Bi1s239HJ9V2NFTKnPPH9/BH7BkRr9WwVxOaqGiys9P8JW7d40vWYQh
	crm7LFNvuzcmAmkDstHK39OI2QX+OatccVvp8vnoCW0JoYZKM4He2Nh47ap8MPPLY/u40uBjMtS8g
	AojpH7VZHppINUI2MRuYOKIUHM55uWB697TIpreFjnHhosRL2fWoA0HrT8jZvkroxi+gQJKdpKW4k
	U1cUXo/274W25/KhV4rEoIk6f4sS8wECkdB579WfA1G9vT9s5+THkJ3RCoioDy5X9GEMQ6zww7opa
	nNq7sKM6/ZYN+24zGkcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDov-00000003PJb-2DZ1;
	Wed, 13 May 2026 17:56:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDou-00000003PJC-2CKR
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 17:56:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B4862600AE;
	Wed, 13 May 2026 17:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0E0C19425;
	Wed, 13 May 2026 17:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778694991;
	bh=R9lC2749pYg3wxcS/LuhtOmsNwsluS2P+2LMmHtrIR8=;
	h=From:To:Cc:Subject:Date:From;
	b=UlC3tommUgk81x0Vz8nrqtYtM4ybnYofCqYJtBQsZeexEqJGaUFagb63Mnw/vWeGt
	 8u3FLGRtZv/5jlmh5wtEPfZNk0uu/EQpgaNaniYd9K6hQWoKbssO/7+oDYm1CQTiP/
	 IMSFx61clUQX0f3ciqykpAi9nADakFW/+8skkg0YGWRcVXOWiEpd+uKMQqfDQDTk7x
	 Y6gmb7/aPvFhX6q2Oc1rb/WsQGOehKMqRr1kMXCwggJwbVdgPt2N3zo+KD0hekXUMB
	 JzjnYEWaP+DTs9mMv7nE9WyH4/28jfkPUxftMPxoa+GK13ywBMNIr0eWlQ4XDu4bsx
	 XJrWO9benvIpw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] rtc: mpfs: fix counter upload completion condition
Date: Wed, 13 May 2026 18:55:55 +0100
Message-ID: <20260513-panhandle-ashy-70c6abf84d59@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=iFFJRLWAlC3iNYSd01SHBiZHfPiSVbTpLx9DxnbFIe8=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFksu7VnrLR5eyTIO+zdkgeqk5U3v5rbMH1bzeXfa+39d v2JYNkb31HKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJsMQw/BXSvV5VH6rmJp+S n2A6lSu3o/idyu4te/n7/KfxiQW2JDMyTFnvYXohcvGtqYYLmW9rnubvrjBxLcy09BGO5lkruOA yIwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

The condition that needs to be checked for upload completion is the
UPLOAD bit in the completion register going low. The original iterations
of this driver used a do-while and this was converted to a
read_poll_timeout() during upstreaming without the condition being
inverted as it should have been.

I suspect that this went unnoticed until now because a) the first read
was done when the bit was still set, immediately completing the
read_poll_timeout() and b) because the RTC doesn't hold time when power
is removed from the SoC reducing its utility (I for one keep it
disabled). If my first suspicion was true when the driver was
upstreamed, it's not true any longer though, hence the detection of the
problem.

Fixes: 0b31d703598dc ("rtc: Add driver for Microchip PolarFire SoC")
CC: stable@vger.kernel.org
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Valentina.FernandezAlanis@microchip.com
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: linux-riscv@lists.infradead.org
CC: linux-rtc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/rtc/rtc-mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
index 6aa3eae575d2a..ece6de4a6adbd 100644
--- a/drivers/rtc/rtc-mpfs.c
+++ b/drivers/rtc/rtc-mpfs.c
@@ -112,7 +112,7 @@ static int mpfs_rtc_settime(struct device *dev, struct rtc_time *tm)
 	ctrl |= CONTROL_UPLOAD_BIT;
 	writel(ctrl, rtcdev->base + CONTROL_REG);
 
-	ret = read_poll_timeout(readl, prog, prog & CONTROL_UPLOAD_BIT, 0, UPLOAD_TIMEOUT_US,
+	ret = read_poll_timeout(readl, prog, !(prog & CONTROL_UPLOAD_BIT), 0, UPLOAD_TIMEOUT_US,
 				false, rtcdev->base + CONTROL_REG);
 	if (ret) {
 		dev_err(dev, "timed out uploading time to rtc");
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
