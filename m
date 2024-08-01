Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7076C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 03:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XKCPg0yJK7qlPigmNpSJYh2F1kNlzJjKVPto5XhFfYo=; b=AJK5kR/uzN+vhk
	80M/groAI2fkKBQa85iiiX/dSee2yw4mWNC2CBGWsnJDU0t2n6ReLiIeAZ3CUn7LCcKsbKqQysUeO
	2b2umGwcBnng48PHl2Oe8m5KgT+NiRpIiP7sgnrhgSZnBmc2jkkilrySPyWVS2PxIXLsrK2uy8roA
	f9lSI2/vyKRiptjpJRqjQeZGiRg7tu7+sig3q93rn/VmzJKISoChGCjFVIh/0fHCbnIJyvJlOWP2r
	IaOFdU0WPuEzR9Rjxf97CCVlw0q/RkVuIsj5mEaX8h2ulTfFInnVoE4SL83qf+lgcXmmsFsmT2ngB
	OvW/ZE/d6OiRdD7OODmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZMdA-00000003auN-3cH2;
	Thu, 01 Aug 2024 03:37:32 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZMd7-00000003at9-2nsu
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 03:37:31 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-70d18112b60so1351655b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 20:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1722483448; x=1723088248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9k9VIOXjwuqNS+/YcMmWUWuyVFM+OX2w1xgp26aZK9k=;
        b=eFicjOnQ4AmWrLUXRzQM+wKtHbz9myh1qRAvQiFT8USw+nCC1lnwECWdWcdMkCmikv
         1zT3BSvXg9CODxrXeOdo6vdEKb2vsKrx8a4M+Oxf6CRek2hQi7uuAKkKU0XxqF7YypKj
         MESjCMjoa864eu9KTO9rADpGRzW7ULwCPv7X5wJ/F2JH2dPE/hMyzkpojaH7M3Kj82kt
         R/bRHJslgJwuoVeYZt4vKj6okJsB0Ix6DVwRGqUh39lsxPiG1mNZTfE1TNdKRUUO6t0n
         t5S43nYbdn64usP3vaT7+I0Q9oDuxgaySfOW/rgLnk3sbwir9T5jJQU2Ut5TA9leeXmY
         xf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722483448; x=1723088248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9k9VIOXjwuqNS+/YcMmWUWuyVFM+OX2w1xgp26aZK9k=;
        b=omIEa3nI+VywhT4sHQ37pddob+xoUL0VKBgXuOA2ggn/JBo0b0Psx4ytGtIqjuRykK
         fUA7nQ/2BYMn9Bqnh9vuZFGynoNgeK3ExqdxCpKsRPPOv1Svw7RTntjE6RfgY75vyXJ4
         IzCBAbno9oLy/mJ1zLS6vhix5Gpf7oC73Ilc9rrFdxZT6C5N9gRhCs1JKvjxFdFT/7zP
         /KXuwGEW3rwKOAKbObxmJ8briZ+RDa5GxW0ShqpskRx/2XL5Af2wbvCaeSDZ2QWDs0Ck
         YfI21Np83ByIFFK2MaDJbkXSABGBpPbNZIHXFbVBNKUH558uvQYTgPJ0rJYBXeqqYbY9
         ToDw==
X-Forwarded-Encrypted: i=1; AJvYcCWLiIyRtkxz6IpCc2QEVuvJ4jrtcOuBqvTqGbJHd1evSwl+idF3bMSaNWXl8XqvoIHjY5txxo+wLGVTMd4GkBddvqA4jMJF3yc6+Cnd2DSf
X-Gm-Message-State: AOJu0Yz2oPFtotXzMyPKzm87OyWz/U8a3mL5v81TTcEM4onaJClyhk9d
	/PvUHn3Z0wwcRYIufFY39Oz3DPvhk9FC0MFtZ3WBp+ILYIaOnfGlewgCZkvmGg4=
X-Google-Smtp-Source: AGHT+IHFOBC47p4CpLPq6v4nWD7xk3dw+GUeSZ7shUYfUzrVEJsAf/D+jq7FoEQeTYk7sxpWstWV2Q==
X-Received: by 2002:aa7:9184:0:b0:70d:2e89:de2b with SMTP id d2e1a72fcca58-70efe426bc4mr10438408b3a.4.1722483447727;
        Wed, 31 Jul 2024 20:37:27 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead72ae3asm10954457b3a.91.2024.07.31.20.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 20:37:27 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 0/2] riscv: Improve KASAN coverage to fix unit tests
Date: Wed, 31 Jul 2024 20:36:58 -0700
Message-ID: <20240801033725.28816-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_203729_762662_2161A7B6 
X-CRM114-Status: UNSURE (   7.67  )
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

This series fixes two areas where uninstrumented assembly routines
caused gaps in KASAN coverage on RISC-V, which were caught by KUnit
tests. The KASAN KUnit test suite passes after applying this series.

This series fixes the following test failures:
  # kasan_strings: EXPECTATION FAILED at mm/kasan/kasan_test.c:1520
  KASAN failure expected in "kasan_int_result = strcmp(ptr, "2")", but none occurred
  # kasan_strings: EXPECTATION FAILED at mm/kasan/kasan_test.c:1524
  KASAN failure expected in "kasan_int_result = strlen(ptr)", but none occurred
  not ok 60 kasan_strings
  # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1531
  KASAN failure expected in "set_bit(nr, addr)", but none occurred
  # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1533
  KASAN failure expected in "clear_bit(nr, addr)", but none occurred
  # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1535
  KASAN failure expected in "clear_bit_unlock(nr, addr)", but none occurred
  # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1536
  KASAN failure expected in "__clear_bit_unlock(nr, addr)", but none occurred
  # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1537
  KASAN failure expected in "change_bit(nr, addr)", but none occurred
  # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1543
  KASAN failure expected in "test_and_set_bit(nr, addr)", but none occurred
  # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1545
  KASAN failure expected in "test_and_set_bit_lock(nr, addr)", but none occurred
  # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1546
  KASAN failure expected in "test_and_clear_bit(nr, addr)", but none occurred
  # kasan_bitops_generic: EXPECTATION FAILED at mm/kasan/kasan_test.c:1548
  KASAN failure expected in "test_and_change_bit(nr, addr)", but none occurred
  not ok 61 kasan_bitops_generic


Samuel Holland (2):
  riscv: Omit optimized string routines when using KASAN
  riscv: Enable bitops instrumentation

 arch/riscv/include/asm/bitops.h | 43 ++++++++++++++++++---------------
 arch/riscv/include/asm/string.h |  2 ++
 arch/riscv/kernel/riscv_ksyms.c |  3 ---
 arch/riscv/lib/Makefile         |  2 ++
 arch/riscv/lib/strcmp.S         |  1 +
 arch/riscv/lib/strlen.S         |  1 +
 arch/riscv/lib/strncmp.S        |  1 +
 arch/riscv/purgatory/Makefile   |  2 ++
 8 files changed, 32 insertions(+), 23 deletions(-)

-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
