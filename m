Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4AFC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Rbxkey2E8h47BCVRHxx3URKSe+X7lp0/458xzsg31Yk=; b=fiymC06GgSOQg9JAls3gvZOwT0
	fib8SlkENWF1qw875sMxVSK9GM6ev17nI1/VN5jP1nkd8V1r/Gz+X/btnsKo9YkITYWtJFvMJo5P3
	2NMtB4FZDrccn8YfQ9CWcWvCwy3st6mB4mSnxl+N0HT5VxaoidH34Ab64lrIUW1vf1y1KY+LYjaWA
	HlLAS4dKHWcVCj/O+Cs27RZAUljAGMnbPWqMu4Y1vazf/FoDpaWhgRnOGkWAu3nT+x/SlLu4bswsE
	etHpQaGncuAXNDTnUnNTt5vq/+NAStMfc/gA2eKug3nhO/ftnI3ENXNWSHeS4W34a8chFQbVZkzi5
	Adp8StfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5A0p-00000002dk2-1qOw;
	Thu, 09 May 2024 20:05:08 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zC-00000002cYm-3PaW
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:35 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-61a9fab00f3so1060643a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715285001; x=1715889801; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gqJpZ06+qwlYgGDMURIHtEZ0g2cp0HVan8txW5tNeCQ=;
        b=WY134JIzQ7bG8N6+tZIQt1hWn+NtaSfGGjt4NUP9mwyMzuywQNzSQV5+yNHJOX8V43
         mQjWKfr+geUuMVMoiUvy3ovyVnbxJez1bjsh8nP09y3uJmnZo45DEU4xoxtAvwRM+FDk
         Zu5q6ufiR+k3lNeR19O3CEO6bCQ62yV1S1wHKWoIxh8Ky9bBUcy3SZfU+ixcEaLIQZgn
         gBOG46iGPjproXmRLzpsXJYQKdqF/o2XhYez85XNT04IUKq9dEKviT0XgUOGjL8DXs7A
         NbgyqHv9uTeoAloFUj1R5hN+Fr6rM9lCLMUj6otecbR6Y041ReCWeQpOllDXgtVLdzAD
         ykEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715285001; x=1715889801;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gqJpZ06+qwlYgGDMURIHtEZ0g2cp0HVan8txW5tNeCQ=;
        b=BeApwKZ0vjlbyTTfrrWsZXAzBfZ+T6FHtZy94LlcOrQW2hRCQnZ3T3cvivwadiHSO+
         LFHxprF1AyITsoTA2xqEs/o9YfEXpJqmnXPC9vbo9STWnLIJeHCYbJTMJRYuXRKaAmsN
         lpqgK8ZHxvhxFI2wEdlXXotpPPQBMlHbaXgf5hSfj/GkIOnr+fl0bTiKPkvCFKPLnRR0
         X8Bv2V6kctMAdtX7uj0wepGhJ42Quz5zzsneeSDnFFKE3Q7LONizGSsdpePN44tDVt/2
         5h+Z6bX1VZvJupnHjgee9WK3GeoCDl5mUpZrHR4hhO9dXT3zhKMmd5Ha5K+/I8uESM0d
         o4Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXp3WlHfYrhDWdiM+cJA8r1Yycez+uegv9TI3pBpTPSuzcBY7tS11jdbONMa895lAtD2XFMT2uXPXuf8FtTzSimzkHh1HbRtMwPpSvKOJrd
X-Gm-Message-State: AOJu0YxzqZbdbELxLBun6G1dAN8r77SabnYsHYfJTns81GA1dY0BJfG/
	rJdSfncnLy1IJqBPk12YyE8OYKzEMrAX/dqL0NjhxMn5MybZDcxfVsqfitwAeBkR6gRwfmQXsWf
	QhA==
X-Google-Smtp-Source: AGHT+IFbSWrUqUEAgrLY6JePy3EwV7Ny9LND4RDwM9prINLxhsyL4egFps4aRssQj4tvxTm8hIFc1i+KYtc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:fb05:b0:1eb:50eb:81bc with SMTP id
 d9443c01a7336-1ef43f53d7bmr119225ad.13.1715285001029; Thu, 09 May 2024
 13:03:21 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:44 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-53-edliaw@google.com>
Subject: [PATCH v3 52/68] selftests/riscv: Drop duplicate -D_GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_130327_169483_3CFEF567 
X-CRM114-Status: UNSURE (   9.76  )
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
 tools/testing/selftests/riscv/mm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/mm/Makefile b/tools/testing/selftests/riscv/mm/Makefile
index c333263f2b27..4664ed79e20b 100644
--- a/tools/testing/selftests/riscv/mm/Makefile
+++ b/tools/testing/selftests/riscv/mm/Makefile
@@ -3,7 +3,7 @@
 # Originally tools/testing/arm64/abi/Makefile
 
 # Additional include paths needed by kselftest.h and local headers
-CFLAGS += -D_GNU_SOURCE -std=gnu99 -I.
+CFLAGS += -std=gnu99 -I.
 
 TEST_GEN_FILES := mmap_default mmap_bottomup
 
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
