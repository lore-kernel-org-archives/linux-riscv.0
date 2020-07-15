Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7AEC433E2
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 05:34:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E50E2068F
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 05:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WY4Cr5wV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhrtZKIz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E50E2068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=52tzTuw/v1yNfYrUesNhXwNKJnwESiuoP1fuY8VnH8Q=; b=WY4Cr5wVEQOeeCx3aDJlSHwx2
	qKATeFGfz1rX3f2PvWTdNIkLXHo4Nm0enT5NNFIXAACvcHp9UXnvlSGLxaU/EPGRDYgsCSMKVg9Hf
	v2tQni5ZnVLmcfuiwoxQIJyUtok+Yw6Fvk985uvR7QMV1E6QkA87a7utaGuJJ9kQVbbv71bYRTJ6r
	wsBubr0qFtydbHolmNceeh90TObWaM6AZrMRFkhUOxt5F4B5RaaCgY63pJh5wEsxv1/ucqRvXjB1B
	U67y8uQQGxf/JxVLsw64R7q4rAnnhV07DrjlhPimjMsE4PErUA/VfiRssI6iv++p6Poww9CHqP84r
	65pPUmS/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jva3K-0005NU-Am; Wed, 15 Jul 2020 05:33:58 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jva3I-0005MK-8n
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 05:33:57 +0000
Received: by mail-lj1-x243.google.com with SMTP id d17so1192318ljl.3
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 22:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eq+bIFfgQTb97v8yD8SXsGZ7hBTmnEuGWYIyVfq/yxU=;
 b=NhrtZKIz219V8XewG3GrAyE4wvFUTWamVgOH1iFD5I6vYqGbd/xWjMf3DBuRBDXFUu
 AXBf/X+5ho3Fin4BARKYvy8mpg/su+KFhTCFdzXDqAxwuGxzgbhnxY1ZWyNG//hdYIs2
 t8ogbKWtDU6ojupKtFlLMmbUBj+nkGIXvav6el2oADN5Xg/NDwOUR3WQDR7f37Qgs2vV
 TNRXBSk9f82C6F9IigQ+hMbrXRjE71KVVyt5HTVU0Sul03Q9U7VVwdYY40HjnK9qhz3s
 2oVwy0Bj9czZMApw+0lrSY/O1EmBMyDPtDKPo0D1E277zHnHrhDp21H0KSb+ZeNCXkf7
 lLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eq+bIFfgQTb97v8yD8SXsGZ7hBTmnEuGWYIyVfq/yxU=;
 b=n244CLZjj0RkIlOHNBwfjE4/5xKIhlMRpLUC/FOdSZXkiZsYf2wyjXdGQLqRo5/IOw
 tzxlCJaF6yxKmK9gtcNFxDvbjZSEdnCRsLGi5wSXHGwvWVKEZNQeaGnDQKcvVBg0trfc
 1khG1wFVZsjRvZ35Snu2rpLPMaoSE6BOAQVWmLyZ5398vIogKFFiDCYOI2bfrM0JA2Bz
 A17IDjBbs+XvcGFgUu3C/KuQF3BWiqTV2IIRTgiTu5biGK7wOr+2Je3gOedib9X++1Om
 Wc6JZ54m7vMV+NzRvF33c/tUM9fX+vXA1lBz9s6vfgBhZE//Rlj4EcbNOBVVTGjn0l3j
 ocmg==
X-Gm-Message-State: AOAM530dhp+KXI8pIOkOqnto4jX+DiWkbMTclp0pd4w1bXJji0/uip9i
 dW1IvHL2UJvZkFeIBZBhcBHB/mAqx5c=
X-Google-Smtp-Source: ABdhPJw4nXKRH3xtt7VpkL3GFt2dkC7cG8GVkF0QkUyyTu7bZeWyycYtFmUcCvNlyA/TpM3UcgYB0g==
X-Received: by 2002:a2e:9acc:: with SMTP id p12mr4276964ljj.363.1594791234334; 
 Tue, 14 Jul 2020 22:33:54 -0700 (PDT)
Received: from nero.bb.dnainternet.fi
 (dyn9cmyyyyyyyyyyyyyft-3.rev.dnainternet.fi. [2001:14ba:2fa:2500::9])
 by smtp.gmail.com with ESMTPSA id h14sm233916ljb.53.2020.07.14.22.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 22:33:53 -0700 (PDT)
From: Pekka Enberg <penberg@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Subject: [PATCH v2 2/2] riscv: Use generic pgprot_* macros from
 <linux/pgtable.h>
Date: Wed, 15 Jul 2020 08:33:40 +0300
Message-Id: <20200715053340.576300-2-penberg@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200715053340.576300-1-penberg@gmail.com>
References: <20200715053340.576300-1-penberg@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_013356_359481_F2DEA1C5 
X-CRM114-Status: UNSURE (   7.53  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pekka Enberg <penberg@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Pekka Enberg <penberg@kernel.org>

The <linux/pgtable.h> header now defines generic pgprot_ macros also for
the no-MMU configuration, so let's use them.

Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Pekka Enberg <penberg@kernel.org>
---
 arch/riscv/include/asm/mmio.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
index 56053c9838b2..aff6c33ab0c0 100644
--- a/arch/riscv/include/asm/mmio.h
+++ b/arch/riscv/include/asm/mmio.h
@@ -14,12 +14,6 @@
 #include <linux/types.h>
 #include <asm/mmiowb.h>
 
-#ifndef CONFIG_MMU
-#define pgprot_noncached(x)	(x)
-#define pgprot_writecombine(x)	(x)
-#define pgprot_device(x)	(x)
-#endif /* CONFIG_MMU */
-
 /* Generic IO read/write.  These perform native-endian accesses. */
 #define __raw_writeb __raw_writeb
 static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
