Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C94FE77188
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 09:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ELpQaURo9NlNwlXpmJ4nybS1cuWxQRylT5G3bS+QGKU=; b=1LkkxRKafAfc4O
	YoELMe36YsxHZMoLwQTgr7mehBHv0/+EzMLugY9AzwZUxzkFOxnc635NRWxYZRSYfH+0drcyxmOkJ
	/fPlcSPCjvQTl61lCk5yWJHvyozmrH37ASFNhQp47QaKCUzqx0/+hGwEjBUVqmTDKtIh2D4Av8BX5
	MyFyVzz0HqWfgmyIw89nmPWgnhIxboTMEsax9kCZRWVG8yI7MA02uRjMhXUcHxJ7jQJXBuZb3Pz4g
	xedn2BE2nWiM1jYYGQAeqETa7hWYubdfylwH9myCzPNuKVn2mTE+nNWdy3YQN19JPSlFtX3kx+b1L
	gJ4AEbt+6Ze0KM0aTe8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHlp-0000000A521-3qzS;
	Thu, 02 Jan 2025 09:45:37 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHiE-0000000A4RL-2xWe
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 09:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1735810914; x=1767346914;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2zzU1qIoc31ZxpIqcFHFn0R0jWbtnU669SZ1Ly0R+B4=;
  b=fp2uHgrdidCikPkfyzLGpDzV4WEB/fhzs//uLbbY8l54ls8X+klhlCiX
   5uQmuIqsNs+VIdl6l91Yjx+GIDhWDtH/IUEtq6Xt566tFCjLmFP2hGSBm
   7zg83calbXaP3SKBWK7Prs9i+eRYDZ1WpvrIJDgS3wvblH/Lr3aKjKlSL
   ry+6FIK7I1QabJgWyP7371k1mwLfvyXbsqzQbWKcl6PniPMSJlBqvwfnt
   53SHvGfao643w7RxlnP6i89bfMqxTp0G1Lazjnk62Y45jkvCYfYWUToZ6
   xES3MMwmBfKeU5FIUE94XMF4bvMbJAf/oVGHls6zt7VbCXrOLw20zeKPI
   Q==;
X-CSE-ConnectionGUID: kxEyuG2WQk+Yv0T7tzaTxg==
X-CSE-MsgGUID: 1sHerJG1T9+lOpNjoUln1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 11:41:46 +0200
X-CSE-ConnectionGUID: XmEDXW+NQNOHdxV+GB9uHA==
X-CSE-MsgGUID: Wi1+sUveSrm5p2zvmO83IQ==
Received: from unknown (HELO epgd022.me-corp.lan) ([10.154.54.6])
  by ces04_data.me-crop.lan with SMTP; 02 Jan 2025 11:41:44 +0200
Received: by epgd022.me-corp.lan (sSMTP sendmail emulation); Thu, 02 Jan 2025 11:41:45 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 0/2] riscv,aplic: support for hart indexes
Date: Thu,  2 Jan 2025 11:41:14 +0200
Message-ID: <20250102094116.3847894-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_014155_145477_51801DE9 
X-CRM114-Status: GOOD (  11.90  )
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

Vladimir Kondratiev (2):
  dt-bindings: interrupt-controller: add risc-v,aplic hart indexes
  irqchip/riscv-aplic: add support for hart indexes

 .../interrupt-controller/riscv,aplic.yaml     |  8 ++++++
 drivers/irqchip/irq-riscv-aplic-direct.c      | 25 +++++++++++++++++--
 2 files changed, 31 insertions(+), 2 deletions(-)


base-commit: 5bea460cb3a4118c3914e5ce2787736a32365859
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
