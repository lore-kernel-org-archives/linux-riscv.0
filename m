Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEDCC25B7E
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=R4T+QbRGFZMyiJVC+nbBVWXAHzay5veL1iEE7XFKDmo=; b=Lvlyj7p1fBYRXMY16HEOnTMw0L
	1YGW0vhHe/Ip/esvlcp0Evr1kSWSdOJ4WvnNaMXehiSZBNQXuFKp4T+ksbLUqAG4b5tccBGzpkREi
	mbJ6hKRtBadSOx4F9XKfKrYw3XVkQ6rDBR7ZoB+wXIF7AFntkQszxmJ5TT+4IZ6nzxyrDQ2zjvtuM
	StA4KKBMCUWsVYoXaULd/hh7nXchrfI3iuT/54aly8FAG8Doifhih9HFGQPzL85OOAvLutn2l0/C2
	uIKrjEe+RKKluL9noXC5kmd6bOZDlilb23pfP1COo0EJq/dtzpEkE0oXyqhqUHERjWaKWfZi2QXNT
	6mZX6Ckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Esu-00000003aoK-361c;
	Fri, 10 May 2024 01:17:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DqP-00000003NRz-1ZcI
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Mr4NdGT2PNvZU+5L6nsbhn20MQoXzIm4/FSacRpNfog=; b=KoyKENC9bY+8CkDcKps9kqJ5Kt
	o47hHGt4XC9gSmdfXZC8eOtPw5eAchXLkJTS2JFNneu/3X3zrPYTdJIfj7mgIw2eaKoUMFxiv5NJ2
	VAUk1oMYgFQo5Z7TIES7kXK9se8RVDRSIekx/5EySk5PkywIK/4HmqWyeVcqFDzcf9XKVipMKBbhK
	WHTiQ5TXJNF6gA0CvoGmY+HkFnYCBDLD2sCcgk/fAHDC3pggZE3DZ+S23m0JRh7EA2kEL4mSiwoSJ
	EFTmoSMSE6wYEPMlFHFHVLuEtOVE2h2Y6WQQ9ZmG4Bpilk/1skU3ZiI2b+K8U3GXUi/f8kLGxqux1
	Q1FHZkNQ==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DqK-0000000367f-2d4R
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:35 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6f44b2e0bf2so1554191b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299830; x=1715904630; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mr4NdGT2PNvZU+5L6nsbhn20MQoXzIm4/FSacRpNfog=;
        b=W8C+5bQ/sKTBh7WXok10RnsqvXSDcHbvORkqQFeGvoURBoDuslqH2pp1yXiFBcgTnh
         VY23Q6TWy4lYaYtsjx1B4h7Lsw/zeaF2NLrWSY403FrAFb13Z7PVcTWrJGhXxN2ULTxd
         GtIm6sM6Ukcm2W1M/3ZaNmYX6gpXUzakpno5fVlNtK6anR+kMspuXa+wQ2+bzqvBOj4G
         TZAYvUlDHOzAOr/ltp/nsVxl/akLQ9gIQYksj1RACka0BSGUQQ0a0D0bMCmygI5di3DS
         6hcXAv5WSUVkvMQmiJFOhpXnJQgbKBmnx3QgAE5/y1YOY7vRaM0cM2kScftH5sTNfB8r
         VpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299830; x=1715904630;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mr4NdGT2PNvZU+5L6nsbhn20MQoXzIm4/FSacRpNfog=;
        b=HY4qtsRSEqly2HNKsFBZf0KT8q8p31KAq+Y2NZSmnRxswST9Z+eD0c1jo2nFap4nOC
         uGCwS3wARFfMVomoXQz0Ru3vTjXzcl7Wf8xDD4r4+FzwUJoauLs1WdAB3V0aQLRC+tWZ
         C8LG8IyW1mDZUv0MArrfI+DbXhLE057a1X203/PqlvLXTZJYSzbzJOzL7Bf1XcwUm0H6
         iFR2yBlnBQqHkV8zGunDfueflEXdSmf+IEScs0SEr8Pv4S3CZyzvZjxEfc5jMmXMg5aK
         ZUh3g3RlFKuFhg8duAOyOZrtaQMC+A7uZ7BxSpqIzEj7N/UXDmhkWO7+Z9TA/0NP/iER
         41HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEIi6btM8v+mYzRztZG4XULaNYjk9AB+Ny5sUwJTw6ELvxGUxjHebckmjgTjdGihChS85I14MgIkdNYxk01aRJqBn9CJXlHEE7eqdh7h1W
X-Gm-Message-State: AOJu0Yw3NG6cjiR+HOrvL5qabBMeMMnHz3t631dVcJ9JvqmL22AxOnDv
	X1QmjlRN6hxVg6c5N1kAmElIilwKTV8w5qglXsowAwuVGY0wv6IXKxVSrj5LtdJJ9E2fzqwkumc
	yVQ==
X-Google-Smtp-Source: AGHT+IGkqcBYg1ifiUd3TZtoa2X7YmEYrYy5gqzOTI3Rl8hbGb6PZhI2rE5TebYUa8SG5dpiJTZlea5cdbc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:c93:b0:6ea:e2d9:f2af with SMTP id
 d2e1a72fcca58-6f4e015f786mr15106b3a.0.1715299830166; Thu, 09 May 2024
 17:10:30 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:47 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-31-edliaw@google.com>
Subject: [PATCH v4 30/66] selftests/mm: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_011033_035763_EED18D2A 
X-CRM114-Status: GOOD (  13.01  )
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
 tools/testing/selftests/mm/cow.c                   | 1 -
 tools/testing/selftests/mm/gup_longterm.c          | 1 -
 tools/testing/selftests/mm/hugepage-mmap.c         | 1 -
 tools/testing/selftests/mm/hugepage-mremap.c       | 2 --
 tools/testing/selftests/mm/hugetlb-madvise.c       | 2 --
 tools/testing/selftests/mm/hugetlb-read-hwpoison.c | 2 --
 tools/testing/selftests/mm/khugepaged.c            | 1 -
 tools/testing/selftests/mm/ksm_functional_tests.c  | 1 -
 tools/testing/selftests/mm/madv_populate.c         | 1 -
 tools/testing/selftests/mm/map_populate.c          | 2 --
 tools/testing/selftests/mm/mdwe_test.c             | 1 -
 tools/testing/selftests/mm/memfd_secret.c          | 2 --
 tools/testing/selftests/mm/mlock2-tests.c          | 1 -
 tools/testing/selftests/mm/mrelease_test.c         | 1 -
 tools/testing/selftests/mm/mremap_dontunmap.c      | 1 -
 tools/testing/selftests/mm/mremap_test.c           | 2 --
 tools/testing/selftests/mm/mseal_test.c            | 1 -
 tools/testing/selftests/mm/pagemap_ioctl.c         | 1 -
 tools/testing/selftests/mm/pkey-helpers.h          | 1 -
 tools/testing/selftests/mm/protection_keys.c       | 1 -
 tools/testing/selftests/mm/seal_elf.c              | 1 -
 tools/testing/selftests/mm/split_huge_page_test.c  | 2 --
 tools/testing/selftests/mm/thuge-gen.c             | 2 --
 tools/testing/selftests/mm/uffd-common.h           | 1 -
 24 files changed, 32 deletions(-)

diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
index 32c6ccc2a6be..8747ffef200f 100644
--- a/tools/testing/selftests/mm/cow.c
+++ b/tools/testing/selftests/mm/cow.c
@@ -6,7 +6,6 @@
  *
  * Author(s): David Hildenbrand <david@redhat.com>
  */
-#define _GNU_SOURCE
 #include <stdlib.h>
 #include <string.h>
 #include <stdbool.h>
diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
index 9423ad439a61..53c257f6159c 100644
--- a/tools/testing/selftests/mm/gup_longterm.c
+++ b/tools/testing/selftests/mm/gup_longterm.c
@@ -6,7 +6,6 @@
  *
  * Author(s): David Hildenbrand <david@redhat.com>
  */
-#define _GNU_SOURCE
 #include <stdlib.h>
 #include <string.h>
 #include <stdbool.h>
diff --git a/tools/testing/selftests/mm/hugepage-mmap.c b/tools/testing/selftests/mm/hugepage-mmap.c
index 267eea2e0e0b..edb46888222f 100644
--- a/tools/testing/selftests/mm/hugepage-mmap.c
+++ b/tools/testing/selftests/mm/hugepage-mmap.c
@@ -16,7 +16,6 @@
  * range.
  * Other architectures, such as ppc64, i386 or x86_64 are not so constrained.
  */
-#define _GNU_SOURCE
 #include <stdlib.h>
 #include <stdio.h>
 #include <unistd.h>
diff --git a/tools/testing/selftests/mm/hugepage-mremap.c b/tools/testing/selftests/mm/hugepage-mremap.c
index c463d1c09c9b..8e22822bb754 100644
--- a/tools/testing/selftests/mm/hugepage-mremap.c
+++ b/tools/testing/selftests/mm/hugepage-mremap.c
@@ -11,8 +11,6 @@
  * To make sure the test triggers pmd sharing and goes through the 'unshare'
  * path in the mremap code use 1GB (1024) or more.
  */
-
-#define _GNU_SOURCE
 #include <stdlib.h>
 #include <stdio.h>
 #include <unistd.h>
diff --git a/tools/testing/selftests/mm/hugetlb-madvise.c b/tools/testing/selftests/mm/hugetlb-madvise.c
index e74107185324..70c40c67bc5d 100644
--- a/tools/testing/selftests/mm/hugetlb-madvise.c
+++ b/tools/testing/selftests/mm/hugetlb-madvise.c
@@ -11,8 +11,6 @@
  * filesystem.  Therefore, a hugetlbfs filesystem must be mounted on some
  * directory.
  */
-
-#define _GNU_SOURCE
 #include <stdlib.h>
 #include <stdio.h>
 #include <unistd.h>
diff --git a/tools/testing/selftests/mm/hugetlb-read-hwpoison.c b/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
index ba6cc6f9cabc..6b8b41b4f754 100644
--- a/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
+++ b/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 829320a519e7..d18bf400dae6 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1,4 +1,3 @@
-#define _GNU_SOURCE
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
index 37de82da9be7..b0af40ddb0fb 100644
--- a/tools/testing/selftests/mm/ksm_functional_tests.c
+++ b/tools/testing/selftests/mm/ksm_functional_tests.c
@@ -6,7 +6,6 @@
  *
  * Author(s): David Hildenbrand <david@redhat.com>
  */
-#define _GNU_SOURCE
 #include <stdlib.h>
 #include <string.h>
 #include <stdbool.h>
diff --git a/tools/testing/selftests/mm/madv_populate.c b/tools/testing/selftests/mm/madv_populate.c
index ef7d911da13e..f2c8223ff3d4 100644
--- a/tools/testing/selftests/mm/madv_populate.c
+++ b/tools/testing/selftests/mm/madv_populate.c
@@ -6,7 +6,6 @@
  *
  * Author(s): David Hildenbrand <david@redhat.com>
  */
-#define _GNU_SOURCE
 #include <stdlib.h>
 #include <string.h>
 #include <stdbool.h>
diff --git a/tools/testing/selftests/mm/map_populate.c b/tools/testing/selftests/mm/map_populate.c
index 5c8a53869b1b..ff4d4079bd0e 100644
--- a/tools/testing/selftests/mm/map_populate.c
+++ b/tools/testing/selftests/mm/map_populate.c
@@ -4,8 +4,6 @@
  *
  * MAP_POPULATE | MAP_PRIVATE should COW VMA pages.
  */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <sys/mman.h>
diff --git a/tools/testing/selftests/mm/mdwe_test.c b/tools/testing/selftests/mm/mdwe_test.c
index 1e01d3ddc11c..200bedcdc32e 100644
--- a/tools/testing/selftests/mm/mdwe_test.c
+++ b/tools/testing/selftests/mm/mdwe_test.c
@@ -7,7 +7,6 @@
 #include <linux/mman.h>
 #include <linux/prctl.h>
 
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <sys/auxv.h>
diff --git a/tools/testing/selftests/mm/memfd_secret.c b/tools/testing/selftests/mm/memfd_secret.c
index 9a0597310a76..0ba721d45d35 100644
--- a/tools/testing/selftests/mm/memfd_secret.c
+++ b/tools/testing/selftests/mm/memfd_secret.c
@@ -4,8 +4,6 @@
  *
  * Author: Mike Rapoport <rppt@linux.ibm.com>
  */
-
-#define _GNU_SOURCE
 #include <sys/uio.h>
 #include <sys/mman.h>
 #include <sys/wait.h>
diff --git a/tools/testing/selftests/mm/mlock2-tests.c b/tools/testing/selftests/mm/mlock2-tests.c
index 7f0d50fa361d..99dc39bf2fec 100644
--- a/tools/testing/selftests/mm/mlock2-tests.c
+++ b/tools/testing/selftests/mm/mlock2-tests.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <sys/mman.h>
 #include <stdint.h>
 #include <unistd.h>
diff --git a/tools/testing/selftests/mm/mrelease_test.c b/tools/testing/selftests/mm/mrelease_test.c
index 100370a7111d..d78bf686e99f 100644
--- a/tools/testing/selftests/mm/mrelease_test.c
+++ b/tools/testing/selftests/mm/mrelease_test.c
@@ -2,7 +2,6 @@
 /*
  * Copyright 2022 Google LLC
  */
-#define _GNU_SOURCE
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/mm/mremap_dontunmap.c b/tools/testing/selftests/mm/mremap_dontunmap.c
index 1d75084b9ca5..934fa6b441b2 100644
--- a/tools/testing/selftests/mm/mremap_dontunmap.c
+++ b/tools/testing/selftests/mm/mremap_dontunmap.c
@@ -5,7 +5,6 @@
  *
  * Copyright 2020, Brian Geffon <bgeffon@google.com>
  */
-#define _GNU_SOURCE
 #include <sys/mman.h>
 #include <linux/mman.h>
 #include <errno.h>
diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 1b03bcfaefdf..0d8dc16b63be 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -2,8 +2,6 @@
 /*
  * Copyright 2020 Google LLC
  */
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <stdlib.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/mm/mseal_test.c b/tools/testing/selftests/mm/mseal_test.c
index 41998cf1dcf5..d35ee37311a7 100644
--- a/tools/testing/selftests/mm/mseal_test.c
+++ b/tools/testing/selftests/mm/mseal_test.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <linux/mman.h>
 #include <sys/mman.h>
 #include <stdint.h>
diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
index 2d785aca72a5..50d6bfc8db05 100644
--- a/tools/testing/selftests/mm/pagemap_ioctl.c
+++ b/tools/testing/selftests/mm/pagemap_ioctl.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <fcntl.h>
 #include <string.h>
diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
index 1af3156a9db8..37d6b01ce90a 100644
--- a/tools/testing/selftests/mm/pkey-helpers.h
+++ b/tools/testing/selftests/mm/pkey-helpers.h
@@ -1,7 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _PKEYS_HELPER_H
 #define _PKEYS_HELPER_H
-#define _GNU_SOURCE
 #include <string.h>
 #include <stdarg.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index 48dc151f8fca..9f7de92caeda 100644
--- a/tools/testing/selftests/mm/protection_keys.c
+++ b/tools/testing/selftests/mm/protection_keys.c
@@ -21,7 +21,6 @@
  *	gcc -mxsave      -o protection_keys    -O2 -g -std=gnu99 -pthread -Wall protection_keys.c -lrt -ldl -lm
  *	gcc -mxsave -m32 -o protection_keys_32 -O2 -g -std=gnu99 -pthread -Wall protection_keys.c -lrt -ldl -lm
  */
-#define _GNU_SOURCE
 #define __SANE_USERSPACE_TYPES__
 #include <errno.h>
 #include <linux/elf.h>
diff --git a/tools/testing/selftests/mm/seal_elf.c b/tools/testing/selftests/mm/seal_elf.c
index f2babec79bb6..0438695bc45a 100644
--- a/tools/testing/selftests/mm/seal_elf.c
+++ b/tools/testing/selftests/mm/seal_elf.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <sys/mman.h>
 #include <stdint.h>
 #include <unistd.h>
diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index d3c7f5fb3e7b..ae6ac950d7a1 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -3,8 +3,6 @@
  * A test of splitting PMD THPs and PTE-mapped THPs from a specified virtual
  * address range in a process via <debugfs>/split_huge_pages interface.
  */
-
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <stdarg.h>
diff --git a/tools/testing/selftests/mm/thuge-gen.c b/tools/testing/selftests/mm/thuge-gen.c
index ea7fd8fe2876..28a5c31bd791 100644
--- a/tools/testing/selftests/mm/thuge-gen.c
+++ b/tools/testing/selftests/mm/thuge-gen.c
@@ -12,8 +12,6 @@
    ipcrm -m by hand, like this
    sudo ipcs | awk '$1 == "0x00000000" {print $2}' | xargs -n1 sudo ipcrm -m
    (warning this will remove all if someone else uses them) */
-
-#define _GNU_SOURCE 1
 #include <sys/mman.h>
 #include <stdlib.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/mm/uffd-common.h b/tools/testing/selftests/mm/uffd-common.h
index cc5629c3d2aa..abb44319264a 100644
--- a/tools/testing/selftests/mm/uffd-common.h
+++ b/tools/testing/selftests/mm/uffd-common.h
@@ -7,7 +7,6 @@
 #ifndef __UFFD_COMMON_H__
 #define __UFFD_COMMON_H__
 
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <errno.h>
 #include <unistd.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
