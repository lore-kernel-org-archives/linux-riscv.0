Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25BECCF2C2
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 14:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gdM7fSYvCZFivhmLtvzy7gHyrfBgLgpyTkHZZbCKKtI=; b=DA39krbxpHShgR
	c83qrQz1LjRKrIW2Te5HBMarCxF+Ez2tPGEPPt7o3XcJ3knv4W0RM7Dc6NHgQYPPcbiPyqSZVPLhS
	wkq25A9f8Z3P8XZVwF1KHCEpJ76WR0uxiLkCA9BxBu+m3R2l7JKwLxIfVTQkeRZ3w+VJxjfuWPrWJ
	NTOBC+xM+R1A1GutUOfZldQCA2SSo5FbObGRrW5ujq6lj0QZmg48AGkKb1N7NhKIMACLDBpEih03X
	/PRDCx2d1cIz6zRRzkMkVZZrFS0/FURO78b4GZ+dKpsME7e+MgNswBZh+VDlRz3qDQXl6sNm9jRKq
	v6bG76hwiFvNOh04ydlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHigv-000000036pg-2w8k;
	Fri, 16 Oct 2026 14:13:49 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHigt-000000036ni-3TYw
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 14:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vG
	PKAAvIykdWCb82ySAm6qx8CUU1UNqtkq4LYigUlmA=; b=bIhFq+yS1ZnQ0HXWh2
	VK9Psy7NSuLafi5WOCzWr7bcmhQ4tToKeszhjag9Yqz/ClxnnfNLhbApzeExAP24
	LQTcHHxLCnX8FiT93YvpDgH8EWh0OdcPFFzlxi4ar0BjVITCv317uTPmcV1zSOaL
	yxQ0kqaMne4UgQTpNRlORapbY=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCX5Hj5MNJqeorFAA--.36405S2;
	Fri, 16 Oct 2026 22:13:14 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/2] RISC-V: validate ACPI MADT entries before use
Date: Fri, 16 Oct 2026 22:12:46 +0800
Message-Id: <20261016141249.2791819-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: PCgvCgCX5Hj5MNJqeorFAA--.36405S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFy8Cw17Ww1fGrWxZF1kXwb_yoW3AFg_ur
	ykKr9rGr1DC3Z7tF10krsIvrWfGayDJr1UA39IyayfJFZ5trn0vrs5tFy8ZFy09an5twn5
	Jr9xZr43Zr129jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUNVy5UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRqZ02rSMPqtzwAA3N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071348_279003_967AC61F 
X-CRM114-Status: UNSURE (   5.51  )
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

RISC-V ACPI initialization passes generic MADT subtable headers to
RINTC, PLIC, and APLIC parsers.  These parsers currently access fields
from the fixed-size records before establishing that firmware supplied
the complete structure.  A truncated MADT entry can therefore cause an
out-of-bounds read during early interrupt and CPU setup.

Validate each typed record before its first field access.  The first
patch fixes the CPU RINTC parser and the second covers the PLIC and APLIC
interrupt-controller parsers.

Jiale Yao (2):
  riscv: validate RINTC entries before use
  ACPI: riscv: validate interrupt controller MADT entries

 arch/riscv/kernel/smpboot.c | 6 +++---
 drivers/acpi/riscv/irq.c    | 6 ++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
