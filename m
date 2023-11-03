Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF495C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 15:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f77aUZPazatdUIzsXrMJgbeottLVPv2+pxnSIvz4BHk=; b=nfHRyHJckech7K
	5T1ZvzFVIsTyxwzFW9PyCSGQJz4wsi5EDMv57jau/zBpBGkMqqsoHuKuhFX6p3Lke+XHoOlJdXR1o
	rRf3zCKgFrvEDYXnQ3URKrRrDQdHwxIO+zziUjs42awpA+qhWFVsdB3F7jC8/2qX8kWZtWeKYjmMs
	5JsuMfpsUB0p+qMWNZIU+bbUPq3IrmdWEaeSNC7KU29g3+yI+ck8BktRiodeXKAHKK7yDBSsCz+CA
	1AaJcevcnyvZS11oGuSRakeix7LHcUV30LIzljh18blfjFV6b7yTBMSnqBAN6xLanI/66s/StDdft
	UYvTG8YDmUKU2LcGTZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywa9-00BjWw-2M;
	Fri, 03 Nov 2023 15:59:37 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywa6-00BjVK-1y
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 15:59:36 +0000
X-QQ-mid: bizesmtp64t1699027156tvs9nek9
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Nov 2023 23:59:13 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: znfcQSa1hKbGuZsoOVNlc1WvbvEkFGnTx1nx7spI6Tuzd0sHLnkw7AiMgni3t
	ZggaII50uNhW4y9QfvuvOyeS4F6auFyNTJw8NQCg+vLjRI5V2SC6LCN9adAn0v67sJ3OSX/
	ApylcxyFajCfrERC+YlFJVy8SGFJrBzCX2pVZ4xg8IbilwZDlWfF607cx65tZkc/N5v0pBo
	5KJ44BzBG+chXyP6BguFE6wzB2WGXdJq47gbtwJbgnW6dVctfCnU818SNsx7tWsczxLqyqh
	u4yC+u7f5c5hMGNKdyDBqUc2ZmUsHeTUO2gp5wzAo1jI1qkf08kTw9ItQQe6yQ05zfvbyXV
	s7UC4ZqDN0fbnt0BzlvuczseCniFWDH+IfzMMqsezOL6Jc3njt6dIop1FXbag==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3788500215190827511
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
Subject: [PATCH v1 04/14] compiler: add unique LABEL_NAME()
Date: Fri,  3 Nov 2023 23:59:11 +0800
Message-Id: <db3498efc33b3065a0acb534d034f7d33ad03e19.1699025537.git.tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699025537.git.tanyuan@tinylab.org>
References: <cover.1699025537.git.tanyuan@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_085934_961181_EF5CD423 
X-CRM114-Status: UNSURE (   5.64  )
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

From: Zhangjin Wu <falcon@tinylab.org>

unique LABEL is required by SHF_LINK_ORDER support.

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 include/linux/compiler.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 5a9cc3209b12..b178f5d51ad6 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -246,6 +246,12 @@ static inline void *offset_to_ptr(const int *off)
 #endif
 #endif
 
+/* Unique Label NAME. */
+/* Label is file scope, __LINE__ is enough, and not change in the same macro call */
+#ifndef __LABEL_NAME
+# define __LABEL_NAME(prefix) __stringify(__PASTE(__PASTE(prefix, _), __LINE__))
+#endif
+
 /* &a[0] degrades to a pointer: a different type from an array */
 #define __must_be_array(a)	BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
