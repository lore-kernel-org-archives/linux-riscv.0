Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E1AC3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 07:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LcSBNu8edmYZFbSPuoQ1TRkH0m7TS8WGzHMfbsvjDKY=; b=YJ/9q1jl8Zjanh
	N2Ey5FjGPKxUq2XXAOwBaELMFySVNBbA9hpSzduZ4DVYV4Xl0Uy9UXovGLJitRZvBbF+/tCb/i00r
	L0JGyYREaz8caLPhv1T+fWsFxVUnCEySyBykAZL11Z+n21XhleZr6X1vTz0gUhotSA+Z91KxErcUj
	DwRrdWyq7l71BFv1d7FhuY9K+nSSrmzEchtqjWm6RXPTSeV+zSmMSm5tsKUFrRCo/Mq0mLfKKlWWe
	8r5/5FQ8aGywi2WvPQfMjuIIfsBNsiVXJvwLgbHlOET1l6EWwerf+iQhOmfALJ7easO76dcYiGNm0
	ruTW6Zl6Jao9kKADCcPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvWw-0000000HZWp-2AQk;
	Thu, 08 May 2025 07:18:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvOw-0000000HYDV-07PI
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 07:10:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so6667005e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 00:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746688236; x=1747293036; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNdUV80pt9dTQBN0xsYhQhCQV2pGwrGMIFKsn4D5UWo=;
        b=zQtJyB3r40Ca1bh5PAujc0OVS3soaUdKTOjSlRwmJ8xpLQOyv09pmhcezUg+787MXS
         TXd2toHPVz8KTpDsJapWrzq9IdHnYLUxlpxOb/SE4skK11wdKj/NxPeFkhQNsVN04bn2
         wS+FgL00FF4GgdN7+RVoHBtL9lNruigEgXbqTGlsITBf+0cNuZfgo5WEtABg4OqqVpE5
         kVVc0G56ehIIschx5xasYp7BpLwafPY0eVUtTdBfvLeVpH5zKCHJUPj2H9b5YgY3jhPB
         RNnCK7LLCSOEm1VPQT1g4urk9PTb3RvQac54JzVb+S6mJH3sJ7JapgzdGz4pU4Snl8v6
         xkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688236; x=1747293036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNdUV80pt9dTQBN0xsYhQhCQV2pGwrGMIFKsn4D5UWo=;
        b=CGxNHOytrxH3ZbTKhfhpRYhLSSnP/9KLmgyAD+S2+WJpML5q//58EuXXuRXDUT8MI6
         wQzu8ozJHTzYcgVlqNFkYFFnkOqmW7hyGOHqYkHeUZFnAkOg93GDydZ4/qP/BeSuLA8h
         zYyZGvCcJmS1oXl+J2+H6HeAoZsxxhno+zswACZJgxAG9X6Zv/1gyi3xrkCoPQhQ8RUN
         xBiy7UR+jl+l1Qi2KHCzQDdIxUdlmeNrDIEjYNWvbCgp/0UmT7hrcdwCNg0U4LaERT3S
         mwWfZVQKSOQqTsM4PcrIB9eoHJyViwo2a74MlRgdgwkYPp2uu7kWWWftX2iB/QdD4Zl8
         b9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFnhyu6c+GYpbvn4F6TCklbYgZAiPT43CBQwh0Xma7hmMK/sj8d1DiFSSZSykIXlr/ui78uhmuyNcUOg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz12s0rk/rFufwN1jl7Sx5U7B8VzOi52wE9ODDnIY7EZBY3YiuK
	ObO5pBSCDHdaFnWNrKK18+uGfRs26XfjwcJJTAFnqnAo9ZqivwQ8UeVkQIIrSQ==
X-Gm-Gg: ASbGnctmIfJVXMtNNXcar7tMK589amjn1ptLDBaAzcbYeVwtMFcG60jN3xa5ujqip2G
	DU52DdsrIwXS0FobZnIB7sKeRRpmEmCAX5P3hf2FCtrYkpi3gRh4grhD48ejrrAE6xvK8nwE0IX
	tua85Bx1Gd5iyACwj9/xfQmP1+mtTPoITLKaHGx1YXhQTkZYM+UQStOLr6+DU9c22VbL8pgE2Du
	6/Yf0ui6NXMbLSpIeZhqQyxte5PomcKsQ3W+98Ren01WatXehd8wBGUeidN1ccrE5UPnfiINfq+
	b0dig1mw4LLyauRZXeSd9K1nS9GFAy+2CYcPJF+JfHlusmJ9OeG3HX3VSn8+LeEcIhFMkK9MYtn
	SfRk60hi78kvpL4PRBx65dsbAp1M=
X-Google-Smtp-Source: AGHT+IGM/ocJYvn2QOjf3fD6bkcOlBGcdKqEyGGwPgr1OkqArjdUzcdfSklA7LLxbWYmBJNriXe76Q==
X-Received: by 2002:a05:600c:37cd:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-442d034bcbamr21959325e9.31.1746688236376;
        Thu, 08 May 2025 00:10:36 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm19500236f8f.97.2025.05.08.00.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:10:35 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 08 May 2025 12:40:30 +0530
Subject: [PATCH v4 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
MIME-Version: 1.0
Message-Id: <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
In-Reply-To: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
 Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=789;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Aq+BoDTRwjfmiHKRLtODTEbwNFS8yDdFMEIJ4A/Pkz4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoHFjp3+Y0C7nYToqJfWiLXSkKAM5YKgVxrQcgv
 dew07ahS2+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBxY6QAKCRBVnxHm/pHO
 9bheB/9ACtGdPZ3LmfihI48+MK1ALP0+Bx6+UetxxXKaahBYzIQ5gDCkxVfgOgnxWWQewlNuhzp
 LkZw3nCIYvdYAZ7/RT6FkDdBk4lRXh8t4QhrVlil8KmoN8umYdxyDDZutpu8RDRf9b5H84xabGV
 tt9QfWQz9sKtIRWtac2DBCJCM4vwuvtSDxEUlUvJkdec5PwCN8ffMmJBN3NQ+vSvJtmkY8CKX8o
 ZT1VVrEU3tuPcd3IaetbkOs7WBG2+W8B9TJkzU8p+4MnsQUmp41iy5Y6yO6mf3fDQ643DyRvmm+
 9X9+lTcKXgUsmH6hLBn6yhdJdN2ABj8XC+7vLejHvCUqYl4/
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_001038_058615_901F2C5E 
X-CRM114-Status: UNSURE (   8.66  )
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

A PCI device is just another peripheral in a system. So failure to
recover it, must not result in a kernel panic. So remove the TODO which
is quite misleading.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/pcie/err.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 31090770fffcc94e15ba6e89f649c6f84bfdf0d5..de6381c690f5c21f00021cdc7bde8d93a5c7db52 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -271,7 +271,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 
 	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);
 
-	/* TODO: Should kernel panic here? */
 	pci_info(bridge, "device recovery failed\n");
 
 	return status;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
