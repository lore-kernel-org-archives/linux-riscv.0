Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53694C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 02:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8diZyMmWqFdLutaFRDwLGrKhMCyoizVLI1ggZnIhSdg=; b=3UqbHuewotXObS
	l5C0GnBkh9EhHoRTfAqJvRlwZgjQKDhc+z3bPzcH1xIv6+DxKfE7GFhPnVz8MtL1eCPfCd/qHDsZi
	LfUjRZNGdZvRrw7s49TUI1WZOIH700hN52Kg9vauCAJpHHPJ7wZOEiRixuYU44hKjcq0h32wEeENY
	oxxUK8/p2k/LPld8LLeccIfKZvnU6vXZsrNtuUXTqMoXk9C8T9yn9lwRy+TfBYdnk2QwbiRTb0OSw
	uAF2j1N9o5qLHZETfzHdIBT7KFoVCwlZNFYe9dDnYCTbDr+3ApGcJd09Rp4lbd6CXYqAsEsHo/Sec
	MYa20uYtgS0QgbWb2a5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9ycQ-002pcl-0X;
	Mon, 04 Dec 2023 02:23:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9ycN-002pcB-2K
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 02:23:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701656610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N3oj/lBQzpBpheCv8g6m9tnnqQ9YL5qzNhLYbMSq4hU=;
	b=M3vFB59TkEDRKcBNfhN+NICTAwMIBZVLRIpId7UYR42cP4GyI8jghGEl/2h9VAf8zvunS0
	dAyJisTGYvw2SCrQxmMhQ1LkgdnzZ+74afijH5gE0MhfEXUeAb09B2F1ca1ohEJ9ysHDU/
	qRCRoDX2NcCW9AewABtiP8Iqha3Mf5M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-itdX0an8McWg5ZpBNZWuxQ-1; Sun, 03 Dec 2023 21:23:27 -0500
X-MC-Unique: itdX0an8McWg5ZpBNZWuxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D4C180F82F;
	Mon,  4 Dec 2023 02:23:27 +0000 (UTC)
Received: from localhost (unknown [10.72.113.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80B4A2026D6E;
	Mon,  4 Dec 2023 02:23:26 +0000 (UTC)
Date: Mon, 4 Dec 2023 10:23:23 +0800
From: Baoquan He <bhe@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, akpm@linux-foundation.org,
	ignat@cloudflare.com, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org, eric_devolder@yahoo.com
Subject: [PATCH 2/2] riscv, kexec: fix dependency of two items
Message-ID: <ZW04G/SKnhbE5mnX@MiWiFi-R3L-srv>
References: <ZW00/Cfk47Cc3kGo@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZW00/Cfk47Cc3kGo@MiWiFi-R3L-srv>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_182331_848334_20F0C575 
X-CRM114-Status: GOOD (  11.61  )
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

Drop the dependency on MMU from ARCH_SUPPORTS_KEXEC and
ARCH_SUPPORTS_KEXEC_FILE because CONFIG_MMU could be disabled while
people may still want to have KEXEC/KEXEC_FILE functionality.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/riscv/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a..24c1799e2ec4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -685,7 +685,7 @@ config RISCV_BOOT_SPINWAIT
 	  If unsure what to do here, say N.
 
 config ARCH_SUPPORTS_KEXEC
-	def_bool MMU
+	def_bool y
 
 config ARCH_SELECTS_KEXEC
 	def_bool y
@@ -693,7 +693,7 @@ config ARCH_SELECTS_KEXEC
 	select HOTPLUG_CPU if SMP
 
 config ARCH_SUPPORTS_KEXEC_FILE
-	def_bool 64BIT && MMU
+	def_bool 64BIT
 
 config ARCH_SELECTS_KEXEC_FILE
 	def_bool y
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
