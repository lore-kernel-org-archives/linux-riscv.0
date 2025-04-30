Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9E9C3ABA5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 02:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eDpo+AW2DNX3C+KMj0i1v65JR0ivfKNY0+1uV+ceU/A=; b=ivDuhDzj3lRTFL3d686jaeZyYd
	yneutJSWG5i5BQFufUkaZRHOjAmUek6qGLBYg/9Oz7vYHpi0wr+CkY8gliFYEZk8aPzH5/C6o3Ho3
	ZugppPccre3u/5BYa1FVsO5nOFTzpkXGtIyWJGCznkuca66dC1PtLeCBhnqOBELMxnnboceKDPMjm
	rEkzZm6A9Vo8FWdBDsetgZuE9526+Ys+zJDaJE5YZfvTkHbMmQKJbMtY1RNiUhE0cdNhZjn7GfeO9
	rMjJhB77X4FE20Jbpv5s0ZRcaStk5fBzHwWqw+7L2g/WZahDn0Bhl5OSOxyJ8wUpHQOU8T89D6EqE
	EnPbh5aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wlG-0000000BTop-0rii;
	Wed, 30 Apr 2025 02:01:22 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vfd-0000000BNrM-1pTO
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:51:30 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso3661173a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745974288; x=1746579088; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lW6OBXNllfj3ZgFG187xRr8MMSm7FGa21hGGlk/yqT0=;
        b=LWqyIdCmX+QjwRD9aHTkhX4+K8pzTp+m6N8vGPdBSYz6eLtEjPkBeYBAOlf8TZGfwr
         OKsugozZErV8Xy7RNRrnyMjafSmZ1t37j7KZQ2TJz694yIlOkTFnSYUOjTCCckMHf1iq
         bfQb3DPREYmKfAwzwLuj5VCa9EowdXar0n/yV3XvETLCsucZ0WbKeI2yb+45mpiLKnTc
         E0vCzIszCCtrNbJ31PJtOewCARuevJ0XEdOwIbZMCv7lYbG7LuZW0Ku2L3zOb94lmQYe
         dHse5TW/It/WtqfZGuFtPl2V/sznUZ6sFoF2Q+3Yl6ELQ4U4PqDzluM96x2GO+Tr6ttt
         o0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745974288; x=1746579088;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lW6OBXNllfj3ZgFG187xRr8MMSm7FGa21hGGlk/yqT0=;
        b=aoKORM+ozwgzai7vy/uEOjd3YJC5qTF8y9Zxbfd08YHzRrh3GR3NSphe+oS57NsAVq
         ENwqxEcMOJC/25j19kQnO0l2SrmuvrwtjACCwXdKiR0XG6q+0QpQWKHVEozyq4kPYXWJ
         qug1U2KdjmzBQdMVbAvt8uds+vbzbQHFOhAQObeafVyP7VpNUjeQPEuwF8XJRIu2Ggr0
         iiPltNH/MlGq+PnsMHEr5RSUqo3ItsWCy1vFOm43gFvXaCH+fVXApdaXO/asYQuEa4Bc
         EywzD/siiK0QOtASjp8QlyRmABLlGsIO8yucEphwOmasXY+pOLOn1JFWXbCEFBA1766g
         LPzA==
X-Forwarded-Encrypted: i=1; AJvYcCXG6Ph5+Ro1LLnC6mE0ZQdqgWvSRUviUwyDadJ3hAcuABDrIjCY9kPzWS/KavhJ/tnicnaUdtGSKmXm9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YweVVb4lhrajpgafe3Y/VWIxM2G6/pMC4oziJ4aoX7GrlhsxCmw
	rXj1OBPbc+2LnNKM+tlgF3O7c1eMzx5tMVsD2tuqFtF9POVSD0vEZFt96OodU4mGC5ghM1Fxiu+
	19Qgu+pyirA==
X-Google-Smtp-Source: AGHT+IFQAwpd1H++VldpouxlnX2ftKTRxKtEh+rGvToXlSu32ujpldy9pEubIFXh40BcFojVA7YUFEXUSDoFvA==
X-Received: from pfbbk10.prod.google.com ([2002:aa7:830a:0:b0:739:9e9:feea])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3a89:b0:1f5:619a:8f73 with SMTP id adf61e73a8af0-20aa41839aemr904642637.26.1745974288270;
 Tue, 29 Apr 2025 17:51:28 -0700 (PDT)
Date: Wed, 30 Apr 2025 00:51:21 +0000
In-Reply-To: <cover.1745970908.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1745970908.git.yepeilin@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <9bab433f2b7e48519b26c1b8f2004635f6c179d2.1745970908.git.yepeilin@google.com>
Subject: [PATCH bpf-next 7/8] selftests/bpf: Verify zero-extension behavior in
 load-acquire tests
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org
Cc: Peilin Ye <yepeilin@google.com>, linux-riscv@lists.infradead.org, 
	Andrea Parri <parri.andrea@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mykola Lysenko <mykolal@fb.com>, 
	Shuah Khan <shuah@kernel.org>, Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, 
	Neel Natu <neelnatu@google.com>, Benjamin Segall <bsegall@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_175129_471693_F57EABA2 
X-CRM114-Status: UNSURE (   9.05  )
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

Verify that 8-, 16- and 32-bit load-acquires are zero-extending by using
immediate values with their highest bit set.  Do the same for the 64-bit
variant to keep the style consistent.

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 tools/testing/selftests/bpf/progs/verifier_load_acquire.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_load_acquire.c b/tools/testing/selftests/bpf/progs/verifier_load_acquire.c
index a696ab84bfd6..74f4f19c10b8 100644
--- a/tools/testing/selftests/bpf/progs/verifier_load_acquire.c
+++ b/tools/testing/selftests/bpf/progs/verifier_load_acquire.c
@@ -15,7 +15,7 @@ __naked void load_acquire_8(void)
 {
 	asm volatile (
 	"r0 = 0;"
-	"w1 = 0x12;"
+	"w1 = 0xfe;"
 	"*(u8 *)(r10 - 1) = w1;"
 	".8byte %[load_acquire_insn];" // w2 = load_acquire((u8 *)(r10 - 1));
 	"if r2 == r1 goto 1f;"
@@ -35,7 +35,7 @@ __naked void load_acquire_16(void)
 {
 	asm volatile (
 	"r0 = 0;"
-	"w1 = 0x1234;"
+	"w1 = 0xfedc;"
 	"*(u16 *)(r10 - 2) = w1;"
 	".8byte %[load_acquire_insn];" // w2 = load_acquire((u16 *)(r10 - 2));
 	"if r2 == r1 goto 1f;"
@@ -55,7 +55,7 @@ __naked void load_acquire_32(void)
 {
 	asm volatile (
 	"r0 = 0;"
-	"w1 = 0x12345678;"
+	"w1 = 0xfedcba09;"
 	"*(u32 *)(r10 - 4) = w1;"
 	".8byte %[load_acquire_insn];" // w2 = load_acquire((u32 *)(r10 - 4));
 	"if r2 == r1 goto 1f;"
@@ -75,7 +75,7 @@ __naked void load_acquire_64(void)
 {
 	asm volatile (
 	"r0 = 0;"
-	"r1 = 0x1234567890abcdef ll;"
+	"r1 = 0xfedcba0987654321 ll;"
 	"*(u64 *)(r10 - 8) = r1;"
 	".8byte %[load_acquire_insn];" // r2 = load_acquire((u64 *)(r10 - 8));
 	"if r2 == r1 goto 1f;"
-- 
2.49.0.901.g37484f566f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
