Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCC5C25B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iBuFgzr1eB4BeY9kmaBNOfw69Kk46v+/aSIPg8OvH3Y=; b=pGEp0Jq209z9pidbm8URt6wEsg
	RhsRubEslWfUCYse9KgMnfvZrDXn+pjc5IQDAszKJfE83uEClvGjT+0s1A0sl98dhSHQH117hAlf6
	3x7irKV1NIGq4Z3qSHx/1cvbIpBFjwFQNkiXUfNs7AEOpSMJzIDyHViQyIDDNk8Gai/Taq7p5rbnD
	ZXEv+h32NK/gqQAn6jUbA8exag0ZzwZhrfKu48VLmpy0UbYBSUSUf9TXwrX9NRa/TIevFNCkB+nwr
	Ph9c4bVmKAHDAw5NiCucwmKtXkbnIj9Hm8Bf4DGoseiuAn9BhuAsKori9+GAmJL1muQ0NQXUgcY1N
	PBluI6Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aOu-00000001WBI-2agr;
	Wed, 22 May 2024 01:04:16 +0000
Received: from mail-yw1-f202.google.com ([209.85.128.202])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aN3-00000001UoP-3COy
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:29 +0000
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-627956be166so89716967b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339737; x=1716944537; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2p/91SZXiolultWfykg7Se/3Y6CJnO46NmIdpmtDTd8=;
        b=VKAwLlCyll0r/DNBFcHu6+G4b3ddug7i6/JNAcaR+HoAjS2D1mJx4w6LpC60jfd+eF
         AqZ+h5ojljHm/Gv0jX0HxhM96oFQt4DIIWLRhq1vYfjdkyGQ2t++RSyU5sknL6WauVZF
         0WKbkBLbGruJvDi20cVKxM6NJ1crecQtb8v/uaduO31awbR/ZQl40cHWMJU9SdigbQzk
         l8HBmANdhreMajawpcU11txK85TkmheWMtrUlaqU3TLGe+g/cyph+RkUicFEf/LHr1hz
         jqTZPuRTxcZ1krpD1DcO52apaIVNItKmoRctvjLbiH3h5z6imyOvOgXGcoOhtPhG+tfU
         XHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339737; x=1716944537;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2p/91SZXiolultWfykg7Se/3Y6CJnO46NmIdpmtDTd8=;
        b=BrVw2IviUldT9uqDLCp+m7kOkXm2vzyN/wQYDiVGJubdwxeqSYfy8fy+D8b2JQ9ViI
         3VYqDJb7FNlSTtoqmXHWZFaJQsOxwHb6fcKX5KuJIYEtSo9vnTXtKBI9CzUENhyHvdTH
         BxBFI51Fekfl+nZMlGrVV0Qr15sa9sPpskFoWELcBv7XIF27Qr6PMkeUcWGkS7kyiX0Z
         mDGI28vO65eZiG+Wz1/vWTDZ4L6gHblgm9hfp/8oPSU9FWdtXZy7B7xen3KIvtY3e9vZ
         Ku+kBIYf+RYWsRD3GSIlMxZKXTAm6wnFfUgdGulaEVDQD5LWX43DEY6KOhoQVmLCphNt
         W+7g==
X-Forwarded-Encrypted: i=1; AJvYcCXJVvraoMlaJ4XLpVOSeBlVTvusgfk/ihBlx+VSOegrDt7LvpoqfJluF28GUY2O4IKF+WNKgJN7Du/mEUspCbwmEa8y2vsm2hfSl325Q7dR
X-Gm-Message-State: AOJu0YxsEb1si3wpMQCk+OiNNeSrfrBHBda37tv5neSGVX1HrGW9vM8n
	R31KKpr2ac0e0kXCWm45uv3D3s8RnjStGim0daLnefhull+Wd8UeGtF9a3CdaMTPB+bXsajuZoa
	amQ==
X-Google-Smtp-Source: AGHT+IGfhOk9YJsYNy8CZV+lV+R/zOJsJYrZoh4Vhc9wR+bdPu7ruFNEsPOKmbOVrGY3YMxlYG3w5xawAtE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a0d:d80d:0:b0:627:dad9:bf54 with SMTP id
 00721157ae682-627e48c3490mr1899317b3.10.1716339737591; Tue, 21 May 2024
 18:02:17 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:43 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-58-edliaw@google.com>
Subject: [PATCH v5 57/68] selftests/sgx: Compile with -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Edward Liaw <edliaw@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, linux-sgx@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_180222_156298_FB1387A4 
X-CRM114-Status: UNSURE (   9.59  )
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

Add -D_GNU_SOURCE to HOST_CFLAGS and remove #define _GNU_SOURCE.

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202404301040.3bea5782-oliver.sang@intel.com
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/sgx/Makefile    | 2 +-
 tools/testing/selftests/sgx/sigstruct.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/sgx/Makefile b/tools/testing/selftests/sgx/Makefile
index 867f88ce2570..272da790d9ae 100644
--- a/tools/testing/selftests/sgx/Makefile
+++ b/tools/testing/selftests/sgx/Makefile
@@ -12,7 +12,7 @@ OBJCOPY := $(CROSS_COMPILE)objcopy
 endif
 
 INCLUDES := -I$(top_srcdir)/tools/include
-HOST_CFLAGS := -Wall -Werror -g $(INCLUDES) -fPIC
+HOST_CFLAGS := -Wall -Werror -g $(INCLUDES) -fPIC -D_GNU_SOURCE
 HOST_LDFLAGS := -z noexecstack -lcrypto
 ENCL_CFLAGS += -Wall -Werror -static-pie -nostdlib -ffreestanding -fPIE \
 	       -fno-stack-protector -mrdrnd $(INCLUDES)
diff --git a/tools/testing/selftests/sgx/sigstruct.c b/tools/testing/selftests/sgx/sigstruct.c
index d73b29becf5b..200034a0fee5 100644
--- a/tools/testing/selftests/sgx/sigstruct.c
+++ b/tools/testing/selftests/sgx/sigstruct.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*  Copyright(c) 2016-20 Intel Corporation. */
 
-#define _GNU_SOURCE
 #include <assert.h>
 #include <getopt.h>
 #include <stdbool.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
