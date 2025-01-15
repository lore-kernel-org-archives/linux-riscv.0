Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF0AC02183
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 07:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A2JjMr3Ut6hcNHOiE5xiUATWqhYmChdMVpXv2ZDurH4=; b=TVgHYhwpHQDxSh
	aolkfXUN67MOQl9Qs1R4baz7SLVkVFcjY9yKYVxrak+CjlIxDcdlcV/6AQhgrEKQxie+KgXJXA4ND
	Qlw1rV+/l/E+EPDPv68fl/+DLs/1YOIEJLgbAgDR3Z6GeyZUk1GpTadC8wO6SPtFsW2bZi4j1QF0B
	RoJK+JH1+1HLB5BxMfM4aupxB8/N/3gEz8m+n42w5xl+nEpOrgqlANV8HBhR/Xp+lC7ZzpKUpNiD5
	oRskRRoVxxmtuWUDLz9oNee0y0nd7bl6ik7n4yuuIWqXvJ4wLkyp8MnGzrqX7/J+XYxgkQHMihqZ+
	d20vqbQOOXpfBbqYr3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxTa-0000000At7s-3TNz;
	Wed, 15 Jan 2025 07:06:07 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxTY-0000000At7J-16Di
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 07:06:05 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3eba5848ee4so1671139b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 23:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736924763; x=1737529563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oI5ZjcuPckd6Ch/6DIyVBb1ek8gxp9mfdlh3C8bbL+g=;
        b=TFMmY0usF0zHEuPtUBp1O92U8CfaFQCVqVwtghut7rOw0We+28Rq7vmKuR4PrReSbd
         UCxvdWF7VONM/HAz+3zpdEUbFot41VjMle/zeiYcaS6n4vUQyPqKZAvh023HjjF6R7M4
         ZCNdj00+v8B/K9P/7aa3692XAzBVUT/UaxXDa94kyNeCtjW86BCZ1Kr5TYZbbjm1OFmr
         03u5E7OpgaLHGPyi88oF1nfeXE9IaElkaJupOyNozNLGHznT0s1OJ4/ekQ1UZkAERLVM
         PK6Gd3BA9naY+whZKTrUugfpUtEl4LmxljNXcLEH14IH8g15PYQXmX8YkgPUj9HKfya4
         bW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736924763; x=1737529563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oI5ZjcuPckd6Ch/6DIyVBb1ek8gxp9mfdlh3C8bbL+g=;
        b=rgFR2v1GWimqmhIgcvfsDFbzh1I9l1NRsJgXH+FPPCfO2gnLB/QKaeXNZz/zb4pENg
         hpObBWxcBQ6ekPHheL48LKIrGEpm6vQYiisKM8TH4QJ6oOJBbR+hoHDSpKEaCh5WKdhk
         tfpmskPvRHvglDn1drrWmNwFj6Vkpph4KtKtzuU8fF5ESRnUiaJo98a8FjC7IlvY0/mC
         a65QGKWWR+RQJT6JsWXNKHJrP4ZEX8l61x6i24qB8dJdA2W7VTxY9/y1aWTfg5HcXG6r
         1RJ3By4fKCsYMP94+7gXJKTPCYmqKZ+4I5jiRk//7CvHKPzrPiHTm/H0NxAilt/jEk6i
         52jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvvKv7t49rfigR0Cpw1tFr2Rq7L7G2mvHoDfwgU72Q/R3hnn5IKgMGqK6OU+yzfOJka1NUnBUtSimnBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPA7h3I8PvaEYt4yFeMZI22Sof/I3e4+wlQLmHJHmv1xl3UPYM
	aAcvIjjV7SK0DhoIr3Q4gF1ImBPzsdfyo+YlyMtj/2IhfHoQjkpT
X-Gm-Gg: ASbGncvfOmvJHvS4ntkoQC/h8xTR+j3mdijNofnv9IJJKsXEnGY7b/yOQ9MQ52/OeBQ
	VVsR2kUcHMYE3Q8Gy/zgl+Wow6Ma9CV+QSbyS9jE5UfyzK3SPddQNMSmlmkX/u9Faueiczv6BQ9
	6Ew4Nb1DQYKKbyMe2YnB77PZbXiRhukFvIirAHgOzv5lQGSWsHxYoiftbL5yTx1ovxLoON6G1O0
	FYEsMSMZeAZYpOSf++jsGB5poLDb8sknTm9zmKEvVReXpEtfwodUvs+llQwfduhb90=
X-Google-Smtp-Source: AGHT+IFkR6nnCpwOXELoB6VRu3HqkfESX5AtlZc9JkL6/31ySuvemmaJeL/mLBsU0qBVg79TjKGu2w==
X-Received: by 2002:a05:6808:398c:b0:3ea:6149:d6fd with SMTP id 5614622812f47-3ef2ebb9028mr20514321b6e.2.1736924763079;
        Tue, 14 Jan 2025 23:06:03 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f0379eff52sm4779278b6e.40.2025.01.14.23.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:06:01 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: kw@linux.com,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pbrobinson@gmail.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com,
	helgaas@kernel.org
Subject: [PATCH v3 0/5] Add PCIe support to Sophgo SG2042 SoC
Date: Wed, 15 Jan 2025 15:05:52 +0800
Message-Id: <cover.1736923025.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_230604_305955_1E108BA6 
X-CRM114-Status: GOOD (  16.16  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Sophgo's SG2042 SoC uses Cadence PCIe core to implement RC mode.

SG2042 PCIe controller supports two ways to report MSI:

Method A, the PICe controller implements an MSI interrupt controller
inside, and connect to PLIC upward through one interrupt line. Provides
memory-mapped msi address, and by programming the upper 32 bits of the
address to zero, it can be compatible with old pcie devices that only
support 32-bit msi address.

Method B, the PICe controller connects to PLIC upward through an
independent MSI controller "sophgo,sg2042-msi" on the SOC. The MSI
controller provides multiple(up to 32) interrupt sources to PLIC.
Compared with the first method, the advantage is that the interrupt
source is expanded, but because for SG2042, the msi address provided
by the MSI controller is fixed and only supports 64-bit address(> 2^32),
it is not compatible with old pcie devices that only support 32-bit
msi address.

This patchset depends on another patchset for the SG2042 MSI controller[msi].
If you want to have a test, you need to apply the corresponding patchset.

Link: https://lore.kernel.org/linux-riscv/cover.1736921549.git.unicorn_wang@outlook.com/ [msi]

Thanks,
Chen

---

Changes in v3:

  The patch series is based on v6.13-rc7.

  Fixed following issues as per comments from Rob Herring, Bjorn Helgaas, thanks.

  - Driver binding:
    - Fallback to still using "sophgo,link-id" instead of "sophgo,pcie-port",
      and improve the description of this property.
    - Some text improvements.
  - Improve driver code:
    - Removed CONFIG_SMP.
    - Removed checking of CONFIG_PCIE_CADENCE_HOST
    - Improved Kconfig to select some dependencies explicitly.
    - Some text improvements.

Changes in v2:

  The patch series is based on v6.13-rc2. You can simply review or test the
  patches at the link [2].

  Fixed following issues as per comments from Rob Herring, Bjorn Helgaas, thanks.

  - Improve driver binding description
    - Define a new embeded object property msi to replace the "sophgo,internal-msi".
    - Rename "sophgo,link-id" to "sophgo,pcie-port" as per suggestion from Bjorn,
      and add more explanaion for this property.
    - Use msi-parent.
  - Improve driver code:
    - Improve coding style.
    - Fix a bug and make sure num_applied_vecs updated with the max value.
    - Use the MSI parent model.
    - Remove .cpu_addr_fixup.
    - Reorder Kconfig menu item to keep them in alphabetical order by vendor.

Changes in v1:

  The patch series is based on v6.12-rc7. You can simply review or test the
  patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/cover.1731303328.git.unicorn_wang@outlook.com/ [1]
Link: https://lore.kernel.org/linux-riscv/cover.1733726572.git.unicorn_wang@outlook.com/ [2]
---

Chen Wang (5):
  dt-bindings: pci: Add Sophgo SG2042 PCIe host
  PCI: sg2042: Add Sophgo SG2042 PCIe driver
  dt-bindings: mfd: syscon: Add sg2042 pcie ctrl compatible
  riscv: sophgo: dts: add pcie controllers for SG2042
  riscv: sophgo: dts: enable pcie for PioneerBox

 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 .../bindings/pci/sophgo,sg2042-pcie-host.yaml | 147 +++++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  12 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  89 +++
 drivers/pci/controller/cadence/Kconfig        |  13 +
 drivers/pci/controller/cadence/Makefile       |   1 +
 drivers/pci/controller/cadence/pcie-sg2042.c  | 528 ++++++++++++++++++
 7 files changed, 792 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
 create mode 100644 drivers/pci/controller/cadence/pcie-sg2042.c


base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
prerequisite-patch-id: d3c733a9ccc3fb4c62f145edcc692a0ca9484e53
prerequisite-patch-id: bd8d797ce40a6c2b460872eda31a7685ddba0d67
prerequisite-patch-id: f9b3c6061c52320f85ca4144e3d580fa6d0e54ef
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
