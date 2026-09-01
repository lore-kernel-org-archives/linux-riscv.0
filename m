Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC107C61DD3
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 07:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ouw11pfomKC3LrH7+IWHv+dOl7ocDojnZs1iNgChwN8=; b=dpIvHijzkfEkz7
	cPyAGfZexkVs4BbSWlq9/Svi1rfJrbVw0aT4AuYBKzSoVIFhnbO1jR4r10HpiEj7sq4B6edzSvwqc
	z7bZe5/sq1tmMe1t73+w8g8IXO0c9NXPBl2ZUWltzkmMFJwADJ76VGtXUeg+keQcnfx3/LZUPitMI
	pEwcPHf4klxKp9TD25Sue+syJUGTRKDu1Du8mrLwx83Pgt7iDE+WmYkaovxG2Nf85h6P8iBe7bP5B
	kPUQ83PBivwVkPhZ3H4WKna3wiIto/V46QDTNrb7B/AaDewQGq0LpkAS3ibi37BI2hKkGTUeg95BE
	RUrk3wAq9lxEEFwJ3cNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1IwW-0000000B8Kg-1AmJ;
	Tue, 01 Sep 2026 07:30:04 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1IwT-0000000B8Ju-3nrM
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 07:30:03 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so3552925a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Sep 2026 00:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788247800; x=1788852600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+8A2LQ5vM3BigI+WhOB8dsA95qvFXB16HXhk64vkm4=;
        b=MeWkfqy/GZQXQeZLd+7Dj/U7TlqGXvJpezyxGyIty41o85qspAX7Kd9MCUsDdBigfV
         ObEnZKi9i3W553VHIpOfjtqaobngrrqGCDUPDtHEOB9cKk8x2wbFFQfE3mUIEtcCp4pA
         DLFp8Q5b/B9F3E5RsCwH7PT6XBWfY6S4vnLrgC/r1T/v0igM0+06Ble4PbEJD1vPmFz7
         S5D+GBQX9xZSFMlwB4VximbQsbXXfYkRvabOJdcvEdNtfB8qpOLGVq+kEnQvCYC+vUmF
         UZhbzGrsNvv9J/jBZ7bw6S3Uf1SlP/jmpJc2shdk44hKgCeMMw7hCAnFfRLdoXurt0Lp
         4sBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247800; x=1788852600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+8A2LQ5vM3BigI+WhOB8dsA95qvFXB16HXhk64vkm4=;
        b=jGdOLCR/qlIcZgFNFiRXYuNLVv3SGH6GbbdMoDvH4qIKkA9kwAiHoI7LEe31NSnvKC
         qIbPPJ10TM3jKnzUOQeIBrIE69DfcOVPSfWJnRIa2ZFVoZsTP2hpXif5Vs5uIG9zBL23
         StcgD/3VF+TYdQyMbGWnZgwzt1Gi7Jkohkxz9Z3y5JUJ9my9hjqg45ruP+dpF0kH3ckH
         cGBNy8yPHs7JPrs+wN6elXCInySNwl7L7O47OI3Lww6Ya6HMo/TEVD2DqFzRNgc/M7NR
         fpHWhGxFDgJQ10gG2059CqVsSW6iNWvP0zJ8aybC11WvnmKY/mA7VqvALRJApwK0EjKl
         RWrQ==
X-Gm-Message-State: AFuF++kAAlXgcZQj5yn1dtt9Rw5SXcrKNgEuD2Bc1sAEVdGB1ryzIPO0
	QmLGE0aAjHJ+A8wkDb3Mt1YYmFGohVh2mrBIOERMc3dwz/b5hD1pYgW3
X-Gm-Gg: AYBFou2UsLIVpAd5jKc/rr1SZjhNBd2s9LPBqKyZl05DF5m5U7NkLHcbCDcXJNbjA81
	UNk/i3Rh7a2uRHFhireDM8ZiGR1XID15it9brKmy8n2pQ7oLoMZ9veUmdrHE32yad5ebiKH1Zrp
	nRE7QGI5eMyPs2xn/ki07ueE95BJww3i5l2o4WIS5428wmtS5MDIoYMr7he019hrH2BFCJJhjvY
	piD414J7Aiq2BAD8BuvbXggXCByoFBKRNTzpQJfeRuo8bo3jlenssZDW91fHc7GuWm5xveGmsCe
	yxCRKbMySsggAImCUxhAdkogmaPx69Vds3/tOf+HxldkZlxZpJP2D1/tLee3jNVVklYhWf6K5Vh
	RUWhLsdLMv+XV9XNAlwU/SyWt82K/SyY8PjIuvHP3Xvvc8gdnX+TnDcbhNpU2hxmsQNOUPIuf2v
	XHTVPgOaGdM2Ii48OcFTKVRkY8BuF10OaQXMuWBUVBPm2xsOZnmplBc+sqUK3tTQbuJ16e
X-Received: by 2002:a17:90b:5284:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-396d0e5f5ffmr50882573a91.1.1788247800366;
        Tue, 01 Sep 2026 00:30:00 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b49c867f5sm22117403eec.2.2026.09.01.00.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:29:59 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: conor.dooley@microchip.com,
	daire.mcnamara@microchip.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH] firmware: microchip: use kzalloc_objs() instead of kzalloc() with multiply
Date: Tue,  1 Sep 2026 12:59:50 +0530
Message-ID: <20260901072951.525569-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_003001_947828_4BE8C718 
X-CRM114-Status: GOOD (  12.69  )
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

response_msg is sized as
AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(*response_msg) by hand in both
call sites. Use kzalloc_objs() instead, matching the kzalloc_obj()
already used elsewhere in this same file for the other allocations in
these functions, and getting the same overflow-checked size
computation kzalloc_obj() already benefits from.

No functional change.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 drivers/firmware/microchip/mpfs-auto-update.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firmware/microchip/mpfs-auto-update.c
index 1211fd8d0463..b97d34bd2354 100644
--- a/drivers/firmware/microchip/mpfs-auto-update.c
+++ b/drivers/firmware/microchip/mpfs-auto-update.c
@@ -156,7 +156,7 @@ static int mpfs_auto_update_verify_image(struct fw_upload *fw_uploader)
 {
 	struct mpfs_auto_update_priv *priv = fw_uploader->dd_handle;
 	u32 *response_msg __free(kfree) =
-		kzalloc(AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(*response_msg), GFP_KERNEL);
+		kzalloc_objs(*response_msg, AUTO_UPDATE_FEATURE_RESP_SIZE);
 	struct mpfs_mss_response *response __free(kfree) =
 		kzalloc_obj(struct mpfs_mss_response);
 	struct mpfs_mss_msg *message __free(kfree) =
@@ -358,7 +358,7 @@ static const struct fw_upload_ops mpfs_auto_update_ops = {
 static int mpfs_auto_update_available(struct mpfs_auto_update_priv *priv)
 {
 	u32 *response_msg __free(kfree) =
-		kzalloc(AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(*response_msg), GFP_KERNEL);
+		kzalloc_objs(*response_msg, AUTO_UPDATE_FEATURE_RESP_SIZE);
 	struct mpfs_mss_response *response __free(kfree) =
 		kzalloc_obj(struct mpfs_mss_response);
 	struct mpfs_mss_msg *message __free(kfree) =

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
