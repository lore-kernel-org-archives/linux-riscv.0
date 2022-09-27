Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74981C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 16:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=Ohis0ty60u2Z9YGs9j8f3jGh5vTLrEvsdD3LnUHuy3Q=; b=fFuDfhGRxr+NRh
	IqEFZlz1UNtCs9H9/+kohXg4DzP5VnzYeWviVI1sLHwAAvONjvHjgO0q9mvNDu5UNzV7a3JMsg9mJ
	PQnuIppmDSMW2O3oM1tnUml0zRWmYhnBCyg9VAQXCkzt12HuJjYv0A8daxxehoo882x7diWBUybP8
	b6R8oeSJBK9hSXugQcTGoTk016z3HVlTFxKddGc9r54K0s2rduUkYpUyicxDAwFhhOmpFU4OXsviH
	kkKkfeQpe183eR3iJHoKAPxS25ZYMiEcvasYhM91A9e9gvhGRMSOj3Jh4mN8dyGw3gIKej1ba88YP
	eytOlUm2p6oIaG89OjYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odD1i-00BgaC-Bc; Tue, 27 Sep 2022 16:01:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odD1e-00BgXT-Lg
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 16:01:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A15CE61A98;
	Tue, 27 Sep 2022 16:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792CBC433B5;
	Tue, 27 Sep 2022 16:01:37 +0000 (UTC)
Received: from rostedt by gandalf.local.home with local (Exim 4.96)
	(envelope-from <rostedt@goodmis.org>)
	id 1odD2m-00G2u5-04;
	Tue, 27 Sep 2022 12:02:48 -0400
Message-ID: <20220927160247.410787337@goodmis.org>
User-Agent: quilt/0.66
Date: Tue, 27 Sep 2022 12:02:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Daniel Bristot de Oliveira <bristot@kernel.org>,
  <linux-riscv@lists.infradead.org>,
  <mingo@redhat.com>,
  <paul.walmsley@sifive.com>,
  <palmer@dabbelt.com>,
  <aou@eecs.berkeley.edu>,
  <zanussi@kernel.org>,
  <liaochang1@huawei.com>,
  <chris.zjh@huawei.com>,
 Yipeng Zou <zouyipeng@huawei.com>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [for-next][PATCH 12/20] tracing: kprobe: Fix kprobe event gen test module on exit
References: <20220927160216.349640304@goodmis.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_090138_791548_3F8594AE 
X-CRM114-Status: GOOD (  12.48  )
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

From: Yipeng Zou <zouyipeng@huawei.com>

Correct gen_kretprobe_test clr event para on module exit.
This will make it can't to delete.

Link: https://lkml.kernel.org/r/20220919125629.238242-2-zouyipeng@huawei.com

Cc: <linux-riscv@lists.infradead.org>
Cc: <mingo@redhat.com>
Cc: <paul.walmsley@sifive.com>
Cc: <palmer@dabbelt.com>
Cc: <aou@eecs.berkeley.edu>
Cc: <zanussi@kernel.org>
Cc: <liaochang1@huawei.com>
Cc: <chris.zjh@huawei.com>
Fixes: 64836248dda2 ("tracing: Add kprobe event command generation test module")
Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/kprobe_event_gen_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/kprobe_event_gen_test.c b/kernel/trace/kprobe_event_gen_test.c
index 18b0f1cbb947..e023154be0f8 100644
--- a/kernel/trace/kprobe_event_gen_test.c
+++ b/kernel/trace/kprobe_event_gen_test.c
@@ -206,7 +206,7 @@ static void __exit kprobe_event_gen_test_exit(void)
 	WARN_ON(kprobe_event_delete("gen_kprobe_test"));
 
 	/* Disable the event or you can't remove it */
-	WARN_ON(trace_array_set_clr_event(gen_kprobe_test->tr,
+	WARN_ON(trace_array_set_clr_event(gen_kretprobe_test->tr,
 					  "kprobes",
 					  "gen_kretprobe_test", false));
 
-- 
2.35.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
