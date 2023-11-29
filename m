Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F96C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 23:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WHoglqHcT54IHYp3JZyIGFKXnSsnEMG/+SReKODRZ/o=; b=KL8wdznjOvpjFI
	s11h2/VTsaeuYR9xIxg6j7QuPBAy1QXDip6hlPa6cmSFTYGZvWEMjgdMm9LiTBWn4QDgAEXPLDPZI
	6IbYgjQhkqtFRzEf7qs36JSqyA5ROo6sQPNpL/H5jU8Xcovr+/gPCI5Kfkhw0dh4shVbrhzyhrURL
	smCbh+vE6X2HGQq8z0a0BLPaUdDQUkghW31zIZVI/fwUINi2Zt7kZ+RCrI+jvuR3H+U04x9H10x2v
	kwFGWUVUNiqanMuKzntnq60HeWTqlIrQEFOivvwKqx0tWzrDzDAG4sF8IDp9Tbs2YCjn2IMFoeHnC
	S0dV+w/vrvlSgWrVjoBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8U0P-009VZD-2k;
	Wed, 29 Nov 2023 23:30:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8U0L-009VYF-2u
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 23:30:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8C7FEB83860;
	Wed, 29 Nov 2023 23:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D53C433C7;
	Wed, 29 Nov 2023 23:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701300603;
	bh=SkLsMu3Rty3isSC0Z5GyFZX6XuqhUs1znj+pThA/4jw=;
	h=From:Subject:Date:To:Cc:From;
	b=OMheO98fL0KVjOHUecQQmELTMVNw+EZNbXgDquWeoCUgyK9h2zXfXFoDC+l5hLgjw
	 H40ExQ2yBouWEwBOhT9F0BuLOxGEm66S8AMrxe6x79MOKTw8VWIkdX9WuKTVsNIB+7
	 kHOWkwpuAnhPyKQ8ulBq4zaEoMYiK5F5G7QwCOCp2AhDrLhrV4J9Z8N1qD/2bxyI8P
	 7xnzDCGDua7HkWlWOo9seEcALqEBjuW6R5Alirr1nlvqZIZVvN2EflBHVRNW6IXXSb
	 f9Mw3vayyXtDbq17FGmX+TKrVF8nV8SXkjvQAqeP26bd2+91mtP8r8C9WfKFICsjo6
	 2oLXwwU5U3Ouw==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] RISC-V: Disable DWARF5 with known broken LLVM versions
Date: Wed, 29 Nov 2023 16:29:46 -0700
Message-Id: <20231129-riscv-restrict-dwarf5-llvm-v1-0-ec0d368fb538@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGvJZ2UC/x3MwQqDMAwA0F+RnA3YTtH6K7JDW6MGnJOkdAPx3
 1d2fJd3gZIwKYzVBUKZld9HgakriJs/VkKei8E29mGMdSisMaOQJuGYcP54WTrc9/xC7wbbhuD
 6NgYowSm08PefT8/7/gERRGEWbAAAAA==
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 conor@kernel.org
Cc: maskray@google.com, ndesaulniers@google.com, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=961; i=nathan@kernel.org;
 h=from:subject:message-id; bh=SkLsMu3Rty3isSC0Z5GyFZX6XuqhUs1znj+pThA/4jw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKnpJ6v09+0p3xu/XT/22JnnEYEzDYrOT152wehtquXU6
 ONVc/l6O0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEzAwYGZb+4jwmsVHPMfxQ
 40btU45xqj12k5btMVXa2L8r5/Z0ByOGf9p73m976b5wUabbBWbl9zsP6AtEaj2dpakSuUzwu92
 fSk4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_153006_074673_7AC76ED6 
X-CRM114-Status: UNSURE (   8.99  )
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

Hi all,

This series disables DWARF5 for LLVM versions where it is known to be
broken due to linker relaxation:

https://github.com/llvm/llvm-project/commit/bbc0f99f3bc96f1db16f649fc21dd18e5b0918f6

If I understand correctly, it sounds like GNU binutils has a similar
issue but I am not sure of the status of the fixes and such, so I did
not bother with checking for it but it should be easy to add if so
desired.

Cheers,
Nathan

---
Nathan Chancellor (2):
      riscv: Hoist linker relaxation disabling logic into Kconfig
      riscv: Restrict DWARF5 when building with LLVM to known working versions

 arch/riscv/Kconfig  | 14 ++++++++++++++
 arch/riscv/Makefile |  4 +---
 lib/Kconfig.debug   |  1 +
 3 files changed, 16 insertions(+), 3 deletions(-)
---
base-commit: 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
change-id: 20231129-riscv-restrict-dwarf5-llvm-a9824bb974cb

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
