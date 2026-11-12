Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368FA606A8BE
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k28a3diH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lCDGyKKY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GYByu9mcnBZyP7WW1HyoTJbsjH0YKyWFaU24WiwDDgg=; b=k28a3diHa9SjkQBzVcYO7Q4wKU
	OAB6XWm57FCJuJquk3ZfNUGa3OkJM1hP1Cvsph3qVUzemShyZRCl67/AZbagDNQVOGitZU8tTHgGW
	aAyJa4Ot9OHDU2QFs721z0ONTB4FHFgFE9FTmybMbBCLODGaN8NRd4pXxioXsXdJ93vujrGxP54lr
	gklzaGNSJcRlApPF0uk/VuZJWTB7uN+V7r9Swl83AEywnEH3Eu2zPrpm2fOFsdTe/UpIK20HXQajb
	rp/SvZAJDpXCC1qiNL4ncTuZo6odffqRRlgJ+BDuZZ/yoVrA8wtUBLv1sMff/9qmSUxDhF02rEack
	F/8geFuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXp4-0000000Ad0T-3gOU;
	Thu, 12 Nov 2026 16:38:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXoJ-0000000AcaA-0kyb;
	Thu, 12 Nov 2026 16:38:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE86445050;
	Thu, 12 Nov 2026 16:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460611F000C6;
	Thu, 12 Nov 2026 16:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501482;
	bh=P2GAXQL+CRALZ6ktolsI+wkJgETtKYVg5/S1WwdnjP8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lCDGyKKYBC8Fs6CZs83hFW2kfQvIWzrbx55R2xhY23bPVejs4jP03UhTMbPYwkdFq
	 6QnSYzu3WeVqWx+Ar0edjh2cqOYYgzZqe/DZ5+wO5as7ByI7SvXh6bulOXMCzm12Eu
	 kASOJRtSewIDlEzyPzzCY1AdAWX/EVv1Af43bEp/TzGRyu8tlqudESjSsVdhjFBpbc
	 gPakCksrVRPklHGcZFFoijOXgWwbOd12WzoiKbEcn8WBWaclGOUWPLB0E7xNqJ2ACq
	 pLxZ0JI0ySEeRWv9k3TGyTyi5fx1EhNiDCo/FW3wSZW06JeHOMYn6a8E5q27+Wxlkv
	 sJ5MuJnwBIRmA==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 12 Nov 2026 17:37:08 +0100
Subject: [PATCH RFC 2/4] sh/crash_dump: check ioremap() in
 copy_oldmem_page()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
In-Reply-To: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
To: linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Breno Leitao <leitao@debian.org>, Chris Mason <mason@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, x86@kernel.org, 
 kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Hildenbrand <david@kernel.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1003; i=brauner@kernel.org;
 h=from:subject:message-id; bh=q6FpWygcFHpF/XYp2OeRsrvJ/y8aBzOdxnvKzJI5CUg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9fR2ZXPfx+k0nz9UdCcufZi5bEfNP4/gkpZxGBe7ty
 U5mqhMMO0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACbCX8DIsO3Srhdppo67Nmsn
 CMzvSEg8stFmw5lYXa2tcWbPH7+Ou8Pwv/BN4KTdgsEMAr8vHor9ftTa73Deda0PH0/LeesVzJZ
 gZQIA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
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

copy_oldmem_page() maps a page of the old kernel with ioremap() and
copies from it without checking whether the mapping worked. If it
didn't, the copy reads from an offset into the NULL page.

Return -ENOMEM like the other architectures do. read_from_oldmem() turns
that into -EFAULT like any other short copy.

Fixes: 4d5ade5b29c6 ("sh: kdump support.")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 arch/sh/kernel/crash_dump.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/sh/kernel/crash_dump.c b/arch/sh/kernel/crash_dump.c
index 19ce6a950aaca..85c0e58f1a59f 100644
--- a/arch/sh/kernel/crash_dump.c
+++ b/arch/sh/kernel/crash_dump.c
@@ -20,6 +20,9 @@ ssize_t copy_oldmem_page(struct iov_iter *iter, unsigned long pfn,
 		return 0;
 
 	vaddr = ioremap(pfn << PAGE_SHIFT, PAGE_SIZE);
+	if (!vaddr)
+		return -ENOMEM;
+
 	csize = copy_to_iter(vaddr + offset, csize, iter);
 	iounmap(vaddr);
 

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
