Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7F3C83F1A
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 14:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q8Rf5F7zEd9JdmjzCqknElDbsDYdE9Ci/O12UFRD6xw=; b=vZ1I0xMHjRnWBB
	Phfp5lLpTLHtVs6Mt6pKcn5Si8VNQe9FQxiWeozVlFAXxKkBKUrrXIdn+0YQej6U3mrgWlV19uoKX
	XflwZCsUqmJ+23Ju4z2vw03S6UaKpWkFgCsPdZS5lLYbJ1ul/472fcjPOepCEfTihOVAY6OQKyTV/
	arkaaiOozTscEzAXvvPcWVSYpKhg96KDmn70fogpMYAn9PPrQRDGCofBSXKlXmGDc0qYmTZu6+Ml+
	PZdo4H2BGF5DrjtgXo92/cz69zO2qJgwDUzx08CJ9TdUAJ9PzFrhKthfUTNlVl9pZG5eqx0CsXOJm
	qe8yAz1Ak5J07UHEdQHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueaMr-00000005BZ5-2Yvn;
	Wed, 23 Jul 2025 14:22:49 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueZTb-0000000537M-1gEm
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 13:25:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3ab112dea41so3905914f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Jul 2025 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753277142; x=1753881942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jOFjaGN3CsVqLePSDjEetRndyZpxQTsvQQ0tgo6UDc=;
        b=KeWzRRfGMLkKY2qsWm5LS8gklMbYrh8m810cbNvpwTqgQEkvGa/Zn4CYdKMRj8hvvc
         pGuMOfKDcdqgBp2e1bVSAjSoSt6Cx/ZnUkBRbdQAHgTpm5z5JnztpmkFVip8axYzG/mY
         NENkkYdukJ+GW3RDN/vxh1p9LaY+inTaY95fX+OAKvmKfHcPL/ctYCyJSkfh1m5FDKaj
         pJHXKg56FUYOKNdvSm6nPSQVNEMCYz3xTSaZITcEXc2uKhY8vLLYfFg6UzGYNPwxNVGE
         Wkk3mtb3uf7uYNOyct0XCQCKi6UQIb5YZCftOP3so5R7mTeaRpCouSP/FB1TvSnZPEFG
         uPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753277142; x=1753881942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jOFjaGN3CsVqLePSDjEetRndyZpxQTsvQQ0tgo6UDc=;
        b=cwidd6I/UhfnKs8aXxzNN5LRhTu1vLnP2oW8BZ8DhtyKfGC8Ii6ytFpzHDQbVU0/X8
         Th2ATn8Hfo7+aflrgHudC/MywbUaDX2CLELHe8+JNd708eb10MjPcd8voUpEUD617pwY
         6yLvpgGG8M32Ztxrg3N08ZNurbiirLR4TdBmZV0KKYgUxz5eu2ufjZb0/35KIXPFvrjF
         wkXvqcDU9wUHleoZFxagYIciLJMFD+RS8OlI6z5mHzmtMp8oJPUm4VOPI2niqgC7nNIu
         JIOYZWuCu5FBJmBMnbxlwyI4hXJ/qXvKuL7AUNoIgDwgBQczIYC19am50P1r3mSimPXm
         pNNA==
X-Forwarded-Encrypted: i=1; AJvYcCWo0yDrLc5kRWfYI5M0oJTgOytGDVXckAv9XUke347EW3zNlB3feY0S/gdeQE/FzXLBv18sMtUHxQCK3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyS88X8xYM+73AYa609x527mM/cKhvchvM9I8mbJFwRw/wWMWc6
	KEiwRIFcRq1wZsyqiza6zwl6IZCXCV2s51xqtfJsoZ7jpRHLDm1hM+p9y3uU3e//zro=
X-Gm-Gg: ASbGncsiBlUHjlFWnqic8DFUrIqmTx4QchRYW6VPWW/Q7rVymFhA7gKzvu+6eIhfyvg
	6l6PJEPbjWuftt9bqbtxJ3ZegdBazBfoLR8X38Q+JfpHIYTpqlbcN+4WxMRSlSM8w25wGFdjXoy
	6BfbMW+9G8t7kfWwtOp50i4bfZUk4viCXGLeoMxIyFsECdc3ti7nO4B4Ybm5mnw6NwdoOnnrDys
	3qdzPT6h9nqKeStYFO5k2+xpamHYXGubNF5c31QRELNhAxM5Nnzqd79wIb6PaS0mrSatE9msZH7
	1KkFGN88JM9GRALMxN279nWHEEIeVGQ8/THxS+zEaK+bFqH6r1vqlnj07KYpORaMvsWCMl/KKTz
	gyzZdlSPbbA9fqO/H0j02RfxEPIVCUcHmRIWemRjWPTqyImBHPQ==
X-Google-Smtp-Source: AGHT+IG7lEmEEOErHvtFjRdp4cL9IAeiY0R7yViDRurEsfQTfNPWbZmrOYW259gPKET6e12uFu2ovw==
X-Received: by 2002:a05:6000:288a:b0:3a3:67bb:8f3f with SMTP id ffacd0b85a97d-3b768f16391mr2725907f8f.53.1753277141746;
        Wed, 23 Jul 2025 06:25:41 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:7fcb:5e01:8f11:1009])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca315basm16320109f8f.39.2025.07.23.06.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 06:25:41 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: sboyd@kernel.org,
	dlan@gentoo.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2] clk: spacemit: fix resource leak in spacemit_ccu_reset_register
Date: Wed, 23 Jul 2025 15:25:04 +0200
Message-ID: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_062543_436961_4758A2FC 
X-CRM114-Status: GOOD (  10.80  )
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

The function spacemit_ccu_reset_register() allocates memory for an
auxiliary device. If auxiliary_device_add() fails, it skips cleanup of
these resources, resulting in leaks.

Fix this by using the appropriate error handling path.

Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- Properly place the Fixes tip.
---
 drivers/clk/spacemit/ccu-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 65e6de030717..5bb85e32c6cf 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1059,7 +1059,7 @@ static int spacemit_ccu_reset_register(struct device *dev,
 	ret = auxiliary_device_add(adev);
 	if (ret) {
 		auxiliary_device_uninit(adev);
-		return ret;
+		goto err_free_aux_id;
 	}
 
 	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
