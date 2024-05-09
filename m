Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03FAC25B7D
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7/x2w7ZRsiipV+feg218d9jNo70+WOxvOPlAiSepV1w=; b=YlbiJECLZ//0rTz+3SbNETRf35
	5UeGI0LNHAlvLTsim1Df/QjPQUVlI9Hjh3ZDpdKgEyFhNFNxbXCs4j2n7/Fegs/cllFGC4NmRV7li
	9oXRo8qKwDRRw44TvTD/bH9UiFQWseulHbZY85kk1T2FCQGWItL/AsH9Frvihjfwkg6sucjBAy7bw
	AzwQCyqDzSimYugJqAYDizs9TNwK2bLYIP2IVpPPsh2H5GEhXIGD/8yiOxfNNTp0ZV3d5gzUFYhfK
	kN+R7Ok7jaI/aSlbCuDVBwCIw+TDYlpiD1ZE1hEalaG9r6mhLXu9GEJLAV9jRHP+/B2rBeUhBZwOn
	re8LyOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CIf-000000036Fc-1kdR;
	Thu, 09 May 2024 22:31:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yg-00000002cFf-3UAl
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=m279s+e6M30hZxl/PZzqmSNhzRgg4yVrloVP9fngHJo=; b=ihpr//u4q9jwn6eFDGbv1AAWKU
	DIP7lNXvMhifgOE+pfzp5bLLdhCJyVkK/xoK84zNANzzt3F0cB41eeS6JeuFqpJC8ngxDuu+t8yOI
	lkU1Jo6s1bDJZpVh2/8OgH3NZbfJPFFlCyigwSowN7vEJVsPMgSdHd82vVE9FnE3TcD/rppqWf6lT
	hqf6xEVxWJO1T0wIlSDokQUgyBBiIoUn4oSoekYR4a4mjkf5LLUaclTZduRN3axRBhXUwXCJu6gvB
	4emp7L4vKqMKY3c8fuHGoRRYpkCHoLm9UCCRtDHaibSm0pHGPV6/8wyJlC6VOXGSjkY2w17AMIMYV
	C2LpTW1g==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yd-00000001Jjx-1d76
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:02:53 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6f49fc7b5e6so1346589b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284962; x=1715889762; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m279s+e6M30hZxl/PZzqmSNhzRgg4yVrloVP9fngHJo=;
        b=YwmjVCbB3MBe7OwN9yCNrtWl5XwFglXwZeNKS2ZsSb1rP5qZ9HEASmElwdllUsnuDm
         +jl/WCAukyrWaa9p8ODQWZQ16Lwm0Of5f3eYYVnHgySlrz7PZyTdT4/BolOTglFlr2/A
         1oHV1GOf+pAmU5tVAVcJzg+4Xqbw83VaACRod+4Gpd37+T7ARpq8HTVkXquCfw2l/ra7
         3f92E4T9krpI9DBr5ju0db8UCirVyT6jB70F96CIekNPzdqcQJ6ZwqKVbiO+uma1nVv1
         o4oIqBwTEb1gguR88wE6HT8dLnYFFqZFcN4re+kjGzH9KBpR2jcF54HUFNLwroFw5RI7
         vmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284962; x=1715889762;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m279s+e6M30hZxl/PZzqmSNhzRgg4yVrloVP9fngHJo=;
        b=OyeqMWjmwglvTs/ep44lnmjPngJ1yAAVwj7VwNI5r70zYJhUMiHFDfjT6h4J4Wph9r
         n8aS314bFvRwRK1tEYchtbFRjDGHE3/T+e4b+dKsadsOz9lVkTJcaa5delzCSys9Gknp
         qVJmABuqa13t/iQq0YKtTdhGu6bR95+mRjz8q0QHMHhFgpj+tD4EiInnV7tAQfFsV2uV
         PIxjxSCPEloBpUNw1xmu6wRO/AM/1luJsh6kQ6WKgb42ognENE1hahIeWstrXJiVNIC4
         JRugfWiNSwDyhkiFM4khBwEFHDrG0jUd6skGl7eTp3uuMFUPSE7XzCKOwDoYU66beWKl
         aQ6A==
X-Forwarded-Encrypted: i=1; AJvYcCXA13wa292NqrgImPnpB5Veh9X5dWopPMKEUvoUt7X5Xj6D5x7zpn8c7brQKDqMlhLsM7cN+r4GXcEahBTsbnvWqIr4tN0Nlm9MawXvHbzi
X-Gm-Message-State: AOJu0YxDEehLs1qWawh5NbRVRzFiWwBTyi+4PLPIB3wOIdkqOzbwAOYh
	+Dpiq150BM0+YMk0Tvg6qd9TxyZWSHPAuHQUlP8mh2ae4QnuAL4web/O1Rw9wY/oSGn0vw+o0PW
	hmg==
X-Google-Smtp-Source: AGHT+IGCr5mZelKS9iX9bRXqnB7kjyhmCMgwx5eyUHoa4Y3/aN3G/xPHARYQx5VNmnnQO5Sez15H5lzxkdg=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:3a0f:b0:6f3:8468:432f with SMTP id
 d2e1a72fcca58-6f4e0373b47mr9098b3a.3.1715284962387; Thu, 09 May 2024 13:02:42
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:31 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-40-edliaw@google.com>
Subject: [PATCH v3 39/68] selftests/nolibc: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Willy Tarreau <w@1wt.eu>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <linux@weissschuh.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Edward Liaw <edliaw@google.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210251_470746_B3EAB60D 
X-CRM114-Status: UNSURE (   7.75  )
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
 tools/testing/selftests/nolibc/nolibc-test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 94bb6e11c16f..a28813f4367f 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -1,6 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-
-#define _GNU_SOURCE
 #define _LARGEFILE64_SOURCE
 
 /* libc-specific include files
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
