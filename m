Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74FCCF8552
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 14:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=twUR6m4IeBhatpO58Sm9HtVGrMcZ698nCJ/wwbrNacc=; b=idToX8HbtR5LCs
	7EZIukLlFaeZEBwmpQXX3SVR77Ac7JaKestUkMd5S3RCSnoZKU1Y7ATOTfLPqsJ92+HSN9VtTSfAA
	2/0p2AFzNylE8jjVX7LcWhJ4o7DoUV25z/ZalDFQFyPvKJnDpJ/ZbKL9LLFfjg/Whq2wWtw1JGKSl
	/slChkHoUqDT+23gGtVW1ftk7qTdrYKFWy+Ur0YQOd2B8OeaY1KL9j+LPL+QDh0odyagnMJue5UIC
	sqipySzb6IobV3k3yVwDxzqNthpi8cCEObHN5S+3zpZwbMNULOlWmLTQekTfL/B0WxhPnSroelkXZ
	/GMTD5W/5qJt7J7r45UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swj7I-0000000CjP4-36dg;
	Fri, 04 Oct 2024 14:17:12 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swj5N-0000000Cit6-2f5h
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 14:15:15 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71de9e1f374so418626b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2024 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728051312; x=1728656112; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+q94Vokd3rjGpferr7kuhuwd/CnBEQ9OwvfEy9PEcw=;
        b=gANYwxI3Uh3UssZ1lYSdOUkk41j1faFg+K8I6PjnPu9AvoSYcH+HMNYyrvQ7CRPsvz
         BPHGt38bGr7wPeESZY1z5+Igbiz5ilOsZKR9JBijIhMcoPfoizdN/DztIeOBr52SCsMP
         4JCPCzgDooR33ar0g+GHeeTac8b25ST98pUCZVftuojsilHkRd4Sf7IjjC43WPRNEH7u
         Bn80ivI4rvUbJmznl+mQWA9rkHlQIGqSxzwBsVxXif8GNPTY9i5lY0TD2z5TEupWSnXk
         eKmedPw3Cc64mSW2JF5WNvh2msE6ZDkSw5WNiFwYBJK1iJzMncFxBSt3pjqWS1ZvEIka
         d2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728051312; x=1728656112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+q94Vokd3rjGpferr7kuhuwd/CnBEQ9OwvfEy9PEcw=;
        b=OukrrIWJDDsymS47T+DZLyvnifcezOHzcARVh057cKgeB2mJ1se8ThnLa1KVuHSJ1u
         AWr2VQVU3uTChSL39w28WrhMghYHQIGwEKLNZl0kKVcZ+0LMjT6HFacjB5oxBEU3saxQ
         b2QQ2JO/PJTLmOSmeluvBmS15w9Qmt3TdHmzJtnw0auLSlyfTNl3Mq+alXMnyGZOUmvD
         oeGMp5we5kZ6QG66vMvQIFGGSyfBGtbwFELPj0HuCjkXy1AS+rPjjiYvoEPB5B/3t0ON
         yNJImJN4xV9AOqPiGGlCEuYYGIoYcX1fS2oBDZ4TJW3OzlhaH3kPmV6N6ceoFV9rJ+pD
         CtdA==
X-Gm-Message-State: AOJu0Yx9v5UVPvMVmrkrQ8YIlsUFiFh1fMPjT9/O/LaNvq29f10Unnc6
	R6Eovy8nJmv+ocqtQHrlPeebbK/LQsPg9MMkfv4iS2X6nP/RjlMkXd6IgSSEloPdoUQkf8NkaKw
	Y
X-Google-Smtp-Source: AGHT+IHSG0E+V26Pki2i9IHRaE836zN3/sOY9stDA2Qd5Yl2hUM6tTRVgGNAo8tJT8Zkx9iyB7Do8Q==
X-Received: by 2002:a05:6a00:1312:b0:714:1bcf:3d93 with SMTP id d2e1a72fcca58-71de239d3e3mr4429615b3a.5.1728051311550;
        Fri, 04 Oct 2024 07:15:11 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9dcb5da23sm2182238a12.85.2024.10.04.07.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 07:15:11 -0700 (PDT)
Date: Fri, 04 Oct 2024 07:15:11 -0700 (PDT)
X-Google-Original-Date: Fri, 04 Oct 2024 07:15:04 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.12-rc2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-06f4491c-e8d5-4713-9342-3470d90d42e7@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_071513_866210_AC2608B1 
X-CRM114-Status: UNSURE (   6.34  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.12-rc2

for you to fetch changes up to cfb10de18538e383dbc4f3ce7f477ce49287ff3d:

  riscv: Fix kernel stack size when KASAN is enabled (2024-10-01 13:08:11 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.12-rc2

* PERF_TYPE_BREAKPOINT now returns -EOPNOTSUPP instead of -ENOENT, which
  aligns to other ports and is a saner value.
* The KASAN-related stack size increasing logic has been moved to a
  C header, to avoid dependency issues.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Fix kernel stack size when KASAN is enabled

Pu Lehui (1):
      drivers/perf: riscv: Align errno for unsupported perf event

 arch/riscv/Kconfig                   | 3 +--
 arch/riscv/include/asm/thread_info.h | 7 ++++++-
 drivers/perf/riscv_pmu_legacy.c      | 4 ++--
 drivers/perf/riscv_pmu_sbi.c         | 4 ++--
 4 files changed, 11 insertions(+), 7 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
