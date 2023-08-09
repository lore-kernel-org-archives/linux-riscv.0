Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D8BC001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 03:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wnPNfLu2DgmyLQbgTyT9MBgTOVojNxgU0M4OXklYvAE=; b=q9h/9d4zKSbJMA
	Y5JPc/OPWBJvCLrr3vRIYIaaVisrRZblp9Ww1MQ+6q5f4BBRkyKHm+xQK4xBESeXedXqVekBiwVof
	Y5SG949ldufi27mquc4T5Xao4Fd8m8wg5DmWEbgFMsCWapO3frJvZytIte9/wmVn4vaRztzD1SyYO
	mKI3ct4Wbnp3ixjV8wOnSEWRzw5CJIZJEmxfeZGh4HM4GL80hhQotAceYMlLde6RRH1HkQFRM1n76
	TxOeqJfsxmvR5dsd8K7xCO/kL24WLJ2zFHE3EZ9y0cTI5YCSY9CK48u9sB28PdzX0JY9fLoZNLEzL
	qaZMa/2PNypZAq1Rsb2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTZbu-003vXd-1m;
	Wed, 09 Aug 2023 03:11:46 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTZbo-003vVe-2i
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 03:11:45 +0000
X-QQ-mid: bizesmtpipv601t1691550655tu60
Received: from localhost.localdomain ( [255.156.107.10])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 09 Aug 2023 11:10:46 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: w8KaQ9l6q4grTOwgxeVA4itTHPKxUqvpEz73M6tPxHUQ8KoVfsJ5neYQsaOtB
	sKqbSt0Iy2eW9k9FsiD844IrMgJ6pC+H0KApXrbpjfoxoyHhD35EO7ouoASe2znGodHCFVf
	UAwDL5dASfiiZxI5FnhQRWZ1g61ZbXpLDwsrex2j3aWka30tdkqaKs5FdfFnkjaj9wZZM22
	PCmQjIaCFnhR8mDxc0PtsInUuntMT0xezfQqv26+OppI5TpjpUZsb8KRXoplJG3em2ScNQB
	vNUpGg5wt/667B0u/ysaCSVGdKH3wQIkGve6QetD4LlfpG23M3tgbCUcPFKZzc8qHYMH9OG
	o9XfejTFv5tfMrmZQ0=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9490210224257605777
From: Song Shuai <songshuaishuai@tinylab.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	anup@brainfault.org,
	guoren@kernel.org,
	samuel@sholland.org,
	rppt@kernel.org,
	suagrfillet@gmail.com,
	panqinglin2020@iscas.ac.cn
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: Update the comment of CONFIG_PAGE_OFFSET
Date: Wed,  9 Aug 2023 11:10:23 +0800
Message-Id: <20230809031023.3575407-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpipv:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_201141_217965_5477257F 
X-CRM114-Status: UNSURE (   9.21  )
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

From: Song Shuai <suagrfillet@gmail.com>

Since the commit 011f09d12052 set sv57 as default for CONFIG_64BIT,
the comment of CONFIG_PAGE_OFFSET should be updated too.

Fixes: 011f09d12052 ("riscv: mm: Set sv57 on defaultly")
Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 arch/riscv/include/asm/page.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index b55ba20903ec..53c00164c042 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -33,8 +33,8 @@
 #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
 #endif
 /*
- * By default, CONFIG_PAGE_OFFSET value corresponds to SV48 address space so
- * define the PAGE_OFFSET value for SV39.
+ * By default, CONFIG_PAGE_OFFSET value corresponds to SV57 address space so
+ * define the PAGE_OFFSET value for SV48 and SV39.
  */
 #define PAGE_OFFSET_L4		_AC(0xffffaf8000000000, UL)
 #define PAGE_OFFSET_L3		_AC(0xffffffd800000000, UL)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
