Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A877C25B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RYvbZDpkXr/4bn6j3Vp6IFiAXd8Y1Tfzl1W6tlHB8jQ=; b=QicXvF1NVzhwHgd7ERPEdoSFd5
	Ny8ooNwAdDv+BTR+trTkoWAJIm1TLOXcyJkioFa/bNAfG4UXk0qfOUNbkFPEmBpReIs7imLgNIlEO
	vYI/qevjHbO2Bt384N7b3MTk8Rk46Fznhqol9eHCUQaicHUQcF46ZyseTvoQ2Ba7kjW7/8cMZdZze
	wV7TBRRoHulHTnEDHiUYtCWoS/JgP1mp9oQ2wbki/My27pvJnAHG5OxZl33c1mdk5H8yFWnoWndDT
	+E7y9wVK9sD+n1UVeRe48DxkaMJCv8KVuX9eQsu94yjeDb1KPAaJR3ymMW+c9bHG8FAWbwL0Lf35l
	FOnsrP4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aNn-00000001VHz-22bt;
	Wed, 22 May 2024 01:03:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMS-00000001UP3-12wY
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+hOshFmf6G7zEK9XyWMlNtDhU83mdpWiA8UPY2QVI6c=; b=Cjps5FgBplXi+CFaYLU/OXfyVh
	Z9L0tA7TLohKLlpvYYHkuw8LE66sQAqWeyb5CiEaRisT6MdBjL/DQVsB5dJWXVFJbZYhUWGSp1sEn
	XXNcSXJ2MVg1ElbmCpP6yReY3l0l34CJZAux6cR0BkPcyWPMyGqiUMX3OI3JnK2DUq8QIocD8nGGv
	eOzObFjEvsqKgXqXv9FKZna4nsxmkIx+kKgrN8lhOsIJDyCAm6hbhfMPTQ0i/Qzi3LVFXvAXW4ORg
	InrAy8f2ILC+CpiI18fyhc5dZCIgfO8v/qd/PhCZwQkjbBGia9qLD/w8/YAii0eoEQXpH1mDTeNdQ
	fJchHxyw==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMO-00000000Az3-23G0
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:01:42 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6f474d00351so9451523b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339697; x=1716944497; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+hOshFmf6G7zEK9XyWMlNtDhU83mdpWiA8UPY2QVI6c=;
        b=JaFZqxZFGGjPr4VCEEiQffXxtkGxcgr0VyqS3OqedEJnpNaBVD9P1BUliBfpSh4qIr
         RQ3wAhjA1QAF/yd/HU7dEeYDca6dvqjUO+0Hx0esYD8iuhlEcVz16l/zYF5eSswzdDJ5
         U2OFpDEcIuT3yTFlMrSOLtbWvMUJiUbCix84rNrjDjeWZ51+UryMB7Gikg8ohLFRgkDs
         S5YJCY1ztmmd8vJN9BBvchSPEJfmJ1zyU7ji+zThePjGi5KgszB3GiKdOWqX/5HE5dNl
         CWyaGt3kW7GiWsVkk5DpEID7g2J3RrGauJ2iSmUJCGFmWm0DROOVuxFmWpV1M4NqdwTW
         kfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339697; x=1716944497;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+hOshFmf6G7zEK9XyWMlNtDhU83mdpWiA8UPY2QVI6c=;
        b=ATfPjGfAoGCQ70Ddi5c2uJHjIPlBxdeEPEdN6peWCSyb7CD8A6JleIj+EQAn85g7wZ
         g8NRG2ZyEVYAMZKpJAkV7yFhbtDLbjYlVUAnZcBg+ZrP1ZmWfujvSK4qK1fwiZDn2orQ
         iU6d+oNPOVbSJL0urW5xd8g4a2en6wWiF42yIlG+41uvQw5wwR+1IO0SxxKxBAiCJFSp
         qndfwVZTfY5AYB4ayXHkUDi651AgNXCtBDUmp9YvaMOu4OIzDOpTw9JGHdsfW0ZleNGA
         NO/AV00AFKcmvK0C/RKdnshRK1u3cLT2msxau5SL9kXwFlUAc0riTpEVjO1tfQzDHeAs
         5jjA==
X-Forwarded-Encrypted: i=1; AJvYcCUfsyJUd45dDLZuE5K6lRjqXvBTp+JuSuUjuvKpJASoKVuSjRq/zvS7iP5WL1e+yip23LOLFN1h00sQJQ1yHAIZlPYnUR4fnXP/h6CcrSbT
X-Gm-Message-State: AOJu0YzCTDVTe63ISy7RqeDvxYKkwDpKLko+LHiD5blhaBg0/XoqbYb9
	QNRrtgQ9gnKjFs8bNt7zdK4s+PZ3K8XlpCL87TShWMea7AGf8Tj3YurAw3hbtpcMi0WFXlv/Wc3
	OKw==
X-Google-Smtp-Source: AGHT+IHysubaIzqInuZoraBMn6KY3/zhAPfwf/Xk9cMSLEOs6DDr4Qj7OXFhv9O7YBXKJiOesYtWd3F2Ac8=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:2e17:b0:6f3:eeda:a844 with SMTP id
 d2e1a72fcca58-6f6d5fdba7fmr15269b3a.1.1716339697132; Tue, 21 May 2024
 18:01:37 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:29 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-44-edliaw@google.com>
Subject: [PATCH v5 43/68] selftests/ptrace: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_020140_739080_05F546C2 
X-CRM114-Status: UNSURE (   7.75  )
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

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/ptrace/get_set_sud.c | 1 -
 tools/testing/selftests/ptrace/peeksiginfo.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/tools/testing/selftests/ptrace/get_set_sud.c b/tools/testing/selftests/ptrace/get_set_sud.c
index 5297b10d25c3..054a78ebe8b5 100644
--- a/tools/testing/selftests/ptrace/get_set_sud.c
+++ b/tools/testing/selftests/ptrace/get_set_sud.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include "../kselftest_harness.h"
 #include <stdio.h>
 #include <string.h>
diff --git a/tools/testing/selftests/ptrace/peeksiginfo.c b/tools/testing/selftests/ptrace/peeksiginfo.c
index a6884f66dc01..1b7b77190f72 100644
--- a/tools/testing/selftests/ptrace/peeksiginfo.c
+++ b/tools/testing/selftests/ptrace/peeksiginfo.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <signal.h>
 #include <unistd.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
