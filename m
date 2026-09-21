Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBF6C982ED
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 10:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oSga1ZGZyTUYDB4rOc6jBYO50OH8DwgRulTFVpWgkmQ=; b=3ObL4Qj2N/HTdN
	c9v+j5qlvNY78ZJv/fPxW2WtA549ZXWi1s2TXKbo6EJ7+wEJKwSofi+kU1+2a8r7R61SrAgthmkhP
	cuFXm/hjdNgy88djIZioVjzVopYEc7cd4Ppib0yM7p8TarLYkaOxfNagWSgBR1CsiCcd8WAfImUB1
	/t0Elh6mC7fnx1wgIIvSeeI16wejcsbxVbOnII/hpchZ775PRCn9u7IvjUmpw9b9FUsct2bX2NJwl
	5G0TFvp8/B3cVKloBsCBnJh5Ko1eHYpqQf7Ahk0VoHitlQ9IGWNP1VIQCEBhe5j3BQPH4/kOchxR8
	CeuIuiym6QZ5fJc9tU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bhw-00000001ltt-2IzU;
	Mon, 21 Sep 2026 10:57:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bhr-00000001lp9-1ZBD;
	Mon, 21 Sep 2026 10:57:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E62EB1570;
	Mon, 21 Sep 2026 03:57:02 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 563473F86C;
	Mon, 21 Sep 2026 03:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789988226; bh=t0SkgFkvYDykWTdwPClx+wiQRsFxgewU3m4qBQArb9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OBFz6Z+Raz7I8ibgsDiaiNLTnQsX4oLEoKjZPRodWantEpoXhmxG8yAOCFS64FQx6
	 TnSa1uoOW4JI3vs3idHKAZLQrb2k4cp73AJbVjUGApg0VIpLWNjF8iXjbLwLCJOMOP
	 KH6BsKk5W9konyiN3h+HCCs6a4q5K9z2QxYNfnPk=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 21 Sep 2026 11:55:27 +0100
Subject: [PATCH 05/21] MIPS: mm: define pud_leaf() only when PUD exists
MIME-Version: 1.0
Message-Id: <20260921-dummy_ptxp3-v1-5-cd40cf68242e@arm.com>
References: <20260921-dummy_ptxp3-v1-0-cd40cf68242e@arm.com>
In-Reply-To: <20260921-dummy_ptxp3-v1-0-cd40cf68242e@arm.com>
To: Russell King <linux@armlinux.org.uk>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
 Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
 Stafford Horne <shorne@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-openrisc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=952; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=yLp6pLFkEq1XlBsrO8HJPn9OYitILCqfI5l0JaR3PzY=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqsQ1NTZ/a+wId/oXop6nBRx7GoTqL9a7Er/mVm
 I4zdOrs16GJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarENTQAKCRBt1cPRWsUx
 M7A5C/9647RRGO+Rm053IZPrkfpK1qoCf6h7h++dBQM7iWcjgmIysinuJZ/9flN7m3N7/8s0k1F
 Qg8UBSKcYxAPzyP7KMXSKbC6blVlpHWz3kExm+/5ZAnSr3JetwJGEw0WoHg0g85dvAd2y+KV0nj
 fcMLKAxYW9EKQIqMG7nuATB+F1lWeLPWUKEeZ5Xr3zYvC2diB9VgvhinADx3ajrN78j7ASV1xes
 7//vZ8p602dtxNE82CTR6O3KYyUFHq7mNoysyRhtRvpNYl2Ts3NfvwNVO6vCLxhNLIIYu7s2mAc
 n2FreTnlSvWWzFZQfZrm8tZrPteyXRjmWvqXceNsbR4SJYTafBHwQjLRLGhy8+k1iRjDqguBSwy
 LsoRrK1Q0udKYrD3CKiy34mvfTgVS17T60Z0/lwKClICrmLYbw/pQoCMDwpPvb9abrZB8uyEsZG
 4+DpL7SndbO4XS1cejsKbd6M7jig6sw/xhWPdMK/bJQQY3QqubKCQrarXnjeyHzIhJkqw=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_035707_509409_61183A3F 
X-CRM114-Status: UNSURE (   9.06  )
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

From: "David Hildenbrand (Arm)" <david@kernel.org>

In include/asm-generic/pgtable-nopmd.h, pud_leaf() has hardcoded
to return false as inline function, but it misses the "define pud_leaf"
part.

To prepare for fixing that, define pud_leaf() only when
__PAGETABLE_PMD_FOLDED isn't defined.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/mips/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index fa7b935f947ca..151f4d15bd12b 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -745,8 +745,10 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 
 #ifdef _PAGE_HUGE
 #define pmd_leaf(pmd)	((pmd_val(pmd) & _PAGE_HUGE) != 0)
+#ifndef __PAGETABLE_PMD_FOLDED
 #define pud_leaf(pud)	((pud_val(pud) & _PAGE_HUGE) != 0)
 #endif
+#endif
 
 #define gup_fast_permitted(start, end)	(!cpu_has_dc_aliases)
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
