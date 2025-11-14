Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E2ACE7B1E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 15:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YusRjde0NixspZNAzNBK4OGCcoi2mOY7Sc8rEhqjIG0=; b=vEAs25nUiMNzOd
	YxBWKabVNRtGyu3CROU3m7Ue8cN7xO0grGWAAHN08s+u+aDvMrgurEk8oyUAvu4tMPA3d0qpb15BD
	188uuELSze6sM1Rbnra89fLZZw2FCSNWKF70B5T3LO5c33IBGG+uszAkKq6e2RyA6B2ET795fI8qE
	9ZJhnDOmGfBNWKNM4d/tBrETSAhQmNhf5PFxkHb3wXK3+Tir+lwTVXnqCYRYxOB/xBRKoAdw6wGXM
	SYVrCgMMBjiZb/9E6PiN+Wm5ZMOuIAWa6KN6Dw6Fw3ilzWnFY6DYIcIyCuxZSLzN2Gko+dAyoRdfC
	fDC+cWT5v8RU+ZDnspJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvXU-0000000CUn3-1Sir;
	Fri, 14 Nov 2025 15:16:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvXS-0000000CUl8-25vT
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3wtNiwO7mQgs61ieJ83HPyGKadANIMB4TUgH9LUJTDI=; b=cDP+WWGrl5R0ZqGIJk1RRRrZB7
	klQCTdWnWXd1oYFa4AenseasuNK+f9WDgJpOmHKKSvnw9Mjrmv7kjlE3VOpsPvO5eOHrLA+NvNkB2
	ynoMTXnmkLQGmU9j5mxzAuiGm1J2j0BI6U3GvKEFh8B0dYlB0hmjyyjg9W3HbtM68MVSMQL669ZeZ
	8Q/n9NX+WaANzw/Z7Rc41A3pFBIfVyU5o/LGdCMV06v1iFiIRHazaNz2H5IQXXZQz1GvgJdvT25oZ
	+J4CcPUVYS4x4W8X7R3UVVs8AyHsty/9Q6MaIQuwB0rGrdm1hgHID+8LKK3JQJTty20XAo5XWDSR2
	e44wK7CQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJufi-00000002n0f-04c8
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 14:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763133390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3wtNiwO7mQgs61ieJ83HPyGKadANIMB4TUgH9LUJTDI=;
	b=b8YqE8f3cGF26jaa1SFePAlAIG2SzoB1UNCMSZVx0hljOTLnXVcPItnO2mdc9bRXGQMOhk
	dL34V4dMaKJY9ATRZlEE57kIKLyGsKwUjj6kDH/3TiMkhtZWU6tpCQNtA7Hncvw1GaWf/A
	nSL2vu8EdH7BB9Ih7PS4kQ61WrG9s+Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763133391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3wtNiwO7mQgs61ieJ83HPyGKadANIMB4TUgH9LUJTDI=;
	b=OEwULsiskDQhiD+Ct/P/nuOCQgfcDy3YtpwsqD04si1hMbaoy+sQ6XtwQs1PZseVL4HxKk
	crtHTlTMxOHjv9u+2HwhAULl4Mo7svka13BnvBqnubS5zOtQTLZ8ZOw19mGnwSBOe0gWwg
	Nsl361+d3oXI8nxpWDp3iD3UkgWG5RI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-530-KUYqLZu4MQq0ZGtzVQ5_Tw-1; Fri,
 14 Nov 2025 10:16:26 -0500
X-MC-Unique: KUYqLZu4MQq0ZGtzVQ5_Tw-1
X-Mimecast-MFC-AGG-ID: KUYqLZu4MQq0ZGtzVQ5_Tw_1763133376
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 286521956094;
	Fri, 14 Nov 2025 15:16:16 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.226.10])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EF3DD1800451;
	Fri, 14 Nov 2025 15:15:59 +0000 (UTC)
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
Cc: Frederic Weisbecker <frederic@kernel.org>,
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
	Petr Tesarik <ptesarik@suse.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH v7 26/31] x86/jump_label: Add ASM support for static_branch_likely()
Date: Fri, 14 Nov 2025 16:14:23 +0100
Message-ID: <20251114151428.1064524-6-vschneid@redhat.com>
In-Reply-To: <20251114150133.1056710-1-vschneid@redhat.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_142106_231648_0327ECF3 
X-CRM114-Status: GOOD (  15.43  )
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

A later commit will add some early entry code that only needs to be
executed if nohz_full is present on the cmdline, not just if
CONFIG_NO_HZ_FULL is compiled in. Add an ASM-callable static branch macro.

Note that I haven't found a way to express unlikely (i.e. out-of-line)
static branches in ASM macros without using extra jumps, which kind of
defeats the purpose. Consider:

  .macro FOOBAR
	  // Key enabled:  JMP .Ldostuff_\@
	  // Key disabled: NOP
	  STATIC_BRANCH_UNLIKELY key, .Ldostuff_\@ // Patched to JMP if enabled
	  jmp .Lend_\@
  .Ldostuff_\@:
	  <dostuff>
  .Lend_\@:
  .endm

Instead, this should be expressed as a likely (i.e. in-line) static key:

  .macro FOOBAR
	  // Key enabled:  NOP
	  // Key disabled: JMP .Lend_\@
	  STATIC_BRANCH_LIKELY key, .Lend\@ // Patched to NOP if enabled
	  <dostuff>
  .Lend_\@:
  .endm

Suggested-by: Frederic Weisbecker <frederic@kernel.org>
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/include/asm/jump_label.h | 33 ++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/jump_label.h b/arch/x86/include/asm/jump_label.h
index 61dd1dee7812e..3c9ba3948e225 100644
--- a/arch/x86/include/asm/jump_label.h
+++ b/arch/x86/include/asm/jump_label.h
@@ -7,7 +7,38 @@
 #include <asm/asm.h>
 #include <asm/nops.h>
 
-#ifndef __ASSEMBLER__
+#ifdef __ASSEMBLER__
+
+/*
+ * There isn't a neat way to craft unlikely static branches in ASM, so they
+ * all have to be expressed as likely (inline) static branches. This macro
+ * thus assumes a "likely" usage.
+ */
+.macro ARCH_STATIC_BRANCH_LIKELY_ASM key, label, jump, hack
+1:
+.if \jump || \hack
+	jmp \label
+.else
+	.byte BYTES_NOP5
+.endif
+	.pushsection __jump_table, "aw"
+	_ASM_ALIGN
+	.long 1b - .
+	.long \label - .
+	/* LIKELY so bit0=1, bit1=hack */
+	_ASM_PTR \key + 1 + (\hack << 1) - .
+	.popsection
+.endm
+
+.macro STATIC_BRANCH_TRUE_LIKELY key, label
+	ARCH_STATIC_BRANCH_LIKELY_ASM \key, \label, 0, IS_ENABLED(CONFIG_HAVE_JUMP_LABEL_HACK)
+.endm
+
+.macro STATIC_BRANCH_FALSE_LIKELY key, label
+	ARCH_STATIC_BRANCH_LIKELY_ASM \key, \label, 1, 0
+.endm
+
+#else /* !__ASSEMBLER__ */
 
 #include <linux/stringify.h>
 #include <linux/types.h>
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
