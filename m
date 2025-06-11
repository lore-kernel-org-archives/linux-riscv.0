Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A922C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 14:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lHq7GYqhAPvMOzC/+PpDvXI2ecvZBQnxNf016yWgiEo=; b=rVd0p4xmUa9cyY
	Sz/obRBaRvvOLh1UqaF6ax9KJXB2RsiYs//EdNbf7j4EUkEUNoHKV3ktWksXq+BZTIdMfWw9EQ5JP
	6g7XjcVelVaAebyUuWS4gL1nxTYmIpakSK2RoYUpLou171ScO2hZi49ZSAAFxOqv8FYVW6G67t6oO
	7f/5Ckb8PQDa/ZDj01EtlOXLbsgulSmnVFx7vW+huEgCxr86LxBOUDZP723h+kewMJD71iNflG1sr
	yRuDF1MnWjKiYKQTpOeBJihhiAryL2x5ZjR/acct6+rogpvz/A70rn/kqb9Fnp9z13HYld1sgDpAo
	a5/xkjsg158mh7KMUJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMmo-0000000ACjt-1yPR;
	Wed, 11 Jun 2025 14:50:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPILl-00000009ZPv-2uIc
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 10:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=dwt72CN6KWRLxttKBs5UY4wbGk2WVRiZkQeLI9k7oFE=; b=UV5e0/rq7VlG+0+9eK2G8tl7od
	BrxITgzZ9oENs6ajAXHTY+vbRfsfySOM9iNXA6GX5rvUYmEdao0t+LAxPU8PI/nKyU09MqFemwk3V
	etYFPWFb1k9mVMNCZTDucXbqwILIqJ9vS9faxm6lmP3jL0LmmVATDZk7KExhh8Ti1oSJs9udLR8S2
	OwAsH7mnLH1BYlavEofM0R+oAcpO93QQAnzhpCkXaxeCaLxZwZ/lG7KUG3m591/g+8KMH/cZ08kVv
	VQ0kJnhNXV5RFOTOjrCOE2WSdnwyDPHHCXc4BVns5df4lFWJvDRcwmELbl5b3ueiD5v11pwRXRKE5
	aDLgR+xg==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPILi-00000002FrN-2H1o
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 10:06:29 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so4872636f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749636383; x=1750241183; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dwt72CN6KWRLxttKBs5UY4wbGk2WVRiZkQeLI9k7oFE=;
        b=PudSSPvGrAXpUl0kvojLiQt11B4uPJCuvVUCm0gIqK9xteKcjhjVg2uhprl1ulzfDv
         yAifiZ28QWRK8mRzicbjULUOkHsA+eiumk8zhz3/oKIFwt8Msu15OMzcILCrnyXMyWY4
         7qEt61MnQ6CM5CiptspVrblTQACt9NmZqIrDd2ZxMyI+cJUYZ17rrnvZKT65uNUjt3wX
         7cMpQRgjqqDUbAxrrmijXR1wycCQHoTDcGjxsz1HvpjOq5R0m9wUkUYbawdxXVPpypxF
         Ze1f9DQ5OUYn4Jj6HJo+ZP0FHfHb5fud+nWM5ODf62SFykp8zEZjn9spuN4cucUn2Sy+
         HbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749636383; x=1750241183;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwt72CN6KWRLxttKBs5UY4wbGk2WVRiZkQeLI9k7oFE=;
        b=JVnULkDKhWYJ0JHbN10NFT5XRJgUj3/JQZrvGVH6VXSWycFVIDJ7foISEFoKpK7EJc
         gh+QE6DtkXCPXxCR635gm7ufGzFMiAJHsNGr0YOwYmIdfHgx51rgIwMC8hy3K+Oo2I97
         TI1Pmjoay5d9gwi3aLO1FSSuRUdMREPl7pr2tjypkaIGuRKfbD1Un+OfBPICDAwnLOdR
         9fYpm+UZf+7LEly03u0OUP22U7rK0z2jVsck6AFeCz1FzRJjbGAjzXtMjFOPNbfZhTXI
         gf9bR1F31y+jRxX/3ZqwvjCujzTNZzqNecH3+okWOWcBbCD5P81BaGHKwHRxqQ0c1hdy
         hGmA==
X-Gm-Message-State: AOJu0Yy3vvE8AQKoq12KaILhAjr3varL00GtGpuCgrLCG7hf1Wb2mCDy
	t1odmunO6eStKX7dgfN28v4o1pYHUHl6tSsJDxS4hWmpI/LikfYDCfwhciiAIpFCItKVL1OMJBe
	t74wq
X-Gm-Gg: ASbGncsw8/2WucVT2mqYA6d1QR0YhZQO+Fi3Rhb+x78DaF71HK888xX29SSZWTcrZIc
	Lcm36z1kCXxL2hUAITFGxLIbsan40myP6QwjAFKEf+Q0m9m3Fet6iiSMGpac0xjhjlqoyzTIcvi
	W/KwtqW6MzVgg/pTlv1kRgMVPRMf28cYE6fHvy/YHVw2j0ERI+cZIQnjkdkwAhq29Uh5NnlZ5R1
	iDCno+/wZdEwuVPxS+lYBdKerFpGlYFbPHXHB6R42UzDOVApc/2SoWrDSNX3VNx0k3vfQ0njSeb
	QOEa33yz8DGxpds61Xo/jpKvPLayhm28w4Uxm4MNQwXD58yyQLmBLC9JMPMNWgZCfssnSMcJg9g
	=
X-Google-Smtp-Source: AGHT+IFrV43Q0txBykmBCNkljr+qDXGX9/3eZHASaTsnissCeaNihvRPhHOqaPH4Muc2o0CnaB6Rcg==
X-Received: by 2002:a05:6000:2507:b0:3a4:c75c:efd5 with SMTP id ffacd0b85a97d-3a558ae2c6cmr1887798f8f.46.1749636382979;
        Wed, 11 Jun 2025 03:06:22 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:2c36:1f5f:50e:d73b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53244f04dsm14776613f8f.73.2025.06.11.03.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 03:06:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 11 Jun 2025 12:06:04 +0200
Subject: [PATCH] reset: mpfs: use the auxiliary device creation
MIME-Version: 1.0
Message-Id: <20250611-rst-mpfs-aux-v1-1-c86534b473c3@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAtVSWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0ND3aLiEt3cgrRi3cTSCt00g7REC0tjY1PjtFQloJaCotS0zAqwcdG
 xtbUAdcORv14AAAA=
X-Change-ID: 20250611-rst-mpfs-aux-f0fa893353fe
To: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2778; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=clQ3jgN2qCBEsYAGOoMAdCnfbcHuvX/5rpXfTQ0tO3U=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSVUdU1TyPm/mDwlG3awa11Q7meVPnG5vZHvCv
 pywXVBGTIyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaElVHQAKCRDm/A8cN/La
 hdaWD/wNv4KAjQxUdV25bQK3T8yUrA6M2dS/nL6M5Sb6r10HgWdV2ZhJbbMdRa9WuKQcZB68h1g
 8E6Y0yTGqRkH7BykfWIzHVoayvsA9HCgfP9JBbL+KTlFntewPHupo7WbteyYlFUn1v09MXah+nB
 QV1L47Cx1mQK7g+wswVgx26uNewesjwcl2tJv6Xd0I2iXVID7TB7M17p4mFHnajS4nnqgNFFxzl
 JFLGn7OHSFPrLX+lnl5oFBMoP8xZUdR+otKd3PcJTj9xKbap6kQTo0BVjYtnYO1V31K1/8lG1kD
 Qep6hai3ipKPqTmY7XfVA4KWu1f2aujbqa0+9n3pFd5TCugyMguwcPMS4wyn9DqcPzEiEHP0eB0
 okUfTi0rt4c4D5vXwW9xYFZ/ertWVF6jXF0La9TyQKEPN68hABzCZFePnObunwyZaXiTfPEPRmq
 n1n69l07p2IBiwR1/UYK0MmQdOCLPNCAVg8n4nXj344l1rkcWGa4Pe/mf2Zn/PIx6mKFRW1vG6D
 GezBsQvvHXIcxMjywRsT65fLxQgxxuP+C40cmGgVNHCRxpRoXCSl8dr6sQRF944HxMgpTH9vPr3
 VdYW6KB4k9K3QCKUL0hnR728DkolR1ZNjX0Lr4J4NT9Ax10CcGbotAVmnU2IpAOlmG6hqnSDq2S
 Y2RsIEBzO2ZL+xw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_110626_774955_B2AA5D76 
X-CRM114-Status: GOOD (  10.93  )
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

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
This is essentially a resend of this change [1] which was sent a few months
ago. The necessary auxiliary bus support has now been merged with
v6.16-rc1, so this change should be safe to apply.

[1]: https://lore.kernel.org/r/20250218-aux-device-create-helper-v4-2-c3d7dfdea2e6@baylibre.com
---
 drivers/reset/reset-mpfs.c | 56 +++++-----------------------------------------
 1 file changed, 5 insertions(+), 51 deletions(-)

diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index 574e59db83a4fcf30b60cb5f638607a2ec7b0580..f6fa10e03ea889e5434110156f7bece808a6ae92 100644
--- a/drivers/reset/reset-mpfs.c
+++ b/drivers/reset/reset-mpfs.c
@@ -155,62 +155,16 @@ static int mpfs_reset_probe(struct auxiliary_device *adev,
 	return devm_reset_controller_register(dev, rcdev);
 }
 
-static void mpfs_reset_unregister_adev(void *_adev)
-{
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void mpfs_reset_adev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk_dev)
-{
-	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return ERR_PTR(-ENOMEM);
-
-	adev->name = "reset-mpfs";
-	adev->dev.parent = clk_dev;
-	adev->dev.release = mpfs_reset_adev_release;
-	adev->id = 666u;
-
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ERR_PTR(ret);
-	}
-
-	return adev;
-}
-
 int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *base)
 {
 	struct auxiliary_device *adev;
-	int ret;
 
-	adev = mpfs_reset_adev_alloc(clk_dev);
-	if (IS_ERR(adev))
-		return PTR_ERR(adev);
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	adev->dev.platform_data = (__force void *)base;
+	adev = devm_auxiliary_device_create(clk_dev, "reset-mpfs",
+					    (__force void *)base);
+	if (!adev)
+		return -ENODEV;
 
-	return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, adev);
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, "MCHP_CLK_MPFS");
 

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250611-rst-mpfs-aux-f0fa893353fe

Best regards,
-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
