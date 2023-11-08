Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19F5C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 08:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4+wBoD1gZkC+wMMps+bIu+S+B5wSr8Ceh572RO4TIWg=; b=DFYBuEdiOdHsVy
	+HlhcsELv9N3xkMj1WYaABp1nKMdpctOlJktBFhO7oxfuqvJpVu5tdThFTw2ph0P1cNDC0SUWzL5t
	Dm7rx1m7VLhAz6A1AOOy+diaxS9EhhKoT2S7+i5RSdBh70W6+92e2EeVEzHPPDE9A7GlQV2iJfq+e
	OwkZ69FiNPpU44zPuODnKJWufeR1aZK8t/rbSn5iaHT7kCufOlGUvMbyUDn2LvtE65O0M1G1211aA
	4ysn7+UGl116inwu6qR3XzTrrWwK3jryH3sMiL+awKacS706mdXVPOuHhDlDL+wwelUP9FZIhIBIj
	sxDWB0aAZvWDSQmxyipQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0dTd-003Dyr-0Y;
	Wed, 08 Nov 2023 07:59:53 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0dTa-003Dxq-0B
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 07:59:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4083ac51d8aso49925415e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 23:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699430387; x=1700035187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0JwSBQVb6gzPPp96ouDbhllQ0NgXknpa4e1qtpF4Lng=;
        b=yUQJdibwjQO7pULHFz/+JuU5AldBveE4Yrfrv8G0wyldtuGojT2mVViu5UXxm4kXcd
         oSd8C+fTg/qmYaKrXy01iRbAQPwURwIsB0V81FgwD3izgAJZMtAukIxS5h1aDuXI2Mcv
         DLW6p+8KrLhIAznE8/ngrM04/6cWfYRNT1cwJVILjoZ9D4keVXLRuh2hA2KOFpIvOp9h
         f02kJ0PH2RChQCv8KHELbLbyvWP7o0vNjU+p3vSg7vLqdv13EH+x+kKf0od6+LEfO60R
         o65buD+wzo2HFx9+FtWY/KLUbU2b8xt0NYFY+3CD7VjPkghUQYOPqyXTwPvQHJStaODX
         Omkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699430387; x=1700035187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JwSBQVb6gzPPp96ouDbhllQ0NgXknpa4e1qtpF4Lng=;
        b=qbESolUmPsBbWYyu/Dbox/ApOKrCdaDMfWKmo+G5VFV2bHk7K3QzTGtDoWoF1Jfnh3
         cS1OLwJ+mvxdFnMvUa68kO52s5KPMZgnDBWPUUZBNABibscMVr9Obfg2nX46NPsLPKuD
         qRMZBX/1NMF1WDZcdWjDzWHpKPXSxEarwWM/2QfhcyyHZB3WLXSMMHzmhrC+/pinK3gq
         4Xk8eQd5zHt1k8UmVX+CagwKZFPxS/TkNTcTO00T5WCLPfXM+b5uYeBb3qUBoESDRq6R
         JF+tdSIUh0VayioIlAAjuJYjMUcf43O/oBgzQ9qcGoR9yTVk5GNksUSFX/a/SREeEmGg
         LvSA==
X-Gm-Message-State: AOJu0YwG/+CTQBAWOssOD3BsLMZSSa6YOd376MSKiQx7N/J+Sc9ybiTp
	zu3siBBFzS7+sS8mlZsQjYINuA==
X-Google-Smtp-Source: AGHT+IHZGNMDI0jyKZiSY6MKCJvZxFw8O9s4wGNsKWif0l8pMDZ26/WOd6aVZ9FdKc8rFEMYh9ddTw==
X-Received: by 2002:a05:600c:358a:b0:409:67bd:6fa1 with SMTP id p10-20020a05600c358a00b0040967bd6fa1mr1096777wmq.18.1699430387245;
        Tue, 07 Nov 2023 23:59:47 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c1c1300b004060f0a0fd5sm18375687wms.13.2023.11.07.23.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 23:59:46 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RESEND v2 0/2] riscv: Fix set_memory_XX() and set_direct_map_XX()
Date: Wed,  8 Nov 2023 08:59:28 +0100
Message-Id: <20231108075930.7157-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_235950_306756_DE5AB0BC 
X-CRM114-Status: GOOD (  11.10  )
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

Changes in v2:
- Fix rv32 build
- Rebase on top of 6.6-rc6
- Move the flush_tlb_all outside the mmap_lock

Alexandre Ghiti (2):
  riscv: Don't use PGD entries for the linear mapping
  riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge
    linear mappings

 arch/riscv/mm/init.c     |  12 +-
 arch/riscv/mm/pageattr.c | 270 +++++++++++++++++++++++++++++++++------
 2 files changed, 236 insertions(+), 46 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
