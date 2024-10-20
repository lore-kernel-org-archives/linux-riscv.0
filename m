Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3378DD3C92F
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 12:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6vsZkeq46s4j+xbTOZsWQMwJJ3/0cvMlwXVa6Gtcqc=; b=Ezm7D+9cZnqPkq
	HRurMtbBht0R1gquvk/6IapOo5E3FEQEGXHLawv0tBm8uY87OwPMQ6HN6lgLdAaibzZFb5FRB9zKH
	eNou8GzpX8mX5fToQ5yHAUVHd3KCJWd66W4peO3QvsFg24PqU/Xil+CYT32bm5YygujhN9HlrPOeG
	Ec+qGG8jHFHsdZVUCJWx3/XP3Rs7heICL9XC5bgxW/peoQy1tdiOY3AS+EtLLYhGzRyyDyJyhl8kT
	17+Ve8jVLlsmMatQg2cRFRtBwJgzB3uwCyQhFIfuHHBOQeFLbKyXrIr2oNW7S1w4rwaq91sSvxE6z
	j8TKi7OpC/3dcKWnzRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2Ulv-00000004rBz-30PV;
	Sun, 20 Oct 2024 12:10:59 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2Ulr-00000004rAV-3tSi
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 12:10:57 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-71ec997ad06so21946b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 05:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729426255; x=1730031055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncgmlyGfcrqHCYKyqt0DRpGIqa2UXUmRq5v7oAb7ZpU=;
        b=SZAMHjGeFWAqVDd+GFx6RU8YdeATw6jX0krAfRQzF913vCochjkbWUEOnBsslmUHMA
         7MnFET5F1RHiKxYay8FMTpKGWKsRrK6WaqFcXAgxKVFJMdRejBIZJsPdBH3Ire89AuYQ
         Gkr/vIYHLjtmToJhdf3fm8R6pd1VlBfqxypuSox1hbAwuPw2kwcMfzN8oXPsDcV6TfKg
         MpldBM0OXmCrlyoobjn+5VFkC+Mbkxp9lzK+35KtxdvvPc/D64im0UgUzn1XxCVjnpzm
         qoTyLjybGcK2vxBGo7hqi5uQMlitNYPchx6PNtWDId+RQC+vDZps5iyWhRG/5guu6lCu
         6KqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729426255; x=1730031055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncgmlyGfcrqHCYKyqt0DRpGIqa2UXUmRq5v7oAb7ZpU=;
        b=vGPew9LsJnmMX1wISQ2XizGBG4i4DpW5db0DPwk7WJvemHfeBCx28fTF3mzsh9NWaO
         WD5K6WSDb8Q82EraGLS9/gEyTMunh4iP5RigN1IiL1HfciQZsZnI57FsHursqk6FERDu
         ypv4nFZLBcpBYI+W9eG/lW88ZP/AVb20HpeX+Xfx1JHvD+pJeJK5JjXE85nC4I/B9FsM
         tGyQGObYxYZXtJfaKuEqVZ9LRbx0E5AgggDIyI7aeVu6l62XoLlalE+J/C77cw68ppJv
         /0W26vsYDbl4l4/a0Fs6Brst/nF31dKSjIdebSi8Lflo7Aq6qZ079U4zhAwuRW+SDev3
         +apw==
X-Forwarded-Encrypted: i=1; AJvYcCW33faK5fHivAki1e/bvnkcnomPfi3pZH7x0pVZkxutSVFU6H1fcxudaSgEkgoBvbaf/BKtJxudTrX+6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHpqqhBzLzPvhPecLqJJHe686TV3jrVpfPE+BkVvrXjEKJ6tN/
	hu/INj9PugRx9TmHfB3BmvHFBr8Xgq1extB0D+W2dpop/M/KWMft
X-Google-Smtp-Source: AGHT+IGOJVHWCtfRuQCFLPUyWlsXcCpbQQtP89MiNUYKDIweHzBMKjNtJAWi17UYeCR7wCE0GUH+jw==
X-Received: by 2002:a05:6a00:b52:b0:71e:74e0:e5fb with SMTP id d2e1a72fcca58-71ea3334772mr11429521b3a.23.1729426254891;
        Sun, 20 Oct 2024 05:10:54 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1356780sm1100991b3a.90.2024.10.20.05.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 05:10:54 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/3] riscv: defconfig: Enable T-HEAD C900 ACLINT SSWI drivers
Date: Sun, 20 Oct 2024 20:10:30 +0800
Message-ID: <20241020121030.1012572-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241020121030.1012572-1-inochiama@gmail.com>
References: <20241020121030.1012572-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_051055_988350_B165028D 
X-CRM114-Status: UNSURE (   8.24  )
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

Add support for T-HEAD C900 ACLINT SSWI irqchip.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 2341393cfac1..5b1d6325df85 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -256,6 +256,7 @@ CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
+CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
