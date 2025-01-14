Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F598C02188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 19:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=paau4ZRa3FCEDtRFZzu6GA3vjiFFpUSvgA41B+oFKTo=; b=ShWeVeJJ3H1xm9
	ozgE/FGf2QwwQj0XV9gis3cJRc4rN5bllGz8k9eEccR2KsmdysESV6izjQ29n/+qDgglw+PEEMx/d
	dZH/LvL0P6SEj8U9ZGCU2biEkMDu1M+qfM3dSA5KWEZrBY1v/e7/DVQQmWyGc2aq0I299Nk+CEaFL
	vbQ2YemZRK5iL1FvhNra6I44aR72p12POVHbfIi8iGvrs6WYTDD6WC/Dsf/Os5p87uN83VhlKbwp3
	gw0QD5e3Lg3EwMzUdFkanFVO0YiXlaFx5cFr33yZwpnLiI50SsffkFnVmOrCquP3goa+5oeCqANtW
	QsUnsenymVKjwGvgdpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmPr-00000009Vgk-3LQX;
	Tue, 14 Jan 2025 19:17:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlHI-00000009Kba-2Gt3
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Jan 2025 18:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uZZLtjs3Zw6jRIC16nznFhpiKaBBT8sXvDLj8C27htE=; b=aM/KRnIvPB15XKoRKcVjzLTgXf
	IYrZu8HkWZu2zAXyf/ruK7rInipzLZoB4NZzOB0/zmr88wuax1JcJm3BdIhQ2fEYjT8JC7VNSVThm
	5N8aqulYEXgfILQLoShtCAcWd5JK8P/FKaIOwa0UkGzGCjZshqyWsJ8Qdlr7qxhRIbfRY/vA193ZJ
	5X0/TdnOQfuVeLI9ncx1jzdzpskYIb6xtTbC2Hnafc9xDH3ABFykLbmISpxu6voI6ABRlU0R9tNX7
	2GkIuU4zR4r5XQylMh9Xta4n0kyovUsATxbN6XpWdhHPNztUDub5LA01kimp8VlBGx7g6aT6VjQVM
	nmyrgTOw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlHF-0000000AWDo-1Nw3
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 18:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736877871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZZLtjs3Zw6jRIC16nznFhpiKaBBT8sXvDLj8C27htE=;
	b=IRLYbPE1iQ7D+oFw/E8QsjMOw9Aa5YcdjjYc0ucb2YmBi3FfcGKPkSK+QVEtA5VwwC0LIo
	dWkG6gFS0hT0GrZISpcM/Q7gq3HCrcMmzMa7JDI8nUdxvNxpVlMHorK7H8jKtphBXq8IB/
	q+6XdhmiOX1j0S69BgsghHtyBJnc81Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736877872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZZLtjs3Zw6jRIC16nznFhpiKaBBT8sXvDLj8C27htE=;
	b=bEpWztvaMSd+4l3KaSfenYB6JRRwYJUdjp3no0BTQrskoJREL+oY2vIsbmfs8xs7HPrIYx
	KI2bGdl40oFD2SxSB1roP7CREaxk6iGZbztLNqiQUTtLDKQEHUVgQZhbZcCqOC7jtvbMIa
	YfXz6JmSaLdbcQLhxxIe1fxZMGGQFfU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-442-YsncyNivNYmsu48rkVhymA-1; Tue,
 14 Jan 2025 13:04:29 -0500
X-MC-Unique: YsncyNivNYmsu48rkVhymA-1
X-Mimecast-MFC-AGG-ID: YsncyNivNYmsu48rkVhymA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7D431955DCF;
	Tue, 14 Jan 2025 18:04:25 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.39.192.55])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C14D195608A;
	Tue, 14 Jan 2025 18:04:03 +0000 (UTC)
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
Subject: [PATCH v4 28/30] x86/tlb: Make __flush_tlb_all() noinstr
Date: Tue, 14 Jan 2025 18:51:41 +0100
Message-ID: <20250114175143.81438-29-vschneid@redhat.com>
In-Reply-To: <20250114175143.81438-1-vschneid@redhat.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_180433_775366_E4321D65 
X-CRM114-Status: GOOD (  15.33  )
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
Both __flush_tlb_local() and __flush_tlb_global() are now
noinstr-compliant, so __flush_tlb_all() can be made noinstr itself.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/include/asm/tlbflush.h | 2 +-
 arch/x86/mm/tlb.c               | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 69e79fff41b80..4d11396250999 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -17,7 +17,7 @@
 
 DECLARE_PER_CPU(u64, tlbstate_untag_mask);
 
-void __flush_tlb_all(void);
+noinstr void __flush_tlb_all(void);
 
 #define TLB_FLUSH_ALL	-1UL
 #define TLB_GENERATION_INVALID	0
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 18b40bbc2fa15..119765772ab11 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1229,7 +1229,7 @@ void flush_tlb_local(void)
 /*
  * Flush everything
  */
-void __flush_tlb_all(void)
+noinstr void __flush_tlb_all(void)
 {
 	/*
 	 * This is to catch users with enabled preemption and the PGE feature
@@ -1243,7 +1243,7 @@ void __flush_tlb_all(void)
 		/*
 		 * !PGE -> !PCID (setup_pcid()), thus every flush is total.
 		 */
-		flush_tlb_local();
+		__flush_tlb_local();
 	}
 }
 EXPORT_SYMBOL_GPL(__flush_tlb_all);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
