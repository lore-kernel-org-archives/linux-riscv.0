Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20B4C77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 03:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPHgliTDEg4tpa71u+sOi9KkBpUrt/D3msr5d3JpBjo=; b=PsG8s2nC4DvcZo
	oO4fYRMt7DvoHEmVrOdnETnpiEMl5HOgO01K38u6406bmkMz+9g2hr37HMwMtkDPUvj/Lm1ok4I+U
	TbFSQ3+F1V7GnuduGDjvjvOULOgp99/ds1Y3/0zBl83f8LeKFG0iDWhb2lcD/Hcy1EpauIddf+sfz
	+pIy3fRBd4XUJP+ySq78/4NGpodED5BpcOtCjAXTv1Rt/uMhkt07cmLiev8QlrA0qwzlXXsDROcZR
	pGuBLZ+pHAZQebFN81r73VygMfLprvmZ/XLJMqlQZVsQwHcB6G4FgO82YrPiK2WJoIpCJ5I13Cdk8
	+sQqAjsP0zbyXu8ru5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz86Z-0080f7-2c;
	Wed, 17 May 2023 03:45:35 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz86X-0080dU-0n
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 03:45:34 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1ae3ed1b08eso4283715ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 20:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684295132; x=1686887132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGFBel0XWHMPBOQVpTEFEgbDNqzL0utWuk4Q5TTOH0I=;
        b=mnJfkgKpTPVHwlmswT6XPsXRmkE2FWCwvioj+muJ+uq/kD9S+KoY7Oqkt6AmGwLc/z
         XybyjbtWhNsEukNAJTd2qEGYk9Q5aG8qQhF8Z4c8fxEuhIHJSB7pGjzeyBHZ7eLCJ0ws
         Hu70LM7ImU/s5A9/ULM7FjA2T3Cgn6aORaqGmDC7TbFFn0Bjdn8aMd7V1ebFyyUDDS+/
         ijzbOIGTn234aKxai/0GSHN1oxWvmXwJgoQ3LE8py0PO78r1+r5FrFv/U8FACfsqgf2s
         1dsyFbjtjgmr6jCqTC1Vroc6QGGr3250tlPm4Rp5GQjBasJ1Y6NSlI+mvnKXJhm6Sq/g
         MJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684295132; x=1686887132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGFBel0XWHMPBOQVpTEFEgbDNqzL0utWuk4Q5TTOH0I=;
        b=X7C7fsLhl4emDJRFJDXPbqouu/XuqWyLUNw1NtJioUOFnyVaqe07gBD0Ow2M6RgztW
         rnNFi1PQVRPwdWFZoeZyqSkHuZ00ExY4LiIhjzU360pwkdzsDpvzYdlAjpB/TKq2aL72
         pUtUPweC+nLcXGfBObAH4sU22RXHqm/LaUWL8USSTrHMJxT0WPjbhpkf6hsrP4b3fJaM
         YHV4fFukzlAGIHhAghXgb5UQ9twdjwtCwMKBzfXqJg1G5DFcDLsNMQqyifjg9zuT9j0P
         YAGGilV0evtZ8LmMmRsC6zk3K/ykOpbJdJyUSmekU3XQV81YFZE2jgtdaQBzyxG6AMBr
         XGew==
X-Gm-Message-State: AC+VfDymuoBKb/Mznkxrz4tuqS/dTRsN0PdxjhDcY+Ygs/Wc4mmSRWIT
	GfYmJFETG6NHRVxZnFcpLqY=
X-Google-Smtp-Source: ACHHUZ5LPHotl0fJ/O3KGBLfATUmV2Ofpz6WW1a3qNWCMnkfgz1soa2zRJ+uMCkiFPlag6APwqkb4A==
X-Received: by 2002:a17:902:d507:b0:1ac:310d:872d with SMTP id b7-20020a170902d50700b001ac310d872dmr52041365plg.52.1684295132086;
        Tue, 16 May 2023 20:45:32 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.83])
        by smtp.googlemail.com with ESMTPSA id t2-20020a170902e84200b001a19196af48sm16336746plg.64.2023.05.16.20.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 20:45:31 -0700 (PDT)
From: Ze Gao <zegao2021@gmail.com>
X-Google-Original-From: Ze Gao <zegao@tencent.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	x86@kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	Ze Gao <zegao@tencent.com>
Subject: [PATCH v3 2/4] fprobe: make fprobe_kprobe_handler recursion free
Date: Wed, 17 May 2023 11:45:07 +0800
Message-Id: <20230517034510.15639-3-zegao@tencent.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517034510.15639-1-zegao@tencent.com>
References: <20230517034510.15639-1-zegao@tencent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_204533_284866_2F91E925 
X-CRM114-Status: GOOD (  17.45  )
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

Current implementation calls kprobe related functions before doing
ftrace recursion check in fprobe_kprobe_handler, which opens door
to kernel crash due to stack recursion if preempt_count_{add, sub}
is traceable in kprobe_busy_{begin, end}.

Things goes like this without this patch quoted from Steven:
"
fprobe_kprobe_handler() {
   kprobe_busy_begin() {
      preempt_disable() {
         preempt_count_add() {  <-- trace
            fprobe_kprobe_handler() {
		[ wash, rinse, repeat, CRASH!!! ]
"

By refactoring the common part out of fprobe_kprobe_handler and
fprobe_handler and call ftrace recursion detection at the very beginning,
the whole fprobe_kprobe_handler is free from recursion.

Signed-off-by: Ze Gao <zegao@tencent.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Link: https://lore.kernel.org/linux-trace-kernel/20230516071830.8190-3-zegao@tencent.com
---
 kernel/trace/fprobe.c | 59 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
index 9abb3905bc8e..097c740799ba 100644
--- a/kernel/trace/fprobe.c
+++ b/kernel/trace/fprobe.c
@@ -20,30 +20,22 @@ struct fprobe_rethook_node {
 	char data[];
 };
 
-static void fprobe_handler(unsigned long ip, unsigned long parent_ip,
-			   struct ftrace_ops *ops, struct ftrace_regs *fregs)
+static inline void __fprobe_handler(unsigned long ip, unsigned long
+		parent_ip, struct ftrace_ops *ops, struct ftrace_regs *fregs)
 {
 	struct fprobe_rethook_node *fpr;
 	struct rethook_node *rh = NULL;
 	struct fprobe *fp;
 	void *entry_data = NULL;
-	int bit, ret;
+	int ret;
 
 	fp = container_of(ops, struct fprobe, ops);
-	if (fprobe_disabled(fp))
-		return;
-
-	bit = ftrace_test_recursion_trylock(ip, parent_ip);
-	if (bit < 0) {
-		fp->nmissed++;
-		return;
-	}
 
 	if (fp->exit_handler) {
 		rh = rethook_try_get(fp->rethook);
 		if (!rh) {
 			fp->nmissed++;
-			goto out;
+			return;
 		}
 		fpr = container_of(rh, struct fprobe_rethook_node, node);
 		fpr->entry_ip = ip;
@@ -61,23 +53,60 @@ static void fprobe_handler(unsigned long ip, unsigned long parent_ip,
 		else
 			rethook_hook(rh, ftrace_get_regs(fregs), true);
 	}
-out:
+}
+
+static void fprobe_handler(unsigned long ip, unsigned long parent_ip,
+		struct ftrace_ops *ops, struct ftrace_regs *fregs)
+{
+	struct fprobe *fp;
+	int bit;
+
+	fp = container_of(ops, struct fprobe, ops);
+	if (fprobe_disabled(fp))
+		return;
+
+	/* recursion detection has to go before any traceable function and
+	 * all functions before this point should be marked as notrace
+	 */
+	bit = ftrace_test_recursion_trylock(ip, parent_ip);
+	if (bit < 0) {
+		fp->nmissed++;
+		return;
+	}
+	__fprobe_handler(ip, parent_ip, ops, fregs);
 	ftrace_test_recursion_unlock(bit);
+
 }
 NOKPROBE_SYMBOL(fprobe_handler);
 
 static void fprobe_kprobe_handler(unsigned long ip, unsigned long parent_ip,
 				  struct ftrace_ops *ops, struct ftrace_regs *fregs)
 {
-	struct fprobe *fp = container_of(ops, struct fprobe, ops);
+	struct fprobe *fp;
+	int bit;
+
+	fp = container_of(ops, struct fprobe, ops);
+	if (fprobe_disabled(fp))
+		return;
+
+	/* recursion detection has to go before any traceable function and
+	 * all functions called before this point should be marked as notrace
+	 */
+	bit = ftrace_test_recursion_trylock(ip, parent_ip);
+	if (bit < 0) {
+		fp->nmissed++;
+		return;
+	}
 
 	if (unlikely(kprobe_running())) {
 		fp->nmissed++;
 		return;
 	}
+
 	kprobe_busy_begin();
-	fprobe_handler(ip, parent_ip, ops, fregs);
+	__fprobe_handler(ip, parent_ip, ops, fregs);
 	kprobe_busy_end();
+	ftrace_test_recursion_unlock(bit);
 }
 
 static void fprobe_exit_handler(struct rethook_node *rh, void *data,
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
