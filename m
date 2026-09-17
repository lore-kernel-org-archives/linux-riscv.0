Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFB5C982CD
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 06:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6KfvHudzE8f91ZZeggn8oeU91RCFM5UY/Fj+LujPlZE=; b=349xgjygLqHyYV
	crg7k8MXUXeVVNAkfp+shUO3KFyEhIzMn7R+OIcXw9jtCudWYo+H6yWXgpBU2Z/g3oFVMZ/t1gQaW
	rY3Hic69EDuYpOtbQC5Gme4dyTXVB1AgAJrEpdeLnv+NreUcI/btVQnlGerHq+wRI1ZqwdNrhpYp+
	w9IRqXsHqQ2pmym1eem3Zy4frvITw0bK3MhOfjG/sOTv1f2M0YDp7+t/JmSlGpY/kDDt49maaX3Mg
	alPi0B6DfQInycTWRL5zX/TtopnMOBvyZgtaMmtbBhO9gCapLu0NKHL+OG0KtnN5uDV8wmN6wG0Nr
	S9uhUjH4VR9pmCgS4isw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75XM-0000000Aeh4-1QK3;
	Thu, 17 Sep 2026 06:24:00 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75XJ-0000000Aegh-1KxD
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 06:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=kp
	Y1B2pDFZklM02cclz2tynwBoho1m74VIECrRMROQY=; b=cUcKVzJl3pl3/BIj+v
	ksB67/8bvIb5FuTzT/0GSiayoZIkgjx2ZQ3mwgq1rLRr+QO15WL3fdILJuFA4qPd
	+TUxG2sj/MxS0nTq/vLWIcZrRxWmk1CSFah6asr7zqLWhMo55U7jo8nb4PkzBgnK
	SsVBrr2tktsO4WeSqodAwKPEw=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnsQdWh6tqj2MNSA--.29448S2;
	Thu, 17 Sep 2026 14:23:19 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] riscv: hwprobe: use _BITULL() rather than BIT() in MIPS vendor uapi header
Date: Thu, 17 Sep 2026 14:23:06 +0800
Message-Id: <20260917062306.46978-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: QCgvCgDnsQdWh6tqj2MNSA--.29448S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7GFWfJrykAFyfGry3JrW8WFg_yoW8Jry3pF
	s8uFsYgrWrWr1xCFW7J3WxXrnIqw4rKa1YgFy8u3y8Ja9aqrW0qrs0yw13Z3WUtF4vqr4j
	gFn5uryFya9rA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UXZ2hUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC8xh9KWqrh1g2OgAA3t
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_232357_820799_424AEFC1 
X-CRM114-Status: UNSURE (   8.94  )
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

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

BIT() is a kernel-internal macro that is not available to userspace, but
the MIPS vendor extension uapi header uses it without defining or
including it. Any userspace program that includes this header and uses
RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL fails to build.

Use _BITULL(0) from linux/const.h instead, which keeps the value at 1,
so there is no ABI change.

Fixes: bb4b0f8a1bcb ("riscv: hwprobe: Add MIPS vendor extension probing")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 arch/riscv/include/uapi/asm/vendor/mips.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/uapi/asm/vendor/mips.h b/arch/riscv/include/uapi/asm/vendor/mips.h
index e65ab268b265..a31c23afe74f 100644
--- a/arch/riscv/include/uapi/asm/vendor/mips.h
+++ b/arch/riscv/include/uapi/asm/vendor/mips.h
@@ -1,3 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 
-#define RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL	BIT(0)
+#include <linux/const.h>
+
+#define RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL	_BITULL(0)
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
