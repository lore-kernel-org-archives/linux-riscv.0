Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21978C3ABAB
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qrJhCMuXtqo1tfUN6ohkloBWKNIxqjUx8t43vZcbbr4=; b=0D34PcWgnI9yZP
	gyVQEKgV1LPDGh81dhLGgtMZ4u941ze8GaBnQk5PRpvRCQrurIr0SYD7iigo9EdE0dJDrRIKYyVZL
	OoUEho8EltqKvwNbqOoNxVt8DG1C7+zDOs/jThIqgyhsajKecv95l5PsWuIQA7ZozD5BWEC7LfyE2
	nh2bvb9QtmsI0BxG/E2HSO+brxGvTKt769mxJvpR39bWcPpQmoNy6Q+k5F3Z4X9wnRznzsOBnMNqI
	2htYov7lZuCsmPgHDc8p2feIiJnW+jE9EBr2Zo8ENGJE1b6XF7lNatTD4go5at0fTuJk7tTnKCyw8
	tguiFID1VQMPNwHwkJBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lhj-00000009rrL-1w0t;
	Tue, 29 Apr 2025 14:12:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jNd-00000009XNI-04ZR
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Apr 2025 11:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wqyFVTvCpvC9uY0zhPN+h7Ken6XvEWjKZ8iIMxjWz98=; b=crIbrEXw5xMaTGwUOT9zllCHiF
	LXyfoLQHA+1H+dIiJV5jmj/qZXjJyUQ8qPoz3hzjB7TvalMQ4qjO7Ourstu27mBijxz/BFiyhjM0K
	jPgYB9r934J8CG7Bf0jHTVAxwhE27RUnlf1tC05IUabmMboL0rGaJpJSmjEWln6/PhGgstAKZe8xm
	UX2OAfNU0RBKwomIrNGy3d87H6Xb49mg687s7B9bDXWu7xDai4hbB5IcKY/Pb4T8udPFpCSDRE+uZ
	J4mCB032j1mNrqMO5d4DWA1HVTlwx7arrW3TaJTcJErLrbEi6HnXAphioBpcFacFMyVnkLR3ZyIBw
	1YJ8d3DQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9jNa-0000000DHk9-13bS
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 11:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745927041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqyFVTvCpvC9uY0zhPN+h7Ken6XvEWjKZ8iIMxjWz98=;
	b=ZuadNe1YsaPA5Plo83kVV0HG6k09ib3dHr6vRgGAfHH2NlwZUpnLu56glc9OKXHNiYdL8N
	dokjJAEISu21uQdSbBJBUOCtMHQAsNc40lY4JNsaxWUE/UxJbcrUxNzFj3oV9gcq+I1qir
	sNJNWwrgjEbZPGK6cZthqXvBT4LYPEg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745927041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqyFVTvCpvC9uY0zhPN+h7Ken6XvEWjKZ8iIMxjWz98=;
	b=ZuadNe1YsaPA5Plo83kVV0HG6k09ib3dHr6vRgGAfHH2NlwZUpnLu56glc9OKXHNiYdL8N
	dokjJAEISu21uQdSbBJBUOCtMHQAsNc40lY4JNsaxWUE/UxJbcrUxNzFj3oV9gcq+I1qir
	sNJNWwrgjEbZPGK6cZthqXvBT4LYPEg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-550-QarA7GnEPmC1tZynHFHkyA-1; Tue,
 29 Apr 2025 07:43:55 -0400
X-MC-Unique: QarA7GnEPmC1tZynHFHkyA-1
X-Mimecast-MFC-AGG-ID: QarA7GnEPmC1tZynHFHkyA_1745927031
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6ED81195608C;
	Tue, 29 Apr 2025 11:43:51 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.225.102])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4857019560A3;
	Tue, 29 Apr 2025 11:43:21 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Daniel Wagner <dwagner@suse.de>,
	Petr Tesarik <ptesarik@suse.com>,
	Nicolas Saenz Julienne <nsaenz@amazon.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Naveen N Rao <naveen@kernel.org>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rong Xu <xur@google.com>,
	Rafael Aquini <aquini@redhat.com>,
	Song Liu <song@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Brian Gerst <brgerst@gmail.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	John Stultz <jstultz@google.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v5 20/25] stackleack: Mark stack_erasing_bypass key as allowed in .noinstr
Date: Tue, 29 Apr 2025 13:32:37 +0200
Message-ID: <20250429113242.998312-21-vschneid@redhat.com>
In-Reply-To: <20250429113242.998312-1-vschneid@redhat.com>
References: <20250429113242.998312-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_124402_472413_4FB9BCD6 
X-CRM114-Status: GOOD (  14.52  )
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
 kernel/stackleak.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/stackleak.c b/kernel/stackleak.c
index bb65321761b43..51b24d1e04ba2 100644
--- a/kernel/stackleak.c
+++ b/kernel/stackleak.c
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
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
