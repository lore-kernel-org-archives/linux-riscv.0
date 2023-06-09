Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15644C7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 23:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=spC9o/Ar4+TE8rbGF0TbVLA0MqWk4WjvGcAHhBv78EE=; b=O8JUoKsWSVnCfU
	/zljhmB9cx2cJSDntDeeIxVY8yi3YacH7udyTRfcFPrODwPmE9DjwBtviUEtf2mVEtRO46F+R+uMB
	bYbqwkjRVbxJNAGDVuMB6QWOYeOtlpxPYm9rwFoPbJeKY2SNR8qkE0aXTtAb4bmbcjaY398P/nhT9
	9aczvRhp+K9zFz4vjlCLN6HWxIiscImpSjp7VSvwl+luqAHd5bao7xRI5KEdy3elpFc7IWgMVY2ej
	xb0YaIxkJBPGx5HKxP6Xrr4Leg3l0/GqrzI8lkcXYz5W7pruhqbjYOOvLwAdEIGnRyIlFosvCz5tK
	zGpDsK1iFVecm6ssgg3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7lrI-00Ebzs-1r;
	Fri, 09 Jun 2023 23:49:32 +0000
Received: from out203-205-221-191.mail.qq.com ([203.205.221.191])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7lrD-00EbyZ-2j
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 23:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1686354541;
	bh=bpuiYw7aOu1hTubouULzt77m8lYy98Ok47YzdGnD6Bk=;
	h=From:To:Cc:Subject:Date;
	b=LrZBIqi4Iw8xbGi0h8bClEjDjWbh2gC9VLEc2rEn30f81oU4blqyspuM92g32DMa2
	 a8zjjAlhhl1OBH5HyNNJ43zody95bU9YvZBvMUySwnP5LaTTWBJYHb2n4OYUjAQnuk
	 3l25ZP+YN1zfYNVHFQbMAjDyZAampB4kZ4vlHYRA=
Received: from localhost ([101.224.149.128])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id C3B3E632; Sat, 10 Jun 2023 07:48:59 +0800
X-QQ-mid: xmsmtpt1686354539tdu6ve0y0
Message-ID: <tencent_D656D683705F41324657ED3393C3384C7408@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur9FKOmyCjEVaaztjBKmlj53eegGO13ZbfN/g5qTleK0aCa+9mAGG
	 lCiXFH6NvrwMhkmrYUf7BZei8wn3boTZUALlplZs04v8yx5DEAn1qTU7OtKAw7AcsJTisDEU7SQh
	 xkUkOWc4ExbmSL6iF8LuFHbHgBWk0jeweLFcdhrFEO+wDPHxeiJ5gpQo1fb+bxUdM/bu+IQIkbFy
	 WFkucEHn8FuZ+v1RCPHZJEKxnlECu2z4dEQF86aLIcu8j+U74rn2EhEbYJGgNY5UxbVTOC6jno3q
	 dncF3jGtn7jsT9UY91KrSF+UA90E83PIbxJ+0pKBOlhxbJyGiC+Emx2HofJgZWUu7fly2VkfNN/x
	 SA/2MPNOoIXeazMGGYFu0fnzCxHdn6MvFr3sn7THWM5PPJ2uDoWv7IsQ0FFs6R5Mq1KsPHfZVQw0
	 fVEG5PrA3PTdY+lQMZqzdOjINO9cPSB8BgODArwAlFCAR5Qa7uzhUSvWx94sXAGNzoeRbFf+SA11
	 GjZXSfQJo2CUunj96ljRWtry06JqaOJU4nagMMDZ/jLIU/EwQEg+IP9B3Y6jO59aPXOrMdTRSbf5
	 jDSJyErWvfet2tDPl+NNLrwTJUVQ+v47oacGmQ98t7BMs8J49d+to1vV8FLjjpZ83EyBKnyulN8s
	 4f6tpT3XfbZHn4geo/H8JWLc/oo5NhOxJkqyVd5F4K0W4tHa42OZqQPKyEJ3NE0kteVQMuWWxern
	 Q5zMV84tGZnpcYdd8ENvHOV6yE+4vvRk8Qc04vhkKjTdKlSziklGqmVS284aCuzz0biDC6xcgd1t
	 X++GxwD8uqWqTgqu9Rq0RoBWY7ossa3+cVcVGKV98fer2MtqmZybdgfKdEhtAlLBrBZLtchy5iWG
	 PEfdywNTlUSdonvQo2ZKd/pckfW2x96DZ12eU6I3/QVw2xItqnr2tMiAhuhJBtKq5f7G804TklTp
	 p8vHohUZdB/xnGUayWhMqoQ8XCgwl3
From: Woody Zhang <woodylab@foxmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Woody Zhang <woodylab@foxmail.com>
Subject: [PATCH] riscv: move memblock_allow_resize() after lm is ready
Date: Sat, 10 Jun 2023 07:43:20 +0800
X-OQ-MSGID: <20230609234319.839760-1-woodylab@foxmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_164928_208069_0FD9566B 
X-CRM114-Status: UNSURE (   9.82  )
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

The initial memblock metadata is accessed from kernel image mapping. The
regions arrays need to "reallocated" from memblock and accessed through
linear mapping to cover more memblock regions. So the resizing should
not be allowed until linear mapping is ready. Note that there are
memblock allocations when building linear mapping.

Signed-off-by: Woody Zhang <woodylab@foxmail.com>
---
 arch/riscv/mm/init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9e9da69720ce..8a33ecbb4d0f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -258,7 +258,6 @@ static void __init setup_bootmem(void)
 	dma_contiguous_reserve(dma32_phys_limit);
 	if (IS_ENABLED(CONFIG_64BIT))
 		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
-	memblock_allow_resize();
 }
 
 #ifdef CONFIG_MMU
@@ -1250,6 +1249,9 @@ static void __init setup_vm_final(void)
 	csr_write(CSR_SATP, PFN_DOWN(__pa_symbol(swapper_pg_dir)) | satp_mode);
 	local_flush_tlb_all();
 
+	/* Depend on that Linear Mapping is ready */
+	memblock_allow_resize();
+
 	pt_ops_set_late();
 }
 #else
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
