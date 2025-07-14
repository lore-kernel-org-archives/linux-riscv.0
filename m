Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F21C83F2A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 09:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1akGeyxqGJu3XVu0mtkZsQzATU09b3t7Yknu/IMtfA=; b=br3VU3XK9o7wCN
	tRHnshf1YRbr4fNYtdlKwWYBpTYtEyA4iGuWFfOV6iFnv0QY3qu4o0Xhf5rdUnlEF4zAO56aEd95T
	JeXWu9BxB7QSuxGh7XQyxZgj+ymdTjRwL/cr2KJ5n7wRwOroslhmzT472MgVJufmC2Y/3oOw1zIfq
	hErzJtL270f+m41UJJUgBfUyP/I//wOaJmBtFPjoBIdn0skZF/DsZcgMYOYXDSLjKHiCMyCgkuDyD
	dvzEiRpazAM9GHwvlrbeYjSCehAe/6cxg5nMJSPagvgXkq4omQ6b13v+9JaZn5/zq5MOd70OJ+7m1
	n7eG7F9Oo+bOMe82ynaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFyP-00000001rVd-0ayh;
	Mon, 14 Jul 2025 09:59:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFgB-00000001oHm-3G2Z
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 09:41:01 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45348bff79fso49043075e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Jul 2025 02:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752486058; x=1753090858; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBgGdTksVfeSjCf4/icT/1ch7Jc0HArkGcJLo9ytMP4=;
        b=pQ954ARFf9KH4ptx7dE0EkNQLqtNJL6KIHLOfuUWXbbtmX+8MRMiU/KuBHZ6FcQTvo
         mvXlxeM1rhoiVTPoukjbyXflg7QXGqa3q5GQZ/WBBBzzTihxmttIgGa8as4nfGkrsveq
         4RGdbUNiDuLFkxyT+F2wIOWeKFMC/MeL8CuCJeMrCkS21540F7xw5vCdAU+MbxGMvnOm
         i3Zi0E0u4P9jWk2eSEc2O4qN83WaFQQLsBH8GG2NJU4lCEdNYbzYcKnlCYginRCF3nDR
         uk07k5fyVGbXoSAy+PfCJ2m5FAqiyyNia1jatVCOPf3PlZJN322nbPSOGE58O61ahgXL
         kmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486058; x=1753090858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBgGdTksVfeSjCf4/icT/1ch7Jc0HArkGcJLo9ytMP4=;
        b=vY58JfmqP4rBFyRwTaS0EuO7z8IqsGxupJBym0sHj86XnMEfzpqGjYV0hs8vnb+84/
         pBt4Xkm4rE+uUs3LSZFezPo3IwZickSx0JLPnJ2XSs97kz04A76EkvbTRmXpQyFcvls+
         q/frJdrD/h45PIp3PuWSqZWUAbLTJKCGH/pCXy3Xkpt4yXOYo3VI2PVfST/J80FZ/tmG
         iGE4BlHCH1gWEwYes8iQw5E9epqYZ54HGRJBaDXSYBgX3uxDb6SGDG1lWpBVHZ1pxaFM
         50PavlLw1hVUiqDtalnfxG/SUfE+et8EvaVYIPyg+YXfbqMjsicQreUgCLS5jFFlUriw
         bBJA==
X-Forwarded-Encrypted: i=1; AJvYcCViGnSbL5zlrlkHPCL34tF9izhjhNuIp0TARrcd4go6Q0JYg404blWU2lVSBO656YSVwdzRs9jwoAaEcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRNyq5zPCnJMz+hRLoe9j7ktce3Uh4nN6EbBJbRRXW0igTrUG8
	eO5vQIi1q08qkjwikVw4h3rWCggqOa7X1qevIGAFiwVjfasqKHYfu0euAoCekyV0Hr0=
X-Gm-Gg: ASbGncsL+2SvvoZp+wLyddKODsnyLHeZ5EuY7+IGDtbm8zsvY77v3owEebbgkbsVuiN
	iMfcP/86CQ1b39QeF4I/bn5GevN+PUjyyMtxtH2rC7voyhXYk++7Hr7i054DpoAZK4GyKsTOCAK
	izUuWLG5Lx8VfL3BVf/jaLuioAubCFY6L3P8EWWDhxwC2F/02XtQrwVyZcRSxtLOchWRsa2vBwp
	gHBdGjfU4d+0G0M8+VTDYT/hCOkxjVkRis+RqcVJjd6yJCvt0wxV4YFpqdDch28yX+bLqd6nfCn
	K1bw1wQnHLvt4eSloM3MAPz16H3GyvSMFZ2hBy7/jjGuvEekIt8LySjjm2/XiQjj/2qv8U3G0Q=
	=
X-Google-Smtp-Source: AGHT+IFZBd9BqIW4mTa6M2LIKLJ6VdBKVXcqNR4ZLAhmo9BpW6Qpf38x6Z4W0deTyL9Fnv8RWBe2kw==
X-Received: by 2002:a05:600c:5024:b0:456:1611:cea5 with SMTP id 5b1f17b1804b1-4561611d3d6mr36347635e9.18.1752486058120;
        Mon, 14 Jul 2025 02:40:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:0:1:2::3035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b25a948sm24989035e9.35.2025.07.14.02.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:40:57 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 14 Jul 2025 17:39:35 +0800
Subject: [PATCH v3 8/8] riscv: defconfig: Enable MMP_PDMA support for
 SpacemiT K1 SoC
MIME-Version: 1.0
Message-Id: <20250714-working_dma_0701_v2-v3-8-8b0f5cd71595@riscstar.com>
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
In-Reply-To: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_024059_816760_D38C2402 
X-CRM114-Status: UNSURE (   8.66  )
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
v3: No change.
v2: Rebased. Part of the modification in v1 is now in this patch:
     - "riscv: defconfig: run savedefconfig to reorder it"
        , which has been merged into riscv/linux.git (for-next)
     - Link: https://git.kernel.org/riscv/c/d958097bdf88
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 37c98c0f98ffc0ee9d021e4d07aa37a27d342f7a..b6519fcc91c0bb56f71df336fd3793af3d64fe78 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -240,6 +240,7 @@ CONFIG_RTC_DRV_SUN6I=y
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
