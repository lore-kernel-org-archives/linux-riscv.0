Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A7FC41513
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6A2rkJUXdD9eXqQ+G2Fze021l7v8to31SUiwq20gpTA=; b=M7MhHkmULn3E0mPZ2ZMxSs/+fc
	gd6C0Bm1fUfSbtN9NR79go4mTbWNYrNrHYo1o4I993+4siKROaXJJ5LD+sewEe/gX1ETt3L9/XTUz
	zYFsgbAEvieXB4bZUxPj1mQt1gnLQ7j5+lyzye8RcAd3F34zr2NyA/JoF/Sw528Oz8FIxYErAum2F
	lCpXF1IrB7YcfwZ3nNasoCFq+ngPUvv4ow7op6400pKte1i+j4C5gqcLllMVIG53VsDawtU4JPrnQ
	h0H9Ct2OsGhHcpV+r+bvj7Oh9V+Oka0gVSV9rELrbSU72gaboX2ZdkII7mZo2GRGOtOq4CLh9m2+8
	gi5OEMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Eso-00000003akU-13zo;
	Fri, 10 May 2024 01:17:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dpn-00000003Mz3-3Sph
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/pfiCQCOCpeS3b+P79XSlfM275G98aKUlpvA+FpfZ7E=; b=C0amllC40G5cJeNL8VqWOgMmIV
	Rxk6+bEgtRrmrM3oCn86MNOTKIDSuwT0ubQ6dr51tOvvQHg3Bh+67XoS/OgRqwIM43gYI78tt/B8w
	Y7O9Np+8OW0vM4rvbU1zIXNC0dzW9AiJPWIHyXX/GNhzzFPZoBtBjxnMS+xqN5J20lCnPbDb0ZPHm
	yIGHJdzxUVCh7B/4ivFsdR7uoL1sxffOh9fU7vh7JnuLlCz8jjukYBN81GBeL0JFgP6VxHg8SF7J+
	p+cJwK8WCy9MRFvY7JQ8Reg1eGT22RY4gdvEmFro/rHEkjcJx5bNTiDSSoG15TD7bw9zyOeINJpWC
	Ftfj1llg==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DpZ-000000035wH-3V4A
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:09:55 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6f47c380709so1117983b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299779; x=1715904579; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/pfiCQCOCpeS3b+P79XSlfM275G98aKUlpvA+FpfZ7E=;
        b=qbdAyVEFzMc690FoNCsQ/18w5e1jjoJV9xDqgz1mXTYkijtt3LaCu+U7JAa8czcLCK
         3qWLkST5h1rO52WW3hVcnojZMjYgq66anIRTJ8PWKEeHZ0I4rVgLKeyYcvRo9F77HTtJ
         mxpY1wl77p7VTn0HyWhKTDZ3Pr+IYXMV4l/n0BPSXc4lkpPrpKO+jBtv1lIycXMIxbn9
         quNgaPwaHvf5QdMVBaSVoAIo/obWwlrxVRWcSdjQ95heU0ekgNLSdDKmdny+dMjkhDVL
         Z/ZOpuBW+yJeeRfMlkRzac1NpdLKuUz9G8yAcdSfkpL8F7N6whJ5FpQjeFKsoWTwM0uv
         L2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299779; x=1715904579;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/pfiCQCOCpeS3b+P79XSlfM275G98aKUlpvA+FpfZ7E=;
        b=qIKeJK6dj+UjywS/jksvibRXAp39FbWFu8GjmI84DItYIU3u9dWtzDEBf0fJ0RS+rs
         PzVyOarRc00zxCqwz6IrtUEcYcT0moZdDzx88alXsQSTXhH+M+6r3OGTWMu0nGghRkVw
         cgPVm6gOHRYa8zTd6FXsu/5wMXSwtW/y+DY+bcfL8XpLZ3XQAhBsxv2BD3lPYnp/TLT9
         Tb8zOOf7Cu16xaXENvY7NjeA+1Smmqgn2k+w+y54s6Ffkz1tHlNgFiu6Bx8iDxzI2ylC
         S0HXngfALbX13nNDX5aLn8kpoYM32ihiBa+Xw7G+N8wugCNbRlhSoxoRvxR8YmNQTFOG
         Kkhw==
X-Forwarded-Encrypted: i=1; AJvYcCXN4RYWjCe3tmq5cjRiUquXzSVYPjut3Az+3tLGtt4wsosTaz7CG5uLOP2R22rpCQ/oH3w1BbYiNlxelCQ/g/xBzvOnKEPl6viZg77877T1
X-Gm-Message-State: AOJu0YxzAv4LczE8xJAzdURwbWP+f4xf/6DdSX5QPYeiTLdi7LLRIMJ6
	4pbE/MwCZpVjcbBzUjJTKnpTMgHLmpo3khLjD3bzec9fn/WSY1zxPaFu/DY0L1jy3OXwUIUcpep
	kFQ==
X-Google-Smtp-Source: AGHT+IHa1F5rhkXxvj9b2QgJYJivMxzP9dzNJAuDLYs3QTWopUFJ10s7HO1AbC/fEg0FqzMYeA/jrLgYEm4=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:2da8:b0:6f3:ea4b:d232 with SMTP id
 d2e1a72fcca58-6f4e01b953cmr21075b3a.0.1715299778653; Thu, 09 May 2024
 17:09:38 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:28 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-12-edliaw@google.com>
Subject: [PATCH v4 11/66] selftests/damon: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	SeongJae Park <sj@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, damon@lists.linux.dev, 
	linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_010948_297276_30E6DCAC 
X-CRM114-Status: UNSURE (   9.06  )
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

Reviewed-by: SeongJae Park <sj@kernel.org>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c     | 2 --
 .../damon/debugfs_target_ids_read_before_terminate_race.c       | 1 -
 2 files changed, 3 deletions(-)

diff --git a/tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c b/tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c
index 0cc2eef7d142..3f0dd30f61ef 100644
--- a/tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c
+++ b/tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c
@@ -3,8 +3,6 @@
  * Author: SeongJae Park <sj@kernel.org>
  */
 
-#define _GNU_SOURCE
-
 #include <fcntl.h>
 #include <stdbool.h>
 #include <stdint.h>
diff --git a/tools/testing/selftests/damon/debugfs_target_ids_read_before_terminate_race.c b/tools/testing/selftests/damon/debugfs_target_ids_read_before_terminate_race.c
index b06f52a8ce2d..611396076420 100644
--- a/tools/testing/selftests/damon/debugfs_target_ids_read_before_terminate_race.c
+++ b/tools/testing/selftests/damon/debugfs_target_ids_read_before_terminate_race.c
@@ -2,7 +2,6 @@
 /*
  * Author: SeongJae Park <sj@kernel.org>
  */
-#define _GNU_SOURCE
 
 #include <fcntl.h>
 #include <stdbool.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
