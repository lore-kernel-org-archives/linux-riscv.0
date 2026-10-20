Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CAF606A325
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3gvI0Had;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=Zwt3shgM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/x2yxCz2kXBA9jQTL3i6uXXlKdbQIDyoT5JcmGl3Zg=; b=3gvI0HadjYrxhF
	sQnY1YMyQp4QuhqH5QsZn3NSs1Ns/UVZH6YwMARPIRaKaVBL8Siqomiv7/wScIWUuuKfkxmpSH1as
	pP72ZoC3DJvtKoN8XA9waoaI1fziRt37wcjgbvrxiOtfBaSAfNs/H8v2SPHa7rQf7mPqcbtVh78Hn
	rrwFjqdi83I9VM1dNxGEbdo46oI7IufrJLrG7JhZ4Mzs6+tYSmG8JNHLjT2xDbZy+6uytZml8K9ki
	YUk4ZuhnExNCOzJpT2+toT9ugx9n6iD4mPrCgd89DayQB3JIatLASrIdzenKT65iY+spbr6WPuN89
	dsMOdl81ppUkMME3nIXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBvu-0000000A4eW-3Qgh;
	Tue, 20 Oct 2026 15:39:22 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBvn-0000000A4dF-2S77
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 15:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1792510761; x=1824046761;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=14bpOD0CALcJBHTTmAKQeDaGQ0pZ38ju38hDe+pPRH8=;
  b=Zwt3shgMX0HMkW6RhFJ+dUs4Qv6HzsOKmalHobetbaXBsM8rIMbXP9zF
   M+JmYuBRkHD5sEh6hgziGOb5sfJBPwvm8SG4U65eh8x40iotB+oyskoYb
   Gxay6Oxm57vB+HEX4iXHEnGP5tr86DztM7CWMkMybsjuLPo49EUfvAxaS
   /Jc0wBNd0QRJtRhCucDXUatsKBSRNwH9zVtQqHnlFKw25BcNmlnVIqCgS
   bikHNhTkP/3siOY7Wt8+E9tacAXuoD62fTUGSi71Idw80Q2O92AL/Wh1Q
   ztph5/kIx73B8LGkGCWhW9ctZP9497N87ho7AnbjcUNYv9Kmlr/jc+lGB
   g==;
X-CSE-ConnectionGUID: a8G1fX0CR7KW1QSEKLpIuw==
X-CSE-MsgGUID: xXPPEzi8QqefMRAkAha8kA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 18:39:19 +0300
X-CSE-ConnectionGUID: OBcHHMnaR1ydp+p9Dua8Nw==
X-CSE-MsgGUID: ya/pOhRWT3ek/Nt0gSKgLQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces04_data.me-crop.lan with SMTP; 20 Oct 2026 18:46:48 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 20 Oct 2026 18:39:11 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Tue, 20 Oct 2026 18:38:48 +0300
Subject: [PATCH v5 1/2] irqchip/riscv-aplic: do not mark the syscore
 registered flag ro_after_init
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261020-aplic-async-probe-v5-1-c4861c2aafca@mobileye.com>
References: <20261020-aplic-async-probe-v5-0-c4861c2aafca@mobileye.com>
In-Reply-To: <20261020-aplic-async-probe-v5-0-c4861c2aafca@mobileye.com>
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Jessica Liu <liu.xuemei1@zte.com.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_083915_894218_CDE66535 
X-CRM114-Status: GOOD (  12.45  )
X-Spam-Score: -4.0 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

aplic_syscore_registered is marked __ro_after_init, but it is written
from aplic_probe(), which can run after init. With MSI, aplic_msi_setup()
returns -EPROBE_DEFER while the MSI parent (IMSIC) is not ready, so the
later successful probe writes the flag after it has been made read-only.
That write faults.

Drop the __ro_after_init annotation so the flag stays writable.

Fixes: b330fbfd34d7 ("irqchip/riscv-aplic: Register syscore operations only once")
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-riscv-aplic-main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index d9afb6ae98cf..5369078f3d00 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -116,7 +116,11 @@ static struct syscore aplic_syscore = {
 	.ops = &aplic_syscore_ops,
 };
 
-static bool aplic_syscore_registered __ro_after_init;
+/*
+ * Not __ro_after_init: probe can be deferred (e.g. MSI mode waiting for the
+ * IMSIC) and complete after the init memory is made read-only.
+ */
+static bool aplic_syscore_registered;
 
 static void aplic_syscore_init(void)
 {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
