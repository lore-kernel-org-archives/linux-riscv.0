Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08626CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 17:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OZQOgn3XDXpMbiM4gWdVELu88SsextlhIZ0qTe+pJ2Q=; b=XOpwuYpcg/NtnN
	pXs0RfnWkQ0JO68mAQFONnqZlEtjDr2e2H+93dyfnRkLgwd4PjmWTg+GLREslNaF9GUL9wf2uKDgj
	jTbYGljLrtZ/rkfDlw1pVulurWx9kXOXlqqfzFFZm6ZkQk7zjCpxjJ4eIVKLBAcz9410W4ZfdTJF2
	Op13OmylH8ShAa4odVyYnxVIZ3SWBPbDajpjJuut2bvp5h9ozujqubrvYKJHxSQROCfC1t2kjoKDh
	y9Y3Qd9hk2OkQKvOdKX4ipZP7SJGR8Xc5jtZ/9rOzzBx666FuMSNoDn/q1znLDrE8cwOpbzTYZQcE
	gczlf4DpSa6mwyrQbetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsRVv-00AF1m-15;
	Mon, 16 Oct 2023 17:36:23 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsRVs-00AF0L-1g
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 17:36:22 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1dcfb21f9d9so2925449fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 10:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697477777; x=1698082577; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wPqNuOKCfINBcA4JkEYIZMV2tOMunrhVNGKlfAdiW0k=;
        b=2AIM/VBEIe6XSyQMqAbl6yL1sQj8B5uID8FqYvZ6dVYBymYlQM31xDPEJJNjp0x5qo
         P2gopHMfNGmGslyIq1/TtfD+Fb2FFF6qXHJzRtrpRWh3S7zbM8YAR5ja58pKlOnukgsD
         bZZ1/cTd6SaseW1ACdYjR8xFLZQlfSekx4WHL/+t6AvJOpfydftjJfltvy2PgfIj34Ed
         CYesaAEcIcIZzdht7UjEPbNL5p6JPt8kacsbAlwP8Uen36J/cyNM/L1PByWtNjo04DRy
         9uZdEuPQzHlt3THCbzLR+7Zs2kAdAaUVu5CVXGdo0xow47ONDppoGUcpvTBuyJVoBdAa
         P3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697477777; x=1698082577;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPqNuOKCfINBcA4JkEYIZMV2tOMunrhVNGKlfAdiW0k=;
        b=HaPDkwdo+k+fWOQHg/g5QUeqnLEUzHQ4zoKNNr1TV2jopLSbRs0QE1JR64chq8Tuw5
         h5c5e3boq9ZrTOw02iOjEMSoYgHzO59eAut+ncpc6ct5n0EHwjY6uwG3OkIXbSP3CHbe
         gRTC75aAHshw2gWnaHYb0kD9Wj5xKkp+k6SyOFQ9Q13DvOpW50MiUGf6P7M8ouGzEjKC
         qQERFrqAluZRPKnUzjgBelwM/5e3aRrNGq0XZa3yptv2S2GSfxorXEyuGL1se4HMXVof
         cQw18UyZiY2NImzL3BEVCf3CT1o6rsZUP2B59Mqv56WXS3kLVGcBoFej5bByLiXNtqbL
         MWKg==
X-Gm-Message-State: AOJu0Yz+dB8rfua6FeJ6YM68yGu31RP1ChSMWBjc/QeWNO2LZKtaSwSi
	7VcP0cNweswoYlqg98JRI+tJgQ==
X-Google-Smtp-Source: AGHT+IFjy7wWtg4cLzRfrDjTXhyzIN/arrlQSsc1LKoPaM1CIh1aS1d1idcXizO/mGXqU+9/QHsVCQ==
X-Received: by 2002:a05:6871:5319:b0:1e9:9469:a858 with SMTP id hx25-20020a056871531900b001e99469a858mr16940767oac.39.1697477777557;
        Mon, 16 Oct 2023 10:36:17 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id lv15-20020a056871318f00b001e0fd4c9b9asm2092936oac.6.2023.10.16.10.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 10:36:17 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 0/2] riscv: Add remaining module relocations and tests
Date: Mon, 16 Oct 2023 10:36:08 -0700
Message-Id: <20231016-module_relocations-v3-0-a667fd6071e9@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIh0LWUC/23NSw6CMBCA4auQrq3pA1pw5T2MMdAOMglQ02KjI
 dzdQowLw/KfzHwzkwAeIZBTNhMPEQO6MYU8ZMR09XgHijY1EUxIVrGSDs4+e7h56J2pp7QdaKu
 kAasK3lhN0uHDQ4uvDb1cU3cYJuff24/I1+mX43KPi5wy2jTSlrnSoCt59hhdwNEcjRvIKkbxU
 zhjalcRScl1oVReyBas+VOWZfkALPixp/0AAAA=
To: linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
Cc: Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_103620_664702_750DA3A4 
X-CRM114-Status: GOOD (  10.24  )
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

A handful of module relocations were missing, this patch includes the
remaining ones. I also wrote some test cases to ensure that module
loading works properly. Some relocations cannot be supported in the
kernel, these include the ones that rely on thread local storage and
dynamic linking.

ULEB128 handling is a bit special because SET and SUB relocations must
happen together, and SET must happen before SUB. A psABI proposal [1]
mandates that the first SET_ULEB128 that appears before a SUB_ULEB128
is the associated SET_ULEB128.

This can be tested by enabling KUNIT, RUNTIME_KERNEL_TESTING_MENU, and
RISCV_MODULE_LINKING_KUNIT.

[1] https://github.com/riscv-non-isa/riscv-elf-psabi-doc/pull/403

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v3:
- Add prototypes to test_module_linking_main as recommended by intel
  zero day bot
- Improve efficiency of ULEB128 pair matching
- Link to v2: https://lore.kernel.org/r/20231006-module_relocations-v2-0-47566453fedc@rivosinc.com

Changes in v2:
- Added ULEB128 relocations
- Link to v1: https://lore.kernel.org/r/20230913-module_relocations-v1-0-bb3d8467e793@rivosinc.com

---
Charlie Jenkins (2):
      riscv: Add remaining module relocations
      riscv: Add tests for riscv module loading

 arch/riscv/Kconfig.debug                           |   1 +
 arch/riscv/include/uapi/asm/elf.h                  |   6 +-
 arch/riscv/kernel/Makefile                         |   1 +
 arch/riscv/kernel/module.c                         | 207 ++++++++++++++++++---
 arch/riscv/kernel/tests/Kconfig.debug              |  32 ++++
 arch/riscv/kernel/tests/Makefile                   |   1 +
 arch/riscv/kernel/tests/module_test/Makefile       |  15 ++
 .../tests/module_test/test_module_linking_main.c   |  78 ++++++++
 arch/riscv/kernel/tests/module_test/test_set16.S   |  23 +++
 arch/riscv/kernel/tests/module_test/test_set32.S   |  20 ++
 arch/riscv/kernel/tests/module_test/test_set6.S    |  23 +++
 arch/riscv/kernel/tests/module_test/test_set8.S    |  23 +++
 arch/riscv/kernel/tests/module_test/test_sub16.S   |  22 +++
 arch/riscv/kernel/tests/module_test/test_sub32.S   |  22 +++
 arch/riscv/kernel/tests/module_test/test_sub6.S    |  22 +++
 arch/riscv/kernel/tests/module_test/test_sub64.S   |  27 +++
 arch/riscv/kernel/tests/module_test/test_sub8.S    |  22 +++
 arch/riscv/kernel/tests/module_test/test_uleb128.S |  20 ++
 18 files changed, 539 insertions(+), 26 deletions(-)
---
base-commit: 4d320c2d9a2b22f53523a1b012cda17a50220965
change-id: 20230908-module_relocations-f63ced651bd7
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
