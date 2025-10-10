Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AC7CCA476
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 15:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejIMNKcgs+nbS0dSFko4SneREnk/Z2tBlNsSOalem1Q=; b=D2XWYYc9P8F9rX
	dYibZXSI1en9Kb8+RH/noO/1dSMFN6AEc/i2G5aN991t634xtfGqz2wI7pCBSn+tDw6+mlTTZRdmR
	Z0jFufOWtMcJbOdQ/1TDWEi0/5TqVy3NZja2ee4VYpqRElJvc/JtmqXRPZQaNtn+/sZMSRBO+MmK0
	+WYbUtXnuyuRclJnVgLQyHai+n1XjoSo5N2bwpOZgNDSgWg5+fphxVwz2A55cYD0zuduPaZRWL6PM
	6OnYAsCBkie4tdYZlByHEckEQq2TZsH1r1rMJ7RfKGLSkeZ00JTBZVzEce5iqIr1bA/4xhyEJsXho
	31kj26JprV6kN2pJUIpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FIq-00000008sWe-0tJz;
	Fri, 10 Oct 2025 15:45:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FIo-00000008sUX-2Rj8
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 Oct 2025 15:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lA5CHRSnZ1rgFxjlHeMvJuEi1mBcTnDR9FDgvniUAeE=; b=NvI+VQgN95haCWZTCT6zY9L56J
	0aVsU44HTbfA3jD9lv6TgZoxfS8X8coTf06rQ10lFOTeYBqcQqws11NKfzqOsNPQmsYbqddHKSNHA
	KypgtGJoCtrwXWSVwi+TJ6PGog+5X25hA+VlJ7ZsL7SmMly+P4z1LZPj1mBgxWUpiJymy4zQScnfp
	i1Z7i6D/h6HEPU9mAYklgfnMpVVgBtrO5SeiUndZGOaVfCsHqeqR0om+aSFb3/JT133pWtXaCvkot
	l+jIfMBdUXvxVZeqEbZwgvkV7LmlwbrW3e5zFGzuctJ7lQZxlNPc3BCLLR3x1SrVZ+ql2pnm/cIuZ
	E+BJevrQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FIl-00000002F3Y-1LXq
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 15:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lA5CHRSnZ1rgFxjlHeMvJuEi1mBcTnDR9FDgvniUAeE=;
	b=D6Mk4Gt8JOkSCjVGOiNC0LHE8dZ2veuvQ6zl1TMWXjiRArh7cUdHfFZgFYlZAbKxMjm9tG
	izplcXfS142e5sVBDysutVUM3uutg3P+xP8Y2gatC1TfwAtbfuiviM6E9xi2Q//ftSbNcU
	VG2kqtGCzkfslVgUgDpu+JVIXpIUWeM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lA5CHRSnZ1rgFxjlHeMvJuEi1mBcTnDR9FDgvniUAeE=;
	b=D6Mk4Gt8JOkSCjVGOiNC0LHE8dZ2veuvQ6zl1TMWXjiRArh7cUdHfFZgFYlZAbKxMjm9tG
	izplcXfS142e5sVBDysutVUM3uutg3P+xP8Y2gatC1TfwAtbfuiviM6E9xi2Q//ftSbNcU
	VG2kqtGCzkfslVgUgDpu+JVIXpIUWeM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-205-1nR1k9OtNHyFHWxfDt3B_A-1; Fri,
 10 Oct 2025 11:45:00 -0400
X-MC-Unique: 1nR1k9OtNHyFHWxfDt3B_A-1
X-Mimecast-MFC-AGG-ID: 1nR1k9OtNHyFHWxfDt3B_A_1760111095
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 372811800343;
	Fri, 10 Oct 2025 15:44:55 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.224.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C27A18004D8;
	Fri, 10 Oct 2025 15:44:40 +0000 (UTC)
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
Cc: Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
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
Subject: [PATCH v6 16/29] KVM: VMX: Mark __kvm_is_using_evmcs static key as __ro_after_init
Date: Fri, 10 Oct 2025 17:38:26 +0200
Message-ID: <20251010153839.151763-17-vschneid@redhat.com>
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_164503_673097_95E50D95 
X-CRM114-Status: GOOD (  13.38  )
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

The static key is only ever enabled in

  __init hv_init_evmcs()

so mark it appropriately as __ro_after_init.

Reported-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/kvm/vmx/vmx_onhyperv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/vmx_onhyperv.c b/arch/x86/kvm/vmx/vmx_onhyperv.c
index b9a8b91166d02..ff3d80c9565bb 100644
--- a/arch/x86/kvm/vmx/vmx_onhyperv.c
+++ b/arch/x86/kvm/vmx/vmx_onhyperv.c
@@ -3,7 +3,7 @@
 #include "capabilities.h"
 #include "vmx_onhyperv.h"
 
-DEFINE_STATIC_KEY_FALSE(__kvm_is_using_evmcs);
+DEFINE_STATIC_KEY_FALSE_RO(__kvm_is_using_evmcs);
 
 /*
  * KVM on Hyper-V always uses the latest known eVMCSv1 revision, the assumption
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
