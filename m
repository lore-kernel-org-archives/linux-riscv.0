Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D817CC41513
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+vqjSSYpovFRykGBC6buT+qL1mu+jw6xLmjZQU9bgnw=; b=rEDDEINUawxFTbeGqOZC5FkiR2
	fKrcCxU965io0+kwI8reyPs/BX7Cq0GFKI87IAfCH0YrEiG2LbJRFAC0sSypmZPZhkb1EVqcmrO3q
	ePc3aEKGKn/uFHT+PdQBcqu/Oyjpy1kh8Y2BifdrajnCNoyEEJZL13oEPwmvbc3f5O+yMiYlauO2f
	sXIGesYtb8jjt21rlG2Bw5fTioiscbUtbZSCXx2wO3yX++lEgJJStB6WYSDVCAjV1Q3LLvExxbons
	lKGrPVBxl4sPVHOde3QxBkP1I8kHH4w7ofo2BmL4BQzS0VhtHXNLw9R9MxkRR/AJw57n2FHZ6ToiP
	YnCEYFGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Eso-00000003aka-3SLB;
	Fri, 10 May 2024 01:17:10 +0000
Received: from mail-yw1-f202.google.com ([209.85.128.202])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dpi-00000003Mqj-358z
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:01 +0000
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-61dfa4090c1so21170887b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299788; x=1715904588; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uqtc6lb/bjRHtHw2HifamjvJeZYo3Iv/aojOVKqDLuc=;
        b=ooWLm68scwFVqvukjaOHHHro7runnYs4qtArOTEYBwm+o9ybDEDWOD0gKba/WP1C8V
         acQRIiKS+YtFNLAxyqP9Pn6fpB8rQlYzy5lGZj2D+r1v4UAnSU6N25A2E0wzFTqw2Al6
         Wa+FJuLo7D3ZF6t6tS/KRcZ8LVzoMCe051aCkx+0tvU3R6VTM8yUNe47eURxV8iLlGIj
         Zs54da90Zk2mEKBt9nkCK+orIXjL9m/Ox9j0zR5sJHC0/pzKM+hhdSP5VsO7cQuqM27k
         vYAwwRwrZtumrPjPm1aL4iy8WoC2RQq3OFNFWh/Nlq+4q9kDODacaoD+4A6DSac2y4uk
         CgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299788; x=1715904588;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uqtc6lb/bjRHtHw2HifamjvJeZYo3Iv/aojOVKqDLuc=;
        b=FHXCU86kCalloNi3ze8oc3zdY/k3befgFXsOgNWpfasznFJoV6OxxICfMd49IhbCzL
         im1tWaZw3OQ7wUvNSydMuNIvZue1xkxLUrdNNdwkkwx6GVvw7rUkNab2PjujaOuoyTgd
         e7W/puLewDcjBEsDz8OqipfUgKwETBmiwno67lDuyGAnBJhusSwAod2Hfluee960WTE2
         MFqXzhlMlTpRaxWRdkK9gdB1yX6mnA52xDKImgNr67hsWXBuS2l61SKYpnnkrBs3rzer
         0eTh1DD9f00AvTg5W97jQOS5cNz1xaJ7j/p/lk+0hfl41XGcKQBoOTrIJrveVM5ok2Xf
         8ElQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwu6IAjhoso4qUawWS4zHehz469NInruy7Bth3eDYjmAIKUfK2VsqeTfDVeGDANaIOSkxFFAqgcsiooABY283sssHXXFK2XI3orBpFTUMF
X-Gm-Message-State: AOJu0YzVPCHsIjZXk938YUz4aA9c5zoeCIU1+y2hxIbrGeV8g0tXeI0v
	D8uPKTRJbHKCNpPw5i6AdsJ68J3SMo99vr3p++M3h9hWuzzB/va1qESHA9xgSgiOXxm8t0LFrlQ
	00w==
X-Google-Smtp-Source: AGHT+IGVLgMcKP7k6+jbHoBvicQj4jJfGTq3ct3mJmsySja7BFFB2IfjyDeVqng7lmOeRf+Hm3qC1VhoGlw=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:6211:b0:618:8bdf:9d56 with SMTP id
 00721157ae682-622afffb2b1mr2640537b3.7.1715299788317; Thu, 09 May 2024
 17:09:48 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:32 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-16-edliaw@google.com>
Subject: [PATCH v4 15/66] selftests/filelock: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_170955_369050_B2C4197B 
X-CRM114-Status: UNSURE (   8.72  )
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
 tools/testing/selftests/filelock/ofdlocks.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/filelock/ofdlocks.c b/tools/testing/selftests/filelock/ofdlocks.c
index a55b79810ab2..301c63ddcceb 100644
--- a/tools/testing/selftests/filelock/ofdlocks.c
+++ b/tools/testing/selftests/filelock/ofdlocks.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <fcntl.h>
 #include <assert.h>
 #include <stdio.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
