Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EBEC41513
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CWCx0bqIQtwuRJ6ZeIdkhISIbHIxnVIL77JSks9pj48=; b=jvsehY0gvRJ6BezsE/nL2AD2wu
	T3E28lVUIg1bLsUjOQ/EncAcHbYlOJEeJMsa21NG0/flF/LM8LjRklQCPQ3UGpcpB928t7487i0th
	C6IFUF0QhFwI4EcBZluBuqsC0zmWGGRmp8x9cr7MOyPnucWtDK9jPU5jesxTZAukrHK3zZm6tsONi
	t63ypWyg5k58Hkrcrkc+qhAS5NEAJO5OsE40j09OuX9hpBMA4QgXCXv5a9N+UXXaODBchCdqKsyfX
	c0zW7A7x825I1J0jfeBGjbS43bsUfZs/6yY75lAaVNPr0Yw3HhQ8w2hvV90Mj5qqA13MqI1SvjptY
	naFts+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CIl-000000036Ic-0Usq;
	Thu, 09 May 2024 22:31:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zP-00000002cmG-0HLk
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OfT8qWvNcb63HQewAHiwqXaD9aYY1/jM+kGh6QEdnYY=; b=RizVlpDXICH1sWI9PmXmJ2IyDm
	4IRKlZ9rpIqxu/b59P+cOuai2f3j+145lTcqU1sRc3IJ+fi3MYk2ZKlwepX9zjJuM/L6gndHF5jBJ
	ax3u0jbQBTpVc3G+3zBC4sVasT7GH2wUjDo/X7DTp/lhzFgTlty4evRzbdKs0G3sop8Z+varBk3oM
	K1845atZiXPYLFKFiZpcLMksFhPlv6MHDS6ZQwRyP4r0JG0MCg7OO8LVJqS5lypIRagP09OuTWZ1F
	wlgjzkCfZ9whqDWtHXjUo9wcQxBvd0MRsWFXGyc+oO0GfNdX4sULk+y0YzoZeb7og/V1DV630rm1c
	/qgj9HWg==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zI-000000030Da-2kba
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:35 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-61bea0ca5e2so20592917b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715285009; x=1715889809; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OfT8qWvNcb63HQewAHiwqXaD9aYY1/jM+kGh6QEdnYY=;
        b=YXfSrAsi4kVeBhVs9p2binW6S+Mg0KG9W1DtoGpkz14+EKVcCk19SrC8sSggrYnHPx
         epQevd9BmHJdaY3Q0b3TxWOXidBtgG/9jawqF1FqasK2MPpj/sCNBzDpbw63gPPF2X+A
         HaA3v7aDpzE9xNgDJQfQIJf571hs9yJvrC7x1PVATLznedJFvrwab0s9ATKF3sAA7tb1
         EP1qKjDH4roMkXteNCEpcJWxGCsqZjkmVoBWoAEaM0pfydifZPXtQO2bfU8bm507J4p9
         Yj7fyNbQEpehgjAmxAmnje98Zv8MhEGU/Pd4LOffzcA4fhOLxFdv573o+aS1uRbQn+oK
         G0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715285009; x=1715889809;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfT8qWvNcb63HQewAHiwqXaD9aYY1/jM+kGh6QEdnYY=;
        b=NvnL8LBn/RgFp2Ty4Dmkzr9BYVekImFzpbdTEVR52F+MEIaN8YrJsosARYbnG6FkXK
         FJ/n9rfokSAEvuKrAn1c4ykEwHVsAr7DtiNq6Xfd9r9RZoEB2FcpHO6VkNL9SeZc8STS
         n99bz/3g9ZRCd4ujuj6ShBUQzYH3ZFfqWF2V/FtkrGUmawpTnyakWVuq07GFTFjEHKBM
         yAWcKXlCXKlO+dhSZWmnIjlX+hW6z6jF2mS1tptAD5E059pDiggk9sklOG4FHggJ7GGd
         +eP5ZLSmZ5qS2Iw6wkGUA14D7k9pPeiL/wPwIwNbJQ8UbiIDCOjNEQb2lgkOmA+cLtd9
         qQMg==
X-Forwarded-Encrypted: i=1; AJvYcCV7RJ+f3yDu0EAATATns5GWJiuj+wXzFgHBhP1g/scjTwAz/LrESizb1iBwcM9METFnZnDo/SO+mesLC2SMCvnoiqyobOiU7Vu9+lSYnPVI
X-Gm-Message-State: AOJu0Yzm9RpQqNXoEy4E5Z74wgmme2wAQWaoMMKKU8O7vNp6ajiVhJH9
	mYMv8Q4nT5TsgRbWHVUlyr7YdUDr1fBmPltSeN96LDyXnUnAhMzbeEXi/UL3RC3RXufxrc2Yfwf
	BLA==
X-Google-Smtp-Source: AGHT+IHB9tkCXkbQWJCekpHx7CFvQJIi03So2EwcHyZ97laLqO9YTdxhTKI/29nDkVJsDfnAEGuoDne26cQ=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:6d0b:b0:61b:ed85:5d3f with SMTP id
 00721157ae682-622b014b981mr1366387b3.10.1715285009033; Thu, 09 May 2024
 13:03:29 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:47 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-56-edliaw@google.com>
Subject: [PATCH v3 55/68] selftests/safesetid: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210333_912407_A4C90B3C 
X-CRM114-Status: GOOD (  10.33  )
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
 tools/testing/selftests/safesetid/safesetid-test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/safesetid/safesetid-test.c b/tools/testing/selftests/safesetid/safesetid-test.c
index eb9bf0aee951..89b9d83b76f6 100644
--- a/tools/testing/selftests/safesetid/safesetid-test.c
+++ b/tools/testing/selftests/safesetid/safesetid-test.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <errno.h>
 #include <pwd.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
