Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AC6E732E3
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sprToxXrbfgFnUnSt2huLLGUSJUKEWMC5+uQFTBH9P4=; b=e4YlY6yKlHwjPi
	lQkDpNfu1tpfbrRYJ9jezpSCzKi0npnJixb5zYg9QvL3QqCeiT4tKAFAKkmW5UGzF1csjC/U9uEOT
	A7erollIHuxBRm14sjen7sQg6btBgobbInSwlpIgrEjMVc9/lbRHpWNHlyVoms6cnRcZXh52DOypM
	eAqKRC4YNUdXMmnDDSW6y2jLHTqAWKmMu5DX/uLehue8ZYBboni1ytPuwlGIQGW0AaMZMTZHxb5J4
	TQ6haN5yC0Bbijlyow91WwJmQEUhtXb6xUlwxcOVzLvpD1GEzQ7fpHfueH5RWNZ2MdLiCxVU6F5NW
	eadxU5l94hkaheUGx84Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsn6-005MfE-0x;
	Thu, 28 Sep 2023 15:19:00 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsn2-005MZM-0Y
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 15:18:58 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32488a22810so621082f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 08:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695914332; x=1696519132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8XhINO5OKvYBbRtcmNNCbEmBFeMKEzNeQfLz10xju9g=;
        b=LFnGuNs8H0SwyQlNrzmOcji4XHE9bQJbEw7h1aLxoz1hD6Lrlt/rYINMNM3VBcVkv4
         C62euGThUprbXXnUmZZfANqcN9cRqnNfnRYXSQbENhPrdcg1aWT10tu0X3nu59iAFrQ9
         XpmZbjF7//OwKw+EFLQ+PctoK6A2dyV382igaUiBQGPt9qfgpYnl009m3XEdwup0LY7v
         JLmfNpVSnV2AspLMce4mgtGfcaVdVTIoKCC8sENoxDWci4sPIS8p6KA5WTmtO3BGPNJV
         GYoEbB2gXcQTm2yLkSdMaOwz859+4GbZ3RRVTjjCFqoMwuKkotgbxuXNk863MN8gBts/
         mLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695914332; x=1696519132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XhINO5OKvYBbRtcmNNCbEmBFeMKEzNeQfLz10xju9g=;
        b=OhNgsL4txWdPvESoCYfhn06Yh4PWZVWegNH/vExYF6kWmsmFrilY1PR5BO6zTzwtYA
         JbazW+MdsUpnV9NRJzKNnXzDOiNZKS9OwffBC3f4SAXWJXovRGvR3F/jDND2qjgeB5D8
         2KmciYq+nb7V59EEVfT1NoJTu6gj64Oid09/VwQMLHz34kVVumYKLp5LU9YYFphTmhlm
         6ndk9s819TmhTksT5czBbGtS2hIM4gorzfnrwsJn81lGSvg47Sftc6nOHcm8g+y5HYcL
         p4ScuWDM+UIrkFHkA3BvpOosOC8ogVnM8/29uxmLPhp7BsWj6y6bjHiDw+0L00lo/5Ff
         6cng==
X-Gm-Message-State: AOJu0YxJTbYfQ4pmDnzD1bBpSnPVaC+uUH4kMDuUcFrDjvxeJMzuhzDb
	mEzLMySdepC+1A2LGwxsVZKHqg==
X-Google-Smtp-Source: AGHT+IF3BMKsooFSz5jXnPOpNsl9uP20YFz7wKsRZjStJ3sFQX1KVDhrcuc0QJibCu2PmsavTb0EGQ==
X-Received: by 2002:a5d:4047:0:b0:324:84cd:5e67 with SMTP id w7-20020a5d4047000000b0032484cd5e67mr1401707wrp.6.1695914332582;
        Thu, 28 Sep 2023 08:18:52 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2a02:8440:4541:1a11:c4e7:d9ee:586b:e201])
        by smtp.gmail.com with ESMTPSA id a13-20020adff7cd000000b0031ad5fb5a0fsm4692046wrq.58.2023.09.28.08.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 08:18:49 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes 0/2] Fix set_huge_pte_at()
Date: Thu, 28 Sep 2023 17:18:44 +0200
Message-Id: <20230928151846.8229-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_081856_509227_3F3EE3E1 
X-CRM114-Status: GOOD (  10.35  )
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

A recent report [1] from Ryan for arm64 revealed that we do not handle
swap entries when setting a hugepage backed by a NAPOT region (the
contpte riscv equivalent).

As explained in [1], the issue was discovered by a new test in kselftest
which uses poison entries, but the symptoms are different from arm64 though:

- the riscv kernel bugs because we do not handle VM_FAULT_HWPOISON*,
  this is fixed by patch 1,
- after that, the test passes because the first pte_napot() fails (the
  poison entry does not have the N bit set), and then we only set the
  first page table entry covering the NAPOT hugepage, which is enough
  for hugetlb_fault() to correctly raise a VM_FAULT_HWPOISON wherever we
  write in this mapping since only this first page table entry is
  checked
  (see https://elixir.bootlin.com/linux/v6.6-rc3/source/mm/hugetlb.c#L6071).
  But this seems fragile so patch 2 sets all page table entries of a
  NAPOT mapping.

[1]: https://lore.kernel.org/linux-arm-kernel/20230922115804.2043771-1-ryan.roberts@arm.com/


Alexandre Ghiti (2):
  riscv: Handle VM_FAULT_[HWPOISON|HWPOISON_LARGE] faults instead of
    panicking
  riscv: Fix set_huge_pte_at() for NAPOT mappings when a swap entry is
    set

 arch/riscv/mm/fault.c       |  2 +-
 arch/riscv/mm/hugetlbpage.c | 19 +++++++++++++------
 2 files changed, 14 insertions(+), 7 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
