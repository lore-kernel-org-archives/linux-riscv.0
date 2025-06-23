Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70156C7EE2A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 10:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nnf5RiamYs4O2SHFvb9jnQbYIqmH6an4CsBYpq2wCdE=; b=MjlipMyvoz/Tki
	io+8PMkhKahkNnhA3qlrv9YmDrOQ+sqlNysa57W5dMtMCnUghz0ASPjm8v5m40zvtRk/5AjTZznaw
	8NQdlhoONi5/HzYs10uJ8ZmAX4IWQmjQ407EswOxzAcYwJ8Iuvvz9sPIAOCPrFUAfPmix0QEP4WuO
	mC/nvudzvSI0Of3eydQPaBcrD4Nx5YZ+1gLic6NxX3pUXSU8zZMjIvBKtV0vmGIZc23OfQll/WjpS
	cIzx/h/VrPn1sge0m6M0nvAUaRS0zPaLTCFz7VtGM8Ft5BLTsHURQTLH1wlflWhzY46HkkAywKcAl
	sxjSa12wr+kazhl2BzNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeqk-00000002SHx-0tdy;
	Mon, 23 Jun 2025 10:56:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTe2k-00000002HkQ-4524
	for linux-riscv@bombadil.infradead.org;
	Mon, 23 Jun 2025 10:04:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=px0JDHMuvIs5J8ueukKFGsVsoS8QJ3buHClyteYqIzg=; b=ReCzVpAzdyQ39w53Wl3WX9ZA5M
	lZYX2On1zkQIU9R5gyQrf5Q1mGJi81A6buM2Augp6bJD3oySD9zkx9dBs0h1NYSozmcEo1gWxpdD1
	dzjSODR+xXQ24bd4ifdWdFWO2rYd81e+mdVSIHdeU9MsNp8bSC6fyWD4MmPFBKAXrNjXZAB0zl+Oe
	O9/j+5bCG/h+5HkrsDJRRhiMGnYSlcVspMBBDHmAJukSsSI3NUjeGxKBzDDu2EyTeF6oR6KPsHNO7
	NgIsR8VYedJ7Naels1vTkNSUAuDkQIdxMC2FIetishwrwD1xPnuCOgow4YRWiIr2sAnWjPROcBY+A
	P8HuLT3A==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTe2f-00000005BBy-1sFZ
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 10:04:50 +0000
Received: from [127.0.0.2] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAD3ptWtJlloxg+rCA--.29805S2;
	Mon, 23 Jun 2025 18:04:30 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH 0/3] riscv: dts: spacemit: Add DMA translation buses for K1
Date: Mon, 23 Jun 2025 18:04:15 +0800
Message-Id: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ8mWWgC/23PTW6DMBAF4KsgrzsIO/wFVVXuUWVhxmMYVeDUQ
 2irKHevAXXX5RvJ73t+KKHIJKrLHirSysJhTkG/ZApHOw8E7FJWpjBVUesaPjS4yUJ/FxKIHuG
 Lb3DqqbGF9mWDrUpPb5E8f++179eUR5YlxJ9dWfV2/Sts/i9cNWjAllCfje991V5Y0EpuMcdZX
 Z+HEenznhYvB6R6KwQYpomXLlvrPK2NqLc9E4nY/S9d9rrLlTmBMRsubkQ+wJoK65zzTXkuLwP
 NSwh5iMNbAp+/R12YhioBAAA=
X-Change-ID: 20250616-k1-dma-buses-rfc-wip-3be7a01f47c8
To: Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>, 
 Ze Huang <huangze@whut.edu.cn>, Alex Elder <elder@riscstar.com>, 
 spacemit@lists.linux.dev, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowAD3ptWtJlloxg+rCA--.29805S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr1DWF4UAFyfXFyUWw1ftFb_yoW8Ww1kpF
	WfursxArW3trWIkFs2k3y2vr1rKrsYgF4UWrnrKwn5JFsrZF4qvrWI9r4xCryDXryru342
	vr1vqr1kWF42ywUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUnXo7UUUUU==
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_110446_060437_BE41033E 
X-CRM114-Status: UNSURE (   5.41  )
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

The SpacemiT K1 has various static translations of DMA accesses. This
series adds all the DMA translation bus nodes and also moves existing
nodes as necessary.

According to SpacemiT DT maintainer Yixun Lan [1], it's preferable from
a SoC DT maintainer's perspective to have this done at once instead of
spreading these changes into various driver series. Once this is merged,
life will be easier for future users of the buses.

This series contains no bindings changes.

Patch 3 moves the eMMC node added in [1].

These patches can also be pulled from:

https://github.com/dramforever/linux/tree/k1/dma-ranges/v1

[1]: https://lore.kernel.org/r/20250623070147-GYA193822@gentoo
[2]: https://lore.kernel.org/r/20250523-22-k1-sdhci-v1-1-6e0adddf7494@gentoo.org

---
Changes since RFC
- Reworded patch messages
- Also moved existing nodes under relevant buses
- Link to RFC: https://lore.kernel.org/r/20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn

---
Vivian Wang (3):
      riscv: dts: spacemit: Add DMA translation buses for K1
      riscv: dts: spacemit: Move UARTs under dma-bus for K1
      riscv: dts: spacemit: Move eMMC under storage-bus for K1

 arch/riscv/boot/dts/spacemit/k1.dtsi | 314 +++++++++++++++++++++--------------
 1 file changed, 189 insertions(+), 125 deletions(-)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250616-k1-dma-buses-rfc-wip-3be7a01f47c8
prerequisite-message-id: <20250523-22-k1-sdhci-v1-1-6e0adddf7494@gentoo.org>
prerequisite-patch-id: 53fc23b06e26ab0ebb2c52ee09f4b2cffab889e2

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
