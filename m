Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E625BC021B8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nHXscZ+BMV3+zrDQrncojQOKMIDwGyEkidp99NLirko=; b=D5XXcQeWQUfseP
	I2cPiMHB8tflk+o69tvAgedss1B5VpAKfURpOAtQCGPmluH/gA+3iVS1s7uEQIYvczRwHtvSEZJjp
	wnRFA7U6ouapx4BfQ+yyedjSJJYxzbKmjQL9Wy5kmLpuSbZmnVeejmDGM4y63ncoympIoW3xV00GG
	ELqv4zidICtxxNeqAAYy4/kJPYsQtB3CGYM3T4VsFV3K1qD8b8Cl93AgwCOWRSI2pVn6ZolNU9k9Z
	JAW4PVNKfU5/9taw0d9Q1kDnHCBxw8Wh2sVKIKPk9QqvS55srkkdj/IVbbUZmbDyYvw3buisBZ0HF
	uEtL6LiPTDbx6nKdcsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMSv-00000003P2I-0rg9;
	Tue, 04 Mar 2025 07:13:21 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMSs-00000003P11-37qh
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 07:13:20 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6e89959f631so41931196d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Mar 2025 23:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741072397; x=1741677197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=04t/KBfFwVvzecOXRhML0Qn2Gh7Rc4imVCzpNOWwyWQ=;
        b=jFHgCKD76FN4dtMARp+2jiuw4SWw6kmcdCX1f7h9RAoq2fUZAD/b317FXOG0k16Pkv
         MBuAucLOeGFdwEZm88V81Bmzwtpdhuww0DWQnrxcVi6BPNEzFxWTUr+8U2KrU+jdTNKg
         ti0GsVrowX6haYESJca6MapPuMdjIsZ6Ki+KXYLhvEHizT3ewbV7tlbgraULDiN+rnlB
         TF4/fIrUkRBUpV4NgVuiK/aLULZNUjn8g9EIbXB+VZqvPajbriXQrGp/PiC3lftxtrQJ
         iO2y3YMqSWgUi3qzw9tmbMtVx6D3wsnCgBG+oYem6GcuDO1FHe4CzUH4u3Kq2YtCc0Xa
         wSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741072397; x=1741677197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04t/KBfFwVvzecOXRhML0Qn2Gh7Rc4imVCzpNOWwyWQ=;
        b=w2lF54sl6AdhsNSH7eADQyrcdZz88Uv4whWE1uQTKi5sADtwz8aXnzU9+ojTLZ79VL
         ELbvdHca/hoSQa67m/JnMhn9V0bz8g/RX2xyh0iGb5vP2DAqec9u97uqkJmsCloykFqj
         pOLMsjNZAdoaIG155Q9Cw8Tyg3Bx7YcOHCCHseMAwAhRMf+o3IUkZ4y5153veA+vXUef
         yBM5gsQcEm0ntObegMsk/MeLmAEOb+RETJYgJc0HVBmSMopUSDxTfbxKbhXsUNFAwBFt
         8aK40TnQGG4spXkdT0IXdGAKyhWZq1YH3493o7/ejK4f7RIWN1+CW/e/C6giC/fPqExu
         PTMw==
X-Forwarded-Encrypted: i=1; AJvYcCWAtdBq5LNlSwrYYUgP1PctCTwhCL+p/nJaVsRzPX8j6kd9qkHXbVnvMNB40EStll9d+nWUvx+J2hZSIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnqyduPuy2kF8eIMaosy9n2Hj5SsmxvWgBk/CmjvbnwVMgrNao
	2/ep3088N5ARhz5BdE4HUWprgPRw3NjSTm7ncerN0phgHy86uq5r
X-Gm-Gg: ASbGncvgF7hAi6xB8RifhJyxLXn4DSiu7vvjiUOm0qiYaYcOn62JrNFLOMgb0T61ybn
	JdEW/2cquyIZQVlcNVU0n2wzBS9T4SicU4NN8suuZY/yt/QA0PrWbOq/+Io0OoGsAT/oQWlWB2r
	+hP/1K88DWAJbdEDeg9/sQUcUzFXlgTBQAd+x9hTgn4KnGp57H7lBBvsGqdVZZ1E8wKZToioKjo
	PxDV1RAGyUQWbwNqjPHchQst825J/ozsEwuyzILDeORn+3/HqiSvjr9V1j47Wpa0Dop6vZUtVqz
	yyYFop1K6Cl2fl/gc8GL
X-Google-Smtp-Source: AGHT+IEKObI0ybp4bSeJ6S2BRkKmZEZlFbaJV85NGpcqaQnfX+y+IKf1GVvL/+XToao/2dp4HCiEoQ==
X-Received: by 2002:a05:6214:2b0b:b0:6e6:5bec:13a0 with SMTP id 6a1803df08f44-6e8a0c9f140mr258457966d6.10.1741072397382;
        Mon, 03 Mar 2025 23:13:17 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-474691a1f2csm69783811cf.13.2025.03.03.23.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 23:13:17 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Johan Hovold <johan+linaro@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: sophgo Add PCIe support to Sophgo SG2044 SoC
Date: Tue,  4 Mar 2025 15:12:36 +0800
Message-ID: <20250304071239.352486-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_231318_780852_93D6833B 
X-CRM114-Status: GOOD (  11.05  )
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

Sophgo's SG2044 SoC uses Synopsys Designware PCIe core
to implement RC mode.

For legacy interrupt, the PCIe controller on SG2044 implement
its own legacy interrupt controller. For MSI/MSI-X, it use an
external interrupt controller to handle.

The external MSI interrupt controller patch can be found on [1].
As SG2044 needs a mirror change to support the way to send MSI
message and different irq number.

[1] https://lore.kernel.org/all/20250303111648.1337543-1-inochiama@gmail.com

Changed from v1:
- https://lore.kernel.org/all/20250221013758.370936-1-inochiama@gmail.comq
1. patch 1: remove dma-coherent property
2. patch 2: remove unused reset
3. patch 2: fix Kconfig menu title and reorder the entry
4. patch 2: use FIELD_GET/FIELD_PREP to simplify the code.
5. patch 2: rename the irq handle function to match the irq_chip name

Inochi Amaoto (2):
  dt-bindings: pci: Add Sophgo SG2044 PCIe host
  PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver

 .../bindings/pci/sophgo,sg2044-pcie.yaml      | 122 ++++++++
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-dw-sophgo.c   | 270 ++++++++++++++++++
 4 files changed, 403 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-dw-sophgo.c

--
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
