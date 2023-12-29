Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B0EC46CD4
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 06:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zzH3Fkw7Yn1UA1T+p84i66mulrXYpPNhYWw8bqeLVCU=; b=liPmzFwe/Qa4c+
	hzZbMNugaVa/VljEFRzwKJxq6testzgFZsikZzWJQYG3zLda4htds584gAZVPjnjRsXzdL6yg4q7S
	REAVpyjCjPQf+LhIjNBovWJ/3N14xHBwlZzCo4PwtpeALw9Ic6BmuOx2JSPIBlOG2r9BYR58gu28Z
	NzQYev7Ef2uLrJI8I1EmFHCs2t0ceFUSnX9K9RxIHNt+ezwYEibLhHY2yLBlk6KKyKqpEzHIDm/Ft
	v3BcAWI18V1rsSd7C/u5HEjxctg4g7jbNHRlZdQYzxOD6f3grReHi12z8Yc7wcVKP3EiNJbckfK88
	oqkJjMv0T7EE0V0wtoKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ6lu-000KjZ-0h;
	Fri, 29 Dec 2023 06:55:06 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ6lq-000Kc0-2D
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 06:55:04 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2EBAE80B2;
	Fri, 29 Dec 2023 14:54:17 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 29 Dec
 2023 14:54:16 +0800
Received: from jsia-virtual-machine.localdomain (175.136.135.142) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 29 Dec 2023 14:54:13 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [RFC v1 0/1] Enable SPCR table for console output on RISC-V
Date: Fri, 29 Dec 2023 14:54:04 +0800
Message-ID: <20231229065405.235625-1-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [175.136.135.142]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_225502_893384_0911658A 
X-CRM114-Status: UNSURE (   8.22  )
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
Cc: aou@eecs.berkeley.edu, jeeheng.sia@starfivetech.com, rafael.j.wysocki@intel.com, conor.dooley@microchip.com, palmer@dabbelt.com, paul.walmsley@sifive.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch will enable the SPCR table for RISC-V.

Vendor will enable/disable the SPCR table in the firmware based on the
platform design. However, in cases where the SPCR table is not usable,
a kernel parameter could be used to specify the preferred console.

This patch depends on Sunil's patch series, as indicated in [1] and
the corresponding Qemu patch can be found at [2].

[1] https://lore.kernel.org/lkml/20231219174526.2235150-1-sunilvl@ventanamicro.com/
[2] https://lore.kernel.org/qemu-devel/20231228080616.158822-1-jeeheng.sia@starfivetech.com/

Sia Jee Heng (1):
  RISC-V: ACPI: Enable SPCR table for console output on RISC-V

 arch/riscv/kernel/acpi.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
