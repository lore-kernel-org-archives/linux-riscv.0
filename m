Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73BECCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 09:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NWS7vW73xr/rVzdOmLh9gCeDx4M+shqXS91E5cZjRGI=; b=Wr8t6SOOea6KLU
	NMOypp3MSDXqWeoyFG/klN4pHrTJmAIHJiMP3NBnnX9lQjDaSiJB1l2QwLVkEY97cnR5KVTV4feaJ
	kSSHhpWMvUbhbY5fuAPMmyisxJU4ySzgarzEBeR79SInxRaflsEv0WdLH6x5EnIPWRBNBPo8KYl9l
	vLHYL8tHunNaL8J0XOsjjY1YczO9nqFeq1ynD0PQMyTzd8KPT++iSJp6Ba1f8d/0AZ9T7pZx0+TQC
	uOaniVpeDQieeWzHd8rekBL4oB4XnkJjHdzApf3z7d6aGBBMMR+TgWQWPduKX08OfXmRX88rF2jJF
	S8Df6JFeFLkiciWuWAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8xt-0000000GWNY-13rN;
	Tue, 21 Oct 2025 09:47:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8xr-0000000GWNI-30g1
	for linux-riscv@bombadil.infradead.org;
	Tue, 21 Oct 2025 09:47:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CUl4Oz1AaENiLJK0HdSL1flO7p1OM/HO2y+DaZArucw=; b=Nec7en7PHoZa5660hKbcm1qxa8
	reUJZyLmeNA7q/SILMPX3nRcUuryczxLD35/CXqIEwK85bS/nal/82acC+zBjzUL0xV+2EFaHUDY1
	HWAN+zIPTys7wP8pFJEjRNbS2JMyUyWi9sVo0ROWR0wDsG5IPtL1G2F4xVgnTdHEULCa0TF2Gbrgu
	8tVvEpL7pWw0wZB1gdpmltV3qMqAS6UGkt8Ad2q3kM4eAwt3eyrXD9H2CO6E0ryI6udVTsJGqMl2E
	JMVsXQoKW5KGDn6k+0wPAPmx6CSNbAeivYQJIzu4StIKB30H1gXhWJ18vQBM57cfMJsxyU+coahOz
	fc+4gDtQ==;
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB84m-00000000dV3-1Fcj
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 08:51:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761039943; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TDfUGAfYpRcT0urFw9+bzmbLLer4gRTlbNQjslKH4C4uYZCQsMnsLiXhUGWd3VvKbhjax7QtGWaP7UsyrccIdpbYGcRpvKSVAoG+1AH57saR0NPpiqFkKyRZUfHHPN87f/21M68oXf7VLI2mJqbnMZ3IgcOUwqnmsdmA50Twa3o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761039943; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CUl4Oz1AaENiLJK0HdSL1flO7p1OM/HO2y+DaZArucw=; 
	b=Sos5YwWOuUVA+P/vcU/k1y7RDhfa09AeHxTLTLgFAFySMBajsZt3lv5P/zqDI3oQMfdiHs3HGVkrtOgqtnyo0+VLEvujh2sMgISEaxRwhoVYK3pGPvTtYJrldrTvMlG7kVGgv7NfqRcuwdHfcY9a/E+EhQrGCxOwIEFGdcKFfNA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761039943;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=CUl4Oz1AaENiLJK0HdSL1flO7p1OM/HO2y+DaZArucw=;
	b=XqeRRzht9vIjZG8W62JOtVxgaxTApwHwwKO/nUoFQp1ON0T2VWanLPsN6fZh9mHP
	hjVM5oiNuyH+7CQpYc6M1a5a0XyCrqVhfd29IE+IP/nz0bhil217lYG5VG7b3BViQ4Z
	WP5pC5EkM/vo2XbfwbaTLHjSsB2jrqI6Piw/ur/o=
Received: by mx.zohomail.com with SMTPS id 1761039941047323.07553784607876;
	Tue, 21 Oct 2025 02:45:41 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 21 Oct 2025 17:41:44 +0800
Subject: [PATCH v3 09/13] irqchip/aclint-sswi: Add Nuclei UX900 support
MIME-Version: 1.0
Message-Id: <20251021-dr1v90-basic-dt-v3-9-5478db4f664a@pigmoral.tech>
References: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
In-Reply-To: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>, 
 sophgo@lists.linux.dev, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761039846; l=1059;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=aL8VQaPRJAjxauni7+ank2K5a+1YkvZipzoMxURVk3A=;
 b=t89Ai7cypoy3Jeymaxc7PSarsJr/Zf3m7GyW+zepjdaWbL1sFwJacXsafuIBH0i4nzOLUhRdu
 MfnJR8Q/uo0CBuWeCUy7ZisosK7sRWa4yNDIyuTc1aineA4eP3K5Abe
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_095106_987701_61516D4D 
X-CRM114-Status: UNSURE (   9.78  )
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

Reuse the generic ACLINT SSWI probe for Nuclei UX900 since it is
compliant with the ACLINT specification.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/irqchip/irq-aclint-sswi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index 93e28e9f281f64da4568be37dc57b414354c3f56..fee30f3bc5ac252b236078bf13df8c04e7327eaf 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -175,7 +175,8 @@ static int __init generic_aclint_sswi_early_probe(struct device_node *node,
 {
 	return generic_aclint_sswi_probe(&node->fwnode);
 }
-IRQCHIP_DECLARE(generic_aclint_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
+IRQCHIP_DECLARE(mips_p8700_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
+IRQCHIP_DECLARE(nuclei_ux900_sswi, "nuclei,ux900-aclint-sswi", generic_aclint_sswi_early_probe);
 
 /* THEAD variant */
 #define THEAD_C9XX_CSR_SXSTATUS			0x5c0

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
