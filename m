Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66B4C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 06:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUtW1eAZWGEOfeyOSBO3h233r8JnOnPh0aQ+a6Y2lwg=; b=xehgXBRvDTRw3W
	fduMu/mAWtDv1JHw+lvsmi72PMMgZuzatafOVNyJMu9RneJ6l3a4JqoHYzJf7Jvx6aYONyVTeXFiG
	dx+lF7NwjMyZOmuL1S5WSwGDWxezkhuDcg65iK0rjLYwmiDk9y0LZ+5XAzQx6K15VRvu+VCyYfn2g
	3kGZCeiTeo0CAVun2E5/HZ5/0uIQILRdhZb179aemDibccMR0Q16rqJMSQhNB8N0yCX/CUFxVqUy0
	Ybzz8hPpA6o89R/X8D72SgGkW3hp6vGRRX2gv0iftw/zdGZ3rG/QJVg+oDh2NSkWyeM+dCnVppZz5
	s9aIgg4JyeHjk9pqigVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peVaf-00BONK-12;
	Tue, 21 Mar 2023 06:35:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peVac-00BOMO-0g
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 06:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679380521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XMfpmYwfPn+xgsAmrLdh6YxWI9aM4T+CUsR5ROJOFiM=;
	b=c+OtciKRYn0CftLE5jYFIMVmK/+siipJeS2PVBiUDdX39fcPDunX+E4F2pXBefukidMA4T
	BBEgj6aBuxReVDxHkcDDz+oelQbebXTtjswlaC7BU30qd5Y56C0V04+4D2wFb09HXIijSJ
	K3HbOxqqOKtq8cMYWNwadNvgqd+LVgs=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-PlPyZ1boMPOS7OlNK2_14w-1; Tue, 21 Mar 2023 02:35:17 -0400
X-MC-Unique: PlPyZ1boMPOS7OlNK2_14w-1
Received: by mail-ot1-f71.google.com with SMTP id e2-20020a9d5602000000b00694299f6ea9so6731958oti.19
        for <linux-riscv@lists.infradead.org>; Mon, 20 Mar 2023 23:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679380517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMfpmYwfPn+xgsAmrLdh6YxWI9aM4T+CUsR5ROJOFiM=;
        b=lQ688yUQfGCcrtEjSBjZhBzHUleb0l7bsTV47HUQfPuu5YlrBpCehgrsal43X/7Ph6
         p38dMYVMzqB8vloNE7TTuSqDpDTV7ImgDLNw8NijPz0NuVUuSEaT/Xax9wSjiRF9+X6E
         J5HZ3Jj2Qd9oxf8PeBL0Iq+dXwbftJ+pWtEPC/qvJlkYImOWBwOH/8GAaucnYMnVcvMe
         r2qkERh7ivsjRKtC9hYxPp3oX5qx5DybRr3arSH+BjwcNBsb6HEiQ7DX+2QWQfhqq3Qk
         Weyw0UJzPBA4JUgmNNoY+w+eNtsfwPnGewoW+6DgSVvffrvi3JJP8+2dbzkyuKhxlvFl
         qdnw==
X-Gm-Message-State: AO0yUKX1jze/IDRoGXfxWsMCF+dP3J1i2tZKWepcMim3flfXmYCruaEH
	bMAMMof2gdgaBrLSiMQBWrrft9/rq3c7jPRUmghVMCTulFwVsGJDFuBXWUjK9LAvy6BjvB//BB4
	9+VwxztvoBUzMP+XMARpnjpn6XxqJ
X-Received: by 2002:a4a:49ce:0:b0:53b:4b94:45bf with SMTP id z197-20020a4a49ce000000b0053b4b9445bfmr436112ooa.3.1679380516941;
        Mon, 20 Mar 2023 23:35:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set9KBCi4JudcKB/KFTrhmudiUfxMZmrtBSAQiYyoKeP9b0F99/cAettMuxy2bo1MR2I9SFwNag==
X-Received: by 2002:a4a:49ce:0:b0:53b:4b94:45bf with SMTP id z197-20020a4a49ce000000b0053b4b9445bfmr436107ooa.3.1679380516740;
        Mon, 20 Mar 2023 23:35:16 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:b074:274d:d04e:badc:c89f])
        by smtp.gmail.com with ESMTPSA id y75-20020a4a454e000000b005293e9a12f5sm4545147ooa.45.2023.03.20.23.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 23:35:16 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 3/6] riscv/cmpxchg: Deduplicate arch_cmpxchg() macros
Date: Tue, 21 Mar 2023 03:34:29 -0300
Message-Id: <20230321063430.2218795-4-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321063430.2218795-1-leobras@redhat.com>
References: <20230321063430.2218795-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_233522_327807_38C551E0 
X-CRM114-Status: UNSURE (   9.69  )
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
