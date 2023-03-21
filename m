Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D019C761AF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 07:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saoOx5kjOYkSuSZCZC2GGU7PuZmKQ1e89W7xPHUSBxI=; b=tbTykpsD4qrsWQ
	GNiNx1nnqqPcE8Rn0s3Pm5aUJ+Ty3fErXGrQoM+P/xtbCLGEzIJbx4blhnTLwizyC2zbCobD8QAck
	Cb6YpVyhhHlpjZJH29kOi2koFeilqazwTFIt3v8OD0RDivF4ei4xxnSvfMeBBgl+L+id8OTYEhCMt
	sg7aUBBJ9/2UDsdKPAycP4X0Q4rXkwFFShagy4mPjIH7Zs+iECo4WkYNZrjkgVY55UCQ1xUnFgjeQ
	lzBfH1+EeTks8vw12Od2ww4g5a9Np8uVAHaosiLgLhAOkooQhpru90Xuf0v8j2Fq4lksPD6akyZBW
	kX15luzateOesAx16xhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWeL-00BZJx-0i;
	Tue, 21 Mar 2023 07:43:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peWeH-00BZHW-2H
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 07:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679384592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uYmUB/WTTMvmBA0Z285enRAA2vTEDkWBaww5wTiZcXo=;
	b=AYyI7Zu/SznV60SGKzm7raLl9TjszWFAoeBM1rlqiPA0P/cCwehclTrcgFCrq4GR6GhI85
	olEDkVdvN6wwcTz3iJKh6ULLBG4QRy5Qf3/xrG7zt8BDbHRM83JpjmfJpxYkdolQPOw54h
	OpWT0RGnw/fBbvvrwvCh6g7euzZe72I=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-LK9OjiVCPhK-pqoMeVHLRg-1; Tue, 21 Mar 2023 03:43:12 -0400
X-MC-Unique: LK9OjiVCPhK-pqoMeVHLRg-1
Received: by mail-oi1-f199.google.com with SMTP id n205-20020acabdd6000000b003846654dd65so6168803oif.19
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 00:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679384591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYmUB/WTTMvmBA0Z285enRAA2vTEDkWBaww5wTiZcXo=;
        b=EAJwnQpbcMX4BmYJ/RajEOxUEsX3TR0L0jiCiM6yy/MPQJVkJps7BWIA8cSBzXk2nQ
         lm4cOAAHN/qGR0zLrIYL50kcQIjYVW/SmNB+h4ErWb5K+uvq6O84l5xY2fNGrAIjrXGy
         ugnyo0n5E9JvMg/OJP3/XOHCUJzBypis1BjcXqPvWZ2lyKh0QXCIAuEtdzznfxdkMiF5
         dlv74fFiwpmoL6Qbm2H75hUnIZTtfKl2Xu5z0hlJvtiQJcFxfZvuLvUwgt+FQ4s4aadu
         o05rnFsYqrLtgvtz/+pKSxHyl0Y1nbfw4XuNygZBEwVQLqO6OLEHWThTy+9E2RHBIumz
         WHVw==
X-Gm-Message-State: AO0yUKWWd48yU04ErLJ3H2GotwtkSB81v10J4dLBRLF6XhkEA6QKPU96
	1Yu7HvWeIwcohOU6zeqNXb6pzQAg2mf6E7oevSsKf1zXAFv4R0g6zQhI0m5kh0WLxNezFVIkeIC
	utVu9I0clO41Oxuws2jHkrqki30xl
X-Received: by 2002:a05:6870:6087:b0:16e:1aeb:d74b with SMTP id t7-20020a056870608700b0016e1aebd74bmr546842oae.33.1679384591350;
        Tue, 21 Mar 2023 00:43:11 -0700 (PDT)
X-Google-Smtp-Source: AK7set8yT5HfmiKYU2SyLBb4cWhTZvsC1XCp0Rm1hcaLuS/6AU2e8J3Z++XLxX8CXeUurrVlfilkRQ==
X-Received: by 2002:a05:6870:6087:b0:16e:1aeb:d74b with SMTP id t7-20020a056870608700b0016e1aebd74bmr546832oae.33.1679384590919;
        Tue, 21 Mar 2023 00:43:10 -0700 (PDT)
Received: from localhost.localdomain ([179.111.176.145])
        by smtp.gmail.com with ESMTPSA id az15-20020a05687c230f00b0016a37572d17sm4047729oac.2.2023.03.21.00.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 00:43:10 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH v2 4/6] riscv/cmpxchg: Deduplicate xchg() asm functions
Date: Tue, 21 Mar 2023 04:42:47 -0300
Message-Id: <20230321074249.2221674-5-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321074249.2221674-1-leobras@redhat.com>
References: <20230321074249.2221674-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_004313_826588_39A1C1D9 
X-CRM114-Status: GOOD (  10.54  )
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

In this header every xchg define (_relaxed, _acquire, _release, vanilla)
contain it's own asm file, both for 4-byte variables an 8-byte variables,
on a total of 8 versions of mostly the same asm.

This is usually bad, as it means any change may be done in up to 8
different places.

Unify those versions by creating a new define with enough parameters to
generate any version of the previous 8.

(This did not cause any change in generated asm)

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 arch/riscv/include/asm/cmpxchg.h | 63 ++++++++++----------------------
 1 file changed, 19 insertions(+), 44 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index e49a2edc6f36c..715bf61e72c82 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -11,6 +11,17 @@
 #include <asm/barrier.h>
 #include <asm/fence.h>
 
+#define ___xchg(sfx, prepend, append)					\
+({									\
+	__asm__ __volatile__ (						\
+		prepend							\
+		"	amoswap" sfx " %0, %2, %1\n"			\
+		append							\
+		: "=r" (__ret), "+A" (*__ptr)				\
+		: "r" (__new)						\
+		: "memory");						\
+})
+
 #define __xchg_relaxed(ptr, new, size)					\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
@@ -18,18 +29,10 @@
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.w %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".w", "", "");					\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.d %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".d", "", "");					\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -51,20 +54,10 @@
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.w %0, %2, %1\n"			\
-			RISCV_ACQUIRE_BARRIER				\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".w", "", RISCV_ACQUIRE_BARRIER);		\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.d %0, %2, %1\n"			\
-			RISCV_ACQUIRE_BARRIER				\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".d", "", RISCV_ACQUIRE_BARRIER);		\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -86,20 +79,10 @@
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"	amoswap.w %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".w", RISCV_RELEASE_BARRIER, "");		\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"	amoswap.d %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".d", RISCV_RELEASE_BARRIER, "");		\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -121,18 +104,10 @@
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.w.aqrl %0, %2, %1\n"		\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".w.aqrl", "", "");				\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.d.aqrl %0, %2, %1\n"		\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".d.aqrl", "", "");				\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
