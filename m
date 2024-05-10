Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B72C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gCDxvvSsWC2pdEM4S6I4RMa7t4uRuOygOmEljkzmMkQ=; b=eMmXpkkKUHyvKDceCsTYHBsu0W
	6gS/GbIBxAcjWUUwqVNiBdn/BrN/wCOYuTsHYxOuAeD6iLsOS9gjtHGSwFqCeuZf0rkyfH1zlHnSQ
	fZG1F/I/Py1h0YAPkGnbV/ZSFGXexqZ/6rqMYdpU6XvadW6Vu3v8nnCJ8ESntzQScjThUkxmEsu+A
	lG7F55O0TAh+I5kMk5Yux6h9LUZ32MwACxFAKy5p374wZYoRxRD7+aba2RrFv2GCICsHCV2PoFR9N
	fTQod2XJRSzIbShncTxX7UsXnNf8Rl5eUXeo6suo35Cl/dtlkX/wzwOk8PlmpqvFkCLe2mdOb+Ry9
	jhvSRiEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Et3-00000003auZ-1Tsk;
	Fri, 10 May 2024 01:17:25 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DqV-00000003NUp-0zH0
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:06 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6f386362640so1458972b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299839; x=1715904639; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zv9hDsECpk9yhgUK8qXtrMx/MNHEvKj5YS1pAX1XIVQ=;
        b=gz2VchPRqteIlxuXPKxo8naEVW59WlKj3qYDMJn41fIw8qSGYjTzi1JgblPh8evDnF
         w0gvGEUAY7Xf1kel9QxmLTWQhY+ZqWP6VTtM8OhkumB3y82XN6yTm4YMTLgDigDkLldD
         1ecArMeGjSrEoQEAo+WYKjFNF6vamwQi4m/2YcVgpbPvkH4exPUxUt/sWVNc8GbVpKDz
         YbEGAgn3dsrHpHY2E7lb+JL+4Z08q/iWcL1ICrrpq3h+zxXeJXVM7CyvdnHYEjVPyEVX
         /ZVwd5zhz1FTnR/KMoFpGCmwnhopFrP82YI3zRSBiJ0Hr+MsVINhYJQglzhkxkKMAAXr
         7MFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299839; x=1715904639;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zv9hDsECpk9yhgUK8qXtrMx/MNHEvKj5YS1pAX1XIVQ=;
        b=gS5qB400CH5eVAC9A8SGGJFhsSSTUU7wT7cE3V3GHGYbTnCH6bcpl2fKGIdG+1NBjh
         Oo7R+aOSdV0xbboQzdercnmH1qmVq30hE5LQYOR3PREAtjbCaC0/VncsfKth+bMrdkFX
         apX+oHuGM8rWqo19Z1sNmBDCFIeeuMu5MrzhqGVUnA3MaLKVkBdTGwCPt7QpcaIm4KcB
         S5UXXWOtDvMQAvC0BW8B3mvqkV0bZPUXJ0TB5vVdi5MRe/rwW3TtaWAy012kB1CPNsUP
         coVigw/ebOY9VxdrKC2tepCgPDV1dqYbWWttyIIAdlkPlR/H2uKo0wI4cMTlJi779gDN
         pZEA==
X-Forwarded-Encrypted: i=1; AJvYcCU9bJIsTCPPsnjvGHNNshFQaq5LZUkfT5LEEmuWKR3BVOIB54Jhok3yLw5aRVrraHmr3gpGPQ3rGk9UVlgmET3dG+l2mhSDlOhJHhA6GINP
X-Gm-Message-State: AOJu0Yy8nVi3LoIz1KEtmPFz5YCrmCnvCCinKZmREWegCzSNlBfClkqK
	SWHZadUjaAKSk8rjicJ2eJWD7Q9TJ8myzKR2MFBWAwC8TUSGtNkY/S7nO320b2qDMy8QgdX06wu
	SnQ==
X-Google-Smtp-Source: AGHT+IGonivkS2R1HvP1jmkZSFsjyubb1aG00OxxdbDNweBSdZoLp+FL6tawzI/d9bKsCP21+ImOsTIDeB4=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:928f:b0:6f3:f062:c145 with SMTP id
 d2e1a72fcca58-6f4e03a31e6mr55150b3a.4.1715299839273; Thu, 09 May 2024
 17:10:39 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:51 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-35-edliaw@google.com>
Subject: [PATCH v4 34/66] selftests/mqueue: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_171043_959736_08902940 
X-CRM114-Status: UNSURE (   9.16  )
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
 tools/testing/selftests/mqueue/mq_perf_tests.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/mqueue/mq_perf_tests.c b/tools/testing/selftests/mqueue/mq_perf_tests.c
index fb898850867c..43630ee0b63d 100644
--- a/tools/testing/selftests/mqueue/mq_perf_tests.c
+++ b/tools/testing/selftests/mqueue/mq_perf_tests.c
@@ -20,7 +20,6 @@
  *   performance.
  *
  */
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
