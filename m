Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8E5C25B10
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 10:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aBliMOU+Wa1EYFmVtxOtX2dYj7cGQ1I0fqXj72brwx4=; b=zI0TXTiqg29Ke5
	7DXyfu2DF6AvFFh0uP6XRNjl8HZAlLdVJp+G4ObFokY5mpImLuvb88H6loQiUg/DZEnZ9JE/ntyAA
	MDFWut4watS0rkdYsWaAC+V5hOt3OjLt3uZ3AyR53JWtRcvdefTx51NnoeyDfuDyYU1o5lF+RaU3c
	alQt3Zurz0c3hPk0sf26t62vOL7Y7gAYfO4w0fMdyR7XzqWYj2yOckoGFI/mUxrjnpUjZuucIU7xS
	1gHcPergupv56pHmuuZcPPR4Js7XDH/Jeu7eMur6Q3PCZ5N111QUh0pGUA3HwZ7PADa0s+m+8uTyO
	7ekHIKm2dGmnYqB7vCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ON5-00000002Idz-46nd;
	Mon, 29 Apr 2024 10:36:31 +0000
Received: from out0-207.mail.aliyun.com ([140.205.0.207])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1OMi-00000002IKq-0xFC
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 10:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1714386952; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=dLJfLm6QSven/Kk0xr1PvysR3nscl1fg/cBxpNWoFzo=;
	b=ArUfwr12m/13gjqdD/r0ZIsihv3TfM1SvtZhKzqB8oLUrgM+MhPWy/epJvVljTPbBazl7oTiWTXQVTASw8ZDs4B82BAUPaAsWC3jAAeNySLZoftkYm60t2tl5sDU/DG+1dp9xRsRyP2joXspahbGuXrjsXOgzYSdV0nJP74C7bw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047192;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---.XOFewr4_1714386949;
Received: from localhost(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XOFewr4_1714386949)
          by smtp.aliyun-inc.com;
          Mon, 29 Apr 2024 18:35:50 +0800
From: "Bang Li" <libang.li@antgroup.com>
To: akpm@linux-foundation.org,
	chenhuacai@kernel.org,
	tsbogend@alpha.franken.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com
Cc: <david@redhat.com>,
   <ryan.roberts@arm.com>,
   <libang.linux@gmail.com>,
   <ioworker0@gmail.com>,
   <linux-kernel@vger.kernel.org>,
   <linux-mm@kvack.org>,
   <loongarch@lists.linux.dev>,
   <linux-mips@vger.kernel.org>,
   <linux-riscv@lists.infradead.org>,
  "Bang Li" <libang.li@antgroup.com>
Subject: [PATCH v1 0/5] Add update_mmu_tlb_range() to simplify code
Date: Mon, 29 Apr 2024 18:33:41 +0800
Message-Id: <20240429103346.59115-1-libang.li@antgroup.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_033608_841895_4BED6244 
X-CRM114-Status: UNSURE (   5.91  )
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

This series of commits mainly adds the update_mmu_tlb_range() to
batch update tlb in an address range.

After the commit 19eaf44954df ("mm: thp: support allocation of anonymous
multi-size THP"), We may need to batch update tlb of a certain address
range by calling update_mmu_tlb() in a loop. Using the 
update_mmu_tlb_range(), we can simplify the code and possibly reduce the
execution of some unnecessary code in some architectures.

Bang Li (5):
  LoongArch: Add update_mmu_tlb_range()
  mips: Add update_mmu_tlb_range()
  riscv: Add update_mmu_tlb_range()
  xtensa: Add update_mmu_tlb_range()
  mm: Add update_mmu_tlb_range()

 arch/loongarch/include/asm/pgtable.h | 2 ++
 arch/mips/include/asm/pgtable.h      | 2 ++
 arch/riscv/include/asm/pgtable.h     | 2 ++
 arch/xtensa/include/asm/pgtable.h    | 2 ++
 arch/xtensa/mm/tlb.c                 | 6 ++++++
 include/linux/pgtable.h              | 5 +++++
 mm/memory.c                          | 4 +---
 7 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.19.1.6.gb485710b


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
