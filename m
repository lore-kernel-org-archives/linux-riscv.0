Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA13C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tpVAwWeed/1UJg+5vHl869z0F+0yhS8gC8hwFi0W7Bo=; b=ExDGt3eAgLB5vHJtjkurnOVxdS
	UUJaKCqEAlFCeckDGMoAgFvnrXfh0s9vpHn3vu5RG33GR9Ab3BvLeeTkFgM+bdlLRnTamiz01yfkD
	5JwUVR+2a4X0SmWunzR58FANywpoMYhIMtyCYkztBdWaktmDQMaFzMB+U4qk1N46Fo0l4+pcyrhg8
	M/kRsmOdSiEvo2OHYLEwTyCwll0ftJXBAAxJdMKV2kCebCj5WMwkFEVIxrUvA0G6Ok8x0r/HTtyAl
	6shMXpeKph++mC5RPETN7j/X62z6KB2jTVTGwBhUVV4c9mibCoybsC/BmluBa3et9RYBIIgAyiyji
	2jQZiBzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bWb-00000001jRK-1SWS;
	Wed, 22 May 2024 02:16:17 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLK-00000001TZO-0bbu
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:00:48 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-de60321ce6cso24313306276.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339632; x=1716944432; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oewyckT7yCJdv6PsHxuPsX+KPG3aBwcB83OXgCrutjo=;
        b=Er+DrYr7mRGj+jcY2lYQSCTAGATRwrmdkLrs8D58b8HgPPGyU+OpO3X5CnJ0fQfFd4
         BM2glsviAgrMhMtfzbDnj+zOap/GlpABHLBNmnirY9PtEEh7TZeZn0dfeICT+hXfNHr1
         OpFi7m6KuS4b1aB93ArFLBIPJZxK4AUd2ad0O4jIbTlFZScGX1yROyTS7UR9bW6eeWDf
         VNpF8vJpjoh6IW0dpl7PP9woEyDmcHfztZZvpMXvtXQe2s7sos5V8FJ0Rd7Vgbb9XH7B
         xDeE/bEvGIuxuH4eD/bmFxMhaQ1YlBemCD/RCRFXZzH3wgxXFCSZP65oJNsH+2M8O7ji
         DlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339632; x=1716944432;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oewyckT7yCJdv6PsHxuPsX+KPG3aBwcB83OXgCrutjo=;
        b=EIoa8E+WNG28KcG62xqFvOc7Pmi77MPAZS/7bRMFbGWnMhUHAeyqleTvMADApqPUNY
         hUziqgcEB/AkhTEc2eRevK2vAdkjye8yPAABiZP9pUpLLpINwU6ZTQYBm15WU1Ejed8/
         mHUAob6SlVncjJ1CJ62WfhwCtOyFryMRUqzZmiE71GPNA2YcBgz8I4PD42AAlguYJEN2
         WejGQFcGapOGE6sOWQz7Bxw9BG/zmlM4QIkuAiTGThVvhdcZoeF1W1TghOOG88qUWqvI
         +wVLPeRO7WalpWY6jKini+uI/x2nig3XurWYS7nRborDHFBzAtOenW2ptNtAsczFigzq
         SpUw==
X-Forwarded-Encrypted: i=1; AJvYcCX87PYmwi4zsmRShCBeRDT942+ENBizHxDZoe7x96vkAucMeWg5e968pCmzhye1xRCz93/y+9CBetlhHdP1oEqwyAl9PC67suOjhxpzx069
X-Gm-Message-State: AOJu0Yz1Wm91nYe5LnqyakiZeDm+7/UXDjO9VvQFe1t0vPcAs9+7OS1u
	fqMzDo1GWFAIjmQco1xtAVnSsHneTf9mIawLrquP1i+KbpbUAlLBwniKDHVUxkY6A2ioc2OatZl
	cZg==
X-Google-Smtp-Source: AGHT+IHUNo8cvfMfJNAVfAe+BtdbpT1JP+r7S8PiEYjzPEdLVkTG1XyhCc3cwbOFMzIaHwj4vfyOysmUIdw=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:2b91:b0:df4:a381:517a with SMTP id
 3f1490d57ef6-df4e0905878mr221333276.0.1716339632667; Tue, 21 May 2024
 18:00:32 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:08 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-23-edliaw@google.com>
Subject: [PATCH v5 22/68] selftests/intel_pstate: Drop duplicate -D_GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180034_612477_D432C4FD 
X-CRM114-Status: UNSURE (   9.60  )
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
 tools/testing/selftests/intel_pstate/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/intel_pstate/Makefile b/tools/testing/selftests/intel_pstate/Makefile
index 05d66ef50c97..f45372cb00fe 100644
--- a/tools/testing/selftests/intel_pstate/Makefile
+++ b/tools/testing/selftests/intel_pstate/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-CFLAGS := $(CFLAGS) -Wall -D_GNU_SOURCE
+CFLAGS := $(CFLAGS) -Wall
 LDLIBS += -lm
 
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
