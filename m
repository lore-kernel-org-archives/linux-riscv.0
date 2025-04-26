Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF113C369CB
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 14:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u4GWmZchl3I2zMhL6hvXUUYPrEiHvRbUNKnXlAQWeJA=; b=FfkD8uCkWRDHG3
	lSKGR2n5/sZS4Y3YkTt7xSOOulfbe+724Bqzk9axpNYEDEBoSENrubxCpsRnhCv/zCKRvYt1KVKoW
	YBfHrA9fZBgt1nZo0KQbvnDix5zYj99K2oNdvzyPUoLhiEno9nJwzrHaMuD5BilvhxE/G5m0JL7pi
	3n78T69mzTy8tRlTlQRuGaIrwvbEq1L0l8Rxw3dniWQ3qH5JfB1eEj7XXdKIxO+L7onH/0FmU4iVC
	tw52WQJzZikIzjtuqhzQYkjcBrdqVAeKSW8zaa8rA47tSdOZ1mzSubIU8Tvrs65FvbPk/Lg5R8oj9
	p/OcBHFVEY5dwWMoWaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8gxc-00000002BdZ-0xx4;
	Sat, 26 Apr 2025 14:56:56 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8gxY-00000002BZ4-3szP
	for linux-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 14:56:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1745679397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GICB4BFYHCXkZcWANyav9UTGwPzsmDF0x+dfscxZ+3E=;
	b=V97VpETThcQMI2V6pF8NhEa6hJbzknZuXEklIlmiA3b0ryvgW4Ki8dI3NbrTDsRvdx+oJH
	SCOxyM6iqtdWcFQQ+wUd9mHMuIhgZxbJaBUsH9kieekgvikhAWiJGEKFXi9UD4d8pRduE4
	ZXq983R6AJ+HS2XHOUoPOF8jIkkcZKnnjfh8HmydHdhLeQoHra/VtZqX6NiPrlbcb08RC+
	8taQ3XUXyhgwNVsbmd3GiaHCdteW8BXeIB7pbU6rY9I1KQAEgBUZp5jXnrBD7AZOYQqFkQ
	N37TMYVibwe0Q/scWSR/urLfgOuB/Kdq0EORg9SPenxHXvjFtKdZjpJGbZYabA==
From: Ignacio Encinas <ignacio@iencinas.com>
Subject: [PATCH v4 0/2] Implement endianess swap macros for RISC-V
Date: Sat, 26 Apr 2025 16:56:17 +0200
Message-Id: <20250426-riscv-swab-v4-0-64201404a68c@iencinas.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABH0DGgC/23MQQ7CIBCF4as0rMUAU2px5T2MC6BTnYWtAYOap
 neXNia2xuV7yfcPLGIgjGxfDCxgokh9l0e5KZi/2O6MnJq8mRJKCxA7Hij6xOPDOu5q6UxpjfX
 SsQxuAVt6zrHjKe8LxXsfXnM7yen9ZKRYZpLkkkNZaYWtRDTVgbDz1Nm49f2VTaWkltqstOKCN
 xpc1VTWGan/aPjqUsBKQ9bg2p3QTS0Q4EeP4/gG6i983iMBAAA=
X-Change-ID: 20250307-riscv-swab-b81b94a9ac1b
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
 skhan@linuxfoundation.org, Zhihang Shao <zhihang.shao.iscas@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 linux-arch@vger.kernel.org, Ignacio Encinas <ignacio@iencinas.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_075653_109010_A85144E5 
X-CRM114-Status: UNSURE (   9.35  )
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

Motivated by [1]. A couple of things to note:

RISC-V needs a default implementation to fall back on. There is one
available in include/uapi/linux/swab.h but that header can't be included
from arch/riscv/include/asm/swab.h. Therefore, the first patch in this
series moves the default implementation into asm-generic.

Tested with crc_kunit as pointed out here [2]. I can't provide
performance numbers as I don't have RISC-V hardware yet.

[1] https://lore.kernel.org/all/20250302220426.GC2079@quark.localdomain/
[2] https://lore.kernel.org/all/20250216225530.306980-1-ebiggers@kernel.org/

Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
---
Changes in v4:

- Add missing include in the 1st patch, reported by 
  https://lore.kernel.org/all/202504042300.it9RcOSt-lkp@intel.com/
- Rewrite the ARCH_SWAB macro as suggested by Arnd
- Define __arch_swab64 for CONFIG_32BIT (Ben)
- Link to v3: https://lore.kernel.org/r/20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com

Arnd, I know you don't like Patch 1 but I tried your suggestions and
couldn't make them work. Please let me know if I missed anything [3] [4]

[3] https://lore.kernel.org/linux-riscv/f5464e26-faa0-48f1-8585-9ce52c8c9f5f@iencinas.com/
[4] https://lore.kernel.org/linux-riscv/b3b59747-0484-4042-bdc4-c067688e3bfe@iencinas.com/

Changes in v3:

PATCH 2:
  Use if(riscv_has_extension_likely) instead of asm goto (Eric). It 
  looks like both versions generate the same assembly. Perhaps we should 
  do the same change in other places such as arch/riscv/include/asm/bitops.h
- Link to v2: https://lore.kernel.org/r/20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com

Changes in v2:
- Introduce first patch factoring out the default implementation into
  asm-generic
- Remove blank line to make checkpatch happy
- Link to v1: https://lore.kernel.org/r/20250310-riscv-swab-v1-1-34652ef1ee96@iencinas.com

---
Ignacio Encinas (2):
      include/uapi/linux/swab.h: move default implementation for swab macros into asm-generic
      riscv: introduce asm/swab.h

 arch/riscv/include/asm/swab.h   | 62 +++++++++++++++++++++++++++++++++++++++++
 include/uapi/asm-generic/swab.h | 33 ++++++++++++++++++++++
 include/uapi/linux/swab.h       | 33 +---------------------
 3 files changed, 96 insertions(+), 32 deletions(-)
---
base-commit: a7f2e10ecd8f18b83951b0bab47ddaf48f93bf47
change-id: 20250307-riscv-swab-b81b94a9ac1b

Best regards,
-- 
Ignacio Encinas <ignacio@iencinas.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
