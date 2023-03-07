Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52847C678D4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 15:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1yfjuLHo8PhfnYscO8Q52Y/G5oENcYfHhT+gXnOkq0=; b=BMDo3MZGdpgsY6
	p5UmKIVn10tYBg1URc77gWoPsuGKrKrKNeg0HUmWr68vIbFmS4MtNFkxiNJbXinaqVoNF6418S0hI
	n9KYEDcdcKPbjZ01sD/NXZ6ZDTgOcD1RoCiDpHfrj8Wfjn2USSbckUGXeo3jJoC6VL/9ldUTm3x2i
	sm5O1DFRZIqvNH3db8MVxEgYL4Z/oBhIwB9m9OvZeHiCAm+p5rPAwZ81omhC3q6xzz07grgKM0Xd1
	86vfO8ho+5jRUjJnfQTjxNjn+zT6O7JUitm7j7ztg7m3Is6IIZL1F7MOqKi4gH9pNy0QFXOYkI0d1
	EsYAIUbNUJGbC6NViJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZYxV-00175A-Bk; Tue, 07 Mar 2023 15:10:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZYQp-000rAQ-Ho
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 14:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678199806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EP4LqydUSiQVulPj8M4fIZioGJfqcQn9EHXEOk9M9cI=;
	b=HydYYez2NxR/AJvWf/guDbcPXbBQUPskuG1M3+vhgNE5rpTTnDCVTJZWKMzD2dz+jN3KRg
	rVjVDUuk/BSty4l+a5iiiAsTVQl3V7QM/DZe0OKdAuXN6xpM1vmP+2TJCifB765Ui6ZQBQ
	0kAlTWbkTOzVmTv3Pz4DsjWejSY+Cew=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-pvm_78mlN3uZ4lMOoHRrTA-1; Tue, 07 Mar 2023 09:36:43 -0500
X-MC-Unique: pvm_78mlN3uZ4lMOoHRrTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E2991C0419A;
	Tue,  7 Mar 2023 14:36:40 +0000 (UTC)
Received: from vschneid.remote.csb (unknown [10.33.37.13])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DFE840B40E4;
	Tue,  7 Mar 2023 14:36:36 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	x86@kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicholas Piggin <npiggin@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v5 3/7] smp: Trace IPIs sent via arch_send_call_function_ipi_mask()
Date: Tue,  7 Mar 2023 14:35:54 +0000
Message-Id: <20230307143558.294354-4-vschneid@redhat.com>
In-Reply-To: <20230307143558.294354-1-vschneid@redhat.com>
References: <20230307143558.294354-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_063647_712088_EA63BB68 
X-CRM114-Status: GOOD (  14.33  )
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

This simply wraps around the arch function and prepends it with a
tracepoint, similar to send_call_function_single_ipi().

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/smp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/smp.c b/kernel/smp.c
index e2ca1e2f31274..93b4386cd3096 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -160,6 +160,13 @@ void __init call_function_init(void)
 	smpcfd_prepare_cpu(smp_processor_id());
 }
 
+static __always_inline void
+send_call_function_ipi_mask(const struct cpumask *mask)
+{
+	trace_ipi_send_cpumask(mask, _RET_IP_, NULL);
+	arch_send_call_function_ipi_mask(mask);
+}
+
 #ifdef CONFIG_CSD_LOCK_WAIT_DEBUG
 
 static DEFINE_STATIC_KEY_FALSE(csdlock_debug_enabled);
@@ -970,7 +977,7 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
 		if (nr_cpus == 1)
 			send_call_function_single_ipi(last_cpu);
 		else if (likely(nr_cpus > 1))
-			arch_send_call_function_ipi_mask(cfd->cpumask_ipi);
+			send_call_function_ipi_mask(cfd->cpumask_ipi);
 
 		cfd_seq_store(this_cpu_ptr(&cfd_seq_local)->pinged, this_cpu, CFD_SEQ_NOCPU, CFD_SEQ_PINGED);
 	}
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
