Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1019F606A332
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 11:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=we52hlnE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dx43PY55
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PUK4M0GmWcrmHV6tvuiWd+cXOPYGEskULblQjtO3TUw=; b=we52hlnEKoculfpEyPhAW9P28v
	3Ztk7MLlzzo+H5Au2duFCbD8eKjAFcgGnmEDaN8TGwNQFSE7kEey9z0grAWFMWThMcDMmVIt8Tpp8
	pdLQeSwrmQhkElXwyD0jQE1tj7ru6L8Il9KS9onLlxwH4kigYlUcNdsssYXWwKNBzmhS7JTa6bAc7
	SRL0QY40oXb4sNNv+HfuwuMFretTyHe5CjEy7i54FF4PJnes1PHAzh1+hErPQ6Om842y1b9RFJlWK
	86GaViL8lxmvDk6UwaWTOydIh6RaCJg0CVp82Tv2IIlr+NQ20IoG1vb1pcmVkVbpqXWqtDF6xpI+u
	cWr9OMLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXZ0-0000000CyA8-45M0;
	Thu, 26 Nov 2026 11:22:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXY0-0000000Cx4W-2Hfz;
	Thu, 26 Nov 2026 11:21:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE7B76338E;
	Thu, 26 Nov 2026 11:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016FA1F00A01;
	Thu, 26 Nov 2026 11:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795692111;
	bh=0iJQZ4JiZ/q2z43yM7sOmznlEhFue5dKtH3ZUaEt9EQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dx43PY55rPzSGwZLE10j3vMNvaChqjvukI+hPnb8O51peEgCTLD7xqLTbXfhZ4QnH
	 7pS+CZwsAXWfxbp/4JWBDp9do/VBawZXTV3ccWCbpuxUm3w6GIXCKgzhyOTodD89yQ
	 ebb1YIe3iMbTjMMO/txFQf9GfMmJqyzqek8CWJtoABUH/UGA97XeGs0zu1baThNVfB
	 qDDME3ZyjhYMlfHBuGiRumtfOFkh2Ov+xT0sD1dGDygGZA0oxdLDYurcRO0mTEOe5u
	 Z6FZ9HTm6ofPbgw7bA+4BeT2anx67vEy634jk1w4kSn7Xl1XzAFdMJa49y6aHSgZNL
	 iNMGCJcVGRqGA==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 26 Nov 2026 13:14:59 +0200
Subject: [PATCH RFC v2 46/54] s390: remove set_memory_rwnx()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-generic-set-memory-v0-1-v2-46-723f1e33c3d8@kernel.org>
References: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
In-Reply-To: <20261126-generic-set-memory-v0-1-v2-0-723f1e33c3d8@kernel.org>
To: linux-mm@kvack.org
Cc: =?utf-8?q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Borislav Petkov <bp@alien8.de>, Brendan Jackman <brendan.jackman@linux.dev>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michal Hocko <mhocko@suse.com>, 
 Mike Rapoport <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16.1-dev
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

set_memory_rwnx() has no users since commit 33bd8d153c33 ("s390: Keep
inittext section writable").

Remove it.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/s390/include/asm/set_memory.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/s390/include/asm/set_memory.h b/arch/s390/include/asm/set_memory.h
index e3562bf0c1aa..23987b721ed9 100644
--- a/arch/s390/include/asm/set_memory.h
+++ b/arch/s390/include/asm/set_memory.h
@@ -57,7 +57,6 @@ __SET_MEMORY_FUNC(set_memory_rw, SET_MEMORY_RW)
 __SET_MEMORY_FUNC(set_memory_nx, SET_MEMORY_NX)
 __SET_MEMORY_FUNC(set_memory_x, SET_MEMORY_X)
 __SET_MEMORY_FUNC(set_memory_rox, SET_MEMORY_RO | SET_MEMORY_X)
-__SET_MEMORY_FUNC(set_memory_rwnx, SET_MEMORY_RW | SET_MEMORY_NX)
 __SET_MEMORY_FUNC(set_memory_4k, SET_MEMORY_4K)
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int nr);

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
