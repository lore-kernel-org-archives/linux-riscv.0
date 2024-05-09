Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7661BC25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yaYMMOuxp/YE52yQURpznB8Sq3P55voOr9bRsZBu2go=; b=XdfHptU6rtMICeFMO7d/odHI4j
	XP7yDQ4lZVRijPwXWdIZzg2wG0i75lpQKeBAi3YmTb9wSKtvwaKNmHM5t0xlDVLR2+unml0xxORHV
	lUVX0OZACxY5Mb/NGLRrYF2azx9nnkWVYXXWyMfESMFCnv8osxsV/WKeVYQHWcPJBBXMuIHO/06fo
	3bpVirpzHJvyaGcg7mVy3OFONrqhOZ781E8fIEbGY445LqXQ8lpVqVU/y6jgWRH8hd8rGlW89ITpp
	jnxOdpTPu/8086RJxxUzFDqVeeVuYM2t8/NvIWtN28tEM+QLq0oInfmXnwr97C+MqpQoXvbXgnyJb
	nC3znhTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59wl-00000002ake-0l7x;
	Thu, 09 May 2024 20:00:55 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59wg-00000002agS-2biy
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:00:52 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1ec3e871624so11775015ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284846; x=1715889646; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HYbl9V+AVk19HnuKFt5pVD1HiMf/Dt0RSFiQIU6DF6Q=;
        b=NthKmJzP09lBB6/45XuzjIlXwexNMDjz71tRHKpucMlfEc/UrW7znh3Flq26WfmV32
         5e0kp1mww8WrdOM6aqZHwoRspJYlsM/PmlvOC6FOdq8HSBWnLXb3wKp/3CdwZHvdrV8H
         cwXqLj0qzXptcQvCopB75qQAXEXCUQuGsPigvNQx+BzY+OHK8w8Uvkp+RdxOPijMQn4M
         +i90GByVKhK7Emlckh3U+6AJCaeSC+9k9oUfgXRZFke4q5362+ZDTQgjxzEqWU+GjowC
         grQaY6aYOuMWAo1HIzgnH/owXtxVoJerVhU+NsFPbwINnw+TH8j1xKL6shPbanvuw696
         sBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284846; x=1715889646;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HYbl9V+AVk19HnuKFt5pVD1HiMf/Dt0RSFiQIU6DF6Q=;
        b=QzKCyDZgGa22gYJ6VJXU361BXoy0pjlBuEym5H3J3R1nq+aIw4n82KmKg6yrXwiwfZ
         uZh/ussSitucHZfsqtVUnFgba1UqApbO7wDrmzzu06qHz8hWIF9GZ4QteHadxTmObRC8
         EMAfb4OVdUfSfVOm72s8TTjGpLRKuVOA7EwSxK5yIQoWf4LyJFiwt7fSNoDWbae1ArhQ
         1HeEfNHn3TA6K1T3G0OhGuD5cBKobg0XnKuL3YB+TP9Du6bCSlTI20XH/pSce788vDyH
         RqzxIS23mmRzmNrnPoxkBdPV8XmJm54oFCnjvLCizTXg5JXxZl8moZOoRn8qCEnxcqa7
         jmsw==
X-Forwarded-Encrypted: i=1; AJvYcCW2sTnn95cOg3UP6BU/kNWQCks+esG7mJ63AlYHlvxYtz3v5GAHA1/glPKP1mB2BDdsYTpO5bQ16xDwt16T2NiYklKNQiuucmICwRisImIX
X-Gm-Message-State: AOJu0YyMnRmkQ9jh/vQXnF714D7NnK73WKMrAA0eaGPVdz99SwB9w+CA
	ClFOSjGTHz7I9A+W/IFQzLawvPMneTkDMThfua7411KIbpfLnOXkyHbEEi9wcDkGZTdQqTJohn2
	QyQ==
X-Google-Smtp-Source: AGHT+IELAqSB8hYFZ34xlKzhfSzqUAYBmeLr7kRjV31DWmw0y95gSGc6MHY0BCLwKilkYBHcSHuLNxq+e3c=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:f68e:b0:1eb:6672:cbbc with SMTP id
 d9443c01a7336-1ef43e28196mr373325ad.7.1715284846073; Thu, 09 May 2024
 13:00:46 -0700 (PDT)
Date: Thu,  9 May 2024 19:57:54 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-3-edliaw@google.com>
Subject: [PATCH v3 02/68] selftests/sgx: Include KHDR_INCLUDES in Makefile
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, John Hubbard <jhubbard@nvidia.com>, linux-sgx@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130050_669778_C77BE45F 
X-CRM114-Status: GOOD (  10.81  )
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

Add KHDR_INCLUDES to the CFLAGS to pull in the kselftest harness
dependencies (-D_GNU_SOURCE).

Also, remove redefinitions of _GNU_SOURCE in the source code.

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202404301040.3bea5782-oliver.sang@intel.com
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Tested-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/sgx/Makefile    | 2 +-
 tools/testing/selftests/sgx/sigstruct.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/sgx/Makefile b/tools/testing/selftests/sgx/Makefile
index 867f88ce2570..26ea30fae23c 100644
--- a/tools/testing/selftests/sgx/Makefile
+++ b/tools/testing/selftests/sgx/Makefile
@@ -12,7 +12,7 @@ OBJCOPY := $(CROSS_COMPILE)objcopy
 endif
 
 INCLUDES := -I$(top_srcdir)/tools/include
-HOST_CFLAGS := -Wall -Werror -g $(INCLUDES) -fPIC
+HOST_CFLAGS := -Wall -Werror $(KHDR_INCLUDES) -g $(INCLUDES) -fPIC
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
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
