Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1FBFF8868
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 14:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHo7sRZBMwXtCJVmV9Slp/D1FWXEgfCN214eAZ+/dYQ=; b=Vn6T/F+J+pmu8G
	Ge8WGGS8wCheBv9ewFli9WVwpENO2G5bIFzHmu4DVhbpsALRHxMN76oeQnVP6JbJo+xTWp6Aa59I8
	k3l3K4f/XZassGKcjiPveadm/GI8rp8j5ln4hZ48ujmeNQ3sDt9+joCNjJUGsZdmpmOxheUaQupal
	/V6F0kasPiMWJ2CrbN9XpoGuEW7MnFqVJVf+77cQ8SjXEyMhGv3DQpqmurEESQrNsAqRTJUMYRvzR
	XJLmYTMTFiadpWZF9eI9VTMqqrqOrrrIbWjZeDg6vPanolSpDwXkAPM2ZMalP2+5gLZTQimFOGQ+W
	M8yGwSXak9X7eIN5G9sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMr9-0000000H4pB-0zfS;
	Mon, 27 Apr 2026 14:22:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMr6-0000000H4n5-26lj
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 14:22:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9812E407E4;
	Mon, 27 Apr 2026 14:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7540AC19425;
	Mon, 27 Apr 2026 14:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299755;
	bh=oCSFDjePyMaj2tf0ATqd8TtAxNzPuU0qXsi2GNKPtg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g63i3v69KbfKbKetN4/ng4W39CIC+KAcr2DVio5NMr0E4SOYq9KFSx6bxPcZXi/dm
	 eu3upyCETiw70SWV0kJsDEGoc1xqBhfbEnbCbhbKHYFKEQX2oHwU+U5x1qul9KM1+I
	 9Km8AIqYJHLu7LLFoaFgv1aqzUhraX8hzDVOxGWmiAq/tPxGkBRdM8jX6qqTmKBRAj
	 eX0LcvhKbRkyUCkDyPkIl7VjT4rgxvDBbJ4ktlNsaM5/LLeEmSaMxhuOjmIKY1gVHK
	 Cz3UqTfIuTrn7Tz4VC6/YN3zuhVn1lNAc58kVAdgPO5eM9DIhzJxWSOWWSbQqzIq3G
	 04gotTEtDGwWg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr3-0000000C8Q5-2cjW;
	Mon, 27 Apr 2026 16:22:33 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v4 01/10] docs: maintainers: add SPDX license to the file
Date: Mon, 27 Apr 2026 16:22:19 +0200
Message-ID: <d27d60d72c7b2a07535d612444dc1024366ed5d0.1777295258.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777295258.git.mchehab+huawei@kernel.org>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_072236_577706_9871CCC2 
X-CRM114-Status: UNSURE (   8.95  )
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

While this file is really trivial, add a SPDX license line on it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/process/maintainers.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/process/maintainers.rst b/Documentation/process/maintainers.rst
index 6174cfb4138f..5d1b1464c3ae 100644
--- a/Documentation/process/maintainers.rst
+++ b/Documentation/process/maintainers.rst
@@ -1 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 .. maintainers-include::
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
