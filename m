Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DDEC3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 14:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGasaOeLtSzP1o72PTG8RhKR1R1nwQPUtcV+VWOPTUE=; b=mhfP7em2WMn4W3
	LXfqVjvIbk7Bk3LA2wiqNGmJRYQwCPExGuzajH4mab+cvP+E3szJO0mwq5L7P4ZPpCSEjSks30iN1
	DFYZytUiwidbVaPX5ji+KGMrIW1zyqU+1MvA7s4u2bAgQGfGOBaq8KshjM7c0F2N4rmDa/Z207vO7
	LMHCOR/ZmYkERsM11X44K9Mib8zS3+8XvKtz9weayUcjdyhihjDhEUK18GjRFzdFuKxD7NsQBrHWI
	IPm6r+J92tQ5mMHis7xcZVRxLE1FAeUJa623a4nzt0JcuonoQGpd/pRB5mVLwgkYI7Sc1xr5PCRKL
	wX66hqxFEU7sri5aWHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgPdz-00000005VeW-3ldo;
	Tue, 20 Aug 2024 14:15:31 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgPdx-00000005VdE-3Bbj
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 14:15:31 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2f1a7faa4d4so13099851fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 07:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724163327; x=1724768127; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06G4FyezZgfDrsrpdflEgDGPZdrxliGs+D3AnzUYadA=;
        b=f8/CFr/xmvdBx4TZUI6ySRyCCFdW8fksdVOdt2XTbZYvNZbTduWNIE9xPOB6Qt80Sa
         9Ul9MDshGJQsjj5gyPy8k9jhr9Xk1ZAOI8xTMCKBvG5KKsKLHOUw9LaZetBiEh8wR7BI
         yLhDGe1g8DLuu2/icko9gnsmekbzUMhAvqXSh0YKZXmhU3d95gmABhLj+zdb+2giJPrf
         wT1w6k6odZf1rh/c7qlQYW+LnmnWV7WsNaWHrLhkwJCNEG7y8hx1k2szvId8EfKytaWR
         SfurW1ARwSE3TSww4h0bp3KE1ge5tjFuXKLVCXBLAVFsn136L6i5MkTA7BUitKW9yGK4
         GBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724163327; x=1724768127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06G4FyezZgfDrsrpdflEgDGPZdrxliGs+D3AnzUYadA=;
        b=V8ZRaV0B3nlJyFkqlnbof7T44QRc8pSO/pEDSXcPNrFzPgMvwYOoB9lvBf75yfGDdc
         q2HkDAe0WpKmvLmepQKd5lPsR4i2QHf6ZPK3Ib4o9HEGeSc+BlG3MFp8AsaSvdTnHeE2
         uPrmDD2lOpa2vE+eTTaEhaEz8zgT0ibfvwvGwwzvjs4bp4SgOSFzXnhquAEcEsGt8s1r
         yppZQ7fEwhlJ1gpg+rwAEuQ7b4fwexN9cZdsJD5cO8yXsPK01H0FjbUAWftiHgHz8fJP
         NDvX4i6AGw4TU8IK07n0CwDWdLIIWudyD2K2soSOkBqrQt0+GU//HkrQ6YUPoYK3dPWM
         zfZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN+Q3YqBeY9uMmVwJn7V7qBr2gXF009k6qxNOhF5jDUKuQMsK1ArkHxhMJawNLSrFOcD9qX1RYiIrOKA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDvEkrz4DzjtYXcxaVFQgRgX0Qli3NpqCBgRES/Ho1igFbvAzO
	o9yTsrUOmJIpRvOJ687COiTaM+OwVGUTSUvFVLOF0cjAM3xh6mNXDfDaBnsr/3z5BxHUS1tmnua
	t9qXooyMzwGEhUwnMLJjbUQpyfJvJajy6alL1mA==
X-Google-Smtp-Source: AGHT+IGKiThAN0GuC44MFttdMjzCeTZn0kU8ugyaZbQcInGnnepS6RNuiFyj+ZZXcbedpVwVkDYHDnMsJPfbHLCUf2o=
X-Received: by 2002:a05:651c:890:b0:2f3:f170:8ec2 with SMTP id
 38308e7fff4ca-2f3f1708f2emr5847911fa.21.1724163326587; Tue, 20 Aug 2024
 07:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240820132857.247679-1-yuehaibing@huawei.com>
In-Reply-To: <20240820132857.247679-1-yuehaibing@huawei.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 20 Aug 2024 19:45:14 +0530
Message-ID: <CAK9=C2UMsvb=mZHks+c-YBsWO23=WSrKj3=GgFiO9wzQwc_XLw@mail.gmail.com>
Subject: Re: [PATCH -next] irqchip/riscv-aplic: Fix NULL vs IS_ERR() bug
To: Yue Haibing <yuehaibing@huawei.com>
Cc: anup@brainfault.org, tglx@linutronix.de, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, ruanjinjie@huawei.com, 
	bjorn@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_071529_820636_A8F2BFF8 
X-CRM114-Status: GOOD (  16.15  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBdWcgMjAsIDIwMjQgYXQgNzowNOKAr1BNIFl1ZSBIYWliaW5nIDx5dWVoYWliaW5n
QGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkg
bmV2ZXIgcmV0dXJucyBOVUxMIHBvaW50ZXIsIGl0IHdpbGwKPiByZXR1cm4gRVJSX1BUUigpIHdo
ZW4gaXQgZmFpbHMsIHNvIGNoZWNrIGl0IHdpdGggSVNfRVJSKCkuCj4KPiBGaXhlczogMjMzM2Rm
NWFlNTFlICgiaXJxY2hpcDogQWRkIFJJU0MtViBhZHZhbmNlZCBQTElDIGRyaXZlciBmb3IgZGly
ZWN0LW1vZGUiKQo+IFNpZ25lZC1vZmYtYnk6IFl1ZSBIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdl
aS5jb20+CgpEYW4gKENDJ2VkKSBhbHJlYWR5IHBvc3RlZCBhIHZlcnkgc2ltaWxhciBwYXRjaC4K
ClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMt
bWFpbi5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxp
Yy1tYWluLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1haW4uYwo+IGluZGV4
IDI4ZGQxNzViNTc2NC4uNmQ5M2E4NWYxZmM2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hp
cC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNj
di1hcGxpYy1tYWluLmMKPiBAQCAtMTc1LDkgKzE3NSw5IEBAIHN0YXRpYyBpbnQgYXBsaWNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPgo+ICAgICAgICAgLyogTWFwIHRoZSBN
TUlPIHJlZ2lzdGVycyAqLwo+ICAgICAgICAgcmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9y
ZXNvdXJjZShwZGV2LCAwKTsKPiAtICAgICAgIGlmICghcmVncykgewo+ICsgICAgICAgaWYgKElT
X0VSUihyZWdzKSkKPiAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgbWFwIE1N
SU8gcmVnaXN0ZXJzXG4iKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKyAg
ICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHJlZ3MpOwo+ICAgICAgICAgfQo+Cj4gICAgICAg
ICAvKgo+IC0tCj4gMi4zNC4xCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
