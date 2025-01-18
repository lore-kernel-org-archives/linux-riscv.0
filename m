Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596C8C02185
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jan 2025 19:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HlB7uUwA5d82aDnzhnRUYgmSwsZnogyYBdBVfVprIc=; b=w56uXcRrBn6dD9
	cUtF5f4qPUIz/H175CbQ0SO0wWnL7LQM7fuubgqMmeVHWoHok8G8XdKsOaWA7Yz8ZKTTqSRb+ygyu
	BKiAo1kDdGwaDWD/WpYSkrUwLcotuBdbEOBYUjmNK0o1Elxn1wLrdgNr+Q9fgKVeCrzUmVx0tXjkR
	ZAqscOzF9f5Sgfd24W1qn/IueU00Q00Tmjts4CUcZFEyMqvLhX0YliRhMYDNnnEs8ktoEwzo4dpb6
	41u6HOnsBloQu8ZM5IzBDl6Zq18k6bGbcaOJ70OsFEDEd/TuGgdLnNwmeDHMoSiPMHxgvtgq/q3WN
	LEMCdyqvVpbFGOTiLcdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZEbY-00000002rlH-1aCZ;
	Sat, 18 Jan 2025 19:35:36 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZEbV-00000002rkw-1Kn1
	for linux-riscv@lists.infradead.org;
	Sat, 18 Jan 2025 19:35:34 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-29f87f1152cso1763350fac.2
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jan 2025 11:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737228932; x=1737833732; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MrfbNVa+vEUhmI7it8p4ZhL2eEh4kP04zy09ykGdXE=;
        b=geQHJ7ZSQDm5DbhGbyWVoi8h9nWi1f+n1fVH+ey+veSscoFOdE6+IJuzgrySGFUgcb
         F9TPup9EdLi679zfyIn6KqPntChVLKDN6ax6kVaweflqOCjD0Jm0gZW/5UsY3XlIJyBC
         h/yq1qvK6q02ZcuaZ0kXHsjF/pvyawMWenQSCvNPCAcTyAFETEnEZyEqbbz3bV25YLYs
         l0te2X89yaWNtSnQZwbCfSd7uXq5PXK2Bc9EfEHUInS61BT8iDB1SIUQvRvPKeG/Yn7z
         NsqUnHN1/LdqVWEnRyikAuF0dqBO+q2kxA3KiLx3ZrynDIduIYeBrFneAtpvwABeAR1N
         ywnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737228932; x=1737833732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MrfbNVa+vEUhmI7it8p4ZhL2eEh4kP04zy09ykGdXE=;
        b=TPzKpg0ea+rRg2Hita5gZBqDmK7I/NyKov7xRJEUDjAnKIkpkTcEk50XyHTXVc99fk
         2mDSKCSZsUZodYbc6VBM+SVwzKvSZw1Km/eR1RtY7jyN3OwjBqkAxyKnvXP5v8bF1z/M
         OC04RNBzs//AEa9BzdhWOGDWZtuBgJvGIusoX7ii6PjiFwhbi+1Sno0FiBLCtvZRotcp
         l+58xDvMle0jtNf5xiWEJnpaLeYFpn2cUc7GzcGX95cucl4L77BKbif+y6h2XMN5kPwI
         bjLogQeA1uPFro/FeTSF5KPeslchsWyb0K/lfpiPzFuh30WYiCXlJIrIfPX6PqMQb2RZ
         gnZw==
X-Forwarded-Encrypted: i=1; AJvYcCUQrrSx4BQjxbTIRU3+znkKu9HhbMXLGEV21xT9yWhP4kc/h7IL09lFQjtrcD4Ly0+a7ddVg7b3Zy+Qqw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yydl1n3O4lC80nyvhswxRO92GfuPrME3cr9qvzTRu2/l5BveAhw
	Z6DumnMihiYeKV0T3N+Hjm73KstLzga8NmdQBhuaO2C0McBHLBPixcsWwyKK0IIZzbVYPkKm9YB
	rqrBcZk2sGG8JV23lHp/BFZuYDJw=
X-Gm-Gg: ASbGnctRBmLV/iziYONU5BpLB/f5GROBP8mpiPlsueFDh2gcai3lOZa7t7ujlEMJk7H
	kXgf3rN3MqLYeExK93F/oGQobpWNAOJOv6qR8R6aKcGkdD0oWEmE3
X-Google-Smtp-Source: AGHT+IE1McJwHFC67NA6spi9j7f2khCAH+9zQzGUcWJS6/2ltDVN2K6T4/6V+nRGxyE0YeDlNSbMEZaOfbzc3kD3fvc=
X-Received: by 2002:a05:6870:794:b0:297:26a9:32ef with SMTP id
 586e51a60fabf-2b1c0cd175amr4410115fac.33.1737228932234; Sat, 18 Jan 2025
 11:35:32 -0800 (PST)
MIME-Version: 1.0
References: <CGME20241202100633eucas1p2a615523beaa41bac328f413e13ce471d@eucas1p2.samsung.com>
 <20241202100535.1359134-1-m.wilczynski@samsung.com>
In-Reply-To: <20241202100535.1359134-1-m.wilczynski@samsung.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 18 Jan 2025 13:35:21 -0600
X-Gm-Features: AbW1kvbs62Q1olVThBj-wh39TSV0Fj2PfUydTPsE_lu2_Ox7T_U-hl21uEllgxs
Message-ID: <CABb+yY1W=n-KygVb26v_o7Hu7ZNQjyhgA4zbbka2M9_9ZNtNnw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: th1520: Fix memory corruption due to incorrect
 array size
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_113533_360333_F76C6FE9 
X-CRM114-Status: GOOD (  17.82  )
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

T24gTW9uLCBEZWMgMiwgMjAyNCBhdCA0OjA24oCvQU0gTWljaGFsIFdpbGN6eW5za2kKPG0ud2ls
Y3p5bnNraUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4KPiBUaGUgZnVuY3Rpb25zIHRoMTUyMF9tYm94
X3N1c3BlbmRfbm9pcnEgYW5kIHRoMTUyMF9tYm94X3Jlc3VtZV9ub2lycSBhcmUKPiBpbnRlbmRl
ZCB0byBzYXZlIGFuZCByZXN0b3JlIHRoZSBpbnRlcnJ1cHQgbWFzayByZWdpc3RlcnMgaW4gdGhl
IE1CT1gKPiBJQ1UwLiBIb3dldmVyLCB0aGUgYXJyYXkgdXNlZCB0byBzdG9yZSB0aGVzZSByZWdp
c3RlcnMgd2FzIGluY29ycmVjdGx5Cj4gc2l6ZWQsIGxlYWRpbmcgdG8gbWVtb3J5IGNvcnJ1cHRp
b24gd2hlbiBhY2Nlc3NpbmcgYWxsIGZvdXIgcmVnaXN0ZXJzLgo+Cj4gVGhpcyBjb21taXQgY29y
cmVjdHMgdGhlIGFycmF5IHNpemUgdG8gYWNjb21tb2RhdGUgYWxsIGZvdXIgaW50ZXJydXB0Cj4g
bWFzayByZWdpc3RlcnMsIHByZXZlbnRpbmcgbWVtb3J5IGNvcnJ1cHRpb24gZHVyaW5nIHN1c3Bl
bmQgYW5kIHJlc3VtZQo+IG9wZXJhdGlvbnMuCj4KPiBGaXhlczogNWQ0ZDI2M2UxYzZiICgibWFp
bGJveDogSW50cm9kdWNlIHN1cHBvcnQgZm9yIFQtaGVhZCBUSDE1MjAgTWFpbGJveCBkcml2ZXIi
KQo+IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQGxpbmFyby5vcmc+
Cj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvYTk5ZTcyYmUtODQ5MC00OTYw
LWFkMjYtY2JmZWY2YWYyMzhmQHN0YW5sZXkubW91bnRhaW4vCj4gU2lnbmVkLW9mZi1ieTogTWlj
aGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9tYWlsYm94L21haWxib3gtdGgxNTIwLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJv
eC9tYWlsYm94LXRoMTUyMC5jIGIvZHJpdmVycy9tYWlsYm94L21haWxib3gtdGgxNTIwLmMKPiBp
bmRleCA0ZTg0NjQwYWMzYjguLjBkOTVlMTg5ODcwMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21h
aWxib3gvbWFpbGJveC10aDE1MjAuYwo+ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9tYWlsYm94LXRo
MTUyMC5jCj4gQEAgLTQxLDcgKzQxLDcgQEAKPiAgI2lmZGVmIENPTkZJR19QTV9TTEVFUAo+ICAv
KiBzdG9yZSBNQk9YIGNvbnRleHQgYWNyb3NzIHN5c3RlbS13aWRlIHN1c3BlbmQvcmVzdW1lIHRy
YW5zaXRpb25zICovCj4gIHN0cnVjdCB0aDE1MjBfbWJveF9jb250ZXh0IHsKPiAtICAgICAgIHUz
MiBpbnRyX21hc2tbVEhfMTUyMF9NQk9YX0NIQU5TIC0gMV07Cj4gKyAgICAgICB1MzIgaW50cl9t
YXNrW1RIXzE1MjBfTUJPWF9DSEFOU107Cj4gIH07Cj4gICNlbmRpZgo+CkkganVzdCByZXBsaWVk
IHRvIGEgcGF0Y2ggZnJvbSBBZHZhaXQgRGhhbW9yaWthciB0cnlpbmcgdG8gYWRkcmVzcyB0aGUK
c2FtZSBwcm9ibGVtIDopClRoaXMgb25lIHNlZW1zIHByb3Blci4gV2lsbCB0YWtlIGl0LgpUaGFu
a3MKCgoKPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
