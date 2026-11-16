Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AD4606A323
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HGAhjDQy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=qW6hQaet;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=evWE/L6E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=p3zUgSFWsvFF3k12PixJZ0Mjb2Sp2hM0I6J5KWCVmJA=; b=HGAhjDQyQYP8iilK8Zh/f5+hfF
	B5e18Y35pQ6VgJOhhXUcVluI2r1mEc+tyfCISUexwsY/ymfVYjDIdOBmHdH6YgJy0mTTNpAbswwJF
	WOn/wWvXi18SCh+am0iqiUhUTkpXeXu8RIw4PY5n99taNszh5scqKv12k65xaDsBudrCKjCiLeRhv
	IfeShnNTSWMYNp9Fw3ldqYKmDlje4RSd3Xjqr9N/shXXJM8adWqXv9lI56z8l/y0d4EIvkJD9ZWxe
	I880IyhXYnOVsuq43CSlj5Re+kar5acVNaJKawEY5TiJmMPC8hVA/Boi4vpmFpDzbziVpdH927kTi
	IMp2LAJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg6-00000002pPZ-2Ewu;
	Mon, 16 Nov 2026 14:27:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg2-00000002pJT-0K42
	for linux-riscv@bombadil.infradead.org;
	Mon, 16 Nov 2026 14:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ys9OiBJUlo0yeYgXBzy5BjlTE2/m4y7kU18rGSki1UU=; b=qW6hQaet5Mtva1uC0HadRKJL94
	pztZoabiJJJXIFVJsn2SHC3fnDbJjf0hyNtz6RpIvWbM8PZvk14at1vo66B9rfU8Bl3EoFoIv2g98
	BZVukD67eE4Nk8MoxMpffdDH7wPVhES7xPwmqkpMLNDKmZKGLGwdz/50OzXyL1C7hP1bTFB+2nWtE
	LxNTx39ZN2mp16GwskvqJQVBTKitLr9p2yjM1/wzo/saxTW1Ckq/dQFGvfQSJmW5X/xvrKqp+rUuF
	3iXRPwwoE+PFVJ9cpGn199YxOndZENqDvVy6xUccGwa/n4Rel/crwhKtGGkVTdFTlbEMhm4N2NC2q
	DpCgK0eA==;
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxfx-0000000Dvtf-2RvK
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:19 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-48e00f3929bso909216f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 06:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839235; x=1795444035; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ys9OiBJUlo0yeYgXBzy5BjlTE2/m4y7kU18rGSki1UU=;
        b=evWE/L6E7Ag3jVApOJchdaaisL19dxsDMIu4PwCQv/3q4xFKb/xzw7uidRxZpstVjF
         y2YQ2hZdn96Cx8zW3B3iEo8MdhJ7Ky7P6E1GGCVSDHK+IWlxUKwzxvTnmIE9LgUvuM5I
         DJyqHNyfHYA2dXg7vW7YEPRZ/jvSoDcfSLJVX6cMf8BIDa9nrmGq/ppUyZroYwusTNvY
         vlaoN4uIyP27Gv/N98w1dky4w4YhkJamAcBp7qVCUEMtEk9nKMY2++tJ+iDWuBd1oKoP
         8ci6mGVLQzQNFKMW2yOvOkCvRIK63mHP8k8RgMCBwB2ebA9yE3CmLWiUqY8sgPSgNbYJ
         Oprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839235; x=1795444035;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ys9OiBJUlo0yeYgXBzy5BjlTE2/m4y7kU18rGSki1UU=;
        b=MEULznntrOyNTwBaWzIOudAJ0BAx41VWQerpAXFOczuuiOjIk/7BjYcBruOWijxEJj
         Pcu70MOIzvLkv0wETy0ZvOKZmHPa6fTlQAHzNf4bh3+i+c9Q4V8KXJftOq9k70IagLfd
         rmlfP3GU8mRLoiIAg3YYYGi+I/iejgMORuNK/O/IEnPD2GDQ6Z/gsNtyjfA3Xr6LIZmy
         BnMPKUYlsj+iUbQcd1exWu0APdAWfu/GVS1T0oHsqZwsRkZiH2nZM1XOysMdvyoX1dM2
         z0/FoASaXp2sWq6LNfAyXr5vvrWor6v8PJVbCdGEERIUxsbNI4l1NJDUfXxlCl9G2j9F
         avhw==
X-Forwarded-Encrypted: i=1; AL+hErHS15L0Yqe4NRtA2ZOUlcO/GoYBfZfCG1g2SqFZDt2vRdscfztJct2VYmJfpabBg285nhoBy6q3gHfOvw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/L4oenVEf3W5VUYLhBAhW3l22aYBol+tXlpq44eFF2gUF//09x
	kEvPBbf0FnxoJNW9lZ0FDa8PFWmB8HXgdUOmu/1hXv5dkKZVxk1nrwgBTOVBbT8ifYfLAr+kAQ=
	=
X-Received: from wrbdt8.prod.google.com ([2002:a05:6000:d08:b0:48c:4566:c9eb])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6a0d:b0:4b9:f90b:1c4d
 with SMTP id 5b1f17b1804b1-4bb4e2d5f2bmr239377595e9.5.1794839234339; Mon, 16
 Nov 2026 06:27:14 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:21 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472; i=ardb@kernel.org;
 h=from:subject; bh=mmsq8s70dc7bNFJDZXgqjzymvtzE/nNvMalQITqcOTw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu3UJ9vcdyFG2nWGW/zz3w2eSlTsfeBxTOhJUZZb6ctf
 Vhnf+hjRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiI4SSG/z7r9Rf6bZwfUfP4
 kLHJCjYONxfmqZofN0xSXf/nxdmg0BqGv/IeFg0uLJvZl19WUD+yJqV1hbSMkWSL2P5b2xdw7/x oygwA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-19-ardb+git@google.com>
Subject: [PATCH v3 02/15] riscv: Use _stext not _text to denote the start of
 kernel code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_142717_785376_1740EE94 
X-CRM114-Status: GOOD (  15.50  )
X-Spam-Score: -7.6 (-------)
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
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

On RISC-V, _text and _stext currently refer to the same location, i.e.,
the start of the .text output section, which follows the image header
(.head.text) emitted by HEAD_TEXT_SECTION. _start is the symbol that
refers to the actual start of the image.

On other architectures such as arm64, _text refers to the start of the
image, and _stext to the start of the kernel code, and generic code
(such as the EFI stub) may start relying on this distinction.

So switch the only user of _text in arch/riscv, i.e., the "Kernel code"
resource that is exposed via /proc/iomem (and from which the "Kernel
image" resource inherits its start address), over to _stext. This is a
no-op given that both symbols currently resolve to the same address, but
it permits _text to be moved to the start of the image, making it an
alias of _start.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index d79f99b86033..e6112d424fde 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -91,7 +91,7 @@ static int __init add_kernel_resources(void)
 	 * child nodes.
 	 */
 
-	code_res.start = __pa_symbol(_text);
+	code_res.start = __pa_symbol(_stext);
 	code_res.end = __pa_symbol(_etext) - 1;
 	code_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
 
-- 
2.56.0.611.g1030f0b940-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
