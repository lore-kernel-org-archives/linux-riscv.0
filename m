Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8693C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 21:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FS5MiRnBX9cx/5kred+AbfKV6QsyO//H34igFWpdOmc=; b=GWVibg75MlFkmmCHE2z47WmkzG
	gUbRZMNrHA+n9jljDu6fHP010WAOec+0SpQ7M+OvhDfQ+9W93mltAraH71Y5all48BlRPu5EkkAks
	tx1LCUdfSJM9HuXMtDxCapd8aZaBZ34f1HlyEkdTuEOCWuVuHzKDH85EUgc7CXxU0GryAROfkEScf
	BFaDI9Hpkacuex/mN4IPUUtIQBmG3+v6KdXVH/CnkWgS9Fn1mLVJEu5vrY5v/v8y1uFTKkzjUCFXG
	2jmhqNka0veZ6sMRLXGfb57JaP8NvWuXrom6GX6RXLjJB6RaugozP4LxstJlyQW83zjdYfSrixFjQ
	7g2VR4FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5B8S-00000002uPE-25kN;
	Thu, 09 May 2024 21:17:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yd-00000002cC8-11Xo
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ea0S0oR7atF2Lg5jk6+sVnhZ8gGTM0V6dmG3kMF6TeI=; b=FPITxy4dQBzIjKufwOJJkk3V+i
	MfAjkS2FFVj400r1zVd+lxkG4SLFx42Rga8x9GPtcPInZrxBYDKnGJrQKBhuVKKvifiWyKTv2/hye
	4YeLgrBt6wMiOyA3XpHYcgbnsZ9I5g00HzZuShzrp7elGADPc204aRzKcXFEazh1YnM+g9QpmBxxz
	ZP71e9hFwcbJNn8tDqdy6oWQEIV7HhTM5QSy/LAii/um/qLIgZKZrMQqAWaC8/yKFFwYtmwux7Kdv
	gI8sCj8PJHbt6yKM0n2EAXAa6eYrjKevnT6GWABKMA+QsEkLpK8G+oxIgK7OFZF+MrDL2AjFOnscc
	DmQ+OMIA==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yO-00000002zz6-2bgz
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:02:43 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61bef0accddso25570077b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284933; x=1715889733; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ea0S0oR7atF2Lg5jk6+sVnhZ8gGTM0V6dmG3kMF6TeI=;
        b=R1UukVtcbK+PRK7uWlSs01vLeA6HCqYPcnp4DAg3rAtjZjM8UJ4VaCCIcHL559OeUw
         5X8QRZGmKg7LJfThV5UAy2qjI2Sh6K8I2UqtXV4YprdBXJn4NXfA2daFbGhQGWK/FqSc
         u7s61yIxt0uiWQ2svRB7OSi2+JNilR7gfrJTTl3lb6hpJNuMQAkCaVNei+1zxjOLlAjM
         bztB2UPlujx+samkPhI9686ZRx43wJ6tf39mk1H6b2/VDY/rGngHd+8S3KmFuoDQmxdm
         n3skO6DHnGuHvMgcs43mwNV4VAM0/JrXSg3OUPA06v2w8MJMiTMLlGcMfo8VPMhUheni
         qK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284933; x=1715889733;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ea0S0oR7atF2Lg5jk6+sVnhZ8gGTM0V6dmG3kMF6TeI=;
        b=VbVswotmNOS1SP3tFHNaFIrXKi2qHAMAw5tYD+euIeeRMAajBXchEx78fOonGlB2Fg
         j8ZVZfr+iK33InU9fLoxVUaqoDnjN5oFJIbIFa7fRXOzmnt0PXZyG5HmKyedh9Y6Rqxf
         Xi6Nxe7fJnO8vM5Mns0LWTF2rUl1ZAaIkupGYYNvh9n7TUxT/iCz8gvvoYc3La2WgIFS
         tW+jk224/FXg77vKuW7tW1Orlah9hFUGQVqRZgDKLe3j06UQQFurIS+9h3ameod21Wdy
         CcLHI5peTlEH8shJolaXWdu7vi0Dkw29QUxgtxNMlEN1DlejSuUnT6U06ehqTTUTaT2q
         flOg==
X-Forwarded-Encrypted: i=1; AJvYcCVMpszT2/u+7Lq2rkRLKST4Vw1NLGliTG29DAcnWWLDhW/RnwEekh5tXXtViNQeAStE4qL5bz+Io/Ku1jZdPXRDrjeIFs/F3e5WJI3QIOh8
X-Gm-Message-State: AOJu0Yz3UUQxYcCner4B9wC4knOvg1eUd4KzyyxuK4JOttfg0sntOd9E
	sN94Y/P3wxjNiS2HdX/QqER/rNQkydRalXAQQfR9IBndoX3trDZU+xKtpkleufrhxkNebYqRJU9
	wuw==
X-Google-Smtp-Source: AGHT+IF/jnDS4ymNWQMUF/oWdD6iqbobUDLDZUHVjJQIP+SRjrwW5c29IOEMwIEB1XpBJKq7KUUsEHKahpI=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:1002:b0:de5:9f2c:c17c with SMTP id
 3f1490d57ef6-dee4f37bbfbmr149190276.9.1715284933545; Thu, 09 May 2024
 13:02:13 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:23 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-32-edliaw@google.com>
Subject: [PATCH v3 31/68] selftests/mincore: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Edward Liaw <edliaw@google.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210237_892163_2F3F8F82 
X-CRM114-Status: UNSURE (   9.09  )
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

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/mincore/mincore_selftest.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/testing/selftests/mincore/mincore_selftest.c b/tools/testing/selftests/mincore/mincore_selftest.c
index e949a43a6145..e12398366523 100644
--- a/tools/testing/selftests/mincore/mincore_selftest.c
+++ b/tools/testing/selftests/mincore/mincore_selftest.c
@@ -4,9 +4,6 @@
  *
  * Copyright (C) 2020 Collabora, Ltd.
  */
-
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <errno.h>
 #include <unistd.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
