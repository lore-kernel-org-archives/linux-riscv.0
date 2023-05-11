Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F25C77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 15:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xve3aSYVASxQmW4GwuuoBNOc96C62kSjvZUPVa+S7a0=; b=fZZcspUsxijjTz
	A5U/+W+8ugulCyyLmfAosFlU3atO0b0ye+7KlTmtjYT44zP2SWqCTez86gpYDPDjFb9gnLxd4C9i4
	kRToC8u8O0JRP0jsFGW9YyPKIjk4FK+8ie1FSCJXsoegJAbQCnrgfO4YuptB0x0LwJYghGeOn4vmB
	36S5Oo+bBGr/PTCgAsJ/YNOU7vxt1vmQG+JRNp1of0XSL0RS2r1m1xv0deV40FAFj9LXbQjG55iUZ
	fgH6gbR9zjMbFvRcf9NaV77AR61Hlr2jFiPNFwC/mTfz6rZWQxASJDls3LiW+tghY4rW0AKpJp3pa
	tahKZZ1l6yYjUk7r+Lwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px8G4-009DHN-2N;
	Thu, 11 May 2023 15:31:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px7CX-00921g-2X
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 14:23:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D25B664E00;
	Thu, 11 May 2023 14:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6235C433D2;
	Thu, 11 May 2023 14:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683815004;
	bh=XDpfU4QGkxHCk0PcVXqfWjLiQT8efnUkxx2g6qxryQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qQiuEKd25qGNxzMC/VzrANFNkwAxyE7/iChs3QZIM0Bl4Uf4R84Ga0Dk42m888RVb
	 fZ5NEuJv2QYk/nbcRcn0laW4g0chl+t0F6Ys/PVmoOzQFtoKnV8Cwq2Hnz1p/qyEdN
	 3VslTOtUm1M6/+smqskiwzYeuZtAeIFuxw5iJK6IfppnovvZMeSW+/RWvMFQmkKWsA
	 QFVLYHSkX3p/xZVTibvWsP7LuGrv+ede51WSunQKrRYZ12ZZ1TEAs9KJkoCICil8WS
	 NsAELJWQYEM/WSNI8mrXsecWykxDQQlRdYYIWKMGZ/9YsQWUpbJ9GfilidJPpuTkBl
	 wkEaw9Qq3jlYw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 3/4] vmlinux.lds.h: use correct .init.data.* section name
Date: Thu, 11 May 2023 22:12:10 +0800
Message-Id: <20230511141211.2418-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511141211.2418-1-jszhang@kernel.org>
References: <20230511141211.2418-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_072325_865791_A3AB8AF2 
X-CRM114-Status: GOOD (  11.37  )
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

If building with -fdata-sections on riscv, LD_ORPHAN_WARN will warn
similar as below:

riscv64-linux-gnu-ld: warning: orphan section `.init.data.efi_loglevel'
from `./drivers/firmware/efi/libstub/printk.stub.o' being placed in
section `.init.data.efi_loglevel'

I believe this is caused by a a typo:
init.data.* should be .init.data.*

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 include/asm-generic/vmlinux.lds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index d1f57e4868ed..371026ca7221 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -688,7 +688,7 @@
 /* init and exit section handling */
 #define INIT_DATA							\
 	KEEP(*(SORT(___kentry+*)))					\
-	*(.init.data init.data.*)					\
+	*(.init.data .init.data.*)					\
 	MEM_DISCARD(init.data*)						\
 	KERNEL_CTORS()							\
 	MCOUNT_REC()							\
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
