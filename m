Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F629606A333
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 04:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CTiB2J/Q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=VE/t+PMK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uycxFEhSmgqMT1kFBKM0MHfzNz6e4LGMU8hci2a/B08=; b=CTiB2J/QQBo0m/bO0nL8LvRbF5
	2fuFMDBL9mfMFQij+QUv2BIui1Ye9DARNSPaBpZdBpNovQuMbPcrNSKXeDzJyS5ph6HQcEY1+oEk8
	KXEd9XDDxKs2TGHdUYaetaNw8RP6A+cdo3qnwRr0bbSBcrS+GCCwrhmUpxc9QsXBZLZH+Mln8S07F
	LI/bVgGwRpe7oTJa5DH8wB0tkWxGLKa7BZCkIRH1uE1PWsvhcq8fx0jPiIBvbyO4hMnV/8eWgEHC9
	I+Fm1Iy9+MdqbWMj7ATEtGk+9Ad+/8zLtjfvTLGGvv+F4WcEc/rLV876KTCTRCMiu881TG5KDFvry
	67kPgIBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPY6M-0000000ECAy-23i1;
	Sat, 07 Nov 2026 04:32:27 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPY6J-0000000EC8C-37gW
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 04:32:24 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3b1015a4259so361373a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 20:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794025943; x=1794630743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=;
        b=VE/t+PMKezfjvp/c8MDBayMJo3QStoIX7ndRikic33Z2JbGCczi6FJ+Auf2kSdwWMz
         K6PHvCenpcOF9g8n4gVe7knT5i/kHRBfXL44/M/Zc0ZXYA26pw59FxLkerb7VfWW2asB
         JiDBUmrihPMLtOK+PYyzS/SHydy06xB5ref/d1iYan04ipiQ30sqbld/BODG/9LZlm5g
         LNTFzhLmgAjtuancs+LoFEtAttvQUDk7vJOzuY6mk2M1m/mYD7e5BqvGXg9y4RA5oGW8
         LG0fiiqomD6t3uvBmZ+vvSn+k41V2VmBxq15decsfrBS8KUNWcazR1stBOxYaETV40S6
         Az8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025943; x=1794630743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SKim++0/v959SqW2Qj0ZN00Ia9M3Z26xYKJjxKUd6k=;
        b=r2ibUxNZbxvadnFUzEsHdV+s2S1RyommSblp8F7c1Nkupt/ZmPscBFY0fFsu9bQZG7
         bP56ez/3PR/mT4xP1JeVR2KrqgwuX30WoBz7QKSYs6hZtNgvUGs+OQ1+5xP2cNo9XRYe
         TUp+kUyL1aUeQ8K++wfyjuei0w8fZQRe8yx/OUprmMcSfjxsMFwtWTrlWb3lmRHZXlAq
         bgJ5AoYnFSQ1A8N91SNEI4VIrNmXmAMlFsSLKKp8uFUHcpPoiqiPDi9k+IIzNXPT1GJx
         wanzzZI3itwdaFJjyqbnqrUQR7359VRLkHZ7wr0aBebtb0WThCw5NrIflGsAKcoB7xXW
         3hfA==
X-Forwarded-Encrypted: i=1; AL+hErEM6yngqVXNWkb1FFRDkihEWV9qG6/Tb7In52jy6wy3LkD+LRBtwcHrapsomq23hmzNAbTFhnSce/mZ1w==@lists.infradead.org
X-Gm-Message-State: APuU4Z86oh0V4B54MDp9oYtvub/0YatO4PUIUqLq6SRPRPiX72O9C4Rl
	gU5uFWGcLLoKH1q04AwWW0LQQS0LnEFULwk77jbY2kQM5yFkC4fyCSZE4NtujWPW22o=
X-Gm-Gg: AYBFou1y0u3aH/JDcEfhfVTPUXZLDDUAwTDhkCQf/vjgR+ln7dIlDHOp708IJ+VC2zs
	JjM+YOGe0lzuI5Q3SSJnpymqKqmyW4QDmRirSllcpbVQy8gZnVBSTtvpow4E5IDXad3UjVO2wye
	DZiO5/6k66VCuiBtQRWQB8qjqQAT8A0StZn9blAV4IxxXP3mWdcY1C97x56+swfqcz0c3JNEJ+f
	Cacr19HuZD8C7m7xwtvX38M2ahzDWP2Y/ozkNenEGyC9TU87cK3ljkczlaPMD6P9S7S6y6eTN/W
	zHT0WDEUe/Nq3z8ZcOPtCTRRxQNwZQKK7kkotwgpQFfid/A0IGA70peSezfNdoKfycK1qAqjWaA
	Fu/MoZhpG04agQJdBApzQrgfEApu4oDVWk8luSe+Wgf/ZlCn/e5pswfcdsrLyvS/9Si2Jf/ZFZp
	sZBkEdVaQ5aDARFeYFvRT9GqAkJlERL1ogZ1hy305a0xlBE44pfiGMzbHvaiChBdl8EWbHKgl2U
	p74tF2y98sluzJCpH9VL0P5MPTA7dDGVfoqQwn/XASJBMy23tLSh2GjtTuA1dKhPSsnQqWzgFiN
	aREo0h5eFMvArfnDno1PTwkzhsfoUxNDMRLCwgHknQV1xMFejfsscS0teP8v
X-Received: by 2002:a17:90b:5608:b0:3ac:c024:b275 with SMTP id 98e67ed59e1d1-3b0db605906mr4825186a91.9.1794025942667;
        Fri, 06 Nov 2026 20:32:22 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10584b66bsm1578451a91.14.2026.11.06.20.32.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 20:32:22 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 3/5] loongarch/mm: disable device DAX vmemmap optimization
Date: Sat,  7 Nov 2026 12:31:20 +0800
Message-ID: <20261107043122.25650-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107043122.25650-1-songmuchun@bytedance.com>
References: <20261107043122.25650-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_203223_782192_134E8837 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LoongArch selects ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP but not
ARCH_WANT_OPTIMIZE_DAX_VMEMMAP. Its vmemmap_free() implementation is also
empty, so it cannot tear down optimized Device DAX mappings.

A later change removes the generic Device DAX architecture gate and lets
vmemmap_populate() decide whether a section can use optimization. Clear the
section compound order in the LoongArch path so Device DAX keeps using
unoptimized mappings.

This does not affect HugeTLB HVO: LoongArch does not support gigantic
pages, so HugeTLB does not use section-based vmemmap optimization there.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- New patch using section_vmemmap_optimization_disable() to keep Device
  DAX vmemmap optimization disabled on LoongArch (reported by Sashiko)
---
 arch/loongarch/mm/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index f801f7097f03..ea769e479241 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -15,6 +15,7 @@
 #include <linux/memblock.h>
 #include <linux/memremap.h>
 #include <linux/mm.h>
+#include <linux/vmemmap-optimization.h>
 #include <linux/mman.h>
 #include <linux/highmem.h>
 #include <linux/swap.h>
@@ -143,6 +144,7 @@ void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
 int __meminit vmemmap_populate(unsigned long start, unsigned long end,
 			       int node, struct vmem_altmap *altmap)
 {
+	section_vmemmap_optimization_disable(start, end);
 #if CONFIG_PGTABLE_LEVELS == 2
 	return vmemmap_populate_basepages(start, end, node, NULL);
 #else
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
