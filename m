Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C589ECD98E1
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V41WMBDtZv0mU5NaxRjoyOzzhJPQk99CzuGF2EUOjAM=; b=orRONadZplGZg8
	iR5mQ3X5LUJtYJ92f8fKverxWlXIMnfRlk3RAdBJQo2ZYZc11wAlrL1R2bsgjKPz6XiExCt5hgw/4
	eGyE000o8ugjpKBKnsiRMNdKXeGoXSTx9DaHFxBvZZLsO4pQwALY1Mw8VquY14ZK1HKhy4TX+yvjP
	UkIFwl3Sk7JcPkLlj1NnEMBFStfrWU4/dRxXzey/aNwUvRoY+RkXMcmgM53R02uB6iF0yqB5bwAFe
	3mSECImawBerAVFAV1PfhCVjkMLZPikqNwndn4GOcacY16jPx7cufwCwELoVfUz0kJeyA+z+4woVH
	vimI50KMy2gUgkGdyQrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUCd-0000000FsCv-0f6y;
	Tue, 16 Jun 2026 13:51:43 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUCZ-0000000FsBp-2BC5
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 13:51:41 +0000
Received: from [127.0.0.2] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAA3VdzjVDFqj0rvFA--.12812S2;
	Tue, 16 Jun 2026 21:51:31 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH 0/2] riscv: acpi: Enable ARCH_HAS_ACPI_TABLE_UPGRADE
Date: Tue, 16 Jun 2026 21:51:30 +0800
Message-Id: <20260616-riscv-acpi-table-upgrade-v1-0-45902d2dedf9@iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOJUMWoC/y2N3QqCQBBGX0XmuglXcCNfJQx2x9Em8m92lUB89
 7bs8sD5zrdBYBUOUGUbKK8SZBwSmFMG9HBDxyhNYijywubWWFQJtKKjSTA6/2Jcpk5dw9j6ku2
 VSt9aC2k+Kbfy/qVv9cFh8U+m+O39DeV5SZ/x0MC7wEhj30ussvVyNqhk7tsO9b5/AF6pKbCrA
 AAA
X-Change-ID: 20260616-riscv-acpi-table-upgrade-fb5e69c5bf66
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.15.2
X-CM-TRANSID: rQCowAA3VdzjVDFqj0rvFA--.12812S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY27AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aV
	CY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAq
	x4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
	42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI0_Jw0_GFyl4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
	VjvjDU0xZFpf9x0JjbTmhUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_065139_952645_4EFAC674 
X-CRM114-Status: UNSURE (   4.60  )
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

I did end up using this for something, so this is probably also useful
for others.

---
Vivian Wang (2):
      ACPI: tables: Add missing #include <asm/fixmap.h>
      riscv: acpi: Enable ARCH_HAS_ACPI_TABLE_UPGRADE

 arch/riscv/Kconfig            | 1 +
 arch/riscv/include/asm/acpi.h | 2 ++
 arch/riscv/kernel/acpi.c      | 5 +++++
 arch/riscv/kernel/setup.c     | 2 ++
 drivers/acpi/tables.c         | 1 +
 5 files changed, 11 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260616-riscv-acpi-table-upgrade-fb5e69c5bf66

Best regards,
--  
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
