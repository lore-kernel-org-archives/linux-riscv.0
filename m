Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAD8C02187
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 19:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1RYgDrFeDmrs+2ScUe9uhPZzFAFhaGctvgcIQ1qNVQ=; b=c/PC/Mobsa5zIG
	zbCK99ZnohZ+5Y5Zi/fzevpacaVe0AC0Fd34GzL9sQmOVUEalEOGJb9HYz20rQsE6b7cM5cG3Mm+C
	fz/wl/tLGQy5x5ceOYq+Ly++PESYV3350twFK6SU4gNrCs5fMLaEtBYVuWs7fWGhyuBFyVHeGgVgM
	t/mgDaFeFzORl7hURLwhs77b3SZTxwazyNrCVWA2UKT1zZJbPseGD4xrGFMPEbtLxEfEM16DCSOwE
	q/VZUzt9hlgJZFAu3d/n6pPXA3K9cZnr/4SsxugzJsqauaQnm7gBmAULrhNptH/q3eE9lxWw+vE0B
	7oXUQY/hKqOCEDhjBtEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmPr-00000009VgE-0iY1;
	Tue, 14 Jan 2025 19:17:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlGx-00000009KRP-0F6x
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Jan 2025 18:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qfGcbREmcisg82Rx6e546I8mjQ8z9ythW/HTCaSXKy0=; b=AhN80LD61maeYuT7EBXtEtda/n
	hDE2Z7iq2DgL38X3fOutDjfwX6OC9qq7LzfIB+YOiDwEKoXQuGyJXfWXbNrpi0T5tXXbrKxb81Flx
	nFKfxs2bHsLl8qXioBbuPqJv56wx0aTfatmbMyldpLDq3lUo56iu+oGMEnI6AQYYXZkVqyOlT9uaG
	3B880AZ8hbkiXGehwlclQO96tvoGriCG4XpKn3/l/QSWRLXbxelpR7D5nrkyzR3kXa5qN1PrjbDIm
	50KgmjXszmaKtR/aWH8LaiIrLXQzs2aV0ljjV7Eknj+2E+VcJXsVi62OtKF7KjwFgL0ERJZi5mRW6
	owOiCgXg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlGt-0000000AWBv-3VMD
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 18:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736877850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qfGcbREmcisg82Rx6e546I8mjQ8z9ythW/HTCaSXKy0=;
	b=LTwCaDm030pG9AOhBs6eYL8FVYf41aic18w4nWdPtuJyXsj0F+g2wRKOBptvmqUT9KwHse
	E1ebR9dyzX62LSQh03PMnfQle0oNgEUhCKpCmB4HLRiz5/qJdKcbJ+Bihyrlx+K6PtYAWe
	0741DzGA8VzB661JDz+biSa82BUPVPg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736877850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qfGcbREmcisg82Rx6e546I8mjQ8z9ythW/HTCaSXKy0=;
	b=LTwCaDm030pG9AOhBs6eYL8FVYf41aic18w4nWdPtuJyXsj0F+g2wRKOBptvmqUT9KwHse
	E1ebR9dyzX62LSQh03PMnfQle0oNgEUhCKpCmB4HLRiz5/qJdKcbJ+Bihyrlx+K6PtYAWe
	0741DzGA8VzB661JDz+biSa82BUPVPg=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-2bGxv9G8MbqEpONYIM0Pig-1; Tue,
 14 Jan 2025 13:04:06 -0500
X-MC-Unique: 2bGxv9G8MbqEpONYIM0Pig-1
X-Mimecast-MFC-AGG-ID: 2bGxv9G8MbqEpONYIM0Pig
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EBCE81955D4F;
	Tue, 14 Jan 2025 18:04:02 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.39.192.55])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B2065195608A;
	Tue, 14 Jan 2025 18:03:39 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
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
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Rong Xu <xur@google.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Jinghao Jia <jinghao7@illinois.edu>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v4 27/30] x86/tlb: Make __flush_tlb_local() noinstr-compliant
Date: Tue, 14 Jan 2025 18:51:40 +0100
Message-ID: <20250114175143.81438-28-vschneid@redhat.com>
In-Reply-To: <20250114175143.81438-1-vschneid@redhat.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_180412_019820_EE4BDDD2 
X-CRM114-Status: GOOD (  16.08  )
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

Later patches will require issuing a __flush_tlb_all() from noinstr code.
This requires making both __flush_tlb_local() and __flush_tlb_global()
noinstr-compliant.

For __flush_tlb_local(), xen_flush_tlb() has already been made noinstr, so
it's just native_flush_tlb_global(), and simply __always_inline'ing
invalidate_user_asid() gets us there

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/include/asm/paravirt.h | 2 +-
 arch/x86/mm/tlb.c               | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index b3daee3d46677..0c0dd186c03e6 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -70,7 +70,7 @@ void native_flush_tlb_one_user(unsigned long addr);
 void native_flush_tlb_multi(const struct cpumask *cpumask,
 			     const struct flush_tlb_info *info);
 
-static inline void __flush_tlb_local(void)
+static __always_inline void __flush_tlb_local(void)
 {
 	PVOP_VCALL0(mmu.flush_tlb_user);
 }
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 2d2ab3e221f0c..18b40bbc2fa15 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -257,7 +257,7 @@ static void choose_new_asid(struct mm_struct *next, u64 next_tlb_gen,
  *
  * See SWITCH_TO_USER_CR3.
  */
-static inline void invalidate_user_asid(u16 asid)
+static __always_inline void invalidate_user_asid(u16 asid)
 {
 	/* There is no user ASID if address space separation is off */
 	if (!IS_ENABLED(CONFIG_MITIGATION_PAGE_TABLE_ISOLATION))
@@ -1206,7 +1206,7 @@ STATIC_NOPV noinstr void native_flush_tlb_global(void)
 /*
  * Flush the entire current user mapping
  */
-STATIC_NOPV void native_flush_tlb_local(void)
+STATIC_NOPV noinstr void native_flush_tlb_local(void)
 {
 	/*
 	 * Preemption or interrupts must be disabled to protect the access
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
