Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E0BCE7B1B
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 15:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LuTYlvkSW1o9ouIdQtkitoNZsLRZn0bh2n/fRxgMkpE=; b=GBSKuU2qmkVXLJ
	uS7OPkZrCqZo/RNHf5YB6Of3jUcv63pmOspbmYb6bCMquUj1PTJAfLlnXx2IOV9pLMLIRwI2H7D2v
	snUB+2LM/sZVJHjCa9lZ0ieg2iI9OFj3K1cBD3gLTDxrruV3A8sG+eEp7mOhRxuO26cT+fkEkBAiW
	tcFnl/PGan28utA7hxGn9xyW+G5EXqdHzDqDjEqIQA2bw/XZVodkNiPS2H7DzlmO6WugLcRnpfqGw
	TE0UVV4mCtOH+IzY2HTNmCymK3uQaMQx1PH4rJOTCdbMnDRogVYPgiaMhPpU9h3/kh3TfxC5dc2VQ
	Utk0CngWEsHPB4C6V4Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvNq-0000000CSAN-1r7f;
	Fri, 14 Nov 2025 15:06:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvNo-0000000CS8o-3MVv
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0EVYMqufOoIHV82nAeE2u6YNjD+PUPB4KvH6NE2Jsio=; b=C4DWRzw7r0LJkxdeHYtAgNnxf/
	a71tH124zloJzokRbgao8oO7sPeMXQhqFND2A5vzolyX+E3pWmOZRVYHY/ULorREfpr/rNt9yNlc7
	5NTO+7Ra2s3K9aK8HSn6cPx0XBc8bcgIzaAjpgQPHjZx3FOGHbIbHXmCRNxgk+JejAl1tOUNwNi2A
	56GiKhUUEMq+ZwU9yx5IWjeSC1Zj6svkteKgfDrJX3iCS1WW33GPH4PXgmki52YD5OUs2p0gu/cyr
	RbwzVKRZgoaO1iRnclsaNOgIFs8tYlmzYTED/XYeWHCkd3F3fswk1yZ6+qdNKhm8u/l+FwL5ksUPA
	fpJ9OrJQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuW7-00000002lZh-0n51
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 14:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763132796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0EVYMqufOoIHV82nAeE2u6YNjD+PUPB4KvH6NE2Jsio=;
	b=HMeKA2bXI5bLuwlR8Qqp200aCArDqB1wusjkCkodJXsYEThzGBP4xoKWcAUEtj/veVJyCj
	EA+8uUG840dC+H2flTe70a0ZZiBH+uVVn2fVupLoQ7XJvwqjciOXytYP99esuuoGaU1/3i
	0PvqD8qzlyobsDi6BDoQgdYjxX7Y0A8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763132796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0EVYMqufOoIHV82nAeE2u6YNjD+PUPB4KvH6NE2Jsio=;
	b=HMeKA2bXI5bLuwlR8Qqp200aCArDqB1wusjkCkodJXsYEThzGBP4xoKWcAUEtj/veVJyCj
	EA+8uUG840dC+H2flTe70a0ZZiBH+uVVn2fVupLoQ7XJvwqjciOXytYP99esuuoGaU1/3i
	0PvqD8qzlyobsDi6BDoQgdYjxX7Y0A8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-404-cI01Fc2gNgiloAaXk9-ykA-1; Fri,
 14 Nov 2025 10:06:33 -0500
X-MC-Unique: cI01Fc2gNgiloAaXk9-ykA-1
X-Mimecast-MFC-AGG-ID: cI01Fc2gNgiloAaXk9-ykA_1763132786
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4213318AB432;
	Fri, 14 Nov 2025 15:06:26 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.226.10])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0671519560B9;
	Fri, 14 Nov 2025 15:06:12 +0000 (UTC)
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
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
	Petr Tesarik <ptesarik@suse.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH v7 17/31] x86/bugs: Mark cpu_buf_vm_clear key as allowed in .noinstr
Date: Fri, 14 Nov 2025 16:01:19 +0100
Message-ID: <20251114150133.1056710-18-vschneid@redhat.com>
In-Reply-To: <20251114150133.1056710-1-vschneid@redhat.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_141111_434957_2CF5A520 
X-CRM114-Status: GOOD (  13.45  )
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

The static key is only ever updated in

  __init mmio_apply_mitigation

Mark it to let objtool know not to warn about it.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/kernel/cpu/bugs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index d7fa03bf51b45..a2d7dc4d2a4a3 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -196,8 +196,11 @@ DEFINE_STATIC_KEY_FALSE(switch_mm_cond_l1d_flush);
  * Controls CPU Fill buffer clear before VMenter. This is a subset of
  * X86_FEATURE_CLEAR_CPU_BUF, and should only be enabled when KVM-only
  * mitigation is required.
+ *
+ * NOINSTR: This static key is only updated during init, so it can't be
+ * a cause of post-init interference.
  */
-DEFINE_STATIC_KEY_FALSE(cpu_buf_vm_clear);
+DEFINE_STATIC_KEY_FALSE_NOINSTR(cpu_buf_vm_clear);
 EXPORT_SYMBOL_GPL(cpu_buf_vm_clear);
 
 #undef pr_fmt
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
