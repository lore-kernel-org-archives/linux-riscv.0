Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE768D3CCA0
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 02:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c1AfoNywq8fQHQsr981BTW9jt8un127HsoxS62ISNKA=; b=r4Y+S/8TeK4o7i
	ojNaMWE79nxke6GEdjxSkJa3BvwSwlyMEOmoJRXsYpkcUdQacrhRd3m9U3sv+5DkJeeUYvYrAXZzv
	4/fD8K8Pwe9qZWyISH6VLtanu+kSmcrpdq/Qahe2qd5aSOQXiR8Lbq3MoVuGFj/II7ZShsZlOFG9E
	86OEzFC1I9z6zNwn4ChHiTRae8NWxoUoEobO9VCNDlDqogMCYBeRM/36jMJkkT3IZ+0+ioxY0fcrk
	Azo6uL/C8MwMZaXa1YK1kcJupOcPeq14qWwo9D9XVzm3pQDGTHEIRbf5CGB8rV+e6YSsWcuGSxNkS
	dydL94BAK3Cqz9nuyuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgCiG-0000000BUPY-3MZi;
	Thu, 15 Jan 2026 02:03:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgCiD-0000000BUOp-3M8E
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 02:03:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A54040103
	for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 02:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC19C4CEF7;
	Thu, 15 Jan 2026 02:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768442627;
	bh=01/BcMefdiQJAFqcbKBCElf2up5LTOkivGiQ1oLjw8U=;
	h=From:To:Cc:Subject:Date:From;
	b=VVn8fEIA0P2SRgOgkH9L9xDnNrFMwSMr+FuTiVabG/Cdb0/fC+lXl31t27L0XMF9r
	 wUcwVaavEX9Jx1gkCtnOKvybhVsLKNfNZsXG7+zWhSsh9jp2xj7QRNPY6Vtr6S9jNP
	 QOF01QFmkGXT3gcQiqm/KOzcXTMVg7n2u8gbBzGTGP1j7L/VKYWpDo4bRGoXsGjZCq
	 OGNT4cFmUE45ETlIKcWHDGxSFPXIqaD++f9Pjjn5PSbpT6TYhB3sY4CtnDaDSJpbvc
	 uWDmI+0hZi6oltmQM/lADkEDKCDVydRFbhGsbEk8Jy8PhDovfFXCrbtuMqP5/C6u2+
	 PZjgfQyH19yXQ==
From: Yixun Lan <dlan@kernel.org>
To: spacemit@lists.linux.dev
Cc: Yixun Lan <dlan@kernel.org>,
	soc@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: update email address for Yixun Lan
Date: Thu, 15 Jan 2026 10:03:35 +0800
Message-ID: <20260115-11-maintainer-dlan-v1-1-64bb698da846@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Change-ID: 20260115-11-maintainer-dlan-59b2ed54999e
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535; i=dlan@kernel.org; h=from:subject:message-id; bh=01/BcMefdiQJAFqcbKBCElf2up5LTOkivGiQ1oLjw8U=; b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpaErM36niadQaWqw5X0frjrYPjc3l8ULtEaMp9 27u05vS4WaJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaWhKzBsUgAAAAAAEAA5t YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU QACgkQMarqR1lNu+3+WA//Y7GmKsRetgi8aRvMXT/Aua6pHOk+QCRE6HwEt/KuzCX1BSVcyRlfG VMKZCuyhXv9bZk3MIFofsxuf7MHT22sw03IN5+njd7s/Ln6QWkaLRSbgcuNgGXW7eiqbZt7xre7 H4mTHV76lVZRdL5p+341Z2/0dD1b2U1Gmzi7j4HVc3f57BtUJlxb+myMdrNbgcTJMJcSwJhdaia rWk7+59EusrC1QvveFPV603NGzVIh+hs17xL/7pAfumLiyQ3TVVgoNBjtI6i3SevofQ63cUroHI QUmrzFKb0g897pirSMrvL9xj5AxhNv7/k2tCk1sKmlrORAaS8uqgZ9hX+4krLYTV/stuyppVN2v TeaGP6UJ9SIKYGBU+YpowJvPyitAQOO9+KW0k/amm2hh5Nnsp3MxLIRoL8LbPBbZkXpDTzAEAIb M/lx9Au8MWj+F/Z82R1m4IS8OezDCyyV1Fr4ii4QRAU8koCeVzazigBInQUCfipRVsY+szRVE49 J33q2hVE7udSP
 lhrcBZ/UwGBurfeUPVZxxYz7OYf20UvsvN7idsph5JJIFXlcnid3fcdRjU4RaC rEVHWBpzQ10irMr/+QwZ5zhz/zXVNobNJW16IvNP8fWszT5iJDfhwG2VULebb9xt0ShVZxi35hD dbo48wuamlAFwo32yMG02jR6T8NT10=
X-Developer-Key: i=dlan@kernel.org; a=openpgp; fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_180349_881869_10D0DD6B 
X-CRM114-Status: UNSURE (   8.68  )
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

Switch my email address to kernel.org account for more convenience.
Also add entries to the mailmap.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
I will send it along with PR to SoC maintainer via SpacemiT's SoC tree
---
 .mailmap    | 2 ++
 MAINTAINERS | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 84309a39d329..fa9296de463e 100644
--- a/.mailmap
+++ b/.mailmap
@@ -868,6 +868,8 @@ Wolfram Sang <wsa@kernel.org> <wsa@the-dreams.de>
 Yakir Yang <kuankuan.y@gmail.com> <ykk@rock-chips.com>
 Yanteng Si <si.yanteng@linux.dev> <siyanteng@loongson.cn>
 Ying Huang <huang.ying.caritas@gmail.com> <ying.huang@intel.com>
+Yixun Lan <dlan@kernel.org> <dlan@gentoo.org>
+Yixun Lan <dlan@kernel.org> <yixun.lan@amlogic.com>
 Yosry Ahmed <yosry.ahmed@linux.dev> <yosryahmed@google.com>
 Yu-Chun Lin <eleanor.lin@realtek.com> <eleanor15x@gmail.com>
 Yusuke Goda <goda.yusuke@renesas.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..8417c0c8cc72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22518,7 +22518,7 @@ F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
 F:	include/linux/mailbox/riscv-rpmi-message.h
 
 RISC-V SPACEMIT SoC Support
-M:	Yixun Lan <dlan@gentoo.org>
+M:	Yixun Lan <dlan@kernel.org>
 L:	linux-riscv@lists.infradead.org
 L:	spacemit@lists.linux.dev
 S:	Maintained

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260115-11-maintainer-dlan-59b2ed54999e

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
