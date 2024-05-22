Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501F1C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jbRnJQeOJSQ5k+I8VraYLbSyV/bPMOLdsaawQsOR3ww=; b=aSX7Fp7alRhDSYhp2qAX/u4cGa
	YdwMg3dFKqRcwFZbqFFIRm97irYPrFW46tqHAjKoVlyuJze0rzC8SivoTGNeUKi2fEr6y+3M4ufk2
	dNUg2hEsLmZPxnhwp3/VDDi7p4PPoi7uf9Px9wAiY0kOCd6YD1vfoV4QEmkbddeXdjLF69KtLtKr2
	DUq3eeHfNkJI3yHacEtwQsZyfmZaRxFu3TMx8WD4ayf/vgrFxIHdMFnXGsxDhr4fnEzc82LRCYq+r
	8UvTQlS3NRgZyCWT4Vjj6EYO+UODIZCe6sHaj+qILItFpWhr3fUnCEIPGGfyJN5Q/2N+7khDYHw60
	K/rVVh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aP8-00000001WNU-2n4q;
	Wed, 22 May 2024 01:04:30 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aN8-00000001Ut4-1i8c
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:35 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-66c3eace6efso2596387a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339745; x=1716944545; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dm1RYHlP0yY8z+cx1ACTtX9tqSUF2UuvA0/IyJOdLP8=;
        b=tbTH4YPt8G0UDxokzeMyyIqyn3If2stTzwE4L4tIgwYGKK+0g2W8soBl/3pHxdsdQb
         cw1yKL4irPYSjOTQQbeLMxMa6FB5hGNPhPsvkoTYezH2aJxFcMByrtoEQK12Cc97MJmi
         kVJVtxQUNUToZgNZoRr4RsgIZ0g/7Mmpr6ppJWcxQ8R02s5mcNAMaoa5dfearfeY3WoD
         WbY9/XfdbSMMQ5Wiv8hak9HLH2HrlzSMRyfVrQuD19cC9/ahdb9WOz+PsTa46MY22W9A
         uHuDjIkZdN+IfkvvOFANYSt6LNWH2A3bXTCLJUTtl96G+y1QbQxQxI3dlyKZwcMmoxxA
         Ym3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339745; x=1716944545;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dm1RYHlP0yY8z+cx1ACTtX9tqSUF2UuvA0/IyJOdLP8=;
        b=O9kRFtALGJs4SjwCDDcGnsLPF0WbCY3ASuySHbxmIlGamhQe0nLCti2J/d9H+j3VSl
         EIQVKC0nC1YWfPTJlAkDOtTaTkM6F/35qa25QyxQyyqG0Hpnl9yqkbn7/PZDHGIk2ezY
         zbmHAuTbyF1OIK+uabkx1g7BYANZTowJt4nYzaN893q8a9UPu5efhrzSybZY5EQRUUQb
         /LBbBEOqy+M7VKg8zetuzw64IzONsYh03EhJm9Oi8VjZjt5p2lo4gS6K2Ig/msSvfP9D
         FyFtB3betkV2JRUV815I7GZGZryUqHurWcTIRb93LZFhPsGcPCQm3dP6jG37+JNc7vZD
         lbDw==
X-Forwarded-Encrypted: i=1; AJvYcCUIKHSA0GEVDIyj4QJ1kE3QtwaVHhNOexw7DUvoLpKrpOAqgoRlWN4Kk13QF36u46M3SfJnRLznDHmnEVe5qogW86y8akpSgZk2xH02zBjR
X-Gm-Message-State: AOJu0YzYCkJr1F4YR7ddWSuklG5x+XPlmUmItonpAT9r+ewPvkANWXwK
	clq1fDyKD3ZSVeIQncOIfGGU8SSFTt0AnMbNu5QGJimzmZitNTB0J9y4FwFCjmHcWXCeCGCIWG7
	+xA==
X-Google-Smtp-Source: AGHT+IFlPItv3KQjRVyD08JVklH4KtCoAvfm4Lf6y215FzRt97XcDClrNcaWNS3yMHJbFTWQCPvk6KGG8pM=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:ce85:b0:1f3:665:9043 with SMTP id
 d9443c01a7336-1f31c7f3f98mr17625ad.0.1716339745033; Tue, 21 May 2024 18:02:25
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:46 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-61-edliaw@google.com>
Subject: [PATCH v5 60/68] selftests/thermal: Drop define _GNU_SOURCE
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
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_180226_659092_01A0245A 
X-CRM114-Status: UNSURE (   8.37  )
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

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 .../selftests/thermal/intel/power_floor/power_floor_test.c     | 3 ---
 .../selftests/thermal/intel/workload_hint/workload_hint_test.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/tools/testing/selftests/thermal/intel/power_floor/power_floor_test.c b/tools/testing/selftests/thermal/intel/power_floor/power_floor_test.c
index 0326b39a11b9..ce98ab045ae9 100644
--- a/tools/testing/selftests/thermal/intel/power_floor/power_floor_test.c
+++ b/tools/testing/selftests/thermal/intel/power_floor/power_floor_test.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
diff --git a/tools/testing/selftests/thermal/intel/workload_hint/workload_hint_test.c b/tools/testing/selftests/thermal/intel/workload_hint/workload_hint_test.c
index 217c3a641c53..5153d42754d6 100644
--- a/tools/testing/selftests/thermal/intel/workload_hint/workload_hint_test.c
+++ b/tools/testing/selftests/thermal/intel/workload_hint/workload_hint_test.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
