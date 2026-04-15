Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2FEF419B9
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 18:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YAv1QravGeIE/T2tooN4LI34WhinrGwAAJIIsA/9dlc=; b=sCGrDwoZHkg6Ao
	0imZPe0aJ3t2+JG7hIUsk8pfaJHzA0ejdjHdSp3Uci1g58m82HoUitMVN9qGZURtVQfYYOaho+LZs
	bwATe7w4HVpCM8yQ8MkNb7x6Ttob6OmKC/1Ma8kwk1Tgo3KAluyuWAg+v1Nx3JlUHjJ+QPWasQ9mr
	8iOVXOgVQRcfb9r5lkGcJ6RzuIIBTOkr9poXPU86TSTH6DJT7j2juOu2Y8IudovmkrKTBfRxKzjkk
	SuJA8L4yQYI2FkxOh9U8mEQLvkS+gxbGz5uyMvvdiwaqW5A4zIarhtxAokJjvU7TJjthfWFVDakCH
	mUOCVsIOaVNWfmL5GDRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD4nE-00000001UqD-1Som;
	Wed, 15 Apr 2026 18:16:52 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD4nB-00000001Upr-3lpp
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 18:16:51 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82f1dcd5886so3033852b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Apr 2026 11:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776277009; x=1776881809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UkSMnGatsFIe6PvZFudhYv/NcAOEkU0FsMM0HKaHQTQ=;
        b=p+i4tvzN0TSgvth3w9oy4evp/FJyTO3RodvX2+mBIAAnw3DqcLV/RRFdWK++lNKCXk
         sVHwkmAmGg8wYnzVlhjDQ4Jh7W62rVmnhgtcBz1a4x7/w7d9D5NyGgm63Rp+4luy3EAF
         oFQSNLgXIzrBEM7fDWQrIIHaS3JLnbEUZklnl/0NTnc3JmHHR6HqJVnk/6dgDX+0HsPe
         e0n0flGwAP0HFUNLhOdPdtXCT1cshLPtScwCSStA1XEeznHVazIbMQ1J98KKtuAzhg9Z
         2l0Bnh3WDdZ84fbn+Vw+UVXXoM41BEx23kgsB2SymBWEhjWTutvyuoFilHEKo8Ffmu9D
         mITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776277009; x=1776881809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkSMnGatsFIe6PvZFudhYv/NcAOEkU0FsMM0HKaHQTQ=;
        b=ZFIdj48DHSDqu0EvOr9avYesmKtBNmQHa9Blc1Jf2ymhFbq/zBxJYikDzmPp6oWQ98
         iaDr9ijFzXsNXn3f8T/+zxDhcgk/6wn6CsLHxf2CXJC6/qejifVIX/8V4DnaHo6LBRXm
         q2QxW+5+Or3M9K/pxLoCKxv9ifMP+ftMKDTZtX7gMPY0K25kpbtOd2Vz7EHXEZMkd/Tq
         GXW/p7qdwE1z8Gop7iwAJX+UU6eZRAEAb5BuT8deNH4A1itKSrQwe7hi7d1HVpDEcxiJ
         VlvGOkyjpMUmKMWcOnvGlBQmzttZa5EgHmV6aA4E7kI03YiMqR8tPhMQMwDKhMbJ1I8X
         VutQ==
X-Forwarded-Encrypted: i=1; AFNElJ+d6sAwvC2TyVMH7Z3q4qvS57QmrjxgRc7n7Lon9gwwjN0dT9f/RrMLKNVd2WvAREgi31NXJ/siq5n7mw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjSCnwWZ2/gPIMittle0OSshnDdcleDZUP1z9ycHryRbPrDcDw
	k55ILaG4JCQbyz2IVaNV4bb04DFIe5QIKIPfyJ5L4Rikd2y/ByOI6odG
X-Gm-Gg: AeBDiety1L0HKmvZNzdKru160RKTkP93Jggj+MKVFQgaGF4AtDfBi9cpBZgFPnFLN7V
	3gZbW/JfB8+rxUarN6G+LHKAFXZpriSswkDi7GuAqEJP+lizRnXomSmMQFc1cPPc0VKoBJIJE6i
	DVpDj/yEqXxwzoHt60D0wa43cfv+LOU3YviseHRamapbwk0dL9O/YOR3VeFD5CkvtTDsb8ElfwN
	VahtjdCKzW9NrEUA9wQwLy6lyBicy5BOWKhLjgOCoNUo1unwvuDVsSsC5mn/G6o0VglIbVfq7h+
	Kv07orMv/WkE5Qocz59bgTCGITs3KrIvYSf6OEP+o0EM6jT19gqB8te3bSOG5Q6EpCshlEJOVTd
	E2QkCbZY7kuYDqMDwCWyu96s4j/6Wnpi4B5B+Z3BJlIauKke7+hAOVBa1QYDQc2E0zVJscmkFnP
	M1MBi1ePHqKXU6Ge3Xa5V++m4vrrstspjzUFQfS240ZkwwTg==
X-Received: by 2002:a05:6a00:2e17:b0:82f:6e9:d1c3 with SMTP id d2e1a72fcca58-82f0c30f5d1mr23365240b3a.29.1776277008784;
        Wed, 15 Apr 2026 11:16:48 -0700 (PDT)
Received: from lgs.. ([2409:893d:1171:10e2:3140:373:572a:dbb0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f6f52d45asm1658333b3a.38.2026.04.15.11.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:16:47 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] soc: microchip: mpfs-sys-controller: fix reference leak on failed device registration
Date: Thu, 16 Apr 2026 02:16:35 +0800
Message-ID: <20260415181635.3699592-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_111649_943987_C848C2DB 
X-CRM114-Status: GOOD (  12.85  )
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

When platform_device_register() fails in mpfs_sys_controller_probe(),
the embedded struct device in subdevs[i] has already been initialized by
device_initialize(), but the failure path only reports the error and
does not drop the device reference for the current platform device:

  mpfs_sys_controller_probe()
    -> platform_device_register(&subdevs[i])
       -> device_initialize(&subdevs[i].dev)
       -> setup_pdev_dma_masks(&subdevs[i])
       -> platform_device_add(&subdevs[i])

This leads to a reference leak when platform_device_register() fails.
Fix this by calling platform_device_put() after reporting the error.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: d0054a470c339 ("soc: add microchip polarfire soc system controller")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 10b2fc39da66..404c31daf459 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -168,8 +168,10 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 
 	for (i = 0; i < ARRAY_SIZE(subdevs); i++) {
 		subdevs[i].dev.parent = dev;
-		if (platform_device_register(&subdevs[i]))
+		if (platform_device_register(&subdevs[i])) {
 			dev_warn(dev, "Error registering sub device %s\n", subdevs[i].name);
+			platform_device_put(&subdevs[i]);
+		}
 	}
 
 	dev_info(&pdev->dev, "Registered MPFS system controller\n");
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
