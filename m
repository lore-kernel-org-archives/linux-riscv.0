Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8F9F9D0D2
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4mch/niVs+xe2FUiC7DW1h3ua/fj1RiHi/0ZdV+wHU=; b=LysKJJSCd5Ocii
	Gr8m7u179m6jwnGpDrmQdU3Ta67h1/NceB4RLCocU3jjO1S41DeZ48xG8PFNuzqYNP7Hpxrm5Rcxe
	EjFpjOYSBEivOJ/G5gfT23tuZd60/IDNGum09T2tryBe3WDG2QErkqacy0YR8/WQ7iim7cPz1F1+h
	MzN4kznZB9006IxBSkyqCvQt4Gc7AKzTtozzJOXb31TiCBZZ9KbDiZfdiOLLwB6yKuoaI3oBnwU3X
	eiY3+oXoMxYjoMnQfZ5/0RKCSFOmcr7btem1VMGulGxKkxb3pQfZ5tUbD7ziZtf4GCQjQh3aoe7IC
	Pnp7v1ifhIO7P/IpJZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCelW-0000000HSDz-10GU;
	Tue, 14 Apr 2026 14:29:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCelU-0000000HSCx-27kU
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 14:29:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E67FF60127;
	Tue, 14 Apr 2026 14:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9646AC2BCB9;
	Tue, 14 Apr 2026 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776176959;
	bh=gth3jfowrfngu7tkNsJyoJ95YLlIYI/ANJFuh2PjIdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sa1DWQPKuEWeNrj1vBKpP+iAOSKkQHbfr1h/7FQryBkfBcFN/aIo3MarguP1t/S7m
	 QjpyIeRl5PMd4DoNkdC619wj20+bdmpKw+/EviFDb43gu2QYYJ0fM0dkQ7E3kIQKkg
	 OLnHF1YKSlf3AaztRb9PkeU0x9VYQZ33rLGomlH8EkfLTEVZeMgKas71NO39ZpFYXn
	 j3yKFnz6kBBjtq81MesInPO0Qz1wSQW1nUl896OsulqqFlzmUJ8/esXkgg0lpxmzWX
	 c7kbIAkKzOpM3XHXWrqbuaycnsdaAduT0GCuUXOI2E8BhMhVyu5wS40RwGFQtUQCb0
	 Mqzs5PpqTBbkQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCelR-00000007oNq-3GKA;
	Tue, 14 Apr 2026 16:29:17 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH RFC 2/4] MAINTAINERS: add an entry for media maintainers profile
Date: Tue, 14 Apr 2026 16:29:05 +0200
Message-ID: <5af4aa6a716228eea4d59dc26b97d642e1e7d419.1776176108.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1776176108.git.mchehab+huawei@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
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

While media has a maintainers entry profile, its entry is
missing at MAINTAINERS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
