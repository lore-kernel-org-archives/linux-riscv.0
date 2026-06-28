Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EFFC43458
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2026 08:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S88rb3MUVuGZ5tHsrLR5rT75fvv1osyz4/aCOsjvw70=; b=iH0BPnBfbbRAgJ
	5tzJvfMCSVslLusGf6L+DgQOd7UL7OGFlrrsvqncZ4lLiMPRd0vW8p3dm6PrwU+onDx290Kn3Gnqa
	GYXXcXUvWXBcaOnj6VAh3WBuqkAa/dioAMCxupYhQM8z4wmVsvTCpsz7T5MhBteu5bIs9vhQ6omBZ
	TnBxpiH/UUV0lnwHbNh4+RLqvPjXIFmll95iTfKpGQMCCMh7NTOTXqXrr4M2XmJeyYTyt9YMBdi9A
	kpFwKjSPRLeqzQpNO52nKrj3238BBHIeWF6S0UQ6w8qkXtbCTm50fLRkfWmIMDo0ujdkIk7oJxNtz
	U8+r0oHOkEGDIGU0l0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdkiB-0000000Cync-1RGj;
	Sun, 28 Jun 2026 08:17:55 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdki9-0000000CymO-0Qwa
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jun 2026 08:17:54 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-37fc01881f2so874590a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2026 01:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634672; x=1783239472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIbWUZbf4PMs4YBadVfF+7ZfJ1yqBeFq4gfTDljCk2k=;
        b=OEiQE0bK1kb2ydVQyw7s0qvQH8HQrZBSwsBMRVPMbmK9ofvZ7++4qkr+5dLSaTDxN7
         PJ4LFdhuN06g2qyB5ldTfBxhnm5OKxXByH3gO8S5XyjiqCa9HduvpwBQFB9VeS7vLcTK
         SyhTAyDNrZg3tl9AxFTovnUu1b4pKxtdId+JmFUqO/fatxDkopwMyFrc/HT4m4CGHNie
         SOZxzGWQGG9wk7xjFUGJrZ+SFQuLDJIg1gHDdIaX9pQDc2ro1NIcDgab8R4kdDITfCcl
         fZJUhLzWHdhkSulzStU3WF8NGQLMZwksNgQWhEGIowmbjGFU50MGVsPdEz8HtVlDGOWc
         gGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634672; x=1783239472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wIbWUZbf4PMs4YBadVfF+7ZfJ1yqBeFq4gfTDljCk2k=;
        b=okC6QSPkS1HsLuSN7jxAYxNmFf9tBUSzjhdnW1jT3WexgI/wJ41tZfTNNGQK0QVvB6
         pVinqCFEQuM90bsohRy7ogBBG9VbmQdCcXVs+5oH0GldTLSUBSf3jdtUjOi4sCLChYb1
         9FfKFFILUdII78NdmE1NTY6jvTgyoWi0bmjIl4lGQUge5YZdtgQ6IgCPYw5ciTEault3
         zAcKnUdCp7LFcNAnk29bEaT6DjYTA89Pf/bu1kf+ZMVr0sfi2KMC7/Y2wbb7XdZ6XvRI
         2H80NcockBab4f4oQRtn0fCLBf+ZtXo10yUED/nTNDTy75Ryk3dDnu62Iv74YfquKsVP
         s+wg==
X-Forwarded-Encrypted: i=1; AHgh+Roy2/EdeJP1IZYyvQCrkb7/WKOnexCpbpr06uw5u5GkeV0/tbQIzNdtrIAvKPsunDiZuXK/duYfi3oEdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTNuwvBaWszkM++5jctQrLDuuzsW9wWdl8TEEzMjS0niP8LteW
	eytYEJEacK01pZ1glt77daGkRxnU6Dtw6n/thLzOiXYZlP8WCK0QbPhx
X-Gm-Gg: AfdE7cmm0/7yaUarvcWopbOflHG7p0nPjVO4clkwiEihyzOnolmIiQ72BCF3+yu1N/A
	A17NPviGj8gyCNRRMzREcKCNvZEJefzB3eghSoGBKTJT7ByHujyBYbITDQ62nDnS7eHEAZSgZfB
	7NuNNaiIV0oe3x7KPLbU/E2Qluza24otsXyNDyV3a4Tkz17P1v1rGHtXGqR0YQ9Z8k4tS2T4X5w
	xbJY6w4XVapKo8cThfA7AdZ88AL3tIEGYxySzvumKA0pSnUO36VKmWSyBKZWtah2KawaSz9mrDG
	SJlDTNGi0oz1/1mr/otAHERZd5A7EfrOzH7BGVk7clvqKWMLQmGBh0icMDGY33CZ+A4/OzrHjTC
	LqmE/YKUk+QypCWerUFXcXct0zIWUN+GYfVu+9zhrR1mn6qRH/+QizDvy2kUkSUokeonQjGKeDI
	IBbIoGj929r16e8HpcgCe9x16apexAYf+RD1fKXp6tue5o9fHIsCFIAAs=
X-Received: by 2002:a17:90b:1647:b0:37f:d70a:9605 with SMTP id 98e67ed59e1d1-37fd70ab29fmr2995751a91.9.1782634672198;
        Sun, 28 Jun 2026 01:17:52 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:3b4a:8aa::dd:15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bd55985asm6020434a12.31.2026.06.28.01.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:17:51 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org,
	pulehui@huawei.com
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	puranjay@kernel.org,
	shuah@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next v2 3/3] riscv, bpf: Remove BPF exceptions from BPF CI denylist
Date: Sun, 28 Jun 2026 13:47:10 +0530
Message-ID: <20260628081710.113333-4-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081710.113333-1-varunrmallya@gmail.com>
References: <20260628081710.113333-1-varunrmallya@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_011753_160678_8485655E 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

This patch removes BPF exceptions from riscv64 denylist on
BPF selftests since support for exceptions has been added now.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
Reviewed-by: Pu Lehui <pulehui@huawei.com>
---
 tools/testing/selftests/bpf/DENYLIST.riscv64 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/DENYLIST.riscv64 b/tools/testing/selftests/bpf/DENYLIST.riscv64
index 4fc4dfdde293..9268351ce4c1 100644
--- a/tools/testing/selftests/bpf/DENYLIST.riscv64
+++ b/tools/testing/selftests/bpf/DENYLIST.riscv64
@@ -1,3 +1,2 @@
 # riscv64 deny list for BPF CI and local vmtest
-exceptions					# JIT does not support exceptions
 tailcalls/tailcall_bpf2bpf*			# JIT does not support mixing bpf2bpf and tailcalls
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
