Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3187C74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 06:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrd1Z1+2UIuJEzwFK2800IC971An8Ra7ejujlUZG86I=; b=nzJelkb640z79y
	sg9Pk4cL6OTXWNsIJdMJ/bD1LrEtKDRDY3DkddFU1im7fOcsHyfDTKq/TPqgNL5r6QkOACilsuTKr
	55+QR9PnjszYI7BxWQTXkzGvUAYA4Qs/6MHvQaFajlSnHljFhycUHhcUpn5tEMGBbsGpV7MI1ohoQ
	C1XPdg7WpeacRsMg+HjFMbiIVWzIlbr9EBZgAniNh5vSHj8kOHcL2FpHXHFs5n4aKuxLN9+/vR/OY
	x8hIUuFHwawZJOGXG3s/S98DMz3FmQPM1k1RearWopPh5kLwryOQUVOhZJSuCqxI/yR3zQBxd0ig8
	NjTqbyUPXd4H1VOy0aWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peVcM-00BOiM-0f;
	Tue, 21 Mar 2023 06:37:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peVcE-00BOgE-2g
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 06:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679380621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lpwvsmW/EIvjt3XpmgOB2tOjIn+1scWXRJYbQwzYCy4=;
	b=ahX7Ui3ZLGRJDW0+ATMamRhTL3UN71MHK53J4M/rvekHdmMSqn+JvCGRv/5V2QmwNI1sAV
	m6KqDsVljriUeNp/MoR18JiUyeSrkJ67z3B5u3NNTrcvCWZMRTgDHM+Oh1fjhMPVS48W6y
	evVVlHRb7tYdUC61xTYq/DYEjIAdops=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-jUIY--ctM12B7qtl5mcRNg-1; Tue, 21 Mar 2023 02:35:30 -0400
X-MC-Unique: jUIY--ctM12B7qtl5mcRNg-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-17e3d37b3e6so2434513fac.22
        for <linux-riscv@lists.infradead.org>; Mon, 20 Mar 2023 23:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679380530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpwvsmW/EIvjt3XpmgOB2tOjIn+1scWXRJYbQwzYCy4=;
        b=cQ3NuGfwkpQE9npH6vQ+ufnFHrhTxDFfj748lWLG0HatofiHupYeszjGMzuFQ2p0sq
         SLq4vXqU+S0QjD8pMk61bpwtEhPFxk+tqqB1vWE2/VdF/ovwztkDLUcZOBYF5kd2nPbq
         qiSFFMvStcRc0vfFKtgsT94N8X4bt9hr1gFdke2mmcsCzOAEDNIbfTJBlC3h9DEO16zi
         TjdwRw/wQrxqRrfZYTYwo6wrNOdv2SB0BkhKUzl83sgt/WuFtgMkYe5YHupnhQLhxmwy
         bLDJZa7Z4moZNvekacUTwI66bgilDpu/w9sLGpR2E+G0MAibfGyRr8AkSXChRk7163/I
         xFaQ==
X-Gm-Message-State: AO0yUKXVf+HgxMDDpa7InXfK/ZDSN9fBbqTWMnqQ67ctcZQfYlDlyvu+
	CWJYm/zckytg1Yhd4dEDm3xTvgTovE9uDKCoY9l1dfUWlY+f/7o8sQXHWvMQiAEfkVKbKbZI5pW
	WRM2dOG/BtiJW+1FWvp0v5PYwxgNW
X-Received: by 2002:a4a:584f:0:b0:53b:4d59:405a with SMTP id f76-20020a4a584f000000b0053b4d59405amr457327oob.3.1679380530190;
        Mon, 20 Mar 2023 23:35:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set+EYpjdBiffGwngyRKhEMmlht1lLjtybmnM/t+R/I3MOqYmd03nCIqYG7O6LG1cmD69gyKGYg==
X-Received: by 2002:a4a:584f:0:b0:53b:4d59:405a with SMTP id f76-20020a4a584f000000b0053b4d59405amr457315oob.3.1679380529942;
        Mon, 20 Mar 2023 23:35:29 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:b074:274d:d04e:badc:c89f])
        by smtp.gmail.com with ESMTPSA id y75-20020a4a454e000000b005293e9a12f5sm4545147ooa.45.2023.03.20.23.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 23:35:29 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 6/6] riscv/cmpxchg: Deduplicate arch_xchg() macros
Date: Tue, 21 Mar 2023 03:34:32 -0300
Message-Id: <20230321063430.2218795-7-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321063430.2218795-1-leobras@redhat.com>
References: <20230321063430.2218795-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_233702_948935_57512741 
X-CRM114-Status: UNSURE (   9.76  )
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
index 23da4d8e6f0c8..d13da2286c82a 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -43,41 +43,33 @@
 #define __xchg_relaxed(ptr, new, size)					\
 	___xchg(ptr, new, size, "", "", "")
 
-#define arch_xchg_relaxed(ptr, x)					\
+#define _arch_xchg(order, ptr, x)					\
 ({									\
 	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
-					    _x_, sizeof(*(ptr)));	\
+	(__typeof__(*(ptr))) __xchg ## order((ptr),			\
+						_x_, sizeof(*(ptr)));	\
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
