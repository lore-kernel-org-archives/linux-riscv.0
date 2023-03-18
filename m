Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB81C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Mar 2023 08:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrd1Z1+2UIuJEzwFK2800IC971An8Ra7ejujlUZG86I=; b=SLqcIbLo9+7Us8
	B0S3LYBcc0+LZDs4I7XTzZj7HRr241aFLO0XTpiPiG8cILL1Gv72r4so81hcXfL/OsirgjmZVLfjU
	2j6slyf5gTkjTl72uucAIlF75CuncDTEvmQY77AG5VUgpb42jLWq7+NWRwqKeVxhgGTCEeDYU2GTt
	lGCYAegLxpZnuubkWxSTtnLeskT8qUxuewUEnxAVtPtnEujewvD8AFoHHHAagN8ZSfQTq9rMzMHku
	v4KVilPtno7rbwc7H5Ha7zBvkx+Fq2oWmAMvEow0c1NEvfzJtXoaNE+CwIliRszs2UiYgflHp3k/H
	9+3oAZO0Q6zV/xpitKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRXB-004OWX-2U;
	Sat, 18 Mar 2023 08:03:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRX8-004OUp-2A
	for linux-riscv@lists.infradead.org;
	Sat, 18 Mar 2023 08:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679126601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lpwvsmW/EIvjt3XpmgOB2tOjIn+1scWXRJYbQwzYCy4=;
	b=Rsts4vE9uyMYBZK2MZWsDaYX28ikFK0oRJ/UpPbp8LgmXYiqu27Czdbsi0mG4pnvbT2sa5
	nvf4FPU//OwwHItAjKQWhktrWpRhsTpYbs0qG+BYYpoDG8MAPGJzuuWppqA/eKCaw4umNG
	dAOLDKU/h+LPUq3QplaBq/B812wN4qM=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-nS_i3ZvDM6aORLwq6-eZsQ-1; Sat, 18 Mar 2023 04:01:52 -0400
X-MC-Unique: nS_i3ZvDM6aORLwq6-eZsQ-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-177c2fb86b7so4223592fac.20
        for <linux-riscv@lists.infradead.org>; Sat, 18 Mar 2023 01:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679126511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpwvsmW/EIvjt3XpmgOB2tOjIn+1scWXRJYbQwzYCy4=;
        b=HIlE+m7xlK7vaaUJqv1tXKC9befbiqadAIwz0sokUboO4Fb4FjeC9WHRYIh1sF9GoP
         ChVg3vvU1ns4b9oMT06FpfFAmlu/GKYdFxh9K01q8vqpNJ8878wey5k4hJtDlcXGOarJ
         cAumk9fv3CDYH9ISDKaucWsKGiQlet+K+82wlPiiJPuEKnc0tlUkPRngTLuVXqw0vMhL
         EeHrqrNimswnSfgfdCbY4xaF6UVaJ/6pTe9AadTNEwxFpit9Ss2x1AxPoBwAVDPC+L7G
         Wc4SF3kP4y//ccuJQYthhsdP4p2muHK3S7OllXO/NsQhrdPI4EMupHM/HSZzi8FREROI
         nlwg==
X-Gm-Message-State: AO0yUKVyVaDH+Ggv4cuGMD9QY385wcY1YqF7Zab9lRBzOos/03Zr0pH7
	RslohlP6uIjHXnJtog2KoRo1D2JjpDZNF8kcPk+GCNGj2OBsNbL+WZUiUs+Lve1AZ1ozH0posF3
	sCkOZazZd9CgHFavrYUpGekgyBuiU
X-Received: by 2002:a54:4105:0:b0:386:a6cb:82ed with SMTP id l5-20020a544105000000b00386a6cb82edmr5217853oic.33.1679126511679;
        Sat, 18 Mar 2023 01:01:51 -0700 (PDT)
X-Google-Smtp-Source: AK7set/JkYinclH5dcLs6EHBhSKruKldE5cS9Bd8lNlJcC0BBckJockV5iTHiGLJSuRSCGUw//8tvQ==
X-Received: by 2002:a54:4105:0:b0:386:a6cb:82ed with SMTP id l5-20020a544105000000b00386a6cb82edmr5217850oic.33.1679126511452;
        Sat, 18 Mar 2023 01:01:51 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:b074:274d:d04e:badc:c89f])
        by smtp.gmail.com with ESMTPSA id c3-20020a9d4803000000b0069dc250cb24sm1824462otf.3.2023.03.18.01.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 01:01:51 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 6/6] riscv/cmpxchg: Deduplicate arch_xchg() macros
Date: Sat, 18 Mar 2023 05:01:00 -0300
Message-Id: <20230318080059.1109286-7-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230318080059.1109286-1-leobras@redhat.com>
References: <20230318080059.1109286-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_010322_782782_9C26560C 
X-CRM114-Status: UNSURE (   9.89  )
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
