Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA98C02188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 18:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TgUBnnfaRLXeyfekrSPbokvztjw5tE8kh6pqY5Ty9dQ=; b=bwgugtyaIkkr3C
	E8d7NuFxl1bYlBwojEnRrHloKKTRfJ2xRfrYHXkvtgLXt8OGbY39ahcDkM9Gbg628fCcEPjAODxGG
	0iNT9qNmwFeOfg4zTcL7XYX+KmmUJ/NY5/Vx395Ik6LPXqWrIpU3p5n7crjUGHTbom3F7iDP++IoP
	mkwC5CxlPhKOBHKzeY5KFYmFFyL/vliLjHZGG5l6UAgcvm4eIrO+BnjWxHRFSzXsXv8Oc6r8ZFSdi
	ztBQaUb2A/nIMOsFdOeolIsZno70o4FCKCTcvDZTkMyZR3SzQxud6rLlxXe7GnAJYMs3AGC6gD1Pk
	kdGjvQQJ3vfz1nfGARfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlI5-00000009L1k-2JtZ;
	Tue, 14 Jan 2025 18:05:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlEx-00000009JNi-2b9x
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Jan 2025 18:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KdPtt6PQsN+ylVvy58F0NcuUnOqkUWc+oSjD61c8P1k=; b=KNo3e6ct8zW1bC8N3jUW8qEU+N
	dtVpZauYi7EW4HgT/kG5S/m14Dv09DYMqFhH7z35m1D3sF8Kxj03Yj8OGSbyN3BP/V9bAl8cpR/tz
	GDJPEGiUxg33l6cLgDXMECEuhWnEE3WCbJd8MgU0gc51j+mtdAyPS6HjTshgvNHopEwlyqGHB4Jc/
	uz9Xh+ynWl3FRDUjIRtsfbS3Zei3gB7xtwUP0lvzh/dBWZulsO5LWql942BiJTomw+S9dWY+UESTG
	AG4cWrS2EztJz7TCRaassyFluNXctVodfxGq7MHzvvAxdJy+zt9KvFAumVahnJn2iG/KN/aCXrfSg
	nL2dDT/Q==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlEu-0000000AVrM-34Rc
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 18:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736877727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KdPtt6PQsN+ylVvy58F0NcuUnOqkUWc+oSjD61c8P1k=;
	b=JxSKU6z7TIUqS5xF4LeFICqGkb1QmGYALJ0WYaKdh6VVKfTpANtqbGiccJx+uXOQi8543F
	ba6YlmI9mKvGBqvDECDOmo8+X/AK90wr7qj+YrVmBXprmsVQBNxs1rdHeiLk7g8tjQmdsH
	BqHvU8nVSQ+oCi7uBaKOLzyieZRE3+s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736877727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KdPtt6PQsN+ylVvy58F0NcuUnOqkUWc+oSjD61c8P1k=;
	b=JxSKU6z7TIUqS5xF4LeFICqGkb1QmGYALJ0WYaKdh6VVKfTpANtqbGiccJx+uXOQi8543F
	ba6YlmI9mKvGBqvDECDOmo8+X/AK90wr7qj+YrVmBXprmsVQBNxs1rdHeiLk7g8tjQmdsH
	BqHvU8nVSQ+oCi7uBaKOLzyieZRE3+s=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-cs0jRgydMTW_3xbdYVeS2w-1; Tue,
 14 Jan 2025 13:02:03 -0500
X-MC-Unique: cs0jRgydMTW_3xbdYVeS2w-1
X-Mimecast-MFC-AGG-ID: cs0jRgydMTW_3xbdYVeS2w
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E1CD319772CA;
	Tue, 14 Jan 2025 18:01:45 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.39.192.55])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F01A195E3EA;
	Tue, 14 Jan 2025 18:01:23 +0000 (UTC)
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
Subject: [PATCH v4 21/30] context_tracking: Explicitely use CT_STATE_KERNEL where it is missing
Date: Tue, 14 Jan 2025 18:51:34 +0100
Message-ID: <20250114175143.81438-22-vschneid@redhat.com>
In-Reply-To: <20250114175143.81438-1-vschneid@redhat.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_180209_023753_812DC06A 
X-CRM114-Status: GOOD (  15.73  )
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

CT_STATE_KERNEL being zero means it can be (and is) omitted in a handful of
places. A later patch will change CT_STATE_KERNEL into a non-zero value,
prepare that by using it where it should be:

o In the initial CT state
o At kernel entry / exit

No change in functionality intended.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/context_tracking.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
index 938c48952d265..a61498a8425e2 100644
--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -31,7 +31,7 @@ DEFINE_PER_CPU(struct context_tracking, context_tracking) = {
 	.nesting = 1,
 	.nmi_nesting = CT_NESTING_IRQ_NONIDLE,
 #endif
-	.state = ATOMIC_INIT(CT_RCU_WATCHING),
+	.state = ATOMIC_INIT(CT_RCU_WATCHING | CT_STATE_KERNEL),
 };
 EXPORT_SYMBOL_GPL(context_tracking);
 
@@ -147,7 +147,7 @@ static void noinstr ct_kernel_exit(bool user, int offset)
 	instrumentation_end();
 	WRITE_ONCE(ct->nesting, 0); /* Avoid irq-access tearing. */
 	// RCU is watching here ...
-	ct_kernel_exit_state(offset);
+	ct_kernel_exit_state(offset - CT_STATE_KERNEL);
 	// ... but is no longer watching here.
 	rcu_task_exit();
 }
@@ -175,7 +175,7 @@ static void noinstr ct_kernel_enter(bool user, int offset)
 	}
 	rcu_task_enter();
 	// RCU is not watching here ...
-	ct_kernel_enter_state(offset);
+	ct_kernel_enter_state(offset + CT_STATE_KERNEL);
 	// ... but is watching here.
 	instrumentation_begin();
 
@@ -537,7 +537,7 @@ void noinstr __ct_user_enter(enum ctx_state state)
 				 * RCU only requires CT_RCU_WATCHING increments to be fully
 				 * ordered.
 				 */
-				raw_atomic_add(state, &ct->state);
+				raw_atomic_add(state - CT_STATE_KERNEL, &ct->state);
 			}
 		}
 	}
@@ -647,7 +647,7 @@ void noinstr __ct_user_exit(enum ctx_state state)
 				 * RCU only requires CT_RCU_WATCHING increments to be fully
 				 * ordered.
 				 */
-				raw_atomic_sub(state, &ct->state);
+				raw_atomic_sub(state - CT_STATE_KERNEL, &ct->state);
 			}
 		}
 	}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
