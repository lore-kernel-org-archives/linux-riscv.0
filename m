Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349EACD37AC
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 18:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GfM5wkSw7Pg6233xuNe5WYLTr2aDgt/E7UUV9dDvD0k=; b=Pj3Yc04+oZMgfx
	Klz+JyUIySNPEzAmkFPZFgZLpaJeXxxASKQTT8tLbFSdV+OyAN1pLiOfrDRcIcCb+94egV2JAZ53Q
	lq5ScMqm4l8T+9bMpIsCaYQyVfYGLOH5wh3h+vWWWNr4Rj5lQPZ/Kks4H1EwuIrMnmtkY1b3ySCte
	mg6Tm4BvpzRvrqQ/21FER94OF1hY1HKzSPhA/hCNGTa9lWk6kiqekL6j6RNavz7TG5RKHTOq7z5vf
	kJAxY3YAeET6bSqU2igZ88qNF/d8U94LYciXNxyMHcPKYBrh0KS1SOQFJq2uVaUzJve5u6xl39W4F
	6sGwgN0L7rMCJNuBzlRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNE46-00000003RIi-2WEO;
	Wed, 13 May 2026 18:12:14 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNE43-00000003RIO-2cnO
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 18:12:13 +0000
Received: from Lee.localdomain (unknown [39.152.152.253])
	by APP-05 (Coremail) with SMTP id zQCowADXZQnwvgRqayEtEA--.28384S2;
	Thu, 14 May 2026 02:12:01 +0800 (CST)
From: Li Guan <guanli.oerv@isrc.iscas.ac.cn>
To: acme@kernel.org,
	namhyung@kernel.org
Cc: irogers@google.com,
	adrian.hunter@intel.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Li Guan <guanli.oerv@isrc.iscas.ac.cn>
Subject: [PATCH v2] perf riscv: Fix discarded const qualifier in _get_field()
Date: Thu, 14 May 2026 02:07:21 +0800
Message-ID: <20260513180721.1179904-1-guanli.oerv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513154851.1085334-3-guanli.oerv@isrc.iscas.ac.cn>
References: <20260513154851.1085334-3-guanli.oerv@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADXZQnwvgRqayEtEA--.28384S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFyrtr4DtFW5Xw48Aw18Zrb_yoW8Xr18pr
	Z7Crn0k345Wr1a9340vFWI9FWUurs3XayS9FsYy3y2vws8X34xtrWftan8C3W2qryUur1r
	ur43urWkAF48AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [39.152.152.253]
X-CM-SenderInfo: hjxd0znlorv2ny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_111212_037734_B2550FDE 
X-CRM114-Status: GOOD (  10.31  )
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

The assignment of strrchr() return values to non-const char * variables
triggers a -Werror=discarded-qualifiers warning when building with GCC 14.
This happens because in newer glibc versions, strrchr() returns a
const char * if the input string is const.

Properly declare 'line2' and 'nl' as const char * to match the glibc
function signature and ensure type safety. This avoids the need for
explicit type casting and aligns with the design pattern of not
modifying read-only memory in the perf tool.

Signed-off-by: Li Guan <guanli.oerv@isrc.iscas.ac.cn>
---
v2:
 - Drop the auxtrace decoupling and weak stub approach as they interfered 
   with the cross-platform analysis intent, per Ian's feedback.
 - Focus on a clean fix for the const qualifier issue in RISC-V header.c
   by properly declaring local variables as const.
 - Use Li Guan as the preferred name format for consistency.
 - Verified that this fix is not yet present in acme/perf-tools-next.

 tools/perf/arch/riscv/util/header.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/arch/riscv/util/header.c b/tools/perf/arch/riscv/util/header.c
index 4b839203d4..891984e909 100644
--- a/tools/perf/arch/riscv/util/header.c
+++ b/tools/perf/arch/riscv/util/header.c
@@ -19,7 +19,7 @@
 
 static char *_get_field(const char *line)
 {
-	char *line2, *nl;
+	const char *line2, *nl;
 
 	line2 = strrchr(line, ' ');
 	if (!line2)
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
