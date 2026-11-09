Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CEF606A323
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 09:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lSfYxeRV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GiU7Bxto
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=21VxgAZwq4yK58pk/GuW2zKjBq2L4lE/mnp9TdRm9xo=; b=lSfYxeRVlqkxQknMllr6Hj+U0M
	5MKyj4eM8IVM8CVRZ/eTGuZfik1KTmHX0o5vI0tep4t1ESIXv5brwnxGsVbWWfJVmOilgsFhuI22W
	/ipxgAirL93t3ioF8HJEU95nt/olj3HzPI6LFpFPlFzjCdmd0oyFzPgXiZQtt5Bad+zQROxjC6sfT
	60jjn+zGgT081MdEbXKkXaT6vKDgOnjXLzWwJQ4vjKMkve/WcwvxFndJ4vR1RWlXtpJph7dv6YluW
	Wln6kbULWd3nnndZaY1LQrddyYdHFhhnqaoz/syRv67GqxizRR5yCWqf+mZ3KgIAVw/goLAK6Yd2/
	U7gdnlOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQM8f-00000000Jcb-02rI;
	Mon, 09 Nov 2026 09:58:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQM8d-00000000JcE-2rl3
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 09:58:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 385EB45791
	for <linux-riscv@lists.infradead.org>; Mon,  9 Nov 2026 09:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FC11F00901
	for <linux-riscv@lists.infradead.org>; Mon,  9 Nov 2026 09:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794218287;
	bh=zRxoDvJqNHWKSGKGDlWFVgI4JaCLH8YmN1Nmzj2nWUE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GiU7Bxtoaybvkr2gAUT3yojx7KVrIQj5sQtwNARIabBI/Xz1yNaf9KfzSNkjlh9UH
	 FLVF6kd6xzvAa9r+rdhTrAhRwKETpbM2boIYE/kM4Ftwc6As5sVXrG8DNuLKfvKSbR
	 O6iQtYcMB7B8lLupSrYY0sMVM0rPD3QRJni/DMt4/9wpLv2olp5ZR4HSRgiDb5owU5
	 /qBaAbYj/x9bDyvOYEg5V/636GMO5okouD3Uw2ckMRp1JT0Pe8hbdsfv/7iCWSeEBH
	 gjCawLRRjst4hmR66QFBP9pNVOXSUAJOF3cPYJ98lkOcPhattlx+4gbZ5GbQQD2L9D
	 LwRuHpj0RxkXw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c14f6f58aeso462372e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 01:58:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH3ZLrvQkb0gUgZBuSy/KQBJf22L6MTDjYhvCBwb0+iU9N7OdCN1+78kcO7rBML/e+BgFilpTqCa8YNeA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/oSwkeB+xPYiOYKMERBcaw4zGU89V6zubQkXTmUvMoJ7pZeq2c
	kHtSeAoNHaAmI7uXnZOwatgVdZ2eSy1jKMP1fLKPwumKEaVMyv5Ix9I9qBJaYFFOSdoBWKs0wDP
	eGFf8K50VVUAnmvZnxvO2M9Ms5Xo3DXM=
X-Received: by 2002:a05:6512:438e:b0:5c1:4cad:c31a with SMTP id
 2adb3069b0e04-5c14cadc385mr777117e87.63.1794218285785; Mon, 09 Nov 2026
 01:58:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106-dmaengine-subsys-v1-0-780eeddbf3ef@redhat.com> <20261106-dmaengine-subsys-v1-2-780eeddbf3ef@redhat.com>
In-Reply-To: <20261106-dmaengine-subsys-v1-2-780eeddbf3ef@redhat.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Nov 2026 10:57:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLmGtm2wv4AccJ9WscJv1sWv5E7CNf025O38TAZh7qVa+A@mail.gmail.com>
X-Gm-Features: AclHuK8oK7P6B9InDKuo8Ak_aj4mmjEASZmzu1jiS_QJYKoqcrqXJkxA1OxDiQ0
Message-ID: <CAD++jLmGtm2wv4AccJ9WscJv1sWv5E7CNf025O38TAZh7qVa+A@mail.gmail.com>
Subject: Re: [PATCH 2/3] dmaengine: convert to subsys_platform_driver_probe()
To: Brian Masney <bmasney@redhat.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Zhang Wei <zw@zh-kernel.org>, 
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-actions@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBOb3YgNywgMjAyNiBhdCAxOjA24oCvQU0gQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJl
ZGhhdC5jb20+IHdyb3RlOgoKPiBSZWR1Y2UgYm9pbGVycGxhdGUgY29kZSBpbiB0aGVzZSBkcml2
ZXJzIGFuZCBjb252ZXJ0IHRoZW0gb3ZlciB0byB1c2UKPiB0aGUgbWFjcm8gc3Vic3lzX3BsYXRm
b3JtX2RyaXZlcl9wcm9iZSgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxibWFz
bmV5QHJlZGhhdC5jb20+CgpNYWtlcyBzZW5zZS4KUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWog
PGxpbnVzd0BrZXJuZWwub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
