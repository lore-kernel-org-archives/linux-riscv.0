Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB50DC61DBC
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 16:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VPMfQmpglI7V9EcuN/mac38xR5D+6THeeoCenspZXSE=; b=G/vIpsW8ihnnH6
	7xXKU5OAUt8pZkwADQpz110X+1Dt41/CU1NLG6eCHDJz1869ud68yO1A6ELfFppxCCtgZRIJZKOF/
	iWxdyviXveGi6r1qCEuh+NDn4YGeA3L8rlzWVcLNmxZU3Oulg4xeg9El0TJDj+yE8Cv2gCauYuTQp
	myMABCIsrQA4H5QbqsIewgIMar9IT6qlA5ORd1If7xrIkjoVogdv8toWGRlHH9Blw6WwFYfJPxLq3
	r1AW7d7hUDyPfWAEhylFvYOQLk671zXid74A88p5I7jSUpV/LLbtjLj/NmU0B/z1nfFCM1BB8i84X
	EWR5BI+jC1jzPWmDGW/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuGl-000000018dK-25kB;
	Tue, 25 Aug 2026 16:45:03 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2aK-0000000BbTa-2w01
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 13:13:33 +0000
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	by smtp-out1.suse.de (Postfix) with ESMTP id F0A3C850E9;
	Thu, 20 Aug 2026 13:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1787231605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t/RoLg5K6pahxmNamu2XIOYUhB7vz3nN+QUHHfZEYok=;
	b=Pz8ONzcXLaMhkuUQlZ7m+NotR6LzuhArx6CEEQT5xG3pgVUcXlTkXKzVCDju2x9NgM8IqD
	17lHLVTuNjJtTlOnqo7VqHOzPGvsaWV9ey4h5Ba3iXQNcVybxObo0ipr2T4Tht50pQKe5K
	JZWFt5Fhoc50OWdEhdM3sJkou754kco=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=sZskA6OQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1787231601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t/RoLg5K6pahxmNamu2XIOYUhB7vz3nN+QUHHfZEYok=;
	b=sZskA6OQJw198CbyYPwuCVUiwflrEnYECMocoVkqFuavd3kqGhgRY6xn0LdSU7OuPPR5sg
	07ShCDEGwVp7blT/1KofJYB/6HPUOqoFuqRz9K+8TpMyp7iLv+l/FeQuwiv86kzn1dgOqO
	6IURocbaPDyoGNx+mlU/NDT8yzMLLTo=
From: Anthony Iliopoulos <ailiop@suse.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: remove unused profile.h includes
Date: Thu, 20 Aug 2026 15:13:08 +0200
Message-ID: <20260820131309.14014-1-ailiop@suse.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Spamd-Result: default: False [16.65 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_SPAM_SHORT(2.96)[0.988];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[kunlun.suse.cz];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[kunlun.suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b306:2000::2:from];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	DIRECT_TO_MX(0.00)[git-send-email 2.55.0];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kunlun.suse.cz:helo,suse.com:mid,suse.com:email,suse.com:dkim];
	TO_MATCH_ENVRCPT_ALL(0.00)[]
X-Spamd-Bar: ++++++++++++++++
X-Rspamd-Queue-Id: F0A3C850E9
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: add header
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_061332_882333_ADD9C2A7 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 25 Aug 2026 09:45:01 -0700
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

None of the code in these files uses declarations provided by profile.h.
Remove the unnecessary header includes across the various files to clean
up dependencies and reduce include bloat.

Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
---
 arch/riscv/kernel/smp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index fa66f9c97d74..eddbc3ad06c9 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -15,7 +15,6 @@
 #include <linux/kexec.h>
 #include <linux/kgdb.h>
 #include <linux/percpu.h>
-#include <linux/profile.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
