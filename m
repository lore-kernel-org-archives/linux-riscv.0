Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33B4606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 05:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tMiQ09Yw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bhpkt1Wo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lNZa+Oiar7U6y6/gCBS5GWsZ+APdG6PfRicT/3Xhcj8=; b=tMiQ09YwkwWBOY5Xz8sskZANxS
	bI7HjoqLq5i2/5zCalp2bk/BLZlELBG1KBAZT3+0O1u46wbGsuX/2cvDnjmKBxSJFiTndNgia8mgL
	XOexlgJ2ESoPWaYoG9xp0gQnuKjOod9T3sAqTh1YT65NoPKgktHjkzkM+Xhm04+GYdIDaRFwaHEz5
	WKTtDMC73pR2QWYsCLQg7i0Q1LLoYRLKEY7uoTNJqgijoXlJbdDP8++5QwPbucMZiydmQ93e2w3Xw
	2blEvEIwZ3Q7yu8+rEH4FO3fxCOK01K4wiD3gTimuKs7qWLAR+pxtLJxhQa85y09rFqiuH2cCWUEY
	+z1+K8sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMILz-00000008N2S-1Uad;
	Thu, 29 Oct 2026 05:07:07 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMILv-00000008Mzs-2srG
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 05:07:05 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2e946155442so13511385ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 22:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250422; x=1793855222; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qf62xHUcdwxTQhTGo7oUzUtykTsLWeHZ04Gslg9ulB0=;
        b=bhpkt1WoaSyaLrj6SrI71Uw5/IYChcRLNnRIh9TC1mPpIx7c8coEif4FI1jxPtEaZb
         ShDBnMguDPO3+vShJT0dmwbgeVjqx466FUhruMox1/TNEFloZcgVy8pXdPmRb6TdfsFn
         X5dFnnFoi4O4yhXYbsGVdfonoXkLXlrlsoaYiLyiy5Jwtxy9npFAiAX9B3b52SPmWhZt
         20aX5xdFccMWdNs+fikMRyuTAictfeMKCQ1RTKQ+Fi54N4YnI5SD8nNMfthvoLnErVcy
         an+y6yHQrcxZ2CX7wLh4Rx0YPPOCQZfP5eonA0hwpS0kslSSBQ1sIRZElsidSsYkvBNJ
         tb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250422; x=1793855222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qf62xHUcdwxTQhTGo7oUzUtykTsLWeHZ04Gslg9ulB0=;
        b=j8z9oUtw80Yg3um9F7WW0M11fz58ei/BOJpmRsCXNvcerea2ea/LKXyIf+G2GbfgU3
         eLVTiP5U67/XgDLsg9UBxO61GQTyUMhWv/TRvlhVvljbIGkt7PEzZrnEyMzJ/Eo92Hl3
         BNW2tgcvwsZhYJopIfOG6tukpNEFFUpkiHKkaEM6B8NzU4qvmwWnNZ4rBmscJ4L9Bz2L
         OTfsaE260ff7BY2nTwatzXKucFmZ0l22XoSED+/30AO99J8RiUa0Furk4AZpxUbcHa0V
         8NgQAUmvth+2NO+dFDkqvKYxMqZ2zPcCn1N+lWMdMtyxIzrNjJsGNkmFhDMv7YairQDB
         Xo7g==
X-Forwarded-Encrypted: i=1; AKwUvBwWgnnIaRQoP19YFUpIdhWsXBsr68YSxYJcoP32d25GOG/V6YE5RNDBxTcDC3i2XIAYDfRhS6yavy9U6g==@lists.infradead.org
X-Gm-Message-State: AFq9FYIGSOXo1YfMQRdYKeKK7ZnPT0+qUzQOfetuA7OmywKXo6A8bHvJ
	cmS4vz7PI9flSGnRSJDstVtFhBTV01mAO7rIHGwk2l1d9hNa2QCmWirN
X-Gm-Gg: AYBFou2oFDGfabaz7qmckV/9+qaC2fLpBK2BeFFloeca0BawEufheeGbyczNX+vao2w
	RP0fpqVWzS0ou5ZSnoTB+rhicxr82p3LmTwg61rcnTnnO0XAW3F0NWe/Q1mEk7Sf7NG+WJXfwvs
	BkL+FEFpqoY+NO9IWTxGOHSYtUSl8GusSXdjsT3WktCw9zL5kdxlEToKgltwtkqXLusvGAYpgPp
	i2pvL17Je3Jafpr2yYJBcThqYqJ6cFWU2VRdN5nFwwYV0TCR+UiwWw05UqoS9xjPuTUWGCS/W1Y
	GuJ55RuSJ/flWcAlp244YRBcJA5JuVsFZeD+BfXAIFVcsSZu3ryRbCy/DuDDthXqAnvZcV4Qe29
	8Zx1bcuUzfxxMJgBc5oYxRmp62d2oOYKLdL+HbbCPekirAnEyB+IUfwd59S06lVv3WQCYY+e1wS
	+XDfGOvDidoEKmktIA9mvbLQHWNSqC9gMxLrpqsSdbY1hJ1mF/sGfmwCOPxsnv+BjrfpfuYEJdt
	Rm0yGBiVKlQpWV7DRcIa+KoCckRcOsJwCkFDQXEUUYsOSSLsJPcHL8Lxh6xDEFLhVTuH1OFU7/h
	a5v0KDviPnsMvtcg0NpxAqxDcCsl
X-Received: by 2002:a17:902:c40a:b0:2e9:4048:3031 with SMTP id d9443c01a7336-2eb0054029bmr40770025ad.39.1793250422229;
        Wed, 28 Oct 2026 22:07:02 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:01 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:49 -0400
Subject: [PATCH RFC 08/12] riscv: Add Bouffalo Lab SoC selection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-rust-bl808-console-v1-8-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_220703_767557_D37F8DEE 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a platform selection for the BL808 64-bit D0 processor, including
the T-HEAD errata and common clock framework used by its UART.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 arch/riscv/Kconfig.socs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index cecbce0c498384d3283ed23cbf2514391eee361d..ea4667da7716a9a8d2ae156c422b277064b42530 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -12,6 +12,14 @@ config ARCH_ANLOGIC
 	help
 	  This enables support for Anlogic SoC platform hardware.
 
+config ARCH_BOUFFALOLAB
+	bool "Bouffalo Lab BL808 SoC"
+	depends on 64BIT && MMU
+	select ERRATA_THEAD
+	select COMMON_CLK
+	help
+	  This enables support for Bouffalo Lab SoC platform hardware.
+
 config ARCH_ESWIN
 	bool "ESWIN SoCs"
 	help

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
