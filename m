Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA3FC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 02:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rf+mf31asKRFnT2X0FK530z1h2e9tJ1tS69z+y92j6c=; b=ip24p2G7KM1FRPixstZYqL4bIj
	yQJEzHJfLb3H+BIqSxQmPHgr7cG6Q8BT4cb/T91bZDrwsZdxFn0qtO/r5TqKR8nyoM7W+KuTo9g82
	VpCSyV5qRoPKFzO4xgmKm4AV61qX6FKFlnVMrJUzqMLK86Ar5uHgbUT0/X9Vk2lkFaBxCR/6Wn8/K
	vzFrjEaXB54s9p+CM43xRPeri9FDG23i0WN9DYJ+e5QvVvcLCm431FZjUW7ke9Jbn3T80RQYYQrmh
	dCIYkQJB1Ocmtjqvz2WakqqfToMq/fNSSHhE8ACRLZ3MJg9BIoop24Z8iSb1uamInDIkaaEXUxeqL
	blSmRdbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5G3T-00000003kqC-0okC;
	Fri, 10 May 2024 02:32:15 +0000
Received: from mail-pj1-f73.google.com ([209.85.216.73])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dri-00000003OVq-3Owd
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:12:09 +0000
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2b4348fb84bso1261483a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299913; x=1715904713; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jvPt4Tl0MuZvjLcVUnKyQWY6SnsFvSQcdBrwWAVVIiI=;
        b=eIjF+YCqQ4PQ6h/SRNGewQ/yeXr4mrG9YNRgFg4mRH5wdt+BeYTwJ+2NPpWMW+FtqD
         u/Bj0t0ZaPlo9fSAP0MyGYXYAn7SgC9F5tvu/V1Fc/caWYmm0rtCHXm/OsWZAHWcNktB
         caN4AzJ7z7V1mMGw+CmGj9FcllJ7+V0VlZrIxpEwvHxrxJa7gKZIkj+fkwMm9WymETZy
         yOKMUkhbTGApoS5pru5cGVTuEcTsbX0Mn+tg4z1CebralHT+6xrX6w59712/aL3Sq43+
         Jx+Vodg/w2LKdSV8p0453CacgGyH3K5spBdyPPUMMjafvu5tJ6z9Usak4s3oaY9nmTNK
         b/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299913; x=1715904713;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvPt4Tl0MuZvjLcVUnKyQWY6SnsFvSQcdBrwWAVVIiI=;
        b=BMwWayzrbrbSA9yaNGCcnWjWx1fobjmgpVoOytCMjKI3EYE+FIV+UhbRfuCY/IPkVG
         g7Ye9fI5dKiolf6gIw+UDwuS87CnJbBQiT78SzhvfDWBAUkxK24kVSG8/DJHpmst9gA5
         aMOTn0fXJSD7X4A3m6jBs2FPQxlqny4UmZirqH+QvL8JfF+QqTKi1WzOnv3dHOONu/8A
         2DOoHy75Vh3wFXuMHC2UKuDRHwlDto4EU05VAn7hFbFIr7ZC5e+4ACyrWVtQ+YlC5vce
         I8n8Z1Cj5mMmFJbef5YfwOvEdp+36S9rjDn8PeiGwdw6sbkH08pDFwQWeBkBVsbDR91p
         FqXA==
X-Forwarded-Encrypted: i=1; AJvYcCVr2q85WIeKKhhocyScwL6XxBNt7fQwAAf2rt7KUO1iAGVy0PXar6RPWcIQ0CGwWzzfaW69jV4tYaMGRhxhd11CZ7tu8ubz2UWkKIqtBkk3
X-Gm-Message-State: AOJu0YyyifSClh3XPxjCcb+Pz/jv5izXbclxWMa0q6MA43nYh8ceZrMr
	WH/PV3+WijnrvPn8T3j6dfbG8TmbL7TpoO0FePy1ysbfK6PYjpMTC/f7e89M2JatYlQT6FqN86r
	kaQ==
X-Google-Smtp-Source: AGHT+IGZ2aOBDdexFnrNtN3LwFkzh8EwXSY2R5YkN1xQaKaoqKI0IvKyYvyqXpWGkRSifj5tD5YyyT57Tro=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90a:e00d:b0:2b4:346f:9a75 with SMTP id
 98e67ed59e1d1-2b6cceb662fmr2747a91.6.1715299913222; Thu, 09 May 2024 17:11:53
 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:16 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-60-edliaw@google.com>
Subject: [PATCH v4 59/66] selftests/thermal: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_171159_050844_B6244BB1 
X-CRM114-Status: UNSURE (   8.46  )
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
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
