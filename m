Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542E2CA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 15:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQw2wXpFHyZhQqco7GdAW9atV7JfO36g03n9yovMpTA=; b=tpU/w9WkQ3eDSv
	jEizAZUrkREWsiS0PtIRWIxHG3MXnRXmRR8fIpvObsGVYfkxmPNMm/kFrLlder2/moa0aVJym9CTh
	tqAfpoihp2oBXc5h2o8n6XIu/2ZwlmVrYjXf3mVv+xdvZzVj4/5l4cxqWbHngpZXkKRZ4sZQ3Ffeq
	iZIX+R4lUCg/BTfuhLxZJOInqYSn2+qIF2HxuVbeKtQ+hf/lvTaOqTNu4z7xFqrE0CsjDQU1hjnkp
	qL0L8FLX/zHHkeLEzp04BenMAry1PLjVLaGvkwLCNc55jrc3ogKibcc+ghpEyWQ0/eU8lD7l6bx/b
	FVMyL4X1vDHroC+HaCZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTmf-000000032PG-3HxM;
	Fri, 22 Aug 2025 15:34:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upN3j-00000001viF-0qM8
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 08:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755851017;
	bh=0jRkmhz63wy9fDzRoFQ6jLTDJnLHcryUWGPCMeOuRPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mo3SXVoQX00rreJeQtrS4eVBtHuxZoC8Om/y8ytIGq/Hm+AIS2sawTRGxPwOS96W9
	 wNBFW/mw/O9sWy7szdGOw8HycqUR4gcMMkN/DhV3XbwxRqMXICTXebJxJwdq3VP+iZ
	 Sh1f3k96yvxyiCKRHOcXjOl+Dme79Uf7J+1m+/8oHUvKVS+3YI/N5WHO7s7M+6Vn2B
	 t1cOTldSFakNHnWURgZ7YMM+uFdHevBi57TnfgZ6vNWu+h4NTP4B5sDG6RZCUviId/
	 hncIEU2TG1qFkdVd3SZCasIs8VCwuDleksbR6kr2GDk1WkZZh9Z3+dLxBd2dyLL/5u
	 +GqkA+lOGfJPQ==
Received: from mt.tail9873f4.ts.net (unknown [103.151.43.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2A30817E0458;
	Fri, 22 Aug 2025 10:23:33 +0200 (CEST)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Leon Romanovsky <leon@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	kevin.brodsky@arm.com
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v3 7/8] selftests/mm: mark variable unused with macro
Date: Fri, 22 Aug 2025 13:21:04 +0500
Message-ID: <20250822082145.4145617-8-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822082145.4145617-1-usama.anjum@collabora.com>
References: <20250822082145.4145617-1-usama.anjum@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_012339_384291_B4EF6D74 
X-CRM114-Status: UNSURE (   9.45  )
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

Use __always_unused macro instead of raw compiler attribute.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
Changes since v2:
- Introduced in v2
---
 tools/testing/selftests/mm/protection_keys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index 6281d4c61b50e..967181bcb4120 100644
--- a/tools/testing/selftests/mm/protection_keys.c
+++ b/tools/testing/selftests/mm/protection_keys.c
@@ -1302,7 +1302,7 @@ static void test_mprotect_with_pkey_0(int *ptr, u16 pkey)
 
 static void test_ptrace_of_child(int *ptr, u16 pkey)
 {
-	__attribute__((__unused__)) int peek_result;
+	int __always_unused peek_result;
 	pid_t child_pid;
 	void *ignored = 0;
 	long ret;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
