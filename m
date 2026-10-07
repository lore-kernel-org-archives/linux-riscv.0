Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7D3CA5FFC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LQuGSX87jiluRIugKarlx8Sx/ZxIeqqaCqmjTiwLwJA=; b=TPbA8ZAwo86vCd
	fOq9MNwqiAiTkXRhlvjr5bDy1CZ6Uh7WwZoJNRNxi6qbhDQyCdhiTV7X0G+OB6dRVRTTQMO70xdXi
	VGWy74vdzVPLM75sCmor0sTTp3RC+v1rC1cegZz+uj4656cCAJfHpVn0AIBTo+QMDlF6y7aR70eun
	HT16C13Jt2eJkFhhYIIXan/RbJw5Rj9kP9aTrs3/qyR1WKhwMM2fnr12Tt3QppHn4UuhPIzc7ZuZL
	3lDHdjNOAmAYJRTkdC8pG3O+EM7Oyx6s7JjYAGgJI7gb0C/UEO3zH+54MyGrkKGtxXCOIvPV481xK
	8hPODT7vZ5bCjgNm3rDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQck-00000002QmG-0e0g;
	Wed, 07 Oct 2026 12:19:54 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQci-00000002Qls-1XGX
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 12:19:53 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so1104536a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 05:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791375591; x=1791980391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJgd37GAAGOynCuOtDFQNEeNDITfTTm77Q1swyZehk0=;
        b=YJbrEFanf9kvBiGj0m79i4BW4jadXxr8mAFKuPAZPiOs8tKMN40P29RH7Soz0vqsdw
         ZEdiUjsxZVK//mdE02aI6W8B/ibbhIurM4lks5FND16HSmBGHzxCTBADe0oDiuMjUL1f
         6CO2FXRfW320eb0vk6HYfwK+A7YX+LpyF+piczC+FIjXFgOi4QPDpjP242pKSEYgPgLi
         3PEgJwKJd1WN8kgIOXezeKD976c9Vfbef+z2IXi89pgLWIbBJLL6V86NWJOEOz80ntaF
         GlhrStZxlfr99P+8u35DkRf3HSakrRcFPFsHVY1yA9wrPxQwtIPQn11YtqNa4VWIfpjn
         bRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791375591; x=1791980391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJgd37GAAGOynCuOtDFQNEeNDITfTTm77Q1swyZehk0=;
        b=iXvmOTtY5F1MSluQc4fgGOTEupUrgc+im5LWYmH9vVAVucVIXrBIIz77SyQuqUY4V/
         FOa4Lol2til1/bahRpJSJRPHQrFVpLhucgJE8rRY8iE+WDwfR7jebPFvRvoLFo8ua8Z/
         3HWQ/9y+gbB8pV2WeevN1ZpUDJS6OlrTJOKEzqZJivf1DOQP8jWwZ2ULvshM/T/B7mBc
         soD5gqMFAuBvRYi8oX4ZUYLM1g6nvez5RT747H8ewrkNmXn9jpDQ1OtMsr0tD/LGaRMR
         Up6+i3nn262TAMkLsJdRHAtlQl1p0ijF8fiS2DXd4+Rbm+JomtiqlED6IS5XEDsEmfdN
         qIWg==
X-Forwarded-Encrypted: i=1; AKwUvBynnwQS5i9rYvkPdyiTRR/7h41U1EKgoPGW6gtVhMghfC2+M1JrEcBoGIy8MSo298tVCOkqtUbV7Xz3ug==@lists.infradead.org
X-Gm-Message-State: AFq9FYJOnzP/ZEpSJDde5TLT6ZekfyW6O4l7hsC6/QscXRQPx0pbiMa/
	z2pBh5nDTLa6+aih2RHjzmmBmlBF8VqflO5IDtthmFZFqe4C9HfAM14n
X-Gm-Gg: AYBFou1EC1vI0LLb+uOxI/s/DgbnjRzOA9Dl7KCI4e+e5WXaY/3Sua4ETnHsM8TcOCt
	OMdt8/VmJMOAcPoO2U4FLbIphD+uGVcfgqVsMZPWWcoRzJKYiRH3jNUXvTiAOhJszjIf1gBmglk
	+BxL79ad2ZU4GYFY9YY+6Rr1oR5+61iG0D6VGOWuiVjm1tFOTGruCSwtwn0+j8+5PkGl25pPj1g
	dD4AZOr29F0TbfsL2JkeVqX0f5k8XcPjgjNUfh0QINwckUKDJfLG3iLZT74Yoxzif6iJYYRtdSx
	3lu0Y3GxSZuTQL1l8gjnHl6wIGpRQ8aZngWI0XEiFAGoX8kWhxlEqmHQyf7KlINnI1JZig1dx5Q
	KFGtjbTGLeTZtHMUXkEK3VQ4X7Io7RHm4BFSJfw63TF3q618VPLYJALWY/oFYOi78l5bIkgAiTa
	O18HSfzYCbLWFrTCekF4Q6fYw5B6TCQfJGZl5yPq/xVH7JoCf6L9f5Jw==
X-Received: by 2002:a17:90b:3c85:b0:3a0:f4ee:d2b2 with SMTP id 98e67ed59e1d1-3a8a13e6bd1mr1312260a91.32.1791375591372;
        Wed, 07 Oct 2026 05:19:51 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::8534])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89d5e19c1sm1888589a91.0.2026.10.07.05.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:19:50 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Felix Gu <ustc.gu@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH v2] soc: mpfs: use kref cleanup on probe failure
Date: Wed,  7 Oct 2026 20:17:43 +0800
Message-ID: <20261007121743.192486-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_051952_620965_B8C92DB0 
X-CRM114-Status: GOOD (  12.20  )
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

After kref_init(), the device_get_match_data() failure path frees the
mailbox channel and sys_controller directly, bypassing the matching
kref_put() for the initial reference.

Use mpfs_sys_controller_put() on this path so that the initial
reference established by kref_init() is released through the existing
kref release callback.

Rename the error label to reflect that cleanup is now performed
through the kref helper.

This issue was found by manual code inspection.

Fixes: 75ef23397558 ("soc: microchip: mpfs-sys-controller: fix resource leak on probe error")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Add the missing Signed-off-by tag.
  - Rename out_free_channel to out_put as suggested by Felix.

 drivers/soc/microchip/mpfs-sys-controller.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 0400a01b2338..ef27e1083f0f 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -159,7 +159,7 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 	of_data = (struct mpfs_syscon_config *) device_get_match_data(dev);
 	if (!of_data) {
 		ret = dev_err_probe(dev, -EINVAL, "Error getting match data\n");
-		goto out_free_channel;
+		goto out_put;
 	}
 
 	for (i = 0; i < of_data->nb_subdevs; i++) {
@@ -173,8 +173,9 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 
 	return 0;
 
-out_free_channel:
-	mbox_free_channel(sys_controller->chan);
+out_put:
+	mpfs_sys_controller_put(sys_controller);
+	return ret;
 out_free:
 	kfree(sys_controller);
 	return ret;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
