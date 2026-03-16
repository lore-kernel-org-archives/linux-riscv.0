Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2935EFCBBB
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 07:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NeoTcL6RmOdX0FHnBCeUOOzWu+yNdPtLIWFnmGiS+M=; b=Eaz98OpAaMeeC4
	Vr/qHc9V82P2pFIgSQC+p4Gq0CLvMcg6IFS6RxI/hMBAKsntCKnxAZxmmRFsck0FGv/RTnYVd+DKD
	UCslfoiKNnnYGEkMh/eyiSO2LDdO6fS8H+BU40rVeTsevwv1/bjwSxvQKQMeesL0x4pYSdBYskL59
	AmTLDcoggrrPSO7/ZJKBYx03NZHj+sV6vIIfOVDeDEJtAiX+qpgrF75lh99zr1hhPLTXvgsLd5OWw
	2WgStF5j+RZd3eAobF2/wFdKBtPoOrS3FyVJgOO7+wgAAeFZ3VgQWSLcIrM0dQH7Y5pWHFM0dW7St
	OrwjwWak0n0mgwWK8lJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w224F-00000003SJe-05y0;
	Mon, 16 Mar 2026 07:08:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w224D-00000003SIR-1lbY
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 07:08:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7C636013E;
	Mon, 16 Mar 2026 07:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72C20C19425;
	Mon, 16 Mar 2026 07:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773644924;
	bh=BSadjRnDeeKrTMXv13HECk6Q7u4nlqDJGnI5AMOxSic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JH4myvZC+SltuwWTqGSOGRM0Br6sS2itgGsMcplsDOsCs/6fqckhO5GV/TelEWRkD
	 0AyE0iItB3/YVmPsNb1elkTPuJG1fLV8GdtUvQf8dtXMeX63IuHrmVKBLBtyz96O2i
	 Ebzi3MOhrOFqjTjZBPj+jhT+IiZ5nImbiIo1iUaE+12YNOW9Zts1AB3/0LXlcPvnnD
	 HWHuEhQH+iXl9k6Ukp9NhXsiG9bgs8f7weHirz6BoFRpDSs/aEPMdrj8PXs6Pk6usD
	 sS4XG1vxz34uBO8bZJDkoIyHuJ4IdFMYEx31GgZPyKREtaFHguxKqAg4dmU1Mr8Bye
	 QBKsNTKBuUsEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D59EFCBD4;
	Mon, 16 Mar 2026 07:08:44 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 16 Mar 2026 15:06:58 +0800
Subject: [PATCH 2/4] MAINTAINERS: Add entry for the UltraRISC DP1000 PCIe
 controller driver and its DT binding
MIME-Version: 1.0
Message-Id: <20260316-ultrarisc-pcie-v1-2-ef2946ede698@ultrarisc.com>
References: <20260316-ultrarisc-pcie-v1-0-ef2946ede698@ultrarisc.com>
In-Reply-To: <20260316-ultrarisc-pcie-v1-0-ef2946ede698@ultrarisc.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773644922; l=906;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=S1wEZ7Qj4tYv0/nzKH9ecqpxkAyEAumj1u8QGL/LCmU=;
 b=k/OPXKc2hLilx+CL/XIe0/HcMf/WLkYIYOEZy5X0GAoCsCpp4g45Z9IQUE+FuAcOVj9/a46Nf
 v3UeZVX3eQtBa2SMl83GV0u3ThurTyk1um3TSrmBIRlCVuVe5p+3ZmN
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260309 with
 auth_id=682
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jia Wang <wangjia@ultrarisc.com>

Add a MAINTAINERS entry for the UltraRISC DP1000 PCIe host driver and its
DT binding.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96ea84948d76..5caa383fe0ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20571,6 +20571,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
 F:	drivers/pci/controller/plda/pcie-starfive.c
 
+PCIE DRIVER FOR ULTRARISC DP1000
+M:	Xincheng Zhang <zhangxincheng@ultrarisc.com>
+M:	Jia Wang <wangjia@ultrarisc.com>
+L:	linux-pci@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml
+F:	drivers/pci/controller/dwc/pcie-ultrarisc.c
+
 PCIE ENDPOINT DRIVER FOR QUALCOMM
 M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-pci@vger.kernel.org

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
