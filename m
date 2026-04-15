Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732A4FA0C58
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 08:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGdcbs//i5a4XzR+0eY4FdmmVfExw6UytKay8hLpzpI=; b=4S0V7IlvOEtway
	wgYlkV5si0DCu8nGqGtm8v8k7TlEl5iyjb/gMIsaosdQIWvFcjDTV8uuN1C7ZZ/18So1cbowE9HVz
	7h5UCADnb0cpk4TOe9hv7OIQ2gx8pFEB3/miaLghxLDYsiC9c54JZcW2PcyZCDQryjlerMHO398dr
	6w2pnGmgVQqcg9QeUnURu+SkErKUCGTnWfeKu3GWar8+PTLhO4maud9JVMBuuQk26KB1/S56NeEFO
	i3UkLn6bzSSQVYTa1wpd4GTKv1HZCrIHff3s+atRl7mnh7H9sDwU/iyxLh7MXNGWLLQeHf08nfPcd
	3f3myvGyZvyfvBIzeivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvz6-00000000qi4-1dUE;
	Wed, 15 Apr 2026 08:52:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvz4-00000000qgT-3Ffx
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 08:52:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D65C160127;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E1FC2BCB4;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776243149;
	bh=cbloFBaSFVqLFASbOdMdsq9XcyspmRgafo7Pco+EW+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i4H3d6VTT0QBatItEUbi/IXUeq2MLNYhTKRaPtwmlgVQ3zsu/Jg5XTgNPoWkJ7z1S
	 T20rvZA1BGK9BAzlRiMRsTngdbZO9VDzxLcl9TN0oron08gjUwGUHttU9c/AJyUEc/
	 vKc8c9pw1zWxeSw3rLGzgCTJX8/vctO7CbKows654qdZgyWxce7UCqQQkPpq29c3jK
	 tgfQZTs6/B+KmSbZe0iTOvEd9mzQLjK/cYfDiqPIfZmkETxrDmyXHnRnt/ud1qNCbc
	 zMl06JMkgOK25cLc5Lr93jUFj07tDfq3V/TWm2NnExFC/104c0koMrbGZYvBtDJ3VI
	 owP1Wu7hQoxlg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCvz1-0000000ELvf-2VCx;
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
Subject: [PATCH 3/8] MAINTAINERS: add maintainer-tip.rst to X86
Date: Wed, 15 Apr 2026 10:52:19 +0200
Message-ID: <17bb9cbae60254adb388406a975f1fd60266afdc.1776242739.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776242739.git.mchehab+huawei@kernel.org>
References: <cover.1776242739.git.mchehab+huawei@kernel.org>
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
