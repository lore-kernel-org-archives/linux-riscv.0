Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC275C54F32
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 15:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eWff1T45h/5Ahdg6HEx+yKN752nv0vq1iQqfnEPbCsI=; b=2Ti4kI6Z8vZVyh
	LbFODHo6J9L1dU7B4DrTJrIPy1hlSqrVvAyBtkrKcXt6VptqEm0DNlCDGorq6qtDo9IvMNBibxLS2
	wczpVlc4g2TUN16l1F1IvfKlgOAar5De1neOodLNnGrMzos+jvvSjXT0fAq5ohs003hVlVZoPzMO3
	Ic1c6INslO6amiDgrXEDWBFFQcf+S4bAhsBsXSk+/KvFGzdWePoKNaRx/qpX1ejkAnXcLjUeXBLR0
	TmFQsTpfj6Kg68GfI0VrqucpcCdvXhzFfAwPImwtuPZj35YKR+WEIozTZCU+P+xoY0XJA4kZOG7tA
	lZdQwg/JaxWRBwkKH+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIU1q-00000004CG8-2f6E;
	Fri, 23 May 2025 15:09:46 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITgA-000000048Ta-1XTA
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 14:47:23 +0000
Received: from [127.0.0.1] (unknown [116.232.18.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AA250343270;
	Fri, 23 May 2025 14:47:17 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/2] sdhci: spacemit: improvement of register defintion and
 HW busy detection
Date: Fri, 23 May 2025 22:46:30 +0800
Message-Id: <20250523-21-k1-sdhci-v1-0-9f293116a7e7@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEaKMGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyMjXSND3WxD3eKUjORM3WRLC/O0FDPzZAujNCWgjoKi1LTMCrBp0bG
 1tQBCyBmVXQAAAA==
X-Change-ID: 20250522-21-k1-sdhci-c987fd67c82f
To: Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=823; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=i3t0IUDYdMqNRHkeuylaDNHAP+Nvjisva2/VRvRt8NE=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoMIprnXU6M8hZdaqEj/WahC5VcqNKXc+m+8OvG
 VfgbLiDelqJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaDCKa18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277Y2oD/4p6d7BnMcHe4fkwD
 7FOKu/nNqIs/57gLLADV+70aYR6vLCA/AAvJTz9yiuhaCgWbn5gRJYijOm2/tCtcYz6f6+fJ8sy
 bbThP7wiS+5nXMDym0HewJibE/2uypcYqEi8SMIAJIVc4vnAh9PFLDQhGiqpMdlBLUCXnuJcwFC
 MLHEQDsBf3lR0Yuivx4aPHlHTD7dH1Xnm6cIuCdE588VueI6lPutST6f3uz5wIRJt1PczODZtd8
 QVzwAh7tFpOrosG2n+tOLXF3VMwBIz0WSiH7XGIKmrGhJNUZhD9WOSRz4ZxJJ2V1Utj+VP7IQoo
 bgJRIYeGqqN+TBG06QsCDArZx8doYOUyT3cB2pZwJiw4NhO35vmhyeL5yII252t2aavWsGRFD4P
 v/6Pjv4uwfvVgh2WWRjzsK5DVwa29nD7F1FVP+dWRe++3I8ClmNSa7eUduLM45YCVkzLRV6gwoS
 N/VdMfjdY2FxR2bRlgPRW8l/2fow1UN+f8G3+A4mjXWBepPjqWLEHTbYti/PDf1AbE4W+czBUjL
 ykj3Y1RfjlIKTrjsN94ketxjxqAXiNj+cHbT609lnePOc+R/Wmr+CT4Uu4Nak9k7QC8dUQbwvLL
 fynLNhak/Xlm00iENx1jp3+cb3pmp5hb3R2RHjlBYErD4Ul7FNETaqQBI2MvgFylK4bg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_074722_433422_F2052059 
X-CRM114-Status: UNSURE (   4.91  )
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

These series address two comments from Ulf during the review cycle
of version 2 [1].

- improve register/BITs definition to make them less generic
- drop MMC_CAP_WAIT_WHILE_BUSY flag to disable HW busy detection,
  this is tested on Bananapi-F3 board.

Link: https://lore.kernel.org/all/CAPDyKFoDWS6DWdKOaxTDEYeKv3hjVDoR7XGi19nESVssc-RG8g@mail.gmail.com/ [1]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (2):
      mmc: sdhci-of-k1: make register definition vendor specific
      mmc: sdhci-of-k1: disable HW busy detection

 drivers/mmc/host/sdhci-of-k1.c | 140 +++++++++++++++++++++--------------------
 1 file changed, 72 insertions(+), 68 deletions(-)
---
base-commit: f7f05c5ea4af0f28cccfa49fe1af65e85dba5ef6
change-id: 20250522-21-k1-sdhci-c987fd67c82f

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
