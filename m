Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97437C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 01:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7jnZ60BKIgFvFTYM6xKByks68p7sqIX7eChPO1tfCQ=; b=WVw9lHdenL6GdD
	f1Y1m/5mh8NbJCZ6oTWf7RgEh7WXp/iZOcbK3H0RU3oEKR6+rq9KErNjWNsjFG479gDtykGOCO0Z+
	jon0zIog1alVjaspf2UzIDU7Ajf9ed7/XDXxi4Xb4iDK80QThv+ZyFPX7izUeGkPqfo2kNfoZZtkL
	LPObM+3Rbf9AQLzauhRkn+h+QqHYTRxU5cfmRhFsSxCISr2Wtyx2qU23RyFE8MD7isW4p7XjOir/N
	j6qLB+Eo2Z0G8dNAWwd18w4Qk4+il5IJm33mXKAfkfHzpjJ5mFaFjJm6zeCquJXu8ly/EhddEJVwE
	5XDgs4W7BPSxIUQ2OCTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4u5D-008umz-VL; Tue, 13 Dec 2022 01:27:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4u5C-008umi-MX
	for linux-riscv@bombadil.infradead.org; Tue, 13 Dec 2022 01:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cl2hz2Xl0INQZgi0/FdsZaZQh2aAYVKtm1GOrQ0BNuA=; b=Iclve46rmpOUIPUu4X4Zy6+68f
	uRfmicK9pWsltUkmG2QN0lkhFQbFOEE8pdOfpHgAG3RDjQez++Ky4ms0JwrvZCeHxBdY6d+QWM8qZ
	0W5yBiL2UbME79pQ/QqsThnuGEFBcFiYOsS8+Tz/sbbr8G2N08V000Svgb6yq9XYJXWiUg8wzrOhh
	X6HVJQK9pLmDAs+ZgLh4SKLBAIGRlWIvMrW4OdvZkEjOpvYsJFNMNUi6QPqikIr40RkT6SwsAYbtO
	2PRr//rpiYXDBAnU0Bhm6nuS5+Q68v+auTxQOM+87PusM5SG7RH0nb3ucMyFXvGKTng5NVSIc8c9+
	2NZfJA0g==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4syw-009w6R-My
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 00:17:18 +0000
Received: by mail-yb1-xb49.google.com with SMTP id a5-20020a25af05000000b006e450a5e507so15037115ybh.22
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 16:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=cl2hz2Xl0INQZgi0/FdsZaZQh2aAYVKtm1GOrQ0BNuA=;
        b=qtuKL0chntBw8WmvJab1K7kXx56vDxcM9Lz3Ed1k66okiPfskMIfRbRPhkpYl+zGcP
         mkp5v4Xa7xKSkNVTIU5I70auAIKnC0QeyzQFPgSFF7WWS+tDOctc4tDRG/YuUfhAOX4B
         t8ijgFRQsDMni3C+Sb2bEyRHhRoH07jF7n9YtSS4rtkdGTPQ9kigYoTmO1aL/fn/jywD
         tNkEscjQPz0T4cqIQReHVuDH+sIuUu9AxFpVApk///ScvT5q9609eMJOQx/F3P0B5FVO
         7yKU4XPqBRk3J8E/xxsYrzOoSaTZobfNQITHw9pavl02O+kx8NUkPc5JhtHd2UP0Zuz7
         2pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cl2hz2Xl0INQZgi0/FdsZaZQh2aAYVKtm1GOrQ0BNuA=;
        b=hP5s9ZXX8YwVtibu/zQ/mmJeisG8jXL4otG9TGCXJsgKlm4yRTEnci/uTM84urk4yw
         grf6eEw2E5No+C2MWhrKFdcXzKnMgbLCpJzU9Ns5rwG9H2foD8719xo7rtgoizF621cm
         DX2zhPDpqP/pU8ERYW+CcsO8bzaQzK5Uelad6ep34YNJle30/EzNDxdRNpVNUx4wfrnd
         ZgEvU+bzN4ZJDsl5MIPgkg5dUzf2pCBG6Xd8K2b/B9bQ58NRe3m9RBfX4WvBZXfoKWmo
         P/vXu5m0xewjSWqXhGZ3Ffn8fJ18tloqP7OUVawZKEDAYIwMz0YXznWMCb/qgl9WJ+Dz
         g6MQ==
X-Gm-Message-State: ANoB5pl3M710vIu/jSrZ1lLCZOv7JOFa78bk+Sv0kjpmYx0kFU4JgDZD
	RhMwRDFSfcICnP/F0rcvuXyP6zjLQgU=
X-Google-Smtp-Source: AA0mqf5PAbtMk1FlbJUnxb446gjQZtpZQwbl0k154cV60HQy1+WGqGPPTBe02uIxBcfNlX5eyXkFbuPBOrQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:3303:0:b0:6f0:be3f:26f0 with SMTP id
 z3-20020a253303000000b006f0be3f26f0mr67005598ybz.512.1670890632080; Mon, 12
 Dec 2022 16:17:12 -0800 (PST)
Date: Tue, 13 Dec 2022 00:16:48 +0000
In-Reply-To: <20221213001653.3852042-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-10-seanjc@google.com>
Subject: [PATCH 09/14] KVM: selftests: Explicitly disable builtins for mem*() overrides
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>, 
	Sean Christopherson <seanjc@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_001714_920108_EAE261C9 
X-CRM114-Status: UNSURE (   8.02  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Explicitly disable the compiler's builtin memcmp(), memcpy(), and
memset().  Because only lib/string_override.c is built with -ffreestanding,
the compiler reserves the right to do what it wants and can try to link the
non-freestanding code to its own crud.

  /usr/bin/x86_64-linux-gnu-ld: /lib/x86_64-linux-gnu/libc.a(memcmp.o): in function `memcmp_ifunc':
  (.text+0x0): multiple definition of `memcmp'; tools/testing/selftests/kvm/lib/string_override.o:
  tools/testing/selftests/kvm/lib/string_override.c:15: first defined here
  clang: error: linker command failed with exit code 1 (use -v to see invocation)

Fixes: 6b6f71484bf4 ("KVM: selftests: Implement memcmp(), memcpy(), and memset() for guest use")
Reported-by: Aaron Lewis <aaronlewis@google.com>
Reported-by: Raghavendra Rao Ananta <rananta@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index a6050dcc381a..6594ed51eeea 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -191,6 +191,7 @@ else
 LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH)/include
 endif
 CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
+	-fno-builtin-memcmp -fno-builtin-memcpy -fno-builtin-memset \
 	-fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
 	-I$(LINUX_TOOL_ARCH_INCLUDE) -I$(LINUX_HDR_PATH) -Iinclude \
 	-I$(<D) -Iinclude/$(ARCH_DIR) -I ../rseq -I.. $(EXTRA_CFLAGS) \
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
