Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5E2C7EE31
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 17:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xve3aSYVASxQmW4GwuuoBNOc96C62kSjvZUPVa+S7a0=; b=ISLhRwSqaI83Oa
	JBS3CX1Oje60LvWVw0YVIAlFpF0c7hrHjWjLYtQdadZKalchOdDvdU1Vs/OTIR+JiA6uJ2ni4+n65
	q8xfUFrv2RJ1ezgThs5DXAPK6ExGmuKpSaAS5ULJQm3+0NY/WeR7RF+c/eVWQHnESIfxtl1hZuztQ
	erPwzF6TfIHt1vJv61qElNcSIbVBXcPAVx/aTJeCBQkJPUGpsvcFPXt9paxlbFsJ1Zu5t7nWCWEth
	i4EUJhNIkGSc5ec8fjIEf+yu2dpIIcnEsb2dN2/IUgd8FM0iBar1Bw7BLLEcWwhQXIuF15fV7ymIn
	EjnDySQADcdhXlfvvKtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VSp-00AttA-2c;
	Tue, 23 May 2023 17:06:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VSn-00Ats4-1M
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 17:06:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D0C6634D4;
	Tue, 23 May 2023 17:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DAFC4339C;
	Tue, 23 May 2023 17:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684861580;
	bh=XDpfU4QGkxHCk0PcVXqfWjLiQT8efnUkxx2g6qxryQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ekUkv+8Udgo0rQGikUzgVt1U+8VG4DYIqET6gmM4S7k9goJGn3cE6EIVMWx3nHzXX
	 yBXZL/2rbnb2TMN2LJSbanLZck5wX+V8ygTKDIsZ+gxcaADr23j0vJlC2BY2vnfTDZ
	 TZU8C+c9+M24vwOjravcJ8o3dk+YCUMk+Sqf7N+Bud9SE7IPtJrIoGHtUIbgtb3dwS
	 1BIos3/riAF8xW30yQ+SBN3Twvf4DDzykyhu6HoyL3/zpF90sp/6cCdeXI5ZG0/8DQ
	 1NI+5pZPAcfFAOsHiy2qs0k0ZFXtXkbymsvFmGP9I6UTbPYChQmMEc/Ep1tRlqv4MD
	 xC48ZkFtW+JUg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v2 3/4] vmlinux.lds.h: use correct .init.data.* section name
Date: Wed, 24 May 2023 00:55:01 +0800
Message-Id: <20230523165502.2592-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230523165502.2592-1-jszhang@kernel.org>
References: <20230523165502.2592-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_100621_494194_C9DFA596 
X-CRM114-Status: GOOD (  11.77  )
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
