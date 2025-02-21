Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39878C021B2
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 01:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=109wi/zwlkeQE9j8iKtqIpwxATFnXppqLJO9IrwohjU=; b=KqE6+gROU6YrPI
	ngwt7WS0A+N9UQGBkjTLUMKPpi82ra+RG3MMCC7T2iEz9Dd2DL9Tz/m9r9dHWLDQC92loZs/5ICa+
	FWMg1Ucbnw5YYF0olqG9szjKk2Di7NlHk+nnVHWNogyp3Lr8hpLrEQzSeufL/6/F/NKGXXrpSQFlm
	vXe19BciAbDFm58B9qKmUhmfuIF9napwRyfBW/X+IjvlUyF1aSccETAmKwXwiDnvouGQREsQ3/W2d
	87QiQkSXqD7mTK8u5b1wqvrNj40GEqqOEJc5NlAFTgko/cyTZAS+ZvZeRbsvvDHtjiTFVqg2qLssL
	xHCZFeWI1fheuj56ppsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHzg-00000003iYK-3iJ6;
	Fri, 21 Feb 2025 01:38:20 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHzd-00000003iXQ-2NWp
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 01:38:18 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6dd01781b56so19440276d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 17:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740101895; x=1740706695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uTSidftreS4QFmmprzmQTP0Ok8hTg1K/MceCazw94nA=;
        b=LgnIyoQ60b5cJa0G9stXrTGpmR4FFpZyEWyDRWrDQXkoNY2V2DowPchBA1hXhDwtHC
         Pa6c5K+I6mV8qm2CNFkJZ+J+kQtHJ4XuT8xTra38JOsK8Vubf/+qWuTogi2HvhN0RCLH
         8amAf5QV+Cq1UDSjymwZ851Zyx9YM/6xDtstnJdKqhVDn+NbVIbzvX5u6Ee9KbnsG2nH
         pl8ij+mxO9iNItncV4jBXBVP9bL1iHYmUViYXJJqsNyw0Jv239AIW8tZFWDni3tNkAkF
         VNp5wwrkjV0NAlE0EJPXb12WiOA9ZSGpbNfVN1c5lfilJCXbRvJ3NAnJWJiT4cvBUZHO
         BSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740101895; x=1740706695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTSidftreS4QFmmprzmQTP0Ok8hTg1K/MceCazw94nA=;
        b=ipI1mgbrDY/6SIzagP9QWxcUPARXrYLt7k2LfFRAcGJ2OBnsHAeQSxQqIcWSYR4eR2
         H6fRgIRclSgOQU/P/AjYp8Wl5lncjgKKxSUvxEWm/pFTYqttFi9hOaOs31VROtwo6w3w
         aGtU0aHVSJvhPYmEe26Zf6wcjgHMM1kvhKrhy7EAniBiBfL1HnBqYKP2UsJRsSsrrWzF
         HYceG3DIc+L6vFgjQET8S+5VayMKNcE7kN/AdMDKdf13bXB3KwdZ3+jUiat077Ghu0Ew
         WVLvId3FVITPRw35mZMkP2Nd8T0QrnA2koXCgKG9w7L0U9iV2e8JEec0nhYiKB5eIkC4
         QswA==
X-Forwarded-Encrypted: i=1; AJvYcCUwWC4FigOPlG7VDiewXSJOGwjOClAukhdkqvk6uGxkayQPNXqi1nv9hHXl3kvteigubKUPwSE2ZHpAbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZqYhDh2GpHEMGoAjc15cw8rRdTps5oa2TUc5NRryqx3R4+ne5
	t1+4lkOn3g/ZXX+OLVfQCBwM3JVRu0W5qPi+N9vGinl6jim9oBgA
X-Gm-Gg: ASbGncsxMGEZAKHTIpvM2/xXsP3Pe0SSpQ5+yovGIwKU+fxlnBLEFEI49FYX8jomvr9
	aXb872MQ6AIWV4pn/HvqgW/VXgIFlwOHicfns8xaIBEjhcJ/5/5mon+/Fn8+zXXQ9NjHU2kqIQ6
	kDXnA4EHBPTI7qFH0eqsMsketJdtcWNW+BLSyUDGIvlSq7ZcooJttfpc0gF8ZLzjihtVVOuL1zO
	Fo3Xg73n88KEovwqfHDFxuVjHV1R29HKWie+o8okoH9Ez1cAJqMirlqhMFMi1yEbx5Jt3zLRLl+
	2g==
X-Google-Smtp-Source: AGHT+IHhua4oxHyol2HKv9TAxs1TEtTYZXq5TSxXKdjQrvU4ioWpfZxfRhn7MqQPrbNidkwG52d/Mg==
X-Received: by 2002:a05:6214:f27:b0:6e6:5ede:7d83 with SMTP id 6a1803df08f44-6e6ae82dc98mr20922326d6.25.1740101895447;
        Thu, 20 Feb 2025 17:38:15 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65d785d12sm91995966d6.37.2025.02.20.17.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 17:38:14 -0800 (PST)
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Niklas Cassel <cassel@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: sophgo Add PCIe support to Sophgo SG2044 SoC
Date: Fri, 21 Feb 2025 09:37:54 +0800
Message-ID: <20250221013758.370936-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_173817_604915_C3AC8B7A 
X-CRM114-Status: UNSURE (   8.91  )
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

Sophgo's SG2044 SoC uses Synopsys Designware PCIe core
to implement RC mode.

For legacy interrupt, the PCIe controller on SG2044 implement
its own legacy interrupt controller. For MSI/MSI-X, it use an
external interrupt controller to handle.

The external MSI interrupt controller patch can be found on [1].
As SG2044 needs a mirror change to support the way to send MSI
message and different irq number.

[1] https://lore.kernel.org/all/cover.1736921549.git.unicorn_wang@outlook.com/

Inochi Amaoto (2):
  dt-bindings: pci: Add Sophgo SG2044 PCIe host
  PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver

 .../bindings/pci/sophgo,sg2044-pcie.yaml      | 125 ++++++++
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-dw-sophgo.c   | 282 ++++++++++++++++++
 4 files changed, 418 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2044-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-dw-sophgo.c

--
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
