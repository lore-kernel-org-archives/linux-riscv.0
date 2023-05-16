Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10479C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 07:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5XtrB0yMCmE6ODbdcAP0LXOqpP33pPcqW8WGtfROFaM=; b=s3vAPH6vUuQ/Zu
	FG42sWkcu3ZNorg/GhSQ4OcMc8QZEBZgmk1AuWGm9FP8nJfVa5r0X2eCwFoWTStJXxE6ZVQjwG+Pl
	WR/t6Kc3zZL9hH6VX0nrUjr96EkuYTuwxve1PT79NduY4hDfKHI2NUQCkQKZJ7L+XKmqIbdTyfBZs
	gH2FmFKnfH//Qktzaglht2MFftgjNt5k3WHVXXrz0tctECvYWZC/IWagk6QFz0s+oE1NOEY1w1jVO
	+EcbjvzL52JYJFOv/teiteQDIRCAJRFmCz6uC9uocVgtiBx4pjP5mFW3hWl8QRgIiCDAd1EkttaLl
	ooaq34ndHcg8IHaM7mXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoy1-004cxk-1R;
	Tue, 16 May 2023 07:19:29 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoxy-004cwD-10
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 07:19:27 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5304d0d1eddso4499732a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 00:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684221565; x=1686813565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaoLZ/dBLXvTx6mYn8gtFpoeO4MZOVPTvDmN/MOLVfI=;
        b=elodM/SNoJ9U0KRWKOkpJzY7sFOiiAwcySNutlxkuaECCMGs57bNTYUgGLf7apLnmF
         mU/pSRkqEVZ+7rPyRZ8YnO5x6wQkUTqvaRf83bRRsM+c240BE9sqFwEfNXNWfv/FNwJA
         Abife5G2U8Ob1Vo7SKvledXlBqRahn+vDQEt128UyR/hVyMcaCWGJ9fEZW2nu06zUDc0
         mWDQhiS8sp9WifrjGN17a5aB1CK9y9Xn+g2KbKBlwWt6GeKGgh/BvMhR11+zQ/z+XWCm
         PJ6B9ImSBH/O+DzeIXV5HWmld40h6QxUu5PlUm4lP7A2N1biHL1brTeyyC47cMr4CWJ/
         Nj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684221565; x=1686813565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaoLZ/dBLXvTx6mYn8gtFpoeO4MZOVPTvDmN/MOLVfI=;
        b=BPpD1LQKHYahd2E+bRa0o2hX2pBVmfjACGKLpIiQZpakLLH0a84y3Ovm7+Y1J1L6oZ
         1bTeex1ZO6CG1MmGo6tJb7xeY4ywipCAdhNfrbSSXx4hi4/KvN7fmkYq8qWtYha4hG5K
         tVUSTobLAw3nUyu9y0QoZxO/GS8FT7IzqA7wq9xJLFm8z4LDJzo+4P26D9bk/U3DSCLh
         1y/CArZB9k34ila84Amn70GaRnYRNwEWSiT5IQCkqQRVGP1kQ4Tb3uHebbxubQ4G3YlV
         7o+VzK2vkZX11EQ1B8KDhSgt8bsFh4Og9ok5OFP1ZLpKaUixJcbarCPqGvz0GDdw9czr
         3dxw==
X-Gm-Message-State: AC+VfDz3g00a9em4zzLs4k8oOMqe6FpN3wNX+B93CgFPfKjyiFrJCPuN
	GYlMfSw+PW2bsm01hQjSG0Q=
X-Google-Smtp-Source: ACHHUZ7zmE9tB+Tt39iDRwR5jnUySn9p2UAGvLn4sbEBRIBIZD0ChrIJ6ul7+Gsmvs3NAPZH9ShHOQ==
X-Received: by 2002:a05:6a20:8f10:b0:102:345f:593b with SMTP id b16-20020a056a208f1000b00102345f593bmr28960762pzk.4.1684221565221;
        Tue, 16 May 2023 00:19:25 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.15])
        by smtp.googlemail.com with ESMTPSA id 17-20020aa79251000000b006468222af91sm12849830pfp.48.2023.05.16.00.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 00:19:24 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	Ze Gao <zegao@tencent.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] fprobe: add recursion detection in fprobe_exit_handler
Date: Tue, 16 May 2023 15:18:29 +0800
Message-Id: <20230516071830.8190-4-zegao@tencent.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516071830.8190-1-zegao@tencent.com>
References: <20230516071830.8190-1-zegao@tencent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_001926_351515_4315F108 
X-CRM114-Status: GOOD (  16.32  )
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

fprobe_hander and fprobe_kprobe_handler has guarded ftrace recursion
detection but fprobe_exit_handler has not, which possibly introduce
recursive calls if the fprobe exit callback calls any traceable
functions. Checking in fprobe_hander or fprobe_kprobe_handler
is not enough and misses this case.

So add recursion free guard the same way as fprobe_hander. Since
ftrace recursion check does not employ ip(s), so here use entry_ip and
entry_parent_ip the same as fprobe_handler.

Fixes: 5b0ab78998e3 ("fprobe: Add exit_handler support")
Signed-off-by: Ze Gao <zegao@tencent.com>
Cc: stable@vger.kernel.org
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 kernel/trace/fprobe.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
index 097c740799ba..a9580a88cc15 100644
--- a/kernel/trace/fprobe.c
+++ b/kernel/trace/fprobe.c
@@ -17,6 +17,7 @@
 struct fprobe_rethook_node {
 	struct rethook_node node;
 	unsigned long entry_ip;
+	unsigned long entry_parent_ip;
 	char data[];
 };
 
@@ -39,6 +40,7 @@ static inline void __fprobe_handler(unsigned long ip, unsigned long
 		}
 		fpr = container_of(rh, struct fprobe_rethook_node, node);
 		fpr->entry_ip = ip;
+		fpr->entry_parent_ip = parent_ip;
 		if (fp->entry_data_size)
 			entry_data = fpr->data;
 	}
@@ -114,14 +116,25 @@ static void fprobe_exit_handler(struct rethook_node *rh, void *data,
 {
 	struct fprobe *fp = (struct fprobe *)data;
 	struct fprobe_rethook_node *fpr;
+	int bit;
 
 	if (!fp || fprobe_disabled(fp))
 		return;
 
 	fpr = container_of(rh, struct fprobe_rethook_node, node);
 
+	/* we need to assure no calls to traceable functions in-between the
+	 * end of fprobe_handler and the beginning of fprobe_exit_handler.
+	 */
+	bit = ftrace_test_recursion_trylock(fpr->entry_ip, fpr->entry_parent_ip);
+	if (bit < 0) {
+		fp->nmissed++;
+		return;
+	}
+
 	fp->exit_handler(fp, fpr->entry_ip, regs,
 			 fp->entry_data_size ? (void *)fpr->data : NULL);
+	ftrace_test_recursion_unlock(bit);
 }
 NOKPROBE_SYMBOL(fprobe_exit_handler);
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
