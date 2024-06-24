Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4220C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 23:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3+K/RyJpUiMRqGnnoaTMj40PF3P/R+FdjdNwKA+x+MM=; b=fa9uruLaGMNQRr/wEp1I4uBHlw
	AZLJ5UrAJCprf7SA3QsbqHsbCMlqShW3T8oQVkkoMQgJAqDD8aTR7UnlyPqg8Df0YznPlqmjHnerq
	plWLX9VBXuhFu59kcVmSnm4BfdoIoYYcM75+1oj78tN8NSGzkZFV6a9VjFKYvr2EOW1mw7xbVBhVF
	VHvj5R1KDQCPzMaSJ/PV8BHK3Yget+85e6yg3zNXWdsQN048ods87e0D11bn+IU3xA4mDAHMRgnHT
	L378lrJv+dE61pqG1vbgzfKDmGWNZFsnxwy/99UX4osh23Nu1/j69F4Kae5tQUVQjfgMZa8v3pPU8
	hlLOamjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt89-00000000ySP-3Jqq;
	Mon, 24 Jun 2024 23:29:49 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLt82-00000000yLJ-26k9
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 23:29:48 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7065df788f7so2244727b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 16:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719271781; x=1719876581; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QrZ+5Kk2oEbgMtgXaDgXkxLOd4phuQ+pRNBukp2bFkg=;
        b=o3HQ/HBve9aValR5WDL+3zxPMioxy5+MhFQwi67dDp1Jz2UpoFknWMiwJeJuTteQYL
         txeu0S2PMlfVLQ16bAnIS8pld4s3ot7unkQkjfEeQbzuaXFZaQdC0dNx4agQPuQjlA8H
         GcGtf8arbVjJ25VjzC75CwWOmVkwbOlB8PqQvCp90RaQkhBDv58AWp1jZflBcklI7DIy
         ZEBO0kM4GfNDwMInQEpUzkoA5ZMfR2AU2B38KtRj4sYFLLp7TjZITn3j9dmPZUn+KfZA
         HqEvylgQHK1g9VA1sjjm1HUbb7fGn9b22/exIXxHY0sp5NKneKxV3P84sD4O49Dqbj7U
         aWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719271781; x=1719876581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrZ+5Kk2oEbgMtgXaDgXkxLOd4phuQ+pRNBukp2bFkg=;
        b=I0brwQe5DzZokZK0XA7KPi/oh++3pFLKASg2R8/vnqDXS58IsYaZrx84R1WqyYeop+
         s031u5thth6EA4TEyEQEK+HW7wBmqdnU16Klxjn9wM6GAqBoOZTIssFNk+RuT4z4uQ8H
         A86/WIuwr1KxMpQZQTgghECkJuiFzU8EDEmsHgbh4K1y2ZgloS0mEbK4Em4MWh/6Jaa6
         k1ODzjrPbR00YGGGo0CHEeCtWLQhc17VLM6WOJHJ3q2kmGnQOa9HNobYNBAJBYw5hxb1
         gLSxallsHsFUIpbUGfjF6xRgetk35Iq8tisE/XavqvRX3/Rf5HyyChXNuZ/FKYLSiZRk
         YFDw==
X-Forwarded-Encrypted: i=1; AJvYcCW0ucKWmRS20B+6RWs5iaiHrTOcdmM4Jv2gYknkHDAqbVRau2xrFLk90TQp5Fif99HzZ6luovmT9XyB7+Dg6ua6Gm4UhXoc66rj6sVaojlF
X-Gm-Message-State: AOJu0Yy3B81rZ70woDtjTW+4Ejw0zMQUqVYGT6Sg1WHh12fy5vaktiVL
	6KRIq6vFwG8JEGiQgTHysmwuqIA3Vutz0zpNYCU98fsRnOpkYnCsjengQSQwkzaCHZ4TEZsGPde
	P1Q==
X-Google-Smtp-Source: AGHT+IHpQrIc85Iwvne/JtUL74k7CtaEnEbXK9UND6RiBewc+A4BXz2SYDvXCOVunV74/hhFEZKy/c23brg=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:4309:b0:705:d750:83dd with SMTP id
 d2e1a72fcca58-70669e5e132mr244774b3a.0.1719271780764; Mon, 24 Jun 2024
 16:29:40 -0700 (PDT)
Date: Mon, 24 Jun 2024 23:26:17 +0000
In-Reply-To: <20240624232718.1154427-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240624232718.1154427-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624232718.1154427-9-edliaw@google.com>
Subject: [PATCH v6 08/13] selftests/kvm: Drop redundant -D_GNU_SOURCE CFLAGS
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
X-CRM114-CacheID: sfid-20240624_162942_889369_8A804B05 
X-CRM114-Status: GOOD (  11.09  )
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
 tools/testing/selftests/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index ac280dcba996..4ee37abf70ff 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -231,7 +231,7 @@ LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH)/include
 endif
 CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
 	-Wno-gnu-variable-sized-type-not-at-end -MD -MP -DCONFIG_64BIT \
-	-D_GNU_SOURCE -fno-builtin-memcmp -fno-builtin-memcpy \
+	-fno-builtin-memcmp -fno-builtin-memcpy \
 	-fno-builtin-memset -fno-builtin-strnlen \
 	-fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
 	-I$(LINUX_TOOL_ARCH_INCLUDE) -I$(LINUX_HDR_PATH) -Iinclude \
-- 
2.45.2.741.gdbec12cfda-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
