Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC80E6749F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 12:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sd4lw/jWCorhpJ50NFNdQsEYnYU+ghP8mWSquG510dQ=; b=p5o5AMLseYaArW
	fgM4Y4g8FlQEpPf7sR+XR6/WuuS0VeAyT4K01Me/gaVNCBawdcoIrk15cmf1EnzAJ3caazasMgfUX
	NfMV3qePgNiBp/31MPcW9AK4Tr6lVI4e5bhKTaLxray0qOoEq/a5JtC1VVN8UUYwOEmQsZ/p3sRWv
	K2beCuGrgI5s4oUkPBmzjPyFCfLpVAjXVNw8qw3v2+icGI8r1Idz1c20QAT1paU3BTmPzBunOUq8B
	+f/iKnH1BfoDsp6bKi6gRMxqJU3gUVByZHw214MkLYx/xZkWCbEpmgXo352E2zEGP4jicTFMwYrea
	5F+OfXmrD2xsTy4G3IOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXey9-0000000Dk0z-0jiC;
	Mon, 22 Dec 2025 12:24:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXey6-0000000Dk0Z-1uYa
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 12:24:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 64CD94374B;
	Mon, 22 Dec 2025 12:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DB1C4CEF1;
	Mon, 22 Dec 2025 12:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766406293;
	bh=lnjqsDYEgCfO4ZddSccMgn38v9kLuF3K9z5CoiieAag=;
	h=From:Date:Subject:To:Cc:From;
	b=kdIRGWpo44iKVb+6ueuZw3guWj4LA077LyfYGHyIkzAq5xpOqjgAWIjqD7gbFNqrM
	 Ehe/Wh2i8jIagao63bqVU+P04x8KQhkQWLPomQ2p2KUDFmIL0ga9H8CVLlSPucNsnR
	 ZPVv7q3aJLHKjj/F7wi4b60TWGrAIi6DemJUBFMLqlb3pxaFOah4MTHdUKXKEVYP9C
	 yDmvxe0WHLXiWnXqJU5apUYL/G4/Z6Q07vNlqckBw5LsVRllTNtS2slYNH530Waunn
	 f4FjFsT76vv8GucmJC95j664jDhDIPdH4Sjd5KaVB7+6Kb7B0zjOqVIBMucUcuq1r6
	 yKqgHXvo6JMdw==
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 22 Dec 2025 13:24:46 +0100
Subject: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0
Message-Id: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwqAMAxF0a1IxhZsUErdijjQGjWCHxp/IO7dq
 sMD970LhDyTQB5d4Gln4XkK0HEErq+mjhQ3wYAJZhoRlZPVq+UYlbO1rVKTaJ0ZCPniqeXzuyr
 K37LVA7n13cN9P6upymhsAAAA
X-Change-ID: 20251222-cstr-pwm-c9b9a4701157
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1766406288; l=1078;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=l+He6MEds9B9z2LyZUQ1+D0MyaUqDKaef7Is8IURDCM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFUXcXXV1sboqInuxMT5xqzVkmaROt+v/opgjZTA4adhR15BnVO+8Wv6E9k2catimkHqHF6q9iN
 u8aplJduG9wM=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_042454_522184_2F9FFDC9 
X-CRM114-Status: UNSURE (   6.91  )
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

From: Tamir Duberstein <tamird@gmail.com>

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/pwm/pwm_th1520.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index e3b7e77356fc..8ae8f852ec02 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -22,7 +22,6 @@
 
 use core::ops::Deref;
 use kernel::{
-    c_str,
     clk::Clk,
     device::{Bound, Core, Device},
     devres,
@@ -327,7 +326,7 @@ fn drop(self: Pin<&mut Self>) {
     OF_TABLE,
     MODULE_OF_TABLE,
     <Th1520PwmPlatformDriver as platform::Driver>::IdInfo,
-    [(of::DeviceId::new(c_str!("thead,th1520-pwm")), ())]
+    [(of::DeviceId::new(c"thead,th1520-pwm"), ())]
 );
 
 impl platform::Driver for Th1520PwmPlatformDriver {

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251222-cstr-pwm-c9b9a4701157

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
