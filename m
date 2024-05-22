Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF01C25B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JaiAxUOXeyHqAyfuA+Ez6LUkzv12OuGDGMHSH7ZthsU=; b=LaM2Lsubb8Yk/qqzuc5sRroO71
	3WLzq1FH98cs+k0dzqFGqbZcWWt+OaohWgkDY8pvwIWH9xXJlrJVbb82Y/3GrKpRL3vgUIjFRucIe
	cXuqqJw0WJWyK8g8Id2lAF4dZP0ICia4WAO45MpYpeijRb3Lqro3y6LdaVBfiHBlJCx7N2fMOCnTJ
	MdbQKINDkDu5iKlmX+AacYsM5STsAIx8ljODnbeTgucBtmjHPlgwwD78xN8OkCHoNIG1fEwGb6SgW
	zD6qOxnzBSwK4X6tRA/pqoyj6I3KIdBRnQ1qT4DF7WlGWrQDyr8FpulWh99nPN/4z1jFZaIlH9t3f
	Ka69Kd4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aOc-00000001VwC-0zRP;
	Wed, 22 May 2024 01:03:58 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMe-00000001UXq-2hRq
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:11 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61b028ae5easo207944247b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339714; x=1716944514; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tX+C4G2dO430Dq5NwbbjDA2nRzbu4A2cHamlSsJi84o=;
        b=ejzPyHyoAJ2eityl9g0nxvMUVB18EPjAThVGyQ+lQqTpE8xuWVAjNEJWfz8Vo7s7wK
         ZiFVMUp9QPmD+aegatImg8o6zA4ygpq3ekW6s/aIRnvdv6wFcPRFVumJhhY1b6BOkxE4
         Xot+EdHdDeG3txD+uaWTd2YectNS6jUMHNV4ORECcRBRgZVoDBHG4e9IPWRaN7adZgmp
         kTzN34+AWmWCU9leIW9egxL7ZBg62QgAblhLjemKKMYooF7DSjF+4eWWoVBGaDRpCnuZ
         fIvxsrwbWWD6kP5MA/CoP+Ru8U80svzA0uLmKKknG9h2ve5RPuvxa3aEsUsaoG1IfMqS
         ve+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339714; x=1716944514;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tX+C4G2dO430Dq5NwbbjDA2nRzbu4A2cHamlSsJi84o=;
        b=cv6Vfe5Np/FuBkULR6Tc5zHmqKQ5Jj8hXjwFB//ntiB3xcmHuakL8dPMziZB8VlfBR
         +RHcTBJJw5RIt5moP8hfMkEA9mLkgVWkloQXRSPjse5i1kSIJjJ+bFaGiVqwKxV42WDJ
         9CY98xJqo3YQ9GEk9+0lYYJkKsNoAJNaRNiq13PPWs1TqNZhulbhTlEDB0nbmAk9D73N
         SBV0rGI+S4HdejHHntrhFSBLlr1co+4OSlzbgb0r3gy5K4UpalNwjImJy6RqUoq5O5BK
         Kqu677xlhaBC03AfMG7NktupjFTYvqnzu2BgfmRm8sB4vzxlPfUfTlQZJsbQFWPEbCg+
         SOYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3ufUalCQ38+HVmVJj4YJeelMn4NLfjlqh4Tq0SEZZVv0LASKhg+c1L1M7VbQ/m5RpdJnE1U2NDSr55mOE0TfVNqVEFjmOHbQE5GdhJUl5
X-Gm-Message-State: AOJu0YxEjDGAKUEmyw6PUUGBkbfYM2J05ftoepk2iF8AABvb9PRXMbM9
	tygKaP7L7dUWaf8nlWJjODC/YqSNVp8D2+Bkvw6+sRYklpg/AGInA30tHDbWvr6guKkHmkHDu4l
	ZnA==
X-Google-Smtp-Source: AGHT+IERd30jv/R2KSgTCg5YZ7ZV2lL0yhmpeb+wESJAYpGBxJBI9/AsRI4az9GMtDgAdquzLZrkmDgFCkE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a0d:d80d:0:b0:622:c964:a590 with SMTP id
 00721157ae682-627e46d40c7mr1748647b3.1.1716339714682; Tue, 21 May 2024
 18:01:54 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:34 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-49-edliaw@google.com>
Subject: [PATCH v5 48/68] selftests/resctrl: Drop duplicate -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_180157_139540_15CE72C1 
X-CRM114-Status: UNSURE (   9.01  )
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

-D_GNU_SOURCE can be de-duplicated here, as it is added by lib.mk.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Acked-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/resctrl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/resctrl/Makefile b/tools/testing/selftests/resctrl/Makefile
index 021863f86053..f408bd6bfc3d 100644
--- a/tools/testing/selftests/resctrl/Makefile
+++ b/tools/testing/selftests/resctrl/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-CFLAGS = -g -Wall -O2 -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE
+CFLAGS = -g -Wall -O2 -D_FORTIFY_SOURCE=2
 CFLAGS += $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS := resctrl_tests
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
