Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217C0C3A59D
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Oct 2022 08:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTLs4EmJvrUxbrfBnlr4/HqdCe6G/V7l/mGDKExWO6U=; b=WeYlD6eeB0b8y2
	tJe+H3/LBWMMhZuircrjJwm9KaPOd4a20XVzX35T4mdHGFwKfWEX+t/y5oT/yGNfSxIboOq8IfEBN
	I5SwbRM59MTTiJQT14wOWLqR/yQOw2sr7ZDGoRXk7I2PZPDr2e/unhcTYV9qXUDRhtPmv+zhHiHGs
	L6FMU+uZatVWVLkNHxulctSC6F5jRzLATD+RIno5Pxa54K0TqHqRJKwKSq6QnTnRvjF/VH8W+3oCp
	Op01LCtxL1diG3/xUHiRUJXbcP8WJjKzPd1dYoh4OkoFWPFnPRoV2xNwI7vO8wF3fFga8hYDl10J8
	SZROp7vDVOHn6NYct41w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om9QP-00Bd5G-7W; Sat, 22 Oct 2022 08:00:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1om9QL-00Bd4M-P4
	for linux-riscv@lists.infradead.org; Sat, 22 Oct 2022 08:00:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1C35760B9B;
	Sat, 22 Oct 2022 08:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33292C433C1;
	Sat, 22 Oct 2022 08:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666425604;
	bh=G2L0nwBjn5VtTyRobVNartiz1/0xuFjNYrEZ5NJlSKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oDRZ1KYUy5xDGt2FQnuCeCcx9fj4wv5GIF9HXC+tVhsOPOQmqLA+5uEISjXPMdRbS
	 0bPVrndXQkwwX5kqhFGluLch6JZQdPOjKnVcZhjOCz8C3hK0T80OgENFqyyH8OAx/w
	 xCpBpjv3nMMD7q6c7e4Do6AGiK9UXrLMM6z/lhNY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	mingo@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	zanussi@kernel.org,
	liaochang1@huawei.com,
	chris.zjh@huawei.com,
	Yipeng Zou <zouyipeng@huawei.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.19 525/717] tracing: kprobe: Fix kprobe event gen test module on exit
Date: Sat, 22 Oct 2022 09:26:44 +0200
Message-Id: <20221022072521.543885453@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022072415.034382448@linuxfoundation.org>
References: <20221022072415.034382448@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_010005_876877_6C7C36B6 
X-CRM114-Status: GOOD (  12.04  )
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

[ Upstream commit ac48e189527fae87253ef2bf58892e782fb36874 ]

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
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
