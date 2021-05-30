Return-Path: <SRS0=590W=KZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24E7C47094
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 16:50:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5F3661108
	for <linux-riscv@archiver.kernel.org>; Sun, 30 May 2021 16:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5F3661108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AsC5lk20dyc/s6FOgC+I2IbkQGeVw3BHKL6xiGS8peE=; b=Pg2reBuSj4/rzW
	h6xo4dQ5K09rqlBA0Lz89R2drxA81AH/0q+c3LewiXZl96OXkPCXVo9f0USYjkeArRYCikKAxcjcx
	r0GMIyAr1oolYTyW6Wkm2vNcKIf9uRuthMYBbNKu+sZpJA14rNIr9nzUvYLJ44YjNC28rN1L+v8lA
	m9PralcN3msnLJDS3ul2YApztEjyuyV3/TiZht2YDn2HXevRbmfHNO2Yo/ICdcKzn77+tY6BqLbLY
	XyJ56Xloyj01GxA6IL8xxFcxtApsuz8MA5hqOmFtiHotYUk0o+LZLNv7/pYREdTiNUPiUtPSDwfPV
	Rjj8PVFo4lVv8gahfZbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnOdl-009tos-8F; Sun, 30 May 2021 16:50:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnOdi-009toB-Be
 for linux-riscv@lists.infradead.org; Sun, 30 May 2021 16:50:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82A9E61027;
 Sun, 30 May 2021 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622393413;
 bh=HDSaZ0r8YKgOW4RVtraztMNXpYLvrjOWnnb7z2CxfsQ=;
 h=From:To:Cc:Subject:Date:From;
 b=GAGEb5c22zpNCgKwGBgY8HNtxiJgf0vgoElGLScInJXq+kuUkcai+NAm5FYi1S5fe
 Wfdn/WN+Tra9jBnjfvuw0dBg7b5AjxiD7BIRbn00pRkCh0xyDVYPvwt74QsoXXOUOS
 gfzas4nvp/Jca6YhLA/1tHUWJkEAFHPEV4mOEn0FIgu5H0LNMmXPQmeyoUx1f3rS8W
 oy7zXQIGU0rqhAfdie79pXVa/2nJbvWhtsbObF93E1Dn/X8hBjHCxY0UVDQc1qa6Ac
 sLvrTnTQT502mD9HDx13tAidDdRzPTNdIqqMsWpEZpEVMPH7kUc4trbRRMdJtEi1IH
 JBlAUV7Vaf4lg==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, hch@lst.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V5 0/3] riscv: Fixup asid_allocator remaining issues
Date: Sun, 30 May 2021 16:49:23 +0000
Message-Id: <1622393366-46079-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210530_095014_444306_6621F8EE 
X-CRM114-Status: UNSURE (   5.22  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

The patchset fixes the remaining problems of asid_allocator.
 - Fixup _PAGE_GLOBAL for kernel virtual address mapping
 - Optimize tlb_flush with asid & range

Changes since v4:
 - Fixup double PAGE_SIZE add in local_flush_tlb_range_asid
 - Add tlbflush: Optimize coding convention
 - Optimize comment

Changes since v3:
 - Optimize coding convention for
   "riscv: Use use_asid_allocator flush TLB"

Changes since v2:
 - Remove PAGE_UP/DOWN usage in tlbflush.h
 - Optimize variable name

Changes since v1:
 - Drop PAGE_UP wrong fixup
 - Rebase on clean linux-5.13-rc2
 - Add Reviewed-by

Guo Ren (3):
  riscv: Use global mappings for kernel pages
  riscv: Add ASID-based tlbflushing methods
  riscv: tlbflush: Optimize coding convention

 arch/riscv/include/asm/mmu_context.h |  2 ++
 arch/riscv/include/asm/pgtable.h     |  3 +-
 arch/riscv/include/asm/tlbflush.h    | 22 ++++++++++++++
 arch/riscv/mm/context.c              |  2 +-
 arch/riscv/mm/tlbflush.c             | 57 ++++++++++++++++++++++++++++--------
 5 files changed, 71 insertions(+), 15 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
