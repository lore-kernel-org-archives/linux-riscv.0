Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B813CD5BD0
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 11:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e47AofT3pxFd6eD41HS3wtJMIJEPOquJCBmIWYhCftY=; b=RcPguoSMNiNCpc
	fDEHp2ZxSo8gaEkZYyOR/aCd1bBEDYE0s/DcMM+iRMrnzZ28EOsjM2iqtK2B+rjofrDI1df6IHfvl
	N7nCE9SzhMijiIlLbeyZDoS6lwz0Nn5izW+2Az+BIcMjwtzTmlEDy3l1Vlc+Pvepul+AwhhD9l+Wh
	sbHF9l9NF8GYxrUR+s21zwFbSCDvhXFAagTuoVJKt80d1S7BPnWe2iTh/RE05D4wSnY/LLdS9cJJ/
	Hpm6GDopeIyXFZI29WhzkhVZhBZnx0Ej6OrdI4cdeC5apNBOtwDR5ZRCc0ajOMA7ERQ73TS5fo3R5
	NH65IdA4eDEbUTb2o3gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTqv-0000000H8NZ-0RsE;
	Mon, 25 May 2026 11:52:13 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTqr-0000000H8Mv-3dTw
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 11:52:11 +0000
Received: from hwang4-g16.. (unknown [120.244.199.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 8AE063FAC0;
	Mon, 25 May 2026 11:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1779709926;
	bh=4HhzcFxsEAiqQiSo7NWYLBBNjFLrz5hbDyGRf2MQjSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=N88H5s1AEsNjIhQf8KtACHvsIDh/fqQsn4/lTK2yZmYJUqP4053Chh8pYnXK6mMdB
	 oHWe9Du8FI567+N5RT5DiJmmUK8WVXomnixHGPHETZ1g707ksDUe9sgftXGCLsf7LK
	 f+7N7oDeT15OlVbhqILy7T7XvIYwsVBtX5+Q43jhr8RJdVB1zUyysyGNwySUVwXzqE
	 7cNq3Hgxg7nCretDlmKJ6eCyYE9jGNNYgOe7QAar1JDY0Nf1hVFAw2UJkHi9FgWTVB
	 o/uMhhBNelJ+gYgy10wZrUttDMnNLV/dJqDteQtXLFoHCqvbZHvX1usV1yIY+KTXOp
	 iEm0TgAcYoffAQf9t6bHymuQLwEFgBo9yljT0FuZHdw8+EgVDJXSGKOsp9w4LNF2GS
	 mM+HrXiVJnzNd2Nqf9VogYM8dRq23HffOMyyrqPMVsuP2RR44SbCEFD+5q4tpWmUUf
	 odxdHw08EvqkL8fP7JUPEqRUp8XjCdgChYb+lwIKO/k5H/WvNXjydrUoF8vdklfG6q
	 lwfM0CxJbqaHMOJDdKFOoO6ICoYquT5iegkexLAX48nKz3mydlsKCtJtve+vc169g5
	 iRP+aSnyXBV6yrydOeC3Etp4jqwnypVhoGSjwSONhAJldfdlp9UWlV0gcLgxfSjL8C
	 PjGavsvZVxBow9liHXi6ATNo=
From: Hui Wang <hui.wang@canonical.com>
To: linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	leitao@debian.org,
	akpm@linux-foundation.org
Cc: hui.wang@canonical.com
Subject: [PATCH] riscv: kexec_elf: Remove unused pr_fmt definition
Date: Mon, 25 May 2026 19:51:58 +0800
Message-ID: <20260525115159.100177-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_045210_309522_F0CF4A71 
X-CRM114-Status: UNSURE (   9.06  )
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

Remove the pr_fmt macro as no pr_*() calls exist in this file. The
prefix string "kexec_image: " is also not appropriate for kexec_elf.c,
if pr_fmt is needed in the future, referring to kexec_image.c, a more
appropriate prefix like "kexec_file(elf): " can be added at that time.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 arch/riscv/kernel/kexec_elf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/kernel/kexec_elf.c b/arch/riscv/kernel/kexec_elf.c
index 531d348db84d..05fd33104f3d 100644
--- a/arch/riscv/kernel/kexec_elf.c
+++ b/arch/riscv/kernel/kexec_elf.c
@@ -10,8 +10,6 @@
  * for kernel.
  */
 
-#define pr_fmt(fmt)	"kexec_image: " fmt
-
 #include <linux/elf.h>
 #include <linux/kexec.h>
 #include <linux/slab.h>
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
