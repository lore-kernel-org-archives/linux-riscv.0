Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460E7C74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 07:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrd1Z1+2UIuJEzwFK2800IC971An8Ra7ejujlUZG86I=; b=HSFWzw6+i2R48Y
	C0qYPs82uJhSfcYq4CYb9bV4eaunV/e2ZaT1z26Z2MeIKGrh4gB7NO9qJTvn533t0iyRi8j7uzxlT
	cnz+USZKkT0MEMNWLTLOTqlmsSA8diwWkKOFHmES+pBfK6MFu58zAey7qiBcWdMtjlqOMZyxIaKS2
	r6VPfo4m7hVSO37cv3WQHjwvHm4MyL80Y6xeHCl53BfsoQrzJxxMsJghhN1LbcQaAorC3+8tMvZan
	EYOCwuPU3y0ybmQXEBIifzMEIR+NRk3oTmo9NFxr5hTkJ7Be+gIulBh5Ls8t7mlhG0lpJWId7zqHn
	lcRyyqDZrAoEn+b2H4Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWeT-00BZOQ-1K;
	Tue, 21 Mar 2023 07:43:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peWeP-00BZKW-1K
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 07:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679384597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lpwvsmW/EIvjt3XpmgOB2tOjIn+1scWXRJYbQwzYCy4=;
	b=cA62bt3jo3ssRH1swGyrwCbcRPWYD6oJAQqW3lVJQiuWwyGomZLobYpSq2ZogZZLA5m6ra
	Dn7eCW3AsO/EzcCOetrRAnGOrhm9Qv4sxNwFOzKHNzXgkR2rzOLaW4JZ8CY+tyMZaYzjB4
	F7sPIQiuT++p3OMGm7bLX2S+oNmw+JE=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-khJLA3VYMyCVFK12QKdP-A-1; Tue, 21 Mar 2023 03:43:16 -0400
X-MC-Unique: khJLA3VYMyCVFK12QKdP-A-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-17e3d37b3e6so2504469fac.22
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 00:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679384595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpwvsmW/EIvjt3XpmgOB2tOjIn+1scWXRJYbQwzYCy4=;
        b=7VjX6nZ0aPyDjjoJsaqJHivTGidCrXw4bUubWzRYH/+NL3Otq89tz26fEg9RbXEwP/
         OD8Snh3iXiSXTa+9aekeTwjd+m/g2VHuF6BaQX5NoQmk8k9aSKoFkLkFeU6Xw3n/yCY9
         uNYUC5WV2tfj8vKgfVPEE0t3qu1G8H9E0y8pXQI4PERO4fHm4Ryik9mVh5WXEmds6ZIQ
         Vq/22eC8jXcNe+ly18bk56qkDWmIsnkVXCznCpc2TjruIexEfuKR+QoJZ3siaWswX0Fn
         NUO2EvuWtHld5iEauZShybdIFVwIdE2fEfZzGGNZSDoKCaBuOJfJaJO0h2SqiPjacLYA
         C+Ig==
X-Gm-Message-State: AO0yUKVTJ29UJ7vg43J0D53gZh1PtKu8YRD29ltYY4E13zN3zSKuI4Qw
	Z2LcyakZYJT9QNDFM55tey9Xgsq6Zo3xZiidKSlrBtVx4sIXQaFeAmZGo27Cs0J3cu3hSeAlJQN
	ra5Gow95W1XW0NEv/nSjY3aEBlgZRfMtjPa5vIh8=
X-Received: by 2002:a05:6870:96a3:b0:17a:aa09:5e2d with SMTP id o35-20020a05687096a300b0017aaa095e2dmr792356oaq.2.1679384595730;
        Tue, 21 Mar 2023 00:43:15 -0700 (PDT)
X-Google-Smtp-Source: AK7set+xdtuBzqIzRLUy5fOxuDWGKLvUOQjLd8NO8+P4+E/SVNozGANIGtgUzqns1gUz4+yOt3JNVg==
X-Received: by 2002:a05:6870:96a3:b0:17a:aa09:5e2d with SMTP id o35-20020a05687096a300b0017aaa095e2dmr792348oaq.2.1679384595495;
        Tue, 21 Mar 2023 00:43:15 -0700 (PDT)
Received: from localhost.localdomain ([179.111.176.145])
        by smtp.gmail.com with ESMTPSA id az15-20020a05687c230f00b0016a37572d17sm4047729oac.2.2023.03.21.00.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 00:43:15 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH v2 6/6] riscv/cmpxchg: Deduplicate arch_xchg() macros
Date: Tue, 21 Mar 2023 04:42:49 -0300
Message-Id: <20230321074249.2221674-7-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321074249.2221674-1-leobras@redhat.com>
References: <20230321074249.2221674-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_004321_552171_886184B0 
X-CRM114-Status: UNSURE (   9.51  )
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
