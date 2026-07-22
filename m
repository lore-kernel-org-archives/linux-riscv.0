Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDDFC44536
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 15:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7SEz97sEBu51aibwMik21T3gOBOao00QVUD+wTDkJc=; b=fbgh2ebiYwQA39
	3qH5B0XfYusQsqKN+dOTFBYDr2D+JNoxwkolIHjSE8EchTHnlzRvnNKa78FGzk6jYOiWNmxcZPBd9
	1llOHhAaA0lW9tNG8Iy5Hz3TNXrO+CDROGKEOL5zS+eaEXba1zi5vEMfrK7S0XTndZ1xbPFkf+hMY
	Dnk8xhSXvWkzSbULriLmg/EzxhKqn4bOK+Rj1jkjeqvJsYRcxcTn55+w32Anzy6IFrilnYul0Y8Pu
	7Vjg9+yDK/e6/d/99dhPIF3TTDnLLL/f1EalgdKjUunJ4/udj9d+TbgdfsuQWwsxYSHGC5zm7OszE
	50TxrpP3EDQ+mmDdl+ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYuY-0000000CA2e-1B7Q;
	Wed, 22 Jul 2026 15:31:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYuV-0000000CA0F-0iTv;
	Wed, 22 Jul 2026 15:31:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB4DB168F;
	Wed, 22 Jul 2026 08:30:57 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12DE83F66F;
	Wed, 22 Jul 2026 08:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734261; bh=QrVPpGpdi/eED4dW1HaGgNR2pJxPks6zPqeAqIGp2c0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Sx7wtw/4z23ZqWgZrrke2cLsWwmVryD0piVvxP5yDoWYdAI4LejZxWJjAx7VCXeFj
	 XxlBVB31lMo8WMO0RW7nTFFAbLeq23q0DfH91pTlZcCEROxikJkt9oVDE3Hv9+sPO4
	 MNzvkiIBTNf3FYe9RkItoVkvNmFyJJGAKNecB4sk=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 22 Jul 2026 16:30:11 +0100
Subject: [PATCH RFC v2 03/20] ARM: mm: remove custom pgdp_get()
MIME-Version: 1.0
Message-Id: <20260722-dummy_ptxp3-v2-3-d9e4bad31e0a@arm.com>
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
In-Reply-To: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=801; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=imCIbsDy8jWM4y7+JQNzM8t/o1T4VNesyR2iG+vBinE=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqYOIQ7gH2xG3dGNa5zWIxKkCj6heJC6TxnwWDG
 j715ctcwS6JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCamDiEAAKCRBt1cPRWsUx
 M0iEDACSAXRGBpMxC/K5FYE+A8U6TjqE6WPR6uVtpTp4G3Ulkg3GiAy62KmADuZ/1YGRLTqtioB
 SdXgnkpNWIpVmbvcXCxvLM4JngQLqdwGN2Tmkq/E7pjPVfMB2A3IlViVxIOIAIY/hhQzXV+yp0N
 SSIpwtdt3xL3PHaoE7k7j6EXAhTrAXOlpUhi/1YOZ2KR3tA1vDaX+zz5v43oCXPcUwuzPVWiNsR
 gBNzXs5iUtMNDnepvlm1EkCJNglxpEVCKSZXfhItaNffxHBi8qFpApORlfFfgo82PzlaWlOyH0z
 LXiuXGqDG0qTAhzC9PhbfS4Ppx+63phAq5bhkgEQsP9/zsIb5BMpfTw6Q7Ig5V5wGO3YRiCaqpH
 1Hx4bDGaJ6B0NW84rfJG7zCHUg5dv8FqnopAzS/cPUj8wq1UsNKs9Zwiq6SwXB+Ff95tjEG69vu
 ZAASVFVOH8dS3VQRZqe2XcEJyHiu8f0GNrl/Nf9QLzMl3+Q4g/upKuF1Z9aCcoPziBSao=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_083103_312900_708B4DBC 
X-CRM114-Status: GOOD (  10.23  )
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

Now that pgd_t is no longer an array, we can just rely on the common
code pgdp_get(), which is a static inline function that returns pgd_t.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/arm/include/asm/pgtable.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index 982795cf4563..eadd027fe0ee 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -141,8 +141,6 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 
-#define pgdp_get(pgpd)		READ_ONCE(*pgdp)
-
 #define pud_page(pud)		pmd_page(__pmd(pud_val(pud)))
 #define pud_write(pud)		pmd_write(__pmd(pud_val(pud)))
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
