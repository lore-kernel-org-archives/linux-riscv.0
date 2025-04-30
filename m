Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C25FC3ABA5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 02:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dR/CHDiyqi9MyktRdyGnsbUqNWd7AS+7PqsgwRVs6WE=; b=ycwkVac4rxlSvM8/xaIw5mmm1Q
	Taw4P6nRRJSdifH70kBa1Ki/UDvGx8uLkYochACdfCdWGw3bJ+V7CcsS+9MskWVe3TSfazGFz7E0/
	ygoY9oSPUxecbhJ/rcK7hp3BOqJrYDcD84yaQeN6KeMTn2i4XErz4UKQT3aRtKC2YYZDce3vnpOCZ
	CxJyRsxI5H5VKYCS82rWafPJQP3Q3t6WFqf6B5gogGQPNI5BBj3T5qxvyaGqFcSF/Piru3gW+FzNX
	4xb2TSwACqvSZ1CFcByTn0nQSEH5KlSs/Xf+WPRSyaYH3kYeghRYNzijUEYhjVOLuhK4tj2fCb94H
	GGd50y1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wlF-0000000BToI-2a62;
	Wed, 30 Apr 2025 02:01:21 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vfS-0000000BNmd-1gs3
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:51:19 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22406ee0243so45014995ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745974277; x=1746579077; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xxJ5TtWLxgaoejFEHtcTPy0MdITFEK7aLosZ4mTRA+Y=;
        b=a9P6jTHdkKKgst9KXt9KfppAi45sFviRadBKkKjv1MUnwDa9Ay3IIffVMZjQ3G/SlM
         WjKfLjeILXmJYNEhDDNFE/c70fyC4pbAUp4os6slWp7WMt6Ur084DKf3osJ+HWurxXyY
         R8FgFy++7crx4Zcy3vG/jM/hHLIZcGmFGPWzUg7eHXh5j+2oWovT2weGvXCOA426KH/t
         yMrDYCSA8m1fDgOh/VisE0Z7TduC1Zmc45qf6GgpZd8WN90k5n2ek+tWi3YgGjwrvc2c
         5MOjh5UXglcXIE7h6tqy+uSZaCdfHL6edpLnSKlXGA5otgrGdDmPPF6+ks5OHxs1vEhr
         RCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745974277; x=1746579077;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xxJ5TtWLxgaoejFEHtcTPy0MdITFEK7aLosZ4mTRA+Y=;
        b=cg0+gJGTwYL9+FXEiYE7JffMYTkDMdIZqiu8HHgJ01GcjhAKYcqRoILqrCYcdXzvib
         EYxUtcTGnkYZ/CHTd0D/zZZtkbhJnglhzXhD7zaZ/99QGkyI2qFvLNq2SUy+qbd5UMqu
         wH9EzGCOuP/qiTpG40nNCdNNyloG+LQgYHQ8NFXgkU/MBGZy8SNgpazF2f3bQlA4Nmtr
         06pSnXvH3gwHtdKSfARrUtROX8Fn00rFQoXWvRkW0OFllascOlBbI8edIccXF0FqHVTn
         MZsgWE8Rxdge9WqZez97X9jCoTPEmQGJubbBVhwlc4Vw8rvOfg1BUxPK/DDHO57/R1Np
         Kk0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZAB1N5WzVZqXrBRmnBnQt7DfOeKzzKP2yNDODCuoEXEbBZqyLlEpf7SfqAkS/TUBEwc1yGjMC39JNag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7ckuE2iBiMN82tXHaiO/LdGv9QZMLbm87NHxQ+dLzfjguZalt
	4GISNqxcXQfQQSHBeR2Zm3lJssbvHzDBvZfCqahx4Pd/cwA0QH4EfvGqVFv7OhhvEl7nMqEZPCz
	w/g4JrP6hrQ==
X-Google-Smtp-Source: AGHT+IHFrghFeywSToDMfnV9sUQmryXM1veAHDARm5dT8I66D5TH9gpdsDeH+gy0UCH4r7Avq9x9SYzQtJdfIA==
X-Received: from pgcj4.prod.google.com ([2002:a05:6a02:5004:b0:af5:6108:71bc])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f301:b0:224:2717:7992 with SMTP id d9443c01a7336-22df5839ed8mr7240245ad.33.1745974277081;
 Tue, 29 Apr 2025 17:51:17 -0700 (PDT)
Date: Wed, 30 Apr 2025 00:51:10 +0000
In-Reply-To: <cover.1745970908.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1745970908.git.yepeilin@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <5f7e4c5ac5d254c0f42b4ba274437262e238a5cb.1745970908.git.yepeilin@google.com>
Subject: [PATCH bpf-next 6/8] selftests/bpf: Avoid passing out-of-range values
 to __retval()
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
X-CRM114-CacheID: sfid-20250429_175118_442357_F6B81F03 
X-CRM114-Status: UNSURE (   9.13  )
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

Currently, we pass 0x1234567890abcdef to __retval() for the following
two tests:

  verifier_load_acquire/load_acquire_64
  verifier_store_release/store_release_64

However, the upper 32 bits of that value are being ignored, since
__retval() expects an int.  Actually, the tests would still pass even if
I change '__retval(0x1234567890abcdef)' to e.g. '__retval(0x90abcdef)'.

Restructure the tests a bit to test the entire 64-bit values properly.
Do the same to their 8-, 16- and 32-bit variants as well to keep the
style consistent.

Fixes: ff3afe5da998 ("selftests/bpf: Add selftests for load-acquire and store-release instructions")
Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 .../bpf/progs/verifier_load_acquire.c         | 40 +++++++++++++------
 .../bpf/progs/verifier_store_release.c        | 32 +++++++++++----
 2 files changed, 52 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/verifier_load_acquire.c b/tools/testing/selftests/bpf/progs/verifier_load_acquire.c
index 77698d5a19e4..a696ab84bfd6 100644
--- a/tools/testing/selftests/bpf/progs/verifier_load_acquire.c
+++ b/tools/testing/selftests/bpf/progs/verifier_load_acquire.c
@@ -10,65 +10,81 @@
 
 SEC("socket")
 __description("load-acquire, 8-bit")
-__success __success_unpriv __retval(0x12)
+__success __success_unpriv __retval(0)
 __naked void load_acquire_8(void)
 {
 	asm volatile (
+	"r0 = 0;"
 	"w1 = 0x12;"
 	"*(u8 *)(r10 - 1) = w1;"
-	".8byte %[load_acquire_insn];" // w0 = load_acquire((u8 *)(r10 - 1));
+	".8byte %[load_acquire_insn];" // w2 = load_acquire((u8 *)(r10 - 1));
+	"if r2 == r1 goto 1f;"
+	"r0 = 1;"
+"1:"
 	"exit;"
 	:
 	: __imm_insn(load_acquire_insn,
-		     BPF_ATOMIC_OP(BPF_B, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_10, -1))
+		     BPF_ATOMIC_OP(BPF_B, BPF_LOAD_ACQ, BPF_REG_2, BPF_REG_10, -1))
 	: __clobber_all);
 }
 
 SEC("socket")
 __description("load-acquire, 16-bit")
-__success __success_unpriv __retval(0x1234)
+__success __success_unpriv __retval(0)
 __naked void load_acquire_16(void)
 {
 	asm volatile (
+	"r0 = 0;"
 	"w1 = 0x1234;"
 	"*(u16 *)(r10 - 2) = w1;"
-	".8byte %[load_acquire_insn];" // w0 = load_acquire((u16 *)(r10 - 2));
+	".8byte %[load_acquire_insn];" // w2 = load_acquire((u16 *)(r10 - 2));
+	"if r2 == r1 goto 1f;"
+	"r0 = 1;"
+"1:"
 	"exit;"
 	:
 	: __imm_insn(load_acquire_insn,
-		     BPF_ATOMIC_OP(BPF_H, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_10, -2))
+		     BPF_ATOMIC_OP(BPF_H, BPF_LOAD_ACQ, BPF_REG_2, BPF_REG_10, -2))
 	: __clobber_all);
 }
 
 SEC("socket")
 __description("load-acquire, 32-bit")
-__success __success_unpriv __retval(0x12345678)
+__success __success_unpriv __retval(0)
 __naked void load_acquire_32(void)
 {
 	asm volatile (
+	"r0 = 0;"
 	"w1 = 0x12345678;"
 	"*(u32 *)(r10 - 4) = w1;"
-	".8byte %[load_acquire_insn];" // w0 = load_acquire((u32 *)(r10 - 4));
+	".8byte %[load_acquire_insn];" // w2 = load_acquire((u32 *)(r10 - 4));
+	"if r2 == r1 goto 1f;"
+	"r0 = 1;"
+"1:"
 	"exit;"
 	:
 	: __imm_insn(load_acquire_insn,
-		     BPF_ATOMIC_OP(BPF_W, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_10, -4))
+		     BPF_ATOMIC_OP(BPF_W, BPF_LOAD_ACQ, BPF_REG_2, BPF_REG_10, -4))
 	: __clobber_all);
 }
 
 SEC("socket")
 __description("load-acquire, 64-bit")
-__success __success_unpriv __retval(0x1234567890abcdef)
+__success __success_unpriv __retval(0)
 __naked void load_acquire_64(void)
 {
 	asm volatile (
+	"r0 = 0;"
 	"r1 = 0x1234567890abcdef ll;"
 	"*(u64 *)(r10 - 8) = r1;"
-	".8byte %[load_acquire_insn];" // r0 = load_acquire((u64 *)(r10 - 8));
+	".8byte %[load_acquire_insn];" // r2 = load_acquire((u64 *)(r10 - 8));
+	"if r2 == r1 goto 1f;"
+	"r0 = 1;"
+"1:"
 	"exit;"
 	:
 	: __imm_insn(load_acquire_insn,
-		     BPF_ATOMIC_OP(BPF_DW, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_10, -8))
+		     BPF_ATOMIC_OP(BPF_DW, BPF_LOAD_ACQ, BPF_REG_2, BPF_REG_10, -8))
 	: __clobber_all);
 }
 
diff --git a/tools/testing/selftests/bpf/progs/verifier_store_release.c b/tools/testing/selftests/bpf/progs/verifier_store_release.c
index 7e456e2861b4..72f1eb006074 100644
--- a/tools/testing/selftests/bpf/progs/verifier_store_release.c
+++ b/tools/testing/selftests/bpf/progs/verifier_store_release.c
@@ -10,13 +10,17 @@
 
 SEC("socket")
 __description("store-release, 8-bit")
-__success __success_unpriv __retval(0x12)
+__success __success_unpriv __retval(0)
 __naked void store_release_8(void)
 {
 	asm volatile (
+	"r0 = 0;"
 	"w1 = 0x12;"
 	".8byte %[store_release_insn];" // store_release((u8 *)(r10 - 1), w1);
-	"w0 = *(u8 *)(r10 - 1);"
+	"w2 = *(u8 *)(r10 - 1);"
+	"if r2 == r1 goto 1f;"
+	"r0 = 1;"
+"1:"
 	"exit;"
 	:
 	: __imm_insn(store_release_insn,
@@ -26,13 +30,17 @@ __naked void store_release_8(void)
 
 SEC("socket")
 __description("store-release, 16-bit")
-__success __success_unpriv __retval(0x1234)
+__success __success_unpriv __retval(0)
 __naked void store_release_16(void)
 {
 	asm volatile (
+	"r0 = 0;"
 	"w1 = 0x1234;"
 	".8byte %[store_release_insn];" // store_release((u16 *)(r10 - 2), w1);
-	"w0 = *(u16 *)(r10 - 2);"
+	"w2 = *(u16 *)(r10 - 2);"
+	"if r2 == r1 goto 1f;"
+	"r0 = 1;"
+"1:"
 	"exit;"
 	:
 	: __imm_insn(store_release_insn,
@@ -42,13 +50,17 @@ __naked void store_release_16(void)
 
 SEC("socket")
 __description("store-release, 32-bit")
-__success __success_unpriv __retval(0x12345678)
+__success __success_unpriv __retval(0)
 __naked void store_release_32(void)
 {
 	asm volatile (
+	"r0 = 0;"
 	"w1 = 0x12345678;"
 	".8byte %[store_release_insn];" // store_release((u32 *)(r10 - 4), w1);
-	"w0 = *(u32 *)(r10 - 4);"
+	"w2 = *(u32 *)(r10 - 4);"
+	"if r2 == r1 goto 1f;"
+	"r0 = 1;"
+"1:"
 	"exit;"
 	:
 	: __imm_insn(store_release_insn,
@@ -58,13 +70,17 @@ __naked void store_release_32(void)
 
 SEC("socket")
 __description("store-release, 64-bit")
-__success __success_unpriv __retval(0x1234567890abcdef)
+__success __success_unpriv __retval(0)
 __naked void store_release_64(void)
 {
 	asm volatile (
+	"r0 = 0;"
 	"r1 = 0x1234567890abcdef ll;"
 	".8byte %[store_release_insn];" // store_release((u64 *)(r10 - 8), r1);
-	"r0 = *(u64 *)(r10 - 8);"
+	"r2 = *(u64 *)(r10 - 8);"
+	"if r2 == r1 goto 1f;"
+	"r0 = 1;"
+"1:"
 	"exit;"
 	:
 	: __imm_insn(store_release_insn,
-- 
2.49.0.901.g37484f566f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
