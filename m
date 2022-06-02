Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A026AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 11:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7HXBsmCNpLVLrxMX20f68J8Np6q0QwKT1Z8aY5JVtdg=; b=Bxh2GvLsd83BH4
	p9ua0itxnql6TxS4JXhBc/NF1m8Lcmx6SNWUfr1gF0ZBYXGU7m28v8CK1cHARmcQnFvcV59EYmnly
	J1rY9erSAk8lPcv4YpnHP1tiB9OVegkSXQSbCwlCjt3099l8AqSMfWQNNj3wsnji3yQIBSSeLtIU/
	KdVy0fBv0gD1uBkyur45veEn18suDAqXv58YUVgzPVUqqdb/u1KSWNINS6mwMC3QC39We6ia8SbdU
	k9kMHBPNDcz1B9m76W0qddjOlw4GBiCuWvqv+lzdG1A5hci0mk6Gik6DIEYA4fhdxoXH+qsyTIGJM
	WdDwjixss2ZM3Hmt1ADA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwize-002wIg-Jr; Thu, 02 Jun 2022 11:27:58 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwizb-002wFR-CQ
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 11:27:57 +0000
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LDNxz0M3PzjXBp;
	Thu,  2 Jun 2022 19:26:31 +0800 (CST)
Received: from M910t (10.110.54.157) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 2 Jun
 2022 19:27:41 +0800
Date: Thu, 2 Jun 2022 19:27:34 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <changbin.du@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, Hui Wang
	<hw.huiwang@huawei.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: riscv: alternatives: move length validation inside the subsection
Message-ID: <20220602112734.it2bzlqaismotjof@M910t>
MIME-Version: 1.0
Content-Disposition: inline
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_042755_640407_DA4EEE88 
X-CRM114-Status: UNSURE (   8.69  )
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

Apply the same fix from commit 966a0acce2fc ("arm64/alternatives: move
length validation inside the subsection") to riscv.  Due to the one-pass
design of LLVM's integrated assembler, it can not compute the length of
instructions if the .org directive is outside of the subsection that these
instructions are in.

Here is the build error reported by llvm:

In file included from ./arch/riscv/include/asm/pgtable.h:108:
./arch/riscv/include/asm/tlbflush.h:23:2: error: expected assembly-time absolute expression
        ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
        ^
./arch/riscv/include/asm/errata_list.h:41:5: note: expanded from macro 'ALT_FLUSH_TLB_PAGE'
asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_VENDOR_ID,        \
    ^
./arch/riscv/include/asm/alternative-macros.h:187:2: note: expanded from macro 'ALTERNATIVE'
        _ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
        ^
./arch/riscv/include/asm/alternative-macros.h:113:2: note: expanded from macro '_ALTERNATIVE_CFG'
        __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
        ^
./arch/riscv/include/asm/alternative-macros.h:110:2: note: expanded from macro '__ALTERNATIVE_CFG'
        ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
        ^
./arch/riscv/include/asm/alternative-macros.h:98:3: note: expanded from macro 'ALT_NEW_CONTENT'
        ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
         ^
<inline asm>:25:6: note: instantiated into assembly here
.org    . - (887b - 886b) + (889b - 888b)
        ^

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 arch/riscv/include/asm/alternative-macros.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index e13b1f6bb400..c7d7f1945768 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -94,9 +94,9 @@
 	new_c "\n"							\
 	".option pop\n"							\
 	"889 :\n"							\
-	".previous\n"							\
 	".org	. - (887b - 886b) + (889b - 888b)\n"			\
 	".org	. - (889b - 888b) + (887b - 886b)\n"			\
+	".previous\n"							\
 	".endif\n"
 
 #define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, enable)	\
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
