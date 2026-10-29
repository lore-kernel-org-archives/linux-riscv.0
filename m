Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761A2606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 05:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4fQ16Cb3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K1W1uCX5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4XBZLtTHlmD6yf+tBAw9T6cIDMZzdfVCC2vbK49cbeE=; b=4fQ16Cb3ZT6pTc1HWHOUy1sIbU
	uY9vGGL5ARZO0WFq1cVk6rdHcD2tpr09ZJauV6LbrR79lXZ1p32gLddreKpSFIDG2jKqxs36dgN0x
	8hOFPy7vhv7YOFD0ZAQ4gI7psUupKeAD4Im75qVBuEamOkVxMk2WRIU3WnTs/sT+TJHPKcrYhb4s9
	wBAssRf7IFcU6TvnFAEbkCKgLqRu+SVBjoRXBO5KGDnntntKlN9RaSRDy2BB+KTVnNNIaro/NUF5c
	QDR0PCU1ncrIVU7ELloxfbAsj62E1sOvKFMA2dIuDf18o1YpzJ1IJ4FSBk4UKAeMSebyrZm9cOpxw
	Hmq2+Mpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIMW-00000008NUS-3qCx;
	Thu, 29 Oct 2026 05:07:40 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIMT-00000008NQO-16aw
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 05:07:40 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2e831901331so13447125ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 22:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250456; x=1793855256; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXI6IHEoyVt3a8/+pcNKwK7JZFFGDNWx/cQqbNDN63Q=;
        b=K1W1uCX5CO1Yje4YNjiaMXhDjPMb0OF0FzT/X8VHuxuN8lks+RA6IH4GdpoGwmSCsQ
         px+ds+6em48C9kJvakZcpSimzFxlsPChNjio0CeS1A5V6XF+Rh5Gdh5KsPIgw2IowgvG
         Cq3rmwO0IV2e2Dl0lIRexxcQoeWDWxRrKxg7oaKA5Abfo1yqsVoJuJ/m9qMv3MV0yhqF
         /a3jGuVUzr/uj47eT6vxqOF9EjlYs4irO/IW2dSeBTjLdScDwsNTlrprBNH3WtTeK1EW
         Mp+gnH/B0d85jao1+iVcqczBTQbMIjiZMNUoib0tIX6N5iu+MVu05gLxMk6pOSQ3RuMW
         /iRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250456; x=1793855256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXI6IHEoyVt3a8/+pcNKwK7JZFFGDNWx/cQqbNDN63Q=;
        b=FAco4roFwjsfh7qsd0PdnY9feINXkaw0sHCujH5WMIjsjrHvjvZbN55K22FpLei+zw
         hUFlAkLjVb3ET8e9zShtlTdkup1G8vD6yZcB6j/QB0eTgnHtMBbPfygzPY71n7cqN6Uh
         V9qPk3Li8dybV62xA/xEWOKuvgTryGQ/FQ6GRuXxqhUjvsmMIghOZjN+mabIc/NFQhWL
         B4icL+oMnaX3ufNaVTJItEoc6OeSKuSiuQSwPcTTZPXmMn5N1LZw0bEdcF2N/9iyvh2V
         isjhIB0RDpWAphUZtuzqc0P9LL9yCUDb9Odj3Y1ySg/ghEEIWEkSmiGQAwJgPuV/iPiJ
         o6Tg==
X-Forwarded-Encrypted: i=1; AKwUvBzavh5yc0eiTxf2tup2mnHyVn45gCGYEbrJHCDzOsZxX4H/3Hbf2PL7MMyNUAf4AU708c4JKqnK2CTIhg==@lists.infradead.org
X-Gm-Message-State: AFq9FYITB0XrXSU5/4JpU2lYjJG0pGH5WsOhw/kJpvpredRwDmg/iOXf
	xtntuC7yFms54EDW29InqENtBb2vqEy+/ol1rQ6aHuB/y2fOgQQekCcz
X-Gm-Gg: AYBFou3myZrO1aFQsI4uxHiSUcH5k+STOrj3z2iXzD8ZDvZoEBzB3FK8ZoJthP2IjAq
	36JmunPz5c+GV1rMb1UPByDV3Sj8WqM3lcZuVjDvI3re0bVu9SpHAavoa9s11McgYqs5B0Pof31
	siUyGUcRr+vhyp7ga527iO/0BLaG0MNJJalYnSp/vCn2PS7Tg6+8BYfGSCbaLuX3aoLb0cV7XMq
	6YTtWDfCadHos0EBeeDxU3bdhlvr2E4R+ESS4LNlWnonxUVhCj+jShjIYkzAp5GjkZqfTIQ7pNt
	ZbghqPnpL0B/prkpgkQ8ACUlPYQdd7OiPMt6+ZF3HVyZ0CiFnPdgHOd+zz/ufBG+DhH3w9WwOOE
	5dWciV9+l1rbotPw7uQOFkVAmwTqeow6+kUD/HkOqEO6KGSn+0G9kurBDYLBFCDii82PFmokxrv
	CTiEeztdLX7LGMTkctbG2Pf47Oj5xjkyQCLrrCebRZ+VN3jkkj2mRlRob34CkMKZWS7fPX6YmeL
	9myukXGWuZH72/lUR4CKqFz05iPMgTh59qdv+hfuHnbnvUDcw9zD5OYOlnpf8Hz0kcrVqQa4Ao5
	bJA3xYEZRiaBPmRIQfYFnOshYDeO
X-Received: by 2002:a17:903:38c4:b0:2dd:ad73:c93e with SMTP id d9443c01a7336-2eb005025a8mr38954575ad.31.1793250455691;
        Wed, 28 Oct 2026 22:07:35 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:35 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:53 -0400
Subject: [PATCH RFC 12/12] MAINTAINERS: Add Bouffalo Lab BL808 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
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
X-CRM114-CacheID: sfid-20261028_220737_327298_1F421437 
X-CRM114-Status: UNSURE (   9.93  )
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

Add a MAINTAINERS entry for the Bouffalo Lab BL808 platform, device trees
and Rust serial driver and abstractions.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 801f964899ba790a8f71fe61f9b3777a494dabd5..b76d3e168468bf6139c958a81b626c73b422c0d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4926,6 +4926,19 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/imu/bosch,bmi323.yaml
 F:	drivers/iio/imu/bmi323/
 
+BOUFFALO LAB BL808 SUPPORT
+M:	Kwanghoon Son <asdfkwang@gmail.com>
+L:	linux-riscv@lists.infradead.org
+L:	linux-serial@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/bflb.yaml
+F:	Documentation/devicetree/bindings/serial/bflb,uart.yaml
+F:	arch/riscv/boot/dts/bouffalolab/
+F:	drivers/tty/serial/bflb_uart.rs
+F:	rust/helpers/serial.c
+F:	rust/kernel/serial.rs
+F:	rust/kernel/serial/
+
 BPF JIT for ARC
 M:	Shahab Vahedi <list+bpf@vahedi.org>
 L:	bpf@vger.kernel.org

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
