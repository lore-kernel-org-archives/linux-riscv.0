Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF159C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mDYxav0Ka6YRwTo0owyp0X/cjxt7YJKP+LMgA7oAJMk=; b=0ssbzFDJL4eOBaM/Z8vRQ5HNdl
	apYB1Xq0Eshwgp3EpY2XAcbVGJ6tuYqYGoLW0XUsOFmbMRD71EYKBXBD6H7cWwITsrQXVBcerP92+
	nizvGQRg+bMUq6CEpP0bYad1xfbpooJsDZ9SauoL9BDRenL4kJ0R3b6sWsRzDQyc17tSzBzsnBu9Z
	R41hJtCDLJkf3c+rwHOx3/wMWVRZAmGdQHA0tmqVsITievAKWK/oBCRuOygbf9nbiPez1gq1YcVKU
	IQjWPazSJ3G0lV1qvqC0swR+86Y9MojDFGOFqWpfT+yGa5dJFchQXWB6vJGsjXxDLQpjr0xQ/SlRh
	6fiErVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zj-00000002d37-1baw;
	Thu, 09 May 2024 20:03:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yx-00000002cPF-1NUH
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/4YtNx2ds/btNjRumtpOC1sPQ1T7EDCPNUgbL6GhZJk=; b=Y8cJs/2SHzGQyT29DMe1h7D3hq
	/2o2oqk221RF1leyDE83XsPK4DDtz3Hd5twCRY3yJGcwW/wECRQvvo7Gyh04HqmBuYn/IcsE+Bknx
	c2q2WR5TYvSnMR061+uWLbzhSNV5rtHurJg1Vm6oytByKDNoHBckdHs14XCpNHVhGw/L9Odw9diKi
	MKTKBVfD6+jSCi20zKf+YdY7t0NSjC43wEtevnq26BfTOua0B4a9+E8/DIfLiSmwPkEpWpHykmXql
	cIDJIze0s5wxIoxF557nSsPQKHWNBCKu7qVR+/fQJtaQN8Nt2CXVtadvnE73+v9D25kcqbeZDFQl4
	h+BxBb+A==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yq-0000000306G-0Sri
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:07 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dc6b26845cdso1745091276.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284973; x=1715889773; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/4YtNx2ds/btNjRumtpOC1sPQ1T7EDCPNUgbL6GhZJk=;
        b=m99Bjr0x1TXz+5fJDsH3Z+VmUc+71RoNnFD5XCzIyqumK2acOHj8V8LZs4Qi8wAl7U
         YsySN08+1SsRtfjydKZGcZJ1A2Y0QiINfUDK+UKWweOBScD+RxJ3qflnY3o59kbHKI9u
         lQsTVwwJDhaoIlGhIj/hHwh2uBD/kz70URfUFeGP++H34M4P+Ngb398SSz0KwxVfzglB
         R9MQTWuO3soChAChqznn8giy6jrGTskmROak1a2L3+5uMRqkNpkJmTXQ8FjtoyS4eG5U
         DDTNwVckvt+BTJ+U8iJy0D9bFfsLgMoTM7R2CYiaFPIV/JVAXZ4/KqB4QqAWuHMkV6lG
         jnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284973; x=1715889773;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/4YtNx2ds/btNjRumtpOC1sPQ1T7EDCPNUgbL6GhZJk=;
        b=QQVQme3f2G33zNRbPjJCNcUi0RuUHL0MHj3WdHJbMEfCGtCJjvWCc40JbXtzLq2s6h
         DQRLVxEnOjfDt3Phpy6gs7AIhlYitQIWV/pJ5Kmb8t+LZAsx8I5hKA/RFzg8VhL4pcNQ
         Gp6kPNbGm01+nW0KtFEzO1P9+xZ0bmTXyW1XmWtBxxENhNxScTU+JqSUGsV3zYyehJdv
         Vz88mS/kDxgrYZX3GeAGbDzwQDxnESqc2fHeacVJ+b0LNaLEHT2MQnfSR9tp04d5yyVh
         7FoxoUBgyFgFvPzuWRzJAJCJW40P0qq2gsBo6qSM/O/+2RIhITxUHe5jd9+tRnPmcOwL
         kW9w==
X-Forwarded-Encrypted: i=1; AJvYcCWWid07/7wAKVzJEuY6eyHxOF/yEszqBrSzA0pieDF9/wrAqQyr2uSLOJXgUC+TeRlR6J9b+XoVLUVwe8f2URr2weQUMxXRNYZrKz7da6IN
X-Gm-Message-State: AOJu0Yw9DJ0U1xL+beJP/WH8wpDLrmSSiroLeGgnmajI7e6q4djP6UAZ
	Gg/eX+7Qek8gEkvcE9boiGuKvBp3uXiIkmp1uvExhO7v4m/n4bjaRBtU3NNQjszrOc8sSIV8rZD
	YrA==
X-Google-Smtp-Source: AGHT+IEhjwAEZ9srmk6nd+nHtbruz7CGwS3heWa3ViPqupsQl0bknuytB51bhWsROyhFvq739JBd1odb8+0=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:149:b0:de5:5225:c3a4 with SMTP id
 3f1490d57ef6-dee4f304cb7mr138986276.7.1715284973168; Thu, 09 May 2024
 13:02:53 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:35 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-44-edliaw@google.com>
Subject: [PATCH v3 43/68] selftests/pid_namespace: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210304_945323_C22B03E0 
X-CRM114-Status: UNSURE (   9.85  )
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

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/pid_namespace/regression_enomem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/pid_namespace/regression_enomem.c b/tools/testing/selftests/pid_namespace/regression_enomem.c
index 7d84097ad45c..54dc8f16d92a 100644
--- a/tools/testing/selftests/pid_namespace/regression_enomem.c
+++ b/tools/testing/selftests/pid_namespace/regression_enomem.c
@@ -1,4 +1,3 @@
-#define _GNU_SOURCE
 #include <assert.h>
 #include <errno.h>
 #include <fcntl.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
