Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5DCC30653
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 00:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=J33BsDuecj0q07Myn2CrNrnHHCwSzANl9cPz3JYCQas=; b=y61u0m3qkz76v4wMT/AE5iyaoU
	PyXMKHRQTcdFTO6OnaXfZLhtcaaAEtkl0JqiG3GiKsTWT8fc2byu5L1DosfmZxDaGiPwHnTnLZeYh
	ZQFj41/rvUePBqLoDgKnqbO8a+spGsl0rfkK7VjgFJNgx8aLpKYRSDy3qPG/BBzf5TevYJTCPQWnZ
	U9XbI77Sja8kmEM8t0IuJ8w79K2jKgVQdeoocZ0VmQkF+BNz447mH9r7RvAbnsIoJVU3aNy3kAqvO
	WZDYPn5j+IQTsqM/xOIgy60zqgdZTIo4u3zPYXYC7AH0Wcg3xqBW/4iinsU/uaurT7qsqyVlLZtff
	f5Ur8utQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLu4y-000000016EE-2pIs;
	Tue, 25 Jun 2024 00:30:36 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt8I-00000000yZ5-3dUE
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 23:30:04 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1f998f5e5fdso52769985ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 16:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719271797; x=1719876597; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q/nRYsPHuTaGMizrWA3B3ZZLI9bMolsQdLa0Lqckx8I=;
        b=BAbuJQ2Krka0OKjyrgluc66ZhC3iel1OT5P4ENfUMz69LTkolNgYf2k5tzvMdLVl0N
         Hq01oMkVwWh12BhHQLPIz+Oy/tsoy9Y4r48SQYqMWmjNjxcafop0j3nUIkLdESy51kDE
         CAXDydjLfAL7ktIcgZ6M1zprqzmEFCSP2q1BdpQ4+zIpWiQmcm1HuCPdRVCFYT6OmJaG
         wqirxCD+thxMMgHV8yd3/3ZrB5ikmJeXgG/Z9p3aJeyMcMMoW3GCictF0VGg+mOr2rmH
         mTYTEslP9KLchSHkWAY8sQg9wT29l9s/mfmqcw9aoFdM7cCLhacBB5HWc9b1wbMBBLfb
         Ue1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719271797; x=1719876597;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/nRYsPHuTaGMizrWA3B3ZZLI9bMolsQdLa0Lqckx8I=;
        b=U6OKj9A1v82CZrcIKUs5vIhWnPv0wMaI3NjR/9oePh9rMx7dIaXpULkXIIRrRA4CHf
         SSB4DoGuz13G0mzAVXogql968JWpP2a9yj9PyMQLi6RE0AJwiD6Ky8rK7yLhE+7xU2ME
         cwrClGWsKAZUywDi2NIRA8RQb5EwK1Z6pX0Vr4DtFg7yBhyqpZguFFyjPcMJaAgdi5r/
         qappOf7D5grSmM2z7lVzxRnOy6yQcy4qvNSK42VcJ4B294ciebBUKzFQ1e4Uug5PKuNC
         bF7lBleawlIYlveomtqJmAOnM392hn0Kde5udVGjE1jjvd/xyHwN5xQ5Q11kv5jNmOxS
         4znQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbUPVFf0TMB2Paw1bkn2VywRNTBC0X4feCSL37CWOWKEKF43nK6ol3hblxTsNqnCmMo2lvJptzpCs7cvt3tVD59K7PGSFn8TKacsz/uscI
X-Gm-Message-State: AOJu0YxG4pTz/MjJnH0PVMmMd8tW6HOh4Z4lGxfqjIMbddz6+n3rVPsa
	1w0OxKabi2iXZ5vn+N95gw39/N2gIn2eMiHvl9m8+lFWQYrhFvEEmocGSFJ9apO788xyjEprASc
	CIw==
X-Google-Smtp-Source: AGHT+IFZmU35y+9sHVYjgBtLmkHsjpVEfz9mzouhtaAmWQwnWgKPMl1MuSAOaM0VtiMXYbYfw881ubbrmb4=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:f707:b0:1f7:3170:5c4 with SMTP id
 d9443c01a7336-1fa1592da1fmr6098675ad.10.1719271797169; Mon, 24 Jun 2024
 16:29:57 -0700 (PDT)
Date: Mon, 24 Jun 2024 23:26:20 +0000
In-Reply-To: <20240624232718.1154427-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240624232718.1154427-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624232718.1154427-12-edliaw@google.com>
Subject: [PATCH v6 11/13] selftests/ring-buffer: Drop redundant -D_GNU_SOURCE
 CFLAGS in Makefile
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
X-CRM114-CacheID: sfid-20240624_162959_427743_9B4452AE 
X-CRM114-Status: UNSURE (   9.87  )
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

-D_GNU_SOURCE= will be provided by lib.mk CFLAGS, so -D_GNU_SOURCE
should be dropped to prevent redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/ring-buffer/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/ring-buffer/Makefile b/tools/testing/selftests/ring-buffer/Makefile
index 627c5fa6d1ab..23605782639e 100644
--- a/tools/testing/selftests/ring-buffer/Makefile
+++ b/tools/testing/selftests/ring-buffer/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS += -Wl,-no-as-needed -Wall
 CFLAGS += $(KHDR_INCLUDES)
-CFLAGS += -D_GNU_SOURCE
 
 TEST_GEN_PROGS = map_test
 
-- 
2.45.2.741.gdbec12cfda-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
