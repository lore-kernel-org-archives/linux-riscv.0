Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6A3CD342C
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 11:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mj++GS16U7Ur6tgwYUn9VS7v90h8DHjoMOsZgWBv9A4=; b=WyUzCsXfHii3Qw
	FkNbQ376pKyg/i5vxU315cf5fDaemQWSvqCSGaro0ajWpBF2UXb+Up1GnzrzA8ppJFKWEuFS/hCzx
	mP7W/Dp9pPLe0NzbE5RoppOBy29A2jkmIK5ChbwB77hG4I3weab+Ewy0q3G7pB9ivQQl+GfIYj8ra
	Cc2Y7PLSaGC9Z/pUHWmARh+rxT7geR4F9ag4IGN+dBqTvhwvBljQfxuYsmlEAtrozUMzp9ez7/4+M
	+qdcAP/i55+Ac0i7p/5IgT4/3S/Tuom3NHXOatQpcxVpHV6UafXHxZxbdv9Fmkg/hRFeIn9+8bdRh
	i4cWZwB/907L+bjePKEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKaRB-00000000cu8-00DT;
	Wed, 06 May 2026 11:29:09 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKaRA-00000000cta-0Q2p
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 11:29:08 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-365312a27abso3468506a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 May 2026 04:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778066947; x=1778671747; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8SRkpzBtg7ElKGnjfbnst8QCSHEYY7joA8xwn5z+tF0=;
        b=QeEFP/f9OmdePmM3OdqqFLky2uDhNRgjNc40SCjviCrbY26hFmRb4fLwQzcijnHT4Z
         zmgVbhu8xGCSbG2SYUqgOCIGCZbsk7wghEAzKEG0+Qg626FVX9isJtWyu/n+t43F+Ydi
         DJjVULobZtfxDoxxWTbwnwlkAD7nn4LWvgAn9PkME41qEktyO81sAR0I4A4U2aHvGutv
         CK8Sb5fk3CxbDcd4twAye2gyvnB+Az9piVtS1XJeZ+/kMVyaa0A1TjSH3taKozNVvmkO
         3DHTpfcLLJdRSygdRiXjGtEr5c4ZoLQ9XDQ+nifU7/4/xjba7fewMNLN178MJ6xbVsQr
         f4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778066947; x=1778671747;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SRkpzBtg7ElKGnjfbnst8QCSHEYY7joA8xwn5z+tF0=;
        b=eR+a/3nfflNjwh3DnofoMRBPAkgVGsceUIfEQSUsAFKNaWqjKuJsrLSWW+64mQGTvc
         d0TyBPrCygJuI/rdDqkiShzdwPy70SOT7TPoz7ZYMfCourVrSa0T7YOsWRraxim2scYn
         i30nCBtHHyTgFJl00JOBgj5eJ5PqOy3z7Fi49BhRUFz7yxI4lbPi6cJMSH/me3XRS+Jx
         ubmZ7P5HWyCBolSxNz5R1I46Mge4JT5DW2E044C3dCwj6XpFJTjYJ/T9CxjTC3SHEvuZ
         oiDTlBDPTvCTg/X8xXyU77ghvWi1pxETsqGnEa7kSgY/ZnsH/WiRlR3ME1aLSxVEKurI
         aeSA==
X-Gm-Message-State: AOJu0YxmDA1PlsY4q74Z82uZ5KOdKXOgPy7cYD/Jc/wISIRKNCqpGyPv
	AMJyK2w02Y2bgV80GeAgeZEIpMfzhHYVA0VKssxps3AJaHMxnFxjRGdK
X-Gm-Gg: AeBDievL+m1snp3Bz7cAMOFk0+t8rE0vXwAHC1V7Wf0jzGutLIbg2VdCTVhgmodTX4c
	fAorenqnd6S5WryqvTAV87yWUfEoBGUw4VxdNxVMfekC8gjApkXJBsF/KcvDNNpYKmY4qouArxi
	izX2cOkzBZJwqY7DIkOCEIQ2aGbF8XAOsDV+XYtgu3wi2Brn++uisdBz+DGC82IN9ssYMqN1f+z
	WXwTSAqxHLzV4Wr1KJrsKU/QUS4stD51vF6kYSbytdMbfnZSB/NgSkpvhymi/lildQHCa6mmtQ/
	dNWdQRYugquEKElcq88wYgzoPlm5q1XUTGE9kl9pTI5cpH1CF+e0ycKNKmumKWYQychzm5gUpah
	d0j+KE5IDAJ0bcWb4XtUQhpvYOxkjcFmGGDI1YZGQPpWBGswXAzCr2ThyEPLb/VJjwHXsXQQtg9
	MKOicxvoNazmbuZL95aaJ+2CD34/UJEtpEZ4SnrR+EARtJPq0fQOEHw3xLo2Yxg6iDGo74A9EDX
	76DHT74J4vyZk/BHJddhPQVj1DEHw==
X-Received: by 2002:a17:90b:1c8b:b0:35e:3e86:e2d1 with SMTP id 98e67ed59e1d1-365ab9dbfdcmr3031254a91.7.1778066946327;
        Wed, 06 May 2026 04:29:06 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365df6f88cesm260826a91.3.2026.05.06.04.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:29:05 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 06 May 2026 19:29:02 +0800
Subject: [PATCH] soc: microchip: mpfs-sys-controller: fix resource leak on
 probe error
MIME-Version: 1.0
Message-Id: <20260506-mpfs-v1-1-a690c45178c6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP0l+2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwMz3dyCtGLdZPNUIyNzMzNjU1MTJaDSgqLUtMwKsDHRsbW1AFftY3R
 WAAAA
X-Change-ID: 20260506-mpfs-c7e227663554
To: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778066944; l=1475;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=GxLR7YcCdZ1H8oY6mm3UcnwudCwzHYD3vgBjosnOa68=;
 b=1mhIdhK4+zckLNj8ftb0Uns6a6Y+qdcCEejfIfD1YMQS37T5wN33NsXjxuAA6pfZvvlrmaekk
 +0gUCW0q83HD3i3aBnW4DfIynNjIFNoilla/TuGUZ+qubK58aLbS/LL
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_042908_142178_338057E4 
X-CRM114-Status: GOOD (  10.91  )
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

In mpfs_sys_controller_probe(), when device_get_match_data() returns
NULL, it returns -EINVAL directly without freeing the mbox channel
or the allocated sys_controller memory, causing a resource leak.

Fixes: 63b5305ad84d ("soc: microchip: mpfs-sys-controller: add support for pic64gx")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 92d1142a59e6..0400a01b2338 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -158,8 +158,8 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 
 	of_data = (struct mpfs_syscon_config *) device_get_match_data(dev);
 	if (!of_data) {
-		dev_err(dev, "Error getting match data\n");
-		return -EINVAL;
+		ret = dev_err_probe(dev, -EINVAL, "Error getting match data\n");
+		goto out_free_channel;
 	}
 
 	for (i = 0; i < of_data->nb_subdevs; i++) {
@@ -173,6 +173,8 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 
 	return 0;
 
+out_free_channel:
+	mbox_free_channel(sys_controller->chan);
 out_free:
 	kfree(sys_controller);
 	return ret;

---
base-commit: 9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
change-id: 20260506-mpfs-c7e227663554

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
