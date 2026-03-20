Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DBD1099B35
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 19:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1nJc86MlYV3MdWY0cNhS+v48I2igbFm0PBHodAzi6v4=; b=leg18fvTM4waag
	pLHpL7pPjM3g1k+EbbXW8ZQYrxOX40G8x+80gsuPZnl5KC4bQUiscm8AtkTictH0CKLqtIgcd8PF3
	lKlftN7iBWMWBlh9zCICmr3lysJuwA9AriPuTebluluwkQ/DZtmFIT+tpp28dRsSpMHIGW9qtrVmW
	NC+ixO89VCJtDpEaD0xjdBbzgoukwCRHcHYkdlqsnLbx7IDpBeWdtSmkCLGLi8xoYdgK5M3Z8UnSm
	KCloqslqTSoO2K/OE164Q4hxlovvhd4awayLGGPifPHmkCS00FQQ7NrP/vl+pxLZIZQpCvJfYRIos
	DqB1nEvtGz9DppK3524w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fGg-0000000DQVG-3URD;
	Fri, 20 Mar 2026 19:12:22 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fGe-0000000DQUN-46ac
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 19:12:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2b07069e2efso12629735ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Mar 2026 12:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774033940; x=1774638740; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xUIIgLsCX99WQc0DzamnNAGrsGlCiZNosqsgUhoMCCs=;
        b=c2wZC9vllHyKmqCV87+UmzGT5Vk33xEvPXo6oLnEtgoGmLysJKY0+j9QcyGTP2CNwo
         IQMPoZdUU311XON1JKj+H9rxYChDkYKOsHzrEmPF7/i812yMcQ3JOikLI3uW3K7UnVEq
         DAui4c1TzMKTafoLbc5EPim+4Dhs9/uzbp3cO+CqY2Jn1lWxAwJV4MfSBM76j1mA5boo
         PbKSgb+WQoMzP+WlwvuXHxpqTUhwVBgHi6I7Mkf2BEA1rk7I9X/S/k6fUqH6THfDmAOq
         GC+vLw4v5Rm0U2J4SBgkh0IN773ipJiv6q0ltBJ4WuusQZ2Z5Jxxx2/VrABUeh3bVBs1
         qeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774033940; x=1774638740;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUIIgLsCX99WQc0DzamnNAGrsGlCiZNosqsgUhoMCCs=;
        b=PesPIu7sFDilypEm8QaW8H6fYMUg4odbEd8p9f1TnpblKQlvecfUzGDWqX3S9xjTZW
         /taufDqr0IgFybxRVesFeN89Yu1GgYAxlbrXBCAB9V8RcdIGq8VOa4mHoF1AofYY81dV
         j2yqx4/jY7cZnSRGkZsFWRsRs4WR1XEcPh1I3+wSmXAJ3qREWvq4Wgxgg7dfPWg7Y5Gi
         eU5MlZ7AyttifqxkTQuAc0Me6JyXWRlRnyeDLPrjsWX9dsgd0AjymMGgl82ypJ7ZxhWy
         RUVDE7nbnbeDoxmeA+o3gb+b2WLMlvv4yy/PH2r2dmxFti3PNLTsA/0ZfmPmgcumFXMu
         ETYQ==
X-Gm-Message-State: AOJu0YzoNtkDlJmT80YZyV+BPnz8uyW+7agf6Xl6grQKUaLTWVuAdzcq
	rehRm4MPgBgtb5xXIHTc8cO82ETTgq36WO/f8A2eZOlcBBLsZGPSule8
X-Gm-Gg: ATEYQzwMHc3TWKcsPvv7osOE6tK72Rn4ha4GYYvAd5WZseH5YZeb29r3E+YD1+Feg3N
	xEno8gk3ZYGjROFLJEq8mz5NTsHV/xmYOAGkT0LBRpNyKzzQLlPeHq6uKWKgnD3IHZJYEtGCmhv
	a0R6EpG4OECpT7LXs9MKi2UXdMv7Clr3OKUgLSMZGpcMxaahqlOQpuhOD7/ksaiBnzrRsEnFxpy
	Ed2f282hWF+BUETiVz2qED4w2Cv5P1KRVzAasDyjrulazy4gn1Ejjd9MVzf7QKAciQWyfKTV1/q
	KuFcYtjNxYImfpF4gJy+VhFxuVkyAjfFZN7JaJ9d2RV6reHBGX3YLiramEisa4W7Laja9GINPRx
	XI2WC/9YfpSf+eUDEqz02uQbTfOfpaOSM8cW+kaaWUV1X20eWqo0IXDGteKpO9SgC8His2SCbNP
	F/+u6rrqejheB6xH2O1z8e2nOX+ZQAr3WzJgRY
X-Received: by 2002:a17:902:cf06:b0:2ae:7efb:6068 with SMTP id d9443c01a7336-2b0826d6f8fmr37075695ad.7.1774033939936;
        Fri, 20 Mar 2026 12:12:19 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083688ca4sm39599915ad.67.2026.03.20.12.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 12:12:19 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH 0/2] drm/bridge: th1520-dw-hdmi: Two fixes
Date: Sat, 21 Mar 2026 03:12:09 +0800
Message-Id: <20260321-th1520-v1-0-ec877197770d@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAmcvWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyND3ZIMQ1MjA900E2MjM0Nji2TLpDQloOKCotS0zAqwQdGxtbUAiEu
 i51gAAAA=
X-Change-ID: 20260321-th1520-f4326138c9bf
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Icenowy Zheng <uwu@icenowy.me>
Cc: linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774033935; l=465;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=1t/7y9mVrx6E4KfyOJWL4pNY3X3iSbND0yHpmonIxX4=;
 b=UJhpD7PbJUjEzKm0lysNNBWIO0bTNKDAkim1dWlVkVTfKRUk4hRSViEiSMgKYaEcRzZfb3zIn
 UjNGG/d3mw+DFYvYr4agLP3RdKYyLLF81DwUqB9zBUEhn1BHIXYHqGj
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_121221_025667_5E0F61F4 
X-CRM114-Status: UNSURE (   5.73  )
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

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Felix Gu (2):
      drm/bridge: th1520-dw-hdmi: Fix error check on dw_hdmi_probe() return value
      drm/bridge: th1520-dw-hdmi: Fix remove() callback

 drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
---
base-commit: b5d083a3ed1e2798396d5e491432e887da8d4a06
change-id: 20260321-th1520-f4326138c9bf

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
