Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140C9C761A6
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 07:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUtW1eAZWGEOfeyOSBO3h233r8JnOnPh0aQ+a6Y2lwg=; b=POHZ2sfxb2QUWY
	7nyXEPAPKyw7h+sIi+S5dzf0B0usSE0K0WvSoJ22JPbdmTdpCDFBomZD2bO3Nz694rurBrp7XJ87S
	Ce7iZtFX30SD1770iELks99Yq4pO420ykdHJI08x6B1YwBDCGcBuDVIxmDIZH1szgCf6D6AOlmiaQ
	CZwVl+DwoaebbzuKAqlbPQLlyi9a/0JWU8NJSag+XFQY/r/JcAmKkXY2VaiNkxworX7xgfDMJ/dCg
	U4na+il+vSY6CYptp+j/y/LHWgs0N9b5eZqud8p+XVlX5ET/IBF6HE8jASziMSXuZMBzkM++Om+bM
	huRHZiPgFPryxuWVqQDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWeK-00BZJP-1e;
	Tue, 21 Mar 2023 07:43:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peWeF-00BZGj-1j
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 07:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679384590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XMfpmYwfPn+xgsAmrLdh6YxWI9aM4T+CUsR5ROJOFiM=;
	b=WXiTzDC1bvLxbtXhvDjowZ15d0F0JuknS25XaCLKpxGtQmaLHOGIymO557NBDzKPIdrUk0
	Apvw/9Uzn7KE6wD5gFqmT8Peuu0n22lLMNEiznDLe3N+FTNmDUHP8uQW3yN75ey4Y1s3Ob
	AvNkLJ2YrXNLO38u1eYPyUZO00OTEXU=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-FO0vn2k9N8uy0MDmsGTcdQ-1; Tue, 21 Mar 2023 03:43:09 -0400
X-MC-Unique: FO0vn2k9N8uy0MDmsGTcdQ-1
Received: by mail-ot1-f70.google.com with SMTP id n2-20020a9d6f02000000b0069f0faa4f7fso3444939otq.14
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 00:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679384589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMfpmYwfPn+xgsAmrLdh6YxWI9aM4T+CUsR5ROJOFiM=;
        b=w1c4HtEXEhfBbBniHi1r0R0h+nRQrUVFIUULdQZnyyiV/MPAP9JintGcEsaSMLRdIX
         Tl3G95UzuI4ppFanTDNDKcRud3JrEPPaHOprFKld4nriPb1R8OK7Hab/g5kTe766gCwD
         sqmypJ0gemOm/K+pVmyhGzYTgNVUG80MordBF0ZO1MYkHaG7Fl3JdIgEV/PJXRoq5c6/
         +++zrM7+/tsF8R+L8uxo7I4ZHvAKCpcdSR2nGhqSdldudfF8WGWxv8rAb7Yyst3HG9am
         pAZY42ldi3BI9YEGscsrLlND7yhE/7L30eFYnWOczcC/ZU8MRj+XeL/GBYzD2oAI1Bf1
         XbsQ==
X-Gm-Message-State: AO0yUKXju+P5RAX91Mz6IAlyQci93v0AVBC3PC2nsHX6IQOLCYf2YFW8
	2MXUZOrnSyKZ52fKQYd3etxHql5SII3W/wm70K1itDhazEO5uYlN2gXto7vkX2RaqL00NE7Y24q
	YLxekLynQMeY0Uf7+rgFAt3qJGaHriU6bXJalJ/0=
X-Received: by 2002:a05:6870:a686:b0:172:3d71:c248 with SMTP id i6-20020a056870a68600b001723d71c248mr667010oam.18.1679384588864;
        Tue, 21 Mar 2023 00:43:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set//h+rt/5rnzWZgDMDSljtrlf8yFkWx80HQCLbvaD/XbP8sCxWepJibqGOFz3BE31CrO/dz9g==
X-Received: by 2002:a05:6870:a686:b0:172:3d71:c248 with SMTP id i6-20020a056870a68600b001723d71c248mr667004oam.18.1679384588690;
        Tue, 21 Mar 2023 00:43:08 -0700 (PDT)
Received: from localhost.localdomain ([179.111.176.145])
        by smtp.gmail.com with ESMTPSA id az15-20020a05687c230f00b0016a37572d17sm4047729oac.2.2023.03.21.00.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 00:43:08 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH v2 3/6] riscv/cmpxchg: Deduplicate arch_cmpxchg() macros
Date: Tue, 21 Mar 2023 04:42:46 -0300
Message-Id: <20230321074249.2221674-4-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321074249.2221674-1-leobras@redhat.com>
References: <20230321074249.2221674-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_004311_672071_C7344F58 
X-CRM114-Status: UNSURE (   9.34  )
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

Every arch_cmpxchg define (_relaxed, _acquire, _release, vanilla) contain
it's own define for creating tmp variables and calling the correct internal
macro for the desired version.

Those defines are mostly the same code, so there is no need to keep the 4
copies.

Create a helper define to avoid code duplication.

(This did not cause any change in generated asm)

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 arch/riscv/include/asm/cmpxchg.h | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index c7a13eec4dbcc..e49a2edc6f36c 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -202,46 +202,35 @@
 #define __cmpxchg_relaxed(ptr, old, new, size)				\
 	___cmpxchg(ptr, old, new, size, "", "", "")
 
-#define arch_cmpxchg_relaxed(ptr, o, n)					\
+#define _arch_cmpxchg(order, ptr, o, n)					\
 ({									\
 	__typeof__(*(ptr)) _o_ = (o);					\
 	__typeof__(*(ptr)) _n_ = (n);					\
-	(__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),			\
-					_o_, _n_, sizeof(*(ptr)));	\
+	(__typeof__(*(ptr))) __cmpxchg ## order((ptr),			\
+							_o_, _n_,	\
+							sizeof(*(ptr)));\
 })
 
+#define arch_cmpxchg_relaxed(ptr, o, n)					\
+	_arch_cmpxchg(_relaxed, ptr, o, n)
+
 #define __cmpxchg_acquire(ptr, old, new, size)				\
 	___cmpxchg(ptr, old, new, size, "", "", RISCV_ACQUIRE_BARRIER)
 
 #define arch_cmpxchg_acquire(ptr, o, n)					\
-({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
-	__typeof__(*(ptr)) _n_ = (n);					\
-	(__typeof__(*(ptr))) __cmpxchg_acquire((ptr),			\
-					_o_, _n_, sizeof(*(ptr)));	\
-})
+	_arch_cmpxchg(_acquire, ptr, o, n)
 
 #define __cmpxchg_release(ptr, old, new, size)				\
 	___cmpxchg(ptr, old, new, size, "", RISCV_RELEASE_BARRIER, "")
 
 #define arch_cmpxchg_release(ptr, o, n)					\
-({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
-	__typeof__(*(ptr)) _n_ = (n);					\
-	(__typeof__(*(ptr))) __cmpxchg_release((ptr),			\
-					_o_, _n_, sizeof(*(ptr)));	\
-})
+	_arch_cmpxchg(_release, ptr, o, n)
 
 #define __cmpxchg(ptr, old, new, size)					\
 	___cmpxchg(ptr, old, new, size, ".rl", "", "	fence rw, rw\n")
 
 #define arch_cmpxchg(ptr, o, n)						\
-({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
-	__typeof__(*(ptr)) _n_ = (n);					\
-	(__typeof__(*(ptr))) __cmpxchg((ptr),				\
-				       _o_, _n_, sizeof(*(ptr)));	\
-})
+	_arch_cmpxchg(, ptr, o, n)
 
 #define arch_cmpxchg_local(ptr, o, n)					\
 	(__cmpxchg_relaxed((ptr), (o), (n), sizeof(*(ptr))))
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
