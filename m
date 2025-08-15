Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C73CA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 06:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTrb1KqFCfgr5Y8k36+uRMdJfrx6YN63SYqLgIk0k/k=; b=lDdl9rfpCKkuqB
	gDIPudjiTcVJfnZytS8tkGkyztvr8uW2Ka5sL25K7BGfuMjvRzsuqrNjRP14hvz8GrGi909RpcvPh
	xe1UUM+SshH7R50FGgsiR+H7pKYzxdUs1PSmBDPIJD44/wlq/1kExrOvyMmcsMOC3FP+oqM4oB2i9
	+oJpb20ta7IqiZ95u2ZCDLOQYCHn3iI1SiqXwq8OLnFSb1HLCgyOabbL2kZ4vpFzPv3bXcEU/T4mZ
	TcTXI7OwqfxJg4ejyCGujMjJVKPqMLc55XHtngi9Ld/q010pU/5g3Qzo7PoZVz7fYRzBVH/RKPCpL
	RpREVlNADzQwGGRsqyOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umnyY-00000001ccF-46zA;
	Fri, 15 Aug 2025 06:31:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummpo-00000001Ven-2lvB
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 Aug 2025 05:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gc4I4GnyT4tSPzGGnUSG7Sj2q1K77d2MqUPufhFRRW0=; b=rSqIws4xm9AgsKn7U++ceXZmDo
	soLYa1lf7jmZzUR8DrtnTZOVWdkNKcDfqFpUC9SmD+IskLd2lFbfZ5p60kHtQEwq+gOV9eF8mbRKQ
	0m5BN7HS62o3pqeEwRTjaElXw8W8n91W9jQvorXgAA4f01tJd0ER6sF84eb8AzoQ0RtIhQUOUdSzU
	xGlfhIRos12zKp9GXL+C5IGxMCyYYJ2sht3vgIFfeAYy0KPBkda1fS9NX8+Z9U5NZQGtRw8oI5Br/
	oVS9gNMCVqdciV/6ydLdfjKZoU8zfHARzY3R+vsdQ1GJkcCr7RY2NymjrgJZp3jbh2GU3iolALgJS
	glEhXefA==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummpk-0000000GcON-3pdT
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 05:18:35 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2430c5b1b32so19296655ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 22:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755235110; x=1755839910; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gc4I4GnyT4tSPzGGnUSG7Sj2q1K77d2MqUPufhFRRW0=;
        b=twXaseQ4E+bAtFG2iaE8lRXA+Ud6vTBki8hQU0mcZvqdwAQE7aK+k25+H/EuW+2vie
         HngR+uyZBTmwUGRzHuJ3ix7FhUKVSpTZF/hMXqFDz1xSdUGHhwe77UFPGn0jhrZ5ut4U
         oSdzSgDMdAaLuQS2tK5C1QXMjTvRWe/TG9PPE92pBRiK/n6vyQrptr00CSSxDlnnWkeF
         7icYnufzyKTUY2eMR0F0vHkkR06xlVZiE1y2CKPfvkfIq3CPn7g3Isxo23CkLfgzPMah
         eUwrobHdyqvU+0tEy+ibRMYHibr/q5PIO1Z0ILx76tMnEbjlA5oHUcsCb/ja9tH0XzYG
         twQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755235110; x=1755839910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gc4I4GnyT4tSPzGGnUSG7Sj2q1K77d2MqUPufhFRRW0=;
        b=vLPPhquKwyzIYn9HKCpyP/TxRJVvQHgarMBGjZVrCKrYdF/rU3ncIn64H0UHnAbQhq
         G1veQOhhHiFA9UVC1vjbEWMTMKtC0yQ1ORMWs6H1+fEY0k3LYp0F+FwzM6zkXFKmafsY
         h/aY/6dSXlt6QAD3SwGolVVZlO2Fzgiw8k/V9bYc7X4/u42cdFHBQdxsDPuyZVK/k/Xe
         c/TVM22qTR51ts6k18TKYMWuwhf/2J9nL6Gt8w23q8Gp/Qh0a/sn8iSXDkYw04O2FOW8
         LLAcPKvpP8z+g1Tvd4PWABdIr4B2EoWgUeqCsodailgEcJNFiWIbaoybASHZHaCNeQWf
         l2/A==
X-Forwarded-Encrypted: i=1; AJvYcCXypudOHxMBTRc+QNIL+W4Kak1+99IT7zmbWSk/6aq5UIUTtv1i2z8vqga31U392U53LR1VzAOgbUVHpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwEhSDZbrPylm4018MTjqbCCwfaUTVpH1ct2Hjp/GkgjvEGoIc
	4jSf72Ec/p9pCwjjRMP49miJCekxyXtvLeDAUMiNWkLKa79B9hD0wDAIiuy+3+DdPnk=
X-Gm-Gg: ASbGncuvI1UltFqGK74op5MyZtX6rLaYNdrUj5f1nvyePWjYDSva5BZlkUSBQhSEqTd
	uZgvXOGamMwbu59g0Qp7N0w3gVKif3mD25K+Z2wReIWB3/GR9ZCvbx1P1YKYd7d9AOef6iDqnUF
	RZR9zerOTIbFubQfFRTJP7ACxcaIv0Ivn6BCmfs9/u2WbQ2B0QAdhfmXEmTwh2YwPL/S9SC6Xdi
	j59odHNKc1bdtVRLmG/6y3+PcCaOyQFc2IgUOckbawkYTiNT9/tjB0CGn1OdOvpDOmw0BpHOE5I
	HaNdAo+PtA5vt8ME0vrhlgKeMNNuFnTufenxlx4emf/bNNlEpzsMm4ReDphJQtIFbkhBZKd6Hns
	xNJQoFHTs81MDg13R8Qy7iQ==
X-Google-Smtp-Source: AGHT+IGivtfLCH94EwiqNLknns+DxOUwFc2vsl21qa22pKrZqAF+FtlV7AV9pspZ7Xlow2+nX+AUYw==
X-Received: by 2002:a17:903:245:b0:240:3dfd:99a2 with SMTP id d9443c01a7336-244594e0c77mr83625715ad.10.1755235110149;
        Thu, 14 Aug 2025 22:18:30 -0700 (PDT)
Received: from [127.0.1.1] ([103.88.46.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323439978a4sm373212a91.10.2025.08.14.22.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:18:29 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 13:16:30 +0800
Subject: [PATCH v4 8/8] riscv: defconfig: Enable MMP_PDMA support for
 SpacemiT K1 SoC
MIME-Version: 1.0
Message-Id: <20250815-working_dma_0701_v2-v4-8-62145ab6ea30@riscstar.com>
References: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
In-Reply-To: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_061833_186383_ADE4F38F 
X-CRM114-Status: UNSURE (   8.17  )
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

Enable CONFIG_MMP_PDMA in the riscv defconfig for SpacemiT K1 SoC boards.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: No change.
v2: Rebased. Part of the modification in v1 is now in this patch:
     - "riscv: defconfig: run savedefconfig to reorder it"
        , which has been merged into riscv/linux.git (for-next)
     - Link: https://git.kernel.org/riscv/c/d958097bdf88
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index f25394d088d0d3cbee41fa9fb553c71e495036fd..b9ef2da15fb22f08bdb5ee5d1bba9f6eed49ff97 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -241,6 +241,7 @@ CONFIG_RTC_DRV_SUN6I=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
+CONFIG_MMP_PDMA=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
