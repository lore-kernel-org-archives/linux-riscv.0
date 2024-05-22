Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97464C41513
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OLCHTml9LNovE2Ak9bq/DnRkoFBZl/rET80GMarewWw=; b=lkPy+M18JhfXnygFpd6v8kXY55
	Iw0MKEaqT5/yIPASIoR7eEDVegYZ9HZ6XVe3e81gN6Qt+PdfUp7TdZQmk49TikyCJ0yhgMY5Hekm2
	Js3X+ioFJOO4uBZddsOm0JQjGkMy5FdesIyTPiU0vvyjuUTxaPEt26s8e5eyKqwL4XizMt4gllme/
	7uBxs5TZnbTqzGrw4oF+i87M+4l2mcHcFLwstVdnKIWiGt00YbBzwTYLnywhLO+OxHDgEQhWer6zs
	cFyJ5C/15El9LmyYaIHSoWYhWELL736lipclyHAQa0u59ltNExSmhsLg5M+de2FQm7Weyi6aijaj0
	9KmzDcDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bWj-00000001jWo-0GOW;
	Wed, 22 May 2024 02:16:25 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMc-00000001UW3-0kCz
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:09 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1ed941c63b3so135437855ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339712; x=1716944512; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8sLKR2gMdZkVeKpBpgxiG+z3Q3TQVVoa/qct09zlNg=;
        b=4QSGJSQ7SDWHpk1FHWWKAPWWzb3mUI48FA6xAnlRkCCTS2z0Aq4L14ZNUnCd7X+1HV
         qdzuDJtX8qhL5Twa3MFWwaSNetHbt5V63wIs1NdfkK4AhRfy9a3CQBfieUV3nHWtaa3d
         +YOhfh8e0P78mjtES5wfjpj4cblTAbKVg73HwF7/kdUYZYjRO/MEHpy687EsMD68rWM9
         H/StUEHhuvWXTjl25hHySrVca8IRtwCPzGxJAbz0ddw0YT1vuoScTFT4n4Af6vgo17mD
         uWarjM67JqfMA4YFIUGRmmdXzYldvyUBYCSVweNIyvuD4buS2tiAR50ZaZvE2jaBgKDz
         qSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339712; x=1716944512;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8sLKR2gMdZkVeKpBpgxiG+z3Q3TQVVoa/qct09zlNg=;
        b=EdF7bE5oLDCXAKL90DLfjcYNmv0MNCLkfrWy4iWb62z/J5Cnu9vQYSTc2oAleCcNp+
         xlEE+n1Zvi0g+cf2Q1xAZ+M+GRv4aic1PN8MKWVuza/OYBTlQaJlfG8sGGBiLfvmezik
         qE0Wb1V6BYIAH/0BqD7z2pam2jLDydHyWTNSQDiSwqoPtO7ml1lZ9lm7cvYCIFdVeMoL
         RY8y05OkHCJQc9f6wSPlDgJXNvWW42j1hn7gGHILO2/74n1IPaBFuEvMuJzTp8/wN9sa
         eeQEk0WILE/CWjsYwXG8j05kZHBk0loSVWmCeqenABuILFJugNHNPYsP1PBmc8mw2wrt
         7SKg==
X-Forwarded-Encrypted: i=1; AJvYcCUixrTWzfBmqwJNEUnl3gB3vT44vexECBCGXCaEgayNTwvpLlepgdif+8gYqQUzEJrjaAeAMeBW6PkiC6oSjB/55GF/bNKdlvAYyb380Som
X-Gm-Message-State: AOJu0YzwChAWF71B9pNkDQL3FT8r+DJi3fWwaJ+sltfeGuGdWA3fGfPd
	gqbjHQ6qctLY5SlTZs9mdXGw5vDguHtLswMC0ReXp1//iYkd7ns558ot7etOIxo15lZlqtEf7RN
	M4A==
X-Google-Smtp-Source: AGHT+IGuQmIgWokYa6GFSf+m5Z57mXGg+LljOBmerbd3gJBjFhivGNVqaTCd4aTQnhoWGr5w0Jse9j9GlEI=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:f213:b0:1eb:51a3:75ee with SMTP id
 d9443c01a7336-1f31c95c280mr34845ad.4.1716339712356; Tue, 21 May 2024 18:01:52
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:33 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-48-edliaw@google.com>
Subject: [PATCH v5 47/68] selftests/ptp: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180155_091378_14A5DF72 
X-CRM114-Status: UNSURE (   9.49  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
