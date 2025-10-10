Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5241DCCD185
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 15:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blJ1r9Y+fAclPfLnFGmv9wICwhAjOiHzo7aWmUTgbEA=; b=rXFfZfdKbL8eH9
	8dfRU9OhFWXHbiZY5uJuBaLi0Fa6yAZHQjSpqR5MNDjzdbSkqC3bkYF54wMzxWKnIdlp87P3AlYNt
	crYvZV7EVBTzckmR1uqtllqCjarFldjhkrrL2EL16pr4NRSiB65RfxeVIi+goxNVi4GAwe8OGw6dT
	yuiO+vp/8i5lTKnmC3CiLZhYHD8U+hegXpWjqnBci0OVwK93G2ujVMksk6JngwXFqeUlHPu6xTSsY
	QAWFDarTrvDyZzJUgfSayoFGFxUC0PepJ5hecIYY4Q4cWzC2imBPTU5byYZw3giz9HywbXBDykagv
	uscE8LD1oGBpsAg9BRiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FJy-00000008tLb-3zlv;
	Fri, 10 Oct 2025 15:46:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FJw-00000008tJH-3Paz
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 Oct 2025 15:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iD33w+Kf1PLBTVwd7Gs6fvxUpUzwmU6xc5WkYASPV+Q=; b=g+eWvj4261K+h0CrI05JygR5n7
	KaqbF+RVrhZJoyGB6iD9+0LI/iBKvP+U2bVlPft6oFtkzSAAyvGeOq96DCf6Yb0hhaZWjMtMcb0ou
	ecca7piK/HbBJjqZzOoechO1c3OkgDY42Tp6Hp0zuKo+GmBUHFRGE9JtbdQhQsfQCZhVgeopc0Pg3
	jnBF8j3IEnG824W7aLhpXbUnbBCOwtJVSoZDEE5YERrbP8QhTo2n0PX6eNo6kAMcRMiHnu44B1OCv
	n21RAsaXxg1LKGuP2q1OWj682q0dSH/1jJZQdQYO2sRqjAqf74w8cNMo0vBMv+nBlZ9akXR6Snerh
	L60Ny2Qg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FJt-00000002FTO-3AnF
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 15:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iD33w+Kf1PLBTVwd7Gs6fvxUpUzwmU6xc5WkYASPV+Q=;
	b=R7JWT+0W8Fn7pbn96HuA2qsNdDtohJOOI04BVnkPa8k5HMnG/07Xigbn5GBDtwLUEb0Fk2
	aFDjMejqHT+Ztio1QtpoBzVXIU520wMC6I7b1GUa+14Km7oDevs4w6gJtplVFqKInmyQ19
	E+GKCmzDJCXf7JQPeK0RMogQURTbUWw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iD33w+Kf1PLBTVwd7Gs6fvxUpUzwmU6xc5WkYASPV+Q=;
	b=R7JWT+0W8Fn7pbn96HuA2qsNdDtohJOOI04BVnkPa8k5HMnG/07Xigbn5GBDtwLUEb0Fk2
	aFDjMejqHT+Ztio1QtpoBzVXIU520wMC6I7b1GUa+14Km7oDevs4w6gJtplVFqKInmyQ19
	E+GKCmzDJCXf7JQPeK0RMogQURTbUWw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-YyfYK7fpOPCOQwG47iM_TQ-1; Fri,
 10 Oct 2025 11:46:09 -0400
X-MC-Unique: YyfYK7fpOPCOQwG47iM_TQ-1
X-Mimecast-MFC-AGG-ID: YyfYK7fpOPCOQwG47iM_TQ_1760111157
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DCF321800290;
	Fri, 10 Oct 2025 15:45:56 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.224.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CBC601800576;
	Fri, 10 Oct 2025 15:45:41 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rcu@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>,
	Rik van Riel <riel@surriel.com>,
	Jann Horn <jannh@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Daniel Wagner <dwagner@suse.de>,
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH v6 20/29] stackleack: Mark stack_erasing_bypass key as allowed in .noinstr
Date: Fri, 10 Oct 2025 17:38:30 +0200
Message-ID: <20251010153839.151763-21-vschneid@redhat.com>
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_164613_989867_2B74ADDA 
X-CRM114-Status: GOOD (  13.48  )
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

Later commits will cause objtool to warn about static keys being used in
.noinstr sections in order to safely defer instruction patching IPIs
targeted at NOHZ_FULL CPUs.

stack_erasing_bypass is used in .noinstr code, and can be modified at runtime
(proc/sys/kernel/stack_erasing write). However it is not expected that it
will be  flipped during latency-sensitive operations, and thus shouldn't be
a source of interference wrt the text patching IPI.

Mark it to let objtool know not to warn about it.

Reported-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/kstack_erase.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/kstack_erase.c b/kernel/kstack_erase.c
index e49bb88b4f0a3..1abc94a38ce14 100644
--- a/kernel/kstack_erase.c
+++ b/kernel/kstack_erase.c
@@ -19,7 +19,11 @@
 #include <linux/sysctl.h>
 #include <linux/init.h>
 
-static DEFINE_STATIC_KEY_FALSE(stack_erasing_bypass);
+/*
+ * This static key can only be modified via its sysctl interface. It is
+ * expected it will remain stable during latency-senstive operations.
+ */
+static DEFINE_STATIC_KEY_FALSE_NOINSTR(stack_erasing_bypass);
 
 #ifdef CONFIG_SYSCTL
 static int stack_erasing_sysctl(const struct ctl_table *table, int write,
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
