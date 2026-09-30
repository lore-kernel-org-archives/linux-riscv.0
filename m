Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B47ECA5FB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 13:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2nB+VxVQEKvaBefVMAlnHlVYUh/zWjOzIvrRDLhdCI8=; b=zAQc/4RJAu5oIE
	RUrFWPrHvS45jK5jMGtliyFNoUSrHUWMJER2kd8/mqJ/4rdcTfzPM2mheQHc6UWrGGeBWdEMhcuDO
	hv+3lRw04oHVDXHWHrkkA5l+psW2ZIBqhgWT+dCBitpOtQpTgM7f8ZNRdhBOMSBUeVn8E3R/u1qDg
	QbkqcWIowrwriU0O+ZQCwjv5C5+9v+jlGgPOIP/leI6ewdXIUMpn5UfWH6vCOz9lDlz78Od4xruU/
	txyZ0UFuF5kEIq+wmMyclBQYbqjUuWL3jxRSsTZUkPfn3GFTHljD6f6kA+0eqPT7bQBTRNqRdTFAO
	s21a8Mib8pOxIPHN+bQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtvd-000000064lx-1gfK;
	Wed, 30 Sep 2026 13:00:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtvc-000000064lC-1P6u
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 13:00:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 77DE86025A;
	Wed, 30 Sep 2026 13:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE231F00899;
	Wed, 30 Sep 2026 13:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790773255;
	bh=rKO/591w96jBGNwNPis4Esl3eE44Oz2ZvFVJ98DQOAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=buhO/FgQDcWs+Pptvxi1gPsHG0met8Q2h3ep61uUtmCS37juIStsyxdMCj657EQHf
	 64vJwZ6Z/JLUvtC3tYEE37/5V2A8BDAgFpxmBt2RKwixKauSxPm86oybIwpfxSLXCj
	 6T/7l4ft+UdKMxCP7NM2I5ZZ7fWgfhHn5nmtDDFbqm5tcX2KvkvpE8uSAoRdM0k0T7
	 IhK+8V2olyrtO7HMaP1HzKiJBITWIzhszbDuPqttif6MsWgf3wuXQRtSoNu//hyZLX
	 LsLi6UT271ovNZ0DjyFOXTD8OAbAynqeSayg2pwfQAiFtuQAwQx6H+PqAdjuh7nxgQ
	 1h74nidrvl0nw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] riscv: word-at-a-time: improve find_zero() for RV32
Date: Wed, 30 Sep 2026 20:40:51 +0800
Message-ID: <20260930124052.21986-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260930124052.21986-1-jszhang@kernel.org>
References: <20260930124052.21986-1-jszhang@kernel.org>
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

To remove non-necessary zero bits couting on RV32, replace the
'fls64(mask) >> 3' with '!mask ? 0 : ((__fls(mask) + 1) >> 3);'

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/word-at-a-time.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index ce04d6a088f6..f2d16c1eea8d 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -67,7 +67,7 @@ static inline unsigned long find_zero(unsigned long mask)
 {
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
 	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
-		return fls64(mask) >> 3;
+		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
 
 	return count_masked_bytes(mask);
 }
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
