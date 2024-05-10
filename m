Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17895C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Pm8Jct4uWtcWdoUj2kS5Rhng6GMOqdeVLfI/NFSkBu0=; b=awZYM7m4qYjyXBFMvRFpYT17g/
	bg8AzvEdvs/rxeCtaQn2tCQLQKPkbU/pMqoP0kRPgRqosVXyGmxAeanu+ZJuLdT7krh5ATZIyP9/w
	Jnui6j8GSN61HbbVmkxadSW0MN+fExVfWKM316Mzv09CqJb8bHZHVPJa3hR3VReYe2biVBoT0h8lK
	jJ45qQZ9UkZhHQtjUK5XieWCuhHuQGN+O7Fpc1AjFn5JP25hnaX0aZIXElu5WjeWtYkvFfRzl8noW
	jVSanFpf2SSum+XkBj53570hYXgp1C9vvnRWolLxZBLmibClV1O9Uwrof/m/vF/GH6m4I389o2t2x
	fR4V4XEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Esm-00000003akG-3YrQ;
	Fri, 10 May 2024 01:17:08 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DpU-00000003Mic-12fu
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:09:50 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6ece5eeb7c0so1242867b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299776; x=1715904576; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rki1zNwlC4Q2li/JAqXiFWxY+6JbB/VfdRW8esf0LTc=;
        b=IsWh8RZ7aCwNZFm+WBMQN0QTDCJJEl4k4kJGt+gR3rOryTdkVx9nqX0xfZDrG/d55f
         aFWsCb6UkK9w4AJi3gy3YRm0tRscbmGCYttDSmk/HY6SksdlrLjV42Ye//+arjjsw4QF
         4DWCg/PMML+CoZQxWj7QbH8Fqn1hfuXNVK/pSJG8ru5oeNNYsPg5c1Y3tAJfcaokzBwA
         9QuLajeRPaIAJiF0meMl/q1vXx9u/97Wb3lZP4dTJSoaRBeVvZUGKYUhjX3okcLJGc1m
         R+cE03ouPnjg5VGQegs07/akGyMSxT9xmzohUf2IxNGRDg4M4v8MDE63ELeK57J/DRHw
         sjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299776; x=1715904576;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rki1zNwlC4Q2li/JAqXiFWxY+6JbB/VfdRW8esf0LTc=;
        b=hEXHyouNMWBxYU+gCcJNzUYJENxuqLyiuZydxnWsr7etwsIKFjGWoB9va/84au4W0n
         xYtq5Ltm0xnl5TijFeUkR2WscatgZtqW4GzvuwM04Iky2MqcxlP5Sbn7IKT02g+ayHpn
         PilvCyXyHrTpR0chjuNk6BAvj4Ave3ew5BorsOHflZyDzBF0s5JXPYmg8GX9/xFt2cMQ
         7FlyQVB1mCWRegV+YHZo8g98php+f12+qNSJUQhSvA81lnI575ir5qndcCkDrF4kVRcI
         dcMyVq7i1FMBhjxlz2cWIYd7G0gHw4KEX+56+PF7vrtWb0BMecdj8ArrsV3ZCGIPotad
         RcfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXj64KrYcVhqcaXhN0OFNCd8iVWppST+ti5hwafwv2QyKdccvS6OwLFJfgwNtD92evVt/6FDRqeOjDQ3WVn5ej8rVQb8bVe2E0U+Hoyi2+
X-Gm-Message-State: AOJu0YyOf9JYxjUfPVRijdEYCMzeSHVqI9UH1r6JM7z1MCSJaY81y6IU
	MfoOvYx/awiIZ4pJbrOvH32WNsMP1svJSCbX16RkCaPFiIzq0+zOv2x/5+ezbJ1o9Vt6aMnG2GS
	itw==
X-Google-Smtp-Source: AGHT+IEEWJM7ftE9Jo7Seni08HtCRrr3H8vKgAka6puRcK7n9yq+c0cor9pTiIkjlNkR1yBLMg0zxAAn6XY=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:2da6:b0:6f4:47dd:5f41 with SMTP id
 d2e1a72fcca58-6f4e040fefamr39256b3a.6.1715299776407; Thu, 09 May 2024
 17:09:36 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:27 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-11-edliaw@google.com>
Subject: [PATCH v4 10/66] selftests/core: Drop define _GNU_SOURCE
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
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_170940_617629_DF6D7962 
X-CRM114-Status: UNSURE (   8.82  )
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
 tools/testing/selftests/core/close_range_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/core/close_range_test.c b/tools/testing/selftests/core/close_range_test.c
index c59e4adb905d..1c2902bcc913 100644
--- a/tools/testing/selftests/core/close_range_test.c
+++ b/tools/testing/selftests/core/close_range_test.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <linux/kernel.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
