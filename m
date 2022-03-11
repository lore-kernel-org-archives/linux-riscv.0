Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A878C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Mar 2022 06:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8B4Dlgtfl6t94sh0xB21wNMB5+NhFHGMIwVJHONcPwU=; b=L0t9JE6Qaojjv8
	CtVQQEYRk/sdXaU6w/GLkGDqmAq3LEk+Z+o8VQUzUMXN7OXtgJPSt3AUXhRNOrTZ+hvfzQLFwlnrO
	61YAKPSzgZwck1Rn0V2IHVpgIi1Kq4oCIO6SGFzu3dmapv84b8yLXyf1M9bHDkTtWSkSFRzgIIQXq
	RuMqX08NTLrlZ9uGYoyzDwC9H0T1oZgSgiSqlng3lYgICUpEjtNDkhWS2UCcN2bdbg9Y6bsuvLAlT
	JJTkqMXOKL6VKcqbcuxXgqfBzM1salqW0s5NWPX2WPGwAIax9reismSm4fHkYgogUHy1AyWxiGYse
	XldxLDVSEfeVyY+jM1LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSZER-00FHrb-Pu; Fri, 11 Mar 2022 06:58:35 +0000
Received: from forward104o.mail.yandex.net ([37.140.190.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSZEO-00FHqu-Nt
 for linux-riscv@lists.infradead.org; Fri, 11 Mar 2022 06:58:34 +0000
Received: from iva8-4db386e07e2e.qloud-c.yandex.net
 (iva8-4db386e07e2e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:951e:0:640:4db3:86e0])
 by forward104o.mail.yandex.net (Yandex) with ESMTP id F01DA65D3543;
 Fri, 11 Mar 2022 09:58:18 +0300 (MSK)
Received: from iva4-b3ebd202b141.qloud-c.yandex.net
 (iva4-b3ebd202b141.qloud-c.yandex.net [2a02:6b8:c0c:4e8e:0:640:b3eb:d202])
 by iva8-4db386e07e2e.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 bRRjuwgxmY-wHeaBClW; Fri, 11 Mar 2022 09:58:18 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1646981898; bh=r8NGPub2yLP8J/GwfOvg8WvFWw+/jFkgoKD0eVjdXgQ=;
 h=Date:Subject:Cc:To:From:Message-Id;
 b=SWX5Kq24ysI5oBLPhKYLAQmqUdAo1o/0t8oesx+AztTuQwfhUgWk4QQ30DwHNNvi8
 Vm5GFni0dqhFkfWfy9cF3oBweSkG/zADmtdlL1sfuIYFFaEttcNjn89wCC7eVK6q8r
 v/SpZ2iYNSnGRUN30ejtk5+pg5xxYHJhXbYc9iTY=
Authentication-Results: iva8-4db386e07e2e.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by iva4-b3ebd202b141.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id QxfEVveCLI-wGKOa0GN; Fri, 11 Mar 2022 09:58:16 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: 
Cc: linux@yadro.com, Nikita Shubin <n.shubin@yadro.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Mao Han <han_mao@c-sky.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Fix fill_callchain return value
Date: Fri, 11 Mar 2022 09:58:15 +0300
Message-Id: <20220311065815.9985-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_225832_984560_398F1A69 
X-CRM114-Status: GOOD (  10.35  )
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

From: Nikita Shubin <n.shubin@yadro.com>

perf_callchain_store return 0 on success, -1 otherwise,
fix fill_callchain to return correct bool value.

Fixes: dbeb90b0c1eb ("riscv: Add perf callchain support")
Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
---
 arch/riscv/kernel/perf_callchain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index 1fc075b8f764..7aca6a238173 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -68,7 +68,7 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 
 static bool fill_callchain(void *entry, unsigned long pc)
 {
-	return perf_callchain_store(entry, pc);
+	return perf_callchain_store(entry, pc) == 0;
 }
 
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
