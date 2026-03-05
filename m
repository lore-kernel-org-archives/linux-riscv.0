Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C18EEF332
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 09:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xmlw7stuCdnxwW2T+/P8V80nmDDlGEKBLSyvpnbmxQs=; b=FY6MCIAh4VRprO
	ZTUu0OY12G96bdKfuE3irFq0HCl2emh28RBTzI6EZX+rXiVRoKxXCNmjjIsGHs6+0/KRDCr3PZsCw
	SWKNsu+XLeU4OyrekpknTbrLR/xZAyJGnYBRrUDBrsfEgrKuQVXoeC+mMhNv7OVmQWVswVirEL7ck
	CfOQRyixdJHkOn0oDGTVG/W9SmOjXYww/A6zpix4/Sef9SuVLcPDYjgG/6g/dvObnjUUVoQ/ua8fo
	60bsazE/Y8HAYyK3r+VHz+u9f3+M9Ny3cLNeNKpghTq1HqlJEualp4g3qnwWRPoRRxsQ6qDtiv1bw
	qWzPTbpe37Fr0xSGLmmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4nz-00000001LU6-2SK9;
	Thu, 05 Mar 2026 09:15:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4ny-00000001LSy-1YVn
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Mar 2026 09:15:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=PxsI37iS2BxXGfnxoputHv/D8WyK2PTEUtaF0Qm3b8o=; b=BQxY2ZTl47XtrM3mHPU5towsb1
	rRYvdBsWa7RejdNvQaWyvGQr2pk29d8xkcID8YVMJw+b41ziL8h6zsQnKyz759hFbiK6+kFhSiJgq
	fhMzx+ug1rmKkn7RPu8Y5OD4MR4eqUaLM2OD+HKv0IaWIk7HEjd9uw/gk1U+Rw467yqY6CP7YXXIv
	UJS7dx/x2SBYnJSQx2wuN4y7eI6RZa0DVkVS7+cJ3TD8SWTPpKVMZgPferVeD9E15VO4V28E/IxQS
	pD5polp2qn9HFiESIuRj4Fc0yObO7+4ZobzDrDjsExHdytVIDW3UU/EqVcwxgFUTUkI4sG1sDEsOs
	R+oiJ9rQ==;
Received: from m16.mail.163.com ([220.197.31.2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4nu-00000006IjB-3tl0
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 09:15:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Px
	sI37iS2BxXGfnxoputHv/D8WyK2PTEUtaF0Qm3b8o=; b=jB6FEq58f163Pappkl
	Bulw1dwN+HmE+ZMg7xLKgjO/Ajqi2vm/aRLj8S3JV0X8imdbtdKsr8c6kdifrxaK
	wuhfh3HYQIfk09F2SvX3Pt9hicXI0MpoX/fsfQcP841tNftf/+u2pJYgr3oVn4dQ
	MZTwyfQlKdRjaCqS1BrkaIGeA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnBLh8SalpRcKuOw--.51670S2;
	Thu, 05 Mar 2026 17:14:38 +0800 (CST)
From: "rom.wang" <r4o5m6e8o@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sean Chang <seanwascoding@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Yufeng Wang <wangyufeng@kylinos.cn>
Subject: [PATCH] riscv: acpi: update FADT revision check to 6.6
Date: Thu,  5 Mar 2026 17:14:33 +0800
Message-Id: <20260305091433.83983-1-r4o5m6e8o@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDnBLh8SalpRcKuOw--.51670S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur1DJFyrCF1fGF13ZFy5Arb_yoW8WFWxpF
	s3ursYqrWrGFs3Jws3tFs5Za18ZFnY9w4Sgr4xGa45CF47Gryjvrs5GFW5uay2yrn5G3ya
	qFWjgr40yw48Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U65lnUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: 3uurkzkwhy0qqrwthudrp/xtbCzR42q2mpSX6HbgAA3Q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_091535_615314_2C6E30AA 
X-CRM114-Status: GOOD (  13.04  )
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

From: Yufeng Wang <wangyufeng@kylinos.cn>

ACPI 6.6 is required for RISC-V as it introduces RISC-V specific
tables such as RHCT (RISC-V Hart Capabilities Table) and
RIMT (RISC-V I/O Mapping Table).

Update the FADT revision check from 6.5 to 6.6 and remove
the TODO comment since ACPI 6.6 has been officially released.

Signed-off-by: Yufeng Wang <wangyufeng@kylinos.cn>
---
 arch/riscv/kernel/acpi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 71698ee11621..ff681db9f4f1 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -85,12 +85,12 @@ static int __init acpi_fadt_sanity_check(void)
 	 * The revision in the table header is the FADT's Major revision. The
 	 * FADT also has a minor revision, which is stored in the FADT itself.
 	 *
-	 * TODO: Currently, we check for 6.5 as the minimum version to check
-	 * for HW_REDUCED flag. However, once RISC-V updates are released in
-	 * the ACPI spec, we need to update this check for exact minor revision
+	 * ACPI 6.6 is required for RISC-V as it introduces RISC-V specific
+	 * tables such as RHCT (RISC-V Hart Capabilities Table) and RIMT
+	 * (RISC-V I/O Mapping Table).
 	 */
-	if (table->revision < 6 || (table->revision == 6 && fadt->minor_revision < 5))
-		pr_err(FW_BUG "Unsupported FADT revision %d.%d, should be 6.5+\n",
+	if (table->revision < 6 || (table->revision == 6 && fadt->minor_revision < 6))
+		pr_err(FW_BUG "Unsupported FADT revision %d.%d, should be 6.6+\n",
 		       table->revision, fadt->minor_revision);
 
 	if (!(fadt->flags & ACPI_FADT_HW_REDUCED)) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
