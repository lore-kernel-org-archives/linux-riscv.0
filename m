Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E15E77197
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 11:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q+j7drvdQBmQgmuNWCAolgVK2xPTkT4Y5ksxhL8Keck=; b=UaIIyIjrU+rZD5
	XRe8jZd3uAajg0tiQxVz/Z5WEtFXGFfeq59HvDNF5AZOxisLh8H3hXN47rZz1K+buahGBnZ8IxIad
	E+M1Y4m7X7tD38gpVBT8RulU/vnUYVk5bQ6XZv6gw9MoQtVhx6qjCBjYb/VhCoGykQfNW4076PbsA
	xdKH6T0jKs8JUcPed8eHcik0AfyKJ+zsr5NvYDCdHN4XUz0ubf8aGQrDvNr/AZJ6cGRbWJ/lE2DBJ
	ymcyswsVj1qeC0KpjcVmiNBQ4P6kEwqYKQw2a5SWrjkEgkMl0ozqMFf7YD5BiDbCDUZxhxJ4eJeYP
	b10izZBAzXU2vEwrs1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqs9-0000000BkN0-0RW2;
	Thu, 09 Jan 2025 11:38:45 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqs3-0000000BkLA-3hBZ
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 11:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1736422719; x=1767958719;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dka7ZTLMgJA2Fmf33NNRki5hYKAGIfRms5XWjqtdZaU=;
  b=TkLJv+ir2wt/L8K46J7dVu5bRL45lL2le3QOprIVFRIj7V/9D0wP4eTC
   +yeyfBhx17rcu4qP9BEy2jIopkOeuGHxZl32vg9N2rWx3Im7om5xIXtgl
   6ED2Bq8g9Fscl7gUYARQe4Oql0LoLmK9YlnleCnHuWxHpNwZclJEpqOmW
   SkQ7Hu9GySlgxSWadOldrBYPCsbxdPr+0lk2ki5v1HxaS8usYG8XYbKMz
   fKUUp3OpvwSPlPSLoZqTpJvzp4Z74CxMyK2QwY/byskF0tYnnyjgVBsvr
   sYz2LgvASwfKq7djw+teWRgGVUu3D8bSJ+A/VJxB17Kpkp8QvLckTK6Q/
   A==;
X-CSE-ConnectionGUID: PazOQ6j0QqSKvsQjbqYa/Q==
X-CSE-MsgGUID: lsGi0u+ATG29qMPbimlcTA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 13:38:34 +0200
X-CSE-ConnectionGUID: Ce2P3xx7St2Hj+QgzBw11g==
X-CSE-MsgGUID: 459YEkpiTZeDW5oJCxJPVg==
Received: from unknown (HELO epgd022.me-corp.lan) ([10.154.54.1])
  by ces04_data.me-crop.lan with SMTP; 09 Jan 2025 13:38:32 +0200
Received: by epgd022.me-corp.lan (sSMTP sendmail emulation); Thu, 09 Jan 2025 13:38:32 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v4 0/2] riscv,aplic: support for hart indexes
Date: Thu,  9 Jan 2025 13:38:12 +0200
Message-ID: <20250109113814.3254448-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_033840_433989_714B641C 
X-CRM114-Status: GOOD (  12.18  )
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

Changed from v3:
1. added missing recepients as per "get_maintainer.pl"
   no other changes

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
