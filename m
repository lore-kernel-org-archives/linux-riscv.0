Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90605C982D8
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 14:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hjn9UaldV9HUxeHS9v0Qppbu66bP4aO4fBkr6Mche/k=; b=EU7RDQCvZS9vVi
	EL1PYQtK0fpyrOFNXGvcV8CKM2cP/jNU1ytQGX1Rofv+iAJ5nD+yIej3QVhHXzzz3NY1aCZSEOdMp
	ylbAu7M1CbqL0mRc8aPPu+Lmz2dQHI3nBTuDbSkn/5hqLwnYZFMBeu1IRbCJAj+0Cj9cj9mV+76Fn
	+HdU6aF30BnfPhb499YSgQALa9AQ744uXL8HpdUY+tiQm85UUiQOqVz/GX9RTIpSFyRY7tCZDOTFI
	xizamVGeypXA6XjnzKj44saFi0JvFQ1QEoTMTwc8HND7WobY1kpuulmFllGpMFyPVfdTYzzF+r+mi
	xknhA/G8zPDPghp/zLcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7D7N-0000000BXFg-1Huy;
	Thu, 17 Sep 2026 14:29:41 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7D7H-0000000BXD0-3vjL
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 14:29:38 +0000
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-05 (Coremail) with SMTP id zQCowABHtD5A+atqNnqCCA--.4692S2;
	Thu, 17 Sep 2026 22:29:25 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH 0/4] spi: sophgo: Fix SPI NOR errors and clock limits
Date: Thu, 17 Sep 2026 22:29:18 +0800
Message-Id: <20260917-fix-sg204xspi-v1-0-5c95dac429a8@iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD75q2oC/x2MQQqAIBAAvxJ7TtAlKvtKdDDdai8mLoQg/T3pO
 DAzFYQyk8DSVcj0sPAdG5i+A3+5eJLi0BhQ46itmdTBRcmJeiiSWAUXcB4tzrvx0JqUqQn/b93
 e9wMVhb6AXwAAAA==
X-Change-ID: 20260917-fix-sg204xspi-dad286928b1c
To: Mark Brown <broonie@kernel.org>, Longbin Li <looong.bin@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
 Han Gao <gaohan@iscas.ac.cn>, Hangfan Li <lihangfan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: zQCowABHtD5A+atqNnqCCA--.4692S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1xGF4DKFW3WrWkur17Wrg_yoW8Gr43pF
	4xCanxtr1xGFyfAaySq3yIgF93Gr95GFW5Gr13Ww4ruw4qvryxGr92kF1xWF9rXr4rJ34v
	krnxJFyrGw42vFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0pRiSdgUUUUU=
X-Originating-IP: [223.166.93.127]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAMNDGqr9nAGrAAAsj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_072936_383851_7E22407B 
X-CRM114-Status: UNSURE (   5.82  )
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

The SG204x SPI NOR driver ignores transfer errors and clock limits.
Fix both, enable SPI NOR on SRD3-10, and use 12.5 MHz on SRD3-10 and
SG2042 to match EDK2 and the vendor kernel, respectively.

Tested on SRD3-12 at 12.5 MHz: both flashes identify correctly, SFDP
reads succeed, and two full 64 MiB reads per flash match.

The SRD3-10 patch supersedes the earlier submission [1]. Please disregard
that version, which used a 133 MHz flash clock limit.

[1] https://lore.kernel.org/all/20260902-sg2044-dts-v1-1-aa1fd1a4ec0d@iscas.ac.cn/

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Han Gao (3):
      spi: sg2044-nor: Return transfer errors
      spi: sg2044-nor: Honor SPI clock limits
      riscv: dts: sophgo: Limit SG2042 SPI NOR to 12.5 MHz

Hangfan Li (1):
      riscv: dts: sophgo: Enable SPI NOR on SRD3-10

 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts       |  4 +-
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts       |  2 +-
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |  4 +-
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts      | 24 ++++++++++
 drivers/spi/spi-sg2044-nor.c                       | 52 ++++++++++++++++++----
 5 files changed, 73 insertions(+), 13 deletions(-)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260917-fix-sg204xspi-dad286928b1c

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
