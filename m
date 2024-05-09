Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A8CC25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 21:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XM14D2qjn3qa18s1I4SIX+MGms6qebtFajJiJzme4DE=; b=ZU5kJh1or78mtKTYku1SSoCdtp
	56XEefehl0F+EqF7fPwMT7b3r2UqpG6nHIl23MvUmW7vXk+WoMpKw6Ixsf/pDoVRezVXm/o05m/gs
	wkE39jSQ/CehZu0rCr58XWT7MOr0JYU3/BjJYEqIp7qc8W/7/kbkV1SmGx7okhwSCkTEnXDlMuZ8i
	hhqQCMkjH144ZN4mGv90AH+EY1/z0O2mGZ7qfY/1GTqDmI0AEbop0XHgwBzhObw/jgZJlYS4xL2gl
	sqfcCa8tl4kkIvtkldObSr2/LkbC6b5Z8hQXUN85OHZscGDF/eKmoDSJyvV/pcT9G+e+S4BvHOvqz
	K6YMjENQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5B8B-00000002uBl-03V2;
	Thu, 09 May 2024 21:16:47 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xp-00000002bWL-1RBl
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:02:06 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-ddaf2f115f2so1893791276.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284917; x=1715889717; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M28n04MiCB7Rki3XUCV56t9NRfCH7Yl0gF/ySSCW1F0=;
        b=4VWdL7bvql+psnrLAUY5H1GyPfJtlbc122Pg4Ftsf0SJ/3iXFT4+QyMP3xGSSuKw7H
         7JOV3Ej+fsVNWGIMLStNGuxd78ReiTMNt32SCzWkoOxn/1DdKGTfJMzxaKn/PvBp65ZB
         /vF2oJig6qvgP7SosZi0mgcu8i6D+7CiKiTkPVoyeQAvQYgV+eH5mKTOutvk7BcC/8vf
         dZJHShWT8Vvl21P49DrsdoTv1qseRuS7rJhuIbo6a1dQhcy0xq2OdrQa/b94JZdv5aep
         KyqANRnrhVvWDUJ2lU85Wf6DOV5hG0lrW5/6VpSrGprQLoOsHrxqA7uDt6JgGoVG4uPA
         R8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284917; x=1715889717;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M28n04MiCB7Rki3XUCV56t9NRfCH7Yl0gF/ySSCW1F0=;
        b=gvYac1Uw558D7B14s+1wCE+oEo0iKy6CVVmBilQHLiXHsqmKio4RuJxn9aIurW0B0q
         l4Tpw7E7Fnhh8TOkWBpsoEcnqhIcJLWGxEAjAvabZyEzXLgWnx7FTB8IqjXVesMulzV+
         HNXICgs+k+fROGVxMVikVhDT3bNF2hKOvj4ghMeoozEXt2WYiEVqrOjJm/oibMs4K8Nj
         1hZIlOoPSxYIP42FWwdk6NfiTxP4fxYA3vZ/X9tAJVpRewhanDV4YcRexsaR8Hk8z/m7
         W9ND0LjwraBV6aIzLXw9okYo+Y7TWruG6Z1iq+OVy4P2Y/ld10Ff3nGUXaDaV6lUl2ky
         k6Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVk/Ohu6v2540TfG/j4H6Hc37zY4+wRR1hOOmQmgeL9Q4/J6rXhVUrvucxivGZV9tAnm7wWIvLVUvqQVQ7vE2/TadbVLhg4o/kHfCO9AhUE
X-Gm-Message-State: AOJu0YzxIHlF1G8WL9jTIlQrdYtblNkA6z4AW9lxzpruFkWYgsr7J9dE
	JDoSZQvjr8GlA4I16hXVYLRmd9iD/6e3z58uH4Rc9iZKWDyEa0AZtHwwgF8ELgTpXEpxu74vBNz
	z8g==
X-Google-Smtp-Source: AGHT+IHWuDbcMQme6+YKWpzBKBlieTWCJg0j/ENyLXdW3EFA6jYO7wvSVmCsFiuxu9QxPYdg7/f2jHZsKVs=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:20ca:b0:dd9:2d94:cd8a with SMTP id
 3f1490d57ef6-dee4f4f51bamr60630276.9.1715284917151; Thu, 09 May 2024 13:01:57
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:17 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-26-edliaw@google.com>
Subject: [PATCH v3 25/68] selftests/ipc: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Edward Liaw <edliaw@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130201_722521_9BF09BCD 
X-CRM114-Status: GOOD (  10.28  )
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
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/ipc/msgque.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/ipc/msgque.c b/tools/testing/selftests/ipc/msgque.c
index c75ea4094870..45aba6aa8e1d 100644
--- a/tools/testing/selftests/ipc/msgque.c
+++ b/tools/testing/selftests/ipc/msgque.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
