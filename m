Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A79606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 02:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OuXJ28bQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=dDQI278T;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=o3SLpNXW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=loc8Fth93d7GD0+l2Oqzfo8MKMIjOXZahQb9Boex/lc=; b=OuXJ28bQstXl2dBpIYiBhKbuUm
	PKQNZeDrnJAHdkGO06YElKIGWamxrDQIace1IlkiUkkDO7GYv/nBSodsnApdU01aVoG4rN4rTCizr
	/RYZjoSyUw1mGGoOyDFk88m8N/vuIGFKDEkayowvU3rWs7tBGfv738Nu9F1GqvoCKhAXSsC7JO99C
	oUtlVzBZHsNQTLgiog/R6oVJyl/HaKWIglCa6BcE7+4NqA6zkibnlPS5FIPPQ4Oa3iEQLEINy2KDu
	spD24uuRQ+OdN6HT7ySQsekJ6rssGTfHioeee3V8u2WtY2N389amVeixvSselKtW4Tu2dxx8Z3X3N
	Za+3fnBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbxI-0000000AeFz-0HfH;
	Fri, 30 Oct 2026 02:02:56 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbxD-0000000AeF2-1Kcf
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 02:02:54 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 766F3EC0583
	for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 22:02:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 29 Oct 2026 22:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793325769; x=
	1793412169; bh=8FSUHia2EBT1gZ6mpOdD7icS633gtzPTs1MVNfteiHk=; b=d
	DQI278Tk35huSP22Rxg/GL5OHIwGT7GUJumrZxQZytpuVOy35O2JNFl54M6a285l
	EeVfDxkE5MuN6zSn1m9jaIugZylzebrx2YccWtIyWcYVG/Eh9jgdw3tm9dmf2xrX
	PYqNf5WjV/VMbDyFyA5uV1W06C/jUi+qkY2pCxK1ftNbfnTcoMzcjTsyBsDCYpLu
	QAH/zd+D9FwqaOe2hIBaSr8NumZtlBObPt6ivcxa84mk6WWopiBe9nDuEeFbLqNB
	KBT/YKBVzAqd4Gs+C1yOJsaI4SS6P+tn2uHBaVYdV4j+Ye0MLOgmYgXkJ8syMcLI
	G+mKh5PFdcw17Zu6UNbPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793325769; x=1793412169; bh=8
	FSUHia2EBT1gZ6mpOdD7icS633gtzPTs1MVNfteiHk=; b=o3SLpNXWxwlsOAqse
	bZPtOjsvpeO+Bt+8GtISstRS1YBsh0ZM5BD8I8Dwpu/hHmCzY+SVPxh+Zo2p5XSP
	LDtjAEGL7sVDbLFO/+A49w4ZbIz2ig20YuGd9O+D2fugJrzyB5mDEhsPqLuAtzpO
	VemF5HsaK3ctf0b0EchitO7lUrV+jFAlYl+qvdAjlYeiT5XCh1ArA8Uqt7Hs57c6
	4I78q5NQ5Dhnrc9ta51dQzNoLfNHCAocP6CJ+M86xosM7hVt/typBbVdAmYSSD/0
	FtsSljZ9A/AXjnNQTXGZnpkTkAifTuETfD9fh7vFTVlfE6OwiejrAk6Cs9R7myF/
	5ddQg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793325769; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm1:rsa-sha256:hreYgzaQn7QdmBK8IuMD9sqXVjffRjk0YLWZxjiOjAdgikP
	u4uFyIXT9tydbyi1hxcabnxYj5auRFpup+EJDH5i2RUAE1i4y/IKe+xsBusfmv9B
	3INNMov9EjyD/93opga6AadqzzWKbpb7y0hQlRhtOUwCqNOmrlrfhyjb27QGECbp
	gSrB2MxoArJbDBCShtoPCIuyLUmezUzqTcNe+34s4xRXLrwhQW0XXk/315KcLcF+
	xpZWimTVT6C8jTdPijAE+wLRdT3R19bAL/bOM9iCRHE/DeAd5w+mlgebFaMnbPaZ
	NgybiOxxJE/9Jqj2o7nsxTn78CJvD1IRR7MAzUw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tRNRS8CP3XmcoeTAGMaam1BQZy1cpW07dXxF6Ce3hkI=:0xOZxCHC3pzu8FXs6nAbzg+LHJNb5fZqbGeOkedS3bM=;
X-ME-Sender: <xms:yfrjapizhEaG7GeWnYbGELGXKxceBmnjhW4nlfV6am16DW7_VuGSFA>
    <xme:yfrjavoOxLX_ZG6u604B8yXA1F8jGN-7i45H7TS46jLprYiy-ZSoffUw8GsfmmmEf
    33UQwjVF_WIaic0-JqtiDH3Lf5v8HeIblPGvnYAxpntVcniTl2UN3bV>
X-ME-Received: <xmr:yfrjatLhKIvFPsZZMADjGbGOAlR5JyXM-5mvFatXwDmeOqAcAN4Lkhlk5i9hWzgv3y-gQqJhJ1wrJ9xGrDg>
X-ME-Proxy-Cause: dmFkZTEVTXDrw+a/ZnnDdAjar6rXxTxYY9fIUdO+d9pbGqZkClU9xD1X9nF+Wo7rIZ+4vR
    /smsFdDh+872K80vScbcBxAvt0KBIRi5vqKaomzRbKh1yMb94byQ3BB6d2tMElRqiKk3eR
    K/Du9ywpxh0upliIYQSKHr7IiRXNoaEcem5HKUJD0YpdCFF2/kmJHBalhCYDjGdgtWTVbi
    HcCvGqov0AK404rI8+9k+VDgb2bkVeOfvgVA1pWqcKc90MPvFCkIcwTFK9X2f84cOjfl60
    9Qr4HwLcsvVHM5FbrFSSYURaOtS/S3cYlynh/uun1A675PxfgvEsvurvQ+FjrmTwNyictt
    IcpyKUhQ+rFLM3K00QR6de9HqyW5O5p27fE+xku+y6WBT9mJJQzpmLcaMz1kalfdw5QbnJ
    6SJzpfdROOoF8NGvCEP1LyvXa9wFGOIE+SQjD3BEnpfnwysfILVuzJNMXGOhgUm3tbVPn0
    1SflSrBUepVo6O2uE0aaws+GptaQeODMlxLWAURFl9yTHYwHkcpFbh/rdXO2FQFOHNVMtF
    8Ywk/JHDHh73uUU1IBjX6fdX7/a97s0GfWhxb0sgcpCIB+DtNBDjQ1z0ydDo7yjJcRxjZ3
    hHL+KYx8oGFHTznJ7VN29oxvIg704WyB10wyYo6kf9BPaNBLGT4HqRknC/tQ
X-ME-Proxy: <xmx:yfrjakt59ArTh4dT3bSpM1evMhz-JJClAbrAGHnW4X-XotRcsuZeTg>
    <xmx:yfrjalujL_jNW7P8_BiSH2MB6UURBRtAvisYzgHCMO3sL6e72B5Xpg>
    <xmx:yfrjajVDQf3pdVV_DV_vN1gaPzJ0lrHFK8zA4UJGKMa15XVDrZMtRQ>
    <xmx:yfrjamVMM7o8Cl03kEs8IBIBwv_YU4gN0WBs7zRV8mKbMBrwsxPHvw>
    <xmx:yfrjalMe6cc6qi-vmMRA36EZkWMk1tc7Hukk-oUwrboicDslToFIFt3j>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Oct 2026 22:02:44 -0400 (EDT)
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
Subject: [PATCH v3 1/2] rust: math: add div64_u64() and div64_u64_round_up()
Date: Fri, 30 Oct 2026 11:02:08 +0900
Message-ID: <20261030020209.3833766-2-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030020209.3833766-1-tomo@flapping.org>
References: <20261030020209.3833766-1-tomo@flapping.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_190251_500012_6D5ECDA2 
X-CRM114-Status: GOOD (  15.61  )
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

Assisted-by: LLM
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/lib.rs  |  1 +
 rust/kernel/math.rs | 71 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)
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
index 000000000000..395816639af8
--- /dev/null
+++ b/rust/kernel/math.rs
@@ -0,0 +1,71 @@
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
+#[inline]
+pub fn div64_u64(dividend: u64, divisor: u64) -> u64 {
+    if divisor == 0 {
+        panic!("attempt to divide by zero");
+    }
+
+    #[cfg(CONFIG_64BIT)]
+    {
+        dividend / divisor
+    }
+
+    #[cfg(not(CONFIG_64BIT))]
+    {
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
