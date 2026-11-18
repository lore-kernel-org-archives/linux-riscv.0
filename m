Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D1A606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DlcA1vWj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFAZBz4p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QhvobYpDdJtctqiNdCc/1rQ3F3+hC2EOVnfsJZlwuOw=; b=DlcA1vWjLi9JbIdxfwTbQfG5jX
	/1EqSkV6QTr5uaLvVx2vSnnwNvRGdo0/6ovVzby4Gve1r/n5uqZ7hW+F9vDFYhzSXNfRVkxbeCE21
	YSqNDcfE0FW3+CkoI8aNB1HM7h/t8ax8+Fx8LUANClIa9bL7OuOwrgMVvsa+w+kFJvywLJw/sidcq
	bFFE9FqEfEk0834f+VmYwfgzq81Q2RQZ8B66Wy5HofA3RldMi1wwaQAQWCRuWiLM4FJLZFl17RAjD
	YCLhlOGQphUDZY+dHRkleszZjBxLUPuktVOWVyzGD4QyhRSE05tP8mgRwWuUUcNPlB6HrQIlr5vGK
	2//7XqrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTksl-0000000A38q-1hen;
	Wed, 18 Nov 2026 18:59:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTksi-0000000A37I-2e33
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:59:46 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso20960645e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795028382; x=1795633182; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BZqKXVZqiOGdZEu0WGQ7on18pEUQ1o2hqL4+MiKX9BY=;
        b=cFAZBz4pYYMye00qkzWKjgINeezacXCCWdAPFMZE94xtLdzNjpjSh9TMbecCjWxNDn
         2o7KGAblkr9mc4WMU06HOKcC93/1oc/fwE13bS7kWqXwkXHZbFsVRdED/wt5SvuaAaEX
         7gi5QrDhFsMn0bsEsfk1fX8IloMM3qemUzMi4ji6Nb8FCANWE3vQieIyqAquXRiolTb/
         iAV3wA2AWaqPSWm29M71hpjUsVJOsxf0fRJV0QNBPDn4PziHczJj5Qvp26LArDwykYfp
         3tx3OCvSCeybTqUFaEXxZ5P3VN8nHDJUjTJ6K7bTnSl7mP5N0ArNQDlLp5yYiIJJKIfq
         pUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795028382; x=1795633182;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BZqKXVZqiOGdZEu0WGQ7on18pEUQ1o2hqL4+MiKX9BY=;
        b=i9q1b0m5B5agJQmvTJTobsU4vU0DACbeusSvePE4XP2rpiiKoUX0JgOll2IaLZAAB4
         XSxxZy+jegZyp4ZX09YkI6VftatBwht9kPbWku2aUhpgCTHwmBS0fX0awPkBLXgHMQj6
         1DWWn+9I11GQcVHv7uYDhSkDHoBW/1FVenjLpGpapVGqwhiLNnSRlnKH0E23LAwEDgUQ
         unuMZ9ZsGACcXrq43jZW0nCUNdcgsCEehVWZFSPUq0bFNkHI1laY/Ijl2lV9rX2pTrcR
         4Nsffa+HQjdudEDPZ8O4Vg+YVI9agE1v24HaefLBKYgV86PWdgKBExKmL/H03mP2ceV2
         z8Tg==
X-Forwarded-Encrypted: i=1; AL+hErEJlRucNK/9iOTkzZ4SZmjOWF6iOO6cClIWKpO+RwRdMP9uSqyLZofDdku+lkHNjVN9Xj7k/Lj7s7TQhg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9/4IzxO5x5L+q+0UqvkFvXHl6Wc97c+b4EIgyRK1T9fXgkCRDj
	W8pLUCLyV/1RBUTbGZNrRBIqBfCuHz+p44X9QyALAB8zyC8TlSJarN+7
X-Gm-Gg: AYBFou01QJR5rZGElez9duHJqoBh0CQiqHlQezRNYAj1tHh46jdrwjNeL5ai1Mg1MkE
	mgwCwZD205kuoCeJJNkYYQpWP/fa28NBTSZXc2TGr+FXYfvA405ximNp+/kYBTiLcE9EhADBYbN
	pmae2roRmc+DiPPeI2jy3VpMWclr85s7hg43sJSh6A63B00An7Ml8eEyhrAT2dTrHiiL+ptkOaJ
	Lvu6bOudRJeHsqVKVf/LYBZvwGbWkw9mbafqn0AkXP7Jo3W883CM6re5vhnxyyYzQvuA2y1+xVL
	kvOQBDV67DVC9r4u68Ea/Aq8/sr8lG5hWhmp5+KIRUNzryVTZqZDJv+xrAxrHNU26Fj+NF73YHt
	Lfgc3TzGlzXV4qF05KJg8kGk/UZcgUgDYPhSoJ95uZ0zwuAUEYTFEYgTl18dAMwR1ZedsTjWjmK
	uFVPT5yXuIy888T1CZ0ojrtpQCIljstjkfqnhimuHzKBRH9hPyigt7xZBoxondlLBk6NmOaYV/f
	d2/wfVBuOSLHpv+qcQHgDxv2rAw5KNbYeI1ZhfqdaNCt6pBYOPM4ilC4Ud/QlgZWkMzaH0lvxJH
	CSGPygOcY5U3N57Bkc2pSbSqx6XeLC/7SGkrUGSiuBCpQHRF/8gY9cZlqWYmWTNYznR1Wtg=
X-Received: by 2002:a05:600c:46c7:b0:4bb:76f6:d23a with SMTP id 5b1f17b1804b1-4bb7da45409mr75914615e9.21.1795028381836;
        Wed, 18 Nov 2026 10:59:41 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d4e670dsm95966965e9.1.2026.11.18.10.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:59:41 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 18 Nov 2026 19:59:01 +0100
Subject: [PATCH v2] riscv: dts: spacemit: k1: add PowerVR GPU device node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WMwQrDIBAFfyXsuZZVq7Q95T9KDhKNWWhi0FZag
 v9e462XBzPwZofkIrkE926H6DIlCmsFcepgnM3qHSNbGQQKjRcuWYiH3Yj57c1Q2Ku8Wa1QT1A
 vW3QTfVruMVSeKb1C/LZ65odtIY5c/YcyZ8hQKq2N5nWx94uh53kMCwyllB/fEJ7+qAAAAA==
X-Change-ID: 20260413-orangepi-gpu-02d839d6506f
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_105944_722565_20EF806A 
X-CRM114-Status: GOOD (  11.80  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add PowerVR Rogue GPU device node for SpacemiT K1 SoC.

The GPU is integrated within the SoC and enabled by default.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
Add PowerVR Rogue GPU (BXE-2-32) device tree node for SpacemiT K1 SoC.

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
[3] https://gitlab.freedesktop.org/imagination/linux-firmware/-/blob/powervr/powervr/rogue_36.29.52.182_v1.fw
---
Changes in v2:
- Removed board-specific enablement (GPU now enabled by default in SoC)
- Simplified commit message as per maintainer feedback
- Dropped redundant status = "disabled" from GPU node
- Link to v1: https://lore.kernel.org/r/20261015-orangepi-gpu-v1-0-03566a615660@gmail.com
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..7f2573d869ca 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/power/spacemit,k1-power.h>
 
 #include "k1-pdma.h"
 
@@ -1119,6 +1120,16 @@ multimedia-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x0 0x80000000 0x1 0x00000000 0x3 0x80000000>;
+
+			gpu: gpu@cac00000 {
+				compatible = "spacemit,k1-gpu", "img,img-bxe-2-32", "img,img-rogue";
+				reg = <0x0 0xcac00000 0x0 0x80000>;
+				interrupts = <75>;
+				clocks = <&syscon_apmu CLK_GPU>;
+				clock-names = "core";
+				resets = <&syscon_apmu RESET_GPU>;
+				power-domains = <&syscon_apmu K1_PMDOMAIN_GPU>;
+			};
 		};
 
 		network-bus {

---
base-commit: be95fa81c04dd67616faaa2872babb9ac39d4251
change-id: 20260413-orangepi-gpu-02d839d6506f

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
