Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6EFE92FF9
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 09:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e8hHPr0uCu342+9gPJstoKI4Fs3l6yqA6ED+98BMUP8=; b=Iery6GTHo/yesM
	m9m9GeDJ652LN4dRhCKNnmZ2rTUcAqpHzuFzguSyNwHZlWdJnMF47+x8MiE0gcfpJ8K8UsXdHIYn/
	YETNea+MLKyhf8w4zIScdRkEryyCQK7wlqhnQmchMu7Aq12I61gGWrDx4vpGTla9O3rKb0le6QqKh
	LimEEoUBrrQfKUZGk8C2Wnb7SLcEPmSMMUQaWvEE7uk3DemJh1ko76gerM2vRWlIPcHr22XzSKVDU
	FUbwZ2rEPd5yb+OBkNd/ouSGcUdj76KJsS+nYuBLo3qtFfQzoABIL/bg1TmIFeBfrxaywP868c3Yu
	QCSXP+HS+cWxHPKKFK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoh9P-005OLp-0W;
	Fri, 06 Oct 2023 09:29:39 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoh9L-005OL4-0W
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 09:29:36 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4065dea9a33so18121905e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Oct 2023 02:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696584572; x=1697189372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Aq5rrYNyOOK7uZVK+/VCm6y827G0ymcilBxUQWM6O8Q=;
        b=HHc5l6zgFDF7op2wsods9r0ZyUbjayynBSPNt9mssoZBs0pPtgUc6vGv3q4L5xAb2j
         jKx/4nCnGnwLsK9PblS1RkzMjD/EnxqcVFrT4NJkHzqiUmaHQ+TlRA9cZTD6XrFf7br0
         8rplh35rOhkJvCSMxbETLnz4brlylFOP6EsUB5vbHHUdzLRVqlWJgCHvdIxeVNKtR0Wq
         Az8eADIIuuwD0FjRCa0twOc6R/zzsPhuuvAee8PA5TPmco8U/lYCfsFsYDa1XwEPiYwx
         UjxqYbw3b4hPBwlgZGcfl0l8ZIj3T5FpJjm3H+HDZ5/0V8N3lX2z9yVQS6d0iXz/d28/
         YWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696584572; x=1697189372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aq5rrYNyOOK7uZVK+/VCm6y827G0ymcilBxUQWM6O8Q=;
        b=ohnNcfocuHH+/q1nPzV32WEuPHhjbvvT2BsFupBTy9Hk0CgCwB2zDphJGxIjB+z6YN
         yb6MlLGLl/YIHo1nwYPUj/DZRwsCLhbq3NmQpu0cEWr0QUUAI6dwUYBEgwKmkMocpl4L
         85snpeX2s8zY51L4nwb8NCXABaWIG7w4sHdpfDenrPKwjEy05eloSgZl/nozHPqt6SRz
         +H+17aJma8f5V4ERh99+tN7w5g5cxZYqZRILV2AKXKwjxj0BcYWc4M3hCBqIVr0wZ8SJ
         Ac6C/ScQVcRKCxSHfPoW6fhLUGkDdCIBwdleuMzIw8cd+UZcb1bAJPCHQrPc73EcUodN
         JvCQ==
X-Gm-Message-State: AOJu0YyxorvvXKCosMvgfI1BqxxhELRjkpoK/jOpIhnvcy62fgz/omKj
	GocZG3WVIiJr5njVqMFaYIxLeVSnlZUtqKZQ7Xs=
X-Google-Smtp-Source: AGHT+IGE5tqREDCmTaBollAfgLgxk91o9Pd50IbexKTPwcz2wvpiNku9RufkQ6YSoI+0goa1WscOyA==
X-Received: by 2002:a05:600c:2189:b0:401:bf87:9898 with SMTP id e9-20020a05600c218900b00401bf879898mr6919651wme.25.1696584572008;
        Fri, 06 Oct 2023 02:29:32 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id t14-20020a1c770e000000b004054dcbf92asm3308911wmi.20.2023.10.06.02.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 02:29:31 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 0/2] riscv: Fix Fix set_memory_XX() and set_direct_map_XX()
Date: Fri,  6 Oct 2023 11:29:28 +0200
Message-Id: <20231006092930.15850-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_022935_416410_1CAE18D6 
X-CRM114-Status: GOOD (  10.18  )
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

Those 2 patches fix the set_memory_XX() and set_direct_map_XX() APIs, which
in turn fix STRICT_KERNEL_RWX and memfd_secret(). Those were broken since the
permission changes were not applied to the linear mapping because the linear
mapping is mapped using hugepages and walk_page_range_novma() does not split
such mappings.

To fix that, patch 1 disables PGD mappings in the linear mapping as it is
hard to propagate changes at this level in *all* the page tables, this has the
downside of disabling PMD mapping for sv32 and PUD (1GB) mapping for sv39 in
the linear mapping (for specific kernels, we could add a Kconfig to enable
ARCH_HAS_SET_DIRECT_MAP and STRICT_KERNEL_RWX if needed, I'm pretty sure we'll
discuss that).

patch 2 implements the split of the huge linear mappings so that
walk_page_range_novma() can properly apply the permissions. The whole split is
protected with mmap_sem in write mode, but I'm wondering if that's enough,
any opinion on that is appreciated.

Alexandre Ghiti (2):
  riscv: Don't use PGD entries for the linear mapping
  riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge
    linear mappings

 arch/riscv/mm/init.c     |  12 +-
 arch/riscv/mm/pageattr.c | 263 ++++++++++++++++++++++++++++++++-------
 2 files changed, 227 insertions(+), 48 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
