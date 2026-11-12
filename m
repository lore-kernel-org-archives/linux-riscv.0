Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37456606A33B
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 10:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a1dxHwgl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gAkkD+V1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iAFOAec+sNJmdvhVsu7BxucpUpSFg2T4hZPsJDZ7yVs=; b=a1dxHwglA4OoL/SQAVgWhQ/+vi
	6UblIkt3LK4OxgGRSkB9mJ/Tx0MgFNLL0IsGadCaz2kSo8aEON8RYkNi9eH0KcBHFf68VKADtriJo
	iKM62LHM+Yslnbetqg1FqDv/51C82qsbD3CYSdz4cx8WaBqAK/BCe5Te+1nA9D0R2t1DE/rrxwXeA
	nJY7Ai3Mz/Z/lA3JF9z/Ic9oSFeRGOF9Hepjp7UDh2gVzusXN3mQJg/sf8WosYpzJSKBf1kWnmrPQ
	Fyhm39j387mtqDBbq1zE+YdPNCJHmz7DLUeIfumdpseT8BcPfNaP4pURVeAuuYC2dsKWBgOmoc6ME
	Q+LQZXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSIo-00000009Znw-1lzX;
	Thu, 12 Nov 2026 10:45:10 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSIi-00000009Zla-3QiK
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 10:45:06 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3188777c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 02:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480304; x=1795085104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=INpeTcchLLbS0psUlyWopVBCXTqH0HdLEcZJcLgnzp8=;
        b=gAkkD+V1eIbc8QQvmsZ5uCJ8yjeSKIwPTbToInsi4yY9553imByty8wpQgRb/HIxVO
         xLTyVRnd6uU3RF+v8E3z+u4pUNjPTat/4IOFa9QeoaV43Jr8vpnOZvTYhnoSS2RoTEQn
         Mmr1FCdDZcIZGnUs7zc1RlDW4lQ3+p3OQ5c/1LmnPMM3B4T2T4x4ZH3L/SEd0y3A5A+B
         XilPYbNlyOHHU4mJj5+FO1TABV/e/hti9H6srSyDvEPPX+xGwVDRZ3fJ+PPJGaagI9LH
         YCa68OVqg73atlZ1cUblEy7X7KKODGpYMtKV7QdVgiNDUP4TRr3TsjeQmdc1OYM7eVLT
         jY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480304; x=1795085104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=INpeTcchLLbS0psUlyWopVBCXTqH0HdLEcZJcLgnzp8=;
        b=UxWBjIzI7tY/hCpA6rRX33kIRBJpiyZuqXly66YUmFBNRy5ey27zXzT/ooJi9uWyTv
         rYpCbGIXMneYKQQpsdHaiMna4j26iO08YYfdxuIWpji6ELQO/m/MMfsDNn//2nRqZAx9
         32eRvISfmeC6o0JtxlWT1o6FkiALi304Z+50y9nlURG5batHWIgrCsyXvLxlr8gyNpDv
         yZUHXrtk+Hw4RGEpI19li6hVfZJwwRlCrFsxGSauwt+MvUe3BykNLl0DnDO7P7bpfHD3
         E2FFE0q15BYe3TumK6/zrcMH6OQKa2mgsC9MBu0Ch4TQghd1dU6lkedEY62mjZxEuFGa
         jD3Q==
X-Forwarded-Encrypted: i=1; AL+hErH+WM3++fg/lrfnWvseGmGeu1hjXeAOkllKc+RZzgH8SCDGv428pZIFrhkUFQZu7iU6qL8cXzHbDUTS9A==@lists.infradead.org
X-Gm-Message-State: APuU4Z/H2AyXSNbVWHhqxrHYTGoMAu4Jx+Qyz0ZBWZdPwWQbnCp2mjc8
	mffAHO4p2k0Q+0oru29+EUcG4jga9wHUr2eVf4nyBtcX3t7BUF+c9fkl02SLTgnuxKY=
X-Gm-Gg: AYBFou2PYroSp4v+4d19bcHK8x/7yJrW5AdPVzbpB5p0s3JlAbS3fUE0PVpRn/NlmNd
	xN2jlV3r+2mY1bMJTz2dL5TSEeidg8OgCsAC05+Vlby8VlkTre7nJsMaDaCkGD4iQz5rZJNeDF4
	ri5mMDWDSakUn7DjxFmo45ShfGSr6p3aeG6QOZTBpgydei7D9PbGJwVUg7cCpX+/R1OM/Fzg0xF
	/kO3OyPQ6wnYNsTL3VvXch9kJnN+1i7SJy3iMOhwF0yTGQDMMl8LwT4kS3XUnRYKPGbLCFIq4iq
	xgf/nK8YT48+adKZHYobCFsUGIaDx+aJVlh7orQL6LCFENmg1wmzv0vDzp09+Wxd4tcaUFikJFS
	FJXiqwB9BDpfZvIwOQIvdVoTehHUG3nzh/HkewFccPx52vFF1d49+CdFTt+BuyDvD5qRAMf7HMD
	h1SaQ61TnhCxszNInIh2DUFQyV0MiQx3eIad0znSv0wV4M/3XlVBMuUgkcQ1ZogiuBv5cBOthDL
	cITnFoTVfXM60SQfQ3Xq6UQ48OtjNksZV+4fVfUJr7yBEzSC/cDUlYy2vMvUeFGrFlAVBs1B7Dk
	uPGxXC00NWUcmB4lysKtEtrnht28ylLKwcANzwxd6w2oy1CSAuBTOrikXX/JWDVBBH0=
X-Received: by 2002:a05:701a:ca05:b0:166:5552:780a with SMTP id a92af1059eb24-1b3c02f379amr4916378c88.8.1794480303681;
        Thu, 12 Nov 2026 02:45:03 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.44.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:45:02 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	oleg@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	broonie@kernel.org,
	cuiyunhui@bytedance.com,
	dave@stgolabs.net,
	david.laight.linux@gmail.com,
	jszhang@kernel.org,
	tglx@kernel.org,
	conor.dooley@microchip.com,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v10 8/9] riscv: implement preemptible this_cpu cmpxchg128
Date: Thu, 12 Nov 2026 18:41:48 +0800
Message-Id: <20261112104149.38589-9-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261112104149.38589-1-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_024505_023043_39A85D85 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Extend the preemptible compare-and-exchange support to 128-bit values on
systems with native AMOCAS.Q support.

AMOCAS.Q implicitly consumes register pairs, so keep both halves of the new
value in fixed registers even when either half is zero. Retain the
local-IRQ-protected fallback when native cmpxchg128 is unavailable.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 66 +++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
index 4d2fc10cbdab1..1d35fc89eeeb2 100644
--- a/arch/riscv/include/asm/percpu.h
+++ b/arch/riscv/include/asm/percpu.h
@@ -9,10 +9,12 @@
 #include <linux/thread_info.h>
 
 #include <asm/asm.h>
+#include <asm/cmpxchg.h>
 #include <asm/cpufeature-macros.h>
 #include <asm/current.h>
 #include <asm/gpr-num.h>
 #include <asm/hwcap.h>
+#include <asm/irqflags.h>
 
 #define __my_cpu_offset (((struct thread_info *)current)->pcpu_offset)
 
@@ -518,6 +520,65 @@ __percpu_cmpxchg_case_##sz(void __percpu *pcp, unsigned long old,	\
 
 __PERCPU_8_16_CMPXCHG_CASE(8, .b)
 __PERCPU_8_16_CMPXCHG_CASE(16, .h)
+
+#ifdef system_has_cmpxchg128
+static __always_inline u128
+__percpu_cmpxchg128_case(void __percpu *pcp, u128 old, u128 new)
+{
+	__PCPU_OP_CONTEXT();
+	union __u128_halves old_halves = { .full = old };
+	union __u128_halves new_halves = { .full = new };
+
+	register unsigned long new_lo asm("t1") = new_halves.low;
+	register unsigned long new_hi asm("t2") = new_halves.high;
+	register unsigned long old_lo asm("t3") = old_halves.low;
+	register unsigned long old_hi asm("t4") = old_halves.high;
+
+	asm volatile (__PCPU_GPRS_BEGIN
+		".option push\n"
+		".option arch, +zacas\n"
+		"amocas.q %[old_lo], %[new_lo], 0(%[addr])\n"
+		".option pop\n"
+		__PCPU_GPRS_END
+		: [gprs] "=m" (__ti->pcpu_gprs),
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),
+		  [old_lo] "+&r" (old_lo), [old_hi] "+&r" (old_hi)
+		: [pcpu_offset] "m" (__ti->pcpu_offset),
+		  [pcp] "r" (pcp), [new_lo] "r" (new_lo),
+		  [new_hi] "r" (new_hi)
+		: "memory");
+
+	return ((u128)old_hi << 64) | old_lo;
+}
+
+static __always_inline u128
+__percpu_generic_cmpxchg128(void __percpu *pcp, u128 old, u128 new)
+{
+	unsigned long flags;
+	u128 *ptr;
+	u128 ret;
+
+	flags = arch_local_irq_save();
+	ptr = (u128 *)((__force unsigned long)pcp +
+			 __my_cpu_offset);
+	ret = *ptr;
+	if (ret == old)
+		*ptr = new;
+	arch_local_irq_restore(flags);
+
+	return ret;
+}
+
+static __always_inline u128
+__percpu_cmpxchg128(void __percpu *pcp, u128 old, u128 new)
+{
+	if (system_has_cmpxchg128())
+		return __percpu_cmpxchg128_case(pcp, old, new);
+
+	return __percpu_generic_cmpxchg128(pcp, old, new);
+}
+#endif
+
 #define _pcp_wrap(op, pcp, ...)						\
 ({									\
 	op(&(pcp), __VA_ARGS__);					\
@@ -618,6 +679,11 @@ __PERCPU_8_16_CMPXCHG_CASE(16, .h)
 #define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
 #endif
 
+#ifdef system_has_cmpxchg128
+#define this_cpu_cmpxchg128(pcp, o, n)					\
+	_pcp_wrap_return(__percpu_cmpxchg128, pcp, (u128)(o), (u128)(n))
+#endif
+
 #undef PERCPU_RW_OPS
 #undef __PERCPU_AMO_OP_CASE
 #undef __PERCPU_8_16_OP_CASE
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
