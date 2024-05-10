Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23FDC25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l1GLAdUPdnYM1JovzUVM3/cWX+j4JBWar8smi7ApQcU=; b=dPjMouhqKm1uM3gCxmsiL7FTX5
	1qBqwzIguGcBH13piHpuvOJtzscW6FEwu8Uv3OYJvgy5nhVt6XUDopr9YmMYpiaTRZEDtVQ7Cqy35
	bwOrHLN97VxpEa8/l5sxhbIkIqIwyAQugMTWNdABWfRXiD/Hy5I5FyeNzNPwF4Q91wRPunY3XTDDJ
	yTtbrTm0a5HowPIM84AGzJijYE3+HVvyYTVuj/Eq1xgd/aqIOpngbsWRj25ND0jH0vzYUDSLRaoWF
	oVbeVsE7AtYrFxWG4QhnJ0mLDuTlgboibo3CLSisZt3vEhcRm1UXAykWoFg0qU35rMsAoaEe1HfAh
	HbP+JOeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Et5-00000003axT-3aRd;
	Fri, 10 May 2024 01:17:27 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dqk-00000003NiD-2mkN
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:14 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2b4330e5119so1234651a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299855; x=1715904655; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E6lzqQHkZ7UbUp5/JYGP0dVw4+7EC0TjPo8a/HimOnA=;
        b=lFjY6Y16hngnADpvTrctVHRSpf20a8z5s4XbHr68EBUbk9gc5y6JQe/a+E/0bFbF98
         Hdc3+GQGCQAgWnaG7pzrhil8e6XJ7yIXeNuZijFVuZfLtA21zCziHRbMV3pjm/V2B88+
         ArzpWc6o3InMJMYIODFxaj/6xxsYUHrKdhiaOdnyljyo9rsx7RqyKEfH/LLkNYgbUe9i
         qRwB8KBD80UDoRK9wqzw+eOEG8ZfXKNT2lqPxZj+u4nubDClLV0ANuZd3Sq0LV4prJll
         XQX9qQhYNfFzOMikeHdoGi1HFqPWzXwmNBrpVmcO8q+KZVi/U9eXtrV0wGM/t5zNEDEv
         1amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299855; x=1715904655;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6lzqQHkZ7UbUp5/JYGP0dVw4+7EC0TjPo8a/HimOnA=;
        b=BqJt7DA/AApEdf7jELLh/Rkm44PMbjQQduoHoPd2OhZg7MdfTE8/Cb+SAfOMJAOGcT
         C/cD0yFrNOCL4sRfMMEWrFD8atmU6hdtKKgu7W/1LU0Wgts10dm1NaK0hPLf8LJ4n7+C
         YxpnC33kRlY53ubnYNqPZMX7RcXjtfCc2X4dh13/3U0W5BhlJNSyhFUTRluxT1V5r+5A
         pME9e5mwGhDS3/mUxhZYlbvvwJ13bJrcD35jNeDRA7mC0flyNTJf0mYN8wqZPdHk/Hzo
         fAc0JKGuJb/++35iDWaPX/Lq8Kgkej0xP0BpRB2CupVVxA8WVhpeutc5QgyYWN6XzQMG
         NFBw==
X-Forwarded-Encrypted: i=1; AJvYcCV0aYSthu3p2/q9HLetGwcz1W+YTckcmSArYBo2NuaXTBfjrOyFKi2d5oOClscdQEMpRvrtSDA7OMqeCM2cHcwZejr7+J6j25Gm/6DmHgnF
X-Gm-Message-State: AOJu0YxLfhCgl4+INqbkKo4w3cKcSvo5BSK5U1bcM7eUi3jboLyO8ugS
	iQ5i4DmDwDHx6IcqHjBz2l/VqfN4chZi/zPU2OAFyFKgixSSkps0wh26j6p5gOvEc1g4+z3oJY2
	eHg==
X-Google-Smtp-Source: AGHT+IGokXaNqHaQn0wyeCEFxco9kASIMpRDbXzSiKoqfVYj6R76IzJ3Q+GLkCCJqqtGWT7c22jE7sXj/cQ=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90b:4f89:b0:2b3:5eb5:6a76 with SMTP id
 98e67ed59e1d1-2b6cc450277mr3687a91.3.1715299854746; Thu, 09 May 2024 17:10:54
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:55 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-39-edliaw@google.com>
Subject: [PATCH v4 38/66] selftests/nsfs: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_171059_052216_6E810B89 
X-CRM114-Status: UNSURE (   9.43  )
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
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
