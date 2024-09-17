Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCAEC3ABCB
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 00:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pa9v1gJjBqBKK0u1RzfAX032gogMvwiuN+t+KdSHagY=; b=dzYQJ3E/dXvlJu
	ihMVWoDNxJ1/WfrXWulrUaHRcD7tIn6+Di2ppKNMOnMNWG2BFu+F36IbCxB5mOF9HwXYsS/nlTnZx
	4oQ3rKuDOvuSz0SsjUgcwH20PEuyBFsPrPj7fzpIhvJNPkV39EfdrSNYUKRuSe3Avx4mfqe85Jhb+
	U6kT1hZ329wXo+awQ8/qE1zERFO5mSoEV8IAc4WKGIl7pBq7teHTlbOCikmcWcRtG44eWxFBjmaO4
	KDbxdB5OqAEsfUQEnfW03h25I5NhowaG2Xjjq8LRHkXBltJyVQyzhkzh0LNLS8U1+nO95KsuxHuQ/
	KP3joFMwW48Kng5xNmvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqLq6-0000000588i-2Uez;
	Tue, 17 Sep 2024 00:13:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqLq2-0000000587q-48u2
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 00:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726531981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P3XRknCuZ+rddMbA9raqM8xFOQmhedysMspZNVnmtig=;
	b=ZznfrfhuMei3UFjApTcpnylUSfa03tIFkpCIuNKX8xuT+kj8ei5eupgA6h6PTFQfQeUvfq
	NNC0Ix8e2qlrIOGV9mU4twRqDdYcMHDyOkVz00AE9lA2z7fLEcot99ikT5NrHOLtvVV1Xj
	kwjESCvOf6XpU6zR2nToJ7Ag0chYTG8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-DxLi3mvAPAuSzJjoE1su5w-1; Mon, 16 Sep 2024 20:11:09 -0400
X-MC-Unique: DxLi3mvAPAuSzJjoE1su5w-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6c3540067b1so97256066d6.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2024 17:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726531869; x=1727136669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3XRknCuZ+rddMbA9raqM8xFOQmhedysMspZNVnmtig=;
        b=gTdA2A/i26KwumCLoupV1o+xbzjPr4y0Mg+TDhXvXUp0lyvEaQRF0wb/EgLF5usp0z
         7xz7IrTPC0kA+dPQXA43Ybauq9DdndxIN0g/rbwIi3j6BbKIBjFXiOX3N3RfZ00hvfMS
         UafXGnQWcDkJhX0fr0SYuSOhw8qc9Z4JNB3L0Hh/oLVpoBvF8EMJUfg1NTRRvhL1HaXQ
         tfWLokTGabUNNbd4548LJeYthtdk+8XhspPP18zNGr5Zdbs9Hg1MCWcD8q74Y+lsdSSs
         m9r2Ni6NVVf5E6zfP5ym2ZnL+ueKh9H5RsdQ5jFEzmiRnhsy9bo6oVxBbczZ1yG85uK6
         GtFg==
X-Forwarded-Encrypted: i=1; AJvYcCVFd2db/U1dfiXUpgq6ID7eaR7DVJiaKzaSNnhFh7N//HknhU2a8JKHmvJdIUANdXsfGfroCuynIK0SyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdnqXFenOQWVQIIEwoh5cc1IDZfLcpyzhVgH7dQJDTveJHdSzy
	BYY2l9E8mUTyvUxzK1PICsgiLwcfXM9bIAmWEZoY4VqZ4XJ+N7pwrwPvMICewNgUO7w4fLq9KFA
	XzYA5bMYpKkGq3w3etfy63N30IrNsobKXHzyqZgYxY0/VtNOaPYm1FW42s461kiHCLA==
X-Received: by 2002:a05:6214:311a:b0:6c3:5496:3e06 with SMTP id 6a1803df08f44-6c57350b986mr276808176d6.10.1726531868910;
        Mon, 16 Sep 2024 17:11:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHnGglfemeo+Af3oezjiRWKnnZJZ0HiOz3D898c3WHVJObvGXlST1AzNl9ohW/gu5HlG6/gw==
X-Received: by 2002:a05:6214:311a:b0:6c3:5496:3e06 with SMTP id 6a1803df08f44-6c57350b986mr276807636d6.10.1726531868420;
        Mon, 16 Sep 2024 17:11:08 -0700 (PDT)
Received: from towerofpower.montleon.net (syn-066-026-073-226.res.spectrum.com. [66.26.73.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c62633bsm29221956d6.25.2024.09.16.17.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 17:11:07 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	Jason Montleon <jmontleo@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH] RISC-V: Fix building rust when using GCC toolchain
Date: Mon, 16 Sep 2024 20:08:48 -0400
Message-ID: <20240917000848.720765-2-jmontleo@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240917000848.720765-1-jmontleo@redhat.com>
References: <20240917000848.720765-1-jmontleo@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_171303_106056_77CD5784 
X-CRM114-Status: UNSURE (   8.48  )
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

Clang does not support '-mno-riscv-attribute' resulting in the error
error: unknown argument: '-mno-riscv-attribute'

Not setting BINDGEN_TARGET_riscv results in the in the error
error: unsupported argument 'medany' to option '-mcmodel=' for target \
'unknown'
error: unknown target triple 'unknown'

Signed-off-by: Jason Montleon <jmontleo@redhat.com>
Cc: stable@vger.kernel.org
---
 rust/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index f168d2c98a15..73eceaaae61e 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -228,11 +228,12 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fzero-call-used-regs=% -fno-stack-clash-protection \
 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
-	--param=% --param asan-%
+	--param=% --param asan-% -mno-riscv-attribute
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
+BINDGEN_TARGET_riscv	:= riscv64-linux-gnu
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
 # All warnings are inhibited since GCC builds are very experimental,

base-commit: ad060dbbcfcfcba624ef1a75e1d71365a98b86d8
-- 
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
