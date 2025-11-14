Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A15FCE7B1E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 15:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bAr6/E3/aEQj3BEWy3xgqXsfBuElvn8UjrEKSTnD9bs=; b=yFuIBLfcus3h2D
	U4AeRBk0GNi2dkNATe4e5CzybGSk9cWgW65aiaZgnBM7HOeXaH+NpeUS6FK0w1chPOcl7i4fEWY9V
	43pwVYYVsgCAYEEnZdMiRk7yirO1bGZJWB0KtFZq0cYFxaqojXDV5/+pmWVKPndTQIweaKBdrSZT6
	80jbFFy8CpGenx1+7Dpg/8YHWl1C5aoE0ppI9MzFyxPoHw4zFFsDBUuMzdiHrY3poF661fOKm3VUK
	wsIDcWtOs4C61D/CCxHgpvttvZRIrn9DDEKNx4fPDnSjYKSJB5IGmHK0r16nDygK8TbRO1P/WiMzw
	Ok2dGKQcXeMjs16UYKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvWW-0000000CUFd-1ObN;
	Fri, 14 Nov 2025 15:15:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvWU-0000000CUEJ-1b1c
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:15:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4ORd+Fn6+m/VKC6BHOBwuPVWzflJh2ADAar+c08WU+E=; b=MnElb5ZdfZv1EJRKWVIEWwpyZq
	Qr+JzeBxt5XcrI+w6RCCO8Fzdm7w7CDhnE0st2f2pKPkhQ3fi3ltQFUzYDl6nlp9bYvoupsPoEuw4
	nPwlV8WtXWBoBbA3VRZFeUVjuEQ2AIkXhPQPPCpB1dtlDD7iAD6zAnMjv//w2ZK1/Iv9pK1V/Ri2D
	RrAKdW7QXQGVQevsppwF/xX11XVyjiq+HUmvK9nNe7XFUqb77vdi7X4zwbg2xb+0g2f942pCFU5WH
	rzYLLYEyvsSiyCmW4tsolnB5B06egRDj15IqqVDi19rQfibfdbIYuYD55c64L6UTZuNLlK34GOAyA
	RotexzLA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuel-00000002mjd-2KtQ
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 14:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763133333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ORd+Fn6+m/VKC6BHOBwuPVWzflJh2ADAar+c08WU+E=;
	b=CbCe+QLcqNZkQv9Ydm7u15a06Uxq4oTUj2rVb6EcNr08HQ20d/9vlCPlT/G/tMYEoBCrq/
	tJeE8qiWjACQ+GzioGJk5yeHya4xDWNpJUW+dr7756Oc3o25StRfBbZiXqNadB5YTSVZhZ
	jyjECHFTyLs5MD6Wh5pNPRFUrZwCoMo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763133333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ORd+Fn6+m/VKC6BHOBwuPVWzflJh2ADAar+c08WU+E=;
	b=CbCe+QLcqNZkQv9Ydm7u15a06Uxq4oTUj2rVb6EcNr08HQ20d/9vlCPlT/G/tMYEoBCrq/
	tJeE8qiWjACQ+GzioGJk5yeHya4xDWNpJUW+dr7756Oc3o25StRfBbZiXqNadB5YTSVZhZ
	jyjECHFTyLs5MD6Wh5pNPRFUrZwCoMo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-13-tXg0QNLVNguk-o74W8HyWg-1; Fri,
 14 Nov 2025 10:15:29 -0500
X-MC-Unique: tXg0QNLVNguk-o74W8HyWg-1
X-Mimecast-MFC-AGG-ID: tXg0QNLVNguk-o74W8HyWg_1763133325
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 077A11955F4A;
	Fri, 14 Nov 2025 15:15:25 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.226.10])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4BACB1800346;
	Fri, 14 Nov 2025 15:15:10 +0000 (UTC)
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
Subject: [PATCH v7 23/31] module: Add MOD_NOINSTR_TEXT mem_type
Date: Fri, 14 Nov 2025 16:14:20 +0100
Message-ID: <20251114151428.1064524-3-vschneid@redhat.com>
In-Reply-To: <20251114150133.1056710-1-vschneid@redhat.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_142008_360596_5A130C74 
X-CRM114-Status: GOOD (  20.38  )
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

As pointed out by Sean [1], is_kernel_noinstr_text() will return false for
an address contained within a module's .noinstr.text section. A later patch
will require checking whether a text address is noinstr, and this can
unfortunately be the case of modules - KVM is one such case.

A module's .noinstr.text section is already tracked as of commit
  66e9b0717102 ("kprobes: Prevent probes in .noinstr.text section")
for kprobe blacklisting purposes, but via an ad-hoc mechanism.

Add a MOD_NOINSTR_TEXT mem_type, and reorganize __layout_sections() so that
it maps all the sections in a single invocation.

[1]: http://lore.kernel.org/r/Z4qQL89GZ_gk0vpu@google.com
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 include/linux/module.h |  6 ++--
 kernel/kprobes.c       |  8 ++---
 kernel/module/main.c   | 76 ++++++++++++++++++++++++++++++++----------
 3 files changed, 66 insertions(+), 24 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index e135cc79aceea..c0911973337c6 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -322,6 +322,7 @@ struct mod_tree_node {
 
 enum mod_mem_type {
 	MOD_TEXT = 0,
+	MOD_NOINSTR_TEXT,
 	MOD_DATA,
 	MOD_RODATA,
 	MOD_RO_AFTER_INIT,
@@ -492,8 +493,6 @@ struct module {
 	void __percpu *percpu;
 	unsigned int percpu_size;
 #endif
-	void *noinstr_text_start;
-	unsigned int noinstr_text_size;
 
 #ifdef CONFIG_TRACEPOINTS
 	unsigned int num_tracepoints;
@@ -622,12 +621,13 @@ static inline bool module_is_coming(struct module *mod)
         return mod->state == MODULE_STATE_COMING;
 }
 
-struct module *__module_text_address(unsigned long addr);
 struct module *__module_address(unsigned long addr);
+struct module *__module_text_address(unsigned long addr);
 bool is_module_address(unsigned long addr);
 bool __is_module_percpu_address(unsigned long addr, unsigned long *can_addr);
 bool is_module_percpu_address(unsigned long addr);
 bool is_module_text_address(unsigned long addr);
+bool is_module_noinstr_text_address(unsigned long addr);
 
 static inline bool within_module_mem_type(unsigned long addr,
 					  const struct module *mod,
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index ab8f9fc1f0d17..d60560dddec56 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -2551,9 +2551,9 @@ static void add_module_kprobe_blacklist(struct module *mod)
 		kprobe_add_area_blacklist(start, end);
 	}
 
-	start = (unsigned long)mod->noinstr_text_start;
+	start = (unsigned long)mod->mem[MOD_NOINSTR_TEXT].base;
 	if (start) {
-		end = start + mod->noinstr_text_size;
+		end = start + mod->mem[MOD_NOINSTR_TEXT].size;
 		kprobe_add_area_blacklist(start, end);
 	}
 }
@@ -2574,9 +2574,9 @@ static void remove_module_kprobe_blacklist(struct module *mod)
 		kprobe_remove_area_blacklist(start, end);
 	}
 
-	start = (unsigned long)mod->noinstr_text_start;
+	start = (unsigned long)mod->mem[MOD_NOINSTR_TEXT].base;
 	if (start) {
-		end = start + mod->noinstr_text_size;
+		end = start + mod->mem[MOD_NOINSTR_TEXT].size;
 		kprobe_remove_area_blacklist(start, end);
 	}
 }
diff --git a/kernel/module/main.c b/kernel/module/main.c
index c66b261849362..1f5bfdbb956a7 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1653,7 +1653,17 @@ bool module_init_layout_section(const char *sname)
 	return module_init_section(sname);
 }
 
-static void __layout_sections(struct module *mod, struct load_info *info, bool is_init)
+static bool module_noinstr_layout_section(const char *sname)
+{
+	return strstarts(sname, ".noinstr");
+}
+
+static bool module_default_layout_section(const char *sname)
+{
+	return !module_init_layout_section(sname) && !module_noinstr_layout_section(sname);
+}
+
+static void __layout_sections(struct module *mod, struct load_info *info)
 {
 	unsigned int m, i;
 
@@ -1662,20 +1672,44 @@ static void __layout_sections(struct module *mod, struct load_info *info, bool i
 	 *   Mask of excluded section header flags }
 	 */
 	static const unsigned long masks[][2] = {
+		/* Core */
+		{ SHF_EXECINSTR | SHF_ALLOC, ARCH_SHF_SMALL },
+		{ SHF_EXECINSTR | SHF_ALLOC, ARCH_SHF_SMALL },
+		{ SHF_ALLOC, SHF_WRITE | ARCH_SHF_SMALL },
+		{ SHF_RO_AFTER_INIT | SHF_ALLOC, ARCH_SHF_SMALL },
+		{ SHF_WRITE | SHF_ALLOC, ARCH_SHF_SMALL },
+		{ ARCH_SHF_SMALL | SHF_ALLOC, 0 },
+		/* Init */
 		{ SHF_EXECINSTR | SHF_ALLOC, ARCH_SHF_SMALL },
 		{ SHF_ALLOC, SHF_WRITE | ARCH_SHF_SMALL },
 		{ SHF_RO_AFTER_INIT | SHF_ALLOC, ARCH_SHF_SMALL },
 		{ SHF_WRITE | SHF_ALLOC, ARCH_SHF_SMALL },
-		{ ARCH_SHF_SMALL | SHF_ALLOC, 0 }
+		{ ARCH_SHF_SMALL | SHF_ALLOC, 0 },
 	};
-	static const int core_m_to_mem_type[] = {
+	static bool (*const section_filter[])(const char *) = {
+		/* Core */
+		module_default_layout_section,
+		module_noinstr_layout_section,
+		module_default_layout_section,
+		module_default_layout_section,
+		module_default_layout_section,
+		module_default_layout_section,
+		/* Init */
+		module_init_layout_section,
+		module_init_layout_section,
+		module_init_layout_section,
+		module_init_layout_section,
+		module_init_layout_section,
+	};
+	static const int mem_type_map[] = {
+		/* Core */
 		MOD_TEXT,
+		MOD_NOINSTR_TEXT,
 		MOD_RODATA,
 		MOD_RO_AFTER_INIT,
 		MOD_DATA,
 		MOD_DATA,
-	};
-	static const int init_m_to_mem_type[] = {
+		/* Init */
 		MOD_INIT_TEXT,
 		MOD_INIT_RODATA,
 		MOD_INVALID,
@@ -1684,16 +1718,16 @@ static void __layout_sections(struct module *mod, struct load_info *info, bool i
 	};
 
 	for (m = 0; m < ARRAY_SIZE(masks); ++m) {
-		enum mod_mem_type type = is_init ? init_m_to_mem_type[m] : core_m_to_mem_type[m];
+		enum mod_mem_type type = mem_type_map[m];
 
 		for (i = 0; i < info->hdr->e_shnum; ++i) {
 			Elf_Shdr *s = &info->sechdrs[i];
 			const char *sname = info->secstrings + s->sh_name;
 
-			if ((s->sh_flags & masks[m][0]) != masks[m][0]
-			    || (s->sh_flags & masks[m][1])
-			    || s->sh_entsize != ~0UL
-			    || is_init != module_init_layout_section(sname))
+			if ((s->sh_flags & masks[m][0]) != masks[m][0] ||
+			    (s->sh_flags & masks[m][1])                ||
+			    s->sh_entsize != ~0UL                      ||
+			    !section_filter[m](sname))
 				continue;
 
 			if (WARN_ON_ONCE(type == MOD_INVALID))
@@ -1733,10 +1767,7 @@ static void layout_sections(struct module *mod, struct load_info *info)
 		info->sechdrs[i].sh_entsize = ~0UL;
 
 	pr_debug("Core section allocation order for %s:\n", mod->name);
-	__layout_sections(mod, info, false);
-
-	pr_debug("Init section allocation order for %s:\n", mod->name);
-	__layout_sections(mod, info, true);
+	__layout_sections(mod, info);
 }
 
 static void module_license_taint_check(struct module *mod, const char *license)
@@ -2625,9 +2656,6 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 	}
 #endif
 
-	mod->noinstr_text_start = section_objs(info, ".noinstr.text", 1,
-						&mod->noinstr_text_size);
-
 #ifdef CONFIG_TRACEPOINTS
 	mod->tracepoints_ptrs = section_objs(info, "__tracepoints_ptrs",
 					     sizeof(*mod->tracepoints_ptrs),
@@ -3872,12 +3900,26 @@ struct module *__module_text_address(unsigned long addr)
 	if (mod) {
 		/* Make sure it's within the text section. */
 		if (!within_module_mem_type(addr, mod, MOD_TEXT) &&
+		    !within_module_mem_type(addr, mod, MOD_NOINSTR_TEXT) &&
 		    !within_module_mem_type(addr, mod, MOD_INIT_TEXT))
 			mod = NULL;
 	}
 	return mod;
 }
 
+bool is_module_noinstr_text_address(unsigned long addr)
+{
+	scoped_guard(preempt) {
+		struct module *mod = __module_address(addr);
+
+		/* Make sure it's within the .noinstr.text section. */
+		if (mod)
+			return within_module_mem_type(addr, mod, MOD_NOINSTR_TEXT);
+	}
+
+	return false;
+}
+
 /* Don't grab lock, we're oopsing. */
 void print_modules(void)
 {
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
