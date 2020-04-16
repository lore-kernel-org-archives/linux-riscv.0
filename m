Return-Path: <SRS0=YukA=6A=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355DAC3A5A0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2020 22:01:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C0F822209
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2020 22:01:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S1UNlrEr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C0F822209
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=14Ju6mOxlL9LJIOW/FTdgj6GivNAEkcDFvA+NJF0hh4=; b=S1UNlrEr8ym5Fr
	8GXy7vrEQwDRTM62e0CMq691u5NLjEzIUrewMzQTITdXUAGtBjS8IvdKhE+F/PtoX6l0zd6vzjEya
	bnE171M0fK6FzVPSIAdIODsO1i57ocyS0S1WeDdevEcZ4DqyhPbh/Aa/OOBRHMMRZtEmmjeO2+R/0
	jJxSEV94nkfRr5Zvr1lgaPYtPZBKEi3D7L5+CXyfoI1XBaFpbaEKhB0G+dvKbXNnXvaGdUwk7opJi
	0j4maoobw/1LSRr18XweRw8/kG54WQUGqYnk3IwVVWXSvA/1eyr0DlJYKMVHy51S5AbJOsxcvd+sh
	ZADz3p84CkjaQunwVOmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPCZi-0003Vf-FS; Thu, 16 Apr 2020 22:01:34 +0000
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jPCZg-0003U8-Ca; Thu, 16 Apr 2020 22:01:32 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v3 00/11] Make PageWriteback use the PageLocked optimisation
Date: Thu, 16 Apr 2020 15:01:19 -0700
Message-Id: <20200416220130.13343-1-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

PageWaiters is used by PageWriteback and PageLocked (and no other page
flags), so it makes sense to use the same codepaths that have already been
optimised for PageLocked, even if there's probably no real performance
benefit to be had.

Unfortunately, clear_bit_unlock_is_negative_byte() isn't present on every
architecture, and the default implementation is only available in filemap.c
while I want to use it in page-writeback.c.  Rather than move the default
implementation to a header file, I've done optimised implementations for
alpha and ia64.  I can't figure out optimised implementations for m68k,
mips, riscv and s390, so I've just replicated the effect of the generic
implementation in them.  I leave it to the experts to fix that (... or
convert over to using asm-generic/bitops/lock.h ...)

v3:
 - Added implementations of clear_bit_unlock_is_negative_byte()
   to architectures which need it

v2: Rebased to 5.7-rc1
 - Split up patches better
 - Moved the BUG() from end_page_writeback() to __clear_page_writeback()
   as requested by Jan Kara.
 - Converted the BUG() to WARN_ON()
 - Removed TestClearPageWriteback

Matthew Wilcox (Oracle) (11):
  alpha: Add clear_bit_unlock_is_negative_byte implementation
  ia64: Add clear_bit_unlock_is_negative_byte implementation
  m68k: Add clear_bit_unlock_is_negative_byte implementation
  mips: Add clear_bit_unlock_is_negative_byte implementation
  riscv: Add clear_bit_unlock_is_negative_byte implementation
  s390: Add clear_bit_unlock_is_negative_byte implementation
  mm: Remove definition of clear_bit_unlock_is_negative_byte
  mm: Move PG_writeback into the bottom byte
  mm: Convert writeback BUG to WARN_ON
  mm: Use clear_bit_unlock_is_negative_byte for PageWriteback
  mm: Remove TestClearPageWriteback

 arch/alpha/include/asm/bitops.h | 23 ++++++++++++++++++
 arch/ia64/include/asm/bitops.h  | 20 ++++++++++++++++
 arch/m68k/include/asm/bitops.h  |  7 ++++++
 arch/mips/include/asm/bitops.h  |  7 ++++++
 arch/riscv/include/asm/bitops.h |  7 ++++++
 arch/s390/include/asm/bitops.h  |  9 +++++++
 include/linux/page-flags.h      |  8 +++----
 mm/filemap.c                    | 41 ++++----------------------------
 mm/page-writeback.c             | 42 ++++++++++++++++++++-------------
 9 files changed, 107 insertions(+), 57 deletions(-)

-- 
2.25.1

