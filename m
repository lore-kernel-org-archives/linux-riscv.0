Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379B6C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wMbeNqHMypd6JfgU4o9KX/wl3ZHFuIWgIEwjeBq4Y44=; b=KJooow9YWrRt7r5nAa/6TGmMev
	pp5qND99F0yNITNTmtJZq7D5RBk5eqEExSL3mnliVJq2cvhZ/ToAVheRzO/3OZ1BUS4eHbXXkrjaT
	GhihR47vhMHwF5j5f4qJpc3ATMUdSVgPW1eU4gBDe9PHYErcbmgxxTmB/EOur8CaQNhRH2+MNcn+x
	pFBRwlMvfDQnTR0WsM9WITIwSErVYt0UxYf7ySTstyFWGqmi7QI6Xp5zeYNQQCdBHV7N6DvE8fiE0
	sJ9d6LQQGYhXJJMatDFJQ+s62Bq25tFtUIXpu0rTrQCEZtWsBEqr37FOAuTkwGmQ6XqP8/qTcupQt
	Yttlh1OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aNb-00000001VAd-1adW;
	Wed, 22 May 2024 01:02:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMD-00000001UBp-16DV
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=K7LYN7Buhr7rix3hzdieKTkVhSQ5bSYYW7kF2VJ5jtY=; b=clZS7LT8rCkhN8yy5bWnm85AGk
	JfxRzvNrJ8dt6rQ1cMaqw8HGnOBWE7dyWVQ+RtDy5NoBLa+G9Y7cD1GHFpxsdSofZvcVc29NGbwAr
	aFGJhzLV79E/RQRyFHda2vh2GZqi6v36immwin/Zl9joCl7XQ9pgqMdoKPVz0b1IrOSL/oFXnPxTk
	ljWO9qV0kbcUw1PwA3yoe1SvLxqxc8m526dB3msBWxFMwFFtZoy35dj8SrURHyNRNUGGubRT8eEVm
	VJUR8qfOJBCuJLTopAUE9wBSRInyJnlkc+wLhHwg1ZPoR6iM9LOJGpbRWwKNdOWPRe3t79HqHFHgw
	nEgI4EHA==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aM9-00000000AwK-2QUP
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:01:27 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1ec620ccf77so96537115ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339683; x=1716944483; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K7LYN7Buhr7rix3hzdieKTkVhSQ5bSYYW7kF2VJ5jtY=;
        b=ZCRl62J8WXfk14bEiZf0p6VWMY4V9yHxRVKdku+zKGKNolne63af1nohBkyDwEXcMe
         S76KrOJKGnEpfXTvosXmhRfh7akJi9rJl5UhuJEsqNHeNTwJ4cwOqIKqDFVJZYiHjA5a
         8YV/Zk9ic7vGIc1viztR8gQPzbiY/OxzBh7NmM1rSDoRKieAIXqJKDTqOiz6gX5M/dSy
         xiMQ5zjh7o3T/vnEtJmsfzT3iwFQM8SBWBeuLuxNdTWA67QPpMZYyJW8p6byh0LmeTm+
         qYXEN2C9CmGxc1nTo+MRXiICDJkcm8CwFzoafV9D5kyuXME2KXj+1QaeR7uib6Bo6byU
         bl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339683; x=1716944483;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7LYN7Buhr7rix3hzdieKTkVhSQ5bSYYW7kF2VJ5jtY=;
        b=m2uarR+jAz2zAqDdqEDFI8HPSc4yvMUunMhfH+xTElXJ4RlbZSxKhdwp7JWzYCDyn4
         p8zNkresCovtp3nomUevhRJXcJP+0VHamUTm0HBrwm4VAzibFPjzjKJqWJ1y0uoq+0Gq
         gm89CLScV3yFQ+SHeKR2xPazdtP/Nj/bM8uqeA2t43OfLkSRrKtRyF748MQ7MqClrGVt
         ZJxRkKWZ6lgxy4t2D53o9GM5aj707kR4lXy9tVXsGp+NZNpn6m4Zi/pmksJnfmI01INv
         oodIiLMjFb2fIxyB1OkFwal+b2YZGovJNFvIy50kjc11dd5Ry04GF60VW7GS4Y78907c
         j4kw==
X-Forwarded-Encrypted: i=1; AJvYcCU9V8dt4T0XkLUYCYlbdBj8/+6PcMASmd59wqLNeLPSym7HoUYFgyaXCd4X7n5Hfwh+kYbROuELEnhKLZQMU8OFkwGXlt4rTANWdY6SNgZP
X-Gm-Message-State: AOJu0Ywpg7jh61KY/mkdyb+vIsuVHR7e5S+MGd8gn100gfIQ4AkACWPj
	7y1HLW27hCa/QlZ7VaIypL+dVnFsJz7sGU5LONtMnnve6+ZOzW81e25WtTKuedONT/+SxGjv8nn
	LmA==
X-Google-Smtp-Source: AGHT+IEKTKEU8i8LsxKnc0jl8+K9ZmtrZEux+7ecvL6WO9wgfYI2cFGhBFXoIp+rSur6ZMbWmmU9SraeSmM=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:da86:b0:1e5:10e5:344 with SMTP id
 d9443c01a7336-1f31c964eb8mr40885ad.3.1716339683060; Tue, 21 May 2024 18:01:23
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:24 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-39-edliaw@google.com>
Subject: [PATCH v5 38/68] selftests/nsfs: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240522_020125_646645_1B6190AB 
X-CRM114-Status: UNSURE (   7.65  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
