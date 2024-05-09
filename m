Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A438AC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+B48bLXmFFMkzzHixhx7bAiopoMYa59nVY6RT8sNjvI=; b=dacJGXeBHH9GbrhBniOFARERK+
	D1QvPuEu8vuFXWkIrd2m3UNuz3bDxR436VKPuXzpbWWjaQsowCoIJoC4scG2HOh68PcQRWzOK+VRU
	CNU1uXSmW2OifBCJ1scx1mJQQIZfFBtciqivwdzpvvOv8fwx7B4a9ADZ0Jl64b/2JVsy59J+cZMfu
	Ur0j7gL0kV3NHzVZAootuM8/dGiEM0smPJxOEfq+Lhn/p+n2jjIbGS1u8+jpGDO2hu/ITHE4eUunB
	xcrmGtQxwQRNXg3yir3I0CJysEPaaz7L0/t4LULfWT/mIyQF59y2o7FEGulUh5OXSOcHVw+yn09zb
	VFFXYwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59za-00000002cvD-18uD;
	Thu, 09 May 2024 20:03:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yh-00000002cFv-1LNm
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O/ROtSes3ZQb3WG9zfhdXtPEPHl3PoGiMttA81TOGVo=; b=cMBgbz+0ecyPKn342IMA9qn/6Y
	5h1ZqJubv/5d2jjycD8PC/y2Iu9iiySkvJ9wDJeECg3eUivX/wqLUclFrTWF6dk+F10Bqs+GN1T3w
	ojvg576f4C4GA9YUU+uHztza8p2IvvQkXbIWf1DNWpMljA0CMmOmzTAK+GUHKikuNFU4g6OO9WL/O
	HErHiWl+Wd1PA++IMxmgq5k3qQcPcqxFMcVHYGGe4pG6gam/QcU55Kdpd4oDmN2fWRYeMJGrJnyFR
	oOxqnhUjuVe9eL3mgGu0KHZk9pUIK+dmqAK6tll0s9lnEJaorpAOTeIVTG9wD9/mxk0mCC8beMXRf
	B+SzD9hQ==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yd-00000001Jjw-1rlq
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:02:54 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1e604136b6dso8224045ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284965; x=1715889765; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O/ROtSes3ZQb3WG9zfhdXtPEPHl3PoGiMttA81TOGVo=;
        b=Xb5bzz0LyCNcGjThastcj3cSIh4V0vS/9PM5+pHKNh+aWCzQUnPuznzdpoISbdsySo
         Pnst4KisdRjGi1JaRtMOayYhSii+G0iaAZbbDVJOaKvUnkv8dHXmxM9RA/FV2Wxt0owU
         JwWd7/OkkqXc2P+VpV4kzu0Bz2DXVR4AAERBmH+j7tTaJmn67qLwKoAQZeEIKY2SOFlU
         HKqTwTp9as/NL1iI0ZTh9QDYZRQqv5jZpC6ChFXSCTZ52MAXfOCxzeYwQqxgDTlvuSh6
         EK83yBISYiT8iuibud4wH8nfa329Qo5iMDxEgFZyBLgRdyGoWT2iXZMlGzClH1vaaboC
         3YwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284965; x=1715889765;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/ROtSes3ZQb3WG9zfhdXtPEPHl3PoGiMttA81TOGVo=;
        b=qS+C5Hiv7XRnuJUp8Gtsfs+WFGWacUaYcJuOjB5ryCrgsXo4lYzXv5LOhiSdSCMCY5
         EEOCuR7RymuAMr47J3o4Xr2Obh6lCwdqLwHYlY4byDX953HUJq5xTS6qJTny0h/Pa8pd
         0WOmuTLUueFPgwR+iBOFG4IpUN0H5qLmP5WtMjk66mLJvicASJY7q1EieW3q/umwa6ns
         jF0+cBMPhTPLQDHe29ocE+4IjkANZFW5E5MhTfzZmzKMkLufyyHmF2W5UXs6Mj3ICuu3
         JUPoTkC7K4CvGDVbS1yssXk3P/TByxpHVHp74waxT/ZMJqx1taAeHOkM8Xb5PVoQxjj1
         U3Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVLGkXRmaOOA+e8eqMZ39hTCmri0DLmoUNG4/5ZAArDu+LxUCW57s892+PZmGtajzI9LpfUEZl9/80qo8usmYEzEUzKnwjKU0cmsjVv23Wq
X-Gm-Message-State: AOJu0Yyf0UWSMwTgnoXezSzN1A14/qFzedwkI4vJC0cz4lKaE9/j8+sI
	C6G5Un+YJqRIseyGjD6yl4ibzOokIHtFYdMu/+qZ32vffeXlUjiqqeNnffucU1tdYcjgkXBV6Sv
	HNA==
X-Google-Smtp-Source: AGHT+IGvJuQrQiMk9Le6lHJjBtL89ErJtLYzOJrcQMdwjm9MuNs1OLxjtGfyc0HVY5s6lkIGlnPJdYKFNqo=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:f54b:b0:1e4:a76f:6da1 with SMTP id
 d9443c01a7336-1ef43f522edmr136425ad.12.1715284964895; Thu, 09 May 2024
 13:02:44 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:32 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-41-edliaw@google.com>
Subject: [PATCH v3 40/68] selftests/nsfs: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_210251_515464_E5B27A3F 
X-CRM114-Status: UNSURE (   8.52  )
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
 tools/testing/selftests/nsfs/owner.c | 1 -
 tools/testing/selftests/nsfs/pidns.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/tools/testing/selftests/nsfs/owner.c b/tools/testing/selftests/nsfs/owner.c
index 96a976c74550..975834ef42aa 100644
--- a/tools/testing/selftests/nsfs/owner.c
+++ b/tools/testing/selftests/nsfs/owner.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <sched.h>
 #include <unistd.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/nsfs/pidns.c b/tools/testing/selftests/nsfs/pidns.c
index e3c772c6a7c7..9136fcaf3f40 100644
--- a/tools/testing/selftests/nsfs/pidns.c
+++ b/tools/testing/selftests/nsfs/pidns.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <sched.h>
 #include <unistd.h>
 #include <stdio.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
