Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D9ECCF9E0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 05:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5nmpVOd4DyfjNh3z0ISLJnMMs5aBsAGD4fC/80ETgc=; b=BsW/60N7HIi3wV
	dDo0VVEX0Ij9gyl241TEWSXrFoi1EnTE3iA30fMFAtxWaS/IkYmR1md8yYX/1Qq3DDk4H1zbB/uzl
	UkX4gmWr+/OJBwFIUll1Aal890pcwaoHhCmhjh3KE5LasJurDOjd/rX691G2wh0cqBdfE7OeL8u5l
	f4MAXwZv1Dq1r9NxCUHZbRSc18g5k4EYT8FQdWPiMAvOK6J+x7egaJhVIyJVRpLXv1gUXN7x1Yukg
	5WDzKi/oP5KAl0i4dD1igIlNO7AURmNYRpjrPlh0JBsctK+uu6BqyNawfYOyZMgcjq9/KcNRIdqtc
	Nuwm4Ml1O6ezqd5m9EQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDG6v-0000000D922-0uEp;
	Mon, 27 Oct 2025 05:49:41 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDG6s-0000000D8yJ-3vn0
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 05:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761544110;
	bh=eaKj1HRL8X/NaEJQudAmylwIeVJyeI2KOmMcJICZMgA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=xo+n4mteSZtp6EFjbWVUcBhlCVHEMupMDFKJi8c0JuQAIx5Y5MGkcfG/bxi3O9BJc
	 Rsr1+umPLPyouVC/4prVb0Ob0DKU/WLU2N/SOf8CHihbXMccLPssP+M+d2N+GHsug6
	 uv72sjuoZ8+C55stiZhfoVWz3KeSawZzJ/uRDccQ=
X-QQ-mid: zesmtpsz5t1761544102t2fd12e65
X-QQ-Originating-IP: 9D8j9F1R1n69BE9ErCI2rUt3ZW+zWcbpU/HCZSqgfqY=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 13:48:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3398915015117501572
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 27 Oct 2025 13:48:07 +0800
Subject: [PATCH v2 3/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
MIME-Version: 1.0
Message-Id: <20251027-p1-kconfig-fix-v2-3-49688f30bae8@linux.spacemit.com>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
In-Reply-To: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761544088; l=913;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=MdOH9hjjxGZsKypHF4E37v9P1dlEBgH3N1GF9QnLQ1I=;
 b=jzR4ZlQVr89vvMu1oyh/46l2oRBTv/PLt6B/jfaLsrCb260Lpqf76bKrPnMiKPjKCLa1IOGn7
 362mPKO4nFDBUSwhqCn9Eaj+9TsjrPxs1kwQhRvjgWgBJ6flf/Hf9TG
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NuQRJUP0KJGkTdDKRC+DCvyBhMRNHm5VFXxJRZKTCEUAmNr+Abj6YsQ8
	X7K/oRQYvztWqreGPBNjW6o5jKGI/5VvOxaA61P9ReMsns1uLc0mzfPzsslajlFl4PVqRe5
	M3o+si19HrF0ce04lpN0Hnb4DsZmujCDlyG1vCA821Oz1BGmeBJnaQeNTD3fAeJSGNG+rPL
	PdP4gJWopjbPrIL1D1KdZCJArsDxYTljIo8BRi/ayzNrzwYk+htHXalVnHkXGVQhZ9oeyJf
	F9iQ8aDHqOi2XEWSH1S7qM7AadhccTejPabdYETCarZDZSKgZcV2LRoY2Jyh6QGHPE3Ae1+
	Mzh4n5QAAh1+jL/QQZ0J/k1wy/GJ65M95BT+t2cfaBSt/ubqLnygEGuuQxiPAIQnRpqmvu3
	G/1Z7LzNnwQjYrMd40N3X48heYDCoQjhR0Fr8eCC9Xzw5QonMYqOoHO6gEp7CSlSbM9sYmh
	vfRnX5uNPL18l09zFzHwAeoBir9zIYO8bJQMGollhis6WjsxWYsQOy/a5HWv974xRDtsIpa
	xEAel+7JjxUwJefAgm7v0I12kXvnNFvnz42DSJO9JKtpTmAkp79g+pzHk1gRmis4bdBrbu6
	y9vf5s0zVnzIAas6yAqJvTStKLXfVmenAi0nIJt6gXjazyE7bCVq8bUu19BfjTYt4NZ3BZh
	DAb03YI+VxHFSFfr3Yd5JiwBZMtj+Dq+LG5IdWwg+NV0TePOtcr3aA5M47HGM1e9LedFO4n
	TaONR0cuT6lndAEO6cBEsIkX+HwW4dHXQxk3UhKPuhYBAQ3jd1U7iDlIuZMkGy25JDUZ82r
	8YOjAUlcH2hSdFvZkAIGLBYMC7gL99eosAySPPYGjB+3OwKv0GKEkjJKdUbrPnSLjHthKOo
	g+zD06obVT4UZmZoJZlVpmh60F+GCNXv+p2PvWMrAkLXlPLhsPTf0V00G3fxrnr1b/q4dXi
	qGbtDwATC4pNiICLRlrbCWNOjVkBl7cLL01fEw5qToR6kNn/2NCKCs9vP+QH0bstryDyuv2
	nxHM2BcWVUBcYKNhWk3MOSovNhkdsZ54t1A9Za80XwggEGiT7wwIo/OzcST7R9nEYZWhDws
	UJwyGWjd1r4ZGqROKteVTMjuPAN5A153XyC9/ZAmRTB
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_224939_712151_E63EDC04 
X-CRM114-Status: UNSURE (   9.73  )
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

RTC_DRV_SPACEMIT_P1 is a subdevice of P1 and should depend on
MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
does not always respect the parent's dependencies, so 'depends on'
is the safer and more correct choice.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2933c41c77c88e60df721fe65b9c8afb995ae51e..1ea0123e386f2b140e1a63a182d1781f6a17e835 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -409,7 +409,7 @@ config RTC_DRV_MAX77686
 config RTC_DRV_SPACEMIT_P1
 	tristate "SpacemiT P1 RTC"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	select MFD_SPACEMIT_P1
+	depends on MFD_SPACEMIT_P1
 	default ARCH_SPACEMIT
 	help
 	  Enable support for the RTC function in the SpacemiT P1 PMIC.

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
