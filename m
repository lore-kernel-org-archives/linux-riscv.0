Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5F660A2604
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 13:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w7HbPC3t;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MOqxU8e+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=gvxuPTeHPSEHZh1XsyBcQlOW8HC+PAk6KPpWeHur4Ak=; b=w7HbPC3tbGmT/SSteVEybq4YuU
	7+p/BmPQQIDArN+ADhH/443O0ucUURcIT52xNHcv+VaYQVBuPqbpQXG5kEGLgRAScd1e6gqiLsseI
	QMm6x7wQWN/tTXUAEzFb62eutPXj4epRgF0KMbKBPI3uoJBQFVGn699AI1jbfJ/LQsl4Krur6m/Nv
	XUa4VqVqXGMBmDle7JjR3bMFSc8ubdAwrN63rvCe+a66qj4Fe8pXaPZ5ygLAwagCfqwbqNBa0Cwe1
	GFLmKJ9QwrUEFrwl31ahIEbwUxdYf2/GNdY858TwACdr4nDRxfLKzbP4bMftAf7kFBqk6DIbhf5D9
	gvoF4Wmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg0u-00000008zgc-0aes;
	Wed, 18 Nov 2026 13:47:52 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg0r-00000008zfy-1MfS
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 13:47:51 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48e0fc747a7so660504f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 05:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795009667; x=1795614467; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GdCVP+3hsbqBtwLfEed4MNYxez46hHZZfSVgWwld1kE=;
        b=MOqxU8e+KPSuZ3N2vTmzXgK/G/Ml6flVSR2dli4fr3IV0EOJ6AzhOFdv39hKi1I6ke
         zoTZS5IwxmrSpu+EcVTMtb4IEBZkND1K2CVZtvqhWWg81YEh3zSut9ed2ajYiDhTfNDg
         3v/1br8745PfaDHxt9PhbwLky4vjbmJbr9vMaKc+nWfwsAJO/5DMQodd/gN3nqzFKLTi
         LyYgBooen51iNJpRIS8OajgATExWOhUlM8EdyIHpOOJeQdV/LoJUUThNWkzYHGL8dC7E
         NBrghq8OgHT2PahBMOeZAtNKSX6p5Rr/XIx3aMcXq1E/y1lqBf3zj8tc9PLlbpRMf4Qz
         PB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009667; x=1795614467;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdCVP+3hsbqBtwLfEed4MNYxez46hHZZfSVgWwld1kE=;
        b=O7A6sWMsldGizC2bFRAwo7xKyWeUKfTfPiO9EB397YLsdPsICcmOyYXeb9H4XJSKSY
         B4rqRKsNrh5qAFWOcr4pC+cUgBSBcRDvKZC1iHOMrcPHaLa27nWgpEl89NWKIDiL51zR
         3Tq87gcQZitvZWn4MovMcivqJ10Iap2FHObf0uYSHSJ2Xn/2OYWGJ82CMO8bjaNRsVHZ
         6y9NxOPD/JhX0VTTQ2OohQuP1PY8LlTWCbfU8+zieXdva1u7HaVm6ZxvSSdtiNOQcXlP
         2U9XoBO0LUoM4LXMpdF+j6mfZ60DaQg2oStONS2uERtvjYukD5A4ZgXG2EdLz/KfPDLx
         cq8w==
X-Forwarded-Encrypted: i=1; AL+hErGT6DTYLojuDD/emtT9RqObfU/SSLBdMxNVWoQdfUWMTmwGcr5rJkbLEcNAiKz+NDjhNPqUrsPUDZBk8A==@lists.infradead.org
X-Gm-Message-State: APuU4Z8HxvATEbL9b9yRr+mGyoh50RjvZsLC1QmZxGZHt3K6mTuXPwLa
	xFvWZxJSRdXJnPWOubClBVkavySkvs8ybKvhwiyeqHuDohn04aCwSOhW6s4OGrQOF5+c7XEiXQP
	np5pi0nlyJUm2pdrvBg==
X-Received: from wrtc5.prod.google.com ([2002:a5d:4cc5:0:b0:4a7:85c3:7bf9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e009:0:20b0:490:1881:80ec with SMTP id ffacd0b85a97d-4a63a895742mr4177613f8f.36.1795009666290;
 Wed, 18 Nov 2026 05:47:46 -0800 (PST)
Date: Wed, 18 Nov 2026 13:47:44 +0000
In-Reply-To: <20261013-clk-type-state-v6-1-a5e9977b3509@collabora.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com> <20261013-clk-type-state-v6-1-a5e9977b3509@collabora.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118134745.657917-1-aliceryhl@google.com>
Subject: Re: [PATCH v6 1/7] rust: clk: use 'kernel vertical style' for imports
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Maurice Hieronymus <mhi@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_054749_372133_1D7956A1 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBPY3QgMTMsIDIwMjYgYXQgMDI6MDc6NDBQTSAtMDMwMCwgRGFuaWVsIEFsbWVpZGEg
d3JvdGU6Cj4gQ29udmVydCBhbGwgaW1wb3J0cyB0byB1c2UgdGhlIG5ldyBpbXBvcnQgc3R5bGUu
IFRoaXMgd2lsbCBtYWtlIGl0IGVhc2llcgo+IHRvIGxhbmQgbmV3IGNoYW5nZXMgaW4gdGhlIGZ1
dHVyZS4gRHJvcCB0aGUgYFJlc3VsdGAgaW1wb3J0LCB3aGljaCB0aGUKPiBwcmVsdWRlIGFscmVh
ZHkgcHJvdmlkZXMuCj4KPiBObyBjaGFuZ2Ugb2YgZnVuY3Rpb25hbGl0eSBpbXBsaWVkLgo+Cj4g
TGluazogaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvcnVzdC9jb2RpbmctZ3VpZGVsaW5lcy5odG1s
I2ltcG9ydHMKPiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QG52aWRp
YS5jb20+Cj4gUmV2aWV3ZWQtYnk6IE9udXIgw5Z6a2FuIDx3b3JrQG9udXJvemthbi5kZXY+Cj4g
U2lnbmVkLW9mZi1ieTogRGFuaWVsIEFsbWVpZGEgPGRhbmllbC5hbG1laWRhQGNvbGxhYm9yYS5j
b20+CgpSZXZpZXdlZC1ieTogQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdvb2dsZS5jb20+CgpBbGlj
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
