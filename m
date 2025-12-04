Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7C9D1D887
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 07:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wlkVRPhFRpojhgddjPvQCAoah4NIKMj+Ev159uGwa4=; b=bkkGSdaCgmFwbV
	rt0JBZ1PBQ4qAwq7zuxLBxOK9jx8Ra3cEcjv6hMsEIdE0mxUc5a64BMqjSI+KrHniFCZQomZ8fF3F
	yumNsmkkloqQOoTqdPCLEdEuJjplVHCOO/5f0nwV2vS9pz6ewrjmLxSnWZzoSp9L6JcG6lypIN38j
	Fljb5SNXyMLT5ISHs7AwAR3bvZ5B5yhWBWulpuruIuPFBaOgpQWXtndJJhNAfMREh/NXDKEM3AUB+
	DW8NjHmyCLGKjg+eXg3veYeV1RSAOIVETENOMtIj/ili2yPFjRXpxP6OwZ/V+9fMgKOUhiBh/Q+6I
	qxfR2cAm9zNle2CVoONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4BS-00000007dN7-0pkG;
	Thu, 04 Dec 2025 07:55:26 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4BP-00000007dL7-2GLa
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 07:55:24 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-59578e38613so600385e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834921; x=1765439721; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5CWhh0bivbAxLbPHjrdPNLbMwbFtGK6KhcOChIXS0I=;
        b=eLslI91JSgBftDPS0xMqgiXy30tUZRIjxhhe8AHMGGIuXzgygwWM5IbfEE7NED0yQZ
         k/hqd2Z5o5QHk7CkNiACIiIJf5V2sDepefzpxf9398Hl5up0Wc0sNC5Dn95qCd+a4B7i
         D40p/RAiiPXLAFN0CCveefE3suLMgkOtVm99k2rl74Rb85Zc8J9Jxu7jntBmd9392pgG
         x4f7Q9cTyDfZ1RATBA6pjiElZ/D4tAEpiBNnPOonxGsb4ULm7+m+m7K4RNNN13LA6KCN
         v6eq2sQyuJyfR9A+3vNOc6xjQFuKpvS6OjA+s+RsrIJKaDBJzqAmLhDGkUYlSPP8uUev
         CJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834921; x=1765439721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l5CWhh0bivbAxLbPHjrdPNLbMwbFtGK6KhcOChIXS0I=;
        b=gKR1YurxadTVCifJcsxPDQ0eRRvPaqcD2my0MKDujByANNJZzgPKgcGABlvQdcFyaO
         +fdAywu4SiVXMP922B/BXG59YFbHiwh7vIfKbIkQi9/E59OqSO16iWJv6MbUG4QBbKjP
         +j8/cfvm8CHlRhbpspG4eOtttRJhTdZqfyxbdSwJ9uwrUDD+Whw9Q0T+GD78WnYP+YC0
         BRxOTYwEMnlnlKlmxxtWpQxIJt7/reqTdvZyYwILRnei6mI5Yu2SqYoidziOL3BNWiQA
         6P3AQVfsAeq/3+SOpehHCbuxfruv6fOJcb8VJ0+bYaHuVQArjI3ThApqduKmDMrrqLPj
         tsZg==
X-Forwarded-Encrypted: i=1; AJvYcCX0ImoWKsmJFiMTOVt9Hc3lhUMv6zI57/RkDgjppSNH3IRScNjZCfG0aofcWWM2iC3GcPGo+WTXzUooAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2gSaH10ZS0R/LTt+IcVuw+2Uhg6kaqo1xDk1UojHNoZtLYWhb
	KMPNjbdING2uzDBhvoZTAYbk6TgUa8Py8kBwMRLvNyXf9vx7vpe8JCmg
X-Gm-Gg: ASbGncubV5TrY6MKU9ssBbbzvgInrVGIAYV3GYb2myzY3C0Rw4GzuqplSsVMsoqSzNU
	nFtZklHKhTYwrm1HRcpFYzxVs1mPJ/qfPqe0gLIgF/j9EUe2PIwalClMzOMyPwyKDWi0yKhCApk
	a7/jjHLffHpf0K0+KvPe85k+3V4xxhnNqgamkgzgxNXjZyeLmt3sHMJifqLmUKo+oosISGZCkHm
	j2dwl+rymMGmB32o85peYMiHTTfIFNtOpAjXlUtAHCxeEhDLmALyRRLPvE/tcPMllpqbEBtvK7a
	b69Lg6bIcEgGXR+n74KkaHizVbx+Vh9Kuxqbn3ChgnBcdCe0pW1KdMJH9+ViRS8QbwlM8NecZcx
	CMHH1NWAwzIUHKbwE3jdzhQCgfQ8lNqcS7tMuJHonivhoMyqt1kLbkDkf80tV0sCv2pIJwQ==
X-Google-Smtp-Source: AGHT+IHtNtKovriM8w2pLkDHwyMQApqeD8GW60UnConeyFy7gFY99L8zBySpoiS8naABTGPgdJC9Sw==
X-Received: by 2002:a05:6512:159b:b0:592:f521:188a with SMTP id 2adb3069b0e04-597d6709d9emr571551e87.49.1764834921103;
        Wed, 03 Dec 2025 23:55:21 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:20 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Thu, 04 Dec 2025 08:54:53 +0100
Subject: [PATCH v5 3/4] rust: add a Kconfig function to test for support of
 bindgen options
MIME-Version: 1.0
Message-Id: <20251204-gcc-rust-v5-v5-3-2d4f20d86c24@gmail.com>
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
In-Reply-To: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
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
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>, 
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 Asuna Yang <SpriteOvO@gmail.com>, Asuna Yang <spriteovo@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_235523_621184_1D4CFA19 
X-CRM114-Status: UNSURE (   9.76  )
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

From: Asuna Yang <spriteovo@gmail.com>

Add a new `bindgen-backend-option` Kconfig function to test whether the
bindgen backend supports a given flag.

A subsequent commit will use this function to test for RISC-V extension
flags.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 scripts/Kconfig.include | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index d42042b6c9e2..5d4d29eed0b3 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -78,3 +78,8 @@ rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
 # If you are testing for unstable features, consider testing RUSTC_VERSION
 # instead, as features may have different completeness while available.
 rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)
+
+# $(bindgen-backend-option,<flag>)
+# Return y if bindgen backend supports <flag>, n otherwise
+# For now, the backend refers only to libclang, so more specifically, this function tests whether the given flag is recognized by the libclang used by bindgen.
+bindgen-backend-option = $(success,trap "rm -f .tmp_$$.h" EXIT; touch .tmp_$$.h; $(BINDGEN) .tmp_$$.h -- --target=$(BINDGEN_TARGET) $(1))

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
