Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F427C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 02:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hcxNIbec+rz47meKRsi/QzotChTKheOaMyX3Xl+DheA=; b=cSHcuEoXVZ0Irb
	Vest+Th7hIMuDXkUKCaoayWacpI9ko2uIyq+/W6Ee6kmrphKgqkJMrBZ3ZJ+hxgLnPzZPlBAI6Xbp
	0kmL8LDle9sHbiEIfR10YwqLJKjbm/MYz5yOEnyvB1z5u3rYipEf4gp3cDg0HxGEZ8U1AtkqBv3cU
	R+mk6cFWRcmwhUMt864gsSNMFygWtwMsjd4hv79ShBUkLdicn9NWFnLjtcIzY8cTghxkm3fWZbnBn
	0vVnYVyUd+KAqv+1iepOJPIj5I6I4N4iSv2q7elXSwUtsIH0wXqUN3b637gpKmSD89HyzH+tQG/fN
	Ewhtki5EE75PWNurwgPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpLXS-000feb-Dl; Tue, 23 Nov 2021 02:28:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpLXP-000feE-Px
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 02:28:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BC9560FD7;
 Tue, 23 Nov 2021 02:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637634483;
 bh=tyfrpeux84ftug2ONg9ZfP/BwMlpGSVGl+i7DUhZPDY=;
 h=From:To:Cc:Subject:Date:From;
 b=LGNH61duIdHVHoGEPhi1amdYNfTiDEZRyI0RPdAVTt3G4tfnRtL9HAj0U/rFfmWwK
 J8MjSsym4aSO1Ha4PvyCMHedm/suRmTTP1H0ocKNSRrmDbhiaHIre8WER2BPYs+52Z
 asJloFmSmqcScYctnbjKoAKZS7hPo0E1AFx8iF7mlEZnzh+QiOCnSr+E8DEEhmz2Pr
 68Ceu8x4kJXq+up1H0xSmS7qfqg9kl2PYJtMheuldLnDTrVe5z8c1qfunZMLZRI+zH
 TMq6KPQnLFbQypvwGMZLAubC+9ZiluWKAmqM8jt0q0UWiQjRjDMUbRzfa3pbPlLus5
 sga5A6ymc+02Q==
From: guoren@kernel.org
To: guoren@kernel.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] mailmap: Update email address for Guo Ren
Date: Tue, 23 Nov 2021 10:27:41 +0800
Message-Id: <20211123022741.545541-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_182803_889289_C493F653 
X-CRM114-Status: UNSURE (   6.16  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The ren_guo@c-sky.com would be deprecated and use guoren@kernel.org
as the main email address.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index 14314e3c5d5e..c709878864ad 100644
--- a/.mailmap
+++ b/.mailmap
@@ -123,6 +123,8 @@ Greg Kroah-Hartman <gregkh@suse.de>
 Greg Kroah-Hartman <greg@kroah.com>
 Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
 Gregory CLEMENT <gregory.clement@bootlin.com> <gregory.clement@free-electrons.com>
+Guo Ren <guoren@kernel.org> <guoren@linux.alibaba.com>
+Guo Ren <guoren@kernel.org> <ren_guo@c-sky.com>
 Gustavo Padovan <gustavo@las.ic.unicamp.br>
 Gustavo Padovan <padovan@profusion.mobi>
 Hanjun Guo <guohanjun@huawei.com> <hanjun.guo@linaro.org>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
