Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2F2C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 06:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Cc:Subject:Mime-Version:To:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uqql2WFl/SdleDjozbC6mXgMzNde9pgij+7hBkCLyJk=; b=FCp/Ll8UTLnenE
	1E0N6IL3DBcJDMUOtg6rVh3Ru9UhnsCdd9jVnFoXnXpTqN0Lyhq2q2f//yFxyNpX50oh8cnaOgptU
	kFTZKt8PCzBgvTnsz8wWdM2hbWDFJ7pyMP37yE2b30TfyW3gHv4yxIkmj7JogzH8r2kAn14brHNbO
	0GQz6GSxQIoqpsBM7JWORLbEmWBrWsfIySNlmVZ7oSzZLhIAHNNOdi1wk3NSl8fg8yvtVB3xeflrx
	f9PuGKoXVfxpX+VoDW2TSIssnkttXSI2g9YF8XjC8H7rgClPrtSVdgngYkVwwFp45uIJZjAsW6YTe
	nIcTPUBG6L35BKaon4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRke-0000000FtRZ-0yun;
	Tue, 30 Jun 2026 06:15:20 +0000
Received: from va-1-112.ptr.blmpb.com ([209.127.230.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRkb-0000000FtQW-2Eea
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 06:15:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1782800107; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=qUY9LF1Vb/OCHQFZaL8yTCCkimmNJyu/uR6gvcnbILc=;
 b=exm+zM95rifu5gbQNLC20xlYdLqaqC2t0jc8ecMCHu9ohvZ0T4bQUebIZxH5Onc5rwyE7X
 rF+L+5QKv3VHhb7Ho6icjZ8/9JTJ48oTLyvvBkiq/2a5HqyFnuojFMNuNgQQpmEudnmgBZ
 WXOfp8iiKWLR2bBunqqimpH20qsIe2bdS6u6H15aJmwLvhGqc+GU7MaFiyGi911BGYlEEU
 xKyH1GeOs0v6XFJr5Cqqa4WLtqIPTaGnro3ETDuVha8FF5XTnPu+CBeP1+u/WHaJlXUeWP
 ydOceOVUhwihsPW4t/9Fduh/ZKf49LTewqIcl4XcM3wFaMbrHtv4L0BlPlQWgw==
Message-Id: <20260630061445.2191731-1-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
To: <rafael@kernel.org>, <tony.luck@intel.com>, <bp@alien8.de>, 
	<guohanjun@huawei.com>, <mchehab@kernel.org>, 
	<xueshuai@linux.alibaba.com>, <lenb@kernel.org>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<jonathan.cameron@huawei.com>, <fabio.m.de.francesco@linux.intel.com>, 
	<leitao@debian.org>, <jason@os.amperecomputing.com>
Mime-Version: 1.0
Subject: [PATCH v2] ACPI: APEI: GHES: Mark ghes_in_nmi_spool_from_list() as maybe unused
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a435ee9+aa3cd8+lists.infradead.org+qirui.001@bytedance.com>
Cc: <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, "Rui Qi" <qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Date: Tue, 30 Jun 2026 14:14:45 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_231517_651639_EE3E692C 
X-CRM114-Status: UNSURE (   7.92  )
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

When CONFIG_ACPI_APEI_SEA and CONFIG_HAVE_ACPI_APEI_NMI are both
disabled, ghes_in_nmi_spool_from_list() becomes an unused static
function and triggers -Werror=unused-function in some configs, for
example riscv defconfig with APEI disabled.

Mark it as __maybe_unused to silence the warning while keeping the
code available for configurations that use SEA or APEI NMI.

Reviewed-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Hanjun Guo <guohanjun@huawei.com>
Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
Changes since the original submission:
- Resend with corrected Cc entries:
  linux-acpi@vger.kernel.org and linux-riscv@lists.infradead.org.
- Add Reviewed-by tags received in the original thread.

Original thread:
https://lore.kernel.org/all/20260316082842.84356-1-qirui.001@bytedance.com/

No code changes.

 drivers/acpi/apei/ghes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 3236a3ce79d6..48f915ee5a0d 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -1397,8 +1397,8 @@ static int ghes_in_nmi_queue_one_entry(struct ghes *ghes,
 	return rc;
 }
 
-static int ghes_in_nmi_spool_from_list(struct list_head *rcu_list,
-				       enum fixed_addresses fixmap_idx)
+static int __maybe_unused ghes_in_nmi_spool_from_list(struct list_head *rcu_list,
+			       enum fixed_addresses fixmap_idx)
 {
 	int ret = -ENOENT;
 	struct ghes *ghes;
-- 
2.20.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
