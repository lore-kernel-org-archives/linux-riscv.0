Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D8ACD4F3D
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 15:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fuTpqps1nvGcNeJWGi2UOBPs1l1t9w9v7emw/qk+rzQ=; b=O+B1fQFLrueJC3
	LD/bknd+wDHCbv/+KMjnoP2eDNoMDGx+Zp+cTydrwFhEOXS6mEdxescx5aoB+ks4LNrmuyU/hj+1A
	VbwqAIPRlPKNvwiu4R7L+yadsvHD6LOkhYXGOQGGJu1Xr1zxiU0+b4XwqruBnYENH+8246IHZsuZN
	/UssRnGo6C8OaJbkl3wQHB6MNUO2ArcQOPJ7/I/mVBqhvBd4kiKIGpcrsELi3mPyjGPcurantugdy
	LaTYahDmg7c5TM8JXBdTXCCURCDKT29kai0jjtbMjp8420qyvqvpSitfkhXtee6XhlrCoLCa2gWMt
	AIQq8ah9W2d8c13JmTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjHI-000000054y5-0RaL;
	Wed, 20 May 2026 15:56:12 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjHG-000000054x7-0Zcf
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 15:56:11 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so73625895e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 08:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292568; x=1779897368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HX7UJhkeQ1tHA49U1WBUw3k6TwCuDc8sNoAYzxEJmV0=;
        b=Pyo3bZPVB/OnOW/yUz8dVBnxvOpUwq0CtTtgd3Yuik1LBEpJAqhZa+rpUDJbdEJIt/
         jB0S/71HoVAV1DcsyRVHODiJM0OCFuDDEQ7we0thjZ+S4Kzw6LA8gdmDcvpCFEFl70sa
         DoiCthmMPrGoiN0VYFjixpdwmCdT0GIvoqx9WKDg8w4CpSHVcn9E9GzGSABiv28hwcDk
         uZDTZTA7cQZ6tGdvZbQhUKww4ZRROAXsVMkTRNvzV6KW5Wc2kSu1qVZzP1LcRQsNEjYE
         a1r5D4Bzrdc9pMCES9GR+4r2HTeyI1iNl+8oX8XIGA0sy88DSOtRoS6A1YNNdz8mC4fE
         RLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292568; x=1779897368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HX7UJhkeQ1tHA49U1WBUw3k6TwCuDc8sNoAYzxEJmV0=;
        b=aLF+gqa6IzfIGGLdvJ5Y1+elOaTfEj8urwTkGSsWfrvRm+15C7M9tHj1o3EtEnUP1g
         7PNqnfS2MHeUEWIrpwpHm+c/zVXF4jxxFW6h6jZahRZUF4DYH2YIIPKm3Cv88QHlXRkI
         8p8E6hAudoXCE/EJ7tuiHg/wnD2FGLfz3NlGGXZ4+U/T7pMAYr3udywfzANSte+dHCjp
         wgIMdYK1OsKchcglHzL2q6BumCG6b2L0uv6/g3oCMg7MSHaV/VvIzl/4jT+44yeIrbyn
         rq3g52i6zGdTKOcog4GkYet66cvEjfuspWhX0eCn5ixUMjF4ZNc3ZsfWHgWJRC6NVGZB
         pXnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LIokCaSXiV2En/PRh/XZ9FdVUQLamH4ZuORkN4nS1VWcrO8EwRVUw7mSw6WZxWon4js/pkTz97yIscA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYOmjSUBh+n+UxVwbklPkWbH+kbeO8+Rf/p18fGaumglCY9iJv
	lNJl3VXoNlzfZVqCTgsZ1rCZA4/UCvxpTfzvSkX9f0M1lDn22s1ySXvNL90tKDwIM7g=
X-Gm-Gg: Acq92OFp4S6QeObcj4jzoiyKk/Tp2tBC5edkhgS/QeHTxe25w+buUxihB6aSOIumMaY
	H3qXuMqkIvVK62l90PSQBpyCPH6oU54qDHPF47Jjo3eSYazbY3bSqe9StKVyBKzIN/2Py8ODm3J
	2scVykPKdtmoXMhYyy+xblMV2JBwMH11Vo1p0ZV8usBBTzc4309gdWjOGRf3TEmijVNt8DljTUm
	FBmYfwFUlxOsVeLoW7rzFvs8DTcbQFPz9iFAVHdmY0si7mJaIxLEgav9Wuc0AzlYrqjzi49h5Lq
	uGWFZxwZ+poYfaVGrWoYz5uzNdnwsRy29c+yU3mBSjj943GyvK0cGFhcy1FD3wADigENCAy5QI9
	PERx9or56YKRBiD+wP2ZW6MtbRfe9u64jRbxT1R+AgtOhAa8JnRO5luAAQFSegsSiCMiMsbiHL3
	p6T6rLIcYhuZ/NxkkGgIIi2owdazbPeJCTz/HX1Kj8mnO38rBdpO0b
X-Received: by 2002:a05:600d:10:b0:48f:e230:2a21 with SMTP id 5b1f17b1804b1-48fe662fd6bmr313080955e9.32.1779292567661;
        Wed, 20 May 2026 08:56:07 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([89.216.37.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feab290e1sm215565025e9.2.2026.05.20.08.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:56:06 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kees Cook <kees@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Andy Shevchenko <andy@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH 0/2] riscv: lib: add optimized memchr() and extend KUnit tests
Date: Wed, 20 May 2026 17:55:29 +0200
Message-ID: <20260520155532.1139471-1-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_085610_193770_B1E01180 
X-CRM114-Status: UNSURE (   7.99  )
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

From: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>

Add an optimized assembly implementation of memchr() for RISC-V.
The implementation uses word-aligned loads and Zbb optimizations where
available, with a fallback for non-Zbb hardware.

The series also includes KUnit tests for functional verification 
and performance benchmarking.

Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>

Milan Tripkovic (2):
  riscv: lib: add memchr() implementation
  lib/string_kunit: extend benchmarks and unit test to memchr()

 arch/riscv/include/asm/string.h |   3 +-
 arch/riscv/lib/Makefile         |   1 +
 arch/riscv/lib/memchr.S         | 126 ++++++++++++++++++++++++++++++++
 arch/riscv/purgatory/Makefile   |   5 +-
 lib/tests/string_kunit.c        |  53 ++++++++++++++
 5 files changed, 186 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/lib/memchr.S

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
