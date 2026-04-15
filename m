Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CFFFA0C40
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t95SnIftvphu4ZZIrky+NK7bVv47e8d8LWr0A+ukJcA=; b=VnWbMiCTZYOuui
	p9AeWcml0iiDQDET4L+qknXDB+U/OG5vYlMA9f6Tbr7R33/N31WhiEif27Pm8Rsrr+lHB+4moz04C
	uDetiHw93y2UwGdYhCIFZ1nOV/Pj675zf1iFlrsxPcgM2KasL2eRji4WLCAgltw0W0/xJpya8s2nD
	L/e9RT9ezQgR3DGizr4U96zsuFR+ddvWpp+HHbpGpuLaW3ezRFzkGhTb4hwDXXNXN1Wni/wG4gTA3
	uqlTC4MGaTYv4pEQ+qU0/SFi9IkEtb6r29jl0ct4gycqn5hB/E65kxg0uoVeaH+9qtneHL11QP1Z/
	BEMy3y4qFURYzi+J3VOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCuZC-00000000i8x-2C08;
	Wed, 15 Apr 2026 07:21:42 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCuZ9-00000000i8M-25R2
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 07:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=93PIetLPlkIz5EwWi+bTHj9pG+9S4XC
	lsYq9hZG/hkc=; b=UD9mmmKmGqVC2BjXkzWl+dFin12e9M2e6bO1c/w8hIGVPiR
	XN7VXBRwcjrp0aQEbQKRZq3myeGDvaN27IXU59YjHbG0AvmcqxbAuqDmHAp82W1N
	mO+VZ9OwtC9f+hKrIJP2c6fJbytdjAxfJ4+s/rXTlreBQYsOqQJhdMYCiEeA=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUKdPN9poSgCAA--.1324S3;
	Wed, 15 Apr 2026 15:22:11 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Wed, 15 Apr 2026 15:21:17 +0800
Subject: [PATCH v3 1/3] riscv: add UltraRISC SoC family Kconfig support
MIME-Version: 1.0
Message-Id: <20260415-ultrarisc-pcie-v3-1-73f06e972616@ultrarisc.com>
References: <20260415-ultrarisc-pcie-v3-0-73f06e972616@ultrarisc.com>
In-Reply-To: <20260415-ultrarisc-pcie-v3-0-73f06e972616@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776237679; l=758;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=Zl1FrIKf17blskhbPmYq7tClMDdF35LMCald+AmIzEY=;
 b=v0urUIZhmDHLcJS8l8hylWgWBx7DszuDyaecCFxXIGZ6mVxW7+E/46bwLHk1u35PH3Re4Nu6M
 nEXFzy8jO5KConmUiFmr1qOiBjw8zKh+HGYFVpQsayt9kaX9OX42VHg
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAnYUKdPN9poSgCAA--.1324S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw45XFy3Xry8GFWDXw4Dtwb_yoW3GFg_G3
	4xJ348uFyrAFW8uFZ8Wrs3WFyrAws8WFy5Gr1ftryDu34xXw1xW3yDKF10yw1Uuw15Xa1k
	XrWfAr4fAry3tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbQAYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVW8JVW5JwA2ocxC64kIII0Yj41l84x0c7CE
	w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF
	7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4
	xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCa
	FVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI4
	02YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IY
	c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
	026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF
	0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0x
	vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
	6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRIoGLUUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQASEWnfCz0AFAAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_002140_204163_08A3B90C 
X-CRM114-Status: UNSURE (   7.56  )
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

The first SoC in the UltraRISC series is UR-DP1000, containing octa
UltraRISC CP100 cores.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 arch/riscv/Kconfig.socs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index d621b85dd63b..0b4d06a7b4bf 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -84,6 +84,12 @@ config ARCH_THEAD
 	help
 	  This enables support for the RISC-V based T-HEAD SoCs.
 
+config ARCH_ULTRARISC
+	bool "UltraRISC RISC-V SoCs"
+	help
+	  This enables support for UltraRISC SoC platform hardware,
+	  including boards based on the UR-DP1000.
+
 config ARCH_VIRT
 	bool "QEMU Virt Machine"
 	select POWER_RESET

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
