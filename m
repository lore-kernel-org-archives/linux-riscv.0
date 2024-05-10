Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2243C10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zXZK6dmdtXStx8AQL1rk8JXctA3heQw45U//UENtTqk=; b=4b2w20kFh8vdIrywCp8u6pg782
	HOaFuYUAQ5RTHkDuilCfcVwWwHQnRTMS5VtqCZYOJHr7xM2L+4S1jfAvnHIYGs3FOX/KUr4XWbioc
	nXk9qLF/VTQIpBeqjJuefd7OgQRZcxTOWs/rXwmKE2/zwk2/oTc6AkxzriOfdmZSct6hUNXC2a02H
	vYjqN/EAkZqdYlLCI+JtfBRvuVVtg28H79FJT+uJdRh0cl9uvDs1MwYt9WfNnQN104CPKNzZUJayS
	23YoOjysEssJChLfzxQLSs7ft9U/ITf3yOWDxypIruGnnq+/V11GObWyb+vMrrmRjds5Wj0s7bf3X
	sAkecEcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dqd-00000003NeT-0DrO;
	Fri, 10 May 2024 00:10:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dq7-00000003NDk-3NxB
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7hWPJomGop1o1vSO/WNR00I+KyAYhO7ZfPBKMyVYJ3k=; b=gNx/1Lm5xO8Zt+LIhI2CVchNVD
	VrRo8nwevk6bBgCcVycB9PZ1uyGdeUQBi0bBQBUHTdAnUa4NCqSiGg/PjKjgklCQmA/eg7nGqsrvt
	Qj1GCn+NIpQugFL8h6ZoWegH4JyIjTgCNHkDibQDlukD2R1jrl00F909h7jq85dduKVsbB4Xktjqy
	6bwiFUpmrR+QUOtMJiAqknNsE9cVV8GvMbuenmt45b2ect/9NX61DrC5XSgWFnbvmv+xSCwlfS8mQ
	KUY6r/6NL1I828S3DvuIZgvKiAA+LVyXJAE9Y3bHZ4VKHAKelapG+ZGiGkIZM9LG7Ka+pYiFUI8qB
	iaOC7Ovg==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dpx-0000000361l-0Kih
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:12 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2b2c438d031so1298256a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299806; x=1715904606; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7hWPJomGop1o1vSO/WNR00I+KyAYhO7ZfPBKMyVYJ3k=;
        b=tmFmoU3hj1b/Uu0XPne8khiN6Yi09JksNz/bqnZu/706GLEe6V/oYmeosMZkZtWwH2
         EGKEqv4E01mw0rh+TturW503Q9nR00t/sR5nUuO3mGXBASA5Y7TNu9NHmYkvIZf4VjzR
         ZIHt9fLtAYv5nRirGYzRA2H0ReVSaqbnBE4BPxZm/WfwSTch6cZSvV7Cnhnlue9w1tQq
         Z5lNuUozq4f6HL00qSVFOVA/ZPMn0+eUsSMr1L+QLztlA0B/uPYNG2HJ/QC392N73lDp
         PuM47HWiKMNSH96gV9k9MqY83Wj9ULDx3QrBemjJu51vzNyyWbTx/fAOLJouPqTtg20X
         piAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299806; x=1715904606;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hWPJomGop1o1vSO/WNR00I+KyAYhO7ZfPBKMyVYJ3k=;
        b=aeMT3jzLwA/nrvTTlPE4p2h4HsSTq31k1Q+q0ngR0Ls8LR2e2UHce2tJ67Yd5y6xiw
         zUZbV2Av+PByWRpoQLjcBIeVmmEEAmDjchwKx+OB0JRif5LWjaYaE+oo0RZeI6MrOJIx
         SLsyBcSaqcQWbgweDTDh3WazNubufc4id2J7tKJ8wap6lY2F2+m2Q371hjnpIt7HJJqc
         xY9rLKaRxiAHjRBHawNlxcMymJ6eqhMXvTM/D3ud4OmmFAM84dAClOWI0KCHl0+3j908
         MVl2P5QMPXf37rUsIUZTxinyyLLPnzK3ZMMk3ep3a2umhKsVgM3yP6evpfl9k+eMklYy
         HPqw==
X-Forwarded-Encrypted: i=1; AJvYcCXziZ40tArDRweU6Oy+dTtMGg5C6JEUwP+qVXasWN/UcThevUI0JN6fUV9FZ6S+TtT+5KrI1LpJipXpVGcgXlJFzXS0wM6iiyEkFhRwQK3N
X-Gm-Message-State: AOJu0YzW2dcXoZw9GYhYnCRnBQqRZU0Kq4ZDF/SnT6HS/9U4Bu5gAACo
	Hx2Gm4rFSjEL5mMIye2IWmdGU0hRMQWDpg0LZHCXCjwqr5G6KlH8p04r2CRtT97UgB2P9aSFt9y
	kew==
X-Google-Smtp-Source: AGHT+IEKFRA+4ILvLn3PhPjtR9sP6AseSfyhxdQaYvOqTgra5Rvh/8biTFwGx5IN/9sytyswqGFZAsbivEY=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90a:b112:b0:2b2:7c77:ec7e with SMTP id
 98e67ed59e1d1-2b6ccedd5b5mr2880a91.7.1715299805622; Thu, 09 May 2024 17:10:05
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:39 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-23-edliaw@google.com>
Subject: [PATCH v4 22/66] selftests/iommu: Drop duplicate -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, iommu@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_011009_266952_D70A5761 
X-CRM114-Status: UNSURE (   7.36  )
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

-D_GNU_SOURCE can be de-duplicated here, as it is added by lib.mk.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/iommu/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/iommu/Makefile b/tools/testing/selftests/iommu/Makefile
index 32c5fdfd0eef..fd6477911f24 100644
--- a/tools/testing/selftests/iommu/Makefile
+++ b/tools/testing/selftests/iommu/Makefile
@@ -2,8 +2,6 @@
 CFLAGS += -Wall -O2 -Wno-unused-function
 CFLAGS += $(KHDR_INCLUDES)
 
-CFLAGS += -D_GNU_SOURCE
-
 TEST_GEN_PROGS :=
 TEST_GEN_PROGS += iommufd
 TEST_GEN_PROGS += iommufd_fail_nth
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
