Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCB7C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Mar 2022 07:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UqgcPhbies/+CiTEPi426i9f6nns3lc5Pu4NTbkbICg=; b=ttmwwSOdjnIeBV
	vf2bhXdFd+r+zKyOV+g9HVze4+HFKpfGjTj/NohzX6fT3BHBzM81csb9LzQJUQDzxNg5xd1AwyrEy
	o+LrLYpNVBXa9BZB6bVw8Hs4qD83cosBhUv9r6OAQQG/a/0DQPdlrjHBUeCTQSXyjbqNozG6vupeS
	k2bkEE77NCmU5KmwUc/RZewIv7vbBiPl5WVdJC8pzn39jhTC8XENX+S+crknOPxS8MdXvVXdzt+bx
	JT8OH2lst3lQcahN9A2xP0KD78QgUfegt9x0gZJzoeLyTY9RTw9cusWE9A5Llpor/TSYcJNX8UQRS
	LvX0c3xwgVE9GLg2YFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZSqC-00Ebsv-4c; Wed, 30 Mar 2022 07:34:04 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZSq9-00EbrN-FV
 for linux-riscv@lists.infradead.org; Wed, 30 Mar 2022 07:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1648625639; x=1680161639;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K672uUqxDrF7zy+d+ns9cy66tx5nctnpny9P8BPsp1w=;
 b=Nejx2nTdpzmfE7+uKhnTLM5/oERI5TfJnXrZFTOR1/cL/k1tarXcAJl9
 mI5J6HZ+5HrJrPRFpGaxVqVTV60dEDkA4YthZUkkGHPQMgPq+SkKn/NL2
 06BEf6H0N19CLAQ0JMxbRqgJpjBdo9dAQJihq9Y3m3kBG8ajhDelMlmd5
 0KmgkVDOBBwr9FsKD6J5t5S6flQajgMg1nYO+rxTOS3cPkdEPHNt3IyXE
 d1rwD2Mp+Wp8DymHhRUw2xM4obrYhNJUIGcZYsQVmaJ9T2/PdGxhRvhIs
 iNCIifp8JHU0vRpUe21XssJSEOWA+i2dqyxNvmlZRCXgn/ZJqQTwX/Bdh A==;
X-IronPort-AV: E=Sophos;i="5.90,222,1643644800"; d="scan'208";a="196622214"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2022 15:33:58 +0800
IronPort-SDR: gOj5ZQg3IbEbpEfJHS00zluMSyVYuCysTDEFP7de/Q3DAeTR1G+DpN0D3eFW2S7m4xLF98tlMS
 6h1exWKC+DR0ynCk4z8PiYBypOCBqxdE2MGLTnmTnN8H7t2KcN0k6fSyyGQLY07qG/CPbnSrw4
 xZj6TtaEShw/40YGl4w/uN/7obXAURMNh981XDXHv9nF5nctidLOzEQlJFUavEEyb+YzjreZ/5
 XZrRfZE55BdINGs5n45idBo+4lNR187BGi1X5i/8v7wSImhfueq3bOO7UG19mBCI7p6sV7leN2
 NMB5AgbVCBJH191xBy21jGmO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2022 00:04:50 -0700
IronPort-SDR: jQiHWX6hU7MXQcb7G7GXmC7sX6T+obvQfeNcyBpi04iqKlXWmefOC2tXpzxyhwO9+lQkbLVgk6
 WP6/vOFdto6U6lIvLPtiO4DbODdoAfR2hydCc+sPIdDg3qZYUZWpHzMyjY3XG/TIIcpfKBlNM+
 ci5j6O8b0emmvv5V0J7FiBb6f5Cv79qGv3wW7quErboi05+8Kqe9zvyIkCmfmCL3jgHjMFP7OH
 w+PxtZ4VXf5wgMiInTLW/LcZ2JXpLeHuBS/thMCvi0UjEU1FoUc/z25Ng7j9RHZ+8bdxTQpLgi
 Pq8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2022 00:34:00 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KSyqC6gQtz1SHwl
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 00:33:59 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1648625639;
 x=1651217640; bh=K672uUqxDrF7zy+d+ns9cy66tx5nctnpny9P8BPsp1w=; b=
 Z6SGtjn0tLBh5p1+VQlUazr7x1EUmEPQPc9QtjkVF5pqPwRKgtuuAzX2sA1RhYGN
 Db+QdscNUdkM1UllHLT+EBdZ8NArST/950LzyjGdlwocfpksG1uycISIFmvTEukA
 7/QIih1SPddp4ZwzgtbiKEdZyupBTtHCST3TmcTc6uLnn5oRqqlfCRxICkWCIbHo
 uwdKI0DlkTk3O6VHd/PoFg/r0yVBnWObH/a814MBsDjmzCjH4RHp7IM+oPaS9WyI
 8Z0L7PrAY6LZHrErfqoF2sjjoT/eMxG3iFcGbNTkmzTolaPQIZDC1+9Dh2wnv5QZ
 4EhH81YvTiXqSbqmXo0mkw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id 0qQnvWHT1ovE for <linux-riscv@lists.infradead.org>;
 Wed, 30 Mar 2022 00:33:59 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.112])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KSyq54rsgz1Rvlx;
 Wed, 30 Mar 2022 00:33:53 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org, atishp@rivosinc.com, guoren@kernel.org,
 anup@brainfault.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] riscv: Ensure only ASIDLEN is used for sfence.vma
Date: Wed, 30 Mar 2022 17:33:47 +1000
Message-Id: <20220330073347.3898802-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_003401_591930_ED031DEF 
X-CRM114-Status: GOOD (  17.35  )
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

From: Alistair Francis <alistair.francis@wdc.com>

When we set the value of context.id using __new_context() we set both
the asid and the current_version with this return statement in
__new_context():

    return asid | ver;

This means that when local_flush_tlb_all_asid() is called with the asid
specified from context.id we can write the incorrect value.

We get away with this as hardware ignores the extra bits, as the RISC-V
specification states:

"bits SXLEN-1:ASIDMAX of the value held in rs2 are reserved for future
standard use. Until their use is defined by a standard extension, they
should be zeroed by software and ignored by current implementations."

but it is still a bug and worth addressing as we are incorrectly setting
extra bits.

This patch uses asid_mask when calling sfence.vma to ensure the asid is
always the correct len (ASIDLEN). This is similar to what we do in
arch/riscv/mm/context.c.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 arch/riscv/mm/context.c  | 2 +-
 arch/riscv/mm/tlbflush.c | 4 ++--
 include/linux/mm_types.h | 2 ++
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 7acbfbd14557..4329fe54176b 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -22,7 +22,7 @@ DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
 
 static unsigned long asid_bits;
 static unsigned long num_asids;
-static unsigned long asid_mask;
+unsigned long asid_mask;
 
 static atomic_long_t current_version;
 
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 37ed760d007c..4469615aa07f 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -10,7 +10,7 @@ static inline void local_flush_tlb_all_asid(unsigned long asid)
 {
 	__asm__ __volatile__ ("sfence.vma x0, %0"
 			:
-			: "r" (asid)
+			: "r" (asid & asid_mask)
 			: "memory");
 }
 
@@ -19,7 +19,7 @@ static inline void local_flush_tlb_page_asid(unsigned long addr,
 {
 	__asm__ __volatile__ ("sfence.vma %0, %1"
 			:
-			: "r" (addr), "r" (asid)
+			: "r" (addr), "r" (asid & asid_mask)
 			: "memory");
 }
 
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 8834e38c06a4..5fa7cc0af853 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -666,6 +666,8 @@ struct mm_struct {
 
 extern struct mm_struct init_mm;
 
+extern unsigned long asid_mask;
+
 /* Pointer magic because the dynamic array size confuses some compilers. */
 static inline void mm_init_cpumask(struct mm_struct *mm)
 {
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
