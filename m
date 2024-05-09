Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F20DC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wdxAYnyhRA+wH2UW+nxDk1LZ2R/zSXI8FfQV02MXFqg=; b=pfwsBGV4JZREZNAAiEJr1IDFhr
	q4+BMBFRHBjTpy4VzsqDgwCme5EqFkzwO1iTfeadQiu8AfB3pjU9S0gzalS9foNYM0icdeoV9Cdi5
	WOt7FkrLwlcfTzG7eSEpf5lgF/aSnRSD17UjEsnAWEq6/rzFnfByQkCNtUN/vGZi5nrX9h5HFXMjO
	g1ln4ujViNCRg2WAFMsiQB3EJn+DFNlN0nnrhQdS/XrU6TM40yWNluWt6IG5ZcAFlhZPlKe2dx+gB
	ZH9Tij2W2WN1EJW2LbpWN9rgR0riyISYC9qLOtuDeQY3HcDr50HqH6jcVSRjvgB2knE9IYTiKQZOt
	2JH2tVzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yD-00000002brp-0byh;
	Thu, 09 May 2024 20:02:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xa-00000002bLt-2xof
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Vtxr2t6roGVtMPcMM1FHknLFjStzalAWugiF4GXwZ4c=; b=VBV9KqHb3TRjrBOSmvmC6ispBS
	kUZfMSc5zdDagASNx9cM8RYW48w6F4S1Vr7MuTRbxKOpIQUT6IbVQbCCGCuXCXp4qxcIqa++yZYS0
	vHi+/WvHLgU5x1FLF6SZ0NviBZsQ5A0VdrRbcZGqStL9PsFjIbJ9o0Y6JyLpvJ4mIb6qxAJ2PJelR
	nTM0xSL5AdpKE/6FUbo22/VAEfpXxGAWK8SJkG/Ru5KWX/hey5Pmd1/uRzC5qWv9UtkDZ2qCv4piO
	j4ak5Tr90I2yZLZ9hNEPw3Plrmv8DY2x32YmT35wWoiRM3rLkcXT5fLJsarYfoyKJw1oTwPQZLP0w
	EJR2OVIw==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xQ-00000002zuk-2UVO
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:01:43 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-61c6560f50bso1115085a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284893; x=1715889693; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vtxr2t6roGVtMPcMM1FHknLFjStzalAWugiF4GXwZ4c=;
        b=jKZdqZMSfL/uKGWvYt9B6sSLj4XoBBFqRR2SQkT7hwWlrKqZAaFXHP1I6CtIrR01cd
         koA/lFizqhavaH2XAu8IlWA2Shw0dsAWZCOrByqxHt3eYXhajodRYoFQ14aVIdFDj/4o
         85bzzYYBEio5rgQggUAQtfF6pC1ue23+Bc8xhO4oA6Dq5CpzJjKzQZ3+Exg2O9zmyf1z
         xrBCcU3qwIwf7v0s2Ucz8Deb97G7AkYNiEA7xxELaxxrPw09xtjQzppZljfo3dfdnYqm
         VSpzKWi0bCfWOH37zYZMQST8w0b+plaQVEFQ1WIc7+tcCM9VPFfvF4lFfnkFNy5wawzY
         Cjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284893; x=1715889693;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vtxr2t6roGVtMPcMM1FHknLFjStzalAWugiF4GXwZ4c=;
        b=H3jV9L+1Zw3+XJVwRYDLtrGnz79+p8NATfNML9CLWaB1o2N7sE+jZLewJVEvW8d5lj
         iGHN7Y3DC3vD4k2RknyelV3STv8w3KhvPF0eQPP9Z0FIc1z5B4pumlIx9b9MrLOpxK0V
         xvNPe/x+XPjat+IRBwmQgAr9zNE/8cXVd2TcM2je60Sr+J8PB45MPShMA8yf2bdGRmEg
         njelv+pfbJwRr3haR0vAs0zqRWB/mbMSMygYn8E2s4wsRPVxuixq/QybdJg0W2SY2c3y
         nISmjmOHbOJT9CtrOkc7g4a/+Zr8nDFGeJ+sjeIwz8x15fc5/GPWWWzO2TxsmqF3vJPn
         Kisg==
X-Forwarded-Encrypted: i=1; AJvYcCViIRj/t/OMZrk7+hYR0RvwCNcNqhV9dWi5nNuHFkqUOCpfPmsglPSH0ITg03LTvlq9xUO0H8ZUC+ioubjKxmQNTf0rQesfpjQ5DxEMxcsi
X-Gm-Message-State: AOJu0YziNjnDvul2W8SWQ9agPV/1x+FM9NNqe0d/Eq5I7xvNO1nkU394
	34SVQgHtwi/OxCd0al8kNDyphRDXbncU8YP3f6ySxGGYmGmwK3E4NlDY87lMK+ZFPe+k0lVA3L6
	K3g==
X-Google-Smtp-Source: AGHT+IHIksrHrGn8eq4W8gitB8+Uf1HhXtNiM7HWOCkx8VENlM1U+C2QAulign2PdjmMYVbRpNVkm5nBmSw=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:745a:0:b0:635:534f:2090 with SMTP id
 41be03b00d2f7-6373c3b52aamr995a12.2.1715284893020; Thu, 09 May 2024 13:01:33
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:08 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-17-edliaw@google.com>
Subject: [PATCH v3 16/68] selftests/fchmodat2: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Edward Liaw <edliaw@google.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210137_296112_41A4513B 
X-CRM114-Status: UNSURE (   9.50  )
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/fchmodat2/fchmodat2_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/fchmodat2/fchmodat2_test.c b/tools/testing/selftests/fchmodat2/fchmodat2_test.c
index e0319417124d..6b411859c2cd 100644
--- a/tools/testing/selftests/fchmodat2/fchmodat2_test.c
+++ b/tools/testing/selftests/fchmodat2/fchmodat2_test.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-
-#define _GNU_SOURCE
 #include <fcntl.h>
 #include <sys/stat.h>
 #include <sys/types.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
