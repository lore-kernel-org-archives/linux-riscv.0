Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA0FC05027
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AdDMuea2j4qhF42MRVsx8mH/AnB0H3VMXyVTCYG3hFs=; b=2xLpyKYnN3jDIB
	4aLZAGD9mh7vEOc65vwMrc/FxYDodS6LxrDrLXp/nyLamOeyp/+PSqSF7qGnJ6/KMbG8FroN+6al4
	ho25d9YRSxy7J29RexvU13jez4u2JJ+EjDveVKYE3bMsSJJOo2L11vmqk0pRR46tiNmC4kwJkazaI
	j8ndaEG/6WbMxYrl15Nw2sg4GMOXjptWq3wfeB/eHBqPBeu6F1LQvX577aZ8EWxuPjRZs2a6UGgZG
	/ATGzDdTk5rseYRBjsV+vjEj3EI5zFaMjD+l69NA8ngXB434fLV1QdzHF5k97HG0m+W1PhfUCvk/j
	vn/9RBqOE2L3YzvQVNeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9R9-00B13x-M9; Wed, 01 Feb 2023 09:29:51 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9R7-00B137-4n
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 09:29:50 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 65B7C20C18;
	Wed,  1 Feb 2023 09:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1675243786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=ZtqBgP0AGs6SQ4ie1vGRzTacBLiHDv2NjEvV/Sonvoc=;
	b=g8a6hULNmeOGxurTr3NH6AU1kzPMlRC4t88ddkfg14jAC2dJ8QMdTdXjY18NS3rKb4sSev
	hXuoIb+Unl8cvtmb8pxbMzbhJNcV/4aMLNweI4iRSbcEfoVQKMwuaCeYOX/LfGH3u+LhQC
	S6vHZTOBht3kpRTgxBfjh6V+QZMfhFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1675243786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=ZtqBgP0AGs6SQ4ie1vGRzTacBLiHDv2NjEvV/Sonvoc=;
	b=hFpv4nP+FrgBkmpGri7+bIYsfCjJiih8pOJCfg6xsDoNtFcxYf15yRaFjM1IoTzpXkC2p3
	vnYjvYfC+0rRHDBw==
Received: from hawking.suse.de (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id 2A9F32C141;
	Wed,  1 Feb 2023 09:29:46 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
	id D90D04437FE; Wed,  1 Feb 2023 10:29:45 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: disable generation of unwind tables
X-Yow: Here I am in the POSTERIOR OLFACTORY LOBULE but I don't see CARL SAGAN
 anywhere!!
Date: Wed, 01 Feb 2023 10:29:45 +0100
Message-ID: <mvmzg9xybqu.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_012949_347331_23065D4D 
X-CRM114-Status: GOOD (  10.52  )
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

GCC 13 will enable -fasynchronous-unwind-tables by default on riscv.  In
the kernel, we don't have any use for unwind tables yet, so disable them.
More importantly, the .eh_frame section brings relocations
(R_RISC_32_PCREL, R_RISCV_SET{6,8,16}, R_RISCV_SUB{6,8,16}) into modules
that we are not prepared to handle.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index faf2c2177094..82153960ac00 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -80,6 +80,9 @@ ifeq ($(CONFIG_PERF_EVENTS),y)
         KBUILD_CFLAGS += -fno-omit-frame-pointer
 endif
 
+# Avoid generating .eh_frame sections.
+KBUILD_CFLAGS += -fno-asynchronous-unwind-tables -fno-unwind-tables
+
 KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-relax)
 KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
 
-- 
2.39.1


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
