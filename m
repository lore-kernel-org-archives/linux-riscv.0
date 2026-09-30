Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85132CA5FC1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 18:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wc/p8ihyI65WUu3dZn0aB1Zl0PIiPS5Gvtw0US5lxIg=; b=hswir5c6Cq6/+b
	+ZgS9cpUgX9JJ0B1YKBO9l9Eo3noJjhrJl0vG9YiikM22U6kP+ekqIaRdRGvudkIQHzlcJVDXILM1
	Pl1iCg6NJxSMDy6kMDnW4E3FL4qUW2p/CRaP9BuhQtt6QFIKUXLb4zWTNwf29rI4iH3i/exmiUdCH
	LH7/nhR7czumKtSHr+Jk6wXnmKGIeT5gytpK6wsk9Os4C9aMAXY+T5OjSWErGOaKVfYFTvDx+WKUg
	RAYFep56+E6jnWS2TXshJTLNUZ3pFfhsVdqwDwpmH7fj6S6tsTaM9qEhGHNAESaeQo32Qdr44Kk29
	i7jtGdvXz+nXxKr0R+gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByxh-00000006xer-3WLZ;
	Wed, 30 Sep 2026 18:23:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByxf-00000006xe7-2OuZ
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 18:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=1ljz0pj77qs9HLTxoE3cvdESMGn3xH7T5tOHv22BW6I=; b=EW15yOKX29rGiXtl+SlhMij+J8
	Vva/5k/5nwlY7/06zIDSfVHGqyQLnYU+EKTQzr9XWD4xr0nYhUCYCp43xUg2Mfk2u/Lb7HdjOyzRh
	M115WSfDqTnbfFMlcr7jf6+Ylb5LKwx/f0uXIeGiUAIun4MgJoC8fRWTOd81+mWGMpe+9bkVwZluj
	t/qRCPdHJRBTyenE/Hv1tHo6PaKffTgTYMeeWnQwXgqaIdZBfenSKGIs9zAThz7XmgmdMBUB1+Gqm
	+33zWHVu8bFLcIujOYUoX0WaIuCcdwTlHEqusQBCXr9TcSp8bPZ24RvMdPESM7tN5z8tcyQk7f3rH
	OGtAyLBg==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xByxb-00000004BwZ-0W1j
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 18:23:22 +0000
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-01 (Coremail) with SMTP id qwCowAAHofR9U71q8y58CQ--.14027S2;
	Thu, 01 Oct 2026 02:23:02 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Subject: [PATCH v2 0/4] spi: sophgo: Fix SPI NOR errors and clock limits
Date: Thu, 01 Oct 2026 02:22:49 +0800
Message-Id: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHlTvWoC/3WMQQ6CMBBFr0JmbUk7AWxdeQ/Dok4rzAZIxzQY0
 rtb2bt8P/+9AyQmjgK35oAUMwuvSwW8NECzX6aoOFQG1DhoZ67qxbuSCXW3y8Yq+IB2cGifhqA
 6W4r1cPYeY+WZ5b2mz5nP5rf+K2WjtOrJ9cFTh87bOwt5aT21tMBYSvkCO/ZeBqwAAAA=
X-Change-ID: 20260917-fix-sg204xspi-dad286928b1c
To: Mark Brown <broonie@kernel.org>, Longbin Li <looong.bin@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>, Hangfan Li <lihangfan@iscas.ac.cn>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowAAHofR9U71q8y58CQ--.14027S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1xGF4DKFW3WrWkur17Wrg_yoW8WF4UpF
	4xAanxtw1xGryfAaySqrW2gF93Gr95GF1UJr13Ww4rZwsFvry8WryIkr4IgF9rXr48J348
	KrZxJFyrCrnFvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0pRHUDLUUUUU=
X-Originating-IP: [223.166.93.127]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiCRQGDGq9GDh2-QAAsr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_192319_647874_155C3479 
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
Changes in v2:
- Advertise the controller maximum speed and use the fastest divider when
  the optional maximum speed is omitted (Mark Brown).
- Rebase onto Linux v7.3-rc5.
- Link to v1: https://lore.kernel.org/r/20260917-fix-sg204xspi-v1-0-5c95dac429a8@iscas.ac.cn

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
 drivers/spi/spi-sg2044-nor.c                       | 56 ++++++++++++++++++----
 5 files changed, 77 insertions(+), 13 deletions(-)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260917-fix-sg204xspi-dad286928b1c

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
