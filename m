Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D392C7EE22
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 14:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=elrMnsn6lyEXGToIo7LhEPZFhsdO2Z/wCdR/gpo2FGQ=; b=UdeXXgeNffYSiz
	8TXUzxW8L4nqr06bMGDuVQ49zkKotbxrWeR/WagmSkF1lejJgmMZR8niggtie6sMIMQm9+qiRiB6B
	nbJzpdG2BP+YypLfsmsjTHlTa/EtF6Jz2aCYJPlIKrZprVA+X3IMBf3kcqDINmZFld5fCp9Dtrm6C
	fkvfFnj0Ki4apkEEgyFK+LnXP7vUlFNYz9TQTxozd+2fdZgeac5VXEx29EATy5z2BWLsJR3Ja17xQ
	cFFLmpdrbUMGu0uU52WKrK7AKbJuzZfsgm/CaWLiWvCGm5lyp6MH47u3sxCNANnZLuDzFisg088fY
	AxLZqYqTHJkaZ14rNhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px7St-0095S8-28;
	Thu, 11 May 2023 14:40:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px7Ss-0095QT-1q
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 May 2023 14:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dz7XGCHjq1dzsPGGS4F6j4OR5rErWwXp5TUKHxoryWE=; b=S8G47aRSj3yxJv98hixbpHusyV
	IISWXebofxVZXNSjVeK6/ujr7QEimzgONW8hZeOkR57bIIKxi+2yv1PDYEDNP5pdqRVD+jPensx/r
	yoEEYtGP2joshFTk1yIrQgioxEuOwcEpFZOOOng7tpIdKGIEPTDF89FO/LNA8ATsFCMtX0dhLlLzW
	nRcROLfsYr2lN9tnwQyi4CKKfk8NiCcmlf3NiVAUneRWRJFkvZ1HLE8nlSBej4yBTlmmgERZBz2eG
	PhV9fJNyJUjdqaPHSzNblU4CnreZcJlAHZuh74XEH8082SZE5V8vnFOf8Z4unLvZSDBQCdUfpfPZ9
	D8Q0dGVg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px7CW-008GAH-0K
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 14:23:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E08964DEE;
	Thu, 11 May 2023 14:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991FBC433D2;
	Thu, 11 May 2023 14:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683815000;
	bh=RBBjQJhyNTq4SLepJRhrNnLCCMrJFLXtNe6TLcXndOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DuTL2omz4fj1qRlJSZXZGLrBNoL39rBeuQpXk/KjnbC+dCNf4/gp6IJF22P4VJuTU
	 5Kur7PM3FMd7AFMbVodq9zu/bH7kktW8XkJ/+PzymDCAmEDBvrAVzrwE0/Mpf1vDE1
	 Q2XB19rffNaqwD2DN8kZ6kNDnulVKfEHfvS3yxAbb1XgXJ5V+R3dx3NRkVLL0mar8Z
	 +ajhWfJ0YLRTSbzTAv/aBaYgFmApf55tt4Rj18Bw1AzC6bbl+43pkg3Jr3oihI0ArN
	 QM1onojNiOUFyt2IN193TDX3CeEGQXKyAnG5QVCT98vT4fjeFY9pIUDhiRljGoGKi4
	 0MOl+1qd56rVw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 1/4] riscv: vmlinux-xip.lds.S: remove .alternative section
Date: Thu, 11 May 2023 22:12:08 +0800
Message-Id: <20230511141211.2418-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511141211.2418-1-jszhang@kernel.org>
References: <20230511141211.2418-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_152324_327536_60904598 
X-CRM114-Status: UNSURE (   8.58  )
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

ALTERNATIVE mechanism can't work on XIP, and this is also reflected by
below Kconfig dependency:

RISCV_ALTERNATIVE
	...
	depends on !XIP_KERNEL
	...

So there's no .alternative section at all for XIP case, remove it.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/vmlinux-xip.lds.S | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmlinux-xip.lds.S
index eab9edc3b631..50767647fbc6 100644
--- a/arch/riscv/kernel/vmlinux-xip.lds.S
+++ b/arch/riscv/kernel/vmlinux-xip.lds.S
@@ -98,12 +98,6 @@ SECTIONS
 		__soc_builtin_dtb_table_end = .;
 	}
 
-	. = ALIGN(8);
-	.alternative : {
-		__alt_start = .;
-		*(.alternative)
-		__alt_end = .;
-	}
 	__init_end = .;
 
 	. = ALIGN(16);
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
