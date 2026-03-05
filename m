Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8E5F513E2
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 22:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DvsH8G5zqsoCmXkCwYSNA0jw1qxMQGbwNPB+86FNXTA=; b=oLKYZIBvSpUrW6EpdpT/10fCXK
	9smZqXRzL/5NYn5opJVzEvinXb9jraYuhWBsbqwwnci3lKM2enM28U8z9zLGpS76rndPhjTfTXPhc
	lB4ruyqBhyGzr4Eh80FTtBvmO2zUQGiTT087ZYlW8oFFLG9i2gRYczHeeMuufxJeC1KgdiZ41r/g8
	dgupEnQ1THSS1BdGZbZPelsCBMg+Y4AEHeaJgLS7Eve7U85PZDAuSqFt7L2nT1oXHk82G6FcWba6F
	6hFg4Ln5I/wsuU6RaoKOEEYwwfHAfdCH1l91CSFg0XlyuQBI8Sgo6PLXkVYd0RKdzQIASq0NdHLpx
	3DQadU1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyH2p-00000002eJq-3t0z;
	Thu, 05 Mar 2026 22:19:47 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyH2m-00000002eGO-40Rm
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 22:19:46 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso9910549eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 14:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772749184; x=1773353984; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=539R4WcAWVflmqEMddxOg3bYov+MI6a6nT4NY7eQniQ=;
        b=VVSTXz/GbD29RDdQiwxbapkBedcPmLHOjJZnt3JYtTvGGu62hMR/49jvubhKLPFUp+
         G36dpzAEhMgq/k2jNB+Jpok6J3HxWgWLJDAA/8nE/pfXhGYKsQ1ascd1AR2twYZx4Q67
         cEbFL2imy33XjC+X8YWM0YjhVZw5P92hJ+3czDEXVmOvC9WQamO5Nu2ikFBsagm7sILK
         eyo0VUiG8/mhDV2vofDApcTGZhwE+ohucXWBVMRlTpJaMTTMnP31ihrWDzGGEPgbzOuJ
         kAPdcvH6w/8Ucg6JtKN6IwPz95VwR2XV09mnAFguBKCq5Zrtb0bItbe3XKrcf5PtMjaz
         cxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772749184; x=1773353984;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=539R4WcAWVflmqEMddxOg3bYov+MI6a6nT4NY7eQniQ=;
        b=ovKQH61VOZyd/vbR56UCX4sNrSbdTUZiZzxyrfh0LWud8pRPv/MIRqP7+SSIo0neVY
         K/dZ8bohXOyTkdq5vtj0+bKY5AsnNaZSb0pl7gJerGGJdksBmFAZ085o0VlT/snf7+Bx
         8PdrfqrbN0Ybmc/soBUeEHvNgU/YaFghNHNz239uCxi6jEEXqAcoAFy8G2oqM3y2zCnh
         Th9Bg8hXnfAXt0X6P5mCrVOiiKnIZD+8rT4u3O3ehtHtdpqb5vI1y26BZHoeleKayE7s
         nPcDdYj0WP2YR7PqYT/JkK3CI8UTSx+SwtkWhPkLErn5uzjzNDQ+SH79YftJJOGVH98v
         7Lyg==
X-Forwarded-Encrypted: i=1; AJvYcCUZT88Fh5JCuqnEMDOGcmDeUGLh3ecwiOxTxgbRLisyxCWI5uBV1C3ZYj13uNqj1EM8HaSc4xZ6B6sxHw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8hzS4tfWynSrDc6gwAqziQfKn4vqzUWfjaANDGZQztS5Nlq9V
	R+CEzzMKZKaZ0HCuuEODcUqob0JMN8AF3PGsaXoBuBeKyij1HVv/qGsFMVf+pMQob5NOBo2AFbf
	ir8UkooU5oQ==
X-Received: from dlbvv18.prod.google.com ([2002:a05:7022:5f12:b0:127:fa:7498])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:518:b0:127:5c54:a124
 with SMTP id a92af1059eb24-128c2e8efdbmr5966c88.31.1772749183172; Thu, 05 Mar
 2026 14:19:43 -0800 (PST)
Date: Thu,  5 Mar 2026 14:19:21 -0800
In-Reply-To: <20260305221927.3237145-1-irogers@google.com>
Mime-Version: 1.0
References: <CAP-5=fWVU3ktkGAnZQrjQJf+Z5AtQo73BVUhj-nr3H95GdcEJQ@mail.gmail.com>
 <20260305221927.3237145-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260305221927.3237145-3-irogers@google.com>
Subject: [PATCH v2 2/8] perf build loongarch: Remove reference to missing file
From: Ian Rogers <irogers@google.com>
To: irogers@google.com
Cc: 9erthalion6@gmail.com, acme@kernel.org, adrian.hunter@intel.com, 
	alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com, 
	howardchu95@gmail.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_141944_997299_213B3A58 
X-CRM114-Status: UNSURE (   8.49  )
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

The file was removed in commit e62fae9d9e85 ("perf unwind-libdw: Fix a
cross-arch unwinding bug") but the Build file not updated.

Fixes: commit e62fae9d9e85 ("perf unwind-libdw: Fix a cross-arch unwinding bug")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/loongarch/util/Build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/perf/arch/loongarch/util/Build b/tools/perf/arch/loongarch/util/Build
index 3ad73d0289f3..8d91e78d31c9 100644
--- a/tools/perf/arch/loongarch/util/Build
+++ b/tools/perf/arch/loongarch/util/Build
@@ -1,4 +1,3 @@
 perf-util-y += header.o
 
 perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
-perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
-- 
2.53.0.473.g4a7958ca14-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
