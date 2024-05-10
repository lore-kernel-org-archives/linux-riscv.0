Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CD5C25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0gR7xCdPnWm9tYFC388Ydwn32Z2sksgCovjX3vO9pZ4=; b=IK1NhvJHkGbF2kP8shwcYYtuOf
	qI+ZlU0rrYbLufCt7KZy25sCx2wfrEhxsx7DhGddGST+CZkoezo1Um6nDRfygpP0EcjIYxgWrIUOO
	mwxka1itfIIM8seF4ZXC+Mw0vXjif5kq/2oJbnT1id529v6p06k1IZNvSaMKQ3SMSzhedAAWVk6d+
	P4yNTeRaP3ocKSNup63mweIhZhoHwTWYX/rLx2BiVrfwAxbiu66xp3PEFW+Yz3XoJXsz/WVq7g+NK
	Vw23rcd1vVFUTfcimrtxBW+9/IEXMsMoi1OiZq7XCg62KHn/HLeHi6j1qq+NQYADN2sRjJIiHiUFI
	jJVF5RRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DsE-00000003Otj-2RdU;
	Fri, 10 May 2024 00:12:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrO-00000003OIH-3OqZ
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LuB3m194wkKvY0eVyf5M25YoLPjrODu7ClV5j+qOpls=; b=BzFJRBtLEaI+S8BrglA3uPPkNJ
	1eKQeg0SSWWFIMrlxeQyzqsw44e120eE95nWCgEIuqoR6EXZCF8Nbzw8h21GI0wXFyJjx/VrhjpwX
	DyVDJkwLyR0lYT+/9HNGfszmeqovZmV00zdjKzkKj0+qSRQ8mWqvkhvLv8I2X7Krddq9WEd30iSms
	I2rgHoqH8jLw0uQ9EkR0zfZa2QA55VD05uU+kxSUKpdra4ynSlY8eQAhZR0NJkBS9X6TtQnkN1jYJ
	8IuF0mz8d6dWMx6XBQSNi7ErpJUt7mcJAPFL/gikEnkcWzD6/gnTrumcFqyj0tDEl/zGLKzx2aoAO
	fAZQ1JDw==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrJ-00000001mUh-0DU5
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:36 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6ee128aa957so1490012b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299889; x=1715904689; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LuB3m194wkKvY0eVyf5M25YoLPjrODu7ClV5j+qOpls=;
        b=KomxxZKF2xCzslZTnktg5DS6AbImkw4U7d5fAekEZ38hjavzoRnCCQz/iMUmHtAKXF
         3ljmFe0hcWTAN967BxB++MkEhRuPoRy9yU0AtsD+8MXoY8Q1Pf85wfe9OkwiQsoE9cSF
         pIVXJZCq63gD1VW1ZWAMev8iurEQKSgI/AP4lOEdr8k5G+R6soSsUz8GEg8RFTALaPGE
         dTw2wb/8CgzbUDTzbg3GQS3T1vxrwi0LDyNsSaB5LHpVG7YnUkw1kMA9csgpMUEpEkEc
         QtCJABSjasn+2rGqh75fjQwS5/5xHv4/KT/iisxokxcMU6VXOdx9GbWsJOmSEZOgBVVe
         4AaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299889; x=1715904689;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LuB3m194wkKvY0eVyf5M25YoLPjrODu7ClV5j+qOpls=;
        b=FCKddMpe8vG6UZal1GYsVrZD/kjwqSNn6CCholsZnu0J/o6wTWPUuB5HYhT2DGr3xX
         vRTo/MvFlNx6d3p29S2qp3bNTdh/Qv9/iXHIo/W31CpNkzE0/bFx9ymWY5+2lX6HSCVx
         A06N6ZIk1o7TkXq9/+dDTx6u2Z6U0+djhSpnfw54+5tNRuNn3HcmyYVtrNwnM6PC9NC6
         gT/auxQLXl2IPNZbpExWlrXgP6JzRYKOTabWsv4JwqfjAVX5dI+UG8I3tv5JlE6zQ5eE
         S9xXTj8NZrqWE7FmZLneU0cfQ06UyctTiznv/z0pLMtYw8vqfklet9eZAQq/vKXV6FDi
         jXog==
X-Forwarded-Encrypted: i=1; AJvYcCVmabIHFwG2fzQjExLmy4KMfbJXY0JWDPlKv2Y6o9SuoQmLgsDJj9Eb53Zblc1b5FHdoA9SzvLYQchXwipqOhPjPMViXMakhGcNyAqSniAw
X-Gm-Message-State: AOJu0YwzUPzMB8ybqQcRRITKESv5eWD99R4l5gx34S5AssUjDvBhPjbN
	BvDn9cpAWyET5LC0pB+rmbvq9+149AzAo1NqPjFqeocYuyMe1urPiOAvqijlpi1Y4unNwMwKJD6
	PXg==
X-Google-Smtp-Source: AGHT+IEAPDmiCGGPRhY6JBRoUT6dlR+CkZjrxhOj+xsSstNk+8V5LsggLR8ug+7H1pKBdhGr0v4AK8MG9gc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:17a0:b0:6ec:ee42:b143 with SMTP id
 d2e1a72fcca58-6f4e02ad1f1mr31327b3a.2.1715299888557; Thu, 09 May 2024
 17:11:28 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:06 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-50-edliaw@google.com>
Subject: [PATCH v4 49/66] selftests/riscv: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240510_011133_129761_14FB3599 
X-CRM114-Status: UNSURE (   9.36  )
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
