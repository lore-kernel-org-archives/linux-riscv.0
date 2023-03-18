Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE7FC76195
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Mar 2023 08:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUtW1eAZWGEOfeyOSBO3h233r8JnOnPh0aQ+a6Y2lwg=; b=rRaK6J+EytZMGg
	NStkhOLd130rk+D/BlV5EghgZsufCaxv2M4uvRyD+n2W81egpyqgHqkC4zCeBlEoGfkhuFfond6wA
	mgShWtug/IoyZqIIRx9gCcveWDwB/R4VVCouXNvSZQappuc+VQWzbZULrP+lTXgknh8fTNxgn2azI
	ScaZYpF5Pbr2q+rnt7gilW0Ps0LT02nLEljOMe8gX42WkA3627phOBpfVA9rx0ty9BWplixYd/lUu
	4r3SSDEloZDuKzXludI8eRAY1Jg5DgUuTwAyYJhfmFABckxPrXjgq3vqx5FnbZd3ZBNPf+yV1nae/
	LZXOKiMm1oS472BseGJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRXD-004OXp-2y;
	Sat, 18 Mar 2023 08:03:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRX9-004OUw-0n
	for linux-riscv@lists.infradead.org;
	Sat, 18 Mar 2023 08:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679126602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XMfpmYwfPn+xgsAmrLdh6YxWI9aM4T+CUsR5ROJOFiM=;
	b=R+zjOMp0fh3vNEYL8VFOFLgW+AQoBtyFsush5jNE+POjowbhOvwwxcD6v8ZluHSzRx8ZWN
	bBXoH40doL9QC3DMOCblYSojC4kLjQohXvWP2OME9XAncfB+S7Qn+n9EahEusiIk5lF6ar
	erPJjEWzA8NZ+BESj2S1KKSLJV+OcLU=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-dY25fkjkPS6hZPiRgkSovw-1; Sat, 18 Mar 2023 04:01:41 -0400
X-MC-Unique: dY25fkjkPS6hZPiRgkSovw-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-177c2fb86b7so4223321fac.20
        for <linux-riscv@lists.infradead.org>; Sat, 18 Mar 2023 01:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679126501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMfpmYwfPn+xgsAmrLdh6YxWI9aM4T+CUsR5ROJOFiM=;
        b=M182ON0GQybicqMmXh1OFNc7I8rCPwGzyVR7uXE9NoSYUIYyXzXbbAwJvbCxZAMpvs
         R8Iw7YXQSW0A0hKoB1RfrnM5G0k28zXyyuE72Wt//Mh+e5LbEy9PhiATzMXiqi4PX2YE
         G6P9y4Lb0XXwptuJXbd+fi6K4T7IbPyiaEEm8BMJDvKiNhO1GNFFu/xU19jpBWv3zrPn
         faBGO35wkRFJo+jT7mhcOUBiZs6mJ3GIlMx505xcWyC2OCAhFWtUT5YkC5b4DFXCxgHZ
         MOgaU9CjGo589xfI0Un2008Z6o53T6XPTuupPVDYM7fu6fgj4uO2RqlgS8UA/NpIA+oT
         KVeQ==
X-Gm-Message-State: AO0yUKUuQ9A9+D+HAsBPmyJO6USsyPYA1xzU7CVTkDnRcU38o1JyrvNV
	8yTtiPXOvjcBHtHTq4sCJoKdTI3+F3EMhX2AbY059PgKUpMsUEDj6WzMKgCxLCVfxCOBzpvjGCJ
	KVRiZ0UCJLxLtrf3vhttE2Kjff6lg
X-Received: by 2002:a9d:4813:0:b0:68b:dfc9:c41c with SMTP id c19-20020a9d4813000000b0068bdfc9c41cmr696696otf.9.1679126500834;
        Sat, 18 Mar 2023 01:01:40 -0700 (PDT)
X-Google-Smtp-Source: AK7set+qA+Wajn70KJF8VSYWlbJbIwFT+kahKHnCy/vx5pmbuTdfzLCDMZ/nlXQnhye3u/ZMg1TpNw==
X-Received: by 2002:a9d:4813:0:b0:68b:dfc9:c41c with SMTP id c19-20020a9d4813000000b0068bdfc9c41cmr696690otf.9.1679126500582;
        Sat, 18 Mar 2023 01:01:40 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:b074:274d:d04e:badc:c89f])
        by smtp.gmail.com with ESMTPSA id c3-20020a9d4803000000b0069dc250cb24sm1824462otf.3.2023.03.18.01.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 01:01:40 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/6] riscv/cmpxchg: Deduplicate arch_cmpxchg() macros
Date: Sat, 18 Mar 2023 05:00:57 -0300
Message-Id: <20230318080059.1109286-4-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230318080059.1109286-1-leobras@redhat.com>
References: <20230318080059.1109286-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_010323_354256_6F24D576 
X-CRM114-Status: UNSURE (   9.71  )
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
