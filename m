Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D329DC25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7tAYjm6GSow/BDdBFQ/tp2BgD0Byc7B4in+9Ni7NumA=; b=Rkmd+lPkRbcFXN8i27evrHR02A
	Ib8t+fIxNvOB7d7zYXFvyeY4pnc9fUAnh+EfF9173Ezu/oMWK2zWDm4vnq46LFeLZH9NhTejEBdZT
	tfa19bAo+j4OrmCIdq8UV7xbxgfBq17jcbeqQqkpI2ppsBQZxE1NNqCVRP8MD6wmhdiJmdk1Lg73d
	N3lXeXm1jmDF6zSaxGOu2zhsVdKYk3C4bZ9SS+tJAnximz6qDK0Fj/r+bTmjbZFABkLUVWHOIm3c4
	H3WhuHO4twaLNzLZXjKdnaroxX6Ix4I+/vB60YO73Lr0aA/oR3D8xBx+/4LTHNb2Nm5XTIT07yx7n
	ncGQCkXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aOK-00000001VhT-3HJy;
	Wed, 22 May 2024 01:03:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMh-00000001Uac-0XMQ
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nL+ubtFWboAj68fw0TJnaXwPXe162hyOQA2fYCAWD/4=; b=PMBSQuxmrfAHVHCKJI/GSiPgW/
	aWAHlpfUskNKxqZzAYYjz+wE7SzPfCvBaU0M3pqWykM28o5Hq6VXftRan76d2gHMKEhdJzBe12LKZ
	3cCMFZaeoSMIaUVa+DoFOq/MGfSHl0vYCmrPALXbeotSvk02TmvY1FRgEGU6ptKyrzPEqZzKl5+Ls
	bd23nzEZP56hh+1cOn6sa/cw6Xa7kJwhSRlWVsrQFkIMk7e4IOr8FnCiLVHxrCD52Em6coRQM426Z
	vZ2bCtitqzVNTZmbv2IGqnpxh0NpFwOdNqfr3e0mGFxEYQgM7SycQFFwsM0KFSZhzSvwYf/uU9r6U
	P2I+2iNQ==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMY-00000000B1L-309B
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:01:57 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ba0fd5142dso296283a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339659; x=1716944459; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nL+ubtFWboAj68fw0TJnaXwPXe162hyOQA2fYCAWD/4=;
        b=OK7HWXylGYYo0P2Axgm4T6D2nAv0Uh3Nk4pSso7pAlWKTjOvfVUcV/sU3hrqZCE/LE
         5otiwNrjumHU5az+pCogE6qIYk74thsEaYALimvzGH7aD212zdRDiDxCyPzIyaLf6oRI
         cMyZLo9Csuc8que315WG7A0tKGt3jUERke+xXK1U7MFoik0TObqjnjVipMX8d9Hi2FMP
         sTBp3PxDDhGI2kvc8FWF2tWWhP4W0Oe3D+p1FViNKe0lUrSqM8nFg+VTRu/HC8LdWtkX
         3CKbdnQzvImVZzI6rUNU/4MeDFPLmaSf8Z5Q9pGeCXG3WF3vAxPcoIbOAtKroizFKEDA
         m8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339659; x=1716944459;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nL+ubtFWboAj68fw0TJnaXwPXe162hyOQA2fYCAWD/4=;
        b=lQiJDXszpQ6p3tlGMknhqgpseRG6FeYAtMBuWawuG4KMIAnpdu6ukkfMdWDEj47CqR
         pVYasuAlmqlsvQYJ7g8u/lBWePEfry2DDgfFmyP8aR1LYQMUjTaeRToXbC/hfMhTX266
         gbG6JNkbr0WR+6ap52qeVIi68rU7a7GwbE14uV/gM9Xkfg1e6iSmxakFpCYFVZdM0m/D
         J8S1Th5w1b+r5nUEaWswq64ND0ZBGPvnJhIvuNQ0qJFI16h/uJHfRGtjos+2Fa6ythVv
         c82Wb1QHpbQd+opqZA5JaUpx3xG2W04CFyA1soKJJXqBEgsZG6/FgsyATZChEAQLVtyO
         al0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWd9/zCjylVJs3qhKlwev/KaMyBLQAsctD1y7H3Ov5c91COo5+QD9+RZOd/UuU3GVnwy7XqsjO+IGIWdnyzUJuYqR2aDWzdcIEf3GmoOAjI
X-Gm-Message-State: AOJu0Yzqi2PBMf8cCezIhrFYvFSfQez3VA90pBQPkYJzVu+VupweRpnf
	2dAK4QXK4UQ6S/rAowImlFSJ/5Fpi2Qr/NajGRi2/bCYkEViCe2l//lc9oykfXeuNMXVrLOvDWp
	bNQ==
X-Google-Smtp-Source: AGHT+IFLQzFWZiqUTK3Azm6UcS8kuBORuVlSinjMbACmyep3Umv3MgrgYHUnUQ3gBwp3EG5Minoj/gBGK4k=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90a:ab0a:b0:2af:499a:fc9b with SMTP id
 98e67ed59e1d1-2bd604d3e7amr74137a91.2.1716339659309; Tue, 21 May 2024
 18:00:59 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:17 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-32-edliaw@google.com>
Subject: [PATCH v5 31/68] selftests/mm: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240522_020150_823022_C6F0DED0 
X-CRM114-Status: GOOD (  10.33  )
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
 23 files changed, 31 deletions(-)

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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
