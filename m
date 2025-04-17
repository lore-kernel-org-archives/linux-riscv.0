Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6064C369CA
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 17:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0U99bMDhpFmMf6j2IbPLd8WmwkQJmD+QSzrFNWasuD4=; b=vhQPHCC2JMO8Fd
	mIyusiNGZ18LDGDlVZXSGFuNCb6wZYIVcW46dX2kPSk/bduTEagw1en45tg1f4hG0pCMGCvXrWDrH
	rKox0P0ixV7MWhfdmn0n6WivbWvZMTwND85sfty1obw/Y12rJD4RQ7WHDGO/AV7wwO7/m1/0ZetvA
	H2+9rXGURZs4YKwCGWmawbTtfdUIBrMR/6AE+hKkuR6soAB4vBx+h/cCtjzvn+IQpPA+gU5pLfX7m
	fAhJtReAdiaVvW4EjwhKiUilm91K1fJVFpiIGWhPqQ/vchWflGB2uJM0lt5X6HzyLP569OLjNRcGf
	SRI0BkLXEip8TvqJK91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TJE-0000000DuAY-3qO4;
	Thu, 17 Apr 2025 17:45:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Sqs-0000000Do81-0zwr;
	Thu, 17 Apr 2025 17:16:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8793D5C5770;
	Thu, 17 Apr 2025 17:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E925FC4CEEC;
	Thu, 17 Apr 2025 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744910197;
	bh=8w2ql223nYm+BErM3jbKkWekAvb+1IirdxYYwZl8YAY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tHBx1jL3rD6vHB7hA2Cz4VzEP2SSkxPqoqowLHlujIJyurg2Pe8WBIg8s16u2hyVI
	 lz/fQ1rs25feLG3dblbMBTrfmYmrmQgEw2JjFCYEW7zbntSICj3hd8SOxe1co0Siez
	 RLIQ062BjjnT+0i1z+1gpAkPAY/nvgAvzG1H2y8tDTq7KE1l1mz6v0DZlEKwmvCvmj
	 o9sCmdVD1KBzuuZwD1396UTC8vmtYXGsxgOJzE6ZP8/QXCxxrhX9Vtv4Y79MU/WX84
	 tGSuC2ZB0oQs8pauXnzHG+8Cl/fFTwGs7KX1rDumde3BvBBmn2A/iQk7BTDnBXJ6wz
	 my7gvHfiIUzRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60C4C369CA;
	Thu, 17 Apr 2025 17:16:36 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Thu, 17 Apr 2025 22:46:27 +0530
Subject: [PATCH v3 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
MIME-Version: 1.0
Message-Id: <20250417-pcie-reset-slot-v3-1-59a10811c962@linaro.org>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
In-Reply-To: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
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
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoATduJ1eBKw3zAzVw1gaiAwVqBn+p0sZO476CV
 SaNmLhB8GqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaAE3bgAKCRBVnxHm/pHO
 9fjaB/9TX7R/0DJbgw0yCzWKPjufexijGfBsQau7wlGK4zShGsIMnEPHAqvaACEB2BJLEVVEjoL
 IS6ObeFRSDy3aoJq4EJ2PPN9Vl4uAnBZTDeX/R4E12ZD57O2lcVJQlT3KU5ZFsFma2afXzFEkjn
 y4796I0mzYPIxPTRPBg3/7zVENOjOe+mEOMYL4h8Yw2ZenICJn7IuBuyzo+AJUpa/1zMtKcj2dS
 UyNT2y6ttaQpk6FExmXSrcshgGaIhfP5Tk2EIsSiJaJEBfrBwswyGrdcjzwL+knS4efzVgChr8+
 E2NR0Bwjl/iIo2Wq+DO/e/cIW/8z/L7fZoLbygsyGSr/EKlD
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_101638_361503_D575168A 
X-CRM114-Status: UNSURE (   8.26  )
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
Reply-To: manivannan.sadhasivam@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
