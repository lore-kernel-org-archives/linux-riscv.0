Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F221D3CCB3
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 06:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bx1cIwcRgQF6VqNllpSNHbqsuZA6Hx6+IqgReMud0Z0=; b=F5t7w+D9AyJnO9
	cl3T7KeF8AMKjmI7ft2+fUb7fMmOQGyZXUSBSJ5PKyeiSN4hWXKsXo4F4+fjz/jPiU6+xW7h7Lq9X
	EXG3B/mtf0AGPrfIVNdJYIhgkTPHXIiq81kFbIXOqn5K/WCtQgORH/ybPcZ2Ow0Xaa8/beY1X9z5f
	Yl/SdGsN/nrBRkSvjH2tQDnYuSnidyGvPQAnLcMsL3mqTjx5uxkJg6atPG+UJntIbUnDsKeAGy2km
	3PK2DIrRgXdFm5x6rHPDZM4KTyiARjODlI/wDmhkyC0TafLmKpWodM9St8W0gayV8nu9JDcT3Yng1
	3fTSK3gAucWu21VoHdyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGX0-0000000BpJi-3ZAF;
	Thu, 15 Jan 2026 06:08:30 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgGWw-0000000BpIi-0IJa
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 06:08:29 +0000
Received: from duge-virtual-machine (unknown [223.160.207.69])
	by APP-01 (Coremail) with SMTP id qwCowABH7mlMhGhpXOHCBA--.37756S2;
	Thu, 15 Jan 2026 14:08:14 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: conor@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jiayu.riscv@isrc.iscas.ac.cn,
	cyy@cyyself.name,
	dlemoal@kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn
Subject: [PATCH v3 0/2] Initial support for 100ask CanMV-K230 DshanPi
Date: Thu, 15 Jan 2026 14:07:59 +0800
Message-ID: <20260115060801.16819-1-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: qwCowABH7mlMhGhpXOHCBA--.37756S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4ftFy8JF4kJr1xtr4ruFg_yoW8XF4kp3
	y7uFsxGrZrKr1I9F4S9w48Wr15Zwn5Jr1rWw13X3srArWYvry8Crnagw45X34UXr17Cw10
	va15Kry0grWjyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [223.160.207.69]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_220826_487944_E28CE470 
X-CRM114-Status: UNSURE (   9.31  )
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

This series adds initial support for the 100ask CanMV-K230 DshanPi
board based on Canaan K230 RISC-V SoC. There is a module on this
development board.

The board and module are documented, the basic board/module devicetrees
are added.

This series is based on the K230 clock series[1] and the patch 3 of the
k230 pinctrl series[2].

Link:  https://lore.kernel.org/all/20251127-b4-k230-clk-v9-0-3aa09e17faf5@zohomail.com/ [1]
Link:  https://lore.kernel.org/all/20240926-k230-pinctrl-v2-3-a9a36fba4b34@163.com/ [2]

Changes in v3:
- Delet the model and compatible of the root node in the dtsi file.
- Use clock-50000000 as the node name.
- Link to v2: https://lore.kernel.org/all/20260104070911.219588-1-jiayu.riscv@isrc.iscas.ac.cn/

Changes in v2:
- Add a minus sign before items.
- Link to v1: https://lore.kernel.org/all/20251229061318.16756-1-jiayu.riscv@isrc.iscas.ac.cn/

Jiayu Du (2):
  dt-bindings: riscv: canaan: add 100ask K230 boards compatible strings
  riscv: dts: canaan: Add initial dshanpi board DT files

 .../devicetree/bindings/riscv/canaan.yaml     |  5 ++
 arch/riscv/boot/dts/canaan/Makefile           |  1 +
 .../boot/dts/canaan/k230-canmv-dshanpi.dts    | 82 +++++++++++++++++++
 .../dts/canaan/k230-canmv-module-dshanpi.dtsi | 26 ++++++
 4 files changed, 114 insertions(+)
 create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv-dshanpi.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv-module-dshanpi.dtsi

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
