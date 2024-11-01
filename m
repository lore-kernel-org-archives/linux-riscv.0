Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7D1E674A7
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 06:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGf5WSa0x+UreevmhbBK3/iZsPnk8J5V0ZkK6yX0mmE=; b=ix19tTsvagZH45
	5EO3X0kNaZ2uPM1oZq9p5lQ3NVMFALd2BG4ihc2fXdBm8aNxjZvIAhBYcE3xs4ZPm3PP5SDVmDUCs
	eIjWnRKOOgtnYUAxN3H4JGsjxkTsJBFFt5agyfSm3PbeWBGjxFBtQyBseL8mjTKK83a9NOyyRfxg5
	ObC5iJc6KJM5NXukTxVLXF6l0Lzr4SEepftCz2jsu92IChLrKIAszQXKjTu0X0BpItnooIXEuR9qq
	bfN9BD+YltAh9JGBXyldhFWFa3yq751cicoPnv7YRG1/QqdGCUw4B2n4WERXA/lPFsHv9EHZwvuFP
	/g+dm71C2nqBRoF/db/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6klR-00000005tdv-0jR6;
	Fri, 01 Nov 2024 06:04:05 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6klI-00000005tY1-0BXM;
	Fri, 01 Nov 2024 06:03:58 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-460c316fc37so10956181cf.0;
        Thu, 31 Oct 2024 23:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730441035; x=1731045835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zmn4qBYUZeQNSTfigZ1U+mXcshXylPzTdWvXiIW+UB4=;
        b=HLD+auKp7I2EDbSdQoNdfZU0TGyWPC/H4ratmQiYIpwwHRfPEeQwQU8Z2NM9xE0tIS
         b5xKpJx0KemIl8QVSBYR3i4FyCtZeQB0rkrbwAFpxotgUEbZTpmdS1faAT0LVGRF9e2S
         /18Nu3+eZQhdgLXtN242TKXJM4t1RqbqyxCz+tCHyGTtDhu7Po4e2pXPmqacx+TCxllp
         zf51JpesDti4EtJ34jYpKfX3VxQDFi+w8it7rWKx5vTSQI5Bdvbp8uIcohQ5ZKZOESst
         1jEo8H5Y6uFk3Ld3k+1kRclgjv9JTGBf0/Dcr6m2WUvz8HHCf2mt9+sdPeqBAse2gyNW
         3kdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730441035; x=1731045835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zmn4qBYUZeQNSTfigZ1U+mXcshXylPzTdWvXiIW+UB4=;
        b=oRS76ay30+RWF5YFxxyGVITb5+2iNyJKj/bEHVgH2CsbMz8HC+B9sCP3PNK+5MfCnO
         8tr/yBytZ/gC1s/uwQh1U9x8q9GzIGnljIPgzZdZ/qNfv8mH2Yloo2/Ni6Z1G1NISZDL
         WEf68T8eNS1qWFiAJHS2FIIOyLDFmfg7e/eSA5rBwGOG3B9+i/PVRGPa3JWtxNeC/u1M
         XQo0QkxQPdI6Q6AhZLUUArH0e48lyMTDq709BWHLo5V/JzQIyxPrczNtjDHP2Lfe50r9
         JiMZSyr+LeZdGJWAhxL3sfTj8/AV43UPUSMZm+fpKVbWby9w2VoXBt95xGHd0ilxoIkz
         IdxA==
X-Forwarded-Encrypted: i=1; AJvYcCWJmGaOFxECM8sShgUhPRqTMGuacoJ0bDSc6CKAsSTRhOj0GMWLA/S8AQW5W1bMgQpODieIIXiQFj8p8BI=@lists.infradead.org, AJvYcCX4EFDKvVsADyng4297Mq1hQKuRD71O3M634enVvyUOJQe94iLW2pQKdB7I6EqSN7ZFaZp1Ka4fGscKi5hi23T2@lists.infradead.org
X-Gm-Message-State: AOJu0YziKyuBjOm5gQUdc1YNZcTyBPrOBz7FNpC1qZ+N3BaJ6dvgAeCk
	CzkhWHDQIrOmvRRBdvOaCjrCj3zTccMMY9WsXs8sRqg0xqbpiG5a
X-Google-Smtp-Source: AGHT+IHuIrZW72SIqAPAzPw4kkP8Ait46iIS5TYrufN0UM2yweioXZIaIIMLZhfUEsI1wDRcFohQdg==
X-Received: by 2002:ac8:58d4:0:b0:460:a82a:39a8 with SMTP id d75a77b69052e-4613bff3422mr347303931cf.13.1730441034526;
        Thu, 31 Oct 2024 23:03:54 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ad086e55sm15238211cf.7.2024.10.31.23.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 23:03:54 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 59F251200066;
	Fri,  1 Nov 2024 02:03:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 01 Nov 2024 02:03:53 -0400
X-ME-Sender: <xms:SW8kZyk_QU9YL_UlcttmAmNvOVmP4lBKzSdT7r_bVSNINPGyWx0WTg>
    <xme:SW8kZ53WSG28oFWvT1yiV4WPvgQx5zyLZiVWPeWF3jXcMHY2YCoT3IdHXmUbUx7yB
    6p3lENd23p9siSmWg>
X-ME-Received: <xmr:SW8kZwrH8O6bmqspW9efX0ooQGxJC5cV9vkQwP4DPIuNtDe4XNqaEkhKN4QIIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekkedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefgveff
    ieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepheejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtg
    hpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepohhj
    vggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesgh
    hmrghilhdrtghomhdprhgtphhtthhopeifvggushhonhgrfhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:SW8kZ2knc32CqP2oFTQeO3q9hURzxf9XCOw0wOgri9jULio_sd7tPA>
    <xmx:SW8kZw3if36RWYWdVRjQk3LUQ8Abif2CH4CNx-Nbvgoh_xyrc-E-lQ>
    <xmx:SW8kZ9uJbezqd7kVoRFomkFblAsT1It4AxHQWIr-gQluoPSgybJP2w>
    <xmx:SW8kZ8UFAIff9wLhON-OnFjh7rQpslisizv3mxicZlRme0LH4e7Nyw>
    <xmx:SW8kZ70_frDv2OxIyX2-pu03n2eSNOtwt33Y0cwZzVJNLDpHjNl1wejD>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 02:03:52 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev,
	lkmm@lists.linux.dev
Cc: Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
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
Subject: [RFC v2 01/13] rust: Introduce atomic API helpers
Date: Thu, 31 Oct 2024 23:02:24 -0700
Message-ID: <20241101060237.1185533-2-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101060237.1185533-1-boqun.feng@gmail.com>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_230356_122666_1FA7BB7A 
X-CRM114-Status: GOOD (  17.08  )
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

In order to support LKMM atomics in Rust, add rust_helper_* for atomic
APIs. These helpers ensure the implementation of LKMM atomics in Rust is
the same as in C. This could save the maintenance burden of having two
similar atomic implementations in asm.

Originally-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/helpers/atomic.c                     | 1038 +++++++++++++++++++++
 rust/helpers/helpers.c                    |    1 +
 scripts/atomic/gen-atomics.sh             |    1 +
 scripts/atomic/gen-rust-atomic-helpers.sh |   65 ++
 4 files changed, 1105 insertions(+)
 create mode 100644 rust/helpers/atomic.c
 create mode 100755 scripts/atomic/gen-rust-atomic-helpers.sh

diff --git a/rust/helpers/atomic.c b/rust/helpers/atomic.c
new file mode 100644
index 000000000000..00bf10887928
--- /dev/null
+++ b/rust/helpers/atomic.c
@@ -0,0 +1,1038 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Generated by scripts/atomic/gen-rust-atomic-helpers.sh
+// DO NOT MODIFY THIS FILE DIRECTLY
+
+/*
+ * This file provides helpers for the various atomic functions for Rust.
+ */
+#ifndef _RUST_ATOMIC_API_H
+#define _RUST_ATOMIC_API_H
+
+#include <linux/atomic.h>
+
+// TODO: Remove this after LTO helper support is added.
+#define __rust_helper
+
+__rust_helper int
+rust_helper_atomic_read(const atomic_t *v)
+{
+	return atomic_read(v);
+}
+
+__rust_helper int
+rust_helper_atomic_read_acquire(const atomic_t *v)
+{
+	return atomic_read_acquire(v);
+}
+
+__rust_helper void
+rust_helper_atomic_set(atomic_t *v, int i)
+{
+	atomic_set(v, i);
+}
+
+__rust_helper void
+rust_helper_atomic_set_release(atomic_t *v, int i)
+{
+	atomic_set_release(v, i);
+}
+
+__rust_helper void
+rust_helper_atomic_add(int i, atomic_t *v)
+{
+	atomic_add(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_add_return(int i, atomic_t *v)
+{
+	return atomic_add_return(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_add_return_acquire(int i, atomic_t *v)
+{
+	return atomic_add_return_acquire(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_add_return_release(int i, atomic_t *v)
+{
+	return atomic_add_return_release(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_add_return_relaxed(int i, atomic_t *v)
+{
+	return atomic_add_return_relaxed(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_add(int i, atomic_t *v)
+{
+	return atomic_fetch_add(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_add_acquire(int i, atomic_t *v)
+{
+	return atomic_fetch_add_acquire(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_add_release(int i, atomic_t *v)
+{
+	return atomic_fetch_add_release(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_add_relaxed(int i, atomic_t *v)
+{
+	return atomic_fetch_add_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic_sub(int i, atomic_t *v)
+{
+	atomic_sub(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_sub_return(int i, atomic_t *v)
+{
+	return atomic_sub_return(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_sub_return_acquire(int i, atomic_t *v)
+{
+	return atomic_sub_return_acquire(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_sub_return_release(int i, atomic_t *v)
+{
+	return atomic_sub_return_release(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_sub_return_relaxed(int i, atomic_t *v)
+{
+	return atomic_sub_return_relaxed(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_sub(int i, atomic_t *v)
+{
+	return atomic_fetch_sub(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_sub_acquire(int i, atomic_t *v)
+{
+	return atomic_fetch_sub_acquire(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_sub_release(int i, atomic_t *v)
+{
+	return atomic_fetch_sub_release(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_sub_relaxed(int i, atomic_t *v)
+{
+	return atomic_fetch_sub_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic_inc(atomic_t *v)
+{
+	atomic_inc(v);
+}
+
+__rust_helper int
+rust_helper_atomic_inc_return(atomic_t *v)
+{
+	return atomic_inc_return(v);
+}
+
+__rust_helper int
+rust_helper_atomic_inc_return_acquire(atomic_t *v)
+{
+	return atomic_inc_return_acquire(v);
+}
+
+__rust_helper int
+rust_helper_atomic_inc_return_release(atomic_t *v)
+{
+	return atomic_inc_return_release(v);
+}
+
+__rust_helper int
+rust_helper_atomic_inc_return_relaxed(atomic_t *v)
+{
+	return atomic_inc_return_relaxed(v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_inc(atomic_t *v)
+{
+	return atomic_fetch_inc(v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_inc_acquire(atomic_t *v)
+{
+	return atomic_fetch_inc_acquire(v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_inc_release(atomic_t *v)
+{
+	return atomic_fetch_inc_release(v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_inc_relaxed(atomic_t *v)
+{
+	return atomic_fetch_inc_relaxed(v);
+}
+
+__rust_helper void
+rust_helper_atomic_dec(atomic_t *v)
+{
+	atomic_dec(v);
+}
+
+__rust_helper int
+rust_helper_atomic_dec_return(atomic_t *v)
+{
+	return atomic_dec_return(v);
+}
+
+__rust_helper int
+rust_helper_atomic_dec_return_acquire(atomic_t *v)
+{
+	return atomic_dec_return_acquire(v);
+}
+
+__rust_helper int
+rust_helper_atomic_dec_return_release(atomic_t *v)
+{
+	return atomic_dec_return_release(v);
+}
+
+__rust_helper int
+rust_helper_atomic_dec_return_relaxed(atomic_t *v)
+{
+	return atomic_dec_return_relaxed(v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_dec(atomic_t *v)
+{
+	return atomic_fetch_dec(v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_dec_acquire(atomic_t *v)
+{
+	return atomic_fetch_dec_acquire(v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_dec_release(atomic_t *v)
+{
+	return atomic_fetch_dec_release(v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_dec_relaxed(atomic_t *v)
+{
+	return atomic_fetch_dec_relaxed(v);
+}
+
+__rust_helper void
+rust_helper_atomic_and(int i, atomic_t *v)
+{
+	atomic_and(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_and(int i, atomic_t *v)
+{
+	return atomic_fetch_and(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_and_acquire(int i, atomic_t *v)
+{
+	return atomic_fetch_and_acquire(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_and_release(int i, atomic_t *v)
+{
+	return atomic_fetch_and_release(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_and_relaxed(int i, atomic_t *v)
+{
+	return atomic_fetch_and_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic_andnot(int i, atomic_t *v)
+{
+	atomic_andnot(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_andnot(int i, atomic_t *v)
+{
+	return atomic_fetch_andnot(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_andnot_acquire(int i, atomic_t *v)
+{
+	return atomic_fetch_andnot_acquire(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_andnot_release(int i, atomic_t *v)
+{
+	return atomic_fetch_andnot_release(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_andnot_relaxed(int i, atomic_t *v)
+{
+	return atomic_fetch_andnot_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic_or(int i, atomic_t *v)
+{
+	atomic_or(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_or(int i, atomic_t *v)
+{
+	return atomic_fetch_or(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_or_acquire(int i, atomic_t *v)
+{
+	return atomic_fetch_or_acquire(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_or_release(int i, atomic_t *v)
+{
+	return atomic_fetch_or_release(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_or_relaxed(int i, atomic_t *v)
+{
+	return atomic_fetch_or_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic_xor(int i, atomic_t *v)
+{
+	atomic_xor(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_xor(int i, atomic_t *v)
+{
+	return atomic_fetch_xor(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_xor_acquire(int i, atomic_t *v)
+{
+	return atomic_fetch_xor_acquire(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_xor_release(int i, atomic_t *v)
+{
+	return atomic_fetch_xor_release(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_xor_relaxed(int i, atomic_t *v)
+{
+	return atomic_fetch_xor_relaxed(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_xchg(atomic_t *v, int new)
+{
+	return atomic_xchg(v, new);
+}
+
+__rust_helper int
+rust_helper_atomic_xchg_acquire(atomic_t *v, int new)
+{
+	return atomic_xchg_acquire(v, new);
+}
+
+__rust_helper int
+rust_helper_atomic_xchg_release(atomic_t *v, int new)
+{
+	return atomic_xchg_release(v, new);
+}
+
+__rust_helper int
+rust_helper_atomic_xchg_relaxed(atomic_t *v, int new)
+{
+	return atomic_xchg_relaxed(v, new);
+}
+
+__rust_helper int
+rust_helper_atomic_cmpxchg(atomic_t *v, int old, int new)
+{
+	return atomic_cmpxchg(v, old, new);
+}
+
+__rust_helper int
+rust_helper_atomic_cmpxchg_acquire(atomic_t *v, int old, int new)
+{
+	return atomic_cmpxchg_acquire(v, old, new);
+}
+
+__rust_helper int
+rust_helper_atomic_cmpxchg_release(atomic_t *v, int old, int new)
+{
+	return atomic_cmpxchg_release(v, old, new);
+}
+
+__rust_helper int
+rust_helper_atomic_cmpxchg_relaxed(atomic_t *v, int old, int new)
+{
+	return atomic_cmpxchg_relaxed(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic_try_cmpxchg(atomic_t *v, int *old, int new)
+{
+	return atomic_try_cmpxchg(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic_try_cmpxchg_acquire(atomic_t *v, int *old, int new)
+{
+	return atomic_try_cmpxchg_acquire(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic_try_cmpxchg_release(atomic_t *v, int *old, int new)
+{
+	return atomic_try_cmpxchg_release(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic_try_cmpxchg_relaxed(atomic_t *v, int *old, int new)
+{
+	return atomic_try_cmpxchg_relaxed(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic_sub_and_test(int i, atomic_t *v)
+{
+	return atomic_sub_and_test(i, v);
+}
+
+__rust_helper bool
+rust_helper_atomic_dec_and_test(atomic_t *v)
+{
+	return atomic_dec_and_test(v);
+}
+
+__rust_helper bool
+rust_helper_atomic_inc_and_test(atomic_t *v)
+{
+	return atomic_inc_and_test(v);
+}
+
+__rust_helper bool
+rust_helper_atomic_add_negative(int i, atomic_t *v)
+{
+	return atomic_add_negative(i, v);
+}
+
+__rust_helper bool
+rust_helper_atomic_add_negative_acquire(int i, atomic_t *v)
+{
+	return atomic_add_negative_acquire(i, v);
+}
+
+__rust_helper bool
+rust_helper_atomic_add_negative_release(int i, atomic_t *v)
+{
+	return atomic_add_negative_release(i, v);
+}
+
+__rust_helper bool
+rust_helper_atomic_add_negative_relaxed(int i, atomic_t *v)
+{
+	return atomic_add_negative_relaxed(i, v);
+}
+
+__rust_helper int
+rust_helper_atomic_fetch_add_unless(atomic_t *v, int a, int u)
+{
+	return atomic_fetch_add_unless(v, a, u);
+}
+
+__rust_helper bool
+rust_helper_atomic_add_unless(atomic_t *v, int a, int u)
+{
+	return atomic_add_unless(v, a, u);
+}
+
+__rust_helper bool
+rust_helper_atomic_inc_not_zero(atomic_t *v)
+{
+	return atomic_inc_not_zero(v);
+}
+
+__rust_helper bool
+rust_helper_atomic_inc_unless_negative(atomic_t *v)
+{
+	return atomic_inc_unless_negative(v);
+}
+
+__rust_helper bool
+rust_helper_atomic_dec_unless_positive(atomic_t *v)
+{
+	return atomic_dec_unless_positive(v);
+}
+
+__rust_helper int
+rust_helper_atomic_dec_if_positive(atomic_t *v)
+{
+	return atomic_dec_if_positive(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_read(const atomic64_t *v)
+{
+	return atomic64_read(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_read_acquire(const atomic64_t *v)
+{
+	return atomic64_read_acquire(v);
+}
+
+__rust_helper void
+rust_helper_atomic64_set(atomic64_t *v, s64 i)
+{
+	atomic64_set(v, i);
+}
+
+__rust_helper void
+rust_helper_atomic64_set_release(atomic64_t *v, s64 i)
+{
+	atomic64_set_release(v, i);
+}
+
+__rust_helper void
+rust_helper_atomic64_add(s64 i, atomic64_t *v)
+{
+	atomic64_add(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_add_return(s64 i, atomic64_t *v)
+{
+	return atomic64_add_return(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_add_return_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_add_return_acquire(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_add_return_release(s64 i, atomic64_t *v)
+{
+	return atomic64_add_return_release(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_add_return_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_add_return_relaxed(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_add(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_add(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_add_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_add_acquire(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_add_release(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_add_release(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_add_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_add_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic64_sub(s64 i, atomic64_t *v)
+{
+	atomic64_sub(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_sub_return(s64 i, atomic64_t *v)
+{
+	return atomic64_sub_return(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_sub_return_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_sub_return_acquire(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_sub_return_release(s64 i, atomic64_t *v)
+{
+	return atomic64_sub_return_release(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_sub_return_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_sub_return_relaxed(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_sub(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_sub(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_sub_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_sub_acquire(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_sub_release(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_sub_release(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_sub_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_sub_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic64_inc(atomic64_t *v)
+{
+	atomic64_inc(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_inc_return(atomic64_t *v)
+{
+	return atomic64_inc_return(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_inc_return_acquire(atomic64_t *v)
+{
+	return atomic64_inc_return_acquire(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_inc_return_release(atomic64_t *v)
+{
+	return atomic64_inc_return_release(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_inc_return_relaxed(atomic64_t *v)
+{
+	return atomic64_inc_return_relaxed(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_inc(atomic64_t *v)
+{
+	return atomic64_fetch_inc(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_inc_acquire(atomic64_t *v)
+{
+	return atomic64_fetch_inc_acquire(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_inc_release(atomic64_t *v)
+{
+	return atomic64_fetch_inc_release(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_inc_relaxed(atomic64_t *v)
+{
+	return atomic64_fetch_inc_relaxed(v);
+}
+
+__rust_helper void
+rust_helper_atomic64_dec(atomic64_t *v)
+{
+	atomic64_dec(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_dec_return(atomic64_t *v)
+{
+	return atomic64_dec_return(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_dec_return_acquire(atomic64_t *v)
+{
+	return atomic64_dec_return_acquire(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_dec_return_release(atomic64_t *v)
+{
+	return atomic64_dec_return_release(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_dec_return_relaxed(atomic64_t *v)
+{
+	return atomic64_dec_return_relaxed(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_dec(atomic64_t *v)
+{
+	return atomic64_fetch_dec(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_dec_acquire(atomic64_t *v)
+{
+	return atomic64_fetch_dec_acquire(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_dec_release(atomic64_t *v)
+{
+	return atomic64_fetch_dec_release(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_dec_relaxed(atomic64_t *v)
+{
+	return atomic64_fetch_dec_relaxed(v);
+}
+
+__rust_helper void
+rust_helper_atomic64_and(s64 i, atomic64_t *v)
+{
+	atomic64_and(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_and(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_and(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_and_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_and_acquire(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_and_release(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_and_release(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_and_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_and_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic64_andnot(s64 i, atomic64_t *v)
+{
+	atomic64_andnot(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_andnot(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_andnot(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_andnot_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_andnot_acquire(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_andnot_release(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_andnot_release(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_andnot_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_andnot_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic64_or(s64 i, atomic64_t *v)
+{
+	atomic64_or(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_or(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_or(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_or_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_or_acquire(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_or_release(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_or_release(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_or_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_or_relaxed(i, v);
+}
+
+__rust_helper void
+rust_helper_atomic64_xor(s64 i, atomic64_t *v)
+{
+	atomic64_xor(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_xor(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_xor(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_xor_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_xor_acquire(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_xor_release(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_xor_release(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_xor_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_xor_relaxed(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_xchg(atomic64_t *v, s64 new)
+{
+	return atomic64_xchg(v, new);
+}
+
+__rust_helper s64
+rust_helper_atomic64_xchg_acquire(atomic64_t *v, s64 new)
+{
+	return atomic64_xchg_acquire(v, new);
+}
+
+__rust_helper s64
+rust_helper_atomic64_xchg_release(atomic64_t *v, s64 new)
+{
+	return atomic64_xchg_release(v, new);
+}
+
+__rust_helper s64
+rust_helper_atomic64_xchg_relaxed(atomic64_t *v, s64 new)
+{
+	return atomic64_xchg_relaxed(v, new);
+}
+
+__rust_helper s64
+rust_helper_atomic64_cmpxchg(atomic64_t *v, s64 old, s64 new)
+{
+	return atomic64_cmpxchg(v, old, new);
+}
+
+__rust_helper s64
+rust_helper_atomic64_cmpxchg_acquire(atomic64_t *v, s64 old, s64 new)
+{
+	return atomic64_cmpxchg_acquire(v, old, new);
+}
+
+__rust_helper s64
+rust_helper_atomic64_cmpxchg_release(atomic64_t *v, s64 old, s64 new)
+{
+	return atomic64_cmpxchg_release(v, old, new);
+}
+
+__rust_helper s64
+rust_helper_atomic64_cmpxchg_relaxed(atomic64_t *v, s64 old, s64 new)
+{
+	return atomic64_cmpxchg_relaxed(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic64_try_cmpxchg(atomic64_t *v, s64 *old, s64 new)
+{
+	return atomic64_try_cmpxchg(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic64_try_cmpxchg_acquire(atomic64_t *v, s64 *old, s64 new)
+{
+	return atomic64_try_cmpxchg_acquire(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic64_try_cmpxchg_release(atomic64_t *v, s64 *old, s64 new)
+{
+	return atomic64_try_cmpxchg_release(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic64_try_cmpxchg_relaxed(atomic64_t *v, s64 *old, s64 new)
+{
+	return atomic64_try_cmpxchg_relaxed(v, old, new);
+}
+
+__rust_helper bool
+rust_helper_atomic64_sub_and_test(s64 i, atomic64_t *v)
+{
+	return atomic64_sub_and_test(i, v);
+}
+
+__rust_helper bool
+rust_helper_atomic64_dec_and_test(atomic64_t *v)
+{
+	return atomic64_dec_and_test(v);
+}
+
+__rust_helper bool
+rust_helper_atomic64_inc_and_test(atomic64_t *v)
+{
+	return atomic64_inc_and_test(v);
+}
+
+__rust_helper bool
+rust_helper_atomic64_add_negative(s64 i, atomic64_t *v)
+{
+	return atomic64_add_negative(i, v);
+}
+
+__rust_helper bool
+rust_helper_atomic64_add_negative_acquire(s64 i, atomic64_t *v)
+{
+	return atomic64_add_negative_acquire(i, v);
+}
+
+__rust_helper bool
+rust_helper_atomic64_add_negative_release(s64 i, atomic64_t *v)
+{
+	return atomic64_add_negative_release(i, v);
+}
+
+__rust_helper bool
+rust_helper_atomic64_add_negative_relaxed(s64 i, atomic64_t *v)
+{
+	return atomic64_add_negative_relaxed(i, v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
+{
+	return atomic64_fetch_add_unless(v, a, u);
+}
+
+__rust_helper bool
+rust_helper_atomic64_add_unless(atomic64_t *v, s64 a, s64 u)
+{
+	return atomic64_add_unless(v, a, u);
+}
+
+__rust_helper bool
+rust_helper_atomic64_inc_not_zero(atomic64_t *v)
+{
+	return atomic64_inc_not_zero(v);
+}
+
+__rust_helper bool
+rust_helper_atomic64_inc_unless_negative(atomic64_t *v)
+{
+	return atomic64_inc_unless_negative(v);
+}
+
+__rust_helper bool
+rust_helper_atomic64_dec_unless_positive(atomic64_t *v)
+{
+	return atomic64_dec_unless_positive(v);
+}
+
+__rust_helper s64
+rust_helper_atomic64_dec_if_positive(atomic64_t *v)
+{
+	return atomic64_dec_if_positive(v);
+}
+
+#endif /* _RUST_ATOMIC_API_H */
+// b032d261814b3e119b72dbf7d21447f6731325ee
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 20a0c69d5cc7..ab5a3f1be241 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -7,6 +7,7 @@
  * Sorted alphabetically.
  */
 
+#include "atomic.c"
 #include "blk.c"
 #include "bug.c"
 #include "build_assert.c"
diff --git a/scripts/atomic/gen-atomics.sh b/scripts/atomic/gen-atomics.sh
index 5b98a8307693..02508d0d6fe4 100755
--- a/scripts/atomic/gen-atomics.sh
+++ b/scripts/atomic/gen-atomics.sh
@@ -11,6 +11,7 @@ cat <<EOF |
 gen-atomic-instrumented.sh      linux/atomic/atomic-instrumented.h
 gen-atomic-long.sh              linux/atomic/atomic-long.h
 gen-atomic-fallback.sh          linux/atomic/atomic-arch-fallback.h
+gen-rust-atomic-helpers.sh      ../rust/helpers/atomic.c
 EOF
 while read script header args; do
 	/bin/sh ${ATOMICDIR}/${script} ${ATOMICTBL} ${args} > ${LINUXDIR}/include/${header}
diff --git a/scripts/atomic/gen-rust-atomic-helpers.sh b/scripts/atomic/gen-rust-atomic-helpers.sh
new file mode 100755
index 000000000000..72f2e5bde0c6
--- /dev/null
+++ b/scripts/atomic/gen-rust-atomic-helpers.sh
@@ -0,0 +1,65 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+ATOMICDIR=$(dirname $0)
+
+. ${ATOMICDIR}/atomic-tbl.sh
+
+#gen_proto_order_variant(meta, pfx, name, sfx, order, atomic, int, arg...)
+gen_proto_order_variant()
+{
+	local meta="$1"; shift
+	local pfx="$1"; shift
+	local name="$1"; shift
+	local sfx="$1"; shift
+	local order="$1"; shift
+	local atomic="$1"; shift
+	local int="$1"; shift
+
+	local atomicname="${atomic}_${pfx}${name}${sfx}${order}"
+
+	local ret="$(gen_ret_type "${meta}" "${int}")"
+	local params="$(gen_params "${int}" "${atomic}" "$@")"
+	local args="$(gen_args "$@")"
+	local retstmt="$(gen_ret_stmt "${meta}")"
+
+cat <<EOF
+__rust_helper ${ret}
+rust_helper_${atomicname}(${params})
+{
+	${retstmt}${atomicname}(${args});
+}
+
+EOF
+}
+
+cat << EOF
+// SPDX-License-Identifier: GPL-2.0
+
+// Generated by $0
+// DO NOT MODIFY THIS FILE DIRECTLY
+
+/*
+ * This file provides helpers for the various atomic functions for Rust.
+ */
+#ifndef _RUST_ATOMIC_API_H
+#define _RUST_ATOMIC_API_H
+
+#include <linux/atomic.h>
+
+// TODO: Remove this after LTO helper support is added.
+#define __rust_helper
+
+EOF
+
+grep '^[a-z]' "$1" | while read name meta args; do
+	gen_proto "${meta}" "${name}" "atomic" "int" ${args}
+done
+
+grep '^[a-z]' "$1" | while read name meta args; do
+	gen_proto "${meta}" "${name}" "atomic64" "s64" ${args}
+done
+
+cat <<EOF
+#endif /* _RUST_ATOMIC_API_H */
+EOF
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
