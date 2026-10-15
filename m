Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7E9CCA466
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 18:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8YW5d4Nls/i8y07KVHM08RoLeNVaHpjOJBGSDdsfArQ=; b=XnlXwoBy8RQTlK
	lnRom/uE/eYCCLJ1nBZgboICZk61ORAPllFbM/yLhKWxv2C0oWE+VjJSH2GzT3dcRXr8EMHYcK4Bg
	F/nLHUK9Cnvn1vL3PAhdJOGZm/0jirp2NvOhb2AKBb5Unr/deRBAf2mWrYDy5HIgjd2hO5mueZwq1
	KntcCILvxVa85Nz2bqA5pgFWu24cM+46uBlG8/ijixv3W3bB7PsCRQmTwiHnyq0BpEpaUwvn2eMmK
	i1Rf/LJBEZWDhcuQgpkvioGVK4H5FNrwrikn+8jl+JpzjpZyPhgcA2yN8RJemPiPNN56fgXbaIjgd
	XmTfyrVa255TePaptkig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQd0-00000001DTr-1ijp;
	Thu, 15 Oct 2026 18:56:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQcx-00000001DT9-1Qjw
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 18:56:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49d05d51553so16378975e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 11:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792090589; x=1792695389; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WFz+OPWq9luKuBDqe0uuJVjFv3DbmqRC69UJmoS/3w4=;
        b=jTcBG53Ob0YEdt27bZraY+EDsJO7wL+/VhAAdoLHgiu6x/6Y1HY5eA7ZdYe31JzMd1
         sop6oI2XNA4/kpG4uUzRLDiUEmo09nQm/LfVQ7t6xTD1nUTwqWTQCnvqoIkwBjsat2AY
         kQpg54DxFgUrQKiXy3kfCJqinS5laYflPpeidoHCZu2hn5UjI24PsPG9Evw3alNHJjvn
         xSonu9gAjDsrLwBoli+x7/Ko6p3SRCnmSb0OEmEjMrNvASfvDGRRHHKtQ1UkuxC0697H
         Oo3fizK7E+WWQFuXv2VXYzQROSRfkjCwh+FMKiMorKz+tA452T0MCwku3KBoeliHcX4A
         5ioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792090589; x=1792695389;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WFz+OPWq9luKuBDqe0uuJVjFv3DbmqRC69UJmoS/3w4=;
        b=dVMSd9UC4kvfM9Y8apJEkj1geefwkSOJqvX5+rOYzcQ+K5+LPmoTadHncoz4cl/iKf
         sbvFzuXo+xv1WjqerfWO2Y6xbyw1MN4Om9J6HRlXGuWuRQ0kzkeECgAPgECN55JW9kQh
         YhNYo4Vi5NR1RAf8dXaG1wy9/vbM+B20MwDZqQ1bZG/nVPp8UMsdWSK4nRjWePTzdifg
         fgJMK9gLCOcvGCmsPtgJd3xp+7Art6rNpCy5ymdRnX9qhJPlKxiZWTluVl0HrzEQYWLn
         UYz9/w7NYC1Lf2m040DZvMo24Zs58WepDbdAcn3jFdICvoaBjuAT5Gvu2L3ACMMcJSg4
         FRUw==
X-Forwarded-Encrypted: i=1; AKwUvBzdfR/8eYpX8HGw5yr0IiI26iniArg7JHsog80jr7co0YRZ+stVKhC5JUzfWcND9Kk5YZc0I2eEFnRiAQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLUv4+yZiFY2U4i7n0+/Da/Q7xZ0pKi4Y7BF9q+9jtHYSfcMboA
	dlPtQFDciiSRSFqr6m58gTWnSNsXRmJ7T9UzJBJc82bP1DyJ6Gv02s3+Z7gWJQ==
X-Gm-Gg: AYBFou2gWWX4BtFVSiXhUNispoCgJsCZyJ1ir7AoSpWiQ6bg+5FyV2aJFxrkGG4XZYs
	3/ybDSnJ9zkEkR/snDzABoXnMcCUNQkOTAVWYjfCaZC4X56Va1CaYe501vYuafeTBxrpv5FyysG
	EwKDhFigvgw18mGIvEIUpJTdUkDxvO+eRqqnF5diimpDFCd40ESOvNwMt0lmbJI4GTYvbUy/mwz
	TGMrlzqFHpxA93t0kQVkAOaVqHn0Ae5KHpDDJpXbHpuH/3vxnXd8OB5pjs6TQsJp+3pPH6/QVfl
	8422IpS6SmM4iYKgELi0Ta922yRdcXHUCz0vUs9rcz9x4ZL+z4P/Hj9Jubx1App+Dm6bWomqvvT
	pqdMe/SCJikkoflmk4M9E+HP5l75ViofhEXvwwqSWE+gj3P6WPf03TrPlCkSLL54E5xL1aYmFKE
	duoA1na4xsNI73O2Mx1W76vRsxj3e1O3uoDHNFPt2rowPnMu15hJCg4H5cmcpI4UdDOe7uNfigC
	v0pIJTc71gjeU6f44hW1vQQYl68iyzXIHn+78r3DA==
X-Received: by 2002:a05:600c:3144:b0:4a0:2423:946 with SMTP id 5b1f17b1804b1-4a18e48d362mr400641705e9.15.1792090589045;
        Thu, 15 Oct 2026 11:56:29 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm106148295e9.11.2026.10.15.11.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:56:28 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH RFC 0/2] riscv: dts: spacemit: Enable PowerVR GPU on
 OrangePi RV2
Date: Thu, 15 Oct 2026 20:56:04 +0200
Message-Id: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Nj3fwikGhBpm56QamugVGKhbFlipmpgVmaElBLQVFqWmYF2LhopSA
 3Z6XY2loAe3MpI2MAAAA=
X-Change-ID: 20260413-orangepi-gpu-02d839d6506f
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_115631_437115_69A1F06D 
X-CRM114-Status: UNSURE (   7.78  )
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

Enable the Imagination PowerVR Rogue GPU (BXE-2-32) on the SpacemiT K1
SoC for the OrangePi RV2 board.

This series depends on:
- Yixun Lan's power domain series [1], which provides the genpd-based
  GPU power domain driver required for proper power sequencing.
- Baihui Liang's dt-bindings patch [2], which adds the spacemit,k1-gpu
  compatible string to the img,powervr-rogue binding.

The GPU firmware is not yet available upstream. A copy can be found
at [3].

With this series applied on top of [1] and [2], the full GPU bring-up
path works end-to-end on hardware:
- Power domain: GPU power island on/off via APMU
- Clock: GPU clock enabled/gated through CCU
- Reset: GPU reset line deasserted
- Firmware: PowerVR RISC-V firmware loads and signals ready
- DMA: dma-ranges correctly maps CPU-to-GPU physical addresses
- DRM: kernel exposes /dev/dri/card0 and /dev/dri/renderD128
- IRQ: GPU interrupt registered, firmware watchdog running

Userspace rendering requires Mesa's PowerVR Vulkan driver
(imagination-experimental).

[1] https://lore.kernel.org/linux-riscv/20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org/
[2] https://lore.kernel.org/linux-riscv/20261015-spacemit-gpu-binding-v1-1-a7a23c7e7788@linux.spacemit.com/
[2] https://gitlab.freedesktop.org/imagination/linux-firmware/-/blob/powervr/powervr/rogue_36.29.52.182_v1.fw

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
Iker Pedrosa (2):
      riscv: dts: spacemit: k1: add PowerVR GPU device node
      riscv: dts: spacemit: k1-orangepi-rv2: enable GPU

 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts |  4 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi             | 12 ++++++++++++
 2 files changed, 16 insertions(+)
---
base-commit: 7e986b457d43edf8dd3eb3f6c34e55e92cd545f3
change-id: 20260413-orangepi-gpu-02d839d6506f

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
