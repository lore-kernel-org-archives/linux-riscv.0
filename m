Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84B2C30653
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 23:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sJOsoxZROVScCST2EgR/97dQHAGISlUP+fGSdl8WCTw=; b=YmiqWESPs7s2LOoMXL937cjeTD
	/YQCs3ofKAeY0rT+0jR0CrZ0l5VqQ4MUcm8KgIhOYf5+CH+PU6GJYzUMmvSoyCgBQrvGbN8ZsJPot
	QwOMhVa0ijHtXBrHpupohbQw6z+2y21+OQlW9Z5jc4/ylgGLihQ5CuLQgVb64TOiIJ5ac4R6vXBSP
	3LWPonjYvYgZTP1GvReyqi38njJFnfkmxZaJzFj5pfmv3MCtPk6WlR0YkYVBZWCqv6bWWSCiUCnff
	7j6/jVm0TUXSiTkbwPgYj6LWXk8oI6mTtb0OTSpHgrdiIDwBghUTTgq4HNVbnm+wYmKD1Qgm9hz54
	g0iJE2ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt80-00000000yJL-0HbT;
	Mon, 24 Jun 2024 23:29:40 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt7w-00000000yFm-1Qcg
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 23:29:37 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-704d99cb97aso5870040a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 16:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719271775; x=1719876575; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eCJX8+VvSnRphReKqOD6AqEhzLc1OgPwFHKFgJpo/3s=;
        b=UZT+KspGnMVK7H0jTlt97LuLG14H136UH7yLTQBJNBYrYjVrh4RgEOMMeCKkIiE0Vj
         eyI8pPSh5IIQ20pxWef/wZZQhiztXvz60RXk/GsulpJsDH56ZXnzz/RUSIaD/F20HSNT
         8wQXcIiMLzdWXvz593wF1e+oLnnEj27pcACvUJLcBv3fNUwdo4jUGJ0Pjq6+ehPmuhaN
         HSU6idj2yc6zJ7uzRTU/+Gbmx/HDVu6aLeByvoTZgkBVFtCVOOYEPdtaWsuPjDMA42IF
         9s+HhcogjLu+cvqhmTwCVJFw/NAt8Sh7Ar3qPziMcvhkfdR3YgWbPVlbkFaPWSUPbgZe
         a08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719271775; x=1719876575;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eCJX8+VvSnRphReKqOD6AqEhzLc1OgPwFHKFgJpo/3s=;
        b=USkpwF+DFIx8VUYNQFcMNGRBGMitSrPIbCxfVabEW9/pSbHqBY335IMR3D/zhEXCRv
         Gk3ny/UmgHm+H0JcRRw+BE+4MYc14lNgzsiLzU0HgGi3ld4E8zdtV/hLS43ianCvIK7l
         0/L3F7Ad8umSRjl5V7mnweK0enVSwgD6UOWcnLqxXvjc5PK0aYFVJ4XfdBGiiKMr0o1J
         LnyhayclexkRj8RhZazln+eAQyMXXgjtZUsBLCgU+jhndzyL+K6Z8dIC9kKXKPq+dz1U
         mq8HaGx36qEKSI1EOpPZu6jIG/XmcavVdnOvITApvBr4kxAyoa+w2ve3zmu6+PnZv6r+
         8NcA==
X-Forwarded-Encrypted: i=1; AJvYcCX/06E7kimRzo7KwbLWcLMmJG15CNs0nzDFkTRx+XkDNTqcAjamvWu5ikfv2vt7O85ESySTxOFty7qBNTeKkKFqeF8o7GQ7SOzO6iOwPPur
X-Gm-Message-State: AOJu0YwTcO/MEVCB25zVS8nRONtBLFzVKu7Ymex1Yp9zWlAFX7hko5zU
	3GY5B1gqkykEit4x/QP+zoaxWEIv1mcxP7bRaopFHtIOaSszUBVh8ZDcCza+RxtIsk9XD1r1Hkp
	/Ug==
X-Google-Smtp-Source: AGHT+IFjD4+usXw1SHxX9b7ePdUBbw8ZgCP2CzCr9wFCk6wJU6Q5+R81P4uygwELRit2itW6ZnfR1hiEObg=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a02:91b:b0:710:c65a:7e55 with SMTP id
 41be03b00d2f7-71a35642c51mr18906a12.1.1719271775000; Mon, 24 Jun 2024
 16:29:35 -0700 (PDT)
Date: Mon, 24 Jun 2024 23:26:16 +0000
In-Reply-To: <20240624232718.1154427-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240624232718.1154427-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624232718.1154427-8-edliaw@google.com>
Subject: [PATCH v6 07/13] selftests/iommu: Drop redundant -D_GNU_SOURCE CFLAGS
 in Makefile
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
X-CRM114-CacheID: sfid-20240624_162936_552659_6DB87BED 
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

-D_GNU_SOURCE= will be provided by lib.mk CFLAGS, so -D_GNU_SOURCE
should be dropped to prevent redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/iommu/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/iommu/Makefile b/tools/testing/selftests/iommu/Makefile
index 32c5fdfd0eef..fd6477911f24 100644
--- a/tools/testing/selftests/iommu/Makefile
+++ b/tools/testing/selftests/iommu/Makefile
@@ -2,8 +2,6 @@
 CFLAGS += -Wall -O2 -Wno-unused-function
 CFLAGS += $(KHDR_INCLUDES)
 
-CFLAGS += -D_GNU_SOURCE
-
 TEST_GEN_PROGS :=
 TEST_GEN_PROGS += iommufd
 TEST_GEN_PROGS += iommufd_fail_nth
-- 
2.45.2.741.gdbec12cfda-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
