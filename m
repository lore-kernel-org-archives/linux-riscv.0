Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30965C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 13:17:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76A3B60BD3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 13:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76A3B60BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y1K3VOAzyzanFYxLoH5BaUpYumzJAVgR/9aD64ZeciU=; b=oswDIUgAPj8m99TiE66ciyeGq
	46c4/ZFsdwaixrexV3q1dAiyLYE+UVJKNWcGYRud1fgGnrdlreb4ghfhVbomWkzKGVHQb7CtsRPJi
	C7E7arsn9eexQRc6V8D/lHd0EcVxBV2Q2bkuU0ViheeqYrom5f3bmpvA26H+7gPvvDQ11MJvvYfyK
	LaqWJHooe2zd2rrLrzLca/Fj9s0e0VJCUQYL9fQO2k//QX1zKsHupeXIECb+O31im6Vwdjx8lyyFi
	StIi2iYJhR5piH5q/ijQzndYXzYG/JNNtBy8ZT/4nljPm7CboKAuLOIudG5Jm2Mk17hI9tLpYZEXa
	acvb0hwxg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYqFu-00CBIT-L1; Tue, 20 Apr 2021 13:17:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqFX-00CBC5-20; Tue, 20 Apr 2021 13:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=2UiMd1x2iPg5BHSmMMcJrxFoD7KyHYuCPHs/JKxkkTI=; b=TC3+I8xWTuJNoQ2HJUk8oNCgrh
 UzUQm5OVUgYDGaXdRCo+hbYXreIIBfkCOXTFV4J83WYPo/qKjNMrsj7SbGLWvlB9Abuywsw72YipZ
 osV4sumbZ3dCXYb1NKnKC9GADrtTYE/JGKtIVual1isz7n0UhCMxotyJFFprLPxM26oJfItkhOtMJ
 wsFhnoW1AdDx5TN2iIgNTl5X91GiulM0Sx2mhBO1dgveEw9GwLHh5K2Y15qE1YccS0hqrQfdHYTjv
 nGhhfF+JnxhxhFFEfCzlk6q3apwO2XJgZxiPSH9ODWVlonm79A7MfXu2slTxfymDAk6fFDmZYjV1t
 P/9idRuw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqFS-00C8I2-S5; Tue, 20 Apr 2021 13:17:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A58626101C;
 Tue, 20 Apr 2021 13:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618924622;
 bh=WQBjtjBUVixKPUq09lDhJ2RWgVokupnypM/eycKpBe4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o20bjAEWBJIEF1h8/qnesID8pJlsOtYuQBEFthZNIuah5vjhGL7mYjpmIzPheyOx4
 zLmqEbpr2OKL7I9OmN22sKr2N7ibr2TrEl5aMvAOxoDBtPZqdRTGpZoyJ2PJqkfxJV
 Qbxe7kAtQvCe0Cszrfy03TeNMo4aOoMIbPjQ/IhtksgBNK+KbWwn5JjkQyeTlh+9GW
 7ayegBRJ7F9EeOZgbRVUmdGD+Gtl0pbyUlvLoUAxk3zVPW/ZgQB24WZZ3cq+M4yt5b
 cS+Z7QvAnRl9GQRZmMTOmd34XlEqDq8drJq7x8VbwE6eT/oQpXisCqiOOov/gnN9P+
 LmH3i4FuAUXpw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Shakeel Butt <shakeelb@google.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Tycho Andersen <tycho@tycho.ws>,
 Will Deacon <will@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
Subject: [PATCH v2 2/2] secretmem/gup: don't check if page is secretmem
 without reference
Date: Tue, 20 Apr 2021 16:16:10 +0300
Message-Id: <20210420131611.8259-4-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210420131611.8259-1-rppt@kernel.org>
References: <20210420131611.8259-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_061702_990329_F90ACA41 
X-CRM114-Status: GOOD (  13.33  )
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

From: Mike Rapoport <rppt@linux.ibm.com>

The check in gup_pte_range() whether a page belongs to a secretmem mapping
is performed before grabbing the page reference.

To avoid potential race move the check after try_grab_compound_head().

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 mm/gup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index c3a17b189064..4b58c016e949 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2080,13 +2080,13 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
 		VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
 		page = pte_page(pte);
 
-		if (page_is_secretmem(page))
-			goto pte_unmap;
-
 		head = try_grab_compound_head(page, 1, flags);
 		if (!head)
 			goto pte_unmap;
 
+		if (page_is_secretmem(page))
+			goto pte_unmap;
+
 		if (unlikely(pte_val(pte) != pte_val(*ptep))) {
 			put_compound_head(head, 1, flags);
 			goto pte_unmap;
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
