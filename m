Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1EB606A698
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 18:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yjD/aFuj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xo+zNHCz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1Dl+OCpPcD/7+9hpRzpuyc7w2SDVhHCz0FvS7yWty1c=; b=yjD/aFujN9bvaWL0I+oPbW/oHz
	MgaLw0GCa7oDXwYE0jwhjI/3AXYZmqKC749WBFgExwiSU/yKnttsivM+kVQ5/fchbwJfMl+0hr40z
	nmw4dhQQderuZPMsP679aafXDXwbwEA48K0FCuZjvaVSnCIg7Ala1o2lTU6WSCm0PJN4z6tVT9+7E
	NPmtci0YHGj/+RByOj9XhUOP6CSEAE1unKZqWszF5Y8NECndDjpsHwYVadtAphMDMQ7Sv267CSLnv
	fFcc5RF8nfzic1bfPvwt9XvvEK7eJ/TCmfILCP3xmZn5S9G4MOnfznRxYKWbydoxT1Rzo0ItYv5xT
	4WPz3/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzH-00000004WOv-1KZM;
	Mon, 23 Nov 2026 18:41:59 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYz5-00000004WIz-1fNY
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 18:41:49 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso2595017a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 10:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795459306; cv=none;
        d=google.com; s=arc-20260327;
        b=Je3N9ARtO2L0UBsPySoXDivpLMCX/3lph+33YlyacLX2J5Od2D+FQmhhOxCBZekHsc
         ZQCGPTPJeuEmx8id9V1AGCHnd3nHu/TEFRrksvjdY+FiRt/FqKzLyNnMLYvWFbaTSsbq
         ae5SC4F9grWCIEiA8U5LJ08zoAxNDKYrJUzk0Tc+tUdBp+xYldZov6TqTHa6yYfeKQ+V
         93bwi6YUjfLVhytlTYZYamHMOXXpG1d9iY4OZPHtylrsWXZ/55D1m16mEgn7GKz+FDsd
         3gmRLQQkIT7hsh9Mug0dDa9vxbljT2FrD2nGYvHmdfXtEOOpTGgpn6ZtKEhRgU+SQ4Pe
         S6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7KCCFV8c12xHGuVa12sa42pR/GvO+E15oZ8scml+fpM=;
        fh=c2WvXEnPXgcP5R5mvgQ6ZsavGSQGMqZk6GePEQyH7t0=;
        b=UUK066yxe+P/DSQtXS+KNeUHGeiMekRJ2khKdLqUPo4TImOKGCNcSMNy1eVveFARUD
         yiP/biz335G+InuVHsfkhy++i1ihjPLgQ8M3qeJ7glOCOeJBZG+WsZBi+zIahUICBbR3
         rVEVpdCDnznXQIX+l56nBzpwIcaK/Ocgae21rA1vwZJre4yWfWy5wATf/B1I0C7mlFay
         jEYm0UqyIjcKBze97qX3waILbK6zJFLyoj6wCb4bO9/BZGN7mml3ERvSxePfJk+qBi3V
         WmsCWkizlp0uS+T55s0uu7dUKcI6Vq9xhjJNgHEsnIJ+uqgUyJxBSANpn+v3JZTCbIWT
         3DTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795459306; x=1796064106; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7KCCFV8c12xHGuVa12sa42pR/GvO+E15oZ8scml+fpM=;
        b=xo+zNHCz2v3P7ROhDu3p3w1MB1Jzd2bR8M0WoPaehQETdtIWUISkxZCJQvMXbXwoS+
         MhlxV/9qSx/x7QsG8Ptr9Qu0bfKI24Uo+y9Iw3JBlu1oX5fW2xcMm0HNTuptDm25FImZ
         PQnxCXVy0IKXYg8OjYTPCN0O4UXmH7lYju/qASAbKJ0J6tvu2U3ae+iDtqFKkFpQEMnP
         DMXbXcQy4aNvw1vg5+QPAYnhQ/6FD00wb2nrPo1aP9oboieVEU+aglQnaV6WhsU22kXv
         AS8q2o0Ggs6nQ8KvLczk6biR3ZOIB9n94MnqZZZCWQ/3HyT5+nKIuO7KEFT5pvt6HNEU
         Y15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459306; x=1796064106;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7KCCFV8c12xHGuVa12sa42pR/GvO+E15oZ8scml+fpM=;
        b=u6Qzedc3LL7nzzdru4VHQXI5a9p3qS4YSP2D6c2qp4NPgdbWzQnHIHxM0TRUWJiYGn
         9kMRHYcYO5aJ9Vg0PbnTNwhTFNRg8ogZtSFgTsykGIa1RF7oNtCZKwsBRWRE2VVsJysK
         Qx/10gC3WnToy2fPxmF2RnYURrIomtoNTYDLcpQJcrVOQr9MEwptENmBWASMT1eB+dD+
         gvp2s9f+0DSGmuwReAoDVY5WhFkcJIJeQZK4ZbEup3dV18yoL+azr8/ahR3dvxTu4GOU
         R6tyaqrs++PUT1WsaJhkp40nr8TGcs66q0MbZewBDStG3e6K+X1AoPhGPGI2aROw5VRl
         ZRPA==
X-Forwarded-Encrypted: i=1; AL+hErHPmOXA8GL0CSXA9+5gfPqgG9sVx2592SwLkfnY12bZazDkDBDKT+ubM2OsGwpv0VnPVzP7e62Qz8GBYA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9BMUOColN7Mr2frzsv4qnFPYno74429ASdRY/I7wyULnmzrqkm
	e+XEAwbl77usxwO/ylj+VDvL2ov4kbW3BNjC4d4OuyBNnOOBkejhx4LTC5oxpwxS7zvVq7p3yBn
	WnqEnh7B0Ukr5G53LDjlnZ7vc/Jf8GoE=
X-Gm-Gg: AZFdTZcBigCADdQ3X2/CUmiyAy+6C+kYNqQVp68vZQkewqPn+n1I7sUxGq1dhr7N/2a
	GioCw9aItEu+da7Q64nrGTjD+vmWdV8ZjyKqF1/6dEhLm8jUgVzMlAwwjeYp0IyM8wMlmxOp8ap
	Lln0dIkXYiugpzvFGrOCty0l9uHPMZi6k5CytPtQR/raNaChp6xYN6E33MXDLXstTME1bjMCIjK
	vH3ODLn/tPg6TVnXtwj+SnxUagZca/ZHPb1xGQXy0gmoBqAdkbV/TXY8z/cr5YiXLgxEEE2dYrf
	U3dVzHTcF2TwIFI6GJbgMmMOWyPceVwbHzlCLMZOeXZWWOdK8b5mjTf96V17alpD/rpHOp5qIU+
	RN9inM/bexPvI29ZsilSY8iV7234xYGrnC5Mv6w==
X-Received: by 2002:a17:90b:17cd:b0:3ac:6fcf:91d2 with SMTP id
 98e67ed59e1d1-3b41c8fe3d1mr11633543a91.19.1795459306227; Mon, 23 Nov 2026
 10:41:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com> <20261122184434.545341-1-frederic.mahe@cirad.fr>
In-Reply-To: <20261122184434.545341-1-frederic.mahe@cirad.fr>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Nov 2026 19:41:00 +0100
X-Gm-Features: Aa3M54rYymnQncJINmj7PXylw19m9Q_Z0b_H3MvffZyCzTJDH31b-Bzjr4MRK-U
Message-ID: <CABdCQ=PnfXRd2=b6_yEN94RCRvPnWx-WFfHZDC+jhHv_UFZ1ZQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: add PowerVR GPU device node
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYWjDqQ==?= <frederic.mahe@cirad.fr>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Baihui Liang <liangbaihui@linux.spacemit.com>, imagination@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_104147_465125_82644DEF 
X-CRM114-Status: GOOD (  13.51  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRnLDqWTDqXJpYywKClRoYW5rcyBmb3IgdGVzdGluZyB0aGlzIG9uIHRoZSBCUEktRjMhCgo+
IFR3byBub3RlczoKPgo+IC0gT24gdjcuNC1yYzEgdGhlIGRyaXZlciByZWZ1c2VzIHRoZSBHUFUg
KCJVbmtub3duIEdQVSEgU2V0Cj4gICAnZXhwX2h3X3N1cHBvcnQnIHRvIGJ5cGFzcyB0aGlzIGNo
ZWNrIik7IHdpdGgKPiAgIHBvd2VydnIuZXhwX2h3X3N1cHBvcnQ9MSBpdCB3b3JrcyBhcyBhYm92
ZS4gSXMgYSBkcml2ZXIgcGF0Y2gKPiAgIGFkZGluZyB0aGUgSzEgR1BVIHBlbmRpbmcgc29tZXdo
ZXJlPwoKWW91J3JlIHJpZ2h0LiBJIGZvcmdvdCB0byBtZW50aW9uIGluIHRoZSBjb3ZlciBsZXR0
ZXIgdGhhdCBJIHdhcyBsb2FkaW5nCnRoZSBtb2R1bGUgd2l0aDoKc3VkbyBtb2Rwcm9iZSBwb3dl
cnZyIGV4cF9od19zdXBwb3J0PTEKCkkgcGxhbiB0byBzZW5kIGEgc2VwYXJhdGUgcGF0Y2ggdG8g
YWRkIEsxIEdQVSBzdXBwb3J0IGRpcmVjdGx5IGluCkltYWdpbmF0aW9uJ3MgZHJpdmVyLgoKPiAt
IFRoZSBHUFUgbmV2ZXIgcnVudGltZS1zdXNwZW5kczogYWZ0ZXIgMTYwIHMgaWRsZSwKPiAgIHJ1
bnRpbWVfc3VzcGVuZGVkX3RpbWUgaXMgc3RpbGwgMCBhbmQgdGhlIHBvd2VyIGRvbWFpbiBzdGF5
cyBvbgo+ICAgKGF1dG9zdXNwZW5kIDUwIG1zKS4gVGhhdCBsb29rcyBsaWtlIHdoYXQgQmFpaHVp
J3MgImRybS9pbWFnaW5hdGlvbjoKPiAgIHJlLWNoZWNrIGZpcm13YXJlIGlkbGUgc3RhdGUgYmVm
b3JlIHJ1bnRpbWUgc3VzcGVuZCIgZml4ZXMuCgpJIGhhZG4ndCB0ZXN0ZWQgcnVudGltZSBzdXNw
ZW5kIGZvciB0aGUgZHJpdmVyIGJlZm9yZSwgYnV0IGFmdGVyIHlvdQptZW50aW9uZWQgaXQgSSBn
YXZlIGl0IGEgdHJ5IGFuZCBjYW4gY29uZmlybSBpdCBkb2Vzbid0IHdvcmsgcHJvcGVybHkuCkhv
cGVmdWxseSBCYWlodWkncyBwYXRjaCBbMV0gd2lsbCBmaXggdGhpcyBpc3N1ZS4KClsxXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MTExMS1pbWctcG0tYXV0b3N1c3Bl
bmQtdjItMS00Mjc2ODlmNmYyZjlAbGludXguc3BhY2VtaXQuY29tLwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
