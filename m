Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B95C369D7
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 16:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NTWVsv35IRjQtBGpkPGRQWBq0oa6PzocPvTkx/3MZ8=; b=eOiFCaQF03me9s
	VDgH6v68ryiaJWEQ2bgcuOLkb3/msDLNxAscZQLenTr5KC+C3SSqND1nHOY20kb37f5E93YLSipBM
	DIL0g7NPXDXxBbtBdFXUfFhgQc3Gvg1q7PTkBORxa6GaCN79WqxD/OYYZn8I8o3eGpXJmAjD8nPv+
	/LPmowXDHZM7oEeEQGrEm8WnaCjfrO8kVMOOBWqGWv1z/JuUkA6UR8YcC7HC4Mq0VfULPh/fKVvSR
	tVP62foCGgatcqlPsCgTPSefHhfG7GtNP8BJeNDhA5t+DrSH0+IGGUjZQRrPga3QCKq3yoBmGfy6U
	wxJTB10tFc+JudrC3ztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uG5-00000004kaZ-2dmG;
	Mon, 21 Apr 2025 16:44:37 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6uEM-00000004jr1-3vFx;
	Mon, 21 Apr 2025 16:42:52 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4774ce422easo46287861cf.1;
        Mon, 21 Apr 2025 09:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253770; x=1745858570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2VlZJudXEGF9wwtFZHglR/nFrBqPJ1rxXkCL1SoJv3Q=;
        b=aG5o8IHFyo0J3krw6utcbv4Xl7g924iwme5ydVnogjBI7NqSk2+3+OIoScEyvsdmJA
         lexSD4O7B9AoDznzyNWCg5Y0wAU398Qmz1Z4UQBcT/iNKvB1UlHszNS8sHTuUd3ggD0e
         Va2HJsUFP4wfchFkSykikq4Sg0qxsHD0nbCgs3L2KEb5DLX4az2BXrIz6DbPJQw6kdKn
         K3aG+pvXd5nTJUlzLs7pKayClmGJZwO9RPfI7BmOI7ajQ99W1DRSjDh1H6zVoaeCFOXT
         +fT8nB+0KRQ6ZtiBFH4bIJNpGWNGQeTa8yR2gk3v9QIbgy9hyNq2BmHF0Cfvmk+hbTlV
         ZbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253770; x=1745858570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2VlZJudXEGF9wwtFZHglR/nFrBqPJ1rxXkCL1SoJv3Q=;
        b=AY96huNj0ss3+SvPD9HvuVtQ+FkVwL0o7kyXF71q/goRb1pb8tduVkmy0WNTgJz1ZB
         Br4duPlXu7sfROlRU6buxkOr7jn0CY5lsg51VNHgoUWk+aKoxgnfHJZITcyen1JodapN
         bhqNu3RpBndeZ8iprM8dhZcS4IQN8cmkq2ak8SmgDifRwOTDj8ku611sJCazgPUGMJtP
         NwBBPCFUCTZ6iGoFmjNAG3n6UcVB/Szksgdh6RY1nEKMUr7S1xJddyxkOCHKXCT4JrsU
         8idro68KQTIeaGBCDWWCCP4zrTJso0b9turJYAVJg5F3s3he7YAyRtPodBNyhM1zpgC1
         mDXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi8tUewhL90Efj8AYeOwqbQkfMULUfMvvo1UQ/qKAjLGi8bPik5Inwn0Q+1LuKB/x+zCPkutDaYh0IetM=@lists.infradead.org, AJvYcCXOpsbq2wtnj9ZMtnTSG8vrnQGi+FaWCv9+6HChGB5z5BbMqFEYImQsXaTx3zhPf3WA93q+wp+Sv95iBNdfCWgW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz5IzRERcfb2LEhitSqFpapdIqEABnUisrY20IXgzLRFwwSTEN
	SXzs9Wx8ELvw9yUXsnVDwgMMBuLYE/Ut5EVuE2bvTuFvuIcISTuN
X-Gm-Gg: ASbGncsq+V4g52L/f7cmIlqvQxIDKovz+hMgQ0iWVB/qrJnNEFMj/3FT6h3LkZ7aEMD
	0vY8YkOqAjvnhL2UC3mRR42OQeks5oTgVKJQAowjhBFVXwVv+M24wTKZQdu4NdE82gvr3WhLp48
	Zjs9BtP+e5ctsVUadYVcREM1AUUHnxlR8bn7iCjxM3h3Fs/JQM4zpNJ+cOfUpbCSMdo+0lVEpdE
	RXL7ag+iVMNOU3gjuXbnSlUBeAzV4VOLZHshcmgyBMV0umJ4dGL294JUrW+PSIDYLdD2dQtPf1m
	IuqzHmvdI+9en4zMr2usXWXFKI1NwW+ZhjGmJjYZt1ge5g0hifNauCG4QS3QdmrCbbfbRnbct7v
	JN659UNwIPMkA1hEzm51WIv3Zei1ko7U=
X-Google-Smtp-Source: AGHT+IEN/+2ucAXXUnW1f6rXrX/g7EkvZqGoWwgIAIA5mzDQJuNmlBEYdiMbCJulRTpViKP4snNoaQ==
X-Received: by 2002:ac8:5711:0:b0:476:b82b:ac91 with SMTP id d75a77b69052e-47aec4dc98emr253937731cf.49.1745253770012;
        Mon, 21 Apr 2025 09:42:50 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16df4sm43990201cf.1.2025.04.21.09.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:49 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id AEE4D1200043;
	Mon, 21 Apr 2025 12:42:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 21 Apr 2025 12:42:48 -0400
X-ME-Sender: <xms:iHUGaBQnaONjosg5BDTHdCb0t-ZWZ9nb0UA8PHXnLKz9UTD_z5LjuA>
    <xme:iHUGaKy32gwgj8hME1pMpz2wTPtsxmEQbC_nRAiSKsaxQaZW_VvrwBT7CVSyCT2wK
    QsvFTiGK-l439PSwQ>
X-ME-Received: <xmr:iHUGaG0UFWxSEmP1-S2dqwFZd5zojqz3UvQpA0IzaaxuRAXkvV-7ClsYpNq7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefg
    veffieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedvnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepheeipdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpd
    hrtghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohep
    ohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorh
    esghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdr
    tghomh
X-ME-Proxy: <xmx:iHUGaJAMs5SEPj35XBlo70J-L1Of3KmNt9i3ZvHXyL9LoiqCbHxjBA>
    <xmx:iHUGaKh9id5rZfAP_HKxKnUE5WxA_3DauTyTBRjWKO9ry0NeMaLIEA>
    <xmx:iHUGaNoMNk_KnkBIvxrSmFuI13NXyukOVKesqLapWL_CD-TCJvoTTg>
    <xmx:iHUGaFjmJKGFPyCxn--MUnUHvEECVYYlKMiyG_SSEFMhsCmzom-8Ww>
    <xmx:iHUGaFTweXWFn1pbi8JDL6KVeJ5CQ1FQgfsm5Adm1_VW3TLWgk85kHNG>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:47 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev,
	lkmm@lists.linux.dev
Cc: Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nicholas Piggin <npiggin@gmail.com>,	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,	kent.overstreet@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,	elver@google.com,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	torvalds@linux-foundation.org,
	linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org,
	Trevor Gross <tmgross@umich.edu>,	dakr@redhat.com,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Subject: [RFC v3 11/12] rust: sync: Add memory barriers
Date: Mon, 21 Apr 2025 09:42:20 -0700
Message-ID: <20250421164221.1121805-12-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250421164221.1121805-1-boqun.feng@gmail.com>
References: <20250421164221.1121805-1-boqun.feng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_094250_975561_DDA905C8 
X-CRM114-Status: GOOD (  21.13  )
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

Memory barriers are building blocks for concurrent code, hence provide
a minimal set of them.

The compiler barrier, barrier(), is implemented in inline asm instead of
using core::sync::atomic::compiler_fence() because memory models are
different: kernel's atomics are implemented in inline asm therefore the
compiler barrier should be implemented in inline asm as well.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/helpers/barrier.c      | 18 ++++++++++
 rust/helpers/helpers.c      |  1 +
 rust/kernel/sync.rs         |  1 +
 rust/kernel/sync/barrier.rs | 67 +++++++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+)
 create mode 100644 rust/helpers/barrier.c
 create mode 100644 rust/kernel/sync/barrier.rs

diff --git a/rust/helpers/barrier.c b/rust/helpers/barrier.c
new file mode 100644
index 000000000000..cdf28ce8e511
--- /dev/null
+++ b/rust/helpers/barrier.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <asm/barrier.h>
+
+void rust_helper_smp_mb(void)
+{
+	smp_mb();
+}
+
+void rust_helper_smp_wmb(void)
+{
+	smp_wmb();
+}
+
+void rust_helper_smp_rmb(void)
+{
+	smp_rmb();
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index b20ee7cef74d..1183150ebdc6 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -8,6 +8,7 @@
  */
 
 #include "atomic.c"
+#include "barrier.c"
 #include "blk.c"
 #include "bug.c"
 #include "build_assert.c"
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index b620027e0641..c7c0e552bafe 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -11,6 +11,7 @@
 
 mod arc;
 pub mod atomic;
+pub mod barrier;
 mod condvar;
 pub mod lock;
 mod locked_by;
diff --git a/rust/kernel/sync/barrier.rs b/rust/kernel/sync/barrier.rs
new file mode 100644
index 000000000000..277aa09747bf
--- /dev/null
+++ b/rust/kernel/sync/barrier.rs
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Memory barriers.
+//!
+//! These primitives have the same semantics as their C counterparts: and the precise definitions of
+//! semantics can be found at [`LKMM`].
+//!
+//! [`LKMM`]: srctree/tools/memory-mode/
+
+/// A compiler barrier.
+///
+/// An explicic compiler barrier function that prevents the compiler from moving the memory
+/// accesses either side of it to the other side.
+pub fn barrier() {
+    // By default, Rust inline asms are treated as being able to access any memory or flags, hence
+    // it suffices as a compiler barrier.
+    //
+    // SAFETY: An empty asm block should be safe.
+    unsafe {
+        core::arch::asm!("");
+    }
+}
+
+/// A full memory barrier.
+///
+/// A barrier function that prevents both the compiler and the CPU from moving the memory accesses
+/// either side of it to the other side.
+pub fn smp_mb() {
+    if cfg!(CONFIG_SMP) {
+        // SAFETY: `smp_mb()` is safe to call.
+        unsafe {
+            bindings::smp_mb();
+        }
+    } else {
+        barrier();
+    }
+}
+
+/// A write-write memory barrier.
+///
+/// A barrier function that prevents both the compiler and the CPU from moving the memory write
+/// accesses either side of it to the other side.
+pub fn smp_wmb() {
+    if cfg!(CONFIG_SMP) {
+        // SAFETY: `smp_wmb()` is safe to call.
+        unsafe {
+            bindings::smp_wmb();
+        }
+    } else {
+        barrier();
+    }
+}
+
+/// A read-read memory barrier.
+///
+/// A barrier function that prevents both the compiler and the CPU from moving the memory read
+/// accesses either side of it to the other side.
+pub fn smp_rmb() {
+    if cfg!(CONFIG_SMP) {
+        // SAFETY: `smp_rmb()` is safe to call.
+        unsafe {
+            bindings::smp_rmb();
+        }
+    } else {
+        barrier();
+    }
+}
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
