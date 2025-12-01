Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02A7D116F1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pWmszHLVynLfSHcrTpI0CuZMzYhITJQ/wYCUITLLsTk=; b=DxkYthS0ezD6ie
	qVsYCJxeAP5kd+WKthivIBA3D8i43UzgrgmSLHKiX8qHI/7y1eMv77gICh5MsGONVXNVL22wLcZMi
	X1Hqe5QhyA8ZGGbNaxUF01VG+gs4kA1/EcbYKjou2Buj+8PfPVujgpaPhkdIXQjAZtSxtPNB2uZ4f
	dxTwFJrQeEY9qZf7S904fvoFVevYsADl4hNyFsgn3ZfaR6wvW3a3XxBta2w3b+Taj3xFYmBTGNRSo
	EEL7Nnegrooo++7oNUsJN3XzFush0KKSjtQGXxN/WI/PAtxu3isH0yMXgwIF+y4I2Xo4ECz9ysaD9
	oTfVsGGPq4vasDe/QTpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1W0-00000003NHG-07J1;
	Mon, 01 Dec 2025 10:52:20 +0000
Received: from mx-relay19-hz1.antispameurope.com ([94.100.132.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Vv-00000003NDz-3eHW
	for linux-riscv@lists.infradead.org;
	Mon, 01 Dec 2025 10:52:18 +0000
ARC-Authentication-Results: i=1; mx-gate19-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=K96yAKM+xcrHhzOcR0zBqIliZQSixR1YCX/rN6x1xxY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764586325;
 b=WvbzFGHeAOiuDtdqKd/kLqzS4JatPjayrfxJ8I5WsH8ILvmg9X0wHsRsBqxYaY/x2ZZ0Xqo5
 faS/b62caEkt8QZ3sDWiNgCi7PFQ7gseLbzgm6qmum/aHFQC5iirFEapzZPNgzbIvt+R/HEPiWY
 YMi81wzvekxMouzibDJ+VL8iMF+U2wONHYrx3Cn6V6iGUo32zxCzqgJtG8auA5tHbFAPYIPRiQI
 GKB2ABSvYg5XLB7u0Fy8+hMt7d5Tk0xIgUybZ++U8IFtRlcTWQOmGc/Y1zg1zxP+xNKF0Dn5obQ
 gG6jOL9L5CdJjozkDa+/sCNmoGT1Woan123Jujp3Kp7PQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764586325;
 b=ih4x19gBhVJN88ETA/lCsEbh7ryzLk/2APe5Y7BsKGHRRfRE0ZErSdAeblNHuvxyG/Cp7ZSQ
 Nmt8BrcVKbwlkBOa+a5Ce/L8FuuQs4iWn2Nj3j+40DEbSe3MCMutxCjeJ0Wcekj3AHCL2nCx49i
 wVnr2x9I7XItfEN3EZhTCLG6olC914TNTF1nn/UawmuCKNuiCrYyzrYbn8xv35piOgHrIiQT+tV
 /3fQoj2u6on/lUuaY6B2LVqVC26/fhN3DnyEvx6Vh+9l4KrdUERbSJoiJ9kqvQn2Z0BzTOjqPs9
 A6NwJvULqA4M6I/e1lCXBTOE2N5hsIe4Tp3EqnRpTt/Qw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay19-hz1.antispameurope.com;
 Mon, 01 Dec 2025 11:52:05 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AA9ADCC0DC2;
	Mon,  1 Dec 2025 11:51:52 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 0/3] ls-extirq platform device conversion
Date: Mon,  1 Dec 2025 11:51:39 +0100
Message-ID: <20251201105144.539450-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-riscv@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay19-hz1.antispameurope.com with 4dKgh927gRz3DJLr
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 690fad471cfd5f66c6a94f5d6552821d
X-cloud-security: scantime:1.904
DKIM-Signature: a=rsa-sha256;
 bh=K96yAKM+xcrHhzOcR0zBqIliZQSixR1YCX/rN6x1xxY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764586325; v=1;
 b=RAJwL1wGRxY2DhbXp4sw/YDwr2dwjK25A0QNyjVLDQz0VU88LroUiJhn3BS0g1JjKtJ+wsCp
 nguzYHJCgnsoEjs79F4gtuQHkGap5G5vqVfpgKgWYSfcZcBficr07okQH2mdNZC1f75LAvGQ1Ln
 mNKHXUQS4LM47H7WQKTKKAVj31u2DYjTTY7E02N6MHqBKdQCRbGqUZc0xU7nrCp5CWCS2NPDJtS
 uRe5//iZ5g3yfOeMexIu8Ua0BXDHchn2z1ZOXPkvN9u0ewIaT3IRz0mp0ijW/0/Efj4B97A0bzX
 6zlvgpOI2rqfalxtRej+WDvNttk97qAp0gXHVczjoVAEA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_025216_057647_F0374771 
X-CRM114-Status: GOOD (  13.11  )
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

Hi,

this RFC tried to address the problem that sometimes at time of probing the
parent IRQ domain is not yet ready. This results in the error message:
> irq-ls-extirq: Cannot find parent domain
> OF: of_irq_init: Failed to init /soc/syscon@1f70000/interrupt-controller@14
>  ((____ptrval____)), parent 0000000000000000

Probe deferral is only possible having a platform device so the driver is
converted accordingly. It is inspired by commit 8ec99b033147e
("irqchip/sifive-plic: Convert PLIC driver into a platform driver").

Because the interrupt-controller@1f70014 is a child of a syscon node, it is
not probed after platform device conversion. So it has to be moved outside.
This DT change has to be done for all layerscape SoC .dtsi
This is an incompatible change and I don't really know how to address that for
now. I've done it for LS1088A as a proof-of-concept for now.

Comments if this is the way to go or a different approach is more suitable
are very much welcome.

Best regards,
Alexander

Alexander Stein (3):
  irqchip/ls-extirq: Convert to platform driver
  irqchip/ls-extirq: Use managed resources
  arm64: dts: ls1088a: Move extirq outside of syscon

 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 42 +++++------
 drivers/irqchip/irq-ls-extirq.c               | 75 +++++++++----------
 2 files changed, 56 insertions(+), 61 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
