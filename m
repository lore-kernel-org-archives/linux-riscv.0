Return-Path: <SRS0=v6lb=PE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673E0C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 03:22:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED3AE60F48
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 03:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED3AE60F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e/e13HG2L6O/9DQemIYpbGz4PpXhPr5h84FY//ipklE=; b=ysZ7M5eCmEITZD
	fPE/rOUcIe/r/0sCgMOwmKhOsMgWmxGs1xzHqU4xqtKTDS21It0zIZc4aVfT8Tv8XUtvZPxqPSHCb
	KkJaiRfvQXzdBEJo8bDPtnpBMNToILjcL+m8lONYo388iLrvyHRtaTO7SABDblTG9h2RyDZ3jxzDe
	rzyHEQUlkwENq/qp6J7a8xmxhvcPGYAoQfc1kVPjFN7HEXl+QNvV4Q/NSfUCg9nRCE+qr6puHK1WR
	qv+4aRrjfY2EA5HmFgzYhFCBJBJejGp6L6W44ZtgPbWd+3AGmzAB/oApT2CTyLtGJ+4dFcY8njvc2
	NtQVfc3ZfVF/4GP77K2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbaH3-009deN-8p; Sat, 16 Oct 2021 03:22:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbaH0-009de0-Lj
 for linux-riscv@lists.infradead.org; Sat, 16 Oct 2021 03:22:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E173260F48;
 Sat, 16 Oct 2021 03:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634354533;
 bh=Jf4L74iJt8dTh8+70BoRRcla4hHCR7ElnQB8sFYGcQ0=;
 h=From:To:Cc:Subject:Date:From;
 b=TSVkR/fgejh/cc4vYhED/Qlpf3/2unMW6voGAbNb/MWFPJtsb488Fed0Q5qSTJ67z
 zbbFzCiv8ijfff+1FyFaMUv1GA4Gi/h5Cy7xgIUpGLUszqsuQayZOMrAHFoNaZNPOp
 SBADtxVg8xSKutdPcIn6d29R3rmIjd+I9S0Il0Mb2ypvgTP4DzdPgK6nWOZSQoJPsX
 a5yM+mJ5ZKCGDPecDvQ8F4Wa9VAbaL4F+c/RmrdSpUpPVKzRJhZW+IoHGEoZGEU5D/
 eJSPiR79qbZf7VBWGjKPv6M3YHuLK/qQ8wcMWIlvxbGNoqoisFt7Q+Q92NTZSbCGz+
 hdj0sKglCDzhQ==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com, heiko@sntech.de,
 robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 0/3] irqchip: riscv: Add thead,c900-plic support
Date: Sat, 16 Oct 2021 11:21:57 +0800
Message-Id: <20211016032200.2869998-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_202214_755471_9CB97E0B 
X-CRM114-Status: UNSURE (   6.50  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Add the compatible string "thead,c900-plic" to the riscv plic
bindings to support allwinner d1 SOC which contains c906 core.

Changes since V4:
 - Update description in errata style
 - Update enum suggested by Anup, Heiko, Samuel
 - Update comment by Anup
 - Add cover-letter

Changes since V3:
 - Rename "c9xx" to "c900"
 - Add thead,c900-plic in the description section
 - Add sifive_plic_chip and thead_plic_chip for difference

Changes since V2:
 - Add a separate compatible string "thead,c9xx-plic"
 - set irq_mask/unmask of "plic_chip" to NULL and point
   irq_enable/disable of "plic_chip" to plic_irq_mask/unmask
 - Add a detailed comment block in plic_init() about the
   differences in Claim/Completion process of RISC-V PLIC and C9xx
   PLIC.

Guo Ren (3):
  irqchip/sifive-plic: Add thead,c900-plic support
  dt-bindings: update riscv plic compatible string
  dt-bindings: vendor-prefixes: add T-Head Semiconductor

 .../sifive,plic-1.0.0.yaml                    | 11 +++++-
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 drivers/irqchip/irq-sifive-plic.c             | 34 +++++++++++++++++--
 3 files changed, 44 insertions(+), 3 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
