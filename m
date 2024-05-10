Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3030C25B78
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=C/pbp8XiIsOsXhP1F+3iGI5xtOfa3eNJcLZRty/H/Jo=; b=YQYSVnkw4rgDIbostzP+YzCZzc
	b9xgK6/x4d1RsojX2c7f9q1z9UCeL+srwA8hGgthWPggqrkH9l7uEYmCNLyPJ/Hp+4/xyYC7iBP1+
	75TMx7D3wKinbNdF1Itgz19RAQfuoVa1L6E9HqbO4hYLB2yx51qyQlxLr6ntuq5BUSofvNEa73k/Y
	V57EuArzOddNPCsJQuW+crJ/XDa44YVKwIG8AMBnLOjCPgoPrWDmrRwhn05rhcQrRzRO1d2Z3tbmm
	A4OUb576PTZjp3wa6fJGNINYD5QTZUGOLtSqwmDYFiZY6aYPxWDRBUnNi0L7sIf/P9NniKZGb4O3W
	YcclMDjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Esp-00000003alR-3p3h;
	Fri, 10 May 2024 01:17:11 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dpq-00000003MzA-0vdp
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:10 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6f45487858eso1034609b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299799; x=1715904599; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6h0yxxJBIGq2jf0OFxRdvAuf0GSm4XtFP+RSMXkmCzo=;
        b=h1KCW6kXD7gX0q7Xi/B8O8zxUgR5oQegRa696jATgqI9kElebaK7LKrIHfZe1IEoG/
         J9wPsDPmWcmu7E6KlhZTlb+89ad6A3cjpMUIVsmLKMZihG1hMvWB5ZZ7/ls21JkM6lcy
         tf+kwLCijjbvirPwuuYW2uRTNJyjblzSrOqBYpLgP3S54PAFizGkw/qYBs7+zLXwVVM4
         kxzfMK7xl/ORL/28yT+MrDM1YdtAOrXfXNBFdz95t8gUfTfXWFflVZcVaId0Tq3H4RyK
         J+9aFQ8iiaCEO0A5zbdB2ju5JsJcM8eizVEucbQlJNmxzPY6gTnatVAhayrwB7qLK1BH
         JjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299799; x=1715904599;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6h0yxxJBIGq2jf0OFxRdvAuf0GSm4XtFP+RSMXkmCzo=;
        b=PlxlYs1hftpVjRHoSekegafkDzmb8SGnRhAiXN5NVucShshUqY0Vn5Gjc0epuhuK6x
         Pn9OtbUuITXHVRSATMMW/3bXDTMdr+ANXkUPsQN2eCp8JNF0jfd8OB1FdAjxlUvUhihB
         KTwLKEqsxaJYAgouIltuToaZlb/zZIq4/q1lfIfTwwV9/eJiLvbZ1QwMo5keEPGVmJKj
         8MoA8b4qTSy6MlDe2MM5k/eA6KjjK9veuNcfbUcOv/sObwoThVdta4dkkJj+TXvJdl/7
         djkO7zFvgB3bAS7WPCw+hA1YqI0DDfVm3p9NrmvkaVLyQ830IwDiuGMz+wafW0DfkiSS
         L4Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXVwjuNweuPBS3YWwWotA+oxhjOcUD0NriV+i6f9O+SSpFWyWHZui1fdHmz7F/nD9h/uQiBfqdu4RQXXjDY3ofg5W8Mss0oiykCA35fuBaa
X-Gm-Message-State: AOJu0YyMiaVKGFSiWX0PNZY5jOO3Aw0ASFGw/xvX3qtJ4x4OVoJb22rz
	U6Os/nFxG8gmGG+GY/lpn07a2w3zPXhV4ss8Vz85UKepQeRockalZJFYoSYAlJCGDc9uJRvMAbA
	yKg==
X-Google-Smtp-Source: AGHT+IG39H4pksU0ri/+4ci/+CMifWOpp212NwWMPxr1jqe+yuMoJVZrhw9Tl2uxP+3cDEXB3PYnzZeCYzw=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:1d26:b0:6ed:d215:9c30 with SMTP id
 d2e1a72fcca58-6f4e0415f96mr2708b3a.6.1715299798449; Thu, 09 May 2024 17:09:58
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:36 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-20-edliaw@google.com>
Subject: [PATCH v4 19/66] selftests/futex: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_171002_867029_70DA4F14 
X-CRM114-Status: UNSURE (   8.79  )
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
 tools/testing/selftests/futex/functional/futex_requeue_pi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue_pi.c b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
index 7f3ca5c78df1..8e41f9fe784c 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue_pi.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
@@ -16,9 +16,6 @@
  *      2009-Nov-6: futex test adaptation by Darren Hart <dvhart@linux.intel.com>
  *
  *****************************************************************************/
-
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <limits.h>
 #include <pthread.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
