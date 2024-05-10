Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4688FC25B77
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 02:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JEuSntp2GWB+J70zEYTJOzaT47RQ1CtlZl3stZLPPtI=; b=Nlh32hcf//DGcD6nvNQbpzfhRO
	Xlva9ygO6W5Vd0MXYlsO2CJgUBxpwYIb9gxHIrGLqyGnmRRUbuSDlhCMpdpyiS/hwcxiigYQH88a6
	Ke2kJjaNEFzePJf0pABN/Cnsd0xBuxF0lo29GLjcslSzqEJ8JiNC63LSwNVKKS9b1srGjTfrA1PrX
	529WcWSC4Zt7RRelfI8zssOudGQJjqp7SXrarpVngYIaLB9inSCRSDQijM5QY8C6cxtxi51dOQrRq
	x8u4QjTdmHj3lCVJCK3og9tua9IL5lJT8LQWJUHOm3nHDQ04TnizWIKBu/WwMT0T1zJoA9/yKmD7t
	seSvFPnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5G3V-00000003krp-2Wy9;
	Fri, 10 May 2024 02:32:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DsC-00000003OsG-1zSF
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uRjTqL5jZBxzwk8RtqE4pMuTf8/KsRch8ACUgOLR1L4=; b=JJyPpWCyALyyRjAkPxRX8ovbP7
	veWrMQZcbP64hKraQejQyt3xhc0DwSfNh/Lhn9LSIb+6CWar1kIYLjCjTW4/7yY8lwUnFm6JQP658
	zHQrWQewZtUyMcw82cmAIyRMCr3riSzBgVRPzvyUHzNssET9ii40TlQX2lrW4zq+yfAlFH5dB3Hqy
	nkqy59BlSmqbJ2BjWQEaj/wOEw61tvMcZ9dPeBKqgyr4Pgpp+f4a7liIO63JxIQ5B3FMCdYA6A6lx
	UFxdlrnfvptwBU1qNfvQmVd8cTEeHBwJgxQ9nBjnx7obUOW5b7QKIGv9cva2cmWE+sTNDMYJgFuZm
	e9Pfvtug==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dru-000000036S1-2aro
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:12:26 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6f452eb2108so1205137b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299928; x=1715904728; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uRjTqL5jZBxzwk8RtqE4pMuTf8/KsRch8ACUgOLR1L4=;
        b=BVku2WMJrG64Zh3BMVRKKnOgtH8hhKS0kqn8tTMgh2t7X3Vfuw8FeEAa14NL6BoxN8
         hNIxR9QUY81XiqU5lhj/MeUaUFhwElVaATXKyDRA8dnuiq/UxYj/w0uCCoUnij3ypdsb
         /epYY18xB5TLdXnByYS93h5xIVEk0fslHTEtMkmiqUv8CMDlMNGUBNeCItdevB3FoBip
         ngFm8pokkmiysKJAsxhNslbAXvy1zptYWr4AhZnRnYhC6sy8l2mSLcLSbtU1cxemmBFV
         uB73nt3Lx0t5OQhYWm3tvwf5MaVh7BQ8Bpu4pky3SVfxIw4TDYXvl/3MtCpJj5K/cbTP
         OYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299928; x=1715904728;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRjTqL5jZBxzwk8RtqE4pMuTf8/KsRch8ACUgOLR1L4=;
        b=mgX7DMbqGXB+BYcqFr1AEEziRfqTr+qNawpe2ud14hFg4uNwT0sJmkgfXKe3NbIuXi
         7OW/WWUzONgD4ArMwa/AsIkzZnR3lnyBdhKAy40QKKMSR+N06TABIQHiYF+8r6eJvS1O
         LBnweHw/Ga8ANvCJRYpKz61LegcrNKl9zMVDHiB3biozAEXo3Md4qh+hjQXcQ9cEtJZb
         6UR2wvFPnlka6hqRGEeDfcaKjRLwgkDLMPXP5FkwJBfsMTPuyr1Ox+C2f5sYPx7RF7kH
         jJRyljyR0DlHN7Npra8cr5Jvn8S/GwTtV7vRop2ocjYVEDbpZ5OXqgsCpDOGpgh4SmWW
         sUOg==
X-Forwarded-Encrypted: i=1; AJvYcCXI6Edj2fJUbxXPyed9fWrSxr7CM8FO2kjXdiiiupUNvqwoGEaZ9R3oE6Y3otkswfiUPe0v4KQ7zgMX98Z9XU9QA7c4PxezqdYP4PPDHeUN
X-Gm-Message-State: AOJu0YzxlW5uYbGFRqoBCfWNu27ewx/4u0W6se3ZdHjBSIjUy/gFkznD
	rYZvebLyneJV3Sk0WVude93ipSLmx0Xjjeojihm7hC6WhEv+T/54TlYVmBZlDI6bNWcJdsiX6J/
	2oA==
X-Google-Smtp-Source: AGHT+IGSF9WzQWuvr2wMEGyozUQO7K9UVp16MtXq9kPeGzg8zdiMSf7txQHGnyzqkIc1hkialPRFYFdBrZE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:8c82:b0:6ea:df4b:86d0 with SMTP id
 d2e1a72fcca58-6f4c91f346dmr13199b3a.2.1715299928188; Thu, 09 May 2024
 17:12:08 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:22 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-66-edliaw@google.com>
Subject: [PATCH v4 65/66] selftests/wireguard: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	wireguard@lists.zx2c4.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_011210_956092_A8D730A3 
X-CRM114-Status: UNSURE (   9.46  )
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
 tools/testing/selftests/wireguard/qemu/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/wireguard/qemu/init.c b/tools/testing/selftests/wireguard/qemu/init.c
index 3e49924dd77e..08113f3c6189 100644
--- a/tools/testing/selftests/wireguard/qemu/init.c
+++ b/tools/testing/selftests/wireguard/qemu/init.c
@@ -2,8 +2,6 @@
 /*
  * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */
-
-#define _GNU_SOURCE
 #include <unistd.h>
 #include <errno.h>
 #include <string.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
