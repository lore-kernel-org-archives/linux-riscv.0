Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AA5C25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MS9O4u6A/qMdiAXz6HanhfypRB9BnVYjiVnt4bSCv9Y=; b=37GyCRD+pwgmAEhC4SWc6l8P10
	j3Lv+dg2yfyM6kfidSmso2SNB8xAdCQL91wdAoQ+0/Tea/ReMUco6BmI5Jec26q2WJLJ2CxtA9mYd
	1B66WNjETjMGpDN9D0nRrdPHn6A/L5sf1za52VAyrw0mpT0fnO26MuEmi5GvWHeaM1HdvjJeMUZc3
	x36P587j8txqrlgXdlXabRVvj7jf5vIklU3KS9LrJyoIGS93wQGBEqNySgmL0hSRhvNPXIOGP3nxI
	GD+Tl3l9pHrp7yk3+/1wd2zdzR3D3v7DShNYEkUcs6LOWC2okVlQWTe/NKe1nRlLcAUqpSrDaufOJ
	C7NLa16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bWi-00000001jWP-1vUa;
	Wed, 22 May 2024 02:16:24 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMZ-00000001UU9-1PJ7
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:05 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-649731dd35bso7971536a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339710; x=1716944510; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ddm347wncUXhvBA0WIqVxztes14b3U0yNoWhmDeDFY=;
        b=w9Y7wtTscF7iW5g0AUsf/75i9d4vj7PJD7J/kguo7d9n1c08mSzA7RunQFmTI8icm/
         Zwni65Fpk9gzJk2kLhr46TgLdlpW8gBOGua5aJOOAAKGLBn8NcHKdCJQ7WnJRff2r5Jx
         GKq/tU6RnsZ4TapvzbDRYeGSbhgojmFCGJW1sF7tjQ2G8S5I+nxMuDSIC6lEbwP4nBXx
         9tQb6s0Xr9+GjsQwb7NKBzvubZ7rIr0h1m001AE+Ur6mSSvdY3QqILy3B+Vl6kdoreqR
         IrLIAbRM4uQJ5uVKgr+1gGWCNITXu+IsFPBlfc3dC1p3z4f3992nZ5abGsgC7IMpxj9D
         VM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339710; x=1716944510;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ddm347wncUXhvBA0WIqVxztes14b3U0yNoWhmDeDFY=;
        b=TR2qTbs/ZkA6H3LDjV2z2II6fUZzEZALXGp902Kq89aVVOgYAbtuTvM8vx96mQAgUS
         7RPSQ0+9DW3DvLimzj17JF9GMa+j2Jy6GkCFKiDxAJowuTQAw2G/5CSiGhnBFfStT+Zb
         ZLvtwye0pSgySc/E7vCOebwVGffCi7t7gSyaNCRuCsp0WyyBcMa26ozwOkSFAQ7hEO6s
         vK51SC+bqKWROJ33rpHrocUIQ15bpdWbvM9F4KvOClPNTdm/zD57gVvbW54Bz5sWj0dN
         sym9VWTBHMm7+edPNt5jMTq4f69XHtEDunUVNy1+C8fYHSgv1uomZXnKQ3sg1haspQ+8
         byOw==
X-Forwarded-Encrypted: i=1; AJvYcCW2xeqcRoNxPXh5PhfQhxnzcbHcYylnDEi7c8MMJmRJkU4ViIA0Ze68B/+XOquBgaRqRfqktD3Yx9FPbkpzx5HmEIYjdR9LxB7yi7vwp7y+
X-Gm-Message-State: AOJu0YzrlO0oPMo+GeZmItSpQ/EX+FgOSqJj3HQa0xnHWSwBGl0FhHE+
	OmuOk6Zh3wFwE+ltqI+lwHKDpzYwPqCCyeeKFGsimRbCi3nf0RSnYCXENPm80+729KShKEQiHbT
	DLQ==
X-Google-Smtp-Source: AGHT+IHViMDRF07gYGA4O1kZVdy742miSAJ5o6zH/GL3MaXuWgF70gUFd0Ml+qHdUScPYudMioDDIIFR1uM=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:371c:0:b0:630:dcf6:f224 with SMTP id
 41be03b00d2f7-6763f99bfffmr1357a12.0.1716339709684; Tue, 21 May 2024 18:01:49
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:32 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-47-edliaw@google.com>
Subject: [PATCH v5 46/68] selftests/proc: Drop duplicate -D_GNU_SOURCE
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
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_180151_590262_BF3B16AD 
X-CRM114-Status: UNSURE (   8.21  )
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

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/proc/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/proc/Makefile b/tools/testing/selftests/proc/Makefile
index cd95369254c0..25c34cc9238e 100644
--- a/tools/testing/selftests/proc/Makefile
+++ b/tools/testing/selftests/proc/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 CFLAGS += -Wall -O2 -Wno-unused-function
-CFLAGS += -D_GNU_SOURCE
 LDFLAGS += -pthread
 
 TEST_GEN_PROGS :=
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
