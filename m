Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C59C5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 15:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JkKZrJyJ4MfopMt/Q9zj46MdZj9c2Rm9IJ5ns/7dMlU=; b=B5dQX9dWu0PfdT
	/ebXUW7hP+z/fHgwXpaM+Fe/uvxn4t4T9l4I/IkDEwDCDNsJShEd/0pQYyUapT4mGA7Uu900uar08
	YRPeQsikq2TYvFI2imr9NzCuUzaLo2X4wiiJbczalUNkRyjo0SRR53XnwXV9f+lVZss3MkXlOjhZ9
	SEjY/gszebNoTJQJRey0EWsjkESXurpo97DWg0MCcra1UuUfNjxFKt/MPIDLXlYTUsgjSaPnLMlYj
	VtV576a+bie3Ub59wlMVoVakA8bdSTyvYQms+vTNaspQ3i3X6KDbIQI9ziljVpELNLsPZYtZcCyPK
	URT19ZZYSOXjFozK6gCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXdC-000000014Sg-0JH6;
	Thu, 13 Aug 2026 15:46:10 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXd8-000000014S0-2Rzt
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 15:46:09 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAAHofS55n1qSnx6BQ--.20274S2;
	Thu, 13 Aug 2026 23:46:01 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2 0/3] ACPI: RHCT: validate nested node references
Date: Thu, 13 Aug 2026 23:46:00 +0800
Message-ID: <20260813154600.58861-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAHofS55n1qSnx6BQ--.20274S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF4kZry8Jw1kuF4xXF1DZFb_yoW8Zr15pr
	W5ua43trykJF4Ikr4ayw4j9a4fuw4fJr4aqr93Ja4xZF90yFZrA3W0yr18uF47uF93t347
	Xr4jvFsrua45u37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8Jw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbo5l5UUUUU==
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_084606_993784_E93E407D 
X-CRM114-Status: UNSURE (   6.29  )
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

RHCT consumers walk the firmware-provided node area and follow hart-info
offsets without proving the corresponding extents.  ISA and CMO consumers
then read the referenced type-specific payloads directly.

Split the checks into independently reviewable layers.  Patch 1 validates
the table and node envelopes.  Patch 2 validates each hart-info offset
array and requires references to identify exact non-hart node boundaries.
Patch 3 validates the ISA string and CMO payload before use and publishes
CMO values only after a complete successful walk.

Changes since v1:
https://lore.kernel.org/all/20260706094619.83121-1-pengpeng@iscas.ac.cn/
- split root, reference and type-specific payload validation
- bound iteration by node_count
- require references to exact non-hart node starts
- enforce the RHCT rule that isa_length includes a trailing NUL
- avoid publishing partial CMO output after a later malformed node

Testing used Linux 3d6d817622b0 plus this series, GCC 13.3 and QEMU
8.2.2 for riscv64.  A temporary KUnit harness in rhct.c called the
actual static validation helpers; the harness is not part of this
series.  The acpi_rhct_bounds suite passed all three tests, covering
truncated table and node extents, invalid hart offset arrays, interior
node references, invalid ISA strings, and all-or-nothing publication of
CMO values after a later malformed reference.

This did not exercise a platform-provided RHCT table through the complete
boot-time discovery path.

Pengpeng Hou (3):
  ACPI: RHCT: validate table and node extents before traversal
  ACPI: RHCT: validate hart-info offsets and node references
  ACPI: RHCT: validate ISA and CMO node payloads

 drivers/acpi/riscv/rhct.c | 251 ++++++++++++++++++++++++++++++++------
 1 file changed, 213 insertions(+), 38 deletions(-)


base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
