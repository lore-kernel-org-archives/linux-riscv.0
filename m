Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E32DE8FDA0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 06:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QdQF4nQNK44dN/8yN79khc4BA2We2v2O/xpBm8L9KTM=; b=L8TeToXCbEWPAl
	X+si2aEmF6YYVAflxohx1N2HffCyCh8vB50YW+hiJbFoMdPVVv5lNyD1+acTiRL/iwPQxIrxg2zrk
	Q7S7evyojLixoL8tGBEwbJwWjzvBjHqFzS2LFlZl7X8SGr59/Wko+4q6ZkWfZubv7EE9GtYfG6Jwm
	LsNpF3NLGKemijgegwfVoXMHma4hfPike1QmF73oWRFmyRxa0F/CnOX+PcyWZuN8smSEMUzC60oSG
	C/3XNDvUhHNvAb2Gq/HaGjwwrvRi3Zpasa4dbgxwhT2yfpIRRiLrJ4TY79oSck+qhvQe/qZIgcjj6
	+ZnKBpmwGQZM6Q/Mll1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ1k6-00000000yeG-1TTh;
	Fri, 26 Dec 2025 06:56:06 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ1k4-00000000ydS-09ey
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 06:56:05 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5B0CF340FD9;
	Fri, 26 Dec 2025 06:55:57 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/3] clk: spacemit: refactor common ccu driver
Date: Fri, 26 Dec 2025 14:55:24 +0800
Message-Id: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFwxTmkC/2XOS27DMAwE0KsEXJeGSPinrnKPIgtBlm0ikZRKj
 pEg8N2j2ssuhwDfzBuyS+IyfJ/ekNwqWWIogb9OYGcTJocylAysuCGmDlWLV0J7u6KN3seA/UC
 26bRuVN1BebsnN8pzJ38uR07u91Hk5TiCdzmbXS5Fh6sVcU+6qmulO0ZCCdHOYrw5T97IrSpl8
 KfNkpeYXvvelXbuIFj9n7YSKhxG7o0ymlqm8+TCEmMV0wSXbds+c+KGg/8AAAA=
X-Change-ID: 20251217-06-k1-clk-common-8d1c57995047
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Yao Zi <me@ziyao.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1949; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=j9Vuhsha5R+Io6JBbWV9GkR4NJvXsd6kHC5Nr8cp/JU=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpTjFwjT1EQ3/TZbjr+fP0K74qAufxwEFul8TMm
 7zkXU0/xfqJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaU4xcBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0kUw/+LlgW7OI2eLR9r/EJNQr7Xb/+bnMtNi06E1HC94PApWvcOyxYyt6x7
 EmNLDuUl0UMJBeOgzthgnaSGtj7CoZ+IpPuQaTe+ZlQukCWGQL+DwV+cfxQr1G8Qn8Pzt/wp5q1
 vuH1C7k9xFtxbwZVKJIE+uRv8kH3DDqiXVfTiVAR1+aQyy1wKOt9mR1odKb2l8iW9slO3v3q0P1
 2RyFiFjGoI+oFfkzc7WTec3Ea8ieY6hQwn2mDWBx0dUIMzWTys+FmLpyQ0N8xoAhwADlSdrh7YF
 D1CWGiGfBrSrtBjxoB+vvPG5ICm0yPYUqhPHu+lwdduQhcCgGUUlUSXqSOzZZ0UMld33VURBTdD
 YndJW2DglQYExBXFBZbAF5tbDDILnNxqEGJ/ckB3yBjRawIaKauwwHS5mFeHvdpMzaJWIVX5qa0
 ilpGXl6Id8BVo/6XCrwGEsyqf7grCT0iSephRM4G8i/F3M9750bUEZlg2C5d12NO/Tj77jBoAn/
 Smbsanhl/JIbdeinLrrXpU5TgcPSuIrXAY7MW0Epk2girTqjG+G1xg2DtfUWMZPVZHnVYfg2aCY
 hJigTbuJqTW25Hk9S3F5OYh7oFXGb7YnX/UlInR80gDrmQzbX0X+z6TT4+WIHQQewktQcsy5jDB
 LMKIb2bkWH5iYJE2QLFs1UDnH7ULM4=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_225604_115968_42BD67CD 
X-CRM114-Status: UNSURE (   9.19  )
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

The goal here is to refactor the clock driver to extract common part, and
reuse it, so in the future, we can maximize the source code usage once
adding new clock driver (specifically, for the SpacemiT K3 SoC here)

Since reset driver register via auxiliary bus which requires a adjustment
of the auxiliary device id accordingly.

This patch will depend on Kconfig fix for building modules [1], and the idea
come from K3 clock's review[2]

Please note, Patch 1 is needed for both clock and reset driver, so extract it
out as single independent patch. Then it can be pulled into both subsystem.

Link: https://lore.kernel.org/all/20251219012819.440972-1-inochiama@gmail.com/ [1]
Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie [2]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- extract common header file which shared by clock and reset
- add SoC namespace to differentiate reset for auxiliary bus
- Link to v1: https://lore.kernel.org/r/20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org

---
Yixun Lan (3):
      clk: spacemit: prepare common ccu header
      clk: spacemit: extract common ccu functions
      reset: spacemit: fix auxiliary device id

 drivers/clk/spacemit/ccu-k1.c     | 188 ++------------------------------------
 drivers/clk/spacemit/ccu_common.c | 171 ++++++++++++++++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.h |  10 ++
 drivers/reset/reset-spacemit.c    |   2 +-
 include/soc/spacemit/ccu.h        |  21 +++++
 include/soc/spacemit/k1-syscon.h  |  13 +--
 6 files changed, 213 insertions(+), 192 deletions(-)
---
base-commit: 99735a742f7e9a3e7f4cb6c58edf1b38101e7657
change-id: 20251217-06-k1-clk-common-8d1c57995047
prerequisite-message-id: 20251219012819.440972-1-inochiama@gmail.com
prerequisite-patch-id: df430730ed961011cee5c5d47b7ace84b3c5ebb7
prerequisite-patch-id: 64003618c33be925602e46b7543f2c13d3f36474

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
