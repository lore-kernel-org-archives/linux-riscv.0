Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CB6C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MLeG81tsL9m/3y425cenFbrf6HJkkQf94rvj6gpto0c=; b=rehhw3CUgB8RXrWe32ZV/U0XHq
	ZVmmI50gbAbLW4SixqLE0NUw4h9Jfm3mt9b5bFGc9qxl+mVfJvU14fOaBKopsl7b+efq9GQ2sqGJ9
	Jjv5vqTfCNIEIJwGX1424RHqDqnkyGmRhuBkWwGY86iUNQZGPxqa3RyQL/FpA43CYT7i6GUyJZYaZ
	1NKyoAU5SEJaUSEevy2S4C5nMOXQSNkOZ6xznCbBRGPNLiRTqr0IkERjvhjzTt3mZ6NfZcmgefq83
	OliKzoLm0hlZc/SRjdStndO8cjrYUV4gEnwolOBg75el0wAq+6YXI/oL0OU3QzpM3U2jCrNoYKSc3
	/Refjz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DsX-00000003P4D-2EAg;
	Fri, 10 May 2024 00:12:49 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrD-00000003O68-0xQS
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:46 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2b6209f5246so1427809a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299884; x=1715904684; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hhc5ZT51Bf+X0xh3itiryFkYQiK1VIkMBG+josVXNL0=;
        b=fcjCJ1AioY7FfBg/w+dhUa2/a4SrDP3P4dJb4e7Px6M3D8ec3fEzjcmEfaF4Zowm7V
         BBUEjFL7SSwn1Ka2eimGqgNCcL7W1HFN5eDxcz249jTVzhqHuY4PFTVQZhmRzVI1z2Lp
         8wWh7ScDlIzkfhB3iC5NE9kLjyIv2EG9r40zwSdUU2I4pg8N4eAUMxHOfslXJ1upBpLk
         hGKrgNa/InEqj3zLKRG3Fuyh1N20sBg8Pk3r11v78KTH6Xjm7cC4qKMDiO3c9E0Q8Ax6
         85LZ6ulgnE0b6KbtvA6Ao+e0xsu8bxTPLzWV7IGoh0O/PhG60YKgI9aZ28uyUcrRQp1I
         3W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299884; x=1715904684;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hhc5ZT51Bf+X0xh3itiryFkYQiK1VIkMBG+josVXNL0=;
        b=iVKWwTqaFE72Mq4iM3VtVZ96oAjSpnryVxjHkUu7GTOQqv9iGmFtwMZOsVps4Kyrte
         T6JGDdhsfXvbG2oCvkWcC54nTeX4/lWn4WelGDjUXsAzF4q9qsdFDrvr9WcOfyulkACW
         wy6XA1ml5ItIyE1Qr7s7A/zilly4N3QFaMnxWwGG3KdzheoIaaa5oWwn4p1iB+lrrxur
         t7+ypB12AxDC6YzE0R0Fc1y/jd8E6CzOFLQDG9F0wnQGBA/uZI/kOWL/kWg4ZqDsCSlQ
         G+3wONpBgRvjpPQGNaRp+TQjSmgkK5Qj1LqUBfE/wOYuz0FmLy0PFE+i5+CeW3qXPeUr
         PPEw==
X-Forwarded-Encrypted: i=1; AJvYcCWIBGYgONZJiEpyfEdGbp2AbP09Dev3sdnx+VqV7+gQ0Bxt0C8Z7c/H6R72WsGyZbcf9NHMDyGlrZbJbCqtqVbEmCbUOHJrIHUSDXfX4tzx
X-Gm-Message-State: AOJu0YyfSznHAIO8wad6+MBcN4fur7YavuGL/0T0Rh8tU4iyXUzt6nIV
	4nlcLef2ic1EZyusgwnK5zdV0daNFu+pgqtmFodvN+5+72y8twytJKhP2nG5QZ9L6Hc4ezmWTwA
	j4A==
X-Google-Smtp-Source: AGHT+IEeA3HoMtx0riBcurUZp19Bisk3YOU2mcitL9911KMtdK5oYFtWJ3cEeUHag98MrRliuC7lKihL3M8=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90a:c7d1:b0:2b6:c70e:d3b6 with SMTP id
 98e67ed59e1d1-2b6cc44fa2fmr2940a91.2.1715299883775; Thu, 09 May 2024 17:11:23
 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:04 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-48-edliaw@google.com>
Subject: [PATCH v4 47/66] selftests/ptp: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_171127_713485_D7D53D1A 
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/ptp/testptp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/ptp/testptp.c b/tools/testing/selftests/ptp/testptp.c
index 011252fe238c..ea3c48b97468 100644
--- a/tools/testing/selftests/ptp/testptp.c
+++ b/tools/testing/selftests/ptp/testptp.c
@@ -4,7 +4,6 @@
  *
  * Copyright (C) 2010 OMICRON electronics GmbH
  */
-#define _GNU_SOURCE
 #define __SANE_USERSPACE_TYPES__        /* For PPC64, to get LL64 types */
 #include <errno.h>
 #include <fcntl.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
