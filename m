Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68713C001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 02:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GanTHlYhYX5QFinaUMguOws2e83OuzgtZDeg+rWUwaw=; b=Fogeu70uJQM7Aj
	+bpnF3GOGLArRDv+VhQMBuUxo4icdTwm5+lzvi5PPM8sTINIyji/WfDmM3jhP8lCMUy9yi89EYHAH
	m/2lWSfmXOrH6Bb42TfvDO8+ifhJhc6gFeMEUvJbwRTtgMfgheG4nKmu4ZSOEovJnNN/DyYkKdRiD
	DViQ7XJG9kriqZi8IWDJY6ma+BCJL2f4U5ZDDfZ71+eRQnjyG2/1YwO+lcc0Y3tKno2bc1Pv+zExx
	+DkNip63Su2X2NLjrG7IVc+apKm/1roPrUItwa4u9gfZwR0j8nDfKJSh1yKsCQu/aOmsPxzelKiS6
	fS9FxnMNNRZJF8XFpGRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYiQ-003sce-2M;
	Wed, 09 Aug 2023 02:14:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYiN-003sbA-27
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 02:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691547262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QSwkRG8bcSleBdtSsjCnyBmp/8Y+sHuiXOKQQOlQtH4=;
	b=XhgRnaysDIyKjwWEioRIbel9E32OKc+1kLhtv04wA4gOOJFIprsafp51CaTjvxv7QUXOJG
	3ApUdtMEkvoT7LCLuY9mQml5VLptN0BpZSjWnSe1hcc5U0gSTy2i0Uypasl8EBQeeLznY7
	4HaL+nIXT0KrRBFE1NUVd9nUKd0Tqfs=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-lqCKYS4ZNguUfwb2PYyNJA-1; Tue, 08 Aug 2023 22:14:21 -0400
X-MC-Unique: lqCKYS4ZNguUfwb2PYyNJA-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1bf2e81ce63so587077fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 19:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691547261; x=1692152061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSwkRG8bcSleBdtSsjCnyBmp/8Y+sHuiXOKQQOlQtH4=;
        b=IxKJgAzG7Also46rjI1QxCPufFRzctB0z+un1F7rxN4Mf/9H5V5zxf6igYht2CVJ8v
         RPPJLvnCkXqiiCP/1ILCcVeoU6PsPo1gGEQqUwbZENJKpkFopdZA7bPf9USxxRqJ/yl9
         ZYxh2cZP+vEMMIZpfe9tuyg/yWPuiNwvSJwdFrwtDpxvWibGoNaSofdH26u5RC674fsC
         a1hqMuKvXFKlHnGgNjWvrCOn9tdc1p1X/vSCqfd3Cv0ITxHCI4Rg4jwjd0GfS4NSznUs
         REVUArPnBE01mwaXb3JSLUFDpe38qEFdbZp6Z6e582C8MWTCnTfaf1yY1loO9CIaop3z
         MoGw==
X-Gm-Message-State: AOJu0YyivA34ppdm0yVE9lncZOJTaI/plRC8vbqz0nbycq/mbBYmJEhX
	+Qa6fsU+fk1rJag/W8ZP1kdEVKrxuiXeKEgXK0sFznPNc1ENvvP9fQ6kYIQAPOJCHwoyhFtNP6e
	//oy0UEsdz+3u0IEf3WTh+r9Te+oe
X-Received: by 2002:a05:6870:b6a9:b0:1bf:1c49:749c with SMTP id cy41-20020a056870b6a900b001bf1c49749cmr8730775oab.13.1691547260769;
        Tue, 08 Aug 2023 19:14:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHlHClRw7hdQrrpejz4vuDyEoE85EOUKHc1btv2W4ZMe793U+R5Uo/+moePgCrObCJ/o3ANw==
X-Received: by 2002:a05:6870:b6a9:b0:1bf:1c49:749c with SMTP id cy41-20020a056870b6a900b001bf1c49749cmr8730768oab.13.1691547260529;
        Tue, 08 Aug 2023 19:14:20 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7ec:e667:6b7d:ed55:c363:a088])
        by smtp.gmail.com with ESMTPSA id v10-20020a4a8c4a000000b0054fba751207sm6475518ooj.47.2023.08.08.19.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 19:14:20 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Andrea Parri <parri.andrea@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v4 5/5] riscv/cmpxchg: Implement xchg for variables of size 1 and 2
Date: Tue,  8 Aug 2023 23:13:10 -0300
Message-ID: <20230809021311.1390578-7-leobras@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809021311.1390578-2-leobras@redhat.com>
References: <20230809021311.1390578-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_191423_791253_CF7DD52C 
X-CRM114-Status: GOOD (  12.44  )
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

xchg for variables of size 1-byte and 2-bytes is not yet available for
riscv, even though its present in other architectures such as arm64 and
x86. This could lead to not being able to implement some locking mechanisms
or requiring some rework to make it work properly.

Implement 1-byte and 2-bytes xchg in order to achieve parity with other
architectures.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 arch/riscv/include/asm/cmpxchg.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index cfada8a7cfd2..1640308f3c4d 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -11,6 +11,31 @@
 #include <asm/barrier.h>
 #include <asm/fence.h>
 
+#define __arch_xchg_masked(prepend, append, r, p, n)			\
+({									\
+	u32 *__ptr32b = (u32 *)((ulong)(p) & ~0x3);			\
+	ulong __s = ((ulong)(p) & (0x4 - sizeof(*p))) * BITS_PER_BYTE;	\
+	ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)	\
+			<< __s;						\
+	ulong __newx = (ulong)(n) << __s;				\
+	ulong __retx;							\
+	ulong __rc;							\
+									\
+	__asm__ __volatile__ (						\
+	       prepend							\
+	       "0:	lr.w %0, %2\n"					\
+	       "	and  %1, %0, %z4\n"				\
+	       "	or   %1, %1, %z3\n"				\
+	       "	sc.w %1, %1, %2\n"				\
+	       "	bnez %1, 0b\n"					\
+	       append							\
+	       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
+	       : "rJ" (__newx), "rJ" (~__mask)				\
+	       : "memory");						\
+									\
+	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
+})
+
 #define __arch_xchg(sfx, prepend, append, r, p, n)			\
 ({									\
 	__asm__ __volatile__ (						\
@@ -27,7 +52,13 @@
 	__typeof__(*(ptr)) __new = (new);				\
 	__typeof__(*(ptr)) __ret;					\
 	__typeof__(ptr) __ptr = (ptr);					\
+									\
 	switch (sizeof(*__ptr)) {					\
+	case 1:								\
+	case 2:								\
+		__arch_xchg_masked(prepend, append,			\
+				   __ret, __ptr, __new);		\
+		break;							\
 	case 4:								\
 		__arch_xchg(".w" sfx, prepend, append,			\
 			      __ret, __ptr, __new);			\
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
