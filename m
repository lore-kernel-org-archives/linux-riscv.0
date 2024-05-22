Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61F2C25B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=580nZNdytmJZoLm1rJRxwfiPX0njDiLBDX/FYFBiD8E=; b=OY2i6fK8AZ2x3rpA5Rk16IMcRr
	XnyjdgM55tcmBjzoBA3Pqgiv81b70GAz3jICC4E9UoiiHn6c/mAs6LYUTXwFf3jd0YyY9VKf+PnWB
	DSu1b+uy5KmmnGNQJNDIOQPK0VVe/72tBDoDIbRfkact2u2aHabSBvzmURUCpTUkI6VjWW+HgPl+c
	kcHH00MQizjn5vFg5AmVas7kwEviyxwkyJF61mpnWskUoR31FS9S5RWbCZi7rSLclu0Z/t9drnteh
	0ljTdi0nsXDleOL/tXHgJkBsIa06in8FL/TWSdTCIY6RBshgwrDcJYTPuVZFMymZhKwqgrjOBMY0j
	KChOhdDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aOE-00000001Vci-2EEg;
	Wed, 22 May 2024 01:03:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMg-00000001Ua0-0vvg
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sJwY8xyYNRiC1Lf/cNUb5+1Fjc+rjpWOX5XY3I8SjaQ=; b=cdfOvq5/5f2ZobQz4v0yGHXFVm
	tQsgh0+oPDeQimrKlynrN9cC3IoUL6CzI7TfFH7runn9wW/MiSgdWwfX7NRjYGcCf/iBMDpQ3wHp8
	oQDVIxB0OZR/6PdpXmtQRAubFRCKzWiYs+KSr9m5HSCAFw/jKXutvHBz2G2ZrH1pFNEGIl4kAYVCR
	6JOcc1kwPMwcrjaNlP52pv/9hq7CyGIzjhCn1xiuGLkMFdfKuOzaxHzHMp2ngKfK9nzthWje9s5Qu
	Z+Z4X1Yqu3bwgFMUO/KHv+O4FncRkBi0sf/kqmW0jGlYSBotxejK3uxAPxZloMK5qPm7IP2EgmY9A
	d2y4WyqQ==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMY-00000000B1z-1SwZ
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:01:56 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5e4df21f22dso299843a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339669; x=1716944469; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sJwY8xyYNRiC1Lf/cNUb5+1Fjc+rjpWOX5XY3I8SjaQ=;
        b=EB4DSDSPkZFu7xrHYDygg4wwd3EupnlE2bd4ze65SaqvT5NoSUSPbA7YByAh9CX3n5
         CtOjq/P6Oo/dDEHQC+QgcxWM25XDsqYCYZcL40n4YT/XvOjUxXWaO4Cn6qyUFlbI6Nj1
         fEcd2pywGNQwyygCxJP/q5aZRTE24W/j6d3YiayTdF0+sT6bU0PJ4PXAm4McT1hmAK+J
         ORV5/zLfFDucQq62AQMx9jm9aYmcmJqZUOssn+RwczarsuXVDy6UXtpm/6MaVca1yF9H
         4U2xK5Tbic/bZnt8NLrQ3h4ncP2ZasZJP0nnnh/qTcrCF4vwuLfUiLNcdv7oVBrdZ1xm
         qpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339669; x=1716944469;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJwY8xyYNRiC1Lf/cNUb5+1Fjc+rjpWOX5XY3I8SjaQ=;
        b=C8JWeeWWe8GYdbaHBGgvFo4dj5MzadphbJrmzJfTIyw2paDyKcPh60F48fVmuE5KO7
         XaYdtBVLxtGhYrBJV+FFE2a0nsOMWzttFtLXF3+5u/ky9u2UC90V9k9N9KxJyBdGnF/L
         feN3U6r+8Uk7qMWQdcJXstE9SaRS9ClE2assa/YfdVv9CTpnKmOYAmLGblU7B3weOK5D
         UEdo6180NIo6lU5Egd3yUmeDXGp0nIlbPtPH9S0O4K/S8WMNEMQW6kB6SMoooxqeOHNb
         RluijtK49q+aanxlZrL8ZgtYlmY1U6AYG8qDP9UYcqEdTGGrHI0FMKJtlIZNgnOl4nT+
         NMcA==
X-Forwarded-Encrypted: i=1; AJvYcCWr5ctREK9C3X9EJIwxV5Z+p/bpplDt3UrO/92U3hmd7ZGc2KUgHKBWCQjOBhgh5nCsa2Uu9yfIxw4IZoi21uqPay+RPe9MQH8Brbomvc06
X-Gm-Message-State: AOJu0YwsL0SEK/Vq9UmvaA9K6dOTWtxeqaaC1xi4SODkfhZDEyyC6rL9
	nzIXEXAgZdn83NUm7gNt85Aw4G+nstGJZm9CxSpNDDVHnROekRwsljvBEAOZE/kEbJ+YAwY93PB
	/EA==
X-Google-Smtp-Source: AGHT+IFZBsQUor32p70/JGSv4CxrWGq3P3/GgKt0fp8qEjq29ivxGwqV+wZBWF8r2ZaamU7fHDxr90VBVeE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:6684:0:b0:657:8a55:89b0 with SMTP id
 41be03b00d2f7-675f9b7518emr2395a12.1.1716339669398; Tue, 21 May 2024 18:01:09
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:21 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-36-edliaw@google.com>
Subject: [PATCH v5 35/68] selftests/mqueue: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240522_020150_602091_4D6DC32D 
X-CRM114-Status: UNSURE (   7.59  )
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
index 5c16159d0bcd..7be29c3bfed4 100644
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
