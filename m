Return-Path: <SRS0=z0PQ=CJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E796AC433E6
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 07:34:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACBC720738
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 07:34:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qLn0widH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XukddvFF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACBC720738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N0Dm6HDGBjAK/n/iPl+/AaGc21vaN1Cx/G+njCMiAVE=; b=qLn0widH1PlAd0XhLB/4Ho+4u
	i1af8T0SXK1LomW2aAnTSc6hyVeFGPasBZnqap5s//q0UDtsCC77jqYMTb3Tfn2sBDeOjmccsgEyt
	YWFzlpG944iwSUtRnpHE3/y8HQGhWt1CCjic/5wA5JtrvYIveOK5IhTlPz8b9ossgWtI3+OXQH/Eh
	yKxgY/UwvRYwQ0zTu1y6BBUx2kG4Hc0PUi7KxGOeZAfAt/8PifDVNVqbxxomnt75n16U4rMtERYtT
	33+Fhj7zVRzggGf4R7YXJrXkIOkS3NjXJL3JamAyHyWW3X/qPrfqsjmFRkvdbnx9t/Hb+CbJu5geW
	u9/pqVn0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCeKH-00005m-H6; Mon, 31 Aug 2020 07:34:01 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCeKF-0008Vu-AW
 for linux-riscv@lists.infradead.org; Mon, 31 Aug 2020 07:34:00 +0000
Received: by mail-pj1-x1041.google.com with SMTP id mw10so2527517pjb.2
 for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2020 00:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WSKyECKPJv3nU8Dw0z78rbKPD6Ym+7wJ1BP9bvbD4E8=;
 b=XukddvFFFD1zAqDQHGH5BD5WQG16TAuPURkye7d9HyU9CWM3MMW5mrphYWciBvYjMQ
 ecqKx0HQGHRcoGhUVJKkt/cLJ5wgWBhz1ZXAvIzdbkd4QJ8i+ROEfIVWdxmax2urbTXT
 T6e2+SYopesFrk/+3Eql9NHSDJp9I82Uu0sSGx/V+kCeAym9SqNTO9XiAldBZkAYU0Lc
 nowzSN7fw1BHMVU98cPBf/5Z4GohXRJsIznsmL2zx40WRttsWBMTcWKodLpyIwXTXVLE
 V/IMWj11DNxBbiLyAsdJ97l0bzNTy2UmMZGAX5k1whgU5pJDBN874H+SR8tkrZiTKYff
 EL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WSKyECKPJv3nU8Dw0z78rbKPD6Ym+7wJ1BP9bvbD4E8=;
 b=Hf0eo93yFbLQ2991nfx2WIC+9ulwbUg7gYlfQ6VClt7/i389Cfz8hvyL8b36G+1pnu
 uWuYa+KE0Qv8mQYQCM/7lEVa5zZR+LhbbdSIkZzx4soszZ2ArkX52UtOKAZHdZsTS76r
 QEwgk7+HXUI4+yXGZdaZIs0fuQmy70m6kBOXWL0ss9/IJ0kApp46QwMKj4yhhdtAIcqG
 HYJgpWFWF50MJLhruc44prJEbwz5twQCETQo8iO7R9rsob2ksNsbwdfsyG5zPkQkp32Q
 +IUjdgK8GQaYVXmOhC2gOeMO7svL9nmdDZouSOlWcZYQIo8rB+yPPztdSThGsp3XOhZn
 8Pqg==
X-Gm-Message-State: AOAM533JNbDg7S4R6RNcdpB+UMIrhsYJfi5kKggf+diqnDA/ML6PEa2F
 uilbVMpiw7d8F4WzBZygCHhDlw==
X-Google-Smtp-Source: ABdhPJwjI1t2LrvO3ZA+rS9glLYEGRF+dDpUkHFg1fj5pzT7aca/4buH72JoatmkLSk5LD1aIQ24dA==
X-Received: by 2002:a17:90b:1093:: with SMTP id
 gj19mr221573pjb.149.1598859237012; 
 Mon, 31 Aug 2020 00:33:57 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id m3sm6065979pjn.28.2020.08.31.00.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 00:33:56 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 david.abdurachmanov@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
Date: Mon, 31 Aug 2020 15:33:49 +0800
Message-Id: <c822805d45654074bb392126ed68915f7284b74a.1598859038.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1598859038.git.zong.li@sifive.com>
References: <cover.1598859038.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_033359_441263_BD49403A 
X-CRM114-Status: UNSURE (   9.67  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

AT_VECTOR_SIZE_ARCH should be defined with the maximum number of
NEW_AUX_ENT entries that ARCH_DLINFO can contain, but it wasn't defined
for RISC-V at all even though ARCH_DLINFO will contain one NEW_AUX_ENT
for the VDSO address.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/uapi/asm/auxvec.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
index d86cb17bbabe..22e0ae888406 100644
--- a/arch/riscv/include/uapi/asm/auxvec.h
+++ b/arch/riscv/include/uapi/asm/auxvec.h
@@ -10,4 +10,7 @@
 /* vDSO location */
 #define AT_SYSINFO_EHDR 33
 
+/* entries in ARCH_DLINFO */
+#define AT_VECTOR_SIZE_ARCH	1
+
 #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
