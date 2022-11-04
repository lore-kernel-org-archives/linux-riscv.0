Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02789C43219
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 22:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wn5G2eO+6d5A5T+4Ws2LL66dvAi2pJZxy5/8wTKw/zc=; b=tZQzFgW4BILj94
	T2lW2rpRVfM8cuUGt/W1NpfylOJSZ3MQBXFDrh1d12N1vqth1SaqLKjC/n7/TOSgjuNXpt2bjG05r
	iOV3ZyBgu5axDrYdeRNn0dbM/lntKb4VxUnmvhZOL1OIe7PODziJrNkdplR/xTtX64/Q7PRZjfEvF
	fEyG2hrlAsqbRv8GLbTsiR+xpLUVFysU8VRH3o6Qr4A9cqGuL6PmvJtSwodQV9+7dbgwTNMPvjQLS
	n9bT43xhOXPn50d53ln/aoD1mWXOwvZVhf5JAm9zYivLOy7ylzbCzatCmG7N1EDvkFhrq+T+IVJyG
	rlRFiJw1HinR9tmDTG2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5Xx-005QGj-2B; Fri, 04 Nov 2022 22:52:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5Xr-005QEE-Mb
	for linux-riscv@bombadil.infradead.org; Fri, 04 Nov 2022 22:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=l35l+a4vTvsj3hbWBK7qTc2d9968hXGTSz0pMToCUcQ=; b=LWuapPx8p/KbFWeSkPZbCAZHzw
	WXCMuT/oEBUWCpfX/ZDyv7F3JMx4loWkP9D9b6ohsss6ZUk0iFmtCHX1SN8cu/FvSQm8bOEOh/SL7
	Ef/JM3f0ynQleXlfuITL6GOxpclAmZpji9C5x9/nxrxHfJRdTC3iD7sgDnsU1AuVHVvuGWCHLJv1U
	EYX2Z5sAKVtMhDXP5ba+nZIATLZ8Qqndu+fMlV7bzRP/wOV77B0LQN6ZT/Ka3C4Nu1s7Fweh7wREv
	aLmrG4W16or29+XdG9Osykw+U9Z2hWGnfLzRhZJ5aZcY991dogQ0Wuvr0nxYSkpGKLZTGC6Ndufwv
	iyhITjaQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5Xn-0095Uh-UY
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 22:52:14 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1or5Xi-0001sc-HL; Fri, 04 Nov 2022 23:52:06 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH RFC 9/9] HACK: disable strchr call in overlay-fs
Date: Fri,  4 Nov 2022 23:51:53 +0100
Message-Id: <20221104225153.2710873-10-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104225153.2710873-1-heiko@sntech.de>
References: <20221104225153.2710873-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_225212_400758_28FF5801 
X-CRM114-Status: GOOD (  11.49  )
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

Although the standard strchr function does _not_
use strlen at all, the compiled result with the str*-alternatives
somehow wants to link against a then-nonexistent strlen symbol.

All real strlen invocations everywhere else will use the
correct functions though.

Need to investigate what happens here.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 fs/overlayfs/super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index a29a8afe9b26..9e36d0bd7f02 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -1833,7 +1833,8 @@ static struct ovl_entry *ovl_get_lowerstack(struct super_block *sb,
 		if (err)
 			goto out_err;
 
-		lower = strchr(lower, '\0') + 1;
+//FIXME: this somehow then wants to access a non-existent _strlen_ symbol
+//		lower = strchr(lower, '\0') + 1;
 	}
 
 	err = -EINVAL;
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
