Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6357BEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 22:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UpZwwiW9leZQQD8DeEoBBYjcGAu0Nuoh3WsuNKHu8XM=; b=SV8DJKnAV7GKW3
	ZM7UUz38jd0F9OYBpvqRXmFYTlEM8OL5F3VUlr+P+iTLlXqq5qserR8LBeLLIcaxE5AQwDLWW4d+T
	lxwhw9Czd3MFcTyDoTomFC0njJskM4/mKxF1IRYbUMzj9DOmLy0zixH9rq6UdfOUVT9Aqbh4WK0EO
	R05zLXxowKJgwyX1j+5LKrXapF0Qopl25ayKIireBWFCjyQQmkZ9SHV4qZU8LAmxRxnelcQIZYrjk
	UPBuaM9DjybxdC8s9K/x3tuZ8LSEsttTP6LjyhvYy+yKxuU7Y6163ev2o4xwBfARZkwBKFdUUNYF/
	UvyHFZgUxqbNfP0r916g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEH5i-00EIGW-1J;
	Tue, 27 Jun 2023 22:23:18 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEH5e-00EIFk-1Y
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 22:23:16 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b80bce2592so15980265ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 15:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687904593; x=1690496593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mc8gTI3W4RW6dHKji0wpJv9Z8xook1q3V9GncqmxBNs=;
        b=LAT8nPi6+wPrYAAarEcLR//bannYKxM8K2dl8ard+Y2T6mC9jXOCXNcLymbItILWIH
         /+H7q2vAEnLRtuwthXmhTqhSVBpIHecv+WxeBEQVTiJ2w7paLH2FctuZjJ5duvgdkbcj
         AIqTdsBNVUzyOEnJREJTHReyK2k34ws/RMgINpSix9QKQDuWwZroz0aVAGIQWhtjZTRh
         fp6hWKMyp1zNuJEbEwFRzTbaAjWOAKUX6oavJwTLtXzpB1jrw+5jdM/GHgFGmHvzLA/B
         BS16AMVlhBO4yMR5F3Q73dbS991hIP9AK3JozP+KoWMnN9yakmMjccjrKTeo7hZPEwUM
         Yu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687904593; x=1690496593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mc8gTI3W4RW6dHKji0wpJv9Z8xook1q3V9GncqmxBNs=;
        b=lcg/mFKe8GW5B46AEBQCHCEYN0KF88gdCr+fy7pZZnfMm0uySynFa2JXmbKJREuz9C
         +KsPR/o9NzBs9wVr6rW5qFYB9IbVDY5TP+nudeDbqckmKhDY2MFo70F0u86bFrufg0el
         yl5QqFz54chqhhDXKMb5ObuAbA6LCx00y+/Qnev/9mUSa1NG05utQ6rwemkmF7BUTwsG
         f7jKkncVRKnG1CcYdCK5ObDFJdp+64IrmbhfwzSroliqMseYGbt1KwVRnl5Yz/71BhfR
         gL9AKUEqOaZeB/rU00Rl3JS10edUzNz0tq1n8VK+CsEzVTsHRszsg/LwasegyBvf5Sv3
         CcWA==
X-Gm-Message-State: AC+VfDyFRGUyfU1j2cOdpW8IYivTPPmMBEihNbYXf0qgWVElHkv8ADsJ
	elTJq7k961p8ijLKi5Bw7ItzFw==
X-Google-Smtp-Source: ACHHUZ5dzHKMQEs5WRpPvm7HuTITuvtAXHdpkIka0TGrn0KnIqw30wJDTznkQRgHRkjUNqcdLIe4ag==
X-Received: by 2002:a17:902:c403:b0:1b3:fafd:11c5 with SMTP id k3-20020a170902c40300b001b3fafd11c5mr10089706plk.44.1687904593551;
        Tue, 27 Jun 2023 15:23:13 -0700 (PDT)
Received: from ghost.hq.rivosinc.com ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902c24400b001ac94b33ab1sm5108271plg.304.2023.06.27.15.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 15:23:12 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
To: alexghiti@rivosinc.com
Cc: charlie@rivosinc.com,
	atishp@rivosinc.com,
	conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@rivosinc.com,
	aou@eecs.berkeley.edu,
	bjorn@rivosinc.com,
	anup@brainfault.org,
	evan@rivosinc.com,
	linux-riscv@lists.infradead.org,
	konstantin@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/2] Make SV39 the default address space
Date: Tue, 27 Jun 2023 15:21:50 -0700
Message-Id: <20230627222152.177716-1-charlie@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_152314_540189_949D8041 
X-CRM114-Status: UNSURE (   9.32  )
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

Make sv39 the default address space for mmap as some applications
currently depend on this assumption. The RISC-V specification enforces
that bits outside of the virtual address range are not used, so
restricting the size of the default address space as such should be
temporary. A hint address passed to mmap will cause the largest address
space that fits entirely into the hint to be used. If the hint is less
than or equal to 1<<38, a 39-bit address will be used. After an address
space is completely full, the next smallest address space will be used.

Documentation is also added to the RISC-V virtual memory section to explain
these changes.

Charlie Jenkins (2):
  RISC-V: mm: Restrict address space for sv39,sv48,sv57
  RISC-V: mm: Update documentation and include test

 Documentation/riscv/vm-layout.rst             | 20 ++++++++
 arch/riscv/include/asm/elf.h                  |  2 +-
 arch/riscv/include/asm/pgtable.h              | 21 ++++++--
 arch/riscv/include/asm/processor.h            | 41 +++++++++++++---
 tools/testing/selftests/riscv/Makefile        |  2 +-
 tools/testing/selftests/riscv/mm/Makefile     | 22 +++++++++
 .../selftests/riscv/mm/testcases/mmap.c       | 49 +++++++++++++++++++
 7 files changed, 144 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/mm/Makefile
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap.c


base-commit: eef509789cecdce895020682192d32e8bac790e8
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
