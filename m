Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F98E88D8B
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 12:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/zVWJyVpHd2ZEi4enUfO6v+r5Z0frWnqPRuEQVvZsxg=; b=qL2Sv1mct0F3In
	TcAPkaK0+ecqkvBV9wmFlAkAwdXUPUoGrlnJ+0dS01JRTlOEyrcyNUCcCMKn3Tv3YYarh/c+/RgVi
	DkuOgnAwMOHBkCyg3mRves11PFZihXapQKm62mvcJ+kB9fZ2xBt2b1NMRsixL01UDXF7oW5gWy0kV
	yaZgzjN1ydwBOXXtl0pcOm0gurCIw8vyStDtuRmRP9GZTqkJAUEcE0PyXqwmF6AP8JVreuRvsfbY+
	Bas+8ELqIYKnI2uEhzfbaKsROzz5JcWybNMu2f6qbD9xejBQEk7spbbI3JMQy8RJ3suZiCfsjBreP
	XZGBc3WEyPSfsZRSAvig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w900B-00000003S2J-2iem;
	Sat, 04 Apr 2026 12:21:23 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9007-00000003S1b-3B1K
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 12:21:21 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-82cd5c07f93so1181801b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 04 Apr 2026 05:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1775305278; x=1775910078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XmD+wUZmRVhtkrDT5Nt1vWAFME2ljMO3CvkEWHIVAgE=;
        b=DdvCmZ/yH8UBxGfBqhB24Sv5jvISVnHVdhgjmXihz/wzho306l+wA2z1yjITNvygR+
         cpUbec7Sji/DyfzNIfWKgWFdpjmAavoQ4F94xoOoyMnhTCKMXMiMJnNk9cAc/RcyQoml
         a3vvzwRD7Jz4E3VMPsqjpANY5un1rq64s5bELwZDfl8Hafglf5XpA1bHNPJPCzM5VPGP
         ZdAoqoIEwS8RRDzhQ15Oa4hY1HGVrO1qwymWatwMJSz+rAC9A6l+WPbwXIHJD3c5Xi1q
         0JRIFhowNguAYm068Z3sShAI5FdcU6IMmR7G0HgnSLVzURzBp4R5qk13yoxKLwnSsN2w
         6XgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775305278; x=1775910078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmD+wUZmRVhtkrDT5Nt1vWAFME2ljMO3CvkEWHIVAgE=;
        b=cSqgW87wtVnrugeOSbYc9TLCAfPwIApDc3sr8s/Aa8NgLY9YUhB2HboYUE6pp+JbdN
         Cxk6Hml/FSmCw7YqefKvxGGX95lUrGl2TrpUMuY2kRh2+nLsLbPaYeGR+uhrFGUIDBV8
         Okn2MImoQGPoU89PJEK+9Q3RWczOoJkmKEPG8b2tC3YfyZj5V0Sh+wLgJmJjFMNHCR0/
         L33eqKCF7pzSj4i0jStJbBPdiAY34FbSHKReWihQewsOu0k3ku7T4pU0+Of+6NdrtMar
         Lr5KoKKQ/OkKAd7qcjcvKF3q4RnNij7slPCrbpX+HQg1nHLKXpEnA69SUpoA9AA4/DFK
         Hlhg==
X-Forwarded-Encrypted: i=1; AJvYcCW1zgMcYJU2e4fM6LT8ihIdHENooXdM8PqRcf+KXwR6MmcKs5Y8+JzmkZ6GtjqPdCQs3mZ+KSeTWu98lw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwegLCbIwce/lBry8ycGeqKHXaGsmYlrYYWeQ+QfJBzMnnL1gGt
	lufjuAagiBtIa9Cc2wCZkBc7yvqxspG7aZau7u9iJ496woZhSxW+i2kb/bxHHhWtiSA=
X-Gm-Gg: AeBDievilqJC5JS6Ga5bMp2mS4pqwq7PLewWSyGzicQBbijXQzTb5rkc/wrrqAlC1ER
	Z+OaxHRwxw6LxcIG4vxA1Lc2vYdsDPmFZsdjDXbZsPUNTiMFNDrcZiFulNNp6100yAQjrswYih5
	7bHnnF+6Gk3NFMFOMQGGduKfKec9mOpn2a2LaxR5xxYSfAxF/c7pxMUKt078xzE6ooq6KlrucHM
	RjJEEL4XrKMzGCQZwh0moy9GAaBDRhae5xc4hzv7rDkmeKPpcveuSAeieU0a7x7i3SEwc2Q4JNm
	7oNkkO5ib8c1pKR2lVXgCYmSkIGUTbBieLhSt/VnUn5Epl/WcILmruWM4ByoC2eRsJkd/NeVF0d
	5rDnAA0jGIk73S6DwGMqBmSTHVVdkqwVOi9zzHK2IbPoXCzbhkzqvqhi+gj6qZOF4DsZoKQ7sHg
	dWkDBpxylopZzQmFh3A5tK9OHiJNfWCqzp/D8ZFjDXFTQe8XUo28ZqwA==
X-Received: by 2002:a05:6a00:ab87:b0:82c:24a9:d5f1 with SMTP id d2e1a72fcca58-82d0db3f376mr5931662b3a.30.1775305277918;
        Sat, 04 Apr 2026 05:21:17 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cfebe5b23sm8327063b3a.59.2026.04.04.05.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 05:21:17 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>,
	WANG Xuerui <kernel@xen0n.name>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
	Petr Tesarik <ptesarik@suse.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Austin Kim <austin.kim@lge.com>,
	Chengkaitao <chengkaitao@kylinos.cn>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 0/5] mm/sparse-vmemmap: provide generic vmemmap_set_pmd() and vmemmap_check_pmd()
Date: Sat,  4 Apr 2026 20:20:53 +0800
Message-Id: <20260404122105.3989557-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_052120_173735_AE093A61 
X-CRM114-Status: UNSURE (   7.46  )
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

The two weak functions vmemmap_set_pmd() and vmemmap_check_pmd() are
currently no-ops on every architecture, forcing each platform that needs
them to duplicate the same handful of lines. Provide a generic implementation:

- vmemmap_set_pmd() simply sets a huge PMD with PAGE_KERNEL protection.

- vmemmap_check_pmd() verifies that the PMD is present and leaf,
  then calls the existing vmemmap_verify() helper.

Architectures that need special handling can continue to override the
weak symbols; everyone else gets the standard version for free.

This series drops the custom implementations in arm64, riscv, loongarch,
and sparc, replacing them with the generic implementation introduced
in the first patch.

v1 -> v2:
- Fixed a tooling issue in v1 where duplicate/conflicting patches
  were incorrectly sent to the mailing list. No code changes compared
  to the intended v1.


Muchun Song (5):
  mm/sparse-vmemmap: provide generic vmemmap_set_pmd() and
    vmemmap_check_pmd()
  arm64/mm: drop vmemmap_pmd helpers and use generic code
  riscv/mm: drop vmemmap_pmd helpers and use generic code
  loongarch/mm: drop vmemmap_check_pmd helper and use generic code
  sparc/mm: drop vmemmap_check_pmd helper and use generic code

 arch/arm64/mm/mmu.c      | 14 --------------
 arch/loongarch/mm/init.c | 11 -----------
 arch/riscv/mm/init.c     | 13 -------------
 arch/sparc/mm/init_64.c  | 11 -----------
 mm/sparse-vmemmap.c      |  7 ++++++-
 5 files changed, 6 insertions(+), 50 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
