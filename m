Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CACD7237B
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 04:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7VLlE+5Ui2+G/qsGeaT2KgKBG97XsByxxJRQ6sG3Mcs=; b=Vcj/6cvHG14vEV
	Er9sZ1Tlv0JIV/RubFQq/hkFD1J8XP4JFEMGtVri3p3iLOFNRZrust57w6NHYg2l12Tp10jDmS0jm
	oTaibOycCPvbOJJJwOcysl0Ym+OIn8/vstKxRmPnlZqmIdZ9cDnhz/M30PBT4sgx6kj+ihmNU1mqT
	b7CLr8kpuqdddViQCFzua8lxVz4FZYqRttcTcAER0IAj9ml/GTj61zn2M2GnRt0kRzxWi8nzHQ0hE
	ElVJ/Qug3HoGzACME1YrtEG5TjXWxM2XLSF8TlxrlvF41xXdl/4o8K0WY6K7+jBknfHBahBTNqSiV
	PWN1FW5i1KK7vyrDvhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjVHD-00000009z6e-3d4H;
	Sat, 24 Jan 2026 04:29:35 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjVHA-00000009z6G-1JeU
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 04:29:34 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82318702afbso1849296b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jan 2026 20:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769228971; x=1769833771; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O4MFr4awFPQFQ95TEp9Xx5V/NF5VvFij05h0W0v3UZY=;
        b=bnkgNOGrJ2z407v2OcneZteRS2043NwQcn/auPFiVWdSw8zFToBfqMXAe9mLyFts81
         XIKerYmwB4CDLipIihUomTH8TteD6dDtOSPzhYEV+6/itfd+/PJLxSqHtkKm/yRjYbhy
         Xn5Bnhwrv6C4HbEb2tXnOZPgUbSWOxcIrKlVPj5e+U0bBMAsgnHFD++o33j2zeAIj8vk
         9F+7jHLkA21opS9g+Ib+mx7he+JwkOTiJxnMhdpVEVy4CHFfsjauGSR4qOVvnBnXIbgV
         y/cKXfuQTjFlcdv8HX/FdIUobbFHWY5vzBhCO+AC/EcOnFbwPPStKZRqlsTVnbSOiAnZ
         OZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769228971; x=1769833771;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4MFr4awFPQFQ95TEp9Xx5V/NF5VvFij05h0W0v3UZY=;
        b=QosCYJ6DEj7WeNRL3S4QThe8j9xs688lLRr+OXLQRozi9rulOROVNdEm0/sBHTbu47
         65T/tXPZtb6hjqFOCt5ulNSCyEKMRe9RTRTEo5geHdKwDwHCJ7WvyZZwECyaBgVTOIIu
         FjKZy6dgS4QxUgDeMt9maiLoCiAfa9KAU542IURa6RdTkjjrAAcMl2ZvQD7LGLczGAMX
         SQcyy5/6u0vhSRG2vNrM9dtbE2N/PJ8RsGHqrcD+HS1ALZljJrZCdH6/8A0bLGvu71Rf
         sO0/Y8LFB1ygYN62a5C1tmrO+zt/eWyI7vVMkJ5kIh3QpvF2OBUqg2iZoPH0/LWziOGj
         aQHw==
X-Forwarded-Encrypted: i=1; AJvYcCV0dU7T0B89jHEPfTV6sUbdhrvTrNKsOZnvyq8MRAEG0rI2Z44NdibaUvNYdA3ZQTHR+CFSIRGEbTR36w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwS/pINyVL9w1r63PCfO+4co7CzeE4tx6xqEUjMtiHVdzLDKKRH
	KzfgA2xibFiR0+d7o9j0zJokRrO4XJRKp0GQ+ImXIk7K2xKO8B1JaV61Y+eC7PGbfOg=
X-Gm-Gg: AZuq6aKrwdfXl++0VPa3z/ZwI4jDdp46KP9XP9GPgSGxlI3RD2OtWvHB/P740PNY4Bp
	NKoNy4Z1aNSj5Nw9TTu1plXAksCZBeIzT0CjmALAvhYTa+ownKeS3kdZ+5Vo3RvFj1scWP4aZye
	uMFUox7X41b63zrBoF43wXxTHcRwX+Y5VYe3/bDpu0etsbHKJuohm/TvXzTsmcuwxLdZ/bMtTjx
	sjxteGkBgEQe3ETXvULJFqkTa4zw0hCodZBpGoDf7ik9Polr5AlE8kXWvK5JUV6zC+vztSZpxQO
	O49cFsgltaeMBaw84PSomKnXyHcMNiwgOlzy1gx5TvD2N8jGj/KR0VoVv3z5radC2/ABtn1WmQi
	8W6LLtzuE25aRlJTmApRbrWXme2cqzmnb5f/DeXeOwMSeirYQgEa9k+ohJEoQM4ae8V1z0TWF45
	i4k/ldihYwaIzEl+MQ+OfGi1PSck9xuk4=
X-Received: by 2002:a05:6a00:428b:b0:823:943:391b with SMTP id d2e1a72fcca58-82317f1a119mr4451736b3a.60.1769228970505;
        Fri, 23 Jan 2026 20:29:30 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231871d51esm3469423b3a.38.2026.01.23.20.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 20:29:30 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v2 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
Date: Sat, 24 Jan 2026 08:20:15 +0800
Message-Id: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEAQdGkC/22Oyw6DIBBFf8XMujSAhYqr/kfjAnGoLHyUoaaN8
 d9LddvluZl77qxAGAMS1MUKEZdAYRozyFMBrrfjA1noMoPkUnMhJaPZOhxCYrNgFpXR6LGqlIf
 cmCP68N5t9+bgiM9XlqYjhNYSMjcNWVAXSugLGqW06kr43feB0hQ/+zOL2At/dxfBOCu5aVFef
 eu9ucVAjpKN5+yGZtu2L24UNUnZAAAA
X-Change-ID: 20260122-spacemit-p1-ae596efe885f
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_202932_611770_21A4987F 
X-CRM114-Status: UNSURE (   8.07  )
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

This series fixes hardware voltage constraints and enables flexible power
tree configurations for the SpacemiT P1 PMIC.

In v2, rebased to Spacemit SoC's k1/dt-for-next and added power tree
definition for K1 Milkv Jupiter.

Patch 1, n_voltages is corrected to match hardware register widths, as the
previous values prevented regulators from reaching higher operational
voltages (e.g., 3.3V on LDOs).

Patch 2-4, hardcoded supply assumptions are replaced with explicit
devicetree properties. PMIC supply connections are board-design decisions.
Moving this to DT allows supporting varied topologies without driver
modifications.

Note: Patch 3 introduces a bisect breakage by transitioning to
pin-specific supply names. Probe failures will occur on existing boards
until Patch 4 updates the corresponding DTS file.

Changes in v2:
- Patch 2: dt-bindings, remove providers from the example dts.
- Patch 4: Added the pmic supply properties for K1 Milkv Jupiter.
           Updated the commit message accordingly.
- Link to v1: https://lore.kernel.org/r/20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (4):
      regulator: spacemit-p1: Fix n_voltages for BUCK and LDO regulators
      dt-bindings: mfd: spacemit,p1: Add individual regulator supply properties
      regulator: spacemit-p1: Update supply names
      riscv: dts: spacemit: Update PMIC supply properties for BPI-F3 and Jupiter

 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 49 +++++++++++++++++++++-
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 12 +++++-
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  | 12 +++++-
 drivers/regulator/spacemit-p1.c                    | 25 ++++++-----
 4 files changed, 81 insertions(+), 17 deletions(-)
---
base-commit: 5164e95565d3fd508ca8a95351323f5716dfb695
change-id: 20260122-spacemit-p1-ae596efe885f

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
