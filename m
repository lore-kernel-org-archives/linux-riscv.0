Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1B7C25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=e419ioKsDDBlAJoIyU3tsrf5iwhnyNi2TKarRbjcvsE=; b=s1Ia3xRYUBTrnUEdI+VF1iUaCA
	ZmKrcPwSFh3FhuACdrcbiKTkht3NnvEvespFIJ7vmQGZY8roHo7FSe+lK6ZMVLXNpD99LGI/6OJRm
	OBktCyYPNuNElXiy7Rz3KFboI6B8cPgbJaj5Sve2r8z+I55sNl3gzs/9RrcDVY/TMM6y1aQMoeGnI
	vG/VMqHxBKuj5DeW0l2URwgyl0MIPvNoZNi2yfpGJgKtFPMAYvkCTbV0y1CoyHX9vzXUSMgxNye8n
	KAQu8ePVusGNnhOdU5RqLpAfUfHXCocE/zOwbglpfiJ8P88o+yKR+gDDktsmekGVLpSxXNwlYUz9Y
	3VubwAoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5A0j-00000002dgM-1G1a;
	Thu, 09 May 2024 20:05:01 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59z7-00000002cWM-29qV
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:29 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6ee089eedb7so1321391b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284999; x=1715889799; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1HIud3j7hw+SCl0gZCLxmuOdO359mwG6ZPGgmENMsjY=;
        b=XtKZKphEYyJiFPLzTY+p7F7qrHuckGpuT6OZssPd67wWxbwM7BGTRcl3XgvZNRqYZB
         0hrdP2NKPgPpMKEXS/p8uCrWLvRVu0Gi9649ExRXdUQbMy747LmrOCqNKO0Lreh+eiYk
         y8WWYp6MgEr/tCqIxCKBYknoSQwQgU3lHjFKJd2+W4tmDRptXX1UdqP8/10os3JppqkP
         KoGb2YyGY5EAVE9VvFvGVh2CVmMT1QFfUVW8RsbU6eWa6/dzvTBXkduUDbiGEJnfWNvI
         pUyjcLRk4NvvOFMJjd7eLUuFW02HEFGUbAo1TN9WD/uMgjrpusHwW09FUGhupSs7D/nj
         FZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284999; x=1715889799;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1HIud3j7hw+SCl0gZCLxmuOdO359mwG6ZPGgmENMsjY=;
        b=RQmJ9Us1TZuSmuPcy9RP57OYewW8TvjHdJwrmyVeCriDgUOAGToxqn8e6wAgb9Y3DV
         udkpjVi0hbvoWdUlO4fw/BM5vSkvmk6/EFRjLHaPKLKrUa1cGz11zBMrT4wpzAv6V20u
         O6PAzyRMSa/OI45tKyLiei1dSqdfZEBdkoWz23/VxxDbIAe5lMIQF4P4FxYoBWKkLGQX
         z9UAyXjgwxp/rMc/SdSne5aTXH+rBLOHd3Y13Mp5M4kRekorbXlwv9elIpOkONinJ8QW
         mnAQTEInCO0OLZ72kT+4n05tZJGKuqcwhnzMsZIhlqNOAVRI9+sKnNgpUUt0b75qEN5b
         1xMA==
X-Forwarded-Encrypted: i=1; AJvYcCXfglVIVg0gY9JRI5q/V962Rco3a4Y/lNfHBiU/O8O+S6D/JD1sfA47qajf0OIKanyrKcZPA9oEASbAapEmjisKVrcIk+W07j8/rjHx3CHS
X-Gm-Message-State: AOJu0YzC0Nx+WYk5Tmz7opDXxxQ6qys/bakHVorA56tjGOIKNTECXCDr
	qDfDGTxeTo6f579OOneB5+l44TGmxW7qQDyfqWRlwjQCe/Nkmwvk8HFedRdyOOSqc2aZBjfywJJ
	2Gg==
X-Google-Smtp-Source: AGHT+IENgmr10+nzjNcMdhdNDTzER9b53y/mst1FjhAtj1Qm1Boi+WgJ7sFW+pHzHKduriFjFIhfQXMw+Ho=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:a91:b0:6ed:ce48:f194 with SMTP id
 d2e1a72fcca58-6f4e0296348mr32533b3a.2.1715284998656; Thu, 09 May 2024
 13:03:18 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:43 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-52-edliaw@google.com>
Subject: [PATCH v3 51/68] selftests/riscv: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130321_869799_261C85A1 
X-CRM114-Status: GOOD (  11.82  )
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
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/riscv/hwprobe/cbo.c        | 1 -
 tools/testing/selftests/riscv/hwprobe/which-cpus.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
index a40541bb7c7d..4de6f63fc537 100644
--- a/tools/testing/selftests/riscv/hwprobe/cbo.c
+++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
@@ -5,7 +5,6 @@
  * Run with 'taskset -c <cpu-list> cbo' to only execute hwprobe on a
  * subset of cpus, as well as only executing the tests on those cpus.
  */
-#define _GNU_SOURCE
 #include <stdbool.h>
 #include <stdint.h>
 #include <string.h>
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 82c121412dfc..c3f080861c06 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -5,7 +5,6 @@
  * Test the RISCV_HWPROBE_WHICH_CPUS flag of hwprobe. Also provides a command
  * line interface to get the cpu list for arbitrary hwprobe pairs.
  */
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
