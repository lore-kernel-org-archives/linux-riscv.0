Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1B0C00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 16:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTVsbWYVlxtLzon2yEGg64tgb10KutGEcsDfRCXLmNI=; b=yf1RVSMv3yQJ7j
	9Yx+HYDyTDQ4vGAkFnY3k4lgoxUaJDps+YhVE7k/XLJWVBWKGgQPAtM7ztE+MhiFUxZdGZmlgNJYh
	CW7R4j03RTh3eAPLAbPnWsopK6wEOHDJUs2n33FTAzf6Fz4lOdgJOYwuFrweOcJTVvPI9UTaKAgpc
	vQRtVhlUjwsjqxBffszZABJ2DnGsiRtBLgKn5UEfQGYXsTsrwVqC/uIRoKs3BNXwrKpAk8vhhNtjq
	cJBwUcz0WXF5qptLToJpcMq2v6v1n0mBJuYGHgomstit9Bjz+6ogVi96TWzxSu2+ocD4LHrZ82Jl/
	AlD/sf5QEc5dac7EARYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvKIU-00AUAg-0J;
	Tue, 24 Oct 2023 16:30:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJC0-00AHTo-2d;
	Tue, 24 Oct 2023 15:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=IrQZezcTHlwAvEdDZH0HquaGmdYgypjcTSeB2SVxIp8=; b=miYNLtH8O3HjO97zmZ3nnOKcRu
	r72f6AaLmlPL1jUEA8B3wy8/SYMc3+08SWACtcq3Bv0ltBetKh2LE1DOx0MI25vKVlCqwPcp3nXmY
	Dyiz2DbcYwZkaBNGkd5lI7dw8ndcEgfr9+Kn1RXGYdjVvE/LNb8MjEnnIUPSiv6L1iubMbR3hrW14
	TUpfXDfCkfZDaQBtWGTt1NlkM28COd5BgDl4/qvo6/sCIRzHRhQ5Gtktp2X+vSA8oHHU36exeANZR
	g3SLKsFuvMAQfyh33Y5NdqRqoPK+EXiNoD74fTdUqzqsU1KGJaLMzCAYDbNjiPs1UOeFpYIsQ9foK
	q/AS2GDQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJBx-00FbNu-2R;
	Tue, 24 Oct 2023 15:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IrQZezcTHlwAvEdDZH0HquaGmdYgypjcTSeB2SVxIp8=; b=ZLONfC6WIs7Ij54XVAv7c/QGCA
	vqH/kxgJ1eh0L7IWmUpkaOGf0QbZl3Z6u31V5GVERfwMxbxrpRMMcIvbkk4zj58w7hHpuuLMujAbB
	nFipclESZIW3joZ2gmKp58KUZmUlRPnuPWtJUT16jpWJVCt+HB6MCPrdWZB4Xur8kUA50fBDaKIBc
	vAf2dpyZWdj43dSGgsANyFNqvQUMSr+lIgpcxsmgNdX3IooRH5MLu1ChijgvRcMWiX1UnyP7qE2JD
	tTtZcOTEl7FdiQpKaZv4ADOKvHZUO8YQGqxDBaiu/fsjiogPoQqV/0W6VyJQvV2PqCKRwWRh9je6W
	O2GAfj9A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44356 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJBo-0004Xf-1h;
	Tue, 24 Oct 2023 16:19:28 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJBp-00AqSc-W3; Tue, 24 Oct 2023 16:19:30 +0100
In-Reply-To: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: linux-pm@vger.kernel.org,
	 loongarch@lists.linux.dev,
	 linux-acpi@vger.kernel.org,
	 linux-arch@vger.kernel.org,
	 linux-kernel@vger.kernel.org,
	 linux-arm-kernel@lists.infradead.org,
	 linux-riscv@lists.infradead.org,
	 kvmarm@lists.linux.dev,
	 x86@kernel.org,
	 linux-csky@vger.kernel.org,
	 linux-doc@vger.kernel.org,
	 linux-ia64@vger.kernel.org,
	 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	 jianyong.wu@arm.com,
	 justin.he@arm.com,
	 James Morse <james.morse@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>
Subject: [PATCH 39/39] ACPI: processor: Only call arch_unregister_cpu() if
 HOTPLUG_CPU is selected
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qvJBp-00AqSc-W3@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:19:29 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_161937_845214_FB84DF2A 
X-CRM114-Status: GOOD (  10.98  )
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

From: James Morse <james.morse@arm.com>

The kbuild robot points out that configurations without HOTPLUG_CPU
selected can try to build acpi_processor_post_eject() without success
as arch_unregister_cpu() is not defined.

Check this explicitly. This will be merged into:
| ACPI: Add post_eject to struct acpi_scan_handler for cpu hotplug
for any subsequent posting.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/acpi/acpi_processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 539412ff59a1..5bb207a7a1dd 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -549,7 +549,7 @@ static void acpi_processor_post_eject(struct acpi_device *device)
 	unsigned long long sta;
 	acpi_status status;
 
-	if (!device)
+	if (!IS_ENABLED(CONFIG_HOTPLUG_CPU) || !device)
 		return;
 
 	pr = acpi_driver_data(device);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
