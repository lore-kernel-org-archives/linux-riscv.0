Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8547FE68956
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 06:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M3uc+0NAcE8xrYw/0zKHV/rikA7PT9Eqgabcgunnn5Q=; b=QtNfGVLd2nwzGP
	VHgNMLNgbi2MSB2ScxhRo7Cwq5qDAZbDYs1boS+6ZBZpzSvq4LdwNPrbQuJ3C0K2PyeZ1rLLk2YZG
	WIV4kHvJ3VitkXbDsNfR2qUOApI3FSTcSEEV/nhSA222VICuPPOgaUBjV6T5Yg3gRq8DigUwey4ax
	ZZ8brg/19MHxTQEPca8Lnwg+mTmJ0DleD6UHgvjUTdsWUz5eFcdFf6xECbb9Jo+J5R5eDo8dKO937
	4HHJ1en7NjX0y2B43JPpwqstiojE6z+vGoprElMrgII3wIenRaAM4MqI0ytq2Y76FaOeLzei1xq+3
	Rzj1EXYgvQ/aMVpCsVdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ONC-00000002eMt-1w1m;
	Thu, 31 Oct 2024 06:09:34 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ON8-00000002eLb-3iNP
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 06:09:32 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-72070d341e5so495737b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Oct 2024 23:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730354970; x=1730959770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+hXhUJ16K48c/4M1PVquU5XI4OJkfgD0FwNltOSyGs8=;
        b=Xyy5gand+9YsOy7zUQAEuFESyVCchqkVTPGHnBaJOWXyAAmERZK+h6YlQV6A5txJl7
         SViTuhRsboXm1adO0KXWY2AcU0rLzTyx51pJuE3IsIKDk6Z4LAxEBnfCtnI1RBTZTFBj
         q89IhmEYp5RGtG2xX95CcDEimn0qyEM5XVQHZAvdoM3e/VgmBWv++Y2w7/rdHqxZyrhA
         flWWDz4nyEYGWpEvOk9tZpo1GMReBe4ahjBbfRyhTDmARFaCPr4TLqgDYuq8FYhcCBdf
         CHeJf5IIGFZvpV4bkiL1SelvfxIMSZcr5rslYcDVyepmrHbVHAutR86W/6mOmsmY/Uw9
         tCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730354970; x=1730959770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hXhUJ16K48c/4M1PVquU5XI4OJkfgD0FwNltOSyGs8=;
        b=Dyf9ls4jbaJ9NzeiZ0c3L0vTf1nrZ3IDXvp7ve19nMWMLVNaOodonPXHCU7RkHqlHA
         JMhhlSlZcJ18OqQyiNg7e7ctSA5CMdzHBNs0G+A/xTYmYL2M+/AML9ICaX1D3io9ssma
         vbp/uwr8oXQi6//NoMiWgcu7PSLTc4uSPBmonMKMqyEWlv5DsgBMj2/VzQr73F4zAz6j
         EmaVBrY8cDshLHGBp5ssuUrKPtEDbB7z2YBopxLFtks5zyPsT8CxzL1OCTomN78sxqrD
         wczo5k5CWUIm4Xx5o2+HSBUqj5ZQTjxj21g1iJkIQF+JSCNZgsWs9etaTtS3CMEFt4P3
         Vlsg==
X-Forwarded-Encrypted: i=1; AJvYcCXzcqhrGV8K8uMLeWbvtYP4SyfbTKMttBDBqvziZ4K99nj+Q6VzCVTOZryNwp5mtRGFuvmCO7uYpWPqjA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf3hxNBOQIRw3AtmOquDsFDC/dwJQmku6a3/ANifQQCLHjGQVx
	ycfr7HOS/+NB/XR6Vkyq3O36ilpsRSMf8TE1vvrYN2rrFdeMWCBI
X-Google-Smtp-Source: AGHT+IGZ8LKVJxabPfVlar0jt5TJvCKTWMjDb3+j9MXgWzPHCHpqAnxCluoqe0yzk5w7hesyU6UCxw==
X-Received: by 2002:a05:6a00:1397:b0:714:15ff:a2a4 with SMTP id d2e1a72fcca58-720b9c96d0emr2848144b3a.13.1730354969715;
        Wed, 30 Oct 2024 23:09:29 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b86b2sm572230b3a.37.2024.10.30.23.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 23:09:29 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Anup Patel <apatel@ventanamicro.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/3] riscv: interrupt-controller: Add T-HEAD C900 ACLINT SSWI
Date: Thu, 31 Oct 2024 14:08:56 +0800
Message-ID: <20241031060859.722258-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_230930_951625_A2A6E9D2 
X-CRM114-Status: GOOD (  11.58  )
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

New version of T-HEAD C920[1] implement a fully featured ACLINT device
(This core is used by Sophgo SG2044). This ACLINT device provides a
SSWI field to support fast S-mode IPI. This SSWI device is like the
MSWI device in CLINT/ACLINT, but for S-mode.

Add full support for T-HEAD C900 SSWI device.

[1] https://www.xrvm.com/product/xuantie/C920

Changed from v1:
1. patch 2: use computed reg offset to avoid uncessary reg additions
   when setting/clearing irq.
2. patch 2: fix mulitple format issues and improve some comments.
3. patch 2: disable cpu irq when CPU is stopped.

Changed from v2:
1. patch 2: add SXSTATUS.CLINTEE check for T-HEAD cores.
2. patch 2: add select GENERIC_IRQ_IPI_MUX in Kconfig

Changed from v3:
1. patch 2: add SMP depends in Kconfig

Changed from v4:
1. patch 1/2: update the description to mark the device is T-HEAD specific

Inochi Amaoto (3):
  dt-bindings: interrupt-controller: Add Sophgo SG2044 ACLINT SSWI
  irqchip: add T-HEAD C900 ACLINT SSWI driver
  riscv: defconfig: Enable T-HEAD C900 ACLINT SSWI drivers

 .../thead,c900-aclint-sswi.yaml               |  58 ++++++
 arch/riscv/configs/defconfig                  |   1 +
 drivers/irqchip/Kconfig                       |  12 ++
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-thead-c900-aclint-sswi.c  | 176 ++++++++++++++++++
 include/linux/cpuhotplug.h                    |   1 +
 6 files changed, 249 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
 create mode 100644 drivers/irqchip/irq-thead-c900-aclint-sswi.c

--
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
