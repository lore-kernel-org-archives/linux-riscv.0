Return-Path: <SRS0=p8lL=J3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFBFC433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 02:48:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F232261433
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 02:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F232261433
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P3rDzKbhU9ZUOlz6vLP9JO18/Frxq9VZebMdBSkY+r0=; b=GmilKTl/SZNC/cM2POTOPOR4b
	39k0FrvPDioe4s0VtQtx8vs2neQ5iziyl5r69Mp832/kOAEJ47z34TzZuAg//Gyd2QDemSCvWB/6O
	QI/NuleGsF2fYVYcSM8p1m1ALFLj9so/mOjZx+JgFl6DVvRLPJBV1pHGYRe2+I43R0GgN9t0aRB0T
	wo/XYIqMVwW/V+0uSGWfQmMV5orZV6WgLyPF+D5e8dVRZgIxtEZVEwsWzkJMUXhyaqE4Us4YaG2CF
	YZkKTzYQ1jz6kbOzRlTu3cOnWWoIR42E80/J/SiNKwgCzg+nSfJlVNMo8/Hr2rBCWwF024JMutNli
	xTEN77lAQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcJC6-0071h8-T9; Fri, 30 Apr 2021 02:47:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcJC3-0071gu-J9
 for linux-riscv@desiato.infradead.org; Fri, 30 Apr 2021 02:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=0QdZ84zlKuBMu26fBRGQFCKlgEEaAEnS1NymO5AItY0=; b=ftlMk1BbGd4JGLdpkUCpKf71xh
 k3qa1H49R5wk90C+sAiPvl96XxneT7fBLvEpoCWK/8S7YOHx1RgZ90S24rA+qgiej+L7NaJ8QWhwK
 U9fnyHb/Pb9lqKVlZD0HMxLMj8pieU27pvR8l6iGNHTfCW+9zA2OgWqR44Djnnr5Nvm5+i+Z3zv+a
 3siTndnHPr4BN/4svkqKPEkEuar0bLi2cCuDak29Ul01HaN9n+pC8WKDJ4MmwQDBezyW4NnTtCD1l
 hAEuQs2KZ3SuoHI/RuUsD2YA8hqPSEIRZskfuf4dYJoUdhF6OOR3WHQwLtJUhhMPIJKLhI/Ekad+T
 SySH/pjg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcJBz-0014pa-Ms
 for linux-riscv@lists.infradead.org; Fri, 30 Apr 2021 02:47:50 +0000
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4CF561406;
 Fri, 30 Apr 2021 02:47:44 +0000 (UTC)
Date: Thu, 29 Apr 2021 22:47:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Changbin Du <changbin.du@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 peterz@infradead.org, jpoimboe@redhat.com, jbaron@akamai.com,
 ardb@kernel.org, Atish Patra <Atish.Patra@wdc.com>, Anup Patel
 <Anup.Patel@wdc.com>, akpm@linux-foundation.org, rppt@kernel.org,
 mhiramat@kernel.org, zong.li@sifive.com, guoren@linux.alibaba.com,
 wangkefeng.wang@huawei.com, 0x7f454c46@gmail.com, chenhuang5@huawei.com,
 linux-kernel@vger.kernel.org, kernel-team@android.com, Palmer Dabbelt
 <palmerdabbelt@google.com>
Subject: Re: [PATCH] RISC-V: insn: Use a raw spinlock to protect TEXT_POKE*
Message-ID: <20210429224742.391154ae@oasis.local.home>
In-Reply-To: <20210429215451.yuey5gzmfh2dkzp5@mail.google.com>
References: <20210429061713.783628-1-palmer@dabbelt.com>
 <20210429123007.5144fc0d@gandalf.local.home>
 <20210429215451.yuey5gzmfh2dkzp5@mail.google.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_194747_818060_754D2B2D 
X-CRM114-Status: GOOD (  17.58  )
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

On Fri, 30 Apr 2021 05:54:51 +0800
Changbin Du <changbin.du@gmail.com> wrote:

> The problem is that lockdep cannot handle locks across tasks since we use
> stopmachine to patch code for risc-v. So there's a false positive report.
> See privious disscussion here:

> https://lkml.org/lkml/2021/4/29/63

Please use lore.kernel.org, lkml.org is highly unreliable, and is
considered deprecated for use of referencing linux kernel archives.

Would the following patch work?

(note, I did not even compile test it)

-- Steve

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 845002cc2e57..19acbb4aaeff 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -25,6 +25,8 @@ struct dyn_arch_ftrace {
 };
 #endif
 
+extern int running_ftrace;
+
 #ifdef CONFIG_DYNAMIC_FTRACE
 /*
  * A general call in RISC-V is a pair of insts:
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 7f1e5203de88..834ab4fad637 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -11,15 +11,19 @@
 #include <asm/cacheflush.h>
 #include <asm/patch.h>
 
+int running_ftrace;
+
 #ifdef CONFIG_DYNAMIC_FTRACE
 int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
 {
 	mutex_lock(&text_mutex);
+	running_ftrace = 1;
 	return 0;
 }
 
 int ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
 {
+	running_ftrace = 0;
 	mutex_unlock(&text_mutex);
 	return 0;
 }
diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 0b552873a577..4cd1c79a9689 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -12,6 +12,7 @@
 #include <asm/cacheflush.h>
 #include <asm/fixmap.h>
 #include <asm/patch.h>
+#include <asm/ftrace.h>
 
 struct patch_insn {
 	void *addr;
@@ -59,8 +60,13 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
 	 * Before reaching here, it was expected to lock the text_mutex
 	 * already, so we don't need to give another lock here and could
 	 * ensure that it was safe between each cores.
+	 *
+	 * ftrace uses stop machine, and even though the text_mutex is
+	 * held, the stop machine task that calls this function will not
+	 * be the owner.
 	 */
-	lockdep_assert_held(&text_mutex);
+	if (!running_ftrace)
+		lockdep_assert_held(&text_mutex);
 
 	if (across_pages)
 		patch_map(addr + len, FIX_TEXT_POKE1);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
