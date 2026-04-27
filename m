Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2B5FF885E
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IfErCoeqzCkCdj1iqGC4pwEBIYYdGSs/9ZtpzfhNkPY=; b=MWaFC01U+ibC44
	X5S6fPmmweGxVxxdRv7+B5Zs12FHa9De2uJQrvwZ166FU3atpTSbH4D8YzMdfu1znf81achDiimiI
	cCWV1SE3//gzei7ETOrhMv6UWLQeqqizzNtq6udzp8DqqAg8YrI0osp3owTM2NfKhgaqrUUd0aOOs
	ekyK4aUQfK0J1zGwnjm+X7Ic4N8Ie96qgzB+nt+wLBLZev96FBCMZQci6e6H3MFMzTRQ1wGMSM7dq
	fhIZSDiosdTpk3nqT4/on0eQ5OIHIVi8lUofU03LY2Go3AY2ECV3OZeuAX+sdI3aSke1Hg01mvHDl
	ocfqUES5OV+WsbYQQsfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZU-0000000GwqK-0z2x;
	Mon, 27 Apr 2026 13:00:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLZS-0000000GwoP-3Lmk
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 13:00:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD5EB6015B;
	Mon, 27 Apr 2026 13:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F244C2BCB5;
	Mon, 27 Apr 2026 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294817;
	bh=k5dWurVipop77C9Fwrcn3SH5CnWId05jQgVrC5N7Hi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iSTNgTZXGI+uUUNL91x9OsOC8O60kF6yTDlOyEuGD3GJzqmMDwxc3+URWujmAnAUo
	 dN+ZFD4HUOPEkunQpNILPwNjWa/oalHijUfxkev0LT4tZ+iH64ovHu7oSxvWCHOW92
	 srzUsly1Q+N0tziUJH2kWJmk4xsoS8wVcJITH68exfKp4w6saCov7zSOi69Bd1TVms
	 /5KwBnH4X2TkvZrioN/n6lfYlc3GaCBSQKYjKWilxsggJr1guRhpD7ucAOGK+9jQS7
	 3dkIpBtc8S/jlZFLvur4dFhiKgybTWg9Kf8X5Omgn41CgoVAVK846rHnOudnj0bIns
	 ZBe1hlcSvenvg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLZP-0000000Bx2P-2ec6;
	Mon, 27 Apr 2026 15:00:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 01/12] MAINTAINERS: add an entry for media maintainers profile
Date: Mon, 27 Apr 2026 15:00:01 +0200
Message-ID: <34aaa9258c783a05528fbad2beba69e070c3caad.1777294623.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777294623.git.mchehab+huawei@kernel.org>
References: <cover.1777294623.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
index 2fb1c75afd16..f52ec50f6d10 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16223,6 +16223,7 @@ P:	Documentation/driver-api/media/maintainer-entry-profile.rst
 W:	https://linuxtv.org
 Q:	https://patchwork.linuxtv.org/project/linux-media/list/
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
