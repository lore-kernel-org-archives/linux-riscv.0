Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AE0EE4988
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 16:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ulm4fpDjim/XMuGcVSlZ8vfFnx7f8aS0k8Salhs6SQI=; b=DK4jmPk93A4j13
	gHLkLs2qlwIHAoJdCRSmci+VYZXPzqfxg+E251Pyik9mE6mic0grRSiMgGWtLsg+OPIZTIb2Y9GC6
	rFNpJR0OzC5HqlIfnOjeSh6ILEIAHl5bCfl6JRXldUo+C6/kt/sHnSZaYsqX+g99qIm+Lo8IQBjCz
	0TT7vzUDgx3sBETQBpxnm8xmHwpkFtkJ2XX/e8iIhSNyOMJhESFBXmzgEbiWPFT2+04qk4lymlvTx
	8oBpSAqYnDwIPys4/jUjlgWy7kiLndZm3tGdznLGHPbRafinhdOaCBdFj4oYscRMHRYnsYSqdvfaJ
	nC8RIhH+Cc4aNV1Y3GJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vactZ-000000054T1-33oX;
	Tue, 30 Dec 2025 16:48:29 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vactV-000000054SY-3kCR
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 16:48:28 +0000
Received: from minun.felixc.at (unknown [65.108.105.71])
	by APP-05 (Coremail) with SMTP id zQCowAA3yQw8AlRpUjKQAg--.63740S2;
	Wed, 31 Dec 2025 00:48:08 +0800 (CST)
From: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
Subject: [PATCH v6 0/4] RISC-V: re-enable gcc + rust builds
Date: Tue, 30 Dec 2025 17:47:53 +0100
Message-Id: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADkCVGkC/22MQQrDIBBFrxJmXYuZaChd9R4lC9HRDDSxaCotw
 bvXZl34m/fhvR0yJaYM126HRIUzx7XBeOrAzmYNJNg1BpSoe5RKBGtFeuVNFC2M8ZYcDT2ZAZr
 xTOT5fdTuU+OZ8xbT54gX/Xv/d9qkQKc8SncZLapbWAw/zjYuMNVav7H9R8mmAAAA
X-Change-ID: 20251204-gcc-rust-v5-aafcede31ea3
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor@kernel.org>, 
 Mingcong Bai <jeffbai@aosc.io>, Han Gao <rabenda.cn@gmail.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Jason Montleon <jmontleo@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID: zQCowAA3yQw8AlRpUjKQAg--.63740S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW8KrWUGF48JF1fuw4UJwb_yoW8Jw4xpa
	95Cr4fKrWDJFWIgr4fAr48WF45GF1rJrWrJF17t34UJ3y7ur18trnIkr4rJa17ZryvvrWj
	vr1F9Fy09ryUCwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBKb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCI4V
	WUMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRAhL0DUUUUU=
	=
X-Originating-IP: [65.108.105.71]
X-CM-SenderInfo: x0lq233loux21fy6x21ufox2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_084826_305276_DB6B8BD1 
X-CRM114-Status: UNSURE (   6.65  )
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

Previous v5 patch:
https://lore.kernel.org/20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com

Changes in v6:
- Simplified `bindgen-backend-option` Kconfig function by using
`/dev/null` with clang option `-x c` instead of `touch`ing a new temp
file.
- Moved the `BINDGEN_TARGET` check to `rust/Makefile` so it only
performs the check when Rust is enabled, avoiding breaking targets that
do not support Rust builds.
- Updated my git email to the institutional email address.

Signed-off-by: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
---
Asuna Yang (4):
      rust: export BINDGEN_TARGET from a separate Makefile
      rust: generate a fatal error if BINDGEN_TARGET is undefined
      rust: add a Kconfig function to test for support of bindgen options
      RISC-V: handle extension configs for bindgen, re-enable gcc + rust builds

 Documentation/rust/arch-support.rst |  2 +-
 Makefile                            |  3 ++-
 arch/riscv/Kconfig                  | 35 ++++++++++++++++++++++++++++++++++-
 rust/Makefile                       | 17 ++++++++---------
 scripts/Kconfig.include             |  5 +++++
 scripts/Makefile.rust               | 10 ++++++++++
 6 files changed, 60 insertions(+), 12 deletions(-)
---
base-commit: 8640b74557fc8b4c300030f6ccb8cd078f665ec8
change-id: 20251204-gcc-rust-v5-aafcede31ea3

Best regards,
-- 
Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
