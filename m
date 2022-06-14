Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0495FCCA47A
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8xZNgBgOtDyTrm7DwYU5DDq5Se9ZtnwGjAX7bBdL+I=; b=YYkBfgobpMB4VA
	qzpZdqHe+FpD04EoK1RqXOfIwWqv6ARIprH/z5ndh1g/5LBiUTBZknk5qtOtHTYLOo+WO9orqRb1I
	IvSaaquEFgZdEi35YtaTs443U1R2MIDCGNOFKhzZo3xiTxhhIaBHVEze8gfR2nYeucTmo6Xse299S
	eJripwrqSata4rpjRtko+rK6T6BfBt55HpHbcD8pG9rNyetAJGwqY/bPpEor1O9lUJMu2UvOghiuV
	eJuHoCLXaAtD+b0LszcTn0zij5Uj8HyRpZ6fCNM5n1nIq2DChvRxsHWPotcb+WLuZpyFxHi9tPqpT
	pm1yZHStu+3uTJUCOwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o18tM-00AF92-Kv; Tue, 14 Jun 2022 15:55:44 +0000
Received: from mail.efficios.com ([167.114.26.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o18tG-00AF4Q-5G
	for linux-riscv@lists.infradead.org; Tue, 14 Jun 2022 15:55:41 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id E33A73C7BC5;
	Tue, 14 Jun 2022 11:55:31 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 9NGg2r-wdz5u; Tue, 14 Jun 2022 11:55:31 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.efficios.com (Postfix) with ESMTP id 9F5763C7CB3;
	Tue, 14 Jun 2022 11:55:31 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 9F5763C7CB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1655222131;
	bh=04CuK1kRACvrZOuGZz9rVscoPwkNm93KF60hICSAvfE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=EzJrWCHJvDAw2a9mxtKz0ux71s5whBiw2Y9AvtbcXdUpdTt6NkmpI+FisUl4UGXcF
	 q5TDUHnB+iRMLgV65/4pWD91GkxSffnfyH258pDi2AkFCNit+fc8IKpOeZe9yf59/1
	 ElvgcQbCNFffRT30c/pYBE+jmxtLRA6oODooUCpe06Xv7xO6wb++fCCMKC7nKSGF8A
	 NzepeNV8LqxVGrI/UM99AnuWmIuJYq/zi/eTjYFI/HzJk0N8/tQfDLhumOB86wWWkt
	 fTlLJvhpy7HJ0e4WBqW924neSX/cZoUiadYgQfIf8w6FclignL7AssZ2jkMvVYGiTW
	 A/yXWW7egpYuA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
	by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rSxGsc-_fEFL; Tue, 14 Jun 2022 11:55:31 -0400 (EDT)
Received: from laptop-mjeanson.internal.efficios.com (192-222-180-24.qc.cable.ebox.net [192.222.180.24])
	by mail.efficios.com (Postfix) with ESMTPSA id 6AD613C7954;
	Tue, 14 Jun 2022 11:55:31 -0400 (EDT)
From: Michael Jeanson <mjeanson@efficios.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Michael Jeanson <mjeanson@efficios.com>
Subject: [PATCH 3/3] selftests/rseq: check if libc rseq support is registered
Date: Tue, 14 Jun 2022 11:48:30 -0400
Message-Id: <20220614154830.1367382-4-mjeanson@efficios.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220614154830.1367382-1-mjeanson@efficios.com>
References: <20220614154830.1367382-1-mjeanson@efficios.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_085538_331537_F0A5B48B 
X-CRM114-Status: UNSURE (   9.05  )
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

When checking for libc rseq support in the library constructor, don't
only depend on the symbols presence, check that the registration was
completed.

This targets a scenario where the libc has rseq support but it is not
wired for the current architecture in 'bits/rseq.h', we want to fallback
to our internal registration mechanism.

Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
---
 tools/testing/selftests/rseq/rseq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/rseq/rseq.c b/tools/testing/selftests/rseq/rseq.c
index 986b9458efb2..4177f9507bbe 100644
--- a/tools/testing/selftests/rseq/rseq.c
+++ b/tools/testing/selftests/rseq/rseq.c
@@ -111,7 +111,8 @@ void rseq_init(void)
 	libc_rseq_offset_p = dlsym(RTLD_NEXT, "__rseq_offset");
 	libc_rseq_size_p = dlsym(RTLD_NEXT, "__rseq_size");
 	libc_rseq_flags_p = dlsym(RTLD_NEXT, "__rseq_flags");
-	if (libc_rseq_size_p && libc_rseq_offset_p && libc_rseq_flags_p) {
+	if (libc_rseq_size_p && libc_rseq_offset_p && libc_rseq_flags_p &&
+			*libc_rseq_size_p != 0) {
 		/* rseq registration owned by glibc */
 		rseq_offset = *libc_rseq_offset_p;
 		rseq_size = *libc_rseq_size_p;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
