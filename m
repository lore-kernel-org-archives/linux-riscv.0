Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F940C77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 03:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2i/EGolU9AaOfbt6GJLx26oCZWZ9t1OEBSJCnfoLEyQ=; b=iwnaa4SOTuDr1I
	l46iluJN/rnaWiiGegrpWyqOnjqwBBdjS3HO5RVvxj//ihKsweGEvHrspQGpdNWfY36olqPUR8UUn
	Za6KO4gB0/LNd5xvLys4PWGXvL5+25tplhuK4FBaEEM6UtrgD8R4eJ4HzrnrfaZoC820bZ1bDxfWi
	iIjiKkEx191IpgBiu0Hn+04OznIaHD/oSzO+mYC/b7o/2EZfr4iLYGvmzAKy6Br/7/DdYwh5Hgne3
	0fJ8tB789uGB01E+2uSszVybIwRNo4EeWPUk4NdWwK5pH/z2b3+xznd/ROzeXU2wcxG+Pl1dzOce9
	q6DK/7D3cgu1LWYignWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz86g-0080hr-1e;
	Wed, 17 May 2023 03:45:42 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz86d-0080g6-2e
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 03:45:41 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ae4c5e1388so4217895ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 20:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684295138; x=1686887138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpQR3cccQnkFxa/VBlSDTBSv5SyL5gibvWrL1LrLMho=;
        b=UERCSL4JnKxWSII93BWPVPBBwK6uL6PmIwlr8ZXOKLlNtpxo5SuSIG9NCdRoUWZOoZ
         +hYxmrQqH/Q8Nn729aEESqAHFErEnG5gxcYEkikRN8HovztUkVCPnfidYHdjmfJn+l6e
         gPuj5+IyFNkSWsVE10FucW4qXqClKG6/w9Wcd6mq92qXTmFiEFyl9MK0fjfWsOjlNaiE
         QByDM+aLJ9R3qtw1YAJQhEHVvBAURJgNELbn6b65JIvslmWs6VSBHTubnpB57vEVbPCm
         +o0szfsEnOcquAkSel2xOZHbDEFVqFPW+K6B6MfoBO6zQxqzqLXJyy1b1eY7ngteuAgP
         EiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684295138; x=1686887138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpQR3cccQnkFxa/VBlSDTBSv5SyL5gibvWrL1LrLMho=;
        b=OuoCxHixVZDAFwbCFuLqvXtzhNjtUf1GnlTO1LBWXki3b6tjQvoaTe68Pzy/B3FZT2
         NkUvOUgiXMEfuItgNzBVT+HUc9y1QDd+007CF9qokeOpFfn1Lai0htJREXkBHQZZpcpV
         HavPBCO6Yy++KZVsRU0Ve04ORRueEiGpKv0CFqrdv6qnKQqbjXAa6TCoS0to864neIOz
         Pkae0BPhqJACx0sgWWDpDwh0oBPknv3QabxN6A3lW5hDFJiDGBng7JX6ThIAqwPp5JEx
         ZnGlvD7Aq7gw6umIn7iMGgq7VtxcRs7w5F2WCYpUyASACkLi5iA3EuPQ66l81K0T3uXy
         pAwQ==
X-Gm-Message-State: AC+VfDzIK7OBKhPtk3vnngt/N7QvhdBitp/sAkHJBNEIWd2HBv9DtYVC
	MFhxOICst953t+5C63IZ32LG15NM7ZgrPg==
X-Google-Smtp-Source: ACHHUZ72TBl2qjdRobeJYwihGY/op1xZOYs590vrrpWwxotkrQx2nlDtr1JT0DXq9EF6bOCOpjSqyw==
X-Received: by 2002:a17:902:9897:b0:1ab:253e:6906 with SMTP id s23-20020a170902989700b001ab253e6906mr37006175plp.67.1684295138247;
        Tue, 16 May 2023 20:45:38 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.83])
        by smtp.googlemail.com with ESMTPSA id t2-20020a170902e84200b001a19196af48sm16336746plg.64.2023.05.16.20.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 20:45:37 -0700 (PDT)
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
	Ze Gao <zegao@tencent.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 3/4] fprobe: add recursion detection in fprobe_exit_handler
Date: Wed, 17 May 2023 11:45:08 +0800
Message-Id: <20230517034510.15639-4-zegao@tencent.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517034510.15639-1-zegao@tencent.com>
References: <20230517034510.15639-1-zegao@tencent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_204539_856718_3F5A7A10 
X-CRM114-Status: GOOD (  15.59  )
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
Link: https://lore.kernel.org/linux-trace-kernel/20230516071830.8190-4-zegao@tencent.com
---
 kernel/trace/fprobe.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
index 097c740799ba..281b58c7dd14 100644
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
@@ -114,14 +116,26 @@ static void fprobe_exit_handler(struct rethook_node *rh, void *data,
 {
 	struct fprobe *fp = (struct fprobe *)data;
 	struct fprobe_rethook_node *fpr;
+	int bit;
 
 	if (!fp || fprobe_disabled(fp))
 		return;
 
 	fpr = container_of(rh, struct fprobe_rethook_node, node);
 
+	/*
+	 * we need to assure no calls to traceable functions in-between the
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
