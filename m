Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AAD606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 05:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jMQ39kJF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mUhgsrBG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qKXJmiNo5LcHTcKSOl65sEwviOyPd+LMzyqa6Dcj4qc=; b=jMQ39kJFUZnFIW+DOd25wyV1ww
	z3aFvqUgb5Wdh4KJj3GavfWzh64n9DQo2hW7k/NycfSwI8TiykpDRMpfHwbCQmaRDNRu4TTFebRME
	GGKI7Owh2Jz+ZSScf9LoFLwaVN8tRKoN92ARN+Cj2h7xt/QF5IiuSNhhpix+MYb3rYSqKAg67WkAo
	wx5LJVzTq5jNgMj6Mz3U32ZOtK0u5a7oGyjQVlE92ZnGbQcZogiLaA2DDWSH1jKUFw47u05Hwsq3N
	DCPzvG+uOAU39mzVU8qCdyu59/Wn1+07JqUoou9eM7BdGqf8wsRgJ0lqnznjENHLqIMvJowhl7qJG
	h63ELDhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIL5-00000008MdB-2p5O;
	Thu, 29 Oct 2026 05:06:11 +0000
Received: from mail-pj2-x06.google.com ([2607:f8b0:4864:39::6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIKx-00000008Mc6-4AKC
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 05:06:09 +0000
Received: by mail-pj2-x06.google.com with SMTP id d9443c01a7336-2e987949882so12404485ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 22:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250362; x=1793855162; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8F/HdGuSu6Gc0aayMmmYPmWYbhMQ7jikJBXSJ8mNwQ=;
        b=mUhgsrBGXL9631ro3DObxQ2sj6EhpJIDPYIldwjl0FDSSSJrJDgxMneBUkCZ0vcAR0
         M+s2SOMOtasLYZYWmO0zmsbiKIOwJiAjhr5P23VPVyAcsa5uVF1Hy0z4rqNtTVnTppCk
         SFWbANVd6c9bRZEFzpZQ/HhYuOZpLnEnKruYMoIAexwg3CTq/z4I7FAmIgnt5jFqEtAn
         dr7sXpCPHgzXiMZ5z+mHtyy9Ca8GpGiRnvfq29gSf/TFAljVwlS/PXNJFnqavS12Ef5u
         gnYlWdH6J8GYkxgaFLLMOwh+t+X1mGiNCQA8nrajmboPrI/VOUPfV5t+DN81KTzV1yVL
         QSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250362; x=1793855162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8F/HdGuSu6Gc0aayMmmYPmWYbhMQ7jikJBXSJ8mNwQ=;
        b=gt1pVV2ry0hySkvBPKmKqPmjKFfu9N3kfrnb+HDzNGNNjxqseEyyqBaH7PCKuWAFrV
         gdWl/XTVIDN8J/roOdH/RqAmGLocmQzxycJUa3aJlFS3/D5k4xzLnicmJCwA5V+Mvx10
         dn9rxOAWfzs8JYVfTvgOzgMm4F04B6ZeUAXMnp7fATy1pp/7eVnWgiTcaGF1v+H6+buy
         J3X2WE/ur+E7/88eC5bxnDndMKnO4St0MeVtDwB98zecT4IyPbvaFKHJv5pcggDaojMo
         PXAdcM0smq7+fkHyvyFYjhNwOkkUa1i6RybbRfB7qyrLQViSIY/uRZvPmyIU9nABEzt+
         Ucog==
X-Forwarded-Encrypted: i=1; AKwUvByzNPXIDdof4QutvQv0ELJf46yNM+JQtUAJkTWX4e5hKd43ldsjVBh6+d9BddBwNZkCzd5Fo7XJssNJqw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJey0sM+HIVXiHViGKowkPJyi9QPf2yh4099ABtBvM1lwpozG/h
	xCl7oMZ1V8BXqOkoUyARn1xA6YMOCGv6JPY0XQCcxpm+YYL8PinCBiRU
X-Gm-Gg: AYBFou1sVg7NwZZvI0V6Jvj+sUp/YLI0u5axX1mpu5zCWu/Yw7AuCIAJyUr2HhbORPI
	UlpyvS6C6RDyokjdiz7SlDgR1gnuvCdBdeEiqYMiDBqfV3aaLtbqRctJDhQ9yq+ksSusdqCqwQ6
	sEGbF4E58jfB4Gf57ysjLbaK4xpORecrietfC8fdl/9m0Noffev3kJVey95zFeNNnNuumtCsOBu
	17VXGxVixTpE1x8zTKaONyO0gSVplJ1uV0NWh/h8U+zTQLYCW7yxrSgrdEUl0rUOEWY3vwFoLRZ
	hDRPCRRLxMqMgv4ikz82BJZBpeuy8r/t/WjSlb8I5pqIhCxtFcfqReuLOvhIppnRItLrGjL8Ic0
	p9I7xN+HM1MM+TV7PwqMwZXRgWoXH1UD821n3qjQbGowPr9EvfJJTV9ZpWlASojxmo3D7nwjPhy
	N1X+KlsEbgvN16m4mv8OZj2uxPnxixuFI/09QAoHgNZAcvA+Ol08hrXYaKeWhkSjQTWBGtq7qLR
	KGx55zonoC18hw9T5MG2zlnLyl9qy0KPAQUCk81pk2PPil3OMIVmARZXZ6AKcLsFSydRUgk1byK
	2AAftVTvx/I/S8FjtDoGWpwVeCd9
X-Received: by 2002:a17:902:e88d:b0:2e9:5714:6081 with SMTP id d9443c01a7336-2eaffcc020bmr39772385ad.0.1793250362514;
        Wed, 28 Oct 2026 22:06:02 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:06:02 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:42 -0400
Subject: [PATCH RFC 01/12] dt-bindings: vendor-prefixes: Add Bouffalo Lab
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-rust-bl808-console-v1-1-b736ee920078@gmail.com>
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
X-CRM114-CacheID: sfid-20261028_220604_662122_A9DD9B91 
X-CRM114-Status: UNSURE (   7.90  )
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

Register bflb for Bouffalo Lab Technology (Nanjing) Co., Ltd. Reuse the
prefix already deployed by Zephyr, including its bflb,uart binding.

Link: https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial/bflb,uart.html

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1012f08e26f7f105ad846ab3629ac..24c670ff75b6f482ede1bda3b59c70ed9116042f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -249,6 +249,8 @@ patternProperties:
     description: Shanghai Belling Co., Ltd.
   "^bestar,.*":
     description: Shenzhen Bestar Electronic Technology Co., Ltd.
+  "^bflb,.*":
+    description: Bouffalo Lab Technology (Nanjing) Co., Ltd.
   "^bhf,.*":
     description: Beckhoff Automation GmbH & Co. KG
   "^bigtreetech,.*":

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
