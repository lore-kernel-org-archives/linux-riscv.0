Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303DAC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxOk4RR6wendiqygpO+URTiZ3r1Yb0qdnyMv84GILaE=; b=LhwtY7Si+JyUnl
	rAbcIaxtW5dWj0Y/R0kCNYfDeF1iXJeFY4Gjjetl45Tp2NmUn8RPa6H84PpInJlDbNs5IK4Z4vBss
	+D7hP7qyMnUiEfxGcanyRKmjk+neKmSvKVW3GUYiJ5JQkBmdyYiDZfxwnEmcznyL01HglXg/UrmoQ
	iJZXHiWc21VE5ls2pfdPs504tjCG1uWG29tVn0yHAjMUrUNmAi1Oj3nj7uWGN/PxmNtStgxfANz1T
	f2O+s/EyNo9FG/TbZYsIWhwQnVkwAvtvD9cbX8OIi1ulwpAnimB/yzDCymnWUXAOfrrBZYGz35ADs
	04ge8uK34cJK1AYfy0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywfs-00BlVm-16;
	Fri, 03 Nov 2023 16:05:32 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywfp-00BlUd-0R
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 16:05:30 +0000
X-QQ-mid: bizesmtp88t1699027493t4lqanvg
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 04 Nov 2023 00:04:50 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: jXjag1m6xl5ppx2DzruJtGaZWnmD4kcr8XGhe8RzDeQnj/4txlNMA0RrzbdM3
	NkLCpOnAtszVCaalBQWVPDXpaXS99zJq6AlrppFnw1HKvKL0xj0E5A9V7XJ4MlTzYMuw81z
	fr0TQpqQaEJWCRXcAtRVJi0F1ePqT0AT21/h93uarocjC8Z8j1tjIaNhhk3tVoz+rnGhrAd
	TRL0MreVOn2ipogbXqRHd+i6op09393O4FSiuY8ril1xpaW3/uszhT2UDapIXWOaUz+PptB
	f2CN/td6z1BqlmsTzYJ3ewPyBma8ADUsb5d7vDUH3TMXEtfm+e3ucDioNeOaMAYycbIr9aJ
	/sF2ho7MXuFQ17Wh2UAABl458F674OLb8zGA6HrpmOBwvwfV8QFEVjuC0lUdg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11412250178732425861
From: Yuan Tan <tanyuan@tinylab.org>
To: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	luc.vanoostenryck@gmail.com,
	linux-sparse@vger.kernel.org
Cc: linux@weissschuh.net,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tim.bird@sony.com,
	tsbogend@alpha.franken.de,
	w@1wt.eu,
	tanyuan@tinylab.org,
	i@maskray.me
Subject: [PATCH v1 14/14] DCE/DSE: vmlinux.lds.h: allow NO_KEEP on __ex_table sections
Date: Sat,  4 Nov 2023 00:04:48 +0800
Message-Id: <3acff566dc1818a36b32a34e25b0de58c5118ee6.1699025537.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699025537.git.tanyuan@tinylab.org>
References: <cover.1699025537.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_090529_491545_62AF9662 
X-CRM114-Status: UNSURE (   7.63  )
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

With SHF_LINK_ORDER or SHF_GROUP, all of the __extable sections are no
longer orphan sections. In this case, KEEP() is no longer needed.

Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 include/asm-generic/vmlinux.lds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index f10afc42a1ac..e5e5850ea573 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -658,7 +658,7 @@
 #define EXCEPTION_TABLE(align)						\
 	. = ALIGN(align);						\
 	__ex_table : AT(ADDR(__ex_table) - LOAD_OFFSET) {		\
-		BOUNDED_SECTION_BY(__ex_table, ___ex_table)		\
+		BOUNDED_SECTION_BY(__ex_table, ___ex_table, NO_KEEP)		\
 	}
 
 /*
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
