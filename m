Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B260C53200
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 08:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GcV5nuWe+LmKoUxtAF53VsN3xMbn2Yi2zfUYTr67dP0=; b=yQ7GNZuVs+KqKW
	iBpUJiOKa6tlEjV2WCdBv3TURb0cR9XMd4C2xqUijgXVDfC5AEYbW+iBtqqTFJLE4TFWo0cmEIDFs
	YSvV8cfnN7EWFDn97QAhyRq0O2w7IBUnE/7jJi9kB2cX5fxuiRdgX8lVUmOTIKFx5oo9mMjiS+bU6
	25EP12kT0G+btarh2nq6R7IpidZjamNTBZ6f3/tLk7WGNpTEhNKbvQtujfrONUKTmsMBBmWYvl27b
	GRsno1jETZtab8/KtFhxy+S+4Ww37TIINJyndKtZvFYiTRVZR/nQkzgdiQ9cEHAxW7Z3/1UWgEMCF
	ZnzpJ4X6rgETSInNjFbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLrc-0000000DPfC-29uM;
	Fri, 20 Feb 2026 08:27:52 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLrZ-0000000DPen-3r1F
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 08:27:51 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-436e8758b91so1342813f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Feb 2026 00:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771576067; x=1772180867; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f6MEUb/BPhbswvjItrmNDB/sN3JkbLXHr2GG5X1/PKQ=;
        b=lIPjAtIrnldAVF1I4HC2zVfT2xTNQhYm6ZC6aJIZMCy51VF9etHwqO5C9QeGgm3c6n
         8ntGnsH07ShvN9gyalKVN4fh41KMZ1xGFQp1rKRsbVuFW4uwxXm/lduyv3S8UTuIg594
         DCdqMTKI35oG3fRn6v/4tRDsnLOwI5qw37+SJs0z5Oo7ogFqXu0LbsMGxpRCFR+yIrlN
         ojjNmMdE7WZfkUtLlUyMELY7KJxSp2ivoNE573oHhm+WRSBR/rhCATEFIZtw3yWrokbd
         cLKJtJXQwmGs8OKV4+SLjnN7J29qtckkzJ1dOGXelOKmy9KmXibnlsLyvAxZlFb93FPE
         9UeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771576067; x=1772180867;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6MEUb/BPhbswvjItrmNDB/sN3JkbLXHr2GG5X1/PKQ=;
        b=YYO+a4/Rnm9+yrvvWatxuia++AcDqLwoNP580Pb/BGARgaxUIRTFC1iEzWSOTlz1Fb
         TSw3ZeSx9nOHDkNBo9c9jUOW14vUjADim/pyk2WtyghzaELkd/Cy9g45ZwyKuygn8FJh
         sVCaXgLAhmulEq/9/Pq7+NpALciy79fpOWJm7TYjLkgmW/HnOP6rB5dlAkbwtMNV2FON
         LRjcRO67zWAWI2wfROkiq3Safl08tYRtoIMlbaPdNSzD8bWmQoMA7QdeRI7fxjUgBBFO
         OTPDuSGX7YvKswgBxHC2ZPXH2R57naCC2R1cZzISDeCZ6W5GM7zQZSSuBttRE/9X6XdH
         kjPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVikK4M7tbL+HhJBWzkhE2bPv6PR353zwTnRazZwOKbqB3n+ZgvkCAvVTRbEIl8se0YiGr56xEBw7ciQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGosgLdlkYp6sk83G1nW+oPK3/Q6zSg3Voew090wbjbWcn5fxn
	dQCgwIQXW74z7kHraDGQ+ECBp/7A/HjSiktCHhC1+lt5KETwjwmrDr3riXVOgzfIZEc=
X-Gm-Gg: AZuq6aL6CexYQlGXAWBC6We2NMT0mnXoERX6nCy4dnBggZStQOPifox91v3spUWNmJr
	EXJYdAK0Auht1+ux1gDxEDZmMmGGW7FIcxlQ19Zxlr5tbi+Ol4ggzVkjyrX7ktd4Xt0UxHjKA1s
	3JRi8ndrvlBBE9QxggiJcq2kEhBhlln1XKwYkWZEaiZOFmw/4VYy92tYmOKn5GXWLEfBhZm7UIk
	6g/yLMx9X4VkcphIQYfPorJ75xtg0LyRH2SQG3BnTiSkNt068gT45ycuadakRKwZ9y9IB/ufMUb
	qdZs4cmUxBkGSsZNsyZxwdWYu9h+DyrUAT3fGQmwB1QU53bxcV8OsevGe04ZWqmGgoxZG6vGI+D
	OrBzYmzLMRBjEFnV5isrBZLVoruyQlqGvlgofrWIQly3T0EH9v3R3EGlG+4swBulkYVdPqjjsdS
	yziPjQzgm+U3t8I091RmWS
X-Received: by 2002:a05:6000:2f82:b0:431:a0:7dea with SMTP id ffacd0b85a97d-4379db8cfe8mr36270633f8f.40.1771576067168;
        Fri, 20 Feb 2026 00:27:47 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1bfsm54717688f8f.13.2026.02.20.00.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 00:27:46 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Subject: [PATCH 0/5] riscv: dts: sifive: fu740: Fix compatible strings per
 IP versioning
Date: Fri, 20 Feb 2026 16:27:04 +0800
Message-Id: <20260220-fu740-v1-0-c8af54130c58@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANkamGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0ND3bRScxMDXSNz89TUVOOU1MRUIyWg2oKi1LTMCrA50bG1tQDZz7v
 ZVwAAAA==
X-Change-ID: 20260111-fu740-277eee3deae2
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, Max Hsu <max.hsu@sifive.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2249; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=NgLK9DnHXHbh/0SyIUqpYV9kGEgoxTNyXaMzbPHKhzU=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBpmBr8G5xsYpp9bS179Zrgmq7WnSzmUVdzC2ysv
 pcbgcn4kNGJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCaZga/AAKCRDSA/2dB3lA
 vaydC/4poywKhTIZqAMbae4JLkqR9S4oc9GHiXiZaRJ4LgVvekuyuJEmS6yJ0m/9F45/zTZCMRL
 jNPykIc6Bfnjicq+MtCIPIe6KyYE8BmfZvUuwHN90Ly8hXBmI/38cfD5/nQuKSV0OK8e7pbPxLD
 DMeoDmNI4tPN7Ho4e2s3RDuPC3GayFrF1lsAeguT8ksplL+bZqffbVIRKuh0Ah3/OpObQyxeZyP
 e2jfTEe1keULm09THOGG373hT2aE3Uuacix908naKGoxe1dPFeml4L/Ih9qhV4OkT9it+aaE1AH
 JzA7nBVHR/9GePMch/mGDbpNcvaR2zZge/o/BXimRRRpgE8N4oLN8Pjasuunx9k3oQ0FPnUdMGQ
 kMhAZTvsbTSZhodIWrD45whFv9vVr5QX9KmL35z4z6nx/Ez8tO9PIK7ndI4qXZLKSU4vyaN73n2
 XzH0mt+Qp1cTHUAxg/Lz2vemcsd7iLGYqYuxTv+BRUAJFprp1xDVX3ClEHlfwUsG2U+Ik=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_002749_996050_0CCBD9B7 
X-CRM114-Status: GOOD (  10.55  )
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

This series corrects the device tree compatible strings for the SiFive
FU740-C000 SoC to comply with the SiFive IP versioning scheme documented
in Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt.

According to the versioning guidelines, each SoC should use SoC-specific
compatible strings even when IP blocks are functionally identical across
different SoCs. This ensures proper hardware identification and allows
for future flexibility.

The series updates both the ethernet (MACB) and PLIC compatible strings
for the FU740, adds the corresponding device tree binding documentation,
and adds driver support for the FU740 ethernet controller.

Changes in this series:
- Patch 1: Add FU740 ethernet compatible string to the Cadence MACB
  binding documentation
- Patch 2: Add FU740 PLIC compatible string to the PLIC binding
  documentation
- Patch 3: Add FU740-specific configuration to the Cadence MACB driver;
  the FU740 ethernet controller is functionally identical to FU540, so
  it reuses the existing implementation
- Patch 4: Update the FU740 DTS to use the correct ethernet compatible
  string "sifive,fu740-c000-gem"
- Patch 5: Update the FU740 DTS to use the correct PLIC compatible
  string "sifive,fu740-c000-plic"

Tested on HiFive Unmatched (FU740-C000) hardware with network
functionality verified.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
Max Hsu (5):
      dt-bindings: net: macb: Add SiFive FU740-C000 support
      dt-bindings: interrupt-controller: Add SiFive FU740-C000 PLIC
      net: macb: Add support for SiFive FU740-C000
      riscv: dts: sifive: fu740: Use correct ethernet compatible string
      riscv: dts: sifive: fu740: Use correct PLIC compatible string

 .../interrupt-controller/sifive,plic-1.0.0.yaml         |  1 +
 Documentation/devicetree/bindings/net/cdns,macb.yaml    |  7 +++++--
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi              |  4 ++--
 drivers/net/ethernet/cadence/macb_main.c                | 17 ++++++++++++++---
 4 files changed, 22 insertions(+), 7 deletions(-)
---
base-commit: 9702969978695d9a699a1f34771580cdbb153b33
change-id: 20260111-fu740-277eee3deae2

Best regards,
-- 
Max Hsu <max.hsu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
