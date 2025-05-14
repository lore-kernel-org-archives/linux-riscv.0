Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B8DC5475C
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 18:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+Jdy4D3n1h9KpT0Q06A4pwvuAA1P8rsYvxvSSdYGfc=; b=ks1MZjB+YmgVQE
	dBNl83Qu36eng5NDw6NZRDL7F26B6j/qZm0Hu/YRrU+UIZ3ai9016SwyZTKQ/i33PKeHBQdOnvbo0
	lE+/DF60Yj1V+S4gquKgmjUAwz+q0I6b2u0hiKtPJGmjbxb3nSHnC2jTaf2HMur/I0trjBvJmxsk9
	2vkIbThlsoh3F4tME2GXx8oQam19fj0zqRo8yAu82Hx5pLiyNzAiiPDBBPhvZSn45wvimpnCM/GMn
	JnClp03oKxSCpfnWUQg9UE7lR717aJI2ldoVMINbji+Dxcp+woM1SG/GI65PjSErQkKG8fZ1P+laP
	0s90s2I+R3z/egTMheDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHDZ-0000000G5Yf-35ce;
	Wed, 14 May 2025 18:52:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFF1x-0000000FlKq-25PL
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 16:32:30 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a0ba0b6b76so5223829f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 09:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747240348; x=1747845148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fnmo2+MZcpJ2cvX+WFzBsbU3N8d4JXlGi4Htr9EmUTs=;
        b=MUts2I/cs/ihPZPrJLK6J/0wLyewbHMqSkvCfp9Col94FSGrLv3eWOFEv7T/NidEyw
         F2WhpaUgF/FQNf0S0XnNDUuj/BHY7fXbtON4xv+MjC20wcro5P6BvKRSKwTICn4HErBM
         3LwlwXvqC04KMb7papf13U1HLlIYSkGDjYY7FvIHxIekJLOTGE/FcbKIv4CjVDmzmgD2
         rUnpB3mf5U1920LQprixhjTS8xFIjhoU5tlQNIv6sRdBn7/soxpm2zKaJADPB94c0xJk
         st928x3toeqCWoUHqJsKUah1SIRSRDPlX/+hsEG7X7tr5SK2BNfrudPICg8DoZhQ6vDz
         i+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240348; x=1747845148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fnmo2+MZcpJ2cvX+WFzBsbU3N8d4JXlGi4Htr9EmUTs=;
        b=dzf66C6QxJlLmc07IlBXhWZ8CdBVa4Yrqkc34uX8xFIDlU6PLM3PJ94nIgHDk+U29F
         7Zj4QFMbB2dav4JODelLMNVSG5Mr1DHEYou1p49SmkuJO/4WXtY+Hk3oFDrej9WE5cmi
         NNJEP+EwgnP5ZkbvjOrUSS1PmRvnJ/GLC4oU8bC3oleHd70dFE7n9ddxy52f/89C0rFl
         BPLgqw6gawAKGQMFPxlX1qg3Ip+7RXXdhy8nhE2ccyWsIcfitzO+IXqIBpYO9fxFet02
         jwznkhyUBu+vmV2GRrDu+OMJMJOKlyRTKXAKtGqt99e/8hxK/P+UuVHbkDlIDCGbwNrL
         Miag==
X-Forwarded-Encrypted: i=1; AJvYcCVGcDtkR9dKbPFnUGS1wRIcxV4eZ6UWERTQRpOx9ZGWSc1gBalPyNh6f/MDvLEBR3TwWRHojUQI6Yqa7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcWE/d7pBCf6NhysszUNF9lJwwuBE6yvIukMjwPTTDM9rXfSLc
	6WlwXf7ZzJo+A8LtHv/QdhAeYrx8gqTlJHE+ak4nNB9IX2AMplbkfZ5JqWUu4g==
X-Gm-Gg: ASbGncvbMmMNKjf4WE2/9t7LIB+kLRGylUu9Pp4o/c9l6ZiZZUkEKuLayhxvp+pzTtb
	c/yVrTq9xpFGvlL1Bu91gVJ4IicuCx6NiV3fVVAuZLOG3dKxYn+YSG856QPqzxu/PAAnwQ2bV3A
	hwqWiKiPA9pzElqtIYzlupYlcJdrr1GpsKtiKz/4pmMJ0JZidhgcKgEeWL4sbcZDAL1wh9mSL5x
	HMpTRmqFKL7L3Afbo9dJFlaX+1CkUl2w38xvRD/1c7gczmrr5sGSksf+wiL4+P1edJ2QNWF1wqq
	kVkSK8r6G4lsCusQyS19G4A2/lEvpIbe3Tqm1EMk9eDiKsowhNErbLlzouoedTnnkoGNZFcQils
	L3jPohCU0dLTZV7+gFRV1ciG9RpbnyRBaxu+y1XaYB94P
X-Google-Smtp-Source: AGHT+IFn3vXnS6jxMSTKpvWwf0YAtvDrlGdswD18OpUum5KMQooxsvMQxaV39lTehJR9+Ij2bnRE1g==
X-Received: by 2002:a05:6000:4205:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3a3496900a9mr3428305f8f.7.1747240348003;
        Wed, 14 May 2025 09:32:28 -0700 (PDT)
Received: from thinkpad.c.hoisthospitality.com (112.8.30.213.rev.vodafone.pt. [213.30.8.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb8c92d9sm37650875e9.2.2025.05.14.09.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 09:32:27 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Will Deacon <will@kernel.org>,
	Robert Richter <rric@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: dingwei@marvell.com,
	cassel@kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/5] PCI: Add support for resetting the slots in a platform specific way
Date: Wed, 14 May 2025 17:32:23 +0100
Message-ID: <174724032611.26337.10095399338390897616.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_093229_538075_9D4DC17B 
X-CRM114-Status: GOOD (  11.31  )
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


On Thu, 08 May 2025 12:40:29 +0530, Manivannan Sadhasivam wrote:
> Currently, in the event of AER/DPC, PCI core will try to reset the slot and its
> subordinate devices by invoking bridge control reset and FLR. But in some
> cases like AER Fatal error, it might be necessary to reset the slots using the
> PCI host bridge drivers in a platform specific way (as indicated by the TODO in
> the pcie_do_recovery() function in drivers/pci/pcie/err.c). Otherwise, the PCI
> link won't be recovered successfully.
> 
> [...]

Applied, thanks!

[1/5] PCI/ERR: Remove misleading TODO regarding kernel panic
      commit: 0b56264b66b695aa76115ae68c1365dff80814e0
[2/5] PCI/ERR: Add support for resetting the slots in a platform specific way
      commit: e2889025d83fb38faac80d976f1789af3320ecb2
[3/5] PCI: host-common: Make the driver as a common library for host controller drivers
      commit: a811ffd43754dfcaccff497de1d8ee0bd30f8f2f
[4/5] PCI: host-common: Add link down handling for host bridges
      commit: f24509b96c33c1bdd9cc57bc4f8a58391e846c8c
[5/5] PCI: qcom: Add support for resetting the slot due to link down event
      commit: 40eba89968afc15302fa5aaef207fd9ccaf1ecb2

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
