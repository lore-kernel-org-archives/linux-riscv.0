Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B56C77B62
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 16:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VwoU6mY+xbsSeJJF8SzPQR8ZZ9TFIVvpn7kWABf7zLY=; b=06RFWjVeF0bveR
	Z6g/yoYeaqDMSbsXP8K76mfsqb6CWXnDIC2MK/dfoFgsFESu+SIPzeGWIbWYCDVX+y4R3Ma/EiZrR
	Vcc/sHXUBAgqHCsTyDevPQZU/39poiHWFvAhI1jbyg7YBkXauFoHFdY4/Vos52qii4j6VuGpeZQ1i
	g8ct4CLh95Vf411qCtiqlZKzFS0oEzfJPm0M0sgG5iviAHUkrdlj13VcO6GbgyGHcrJDmjmCYEr8s
	K+6TLKJ2mYu+RO2jTh98eFY7NOGCWijRCJ3GhbA5LvoV2pHwsofECv9cCIsl7uBo35ltJJxXd/R/f
	5ppooE1LJrUw8qiV1w8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjfg-002EsL-2J;
	Tue, 04 Apr 2023 16:38:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjfc-002Epi-1Z
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 16:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680626287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Eu0Zi/ZTTdFnwlWVeYiPrkCPaBaCVeU5jDe5lhDGhs=;
	b=jMZDoLc/HeKENAgZYzFQvvz0u1vBdtPoaMpb2dnSC0/SIsm5hJQvSI69GpjPkoyOq3SDgo
	CMA1PpbhKNsLaMwLJoXY4R7NKpdBlI1DBmmoCgikfYM33QCVsuxdINYQDi/FTIciRdDB5Z
	NU6T8LLeh/1qqfI9uuPmdWN6sKJNkCo=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-oRDgnL_ONoOeql0M2JAZBA-1; Tue, 04 Apr 2023 12:38:06 -0400
X-MC-Unique: oRDgnL_ONoOeql0M2JAZBA-1
Received: by mail-ot1-f69.google.com with SMTP id n19-20020a9d7413000000b0069f913914d8so11938295otk.5
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 09:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680626285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Eu0Zi/ZTTdFnwlWVeYiPrkCPaBaCVeU5jDe5lhDGhs=;
        b=y/VO8ldSUdSGR5++vhcxT08Y0Z/oIz++QA7402AthQCcZL8ONY6nSI5XXUS6MichDH
         ulFGyI3rWJ4G+AQ7qx/HjSenjebI8T6X758d11uH5nPH+ae6S6FcgFBCdOFDevbS/EF+
         XltzOtr7bToT0Ap1U1/clycKvdiDZHwDQ5J23NL6IdOiMBGOn43ljBqi4wZDM9VMFvfA
         nz/lGj3GNoS/h+/l0CUQaWODlD3byVRN7sBLP8ZvBVntYnOyQkTo2yPNmHbLAJWblEqM
         UJprzvEjdo30UUmQPvVC/ovjGuQfCk4WM+K7KK93AKjqFT0gVPHYkVC8SxEaBlkCc/Jm
         S7aQ==
X-Gm-Message-State: AAQBX9dF36lB4ji2YuCOVEmJBSn0blsXk67a5QiMCHtJKTp2y9KzFEIo
	S7ks9W7cHopDklwck6Ca/4Dw67yIu7uw2r7BSPtxxIX1Td6Fa7bglV49u2iqsP9sPlnrY9zZUtf
	v2D0hSOloVSJah31mU9NKKxm9Gzej
X-Received: by 2002:aca:d944:0:b0:384:3cc0:9ffd with SMTP id q65-20020acad944000000b003843cc09ffdmr1605624oig.9.1680626285346;
        Tue, 04 Apr 2023 09:38:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZH+tLo6+HoUfrUJlea3gq5Hmp/51sq6E4j8u/P3iEiEiy01tvmDOosUyXWMyR/S17heMTNgg==
X-Received: by 2002:aca:d944:0:b0:384:3cc0:9ffd with SMTP id q65-20020acad944000000b003843cc09ffdmr1605617oig.9.1680626285148;
        Tue, 04 Apr 2023 09:38:05 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a802:2599:c6a8:e6db:a08:61b6])
        by smtp.gmail.com with ESMTPSA id bd1-20020a056808220100b0038755008179sm5264623oib.26.2023.04.04.09.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:38:04 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 6/6] riscv/cmpxchg: Deduplicate arch_xchg() macros
Date: Tue,  4 Apr 2023 13:37:41 -0300
Message-Id: <20230404163741.2762165-7-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404163741.2762165-1-leobras@redhat.com>
References: <20230404163741.2762165-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_093808_595007_B7C1E80C 
X-CRM114-Status: GOOD (  10.23  )
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

Every arch_xchg define (_relaxed, _acquire, _release, vanilla) contain it's
own define for creating tmp variables and calling the correct internal
macro for the desired version.

Those defines are mostly the same code, so there is no need to keep the 4
copies.

Create a helper define to avoid code duplication.

(This did not cause any change in generated asm)

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 arch/riscv/include/asm/cmpxchg.h | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 480234719b78c..905a888d8b04d 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -45,41 +45,33 @@
 #define __xchg_relaxed(ptr, new, size)					\
 	___xchg(ptr, new, size, "", "", "")
 
-#define arch_xchg_relaxed(ptr, x)					\
+#define _arch_xchg(order, ptr, x)					\
 ({									\
 	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
-					    _x_, sizeof(*(ptr)));	\
+	(__typeof__(*(ptr))) __xchg ## order((ptr),			\
+					     _x_, sizeof(*(ptr)));	\
 })
 
+#define arch_xchg_relaxed(ptr, x)					\
+	_arch_xchg(_relaxed, ptr, x)
+
 #define __xchg_acquire(ptr, new, size)					\
 	___xchg(ptr, new, size, "", "", RISCV_ACQUIRE_BARRIER)
 
 #define arch_xchg_acquire(ptr, x)					\
-({									\
-	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg_acquire((ptr),			\
-					    _x_, sizeof(*(ptr)));	\
-})
+	_arch_xchg(_acquire, ptr, x)
 
 #define __xchg_release(ptr, new, size)					\
 	___xchg(ptr, new, size, "", RISCV_RELEASE_BARRIER, "")
 
 #define arch_xchg_release(ptr, x)					\
-({									\
-	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg_release((ptr),			\
-					    _x_, sizeof(*(ptr)));	\
-})
+	_arch_xchg(_release, ptr, x)
 
 #define __xchg(ptr, new, size)						\
 	___xchg(ptr, new, size, ".aqrl", "", "")
 
 #define arch_xchg(ptr, x)						\
-({									\
-	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg((ptr), _x_, sizeof(*(ptr)));	\
-})
+	_arch_xchg(, ptr, x)
 
 #define xchg32(ptr, x)							\
 ({									\
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
