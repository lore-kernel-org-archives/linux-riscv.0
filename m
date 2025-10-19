Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B5FCCD195
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Oct 2025 20:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVQSJJ+EWozueRctqlnigd25F9dHq38+0+4gHXuBolo=; b=Qo7hAZBLexy/f4
	cKU93HiWS7RGLKW2qp0mLbnRN8/Yna69duzYfeCqe9EEvs6+ZHIXUlAChfSvXwRBk6js24xTx+9e1
	kUrvaXbqdqvTO4NbvubE60eGKEbG54dHHsZf/EIUEiG9H5e5OBBonv6t38gZQgo3ep/0tobr+9P/u
	lAaEaNqeS27AxXbH1km/89jydWf+GkjXDkHWYFK10wrf92KcKUckQqF240ufFP69Ucov0gZORjxm7
	IQKBPia7xftni5Z2HiEPi+U8ikyxzhTo2/GB+AaYktgMZo8UUEem/AFEIxG7kcDoYT+bEmsH2dRhN
	I4VBA+kdX3gJh1OlTZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAa4Q-0000000BOPW-0PJJ;
	Sun, 19 Oct 2025 20:32:02 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAa4N-0000000BONm-29bc
	for linux-riscv@lists.infradead.org;
	Sun, 19 Oct 2025 20:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=jsbgxAIW3+VtBZE8+kihXqhKNM21Kl+yhCyplWWqqu0=; b=o/nclKGbU1y5rwLZQnsDfSG8Nt
	4gQlIFRCYq5Te3kku9DRYHVuUe+ElaWDSGtMt14RPxOqybLixZYz9KRYCUhG9wByvKNYxmWAzvJZj
	0MRbPhseHnSxofYEkwdiS13n3b1pugY7jceHjpNPyLx94K6bByUiqC8Z0fD1K9qdGVBerwtzm/U5S
	PlxQXoVnURcKiGSoPTx778e26Jk/wvdKsdlCMkRDGLBrsxVZ5gMysmfSFOuhvDlCuaQh4gc+NHH/h
	JZYJ+iMxqhsV3QHPOykU7OAYX4QqA+s5JszKvMbsMKWyDjobeSnT0mWqZx9RFGq7cgJezLJKmiauZ
	49P5772w==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1vAYsK-00DYBh-31;
	Sun, 19 Oct 2025 21:15:28 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v2 2/2] mfd: simple-mfd-i2c: add a reboot cell for the SpacemiT P1 chip
Date: Sun, 19 Oct 2025 21:14:13 +0200
Message-ID: <20251019191519.3898095-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251019191519.3898095-1-aurelien@aurel32.net>
References: <20251019191519.3898095-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_133159_568673_E3F70C7A 
X-CRM114-Status: UNSURE (   8.73  )
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

Add a "spacemit-p1-reboot" cell for the SpacemiT P1 chip.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
v2:
 - Rebase onto v6.18-rc1    

 drivers/mfd/simple-mfd-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 0a607a1e3ca1d..542d378cdcd1f 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -99,6 +99,7 @@ static const struct regmap_config spacemit_p1_regmap_config = {
 };
 
 static const struct mfd_cell spacemit_p1_cells[] = {
+	{ .name = "spacemit-p1-reboot", },
 	{ .name = "spacemit-p1-regulator", },
 	{ .name = "spacemit-p1-rtc", },
 };
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
