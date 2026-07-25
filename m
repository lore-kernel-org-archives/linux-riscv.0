Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ABBC531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 03:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dOvbLNPw3BLkel1W/KFQ03QrcFjI0QdlGfzMN64pyE=; b=IxAA6urQwffjje
	nfcutmsitcn8X1Oz9bdrRmkaRLC28x5kYLb4M6nGicShVcCrPub8uTmtvvdiWW+sW4QXtqbd3YaLI
	8t+EpYCX7ve51i1v/3eFhbd6jvUCDvKoFcbfytHsieU9Fxt7hpmiWtOwAk8w/Yye6lZ1CBB/HMdNx
	ixjdGqzjCXIZRVrZol4rxVgdL/ObaE2+14sN7QD0tnfJKs2Vi206XuNzdFM+ormVwoKhs49ey6Ewe
	Vw4j4eTmk1Oynedbc0ItJJiRbXaDVQ+GEz0vtwfdn3u0RYoyrCHGPdyGSZqrWTChfiJaFvI2vyQf0
	gaz0Fa/BOtXIsXWD2yZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSvU-0000000HYAS-0b8r;
	Sat, 25 Jul 2026 03:19:48 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnSvR-0000000HY7P-0tgN
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 03:19:46 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-ca7d1dc4554so538840a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 20:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949584; x=1785554384; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPm4vAPFuqHX+tZvYjtk0Fs8fzHRPkuRBc0bjXwe1GI=;
        b=UKICH2nOe+vNF04M2Tjat6YmUVPeh0CeQ9mk64FbKG921YThot9vkXOkB3b8ZInegj
         ziEdildnx4rq2GH0QDo37mEgTJ/VtU0nV3n8md3ckhKXpIYLLqcsC+qTkunatMfHtwWS
         Dqlg6O7JTbKXApYtqMTHi6nibavTZirdcemHrVDcbe/4Lwyqn4NDZ3rQjgYLbEavBF06
         GigOCuimWZUCx1/U4T0YRaFqMXGrj89OnPePkkAzIwh7mtJW50CkSyirYcyf+YN5wo/1
         3CasEnHULbsHGVUnzGNhR2xZbFnr5wPh615K6S5ojc4hAFejp26dFnBgO5kfQn2Oz32d
         Q5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949584; x=1785554384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPm4vAPFuqHX+tZvYjtk0Fs8fzHRPkuRBc0bjXwe1GI=;
        b=IiSXEKMs5mKddUse+lNmsHzj//HoLhWrpIzBQCQZ7zP4wqrXXFPWySgKG/XM6oahTA
         eG36tgONR3zG/4EQAtaMH9mYfP/zw4rwXC5vw0sFq+kyNjqSroY8V8/8Whl0BPdccaQs
         1cGrz802K0e35UE6P/6AlAVnpwWvbuYaJZWk2G460SKp1Hxc96Jtu752blPMMS3yKSG4
         PMnmQF/nURiC/zn+rfKI3lRKqxa2pQbcRjfa+YnMANXGMiH8fpDHL+fRqI+ucDu4nSl7
         hihrEggzUjroeIdAv606tn016lBR2bFDTmn0ziqW1QP2oEe+ncbsDRVehZJnQaKIKxCI
         bLkg==
X-Forwarded-Encrypted: i=1; AHgh+RqDQqhAuJYtqnLvRYS1D2pA0qDAbUdE/0DnP4Bk8i3EaS0UmKoBLNAKoGlaCqAAwizcgiFKenPNU8wWjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGL07SyI8XB0uVy8iWTj6NI8c6neYww0eCLIxO0eOGUwZ3IyO/
	WdH/CfvlNDamqX+GbX/GXVC+Cy2+N8LBrXInNvVjZzxya8RP4xCE+ic4
X-Gm-Gg: AR+sD13hiOBHa++Ahqgh2S/HPiKzE8bNyLfW1zoTIIDjDqoKGiyw0tg4/5dKFab2hiA
	+mQNBWr3TktC0/sxCRXBTnu4PRWKJakg63lIW9v7MqA8QEn1GrzdjKBO+LnjKPvaGpFydSBFBg8
	8vltTnvLsGhPem6dnK2EnKpIaisl3H6i5S5PFn6xxBreoNgfxpCaM6azVv6F5gvxb0o3KE24veV
	/ZMUyfQ6VEuJTgeg3VCKzqHUDOr73u1a67ncVqV0o+nguF98mQXwmtgEjSvtJBGO68xhRmIIGth
	Cky92KvdSo2haAyV5J2iZp+q9cUw3WQkWb2ZDRcm+wfGYHrt26MaG1F617TEax4lWg5kDIeguI8
	k/ssnyMowXZ461WDvAH+4kR6ia9gqvruMb+2T6GImnX0vXwWnaGZVMy0=
X-Received: by 2002:a05:6a00:4c11:b0:847:8b0f:2508 with SMTP id d2e1a72fcca58-84e5942eaecmr647092b3a.13.1784949584567;
        Fri, 24 Jul 2026 20:19:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:19:43 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:49 -0400
Subject: [PATCH 17/17] riscv: defconfig: spacemit: k3: enable display
 driver
MIME-Version: 1.0
Message-Id: <20260724-k3-display-v1-17-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_201945_261880_021E07D5 
X-CRM114-Status: UNSURE (   7.36  )
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

Enable the Saturn DPU and the DP/eDP controller as modules, matching the
other DRM drivers in this defconfig; the DP PHY follows through the
controller's imply.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 74ba5acc12a4..c38853d69d55 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -191,6 +191,8 @@ CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_NOUVEAU=m
+CONFIG_DRM_SPACEMIT=m
+CONFIG_SPACEMIT_INNO_DP=m
 CONFIG_DRM_SUN4I=m
 CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_FB=y

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
