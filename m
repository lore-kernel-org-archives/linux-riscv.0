Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62195C30653
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 23:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Hn9+uMTlJIRO+RCyVU+vkrp7IpBZsDGFa+i5Z2DTDr8=; b=RH457jgnUINiXZcPjDwG+CvjBL
	YT+M7DIky78OgeswvWowkYXqpYa7ASU1KMC1SKxfg5eOFZktn1CM1lIz5X8wKPQJdV2dVuL7T4+/E
	9k4pQ6GQjS6wxayax82zWxfmjckOaDzufTYpzsK8AgkVo/9dOBPZsTLOwVz0jKJuhVhC54nlu8YWF
	JusO8L8hqNJwlrZNIGmVFyWMb8i1u0Y23qm/qodOxR3OqylYjLQSftRlPyrjIGYIlut/QcJDyt+ky
	GS/rLSNTLZLkoODllf0womcEmg4Wha74e2++4DzeW/1zoH5b5VhXdisiqKFty69txhsaZmhOyUoXM
	y1B2nOOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt7c-00000000y0q-2pZs;
	Mon, 24 Jun 2024 23:29:16 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt7a-00000000xxM-1hqP
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 23:29:15 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e0322e5d0daso452402276.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 16:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719271752; x=1719876552; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KYsd9Rb/6WE30YP2UPtx0BT+t/C3MbQ4dWAZpecv6Gw=;
        b=E+BjRWem4yYFSsGG2O9aoytiqQpfd9mDNwrCESr9kv6OTWlb/hMN0WQzlaXWCxIZAI
         yw6xOaGl4NZY3nGkRBJxY63YnDL5FNAnh08euzO5V4Hb8axxzDDRgYH8Jb8ETAfVhQU5
         p8nf0xBmyOOfY4gBIsAA2dpd4GgS/8qwEUGkz6uA01SffOi0YrO0jBFotBdAnmzyKMRo
         KN7iPfXZkbUkBRhZXjtwgRV0U+qcc52b5RkqHpcHelP2VhzylKKdhDmeVyUGP7KsRcBt
         4zwrUMCkHIS2d+3pghAWh+8tW8YKm3eRKAYHRhHMnl9Tln+3t1UvGrvXHOZkHGgm9OlA
         FZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719271752; x=1719876552;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYsd9Rb/6WE30YP2UPtx0BT+t/C3MbQ4dWAZpecv6Gw=;
        b=J/bCtyFwHVFjlK9NFtHOx1K6imqfkbvP62i9vNg290Hc7vHE0cvnzgpK75MbiDuu0d
         NA85N7Uro2zf/x1lSf7kGLYy3ped6JmEeSqL8SDsY6MemAAKe9WBFGrG7+rBjXzuPkaJ
         bdu37JiZptqjZGB+tsNkpF94GCp9d3pLENmkMldeshkGG/QitOgtNldDSX6zlrtH12Ui
         NOEN2+ZMKSPK9sNQGQEvBs+BOmFsS6KNXPcK/bEjIRT9mkq4p2yjpeySl5sV8oEFyJ21
         u+wKcs4eoLgYLPr3Az9hqVQ3quwvbiZ0SufPv3fn+uSDWS4Mv3zSsT1IKL2Js35DKRvB
         FBtw==
X-Forwarded-Encrypted: i=1; AJvYcCWjGl3znSnhO71dax6beuXFkx4t0s5Dopl5eIqwxNBpfD+gcG0G5OGpr9a2ymyoiZSP2Li13PHDgg1hMhaov+DhxBgQHxvpP0xrry+sBFdq
X-Gm-Message-State: AOJu0YxPnq8+/mOi3CZMQU1isyc3ECRGR4GG0d4/jXqUqsIIie3c0rMI
	xbEwxh8/GsWb8P1lWWKzlNwXtamEKucatZddpC2AWijTjEqyPYsJoLCPsoFozu/WmMXGHDd0TA8
	+Xw==
X-Google-Smtp-Source: AGHT+IEFOOflQzV3wFuvM2R/hnljfPuosO3Jiw9JP4M4awREYhPcttpeymh3r0w5dseA0yzpFfUKTbd9tHI=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a25:aa0f:0:b0:e02:7c5f:e0d5 with SMTP id
 3f1490d57ef6-e02fa00e04amr59299276.4.1719271752514; Mon, 24 Jun 2024 16:29:12
 -0700 (PDT)
Date: Mon, 24 Jun 2024 23:26:12 +0000
In-Reply-To: <20240624232718.1154427-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240624232718.1154427-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624232718.1154427-4-edliaw@google.com>
Subject: [PATCH v6 03/13] selftests/net: Append to lib.mk CFLAGS in Makefile
From: Edward Liaw <edliaw@google.com>
To: linux-kselftest@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, usama.anjum@collabora.com, seanjc@google.com, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, linux-mm@kvack.org, 
	iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sgx@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_162914_523983_11BED7A7 
X-CRM114-Status: GOOD (  11.37  )
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

Instead of overwriting the CFLAGS imported from lib.mk, append instead
instead.  Also drop -D_GNU_SOURCE from CFLAGS to prevent redefinition
warning.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/net/Makefile        | 2 +-
 tools/testing/selftests/net/tcp_ao/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index bc3925200637..8eaffd7a641c 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for net selftests
 
-CFLAGS =  -Wall -Wl,--no-as-needed -O2 -g
+CFLAGS +=  -Wall -Wl,--no-as-needed -O2 -g
 CFLAGS += -I../../../../usr/include/ $(KHDR_INCLUDES)
 # Additional include paths needed by kselftest.h
 CFLAGS += -I../
diff --git a/tools/testing/selftests/net/tcp_ao/Makefile b/tools/testing/selftests/net/tcp_ao/Makefile
index 522d991e310e..bd88b90b902b 100644
--- a/tools/testing/selftests/net/tcp_ao/Makefile
+++ b/tools/testing/selftests/net/tcp_ao/Makefile
@@ -26,7 +26,7 @@ LIB	:= $(LIBDIR)/libaotst.a
 LDLIBS	+= $(LIB) -pthread
 LIBDEPS	:= lib/aolib.h Makefile
 
-CFLAGS	:= -Wall -O2 -g -D_GNU_SOURCE -fno-strict-aliasing
+CFLAGS	+= -Wall -O2 -g -fno-strict-aliasing
 CFLAGS	+= $(KHDR_INCLUDES)
 CFLAGS	+= -iquote ./lib/ -I ../../../../include/
 
-- 
2.45.2.741.gdbec12cfda-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
