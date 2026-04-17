Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88A3F8E491
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 06:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGdcbs//i5a4XzR+0eY4FdmmVfExw6UytKay8hLpzpI=; b=Gz7TNUBH/GeXtZ
	9kdOhDHPQ13il/50AdG8cZmn+bhd6CzBP3s0K6vaQ20Oyx87gpdfTgSuytBsdUpmw4KdAvU85ScuQ
	0YaxW9HchzHJ31Epo/1Qx23RCSP9rBnpwfXJ5WCUmrbDT8ttZwQvDZN+VZATgPWIHHyIrIPNU3clb
	kdKiUuDGfBq7p6z9DZdcJLHYlN+CLmj58iGnheMUTJycaYzpXr2u+CP7lLsXs/JE8K5xJpRTEHtov
	aqo5SoPOewR5/tp4sXsXU7uGdkQJEJASSLOqsPVhtQCF2C28t+d9wtr9a8CGVUazy2EDTwHDiUcSB
	zOI3jxnV//F/b4EaRCvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcQQ-00000003VXR-1WaZ;
	Fri, 17 Apr 2026 06:11:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcQK-00000003VQm-0oTP
	for linux-riscv@lists.infradead.org;
	Fri, 17 Apr 2026 06:11:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8016B42B40;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5734BC4AF09;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776406287;
	bh=cbloFBaSFVqLFASbOdMdsq9XcyspmRgafo7Pco+EW+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lRk1g6we/NrjPuRtqhvHjM8xA2V2X/BOvwD290+yMFOOnhf3xrhEtdtRjX0gc3OKF
	 gbLrD2lDwMZ0DZr36tS4+4TuVvMdV6aoKBfjAbvdwiv9Tt0zvanLsZ6ZDea8R0mmv4
	 veKZUUbbMn9vacpoYiDDBy2CN43HdAXLzSLfsl1PnW1K0McQNmYyjc+lnd+q812rTQ
	 7S3V5wsgpLF5q57iRBe4UTpfv+er5Aj7IHP3naNQwvDr4WW8tYl8wkFi7oyA48mPIJ
	 MqaNs2XfEHTVu55ZU6pxn6OKL6LSZjQgiNiVYj6XiUpkgeJzeJ/0l/R2c4oY+Nke7w
	 hlQ1kT1UXLlug==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wDcQH-0000000H8sV-21d5;
	Fri, 17 Apr 2026 08:11:25 +0200
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
Subject: [PATCH v2 02/11] MAINTAINERS: add maintainer-tip.rst to X86
Date: Fri, 17 Apr 2026 08:11:12 +0200
Message-ID: <9711e3ed5898226173768725836e536d6c759a18.1776405189.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776405189.git.mchehab+huawei@kernel.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_231128_272457_B3DFF180 
X-CRM114-Status: UNSURE (   9.72  )
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

The X86 subsystem has a maintainers entry profile, but its entry
is missing at MAINTAINERS.

Add it.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <970434c647aa1e1e9a81c87b4d5fed934d4018a7.1776176108.git.mchehab+huawei@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 620219e48f98..a85fcae5f56e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28560,6 +28560,7 @@ M:	Ingo Molnar <mingo@redhat.com>
 M:	Borislav Petkov <bp@alien8.de>
 M:	Dave Hansen <dave.hansen@linux.intel.com>
 M:	x86@kernel.org
+P:	Documentation/process/maintainer-tip.rst
 R:	"H. Peter Anvin" <hpa@zytor.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
