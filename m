Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205F5D3CC84
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 23:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cEPCgU8MsW17zJWc+ncpyHAcknq6xaYkFy6bGBnpCoc=; b=gYghWEf3EgDC3r
	LhwxOpLPpQ4y/CT+GLB4pNbNi2SsyMxFVG1B36HAvye0TupwlfrDJoO5EAQ0mS5huy3ima9okfjjU
	KNwfko9v2oSSh4fTRlA1vWR0cOfob3lEZxU7xQrjx7PwSIgP8Nh53d3i7NlB96GFNl3eQt/HuHETU
	QgOOBCwRzUs2qUt2SLVQTqPiMJrU3SZ7oOlvsVV4T4Vh4xWmNNg5Z5mOY+cZBiZFT0ctqQiSypYJw
	ElQ7Ngx/4ygXbsBwoBAvX6WbVilsqjBPWvyBo6rSaZbKrJ3yiSDF/85DO8lisZ0lcsjP8Q6hCVVhv
	b6Yb1r8y2PSFXMyPCLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgA8w-0000000B45U-2rAJ;
	Wed, 14 Jan 2026 23:19:14 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgA8s-0000000B43w-3dqy
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 23:19:13 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a0c20ee83dso2152325ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 15:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768432750; x=1769037550; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vDXoKIsP9kVNdS0qAjm217ovsIR/3ucrGnmc72Ajwto=;
        b=IveV0PXbPR9FPx1zFDT/7J6AMBCNxB2gfcdhmZy9siQPfyr5cKq6MDy29G3FpxMuHE
         KTHt2a8q8Bw/M/1rSrnDr+x3Na+3NrCd0daI/JIKXnckLMeEFwlOaM8fCRnVZ3mFOBhv
         YdUMFGxxVacBH2B26k4YfIX4wnS3xs+Aqh61yKQt0zXjNdnHFBv6wU/7u0va25rDdxJ4
         3wa40lEujCUNwbGp7syGY8uh2n45Ttdleud7yc3tR+HsYwjdGQrClXYFkD3BXPLIcvKb
         1GZzigrAbNDZeaHpMLL4028kEXTYPNGCFfmfAcOV0hgVZKYDPYz2wJCwq14oRHcckJnV
         b4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768432750; x=1769037550;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDXoKIsP9kVNdS0qAjm217ovsIR/3ucrGnmc72Ajwto=;
        b=DB8A4gGOVhAPp62V6E4HO26ayibTBGhcxNVmTpJZuidEG8wV5WsU4Wwtp0irhszPpv
         fRao9DRb5CfiCybrwgq4RAqv5bfq1Mn4cx+RznCIsai/ix9Xm+90HIvdyOYnYR74UaXD
         PpbvyDP6sDDaW6DC7/juvKP8phcc6fDsPnsVZItzuuEHWilGNTajZUdPnO0GJCE+3ibY
         cl3FsTxUnhxqHuRXlmiH6vrlMjBaKZeFm8NSRuUPW5FZeRIWA66h2Xr9wCA6vE90trOw
         B9E8TNvOlCyF5Hnmv+YpFG0NO2ZCTRdeG1QGL306Dw9TGHY90xfksns0LWw0PWFS07F7
         Zw6w==
X-Forwarded-Encrypted: i=1; AJvYcCVHClFZOkxuGTNnXwL0SYGjYhopZr19ylouM3+x3U92bPURPG5SZpqmKQSOHFX9ZpmyvrOr/g2ZbKbM2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyO0831vAwlRvS2uCP8GcL/k7MJ1TUjxTeGkW+g2A84ZeC5IC/S
	oN7TwJE/a3xoycla3y8gfFWsoaBlHMb2fomOXbCBm757ra2hESPhuiXzV3W/Yt2e+xw=
X-Gm-Gg: AY/fxX6tSkpQZtjlz5f9ovyMZoJQX9WHt83ox/+xCniTxMFIEuBkzem/wCbZtumeko0
	PJdLvNSV327n6g0RHAExhdqTPfjfJHoTFogrdYVJ4ESvpf0TtBMmrpwRTyiznWYyNlkD54OOKZq
	bgbJasD1+zRZBV9QyCbDcomphcHWlBnU2CL4Xm9OfTLEXyzxzXF2XMeOXxnrIcetpyv9HS/+hFO
	RI5clFRAzLuDs2gisdeez379bnnCjxbR3NfnxgoIcRAh/selGLgvu2W/boWr44xAApf0CciCzU6
	i1ozfl8I4g6APbe4XU3jcSXwpRgkjJD77bM4l7hl/44VTi3PV9yQyKWB14UtWYlHFlbjsQ4E5Pw
	hask7swyNd2peAG968iiNmZl/37SfsWkkWA8wpnIGm8n/YMRWE6Yh04q6tbMIfevmvXcZmGawtL
	zwZGCXJu2AQOoIxRnqMXgLlwi3z3M8NEeALDoRG4K0mgMIWTr8X94x+g==
X-Received: by 2002:a17:903:230d:b0:2a0:de4f:ca7 with SMTP id d9443c01a7336-2a59bb17305mr35287005ad.1.1768432750017;
        Wed, 14 Jan 2026 15:19:10 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d6csm238591755ad.64.2026.01.14.15.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 15:19:09 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v2 0/4] riscv: dts: Add "b" ISA extension to existing
 devicetrees
Date: Thu, 15 Jan 2026 07:18:56 +0800
Message-Id: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGAkaGkC/3WPTW/CMAxA/0rl8zzlo4W1Qoj/gTiExgFragtxq
 IpQ//tCu8sOOz4rfs95gVBkEmiKF0QaWXjoM5iPAtqr6y+E7DODUWajtLbovOf+gmf0SRh1+bX
 VZWVtUFvIO7dIgafFdzytHOn+yNq0DqEjEbdom2L3a1X4bfHshNtsxbFEhb6sTbDOqhDcIbK0k
 lz8bIdu/87kt4QZOk5N0dOUcDWpGt7VK0sa4nP51KiX7D/3jzq3jPEbqiqvax/+tOA0z/MPi9k
 PniMBAAA=
X-Change-ID: 20260113-adding-b-dtsi-148714533f07
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_151912_055708_D8EBA5A1 
X-CRM114-Status: UNSURE (   9.75  )
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

The RISC-V "b" (Bit-manipulation) extension was ratified in April 2024,
much later than its component extensions zba/zbb/zbs (June 2021). Recent
updates to the device tree bindings [2] enforce that when all three
component extensions are present, "b" must also be specified. Related
discussion can also be found in [1].

Patch 1 clarifies the ISA spec version for canonical ordering in uabi.rst.
It is a trivial update, but can help readers reference the correct
document version. Acked-by Paul Walmsley in v1.

Patch 2, 3 and 4 adds "b" after "c" in 3 different device tree files
respectivly, anlogic, sophgo and spacemit, fixing the related dtbs_check
warnings.

This patchset is based on top of linux-next, tag: next-20260109, and
depends on [2].

Link: https://lore.kernel.org/all/20251230-imprison-sleet-6b5a1e26d34b@spud/ [1]
Link: https://lore.kernel.org/all/20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com/ [2]

Changes in v2:
- Patch 1: Add Acked-by from Paul Walmsley.
- Patch 2/3/4: These are splits from the v1 Patch 2. Split into three
    different patches for each SoC.
- Link to v1: https://lore.kernel.org/r/20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (4):
      Documentation: riscv: uabi: Clarify ISA spec version for canonical order
      riscv: dts: anlogic: dr1v90: Add "b" ISA extension
      riscv: dts: sophgo: sg2044: Add "b" ISA extension
      riscv: dts: spacemit: k1: Add "b" ISA extension

 Documentation/arch/riscv/uabi.rst           |   4 +-
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++--------------
 arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
 4 files changed, 150 insertions(+), 147 deletions(-)
---
base-commit: 31d167f54de93f14fa8e4bc6cbc4adaf7019fd94
change-id: 20260113-adding-b-dtsi-148714533f07
prerequisite-message-id: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
prerequisite-patch-id: 0c859b4d131b3360875c795c6148c6176b55fb91
prerequisite-patch-id: 2ed98dc1ab0f5ed923cc252415c345dc8caf6f17
prerequisite-patch-id: 1be1a031763fac029076a768f012af31e455be66
prerequisite-patch-id: 21bb8387c946e050910440e7a7622305d46d946d
prerequisite-patch-id: f3bdc2c74b230663710086bd770a755d56cb8b9c
prerequisite-patch-id: 1f162c02f8bdb5bbc8ce52ead4fcb76258f5c2b9
prerequisite-patch-id: 76e1ff26c2f1fe4019cfa574942b568000e6ca1f
prerequisite-patch-id: 77ddc9e5dc85495adc803cdc605bdda2ddc7fa47
prerequisite-patch-id: a75c798383b46a14d40436357c769c3671184768
prerequisite-patch-id: 781fc10dcae2c38c84c25bee887ef7474786dd36
prerequisite-patch-id: 5be5d3e62aa73024bf9e1de6aad155be6d618f40

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
