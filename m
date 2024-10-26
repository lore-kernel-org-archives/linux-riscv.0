Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CB4D10C01
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Oct 2024 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2H3y6aLYzTEEIcvOCSnthFa4tbG11nUrGZ/snR4M3lY=; b=sNUIZyM/UrTxQl
	JoHdSScYatmB1zJR40SjvVd0jCT1ZM2idSJy1EP8Zg5lLN1iD01WzoDoOcp5UyIHcWE3CVUPzXWiN
	VEk9MtpNpdw4hH/C1ynuld0P2UUw0EBwtvKn2bmxWQRAAa8wMtv0SvwxgWCbRk2WodQcW6QKk+HjG
	QCDVNsQnIbxyO/3DWS8vFmy0ApLu8DD5pfuYWu5UGStTKY9sKd7X74zRm0g7L1sbOwsrWQTMxPuh5
	fgvtRT3KZuRIY6KWlzvbMgUtC9AHPOeY4oaPDuUhS4tSiUYxnl8Hy2/B3zGw1tAprqRxUZzi7zj7S
	xdfXqRAEUcwjuP0X1cZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4kNE-00000006x74-45X1;
	Sat, 26 Oct 2024 17:14:48 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4kNB-00000006x5v-1znZ
	for linux-riscv@lists.infradead.org;
	Sat, 26 Oct 2024 17:14:47 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2e2e2d09decso2829613a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 26 Oct 2024 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729962884; x=1730567684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BOSsQUnotfJnWx8MDy5AXFl+d4FZ5vHx7jUPt4EEd+s=;
        b=mGCsvnGrbiCII6mGZEpTyxfsZDIhcT3+ZnOzARH2zTj8a2KyPD333R9913dBYVgVu+
         CCdYN7r5WjE/DjLFkG6x3KyrEmAvG803gGI9neykkh+6CHHSib8pkh7VdH+xzf+GElvw
         ewgIpgem3V8WRiWzwlqTf5SSTvUwvJLldTSHwERrinsTc/l6ACHWHdeGRLFI72jdIb/6
         AyjPJ80HVCzs5i9sN2Yw2pUd+9qfpSa9QGb03UY47IH5XYNb3YFQ7D6xTEeO0IWhk7vM
         lnpXwuOgqhn4fMOczfYp8QzTlrN82PmeGAK0Jj7sHB8PC+z06P0rItAt5xLGpyySW8Zl
         57KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729962884; x=1730567684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOSsQUnotfJnWx8MDy5AXFl+d4FZ5vHx7jUPt4EEd+s=;
        b=mU5WZDuLixLIlxw3ceoeKUL0n/E0IQHVOP4CT8caz4Gvyv37LtGrb8wpLOzJSWt2b7
         k0FrrY9cU8+885hU/chJsuryQdDWXgUM1dTuwTwHaEC5bN6Ym+fBlb14F0YLQRSFGDWP
         kpDueR1/CxubJi1z1gYjqG3uytgUQaWZSOtWZh9k4d+4n0BI9jLe3nY4RZROODkuA0GU
         MQ1a8Gwo1EGuGxuMxLqnVNGuOnlRE8vjrhvYfZCZiNLDxY+2F/BkBA/LFiB/daT3Ss2c
         NFVaoeb0YwJka9c4YFnH9Cd/UK49E37JQ5Vtzy3eX/ZaNboYqkn5/P0Ebc/TEegFBB6v
         mCxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgnf+RqebjVmhFlaE7u2hVKGOLPdQIJojiR47PCYJKGyGDHdT4lp45hZOmJd/vRUJxKyyMfvpSeTn8Ng==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLOb0XSOG52FNYkaAA6UceI6A3FY1Upu13q9+dKoBzxTpKevOL
	upKbC9BjMIml/fDocaL1ufkRbxaXuk4zrGJmow/yNQSFwtJnG3vyZ0yDCFjkCRaNg9Pt6tOVMWm
	W
X-Google-Smtp-Source: AGHT+IE35+CPcVp7ILkzpFktpBD+b2eWjLqpOh7Yq/Lpl307CKcwxHI8L/rwX592Dxjn9xzY6ItOrQ==
X-Received: by 2002:a17:90a:7846:b0:2d8:85fc:464c with SMTP id 98e67ed59e1d1-2e77e605026mr14994919a91.11.1729962884162;
        Sat, 26 Oct 2024 10:14:44 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e558114sm5663762a91.36.2024.10.26.10.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 10:14:43 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 0/6] riscv: Relocatable NOMMU kernels
Date: Sat, 26 Oct 2024 10:13:52 -0700
Message-ID: <20241026171441.3047904-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_101445_559743_B9157C06 
X-CRM114-Status: UNSURE (   8.20  )
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

Currently, RISC-V NOMMU kernels are linked at CONFIG_PAGE_OFFSET, and
since they are not relocatable, must be loaded at this address as well.
CONFIG_PAGE_OFFSET is not a user-visible Kconfig option, so its value is
not obvious, and users must patch the kernel source if they want to load
it at a different address.

Make NOMMU kernels more portable by making them relocatable by default.
This allows a single kernel binary to work when loaded at any address.


Samuel Holland (6):
  riscv: Remove duplicate CONFIG_PAGE_OFFSET definition
  riscv: Allow NOMMU kernels to access all of RAM
  riscv: Support CONFIG_RELOCATABLE on NOMMU
  asm-generic: Always define Elf_Rel and Elf_Rela
  riscv: Support CONFIG_RELOCATABLE on riscv32
  riscv: Remove CONFIG_PAGE_OFFSET

 arch/riscv/Kconfig               | 10 +---
 arch/riscv/Makefile              |  1 -
 arch/riscv/include/asm/page.h    | 27 ++++-----
 arch/riscv/include/asm/pgtable.h |  6 +-
 arch/riscv/mm/init.c             | 97 ++++++++++++++++----------------
 include/asm-generic/module.h     |  8 ---
 6 files changed, 68 insertions(+), 81 deletions(-)

-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
