Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF151C30658
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 23:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lpe/EDakcv8/MkXAQ/Q8HGsK3HEcrKlWn5SWdqPCjzc=; b=zDhx/ZcGvRPG13QWxmNaKl6HUr
	ACH/5ZECn8FHrHnOiD7+Z4mnBTkcO3MnaVdNf6/iXXWFCSPlu9jXQh8KmMCX2AMigVHZgky4JXF1q
	gC505UBdAORigzcwKCUB2u60kFgQJ2qEItl0MoDSxYKJjOp4f35l7grqYdYYR0O6U5hFX0dApqSAK
	s577b/Ql+YrxojKeI3VCs/UtgJztTfhKgmuSaDaimGap3KqppC+ob+SXnSvoQVrxCD8A1flJmCf2O
	mq7DeCPR9hKygf2fGc2Htnzfn65tvEor1A7lehqtcXZc6Y3hnL1+Fu415+kbSlwggiJDT4iUjL+GV
	AxPu5IZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt7W-00000000xw1-2sYk;
	Mon, 24 Jun 2024 23:29:10 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt7U-00000000xtl-1dGt
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 23:29:09 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1f9ec9aae70so38593505ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 16:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719271747; x=1719876547; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7F8R5HE+eZyxlB2ebQLwW1FMzverfSOUo2IuXKNmLY=;
        b=pfkAYXp+ZjgEFtEtLOPW9nueYgOyluoXS/OTIwOzlyCpgXOtfKwyu3OcrDhRZK9/uT
         UdFyfRK4O7YJ8/Z3dLiALB6GC9IPM60uIWbbs8CJ9ejFVrMsNd82oBd4n1LqPCmDOkxN
         oRzYVWpTH/mOpeqUjqrApHnu1QpSqWYYZNkd3cMRajBHG247W/w2sV7TdNEr8dZbwSvl
         U3GS/CqTEmMvzoxGTD4ZmgHEv6Tn6rbDpBqb9JreZiRYLqO39XZZAGlhNR8we4X8uHOt
         o2VW0aV/jW/LK0xPveWMDHR/J3Ncunboxxi1N8vSKAakuB1LDHtHfuegB7OuVWgvF+sk
         HwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719271747; x=1719876547;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7F8R5HE+eZyxlB2ebQLwW1FMzverfSOUo2IuXKNmLY=;
        b=lgxTS+bXOuCzf/SfSsdiVo5sz0PyCLqet1DRyYFV4S7GY+qW9xuy8gejzVMKaUeiMQ
         aG/rBBCnY9k3xGBlrvzbvV1QLgjYrXasaKjfeAQDX+bTggR8VS/zfaF4uHyADHBeVKPy
         nRUt9cO2I2VhY3dHK1O1rHdM8ugBpLXSweRu4Wlwj2XMVqgLungdZ4Uri/Raj93dwuZE
         mqdn2CC0O4bokui2x3AzEHJtP3VcG6kOst1v2H5/+WwGlImfDm/ppxkVBtDa1Fb+8qw3
         bAkSurZH5OY1dccC/9f11VAdvt05znITj+S+SpxrzwxGqHMHZDt3cr0K4ldBQD448pi6
         zBCw==
X-Forwarded-Encrypted: i=1; AJvYcCXJk3co9sLi9xgo4OdyDKcviikle6Ia9Sed4WfMsCE6g21GqjgE3XmGJCu/sKyxOzXlMGn8OT/XH8W6o9GfNAQmbsw2PIlrgTl0YwR8hab5
X-Gm-Message-State: AOJu0Yy2oQFvJlHBUA9yUhy8aptKbbn17Ts9pfcKZJacQMDqmo+4CRrt
	8qPRT+qD9f3JhTDSxguL1uripdEmfoOPLTU5qtb3vW04iOtFOvlZSAA0neZKVV1VrhFIgi7RAIu
	A1g==
X-Google-Smtp-Source: AGHT+IFY6zwuM+fBRs+r7yFjUxfbkM+X5No4nRI5eUjSYyy4xzwRR2NKqiye6S+BJr7Hl1+KVMRcw6AW1Us=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:f693:b0:1f7:3763:5ff0 with SMTP id
 d9443c01a7336-1fa158d034emr7382275ad.1.1719271746792; Mon, 24 Jun 2024
 16:29:06 -0700 (PDT)
Date: Mon, 24 Jun 2024 23:26:11 +0000
In-Reply-To: <20240624232718.1154427-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240624232718.1154427-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624232718.1154427-3-edliaw@google.com>
Subject: [PATCH v6 02/13] selftests: Add -D_GNU_SOURCE= to CFLAGS in lib.mk
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
	linux-sgx@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_162908_528106_35088AC4 
X-CRM114-Status: UNSURE (   9.73  )
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

Centralizes the _GNU_SOURCE definition to CFLAGS in lib.mk.

This uses the form "-D_GNU_SOURCE=", which is equivalent to
"#define _GNU_SOURCE".

Otherwise using "-D_GNU_SOURCE" is equivalent to "-D_GNU_SOURCE=1" and
"#define _GNU_SOURCE 1", which is less commonly seen in source code and
would require many changes in selftests to avoid redefinition warnings.

Suggested-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/lib.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 7b299ed5ff45..d6edcfcb5be8 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -196,6 +196,9 @@ endef
 clean: $(if $(TEST_GEN_MODS_DIR),clean_mods_dir)
 	$(CLEAN)
 
+# Build with _GNU_SOURCE by default
+CFLAGS += -D_GNU_SOURCE=
+
 # Enables to extend CFLAGS and LDFLAGS from command line, e.g.
 # make USERCFLAGS=-Werror USERLDFLAGS=-static
 CFLAGS += $(USERCFLAGS)
-- 
2.45.2.741.gdbec12cfda-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
