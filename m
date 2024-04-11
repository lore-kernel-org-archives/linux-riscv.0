Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460D5C04FF0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 16:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qg03T6DL5Hx8T1jqrYh+5a1/X+R/eUfd/m6afa5HNC8=; b=b+4S0DSN6UZ3PH
	beNhjgHgHXHxYq/fIJthBX3kg2r6rcq+44Y0wLKYmsC3scSNOpL7Gc/SC9Q7ybbGdUHq58inTwysP
	4LZqqh/INeeQRMOF8lmyNeDk7qPon82h5MvROfgyhB/sC/tqDDR6CES7VfwsG0gaxsMvHDjQ46mo2
	tT4B1Xxsj4ga/XNK0/YNEdaPYw9HtuVr6SeTp3OdTmLZu8TJUm7cn8F2bPiI//hEvk4oIFO93dAQH
	DpXU8neO3Cpx2Cv0bTY2HGvKzVLmizzWXsoq9eaA26AwM+NtiMA9aZfLzuN3oQq4xCJ4UZi14+C0U
	O2v8zLYwcbVaVdLESo+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwwt-0000000Cwmk-0YEg;
	Thu, 11 Apr 2024 16:06:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwwQ-0000000CwOz-2nN4;
	Thu, 11 Apr 2024 16:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vm3ydTCRRAtVPv1Cqap2BhrLwXDmUejZHajDNaqcY9k=; b=pogGQXLwQ41DCJxa5BMeOM9Ynw
	t6G791XJ396ItcFkMsggG4nf8u58r54CVNo+RgwhnfEst1RdiWOiCAxRx4/p0SaMOL8hCZdSqWF2s
	YhGo30OymXDS3aBdGTw/8gRHjB+3SM0HHG+VLPJ/bmcLtC3ENL2LpzycT7y/HZi8Rhaa+Y13D/pX6
	80HwA6YQzllAbQhHzwl68iO8n3uCtLT++CJ2tRthIFozcWALwPtYH8I2fOHoYWPxhYwqO9ZAjUbT8
	KzHqEcPBYOhFk1P8RSI9qJ0YxlZBN8ZVrlxAUa+1t3GeYFvYrztutzLu6iTk6CImKJq0OZatW9ogX
	GGJSKu3w==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwwN-00000008hD7-1w03;
	Thu, 11 Apr 2024 16:06:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E7120620E6;
	Thu, 11 Apr 2024 16:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00322C32786;
	Thu, 11 Apr 2024 16:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712851577;
	bh=btBuaAPySyacvFLoesSF8jmcxuZmKLyhOW9rUao98hE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dBjNsDOQydXb1RIv/QKPd8a/ZcM3ev4iQrlZuWSxB+eUTRlnLJblCgvMoL/gVezXk
	 hMzdbN4z+LzsDiSRE7xfAAHe9xPq1yf5Dp8udLo1xyJoKuxv3AV7HKyl9mucU2ATHY
	 O8GL1DfmSWHVBej34ZHjyiSumP79dUOy5Rmalka7m6BxXWq73PfMbzd7DJkjsvzYrn
	 3bUewkI/ccMeykN+WKxx+bwi2QvOtbdMnYufmjYMSKlLKRLBgJpYiBQsgONqWbK+Tv
	 tyiNgxlRIcvBi+krsFKANi42N4Sy4K8EfIvPGRIPaVUAjxASMQ3Z+Ku76dg641fTiy
	 s268X7J1EAzTg==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Helge Deller <deller@gmx.de>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [RFC PATCH 4/7] ftrace: Add swap_func to ftrace_process_locs()
Date: Thu, 11 Apr 2024 19:05:23 +0300
Message-ID: <20240411160526.2093408-5-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411160526.2093408-1-rppt@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_170619_796565_60FB60A5 
X-CRM114-Status: GOOD (  13.27  )
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

From: Song Liu <song@kernel.org>

ftrace_process_locs sorts module mcount, which is inside RO memory. Add a
ftrace_swap_func so that archs can use RO-memory-poke function to do the
sorting.

Signed-off-by: Song Liu <song@kernel.org>
Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/ftrace.h |  2 ++
 kernel/trace/ftrace.c  | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 54d53f345d14..54393ce57f08 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -1172,4 +1172,6 @@ unsigned long arch_syscall_addr(int nr);
 
 #endif /* CONFIG_FTRACE_SYSCALLS */
 
+void ftrace_swap_func(void *a, void *b, int n);
+
 #endif /* _LINUX_FTRACE_H */
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index da1710499698..95f11c8cdc5e 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6480,6 +6480,17 @@ static void test_is_sorted(unsigned long *start, unsigned long count)
 }
 #endif
 
+void __weak ftrace_swap_func(void *a, void *b, int n)
+{
+	unsigned long t;
+
+	WARN_ON_ONCE(n != sizeof(t));
+
+	t = *((unsigned long *)a);
+	*(unsigned long *)a = *(unsigned long *)b;
+	*(unsigned long *)b = t;
+}
+
 static int ftrace_process_locs(struct module *mod,
 			       unsigned long *start,
 			       unsigned long *end)
@@ -6507,7 +6518,7 @@ static int ftrace_process_locs(struct module *mod,
 	 */
 	if (!IS_ENABLED(CONFIG_BUILDTIME_MCOUNT_SORT) || mod) {
 		sort(start, count, sizeof(*start),
-		     ftrace_cmp_ips, NULL);
+		     ftrace_cmp_ips, ftrace_swap_func);
 	} else {
 		test_is_sorted(start, count);
 	}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
