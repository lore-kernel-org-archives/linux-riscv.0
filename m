Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483FFC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ct29pglWROvRJXt+hW/DTDDCyJDt5SJYlXBxac2ES2Q=; b=pKF9QEMDo2GZqOjC7PLM1jSRS8
	Gbp+xAtS8PdQ5oj1gTBim/N7bGBf3n8YmPIYNmoiETwCH/j0Ywusl/pYFJLRYtbvfwKb4XnRImMX0
	nwaNkOC1DmC6fkFYFv1XnsQ2BSU7Ejz2YawIugUPUByKAElWkBd1GXlu5i24i1iG0z5zjVUsycWZD
	Mg5wP02aLJtLkwGJDEfqjA9tLEk0pxYhQEo5nT2BE9riQS+knk7sO7pKvHuqXK/idB4nZsbS9W+mk
	BSS+qsSw16PTdhdyHpijUzCPuMoI1VDLp94lAjIwJ7O+MjWFyYzfjPVnJ1UVb1knoAmIXvFNBR4xI
	6GE/W5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5A18-00000002dzI-0KOT;
	Thu, 09 May 2024 20:05:26 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59z4-00000002cSI-1lZo
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:24 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6f43b7b8d16so933309b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284994; x=1715889794; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7kj5kZHOgeTEFE9rl1cg+M+RfV2lbnnrAzPZA+2Lqy4=;
        b=K/xG4wTSGi61S4wZyGxuI1XRg3zkh6caj6kynVYKKJ4HED+976nY0ljgbpGFvK/MBf
         vw21+sAWwB4M4AH6LDgyYXMkoguAnLO1Lhq1HwFUXZXnByAMskVvjI3lfin+EnBu338g
         r/t2AyeYXPW2wPC01vmJC2nO8hLcBpopk+23gzWqm39EKIs7xqWyEwvIn/SHgc1dLnM3
         KZd75UAidwxdRfK5nfCdsH3s9Y78rNijKEAWV4NaTzOE3g6bTGtgkAkeikN34uuFj+Lr
         lUwWlSn1JGG/S6SPdKKfSKO7+jbiM3xk+PdliUX8kR4tKliyDfYHmovEzCTJsmKLgeV1
         Ur9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284994; x=1715889794;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7kj5kZHOgeTEFE9rl1cg+M+RfV2lbnnrAzPZA+2Lqy4=;
        b=Ymzrp97tpmhxKbDghviA8A/kq2Va0y0YJU51ZzUBUw/LXLDZ5u/JbzOOe1ZQ3fAzMa
         nzJnNMMfBaRXqZglLzo8+B3/1YVQ4p5XaYKcKmSq6gO493jpBNQNkLBxOfXP3dMAYxVt
         k9uWKOgf3aa69DEzm8r6B1IFQ8EKqAc7+44qTJkG+ClkRthk4Xc6Pkg72Seac7q7To2A
         AfwqJA/Y2xBKuIRCyuQ7af8CDUvRSGHKT/6Sr+b24+nhr/kXl/pc+9QT3gprEg+9fmM4
         R3rgCrP9DJhRLSfvNOtpXhl/sRfAKbhIvIDSZkzpAkq/iY8DP5i+JzV/PIzjbq/3SDG8
         /tHg==
X-Forwarded-Encrypted: i=1; AJvYcCWDYbpJM6qZMsKpmN+pDzHE6Sh5iYLrXSpbkzNJVhakKBbWesTmjqkaBxweE/17zf5eqSuMPkOwQYlrZPrIvcn0kwlBDVRAKS9KwWIsyQAe
X-Gm-Message-State: AOJu0YwTlxRinhuCp+/pO2WxwpniosEet86eFJVUMZpeeuW/obG2W8Dw
	VFox/exaPscrnwnnHmeBAGeLT6c9m3VI0KNdl6rTz/Dd9ChJWFvMHp57xHfrNUVGhq7CeemckPv
	EDA==
X-Google-Smtp-Source: AGHT+IHAGY8ymc83X4QYeJVn87tCufTNrw9Kmu80cCJPzOsgO8hVIGuL67CoY+OKX3uI1QLyaTTUJozyG14=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:982:b0:6ea:bdbc:6b5 with SMTP id
 d2e1a72fcca58-6f4e029c2b1mr1517b3a.1.1715284993800; Thu, 09 May 2024 13:03:13
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:41 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-50-edliaw@google.com>
Subject: [PATCH v3 49/68] selftests/ptp: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130318_674547_627896AD 
X-CRM114-Status: GOOD (  10.52  )
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
