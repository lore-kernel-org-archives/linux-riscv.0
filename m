Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5232D606A331
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 10:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GYTTVpC5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ac4Ki1lM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vS1LD5iBq+lNKPFuYtuP1rAcSMCvfvVXIATjsFN0yjA=; b=GYTTVpC5o0kbFnuDji3hMxpDt1
	WiTZ0HRobDlcyyl2ola3YqVcU9IJvvHZ4qleTII5DVVsmafNCg77nFuyPT5GX1UwzQSEb3dtF+7dR
	1z/s5aSV3c8FekYlMWIUVUH65owfUi4I4Bns2twZqn6l4D2WujDkFS5veyfY4WeMxiAl3v0m+E1Kr
	E4NFEcK475AkcOJo58uf/mY66Wp0E7vxyiemudf0qor+yJRa0KlUezOO/6aquWQwJ2awoLAHLtiRK
	vEK/LCRPcA0f/NNdQrR8AtSWXLB53Oyro9hqkNcCVnlsch2HJxQizx0ALvc5IvS+qsg0ujkx2040L
	yeecliaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSHF-00000009Z95-2QYK;
	Thu, 12 Nov 2026 10:43:33 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSHA-00000009Z6J-19CT
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 10:43:31 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so7557081eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 02:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794480207; x=1795085007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tKHbJSnTS/xgwwH8xY3FZeNU74t03Ua9SzHRVgCuNfk=;
        b=ac4Ki1lMU9nvDfbAaJBBzq33MXGd2IPhuHLFR0MWN1TdABF9NPYP3SEpMoSIbj368/
         Eip41oeOqY38GuG0I+m4cLHodS+igfQ4bucFWwpWb8ctqsDRzbLSubSMeRp9OzjUKKON
         2U3O5fqOl0JRGb/xhfAepYjNkMM0qYfYBIbqpl5J2RkJXe1zfavRoAdUGYM3tsSnCe/2
         a1x8FsHfCaM3RXrsCuVInBJZqz6aNLiDb29Ajaqj3UejJIVn7x2ld7WL6BSncJKT983X
         p6S3TvoUHdtWRYSl9TqMFOPj/5d/gUtMSrQQcjUemRb0rtE3IKKYj5HUVxC9A7Fd+VbI
         Nfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480207; x=1795085007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tKHbJSnTS/xgwwH8xY3FZeNU74t03Ua9SzHRVgCuNfk=;
        b=n7BFr4OHyCZxhn4hLDHBmAeNAvCYhdxXEuxV2sjot+D8uBy/rjRn7754iM1wU+R9l2
         m9toICHPiGXLFn6fUSsDes/qlEEvcwo0Npt4oic9AG7XpamTE5MXnoxw8Ha+8utkuCj2
         HbXig7KzH/yLP1zlUTccyazYLIYoDd8H+CqEk75NR158x0enmrG8zBUM3I1RtfZSdYiM
         Sz5Sx6LoNwjLkfhO2jqHmJ8LJAR3L2RoFsyEeBrtwXqriWssgCLtNbqDldqx2FAbvJcX
         Feu6TzPZE2qWS6Tn5Wg9m8JmQ6M99VP+TaqW5FgMSn20lgMdPVOJb5fEjS6LNLZRtcTu
         J3Ig==
X-Forwarded-Encrypted: i=1; AL+hErFvU/JTydwFwox9xtFiaBXyvAnNLc+1LGnpxSzEIktPV1Jv/UXnVGqMolW3d1WpouzhRSxkh2voR7J4AA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+IhpkWwO39YMNGMk7SJlFLneNcPWFu9ZyuALDO+wh5T6AUa9jK
	hByMX5qvW0jnIfCkDgXgjNnxP524WH8WYWuL51FlsR6OjxPeAzDO1QdlEVsDK/10CbU=
X-Gm-Gg: AYBFou2Cu3QDRaQDX++0c2krjw8lSA13y6f/OpHdlm+n0t+QJpvykzaIZmWwfbsBfPp
	MnI4PJfigzUPkIVnkyOMh1xqwbSEOXYxxLsRQ2ao+QxwnTirAojLv2zS3AL5OJKphUf/9q+PezG
	IqvITkTnRaI7GAzYm40Mv+FOMn60aUPyOZqbQlKiQByIZHO9Ao/RURMukbq2hHHuhXoeO8cktIf
	H0I0bEblU3r/3dz8XCJEavKeYyMLCEbKOEvjZwdmUxqgzlCIyBZVcu92gkuixta2G95lpultnrT
	xc1WwfWJcrgEB5hMiRJSM9PUaCW8H143LiBi78/8/lYKGIHBXO8lOHNmFAKXbuV6varkeotoNFS
	i7tMG1gK4ow8Zs2RDOLHf+1QE28RD4E9eGt/QgbB56xrJ2P7l06bM2dC43i3jU693Y1X9crWH3T
	WhoFTIhdkRQlXXcYM8unEiki42m+Xyb5yPMurIl+S9XeJlIc6CX7negbrzxQ0e8j4GMAQGl5wkx
	ziw3UnnhIiXQPQ9f9AVHA7/6TcpnyCcCXzXdHctrS+XiaIMoCHdFjgW65igFz/25O2/ic/G+nIQ
	HP/cVdfMFaTJah6Psrzv8tUNv3+2STGC494U1coUFlYQa8UIOggTn8Kjx7b5Vp3Uk94=
X-Received: by 2002:a05:7300:bf9c:b0:36e:1fbe:3571 with SMTP id 5a478bee46e88-3768366a461mr5368073eec.3.1794480207004;
        Thu, 12 Nov 2026 02:43:27 -0800 (PST)
Received: from FR9WL0RHKY.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm13228694eec.2.2026.11.12.02.43.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 02:43:26 -0800 (PST)
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
Subject: [PATCH v10 3/9] riscv: implement preemptible this_cpu read and write operations
Date: Thu, 12 Nov 2026 18:41:43 +0800
Message-Id: <20261112104149.38589-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261112104149.38589-1-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_024328_325984_9F714CE6 
X-CRM114-Status: UNSURE (   8.99  )
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

Apply the recoverable per-CPU address handling to read and write
operations.

Keep the address calculation and memory access in the same inline assembly
block, and use naturally sized loads and stores while preserving the type
semantics of the generic percpu API.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 85 +++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
index 59f7d44f7d3fe..ae7c123a48093 100644
--- a/arch/riscv/include/asm/percpu.h
+++ b/arch/riscv/include/asm/percpu.h
@@ -4,6 +4,7 @@
 #define __ASM_PERCPU_H
 
 #include <linux/bits.h>
+#include <linux/compiler.h>
 #include <linux/stringify.h>
 #include <linux/thread_info.h>
 
@@ -52,6 +53,90 @@
 #define __PCPU_GPRS_END							\
 	"sh zero, %[gprs]\n"
 
+#define __PCPU_OP_CONTEXT()						\
+	struct thread_info *__ti = (struct thread_info *)current;	\
+	unsigned long __off, __addr
+
+#define PERCPU_RW_OPS(load, store, sz)					\
+static __always_inline unsigned long					\
+__percpu_read_##sz(const void __percpu *pcp)				\
+{									\
+	__PCPU_OP_CONTEXT();						\
+	unsigned long val;						\
+									\
+	asm volatile (__PCPU_GPRS_BEGIN					\
+		load " %[val], 0(%[addr])\n"				\
+		__PCPU_GPRS_END						\
+		: [gprs] "=m" (__ti->pcpu_gprs),			\
+		  [off] "=&r" (__off), [addr] "=&r" (__addr),		\
+		  [val] "=&r" (val)					\
+		: [pcpu_offset] "m" (__ti->pcpu_offset),		\
+		  [pcp] "r" (pcp)					\
+		: "memory");						\
+									\
+	return (u##sz)val;						\
+}									\
+									\
+static __always_inline void __percpu_write_##sz(void __percpu *pcp,	\
+				       unsigned long val)		\
+{									\
+	__PCPU_OP_CONTEXT();						\
+									\
+	asm volatile (__PCPU_GPRS_BEGIN					\
+		store " %[val], 0(%[addr])\n"				\
+		__PCPU_GPRS_END						\
+		: [gprs] "=m" (__ti->pcpu_gprs),			\
+		  [off] "=&r" (__off), [addr] "=&r" (__addr)		\
+		: [pcpu_offset] "m" (__ti->pcpu_offset),		\
+		  [pcp] "r" (pcp), [val] "r" ((u##sz)val)		\
+		: "memory");						\
+}
+
+PERCPU_RW_OPS("lbu", "sb", 8)
+PERCPU_RW_OPS("lhu", "sh", 16)
+
+#ifdef CONFIG_64BIT
+PERCPU_RW_OPS("lwu", "sw", 32)
+PERCPU_RW_OPS("ld", "sd", 64)
+#else
+PERCPU_RW_OPS("lw", "sw", 32)
+#endif
+
+#define _pcp_wrap(op, pcp, ...)						\
+({									\
+	op(&(pcp), __VA_ARGS__);					\
+})
+
+#define _pcp_wrap_return(op, pcp, args...)				\
+({									\
+	__auto_type __pcp_ptr = &(pcp);					\
+									\
+	(TYPEOF_UNQUAL(*__pcp_ptr))op(__pcp_ptr, ##args);		\
+})
+
+#define this_cpu_read_1(pcp)	_pcp_wrap_return(__percpu_read_8, pcp)
+#define this_cpu_read_2(pcp)	_pcp_wrap_return(__percpu_read_16, pcp)
+#define this_cpu_read_4(pcp)	_pcp_wrap_return(__percpu_read_32, pcp)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_read_8(pcp)	_pcp_wrap_return(__percpu_read_64, pcp)
+#endif
+
+#define this_cpu_write_1(pcp, val)					\
+	_pcp_wrap(__percpu_write_8, pcp, (unsigned long)(val))
+#define this_cpu_write_2(pcp, val)					\
+	_pcp_wrap(__percpu_write_16, pcp, (unsigned long)(val))
+#define this_cpu_write_4(pcp, val)					\
+	_pcp_wrap(__percpu_write_32, pcp, (unsigned long)(val))
+
+#ifdef CONFIG_64BIT
+#define this_cpu_write_8(pcp, val)					\
+	_pcp_wrap(__percpu_write_64, pcp, (unsigned long)(val))
+#endif
+
+#undef PERCPU_RW_OPS
+#undef __PCPU_OP_CONTEXT
+
 #include <asm-generic/percpu.h>
 
 #endif /* __ASM_PERCPU_H */
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
