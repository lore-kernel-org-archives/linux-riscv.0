Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FA5C35FFC
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 14:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9+35msn+t40YB6WlQ8OneL/hwUWpb3kBkvx1zQMcaTM=; b=vnmgXdDHs2afum
	uDBQ40ULU7kt+IgVxJ4ZjUlYd3VobMfPzIAXM/ALC9FfeT6KItTjm3lcIsvTO0lvFkZn6stoA8a9n
	qaQhyPBvEXfoNG6p7WVZ5Hqcob7lU9oIae2AFCmpiAm28kv4KqDGM/wSVYCm/7cuOYYCwYG24kxl3
	6tn5/h1m6ePJzoUoR7DT7gB1C9rG7IMxbRRLp6h5Gy30IJXizOQALg0LJ8H9BBKAoWbZrR7s7WdcR
	EyrYoe+R9zryloMw2jG96/6/ldD5ap+x7ZbPeRBIEbF6vNeIKIIAZ/esUYbgE356jhcmd32PVDzgU
	pFlMm4hPpoD9Rt/xyvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx532-00000006AIw-11oV;
	Tue, 25 Mar 2025 14:14:32 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx51s-00000006AAP-1BGo
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 14:13:22 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E9BDE3FE07
	for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1742911995;
	bh=JaLEOuspohf9X4xUwz7GRTfjgrM6e47VPxpoP7GA8+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=B1a55Cve0tzwDqQIS+LyCX7wpna7Vm+ywW/K1PBn3IX6gWZudaQospbooz6F3aSvK
	 Yy89WvphqocQ9JRzlzpTIudytV2RJH5S448cNqknShOxEvIqGNkyX9YIvG72m2IeLp
	 jbgfbIuufpBCW3kGJTQ1U1eqcy7veMbt3I1e5bhsTRnG0QzTPhRbU2dCW06iqKfOKT
	 3H0orG7oJUlM8PETETW0wZmynA/UIwloRkn6ZfV6bbvolNSqaBCvweAeTlohD+a+dF
	 r3tSPWpoFk2xIC3zzXVLOlCQWH/AVuhww2JkzChB3UaTtt611eK3fyGdkSm198+y+U
	 rlo8vIzvN+zRQ==
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-391315098b2so2244733f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 07:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911994; x=1743516794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaLEOuspohf9X4xUwz7GRTfjgrM6e47VPxpoP7GA8+I=;
        b=W6gwPlj33SG5AKGOq/lxNmjonaatSMWVKXZe94nxY9n22PjCXNuZmrZq4b5lE2LWSY
         FUJlp/jsEXe78sGA4MtxS1e8hsQz8dHOGQbW/48D/9zw/6tGcU1efhwV8tO4GOfqQgZa
         HAbRkZ1vziIj2SOfMXq/7vWW3DtObfwuVblm1j0te/mNuT2xEdLJs8iLCgzxj8yUlrDn
         V0mjo3MV5ELZAwv/152jzWZ7a6pnaJgQmxzRs7yNUCT6P6m/yVC4DgYLxXRF1EwZ7Uu1
         orr3EvnT8wew2mpQaQTpYwLJL8D7TG9DoJRsPTPomVIar/Joy7R10gcp3YJTyyeH8nOK
         HMvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3HdfNkPaxfIH5PiutlcshDbcBWuv0lyWaLBalPN+9WJljdyJ0woTtRN5X5aWssmRFwBkkdpVCdguF3A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/pOVYZpH++RamoB9cslzuGG3w5DE5727OCJ7U3wwbsY/QiFoJ
	qULWTphxrc6q8n/3KV0uFmrAHylRgTI68eM00gzCggGpA+v3f8IZ5PBPhdi6/Prr2jMzt+b64zn
	q9zxAeyjs91nKBkkhoxSYdYNc76H9JM/z6buB4VCkI9y5I5l4RHsbuBYvbZwekXbv0LHTDCtbkt
	5mSQk9Cg==
X-Gm-Gg: ASbGnct7hckgw6tYSeTknC77mkP5qSfZNH5ZR+5fgiW1D6cM0CYqHIAioYzJpSEsRr7
	F+l5wv5cAbSjnakx1LFPKReRa7ugUoo7uUbFAkqKj+s0Hx+hZPe4C3Ms7yjuGTntnkWiayRiViM
	M4yFM+IiZa1CD+TSW94jT4cfFEL/I7ZXl8tZMLn9U5o9srZVFh3LNyNdX7nrDKF8LxuBlbXGRa1
	TtWEa+1GHZesIiQeCFcs1rjLKRv9UL/M7ZNXwCRsVkue1GXeKWDhaRpjin2/Jl/mDOT1f4nWCxq
	/dbSdkBjmDXG6lr3yGfApBHZlR8VwQ==
X-Received: by 2002:a05:6000:2808:b0:39a:ca0c:fb0c with SMTP id ffacd0b85a97d-39aca0cfb21mr1504909f8f.28.1742911994011;
        Tue, 25 Mar 2025 07:13:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9gu1kOTO2EMBz8bV0KvUy/lftump2d38xUsNj4Qewh4mTh1y9N8aE976C4YFTsdPfqCBOMQ==
X-Received: by 2002:a05:6000:2808:b0:39a:ca0c:fb0c with SMTP id ffacd0b85a97d-39aca0cfb21mr1504872f8f.28.1742911993506;
        Tue, 25 Mar 2025 07:13:13 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13532091f8f.29.2025.03.25.07.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:13:13 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 0/4] ESWIN EIC7700 pinctrl driver
Date: Tue, 25 Mar 2025 15:13:02 +0100
Message-ID: <20250325141311.758787-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_071320_448503_93640C85 
X-CRM114-Status: GOOD (  13.43  )
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

Hi Pinkesh et. al

It's great to see you've begun upstreaming support for the EIC7700. I
read some of the data sheet for the SoC and noticed the pinctrl is quite
simple and could benefit from using the same model as the TH1520 pinctrl
driver. This version should do the same as the vendor driver, but in
less than 2/3 the code.

I hope you'll consider switching to this version once the basic
support[1] lands. This patchset also depends on that series.

[1]: https://lore.kernel.org/all/20250320105449.2094192-1-pinkesh.vaghela@einfochips.com/

Emil Renner Berthing (4):
  dt-bindings: pinctrl: Add eswin,eic7700-pinctrl binding
  pinctrl: Add driver for the ESWIN EIC7700 RISC-V SoC
  riscv: dts: Add EIC7700 pin controller node
  riscv: dts: eswin: Add HiFive Premier UART pin control

 .../pinctrl/eswin,eic7700-pinctrl.yaml        | 141 +++
 .../dts/eswin/eic7700-hifive-premier-p550.dts |  46 +
 arch/riscv/boot/dts/eswin/eic7700.dtsi        |  17 +
 drivers/pinctrl/Kconfig                       |  14 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-eic7700.c             | 802 ++++++++++++++++++
 6 files changed, 1021 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/eswin,eic7700-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-eic7700.c


base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
prerequisite-patch-id: 2e5cc67f66a8cfe463ec73b98cd17130d4094a86
prerequisite-patch-id: e39d6867f89c605fd1e3621937c8c91a6cfbe7c8
prerequisite-patch-id: 5d2232bb3ce3d7d4e23477c2ad3db30424fee33c
prerequisite-patch-id: 946719f43a0cc23ffe82e996e076de2221dcd8db
prerequisite-patch-id: c2c2bc1b676b1e15165e107515b380318e9ca941
prerequisite-patch-id: aa4a955dd99d0796973fedb78bea269ebab73b6b
prerequisite-patch-id: 1cd27ddae721cc1e6c52723f8b360b09b5e712c7
prerequisite-patch-id: 237813218e54e0c7cbed8d72e30eb649ffd9ecd4
prerequisite-patch-id: 8e687755e898e71c80b0294b90deac71fe05c421
prerequisite-patch-id: 05622d10a27ba9cba36b3d194e51a2d8d7b7b783
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
