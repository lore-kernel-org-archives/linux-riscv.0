Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F3A606A330
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 22:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MqlDr67t;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=dbAPXr+V;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nU5mqbhX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dX6wh7wan8g0zJ0yG/Qf0u64K2VFlf6fFmBbAZgQciE=; b=MqlDr67tNw11DsXQev3RmL26Zl
	gNfsUmATj9lRHU1AgLA5tLTHHw9bYftcSSNuHU9ZPOKBKOOLQfyC8i1j0FZJTHGzjfRaO8J4BIXKg
	/bpDXJDPo8EE5/UuCZj1ZofcylIGGuCdsYQflYgzeSf2fdqPFv+QtUFroM7SvUvE7vl84hWLKBP1F
	vgARpN0EVjGa6uHRvaxW1DP2cHHwuIG+j24bOiclOzLqbjn4fOEZHL6VwUQ65Po+Szqg9ZUhMFJ3j
	N98j0O3QASU5/DMIba9T5MYdykuxSs+OSj4I19x6umXvJWC29BAjOGXWCe40a2H9wZxuhJl78l+0B
	KLhrKwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToV7-0000000ARJQ-0kHH;
	Wed, 18 Nov 2026 22:51:37 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToV5-0000000ARIn-0hbI
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 22:51:36 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 816F21D000C9
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 17:51:34 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 18 Nov 2026 17:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1795042291; x=
	1795128691; bh=CHzVwGG6EOgLEWwhSfn573Ka0YCiRiZ/KUZGFq0q2uU=; b=d
	bAPXr+V16hwvzzHEWDyVayv//Ko2IT8SUG/uUoHA8slt2eXLlvdow5gPi5XohLhX
	XmE6Xc35ixwxFLYotelDQULqbf8/+Dp1Wn6fMFB+rPmVi7gG1KYIMuezDJe/iu54
	86wPshwnG/mrEjXtppP2Chvnq8pJi/SfLlEt3S6oQjCL17BD+Z2vACITkvgYl5Cp
	1TTU2b84qtWKSiydsdhbKVbd/Y6yQMSksbRtLAWiOJxXsVeLWavJ3tl8pWhfbadz
	cg5gEYaat9gpGiut+o+BOXNFp61QUKb04dRoHMd2bO6AvduyAeijL3YP1lLqCNfV
	jG5WyimY4bIJ4N9k7Uw9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795042291; x=1795128691; bh=C
	HzVwGG6EOgLEWwhSfn573Ka0YCiRiZ/KUZGFq0q2uU=; b=nU5mqbhXPz+FF+U6c
	c6SqUQdU0KVAuZtWxFmYFedrj2SxsxyJbpYe6MGBE0CzMz7MsXhaZwUvjWgwqyTF
	AB6u/bzURv1vgmRU/bZgzHVhAljTaet6WxfrqBiGyVmSKNXBH9hYPmsmd0WWeHXC
	luISYZXC3pinPZR+wHFKcau2qQtYC8rXTtedYEFdJcvyhdlqDiQTf67b6Ed0tPI3
	S6uOA55AvRzKOpeuvfYnltXhFkEuZIUrvRApn0mxihQY/PltRChNioA53rnWed1J
	+9rQsuzcXU5EDboIkz3hMP7tV/cfvOmrWqLkq/5bbZ6vyn8uq/+fOhLyOyJaoIBg
	lA4YQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795042291; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm2:rsa-sha256:pHTZ9iJ9RdAHHiAzklzluhcV+MZr/HgFhygz/NeJOALm/+z
	ZK2sRkvtOVinNEp0BFSobIYMs5tRUh4+YMhaRUOD4V0reyqB8N218T173zwHQtOz
	FWSrTKjZqI6USL6es45I/xtTHUiUinyX9g+G5NUnn4BQ+v+Cv9cfFs5YX8yk6Ec+
	myfvQXB6s0ES0zg7MVuPjoIj84KbrBcgBs98qsZtYYa2m9Mf5Mz20DhHi9RFp0di
	73L7CZFJw7TZf206vctgaRvU7X08x4HJi/Gd0gs8mD90sY2AOfoWb6c58hLWe8nR
	jyli1C3NwEboG3AqDnFs2sX+4SK64VxCfOY+Jlw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:rg7VLTODDVm8P3xaJwWih08zaozJnwLl8gzIUGnx8Ww=:JKfe7yYjlm6+R+J2TWcpCGn48NNGeYzocWI8DyJRjWw=;
X-ME-Sender: <xms:8yv-asRhcwoUrSvW66DpZ1At04R3j1RBtk_UDGjvAbnDjyO1OumtGA>
    <xme:8yv-atSdaJz631UGYnAiISgFP2A6SQcVAtvVE4hmpXrLLqsE6z-WeDuAwDW1Lrwf_
    BmHdcyC2gZS5jod0FNA5pSKM0ASaP0T2SbcW2eaZxD8hdXJ6ZBBE45U>
X-ME-Received: <xmr:8yv-aiVS2bPpQASi6D8p1OiNRegi8_N5zvFze7VoBx0pJVtTSLi0ciL8yyoy_DIjuYmj4z9GVuMWGypPKM8>
X-ME-Proxy-Cause: dmFkZTEnoGXV/KCC4fAh8bvdJTDrx0jo+nARus1TsdK2RBjKug2lyOm5Bb3JJQSdnvSxOj
    XeoDBJmIqD7sP5hvh1Qf++WMqZDzuyVPMdH8dhRRgFQ05ZxoHemq8iorrGW+WLMhkknqSQ
    Pu2Zma46JFM/1ZxkZ4rzcaedLGGxHcsyGACo8YRKNiSNC6ywxc0TbT1qh/fBnAFl2AfRdO
    AdlUzUrXXL5MExF5Xi3lItbHYF6Dga8deBdMPK7N2V4m6GHUiTgavkEGqr+FW4mVAHnFVD
    2Oa+67bFlue6KgoctrlorgyzYe14kLapbwgWSwEx5q+3R/TEUDzIK2asXxqvUjz2fT6sYv
    hsjoKg6ETVmeO5IjaqmkrTWrcAgyFSKNgtpFWvrqsUejt/rskWWG1qp9YHSvb1g3qjiGna
    Wyuv2bNB4mDjYZ5pI3IJVSJNcDtB/qwVU58itosWL/dGnDUaFliXR0dY1cuo7S5E+z2FjC
    pFslq6XW3G/BLyEZ6psKfBkP13ZkknV+4oK+rdg3s6oOx95kF95gOCpE9B9U5CnteAXYzo
    yy71BO3Pc+S0dal/zzdTXZ3ORel9NXV+cQQXx88B/aLYSiuabi5DNYRNwXhQdgFCgvDijX
    xcHP8WX1qU51XnqmJ8slxLPXg/2EuPPEmzGsL4EDGKgpKZevaLt2kFkPZj4A
X-ME-Proxy: <xmx:8yv-ai3Ua3HclMVR6_YNbYYktqA5l7h8AdNTF3zEC7gHJsnHixYfNQ>
    <xmx:8yv-ap-4Vs1anQUMcZKZGcjeYASPDtOHJte32pyue7Q1_F-Vq1fvdQ>
    <xmx:8yv-aoeGi8Q5CZts1lUfBtDCqQuzf-AfWJEc72x6ZCw5ExEfEdvCxQ>
    <xmx:8yv-al5hXC2-5GaZ2-bqoGhHFvi7x0Af_FDySBAf2eCjdZbZZIuXfw>
    <xmx:8yv-aqZdPpmlnvh2XcsoNCLNrnnGbyvRNNnEl9_xo19yiA0ecXjl10DD>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 17:51:26 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: fustini@kernel.org,
	guoren@kernel.org,
	ojeda@kernel.org,
	ukleinek@kernel.org,
	wefu@redhat.com
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	chenhan0017.work@gmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	linux-riscv@lists.infradead.org,
	lossin@kernel.org,
	m.wilczynski@samsung.com,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v4 1/2] rust: math: add div64_u64() and div64_u64_round_up()
Date: Thu, 19 Nov 2026 07:48:25 +0900
Message-ID: <20261118224826.2491684-2-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118224826.2491684-1-tomo@flapping.org>
References: <20261118224826.2491684-1-tomo@flapping.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_145135_256599_CDD4342B 
X-CRM114-Status: GOOD (  16.33  )
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

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

On 32-bit architectures, dividing a u64 by a u64 with the `/` operator
makes the compiler emit a call to a compiler runtime function, such as
__aeabi_uldivmod() on arm. The kernel does not provide these functions,
so the build fails when Rust code that is also built for 32-bit
architectures uses `/` on u64.

C code uses the helpers in include/linux/math64.h instead. Add a math
module with Rust versions of two of them:

- div64_u64(), the same as div64_u64() in C.
- div64_u64_round_up(), the same as DIV64_U64_ROUND_UP() in C.

On 64-bit architectures, both use `/`. On 32-bit architectures,
div64_u64() calls the C function. Both panic if the divisor is zero,
as `/` does.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/lib.rs  |  1 +
 rust/kernel/math.rs | 73 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 rust/kernel/math.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 1ab41129d557..482fef8be2e8 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -100,6 +100,7 @@
 pub mod kunit;
 pub mod list;
 pub mod maple_tree;
+pub mod math;
 pub mod mem;
 pub mod miscdevice;
 pub mod mm;
diff --git a/rust/kernel/math.rs b/rust/kernel/math.rs
new file mode 100644
index 000000000000..909afcf8dfa2
--- /dev/null
+++ b/rust/kernel/math.rs
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Integer arithmetic helpers.
+//!
+//! C header: [`include/linux/math64.h`](srctree/include/linux/math64.h).
+
+/// Divides a [`u64`] dividend by a [`u64`] divisor, rounding down.
+///
+/// On 32-bit architectures, `/` on [`u64`] needs a function that the kernel does
+/// not provide. Use this function in code that is also built for 32-bit
+/// architectures.
+///
+/// # Panics
+///
+/// Panics if `divisor` is zero.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::math::div64_u64;
+///
+/// assert_eq!(div64_u64(7, 2), 3);
+/// assert_eq!(div64_u64(u64::MAX, 1 << 32), u64::from(u32::MAX));
+/// ```
+#[track_caller]
+#[inline]
+pub fn div64_u64(dividend: u64, divisor: u64) -> u64 {
+    #[cfg(CONFIG_64BIT)]
+    {
+        dividend / divisor
+    }
+
+    #[cfg(not(CONFIG_64BIT))]
+    {
+        if divisor == 0 {
+            panic!("attempt to divide by zero");
+        }
+
+        // SAFETY: `div64_u64()` requires a non-zero `divisor`, which is
+        // checked above.
+        unsafe { bindings::div64_u64(dividend, divisor) }
+    }
+}
+
+/// Divides a [`u64`] dividend by a [`u64`] divisor, rounding up.
+///
+/// # Panics
+///
+/// Panics if `divisor` is zero.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::math::div64_u64_round_up;
+///
+/// assert_eq!(div64_u64_round_up(7, 2), 4);
+/// assert_eq!(div64_u64_round_up(6, 2), 3);
+/// assert_eq!(div64_u64_round_up(u64::MAX, 2), 1 << 63);
+/// ```
+#[track_caller]
+#[inline]
+pub fn div64_u64_round_up(dividend: u64, divisor: u64) -> u64 {
+    let quotient = div64_u64(dividend, divisor);
+
+    // `quotient * divisor` is not greater than `dividend`, so this does not
+    // overflow.
+    if dividend - quotient * divisor == 0 {
+        quotient
+    } else {
+        // A non-zero remainder means `divisor >= 2`, so this does not overflow.
+        quotient + 1
+    }
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
