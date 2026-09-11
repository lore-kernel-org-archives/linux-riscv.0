Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74131C88E45
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 07:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=n0Gv3H/K+qfdCDwJP0ht1sznXyt16ae21mIM8L95Fz8=; b=JV0z4L39bUxkyefPNH7lrQAJiq
	niajUeIezN0ajtRB/IvmDgjnRz+eT0aCyImpPg8jwce1KwU3WMW54mKqPg3ogxHoFEON9TQnUVhlh
	CJuZU7xTrVtv9CBeLUv2OWAmSMciqLwiGghwjuaey8FzgXbmj3wF1/7rYNf5ldF010zoELlSATV55
	b/7u2N5DQwEh7FkFvRDrtksopXBHG8T6RAgSl/lLov37h/GEv3qqD4tFEYxhVeJCqK2Uz6cxnnci5
	hzL8OReMkZQ8ixXnKIkcpLR+PvNa1YRM9K88CaDBBGUowO0VkQTDSFC6RHAqzr8pkmU0lDIWqM0Od
	bDV38eYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vJc-0000000FzaD-2NlF;
	Fri, 11 Sep 2026 07:04:52 +0000
Received: from mail-pj1-x1046.google.com ([2607:f8b0:4864:20::1046])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vJZ-0000000FzYO-3DxR
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 07:04:50 +0000
Received: by mail-pj1-x1046.google.com with SMTP id 98e67ed59e1d1-39512608fb1so1493248a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 00:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789110288; x=1789715088; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2c83p3gxBI5qDHT/7+/z6hzYG3hJ3PLILSJpMJ3biiw=;
        b=BP81B2eCqhLTyFP176WIsw/wG8rnHiS8DMhyUoV/AQPaP35PsruQPKUv6wvVmxgkdi
         zegZ0rvOpD1Ge5Mj5ePZRCmcDVZrK6M8oSuwKC3uNvyVUI530eCYMUFkmFh/vLtgOBCP
         /yhJAh438EZ1vzvt26xOZN/oVESRXT/b+jjLnChnhvdvk35bIvn5mS3fGqshDUH3iIQE
         QEfLQUs50Loo+vYlPMf8ovxnRir+4DAIJ/vV+Djb29oNSTEt/CxNv0SzxK1B2DFfyrB1
         c3WSKJLlvENowRd5f3580TVrMSt1qcp2EqsqOBTtyU7z+pbio/3gPv/3snIz1Xkrm3t7
         Wuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789110288; x=1789715088;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2c83p3gxBI5qDHT/7+/z6hzYG3hJ3PLILSJpMJ3biiw=;
        b=L2/voveO007kv/qapa0EXjFIFw1ENlOo+/EvTEt5llDsAUoUxL92ttE11RmpmlfnT1
         XL6u7g5ALaPqJrdAPKmq0/lCVplfJFpLhrhmaQu/mE8o2Pq/UIT4dy3cr6Ihf7lhrINI
         IfPUtbV7g72lxd90PUdMGU3YWpIP7u1lM7ux/14uqTXtiMUrXeeUPFyO7Q6qUtY0zrpq
         bEpNvJlKVe4t+7hbF94ISAkk/RBznbkhKs3z0UPKSPmLXXF3XBz5bmFyLb+ggiS51whj
         KIIixXXQTNWKdymegT/jAUYGd5iu/hzuPjwgBt6o64K1mf/I1+7AiCizq0c3Jg422nqD
         e1+A==
X-Forwarded-Encrypted: i=1; AKwUvBzWgkDydUMI0Atqb1PX7CTll5L54zE0/CFOLEoX0FVGno3ehZ70Mf2P09bicH9d5vP4OE+JksLTBY0g4Q==@lists.infradead.org
X-Gm-Message-State: AFuF++keZ9b/zSBeaNH0Ie2hDu00A0mgQsak0WwCyjKWeM5Vw7ZMQ1OJ
	Re/qovtyhzbQ/p2AjibLy4AmqcqheT2z87VigdNLRooUIG9+W6HK9qvowZSQG4q4f1bll7sNyTr
	j
X-Received: from pljg1.prod.google.com ([2002:a17:902:fe01:b0:2dd:c00:e4ee])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:35d2:b0:39d:8d38:8b04
 with SMTP id 98e67ed59e1d1-39d9bbea1d3mr4942848a91.1.1789110288072; Fri, 11
 Sep 2026 00:04:48 -0700 (PDT)
Date: Fri, 11 Sep 2026 07:03:43 +0000
In-Reply-To: <20260911070346.801948-1-morbo@google.com>
Mime-Version: 1.0
References: <20260911070346.801948-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260911070346.801948-6-morbo@google.com>
Subject: [PATCH 5/7] riscv/word-at-a-time: Instrument load_unaligned_zeropad()
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_000449_808182_A1D60F5B 
X-CRM114-Status: GOOD (  11.41  )
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

Convert riscv to the arch_load_unaligned_zeropad() /
load_unaligned_zeropad() split introduced for x86 earlier in this
series, so KASAN/KCSAN also see reads through load_unaligned_zeropad()
on this architecture.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/riscv/include/asm/word-at-a-time.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 3802cda71ab7..a4294b50c918 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -56,7 +56,7 @@ static inline unsigned long find_zero(unsigned long mask)
  * and the next page not being mapped, take the exception and
  * return zeroes in the non-existing part.
  */
-static inline unsigned long load_unaligned_zeropad(const void *addr)
+static inline unsigned long arch_load_unaligned_zeropad(const void *addr)
 {
 	unsigned long ret;
 
@@ -71,6 +71,8 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 	return ret;
 }
 
+#include <asm-generic/word-at-a-time-instrumented.h>
+
 #endif	/* CONFIG_DCACHE_WORD_ACCESS */
 
 #endif /* _ASM_RISCV_WORD_AT_A_TIME_H */
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
