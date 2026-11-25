Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8DA606D305
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 06:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cnw+qD2j;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=p3dl8w/D;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iWI+PIwA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=mmAUe7TBMzoZnQ/feR94/VszP4um0dPgyVR/z8Bc2xY=; b=Cnw+qD2jVSH2KVJMsqwrgiYZpU
	tl8GzBB72VZFKyGqTefEDCzD8h8yzobTTHRzncHNS2klUnJT2mE2YbFw2GkvY0Maf51uaJ/llE+wH
	ssQ/F25Q800oGedvhCeG/rUiwxkXRcqE12gDs8anqtO6B6LJgo7D6cuCdXCxCUUAgDdS/9rc1F0EO
	BhbUViXqV3W/4MAX2w+tpGIFRLqRMdaOdYP2b1UKmwRpL896p9SeXOdpgOe40aV5YAhmDi2tqsBZj
	m7B0s2y590f8oWsGMvqt614yXjvaiAbB4vhmPUfBSLW/B7Y/4fzVhYh+3J+8FUZyO+jw8FoLYQKep
	cI4cj/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JU-00000008ZRm-3UJD;
	Wed, 25 Nov 2026 06:17:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Iq-00000008YlY-01jQ
	for linux-riscv@bombadil.infradead.org;
	Wed, 25 Nov 2026 06:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+3YNbw7npHYIz6vJpu6w5t/t1EQu1XAkIQnaB2DVcXE=; b=p3dl8w/D9FnLB6pkE0RAg9kcZZ
	d4rQxcT30EVhhs8EKXGx5oQEvgWi8rab7Y8PJe3nCpaV+1i0yTWRUN6eI9Cn4SXCzcO9eXyWr5S3g
	/+xYXiG/ODgmVkq4TiOOVrkmQmgrMMKnLBJfEVfzgSnSZ3o9wZC+vkzopnID+4VYBFThKuyqDPZXn
	AwqsTwUtcsqi59nNb35pBpqLLTUoeNN6ck+SL/+wETDd1uKe3ArrJEeuXSIJ5ty+qNaHDgFZqm0I0
	dYigjiESupvsRBiB8REL6L14lsWh8bIjfqepKkL8jAiugyhiraI9i5VT2PZW1TWBtydsk1hWYT7rX
	+nB4AMgg==;
Received: from mail-dy1-x1346.google.com ([2607:f8b0:4864:20::1346])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Ij-00000005pJW-3VhF
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 06:16:21 +0000
Received: by mail-dy1-x1346.google.com with SMTP id 5a478bee46e88-383ec96a7deso6021384eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 22:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587373; x=1796192173; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3YNbw7npHYIz6vJpu6w5t/t1EQu1XAkIQnaB2DVcXE=;
        b=iWI+PIwAGJuLRtXV6xYVX6/EvJXybLcmNV6dxQbtf1Xsbob4kZQxP9ccZuyBsrSrl+
         twwujpC5ka6yR4fMh8kGWMxqjv+4ADdCxgpjcXS7qMmnMlAjx4ISXRV2WPpNgkmej+cX
         3EnscfuPtwM6DIWFmTV3eCUdxJiM6pLPAUIC0/y42hM42aSHQOhxt/VZhSP79suB7TZf
         U5IMldwrQNteyOCj8DK34akPZyjOu/wdZ8ghvWV77NNoclIx+3UQInvWZqHtUTpZk/lh
         9ce7B1N8SetYQTkXeW66JVc5xE9yFHh1/h1lZ76kwRokd5m5XgY0WwYkJygORaqRj+Lt
         uASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587373; x=1796192173;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3YNbw7npHYIz6vJpu6w5t/t1EQu1XAkIQnaB2DVcXE=;
        b=HQ1ITvPUW4ot/mSzBNHUYptmNTrwhylwOxvrPtWYuOjvGNnhVmfX/O8m0T1+UQKJJI
         5vH6VWF3QqWYqjo3BOrHDzfdWGzFpz7H6KFbhJmoP5LWV8edSCbXbFmz2Cq5XQg1Q5xb
         3pGywh0xr/M0zWqLGu2WHikBwOLsKPtjg/3+KRj64Kjk9qMYYQA2WrsBGKxt8w+fOuDa
         bMbzICCuYJULQ6iMJUkKlhOoZ7lWs0z/S4oYi6Y5rp+bB+14XnXGl74luj56m7wc1zR6
         Y9u13NpuNv8FxNEKJDWYj5DF/3KP7jUmA+Cj+XbLI4LddehmO+ra6jZTlFPvFpyMIdjt
         vHWw==
X-Forwarded-Encrypted: i=1; AL+hErF2Cs7NiD6znjbpjYpjtV35R173cZtLYPrTHHMQ/hpdzuMdl2UtrCSLZTZx71dPmqPx/pTGg9RZM0osPA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9dZ1CQGmn/evTAPb1cozHimVGpJ2qwDEClOMs4pJfo+gHY7+p1
	sVqUbNkpF5Ize0x21hEfDLTole2k5WjUzJj+pJ6WdlB7ddymg/BNWwyDETWwXKrvutgvlrB2Wst
	szo05wem5bQ==
X-Received: from dybou2.prod.google.com ([2002:a05:7300:e5c2:b0:384:c70c:3c65])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:d809:20b0:386:b070:6f1c
 with SMTP id 5a478bee46e88-386b0707151mr8742111eec.21.1795587372849; Tue, 24
 Nov 2026 22:16:12 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:01 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-9-irogers@google.com>
Subject: [RFC PATCH v2 08/30] vmlinux.lds.h: Allow architectures to emit
 custom RO_DATA sections
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_061618_353590_EEEAD913 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add an optional ARCH_RODATA_SECTIONS hook inside RO_DATA() so
architectures using runtime .eh_frame / .eh_frame_hdr kernel unwinding
can place unwind tables inside write-protected RO_DATA without leaving
them in unmapped rodata/data gap pages.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/asm-generic/vmlinux.lds.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 3eb732942d69..1bde7a2a19d0 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -472,6 +472,10 @@
 #endif
 #endif
 
+#ifndef ARCH_RODATA_SECTIONS
+#define ARCH_RODATA_SECTIONS
+#endif
+
 /*
  * Read only Data
  */
@@ -554,6 +558,7 @@
 	RO_EXCEPTION_TABLE						\
 	NOTES								\
 	BTF								\
+	ARCH_RODATA_SECTIONS						\
 									\
 	. = ALIGN((align));						\
 	__end_rodata = .;
-- 
2.56.1.831.g720f3f5937-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
