Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C54EC25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vhjU1OFf/6v9PcdQaQk3fOz3fyTuHLhQVjwQwFtlM9c=; b=uizA0bYqb/I4aX2mC0uxtZKfZr
	dZOgOcU6T4rshxTrkv9psoL6Co0S4X7ah9nNDogoVnVc/na/yklqM2KzJUIWKansM+nrJx9T/gNXS
	WfxuiagboTstI6Oz7OHC99sGRL/u7t2ACTQeP1U3jMJRAdbHFkWKPQLJm+S2cNZ1PKfxodf+7s+f2
	tqcJ2PHHclI+LfZXtvlXG6W58Y6L5AkG6g8qOM1aLrwzT1K0MYIVMIpWTmo5sJbR6NgarbVYEPn4u
	THcHPj4o67Ihf3F0LdmU/DhI3hfUpyU7kAjxNiwrmsfcT1DbT8NX0VtDQBePDOlgjmFiwPUfNEhLZ
	KsaShYtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aL6-00000001TQ7-2KNw;
	Wed, 22 May 2024 01:00:20 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKs-00000001TEP-3qzd
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:00:10 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-61bed763956so247360557b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339605; x=1716944405; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0lmQNJORVSfCUFFoUd1ViMTpUw9e5KrZZN0Cex2QGeo=;
        b=QqiKWHRiPQlU4BEKbuC4NkuMnJNBCLCiZP8tHGKy5Y7fLWOEM1K2Z6FMERtot+CdiB
         dEICTu72wpKNunq8wSs7bChB+UYMzmHpRp5mKu4IJO6mXB7JW35elKidhCMCArpKRrM9
         I6CZmrfPBw0h+2RCj9c4YJrKvw8pFSOOabmaPnbdIyzbdkpzNhQrgnASN3rqnZUmrkar
         Fs0GFtPNA4Vey9gHXrVhiJ3b/y6gw/GUA/il6SvhdVzWd/1zRtOH7sd2IjmRzFCB6kqB
         BI2CeCEg6U+3kep7nxaH+IT1Jkdsbg70mtj9ZDbRVSsGzAX4BsamLrGEn6iwdZKyhLp6
         tELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339605; x=1716944405;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0lmQNJORVSfCUFFoUd1ViMTpUw9e5KrZZN0Cex2QGeo=;
        b=YGyiTBc/u6ABn3qyodaoh9xBXWGArZFVx3NmGemoMjOvEgbEei07gfGyWSvwbhlDGj
         T35YRuYj2P2I3G1Wms5QKNPNOAf90D1psOw59Xy6EHqyCubc0dAWDRtUbCpU8MhmgaGU
         lUgXkFdZvGOhd+KXw7zitDLyfviE0HaPnALabPGpS+Vaua1peSpdQiIQ7Qr2F3QcXBLf
         k0+xAPoevnWSsxoYZnw2NU0FPsGE5gVEpbWtfi2+gME3RJRWGE0MPDhL8DEjewYeSbk3
         AzKlgA8+5ORv0wmEUx9BQQIM3dVpKI8CZt3bm6hWi/q7TW+JUDIrl1bvLZXzQBk06FLZ
         Ml9A==
X-Forwarded-Encrypted: i=1; AJvYcCWV21qafPCysiPzayXIOWXjd6X4ziokwqmklJ9rMhvzwjOb01hSVBg6+nDO7mx8wdPeTbeN/weUahHdm7TXJpAocZRrHttVPn24PUtFkvXL
X-Gm-Message-State: AOJu0Ywt17XyPdrmT+ANNly+6LjkQRw2c3Kzh/kVg4c58u6tQGHAKKbR
	nXWFnmvhKEP3eRoZz1moLKnJXxoqihQ+pKuTwlbmbwt0HcN7h3zIj0uMBHFEtzhIqerbW/pajeO
	5UA==
X-Google-Smtp-Source: AGHT+IFHbotlZv7fBN3ho5Rqkkq34fEhQTmj5VOO1FIjb4w3cqdjQsyZMPao6gSz2IdVEby5LAMyjSIG9hg=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a0d:e609:0:b0:627:d549:c40b with SMTP id
 00721157ae682-627e4848affmr1773967b3.5.1716339605428; Tue, 21 May 2024
 18:00:05 -0700 (PDT)
Date: Wed, 22 May 2024 00:56:57 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-12-edliaw@google.com>
Subject: [PATCH v5 11/68] selftests/core: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180007_286716_6645DFF2 
X-CRM114-Status: UNSURE (   8.63  )
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
 tools/testing/selftests/core/close_range_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/core/close_range_test.c b/tools/testing/selftests/core/close_range_test.c
index 991c473e3859..05781c7fc578 100644
--- a/tools/testing/selftests/core/close_range_test.c
+++ b/tools/testing/selftests/core/close_range_test.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <linux/kernel.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
