Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14553C77B60
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 16:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FR5sMSvwS+hqynUlICV1fDZ/Cs7zLsqil4f47RHP640=; b=bh5xEr3L1Fy4O2
	GAXD8KvBB5Jjs+WtPRbG7DxUBB8vtRBTwJKicFrKOabdRrMy4LXPfZAjiH6VgOgVPJ1iudXUOG3VK
	pEql2WeWTgVzP2B4lM3agRgOojmDEqJ4B+36Pr9SSHHSpf8C3noT44BPyE1l4svFwgAOOG6dJrYM7
	I0vQ4lW+qBcKnVbk2jQUhZbiwVwMU0S0qeX9TC3doHVwjMYJU4TNGDX14EQvPwfT8Z3DA5tG4VJWq
	U5hWoyC14xSgDGVcz8qp1MofluuDUkNC4H2r2uPTSBXGFXAo0mP2XCJmrq7U1HN7ReUJVOmjIr1GT
	SoHpHA76hYRagPiP5n7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjfY-002Eoa-2p;
	Tue, 04 Apr 2023 16:38:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjfV-002EmE-32
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 16:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680626279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x67eJiKWfkOOGp7f4Z5Mhye30XEwf/bDKb9kNuQLIhw=;
	b=JgwfNOcO7TiDzhWSfffr40WGSG9iD2IYihSkoSIHeQNYRnRJOxeCx2jcuNoxLvjPuSf9yl
	ihcqrxYxrjcjVaAwLXuUv0O8idHFGFvhJTijM2YzIuXcORmNAZCQWfUbOyG4PvjUcassIv
	qI0+DLz5bGflw5kLGGZCULbQqg2YeNM=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-5Bn4ZX9TM5GHXNfX-65icQ-1; Tue, 04 Apr 2023 12:37:57 -0400
X-MC-Unique: 5Bn4ZX9TM5GHXNfX-65icQ-1
Received: by mail-oi1-f197.google.com with SMTP id i128-20020acaea86000000b003893eb09687so7075226oih.20
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 09:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680626277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x67eJiKWfkOOGp7f4Z5Mhye30XEwf/bDKb9kNuQLIhw=;
        b=6oZkcRPCl5ZeC24sZEkY7RkUPheJ45Heq5LQ6B5JQmgCyHF5JxbJ2gFj4aKRtMcefy
         jIdHiqFPF1Y48w2q8Sm2Ohl8vFR0IJS9Jiya3TxPjw7UqXnTMTad3kZZMpxJLNB4O9yE
         ok5pOZyitFsbQ+i6QH6gZnldVXtZj4ihYSiuLp/5Pm+x9HH5SpeHFeiOs2u2wK7E7FlK
         j9Seal9dakSCHudW0VzPeiz97/B3iIhri6NkTHpgtxhoNDKZDMK6O5fqkhKYnfyumm5h
         djoXATNTf7/tNnTIRLugqS/7H0v8tKvkUFJliFahwdaPUyMHlsPWbWp2yR+p7KiETWhR
         rUNg==
X-Gm-Message-State: AAQBX9dhO5ZxjKi5vRSS7P66rs60o6fY/co4x/nA6g8SQQsfx6nMhY8B
	pp4KzY8uBSgen9fQSeAIlLPEX6iymmG6oibYMrHSkMgM19Dw/NkVD9sGgDcn3/ouWoPYME7+cP4
	PdMKDMgCDtDdCyVM79L91hw+PzG+w
X-Received: by 2002:a54:471a:0:b0:389:72d5:f16f with SMTP id k26-20020a54471a000000b0038972d5f16fmr1575909oik.28.1680626276554;
        Tue, 04 Apr 2023 09:37:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZFxm9VKkuRCMgs6kh4K+aV5vzqKnbbzO6Oq2hq27GK/DiYuPVZe/Rh2OKQA1BsOa41q5DNAw==
X-Received: by 2002:a54:471a:0:b0:389:72d5:f16f with SMTP id k26-20020a54471a000000b0038972d5f16fmr1575905oik.28.1680626276359;
        Tue, 04 Apr 2023 09:37:56 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a802:2599:c6a8:e6db:a08:61b6])
        by smtp.gmail.com with ESMTPSA id bd1-20020a056808220100b0038755008179sm5264623oib.26.2023.04.04.09.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:37:55 -0700 (PDT)
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
Subject: [RFC PATCH v3 3/6] riscv/cmpxchg: Deduplicate arch_cmpxchg() macros
Date: Tue,  4 Apr 2023 13:37:38 -0300
Message-Id: <20230404163741.2762165-4-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404163741.2762165-1-leobras@redhat.com>
References: <20230404163741.2762165-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_093802_053148_DB805E14 
X-CRM114-Status: GOOD (  10.05  )
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
 arch/riscv/include/asm/cmpxchg.h | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index f76a82274a4fd..f88fae357071c 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -204,46 +204,34 @@
 #define __cmpxchg_relaxed(ptr, old, new, size)				\
 	___cmpxchg(ptr, old, new, size, "", "", "")
 
-#define arch_cmpxchg_relaxed(ptr, o, n)					\
+#define _arch_cmpxchg(order, ptr, o, n)					\
 ({									\
 	__typeof__(*(ptr)) _o_ = (o);					\
 	__typeof__(*(ptr)) _n_ = (n);					\
-	(__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),			\
-					_o_, _n_, sizeof(*(ptr)));	\
+	(__typeof__(*(ptr))) __cmpxchg ## order((ptr), _o_, _n_,	\
+						sizeof(*(ptr)));	\
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
