Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18699FA0C59
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 08:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RawVy7go0Oh7x/CUSHgay4KZfuxeQJZsZuLdbLe9z9s=; b=hZ7nEVdMlIHf3n
	XBUIEWY84IGnZy+gJ/0AVAn5mSCcqTwtt5tEJ9OyJPPeI7aSltobX7GlPfw4WPBac6RhUR65twj0f
	W3H59AznffXf2V2+5dZPRy8LOdStNyt7vf8ipGFAbTDmbgkc5COteY3euhuKBf+WhOsQ7/y5YNnY/
	4C4E+MzZxV7NVURjfx8O4pIT725yUzkfYwHGByCDG8x2x302qElf5sUvQzojkJoX4ojZtvD78PnXO
	Y24amb+/yBXYkAfmR4mRdgcDH7/vQL28hiFl5XyZdyUb5LYdnCHa6Rla1kxE44JwfW4tNae5ryV7P
	+9Cy9X4imFhqkru8NPag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvzB-00000000qkx-3UvD;
	Wed, 15 Apr 2026 08:52:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvz4-00000000qgS-3ErG
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 08:52:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CEEAA44141;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925B7C2BCB8;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776243149;
	bh=yhHzbQrXLXYtWB/ywVwFbSxzVS5ND+M7WVXUQWu6cT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c9Ta/L36wPR2nkPiihUI7qToFa7fXWKVCcCXv+WT7Gsuf5Cq22Ze3fIOlr/ugLip6
	 S1Ff8bAV1nysfbf2YBiFUXm3bkkuwb97YOb9xB3vlux0cckGB4XJlgDjLftf0vrcr5
	 kMW2BGElFq5GsMpbNFnYTpmCAOwMfHdoy2Z2YyphJkeOu4JYph/brtz1JzeBmdD57I
	 Qugqg5gTX2/5r9LtNwZ6gdDhpyuq+76YuypHBuhxbqdNXn16YgWBI0gV4WlHxfMPnW
	 Wg8B9dl71vAPM3hXvUMwDfJ4MP6RxB1uEaN5NHoZZZOkwYsohsshn1Un7mAPTE6/tM
	 4MZeQS6Oz4tAw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCvz1-0000000ELva-2O15;
	Wed, 15 Apr 2026 10:52:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 2/8] MAINTAINERS: add an entry for media maintainers profile
Date: Wed, 15 Apr 2026 10:52:18 +0200
Message-ID: <3582b8cbba28e014d27ab6b25a2361e6e2590055.1776242739.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776242739.git.mchehab+huawei@kernel.org>
References: <cover.1776242739.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_015230_872018_0C4CD490 
X-CRM114-Status: UNSURE (   9.45  )
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

The media subsystem has a maintainers entry profile, but its entry
is missing at MAINTAINERS.

Add it.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <5af4aa6a716228eea4d59dc26b97d642e1e7d419.1776176108.git.mchehab+huawei@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f0b106a4dd96..620219e48f98 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16115,6 +16115,7 @@ S:	Maintained
 W:	https://linuxtv.org
 Q:	http://patchwork.kernel.org/project/linux-media/list/
 T:	git git://linuxtv.org/media.git
+P:	Documentation/driver-api/media/maintainer-entry-profile.rst
 F:	Documentation/admin-guide/media/
 F:	Documentation/devicetree/bindings/media/
 F:	Documentation/driver-api/media/
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
