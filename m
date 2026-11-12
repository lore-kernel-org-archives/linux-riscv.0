Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0956D606E956
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 08:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X1g2Ap6O;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kN5Riccv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=w6QIL2LbXNZpf3+wZ/y/2EfWhEDnPZQt7km+g26kwUU=; b=X1g2Ap6OfQ4YzngphnAMT+3KTf
	4ucMyh+kOWDxDj9q8JEf7w4VYIeHSQGzATIuaY7Ei8L/1BC/xaQLQaRFsz/oBUNsQHIGj9UpG40eK
	UwQwnqaHzoweuZpkGbtmwtzMumZdSr85a9rKouPKngpW7Zsf11xz0iwI/oYviPmBDanl1x7ulxqin
	PU05oNz6RUvBFA4510O60hEhjTs2AmSvODxlrzlbnkChhuULCrnBc11/4Adi3+0V+5XrorZr5e7lt
	0m00DeA9Ve8APC866VB1RetjUMS0+g+hfMRIQP4Di2CZKt8ijVhdyQGKuUPgp3IZxMulGwlf3dSe+
	qMumVjug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPxi-000000093Ul-3WqA;
	Thu, 12 Nov 2026 08:15:14 +0000
Received: from out-220.mta1.migadu.com ([2001:41d0:203:375::dc] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPxa-000000093Th-25NI
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 08:15:13 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=h4GvArQMrEiTRwfEHf4rZ5pF+aKj8NBbvpgZjU0P818=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794471304; v=1; x=1795076104;
 b=kN5RiccvttyQa8sBP/UNxvNsXewbaL8IL8SaGD3jUHt5YkfE9KChXdqo/XkmWK+33HyX2O6L
 iSSpCk2T/MuzWWWNVOxCyJStnQbe9pJ4rWcw2N3BSylh1ubnHs0PpFjUWat/ciYPr0YD7w5HbCt
 6D/UezCfNSvnhTvc6TO62nO0=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id bf7d0b889862177b;
	Thu, 12 Nov 2026 08:15:03 +0000
X-Mizu-Trace-ID: bf7d0b889862177b
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Subject: [PATCH v3 0/2] irqchip/riscv-aplic: Use trigger specific flow
 handlers in MSI mode
Date: Thu, 12 Nov 2026 08:14:41 +0000
Message-Id: <20261112-aplic-affinity-fix-v3-0-943d25cfbfad@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NMQ6DMAxFr1JlriuHAIVOvUfVIQmmuEKACEQgx
 N1L6MLA+Kzv9xbhqGdy4nFZRE+eHbfNBup6EbbSzYeAi41FhFGKOeagu5ot6LLkhocZSp4gQx0
 bhaZARWJ77Hrazrv09f6zG82X7BBMYVGxG9p+3qteht0ekBLjs4CXIIESldninlKSqmfNzTjdC
 vIiBHx0UEg8VUSAkFoZK5OZmDJ7VKzr+gPrNSPzCQEAAA==
X-Change-ID: 20260909-aplic-affinity-fix-80a4b30bd03e
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=h4GvArQMrEiTRwfEHf4rZ5pF+aKj8NBbvpgZjU0P818=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlfSxs/BR22lmAruvCvSXB7t6/YlkVKESsbXl5+fIYry
 eeCyKwDHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABN5ysrwV1AtZskZ5zdOM0R1
 ssOaJI9pPxY5ezSmJkDiFe85NvZ7/IwMr3l+/5mwYkHTeoYJH20lJyae6YtIsf/ENFHHZ97EtX+
 TWQE=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_001506_686528_580BF629 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In MSI mode the APLIC handles all sources with handle_fasteoi_irq().
For edge-triggered sources this loses an interrupt which arrives on
the new CPU while the previous one is still being handled after an
affinity change. The fasteoi flow also never calls irq_ack(), where
IMSIC applies an affinity change deferred while a previous vector move
was in flight. Such a change stays pending, and later affinity changes
of the interrupt only update the pending mask.

Use handle_edge_irq() for edge-triggered sources and
handle_fasteoi_ack_irq() for level-triggered sources.

---
Changes in v3:
- Add Suggested-by: Thomas Gleixner to patch 1
- Add braces around the multi-line if/else branches
- Link to v2: https://patch.msgid.link/20261110-aplic-affinity-fix-v2-0-6c143b8b4e8c@linux.dev

Changes in v2:
- Use handle_edge_irq() for edge-triggered sources instead of calling
  the parent ack from the EOI callback
- Use handle_fasteoi_ack_irq() for level-triggered sources
- Split into two patches
- Link to v1: https://patch.msgid.link/20261104-aplic-affinity-fix-v1-1-e538cd76e563@linux.dev

---
Troy Mitchell (2):
      irqchip/riscv-aplic: Use handle_edge_irq() for edge-triggered MSI sources
      irqchip/riscv-aplic: Apply pending affinity changes for level MSI sources

 drivers/irqchip/Kconfig               |  1 +
 drivers/irqchip/irq-riscv-aplic-msi.c | 20 +++++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260909-aplic-affinity-fix-80a4b30bd03e

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
