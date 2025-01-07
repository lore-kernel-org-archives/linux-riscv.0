Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8950E77197
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 08:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPP5hZVE0Q1gYaAqXVZupThsVLyKwPXg4KkwRNdBPCg=; b=UliCP8A4Odfd4s
	O97hAkAZwe1y8pNjQWyCDnpoKmqT2ULmnQ3VmojxpfThc5Qdrdd3Fx9hk1l6TtFS7mSAIcUSyxh64
	RXD//ON2TlV0pW1kpLBw6yTdZEI0nB2nVzLo18TKXsxTGhQIPWiiiZX3BFqDNzZjuAi3wp2bC+Pwo
	uuDNCIXNMscw5HnlTm0jQbX/cqIdE3bK/8Kpl36Vaq9UiUkIpA/jb8I/l3hSRjzkNCNpdhRpFP2NP
	kQ/6zvCHrtDUuWemPZypJyfRXRquNXMrudU+GEzdNVixC4MxncVQjqWsxyQGTB8w0jbYKC13u2qT0
	zzeR4Q1qJypD4aUYgeEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4XG-00000003pz3-0h6X;
	Tue, 07 Jan 2025 08:01:58 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4UY-00000003pLX-376z
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 07:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1736236750; x=1767772750;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fBr6IvrWAIt92fEjHNUs0+eiYdi+M4dIBjTX67pF7is=;
  b=JXf2k4xxz8NfWYKVMt6dT2wPOIQzPLIBp4WcbFZkNJdpR9FKkoG00EQm
   CEsNpQQJ9xa87PkFCuFhhs1mlaTu1LnElDJjPm//BXtDfO1jFUfNLzdN6
   q48uHp5qtBzREsiELHDm6lBbxCx2pg6gyWObE5de/ztX5Fi91sA/qYddX
   IcxMmHlNqJ2FA9nnmh2CtlvnqGSPnZa5EJ1HYgMf0vA2uRLd6inVnqtMl
   2Ri5rjB2JGtL2IKpjWJI4NKYbYh8zrF//+wkDgdpXB/chkJVlAKStw33q
   RSlgLoAAGsnp3COO+s/ioaxxLwEpUE6mQ7iyiSIIzvFkE8JSeUMA5Yu4l
   g==;
X-CSE-ConnectionGUID: JoHGUEqwTRmW2M1c00aqNA==
X-CSE-MsgGUID: /g5EMdVuRh6iDF8fCBUsHQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 09:59:05 +0200
X-CSE-ConnectionGUID: HWZkBmgTRO6/RViEMJ/Txw==
X-CSE-MsgGUID: HR3F4vnPQOajRJ+UsE4rLw==
Received: from unknown (HELO epgd022.me-corp.lan) ([10.154.54.1])
  by ces02_data.me-corp.lan with SMTP; 07 Jan 2025 09:59:02 +0200
Received: by epgd022.me-corp.lan (sSMTP sendmail emulation); Tue, 07 Jan 2025 09:59:03 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	vladimir.kondratiev@mobileye.com
Subject: [PATCH v3 0/2] riscv,aplic: support for hart indexes
Date: Tue,  7 Jan 2025 09:58:33 +0200
Message-ID: <20250107075835.1421602-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <CAAhSdy0U3VXqKK-pReUSo5PYJhr0YGoO6pT194Me0Q18dHbE9g@mail.gmail.com>
References: <CAAhSdy0U3VXqKK-pReUSo5PYJhr0YGoO6pT194Me0Q18dHbE9g@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_235911_101344_9651D031 
X-CRM114-Status: GOOD (  11.94  )
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

Risc-v APLIC uses "hart index" to access data per destination hart.
Current implementation assumes hart indexes are consecutive integers
starting from 0, while Risc-V documentation says it may be
arbitrary numbers, with a clue that it may be related to the hart IDs.

In all boards I see in today's kernel, hart IDs are consecutive
integers, thus using dart IDs is the same as indexes.

However, for the MIPS P8700, hart IDs are different from indexes,
on this SoC they encode thread number, core and cluster in bits
[0..3], [4..15], [16..19] resulting Soc consisting of 3 clusters *
4 cores * 2 threads with hart IDs:
0x0, 0x1, 0x10, 0x11, 0x20, 0x21, 0x30, 0x31, 0x10000 etc.

Change default hart index to be hart ID related to the start of domain,
and add optional property to configure arbitrary indexes.

Use of "device_property" API allows to cover both ACPI and OF in single
code

1-st commit adds dt-bindings, 2-nd - code

Changed from v1:
1. use as fallback logical indexes instead of hart ids
2. refactor code to avoid unnecessary memory allocation

Changed from v2:
1. change property name to plural "riscv,hart-indexes"

Vladimir Kondratiev (2):
  dt-bindings: interrupt-controller: add risc-v,aplic hart indexes
  irqchip/riscv-aplic: add support for hart indexes

 .../interrupt-controller/riscv,aplic.yaml     |  8 ++++++
 drivers/irqchip/irq-riscv-aplic-direct.c      | 25 ++++++++++++++++---
 2 files changed, 30 insertions(+), 3 deletions(-)


base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
