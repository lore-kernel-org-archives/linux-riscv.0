Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BB1C10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RjknDR0p/n4LH0j9C8EG9EyDOq22uqBZB1+n2Rc35P4=; b=IiOv04a0VItJHTl++WtEictkrb
	FgkP+YZ2iw5uI/JuZY0n9341cs812PP5yzx3Az/aukhYMJeTUdvxHLHNFcdM7KKc/SR1PzrwGz6sY
	YzvRCRolpE2PizLtutLTUnRCp77Xtc0Cs1XBMVc2PfCs/3+oVY4JmuRRutrXyH/Vy1jeF5OG27Zb0
	vvXcS+l1vcwigckfcDT0BjbSc2LdztBmFu5NiBlzpv8aYy4L7ww8n/jqTC60zqtO5xYA/Ibr6mObL
	id401cIxPssEPBl5UL2JOOwJBeKyMGOa31ulbBuShUg5I6G8UvltsGJ5EbTZHPQr0cWOuiz39QQIC
	lK86fUsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrC-00000003O87-3qeK;
	Fri, 10 May 2024 00:11:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dqt-00000003Nrk-0dua
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1D5J95pTto7bxbDE1cccaXNIpSHnuQdMjPAvgEtW+8E=; b=flTjJirQgXe5LfkBrGAyQd8Eqz
	ubmLHw5OAyM0Ua+HTSbyh8BCm41ZypAm0fpXXjMiDlQBdkCl58fJDSK5Nse4/4P+B8buZmn6DVo7D
	CtOlLEB+vlkWyaw5njknXqJemdAgRS/rJBTVPXkJUe0KTN1Uge2wu5Xr7gzleGk0a64kwiAt7AH96
	lHhIgviPlYyF/l8jzX2LjxitOGxhp3TIrBD2QLXkIWPtO8aBXaETi3ke9c1Xg3xUitSpIR60VuIw1
	LyeFSRUOVMCDmZ7NWUe7JqDI5Rtz/RD+FXNfcogDSJ5rH5sxwwl/oSnQhKz4JoreD2Yvm1Aid2LX7
	dyNgGhZw==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dqp-000000036Es-0zzG
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:05 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-62035d9ecc4so24616167b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299860; x=1715904660; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1D5J95pTto7bxbDE1cccaXNIpSHnuQdMjPAvgEtW+8E=;
        b=zoS8f+g7X7URJ7Ootx+GJeaZ84zkbX7QNz/2OiwWd1V4bRMLTiQKaohQZAmhFxdIE5
         AzXYMuU0x8jrH+1YSMKGRm/YgZf4tK4mHFdXBccBYv5eZwC81gWjbb5Ud6aLQ4XWpq/Y
         k+jwV/gzZyO7ahEgoOJNcGmSEv653JnpcNAim+KdTeve1YHkFHjk0a7Z4QVI8AS655Eh
         Q357luA2sxby9x/IpHg8YA676g6XtxNM7L2jYX91U3isPfut3e7zLnnV+qk8hOsfPzTQ
         erO49rTPE6dwAnttKLOFYEZiCi6GMreujVjSnqNWNDrVFRutFRfIgvFYbySndUYmFqmL
         neXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299860; x=1715904660;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1D5J95pTto7bxbDE1cccaXNIpSHnuQdMjPAvgEtW+8E=;
        b=ryahHb+lKMIfO2S3fSDK3vUQttAcUr5SdWkYbSan8zn1xraaLt6LWkxVqcWhM++nSi
         o6PJBfZFWEkLJ386fHEMD48VkoE36F2d0O5e71fvwmCyph1aAEuDhirGEu0KbSoa8+Hw
         8cq5DcpE4gm+EzlVz9NxfPNLyrGCu1Ai3FTjutvEt4LY56RK1Snw81GUQgOSZ9deyeXy
         c20sVCOBL6cod0IFw5rAVbGrx+H110/8RrKpfqz54ZKs3s97cZSq7KTc/szC+1T+rIQo
         AnIdOHRqBhcgWmCpoP6CoAh3QOPr6L1EIxV/rzrujowl/1tY+UMchamSvZa03pdZ1LIW
         YnYw==
X-Forwarded-Encrypted: i=1; AJvYcCWfbrx4JKdA7WgiXRBUkybP/5cZ1pIkP9lCQaQf/LByPZwj967rc1+VGmBnUwpND/FVbMrHuX/D0VTrOZ0meZS7pS1RFlvTWi6boCrdVTyt
X-Gm-Message-State: AOJu0YzkWYGwdZAAtfaO+ec2B7XFHx2bMHc+b7Lb+T+E99lZwGHFjSfA
	8R+Bgy/Gv0VWop97u+xU62xYPkniLZ4Vg4phqyvBeBLOhG7sM3I4gNQHfunKhFa6u1IbDSKEQm8
	1ig==
X-Google-Smtp-Source: AGHT+IGhcJ7GjAM6Vy/ApGmusiwwih9+KKpTPcTPYhDNCwh5wA+pqL1DV0C5FY2sheVBHvhFaDSoPDUPtOg=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:284:b0:61b:e8ce:18a1 with SMTP id
 00721157ae682-622b016af8cmr2822137b3.10.1715299860502; Thu, 09 May 2024
 17:11:00 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:57 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-41-edliaw@google.com>
Subject: [PATCH v4 40/66] selftests/perf_events: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240510_011103_489601_C3E661FF 
X-CRM114-Status: UNSURE (   9.92  )
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
 tools/testing/selftests/perf_events/remove_on_exec.c   | 2 --
 tools/testing/selftests/perf_events/sigtrap_threads.c  | 2 --
 tools/testing/selftests/perf_events/watermark_signal.c | 2 --
 3 files changed, 6 deletions(-)

diff --git a/tools/testing/selftests/perf_events/remove_on_exec.c b/tools/testing/selftests/perf_events/remove_on_exec.c
index 5814611a1dc7..ef4d923f4759 100644
--- a/tools/testing/selftests/perf_events/remove_on_exec.c
+++ b/tools/testing/selftests/perf_events/remove_on_exec.c
@@ -5,8 +5,6 @@
  * Copyright (C) 2021, Google LLC.
  */
 
-#define _GNU_SOURCE
-
 /* We need the latest siginfo from the kernel repo. */
 #include <sys/types.h>
 #include <asm/siginfo.h>
diff --git a/tools/testing/selftests/perf_events/sigtrap_threads.c b/tools/testing/selftests/perf_events/sigtrap_threads.c
index d1d8483ac628..14d1a3c8cb5c 100644
--- a/tools/testing/selftests/perf_events/sigtrap_threads.c
+++ b/tools/testing/selftests/perf_events/sigtrap_threads.c
@@ -5,8 +5,6 @@
  * Copyright (C) 2021, Google LLC.
  */
 
-#define _GNU_SOURCE
-
 /* We need the latest siginfo from the kernel repo. */
 #include <sys/types.h>
 #include <asm/siginfo.h>
diff --git a/tools/testing/selftests/perf_events/watermark_signal.c b/tools/testing/selftests/perf_events/watermark_signal.c
index 49dc1e831174..19557bd16e9e 100644
--- a/tools/testing/selftests/perf_events/watermark_signal.c
+++ b/tools/testing/selftests/perf_events/watermark_signal.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <fcntl.h>
 #include <linux/perf_event.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
