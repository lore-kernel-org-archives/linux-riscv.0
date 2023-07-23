Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE1EC001DF
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 16:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zk9w+Mcfh+cSID5ATCptCvpy45N9PYQMxlXRw/jM1nU=; b=R4w1QAHRlBGIqr
	p9/DLv5w4KYGdG8lZQS/SGv5F3NLx7NWbj1+uwlJrNAmLjSRQV7PnJPtnTqTfTWpcsPu1FQRr4xOz
	WmU89xMQMUNdkYtewy/qsgHVUHPRz7IThcTC4qnob+naROCOotCuQYD7pgjCoQl2nXsj2dt80ttpL
	/doeUdlBm4Gf1c19YkRMl3Ii56ugESWTZmjtbRxbY3lJp+yPoy2F7SkWE+CjpmjZ3l1zOWl3mMV2p
	EVGn5p0g/BcJHAFSJAeyt3pBgReBpu066Z7+Ay6wJApj1qvE4OPyumrCyskhKimXZOaIO4q6/OQ2t
	fO6mSdK7Hlad/PyMSXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNcK3-001SSf-2c;
	Sun, 23 Jul 2023 16:52:43 +0000
Received: from bg2.exmail.qq.com ([114.132.197.227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNcJz-001SR1-1F
	for linux-riscv@lists.infradead.org;
	Sun, 23 Jul 2023 16:52:42 +0000
X-QQ-mid: bizesmtp78t1690131137t3ohio40
Received: from tanyuan-Surface-Book-2.localdom ( [119.123.130.39])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 24 Jul 2023 00:52:16 +0800 (CST)
X-QQ-SSF: 01200000000000401000000A0000000
X-QQ-FEAT: u/EYRCx6PxjGw6hYLRS8Y/NdZapWdbaVk1WqQz1RguVgXBn9GhjiJ9B5Wah2u
	OTJuFVaklpQTepL4Nibk2lfVgFHJHEeyiev+EZWMswmMaAAV0OLJKvgjgtpzHp+C6GvGkVF
	UDnazHy/c8InD+kjOLM3UnumybOH7fAH35ciB3rNSib2At2pD9fl+Ut5ndBn7OlBAo8twbY
	dNccTLm6iw39r6i0DSnH9dUzOHV0vuZaQGjI8NHrq1ja5ZXf73vvFrR4FpTdun/vlYA7Uqy
	FcI884c46o9T/Ohp8EVI6JsKkkaU8QhPoQGS4J8G3Eo35ebnxJaDf+CMvBDurYyqEA3fCrl
	7IIH9FpasXCZAGySVpPYBUP+PdIrA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8709871826437540113
From: Yuan Tan <tanyuan@tinylab.org>
To: palmer@dabbelt.com,
	vincent.chen@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	falcon@tinylab.org,
	Yuan Tan <tanyuan@tinylab.org>
Subject: [PATCH] riscv: alternatives: fix a typo in comment
Date: Mon, 24 Jul 2023 00:51:55 +0800
Message-Id: <20230723165155.4896-1-tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_095239_765131_68E898AF 
X-CRM114-Status: UNSURE (   8.44  )
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

In the usage of ALTERNATIVE, "always" is misspelled as "alwyas".

Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
---
 arch/riscv/include/asm/alternative-macros.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index b8c55fb3ab2c..721ec275ce57 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -146,7 +146,7 @@
  * vendor_id: The CPU vendor ID.
  * patch_id: The patch ID (erratum ID or cpufeature ID).
  * CONFIG_k: The Kconfig of this patch ID. When Kconfig is disabled, the old
- *	     content will alwyas be executed.
+ *	     content will always be executed.
  */
 #define ALTERNATIVE(old_content, new_content, vendor_id, patch_id, CONFIG_k) \
 	_ALTERNATIVE_CFG(old_content, new_content, vendor_id, patch_id, CONFIG_k)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
