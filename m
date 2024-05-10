Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FC7C25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Q/fc7Mk/0woTuMcn+EXhRv4286kQhh/2YqVsGW06r1U=; b=EpRbVAI3mGTSkvikWchT4ReU1O
	RhJIoEg5V2Nn+nj2CBwnoMXonG8jO47Vu5aU4VVx2yOOu0PfD/Sf5Gh9tpF2vZb8el9bYDsGU5DGJ
	c3j8xKlKfWsPxUQ7IC1UDCYBSmL5W/jju9Gt4JMjkkpGabSfIMGSJ/OQlunFR7IoR/YQNFhDnuI8O
	07d4F0aB23LrJVdc6DKicUiTEdjClJNg/xO1s2LrYgJgtdIg/TaOfN0aWyq6HOGSq3Ou9X3OVY/uD
	RrFTLCglN2BgkPQuQl4Y9zTMGDqYg+kqoVXk1QND1iTw+2t50gn7fNsheBd3ky+e4Do3r8gZ95Hmh
	tsomamWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dph-00000003MuB-3KAk;
	Fri, 10 May 2024 00:09:53 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DpM-00000003Map-2f4S
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:09:41 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2b37771326cso1397074a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299768; x=1715904568; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rmsZ7SnLiO3MTUumcGwO6/3xrY/wF9JsS2sT8ar9LKE=;
        b=sJQsKR4zoap61UFFCfp4hwTCbhupedoXeqXRBZeNJE/TqaOVD9IZ2xPFPn8tl6rh4w
         5JnY71ueBt4RsK0J2d9vB5rF5K1+zyymofDT03q7Sapgdu2bi9nqD0ZPKQdW/RThYzw4
         OlLzxqwf03no9Nw5KCceEIzTFfvGZ9bFENL7GdNuIqQqpkS9bqCoUHg7Kfg2BOG4IRGp
         kkRIbAd6JwD5nWO0ZIBlxIWaurHnDPnAkAMJqrzvXEJ9k0QVS3UHtCGf0gI+5JYZhwqm
         ivKnkw5QOneAQZ3UxstyPEbllKAgCPu/uUv1VAba/stHfuNjyb5YMSf9KlFRUedAlYjj
         7OsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299768; x=1715904568;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rmsZ7SnLiO3MTUumcGwO6/3xrY/wF9JsS2sT8ar9LKE=;
        b=c8euuolZg5a8SUrtLcNpuqiawjCAYZk/AmuxE3GlvBpMUFD5+3eorIv2DCIRHKyqRR
         w/Hq5xWZlxD1J187z0UUUoq49EM22q3ImKazvru8W8Re/zeFNWtBKgIurvRHhPu2WyIu
         PJfD/i1VKDDesqZlH3IpMKuJOL7GQQPGw8r2g+kGLIbH2WVB6qbD1L/VpNvuibaLFbcF
         mI+OmODi52g6Wq0mardbE5eC21yMx8iAOUIqyzN54upjxxozLrUAT0n5vEkZACh0MtYm
         dlIGqGUM7lXM0nmRdt2a+cqRrJn1shzi5chEU7K0fWj2NBqhg3zF5ropsN+FJu6xZ5DU
         Egow==
X-Forwarded-Encrypted: i=1; AJvYcCUWODje2R+ukZVz0mVdKPwXYSD7R/tUeD+p6kRAt+qUEYAuFLMxJF3txjl8nF/saCqVhctO8Zh0YyIR62Ncsdb5i1IAuNrWmVi5MtUJDaMn
X-Gm-Message-State: AOJu0YzGVL6JJZfZXlmm+XkKyBwLk4gIMqPUyF0nduV+4IJi5gluXN9I
	jM93pbE9PRmT6o6w7e3mnh16UnDWslmQKqkpLkVP1Kzv8OF2aubaEBZ8pth3mvprJVP8rzSpEQ2
	xAg==
X-Google-Smtp-Source: AGHT+IHvQVIM4JeR4ZgqjanMvc47tQdjM0e3oJXcocG1JkFtADLA104qts/GHMikYPcxHp/Zb6DHY6Ww0pM=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90a:f695:b0:2b5:af18:6465 with SMTP id
 98e67ed59e1d1-2b6cb7d0d50mr2811a91.0.1715299767774; Thu, 09 May 2024 17:09:27
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:24 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-8-edliaw@google.com>
Subject: [PATCH v4 07/66] selftests/capabilities: Drop define _GNU_SOURCE
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
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_170932_868337_98506481 
X-CRM114-Status: UNSURE (   8.62  )
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

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/capabilities/test_execve.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/capabilities/test_execve.c b/tools/testing/selftests/capabilities/test_execve.c
index 47bad7ddc5bc..7c37ae2407c6 100644
--- a/tools/testing/selftests/capabilities/test_execve.c
+++ b/tools/testing/selftests/capabilities/test_execve.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
-
 #include <cap-ng.h>
 #include <linux/capability.h>
 #include <stdbool.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
