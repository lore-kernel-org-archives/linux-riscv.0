Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB1FC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B/7abNI/jbax/66ySgyijZ9s8R81PJjcD1ETkFHG1CU=; b=vhzfofKCnTY01/2t9rM8yrorZx
	tOouXO5yE4SqhhxJ1uuCF9esXYrDC7gkeCds2YuF6j+rMk6tuAroDgczq5n53PkV2X5WL/a6TkOvB
	Sf6FOre9AwqhVWpKAJiQwNaSgjMci8kPyJvvZkPc+vp28M/PIl1ds8fjmgesiUmwJIyjq2KSaWwMg
	+1xiLY6c1+VmuWxfesQFz1UECfZIG5uADEHe+1lJyCuBjC4vSN6/ozfInSAAgEUwY0lfn4AKPLSvJ
	Bjr0nb5il4uKS7FdR97mIC5fQhTeB9StJw2k0ZvhVlkjeN9UdQYCtOMSM/lnKOX/Pk2lrxJ25xlTV
	Pt6/7O2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xU-00000002bGh-45S0;
	Thu, 09 May 2024 20:01:40 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59x7-00000002atE-0w82
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:01:26 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1ee3b4f8165so11489805ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284872; x=1715889672; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5dDkrD0dZYNeak58b9GqqXeIHUFk691mZ1uMk+mW0Xo=;
        b=08oJ2I4Xoeqwm1BRyPOorrwquV6mh1U+7yLmq7QX+A9CWKgieFRELBu7ahSg8k3R1F
         tzpokOwKcRuaDY5DH9kBFUw5PNltNWWYf7uZNAvNZx7xWiEkAsBbTEa0LN3CA8ug1JA+
         G/s4vOunDJ1PRnpdbUsd3IBrnNDZzKKXmsOVK0Xft0npXG84FO6jzzoWIyilALpLypwo
         sMbwG5DkLIKmsEwno/mKHXsAf4x8BMLTVhXINbQhLIrgEpDEuT3hZuThtPiEgHlCW+rh
         bJ1TpbW/8LK9JyHiDyuexQbtGo+h4KzFRGUZ0wSjRRpvrZf7sOc6tEEGNXnA8PB3UbBk
         0W0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284872; x=1715889672;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dDkrD0dZYNeak58b9GqqXeIHUFk691mZ1uMk+mW0Xo=;
        b=OotUHQr7QgcvSfqeeLzC79BQf1T6EDr29fH3p1zFp/9YHF+CKy9aodOr9JP6G6hPkJ
         ZEHjEbyQ0AqgHreaxXZQ21dUU6/4ECy9NlHH7OmieU6IZjH5vEjUVngp1iOcaAklAifZ
         XB5pUTBH4sMljAd5BGPgsZsKrO68XPgpdlMOCUi6gJmwcrXOZzAhuymd30GGZlmf/igy
         oMZvBpDeSCK0xjMnrMViwLObokZCN9Twk0hO/I0W6TKTIoLv7V5568JjVhvltYYQ+RTN
         /8U6O8Mlqj9NGZABehMyHGcSlEL65FNkRwcE2SNQft/SpGcg7nm1Pidx4QijFka6277t
         jy/w==
X-Forwarded-Encrypted: i=1; AJvYcCVJNrh7M83Z9w/TYDe9HTaINxX99Z8wfse4BPfOHrq970VvVc7ID8+p3f2uLM44B6/J17I0PUBqE78wdygr/5I2VBJgk+/0lvU0F2vSK19K
X-Gm-Message-State: AOJu0YxLY5BLRwSzVh9sOj1dR+ozVYKiTW3X2BTS5ttSL8OcioTMaoJB
	OoaB+dmOJVTowwuh9SjXCawpYOaM9ReP6arkiPg0ln8zR100/dQ9sWYzLMZMhma+SVASr5G2YZz
	ETw==
X-Google-Smtp-Source: AGHT+IGN4HNDJxeluOcEKuz7md9IZhJw8i2iBFbn3kCKVQqvAuS4nKMSdcwPm/QUnrOgNSxeyjub3Y+yA1A=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:d488:b0:1e4:7bf1:52b with SMTP id
 d9443c01a7336-1ef43d2df8bmr270375ad.7.1715284871880; Thu, 09 May 2024
 13:01:11 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:00 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-9-edliaw@google.com>
Subject: [PATCH v3 08/68] selftests/cachestat: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130117_427049_3A72EE37 
X-CRM114-Status: UNSURE (   9.26  )
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
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/cachestat/test_cachestat.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/cachestat/test_cachestat.c b/tools/testing/selftests/cachestat/test_cachestat.c
index b171fd53b004..c1a6ce7b0912 100644
--- a/tools/testing/selftests/cachestat/test_cachestat.c
+++ b/tools/testing/selftests/cachestat/test_cachestat.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <stdbool.h>
 #include <linux/kernel.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
