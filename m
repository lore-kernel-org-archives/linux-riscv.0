Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851B0E7717D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 12:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bkLQN7c10CDEgeR6pAjUNwsUeifYvIimK7OWW1R4XU4=; b=cXqvWK2TENZxpn
	7p6ahJV4ZGHDZcu+O6wKvke8Yj9Vkic0ZPVIikzxfuDLZ+CodvOWe+eFUPAVloCU6RJ2bPvEeNPj5
	6/V9SrDC/wO1/XjYMJ1R2GHTft++XZMzNaJTWb8KrrrT3tjtR9BnvWwbRSeS+2wQ+gNvS1IbvYh6T
	ek+cWrQD9qmcT0nMXcQcG133jc6z1+aDKUZWkZd7rqzTlLx/m0HUWl2HvEVhVj7F9Lsb//b3rleAH
	fOncTJTXzCfnC+Ay33jwdy/wT+gtZ6HCHB/ZZq5FTDyMwfnLGTNUeE6r8y/U8O2D4E0VQpxQCMFrn
	216437YZoxAH1m+TlIig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKca0-00000007d8X-0Bca;
	Mon, 09 Dec 2024 12:09:36 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcYy-00000007cyg-3bPZ
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 12:08:33 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ff976ab0edso42209551fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2024 04:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733746110; x=1734350910; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6gzkDAhzXovMDqEI+9lRYWllf8EEHxno6K1iEAuLoM=;
        b=CD3wR5fsoJ07YL9ViWpYj6PLLcL8tFxy4d3IeWnMqQU/6uRpJMrKR+0njjAgSiXJIQ
         MGiptf/ynlADJPckO52eLMVKMK/MjzuKd6MuQyp0vH7c7yJBVqm/+dROz2qrre4ynyF0
         5sz0GYm205zy9O6kei2vOKrLJ34qMi+0kOKVEV27hLkqvBtwThCDNUuIXIiHhCxCH0+a
         k/AOBTpMInMA+xSxHeTo1VvX3l9IYTBv/1N3SdhrzkMaAoDlqMZc0ahlv5miZJweo5tS
         6DrzdXaQ7TLsx7mz47sKqbwTdJvrKdPw5+//Yp+N9B53fZ3uJ3VUKhsAyq8oz9UW1gwX
         Csjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746110; x=1734350910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6gzkDAhzXovMDqEI+9lRYWllf8EEHxno6K1iEAuLoM=;
        b=beZSfeNv9Au4uU84oXFi2YVWv4ZTqvVg8Y5GjgDE1Th/AI/kk3hufoj2BApA4gnQvN
         0WL4jJl/BNEzAiWgJyNlsN1EPkpSax5ryJClBqKRwjmAlruMCDqmeQqy+Mn9RHNo56l3
         QA4oTJcMLhIqcnXYUWVOZtG/KcMARsYmHKwtsVLgQPGU9nXpDisuYIbjWnwrp/tA1n+W
         UhDHRiXPGEn2O9yl0/7rMkRhq0QoOe6j/oGiEb/gXyMqUK2HznVHLRjiB/lWn/Ml2wZ8
         gKTjOil1erbrcnKM9FHeQpCjG9j/LiQgvbt88YxrLwMlTTNnaF2b/sNituG7EG8IQPJW
         NVow==
X-Forwarded-Encrypted: i=1; AJvYcCWHGOh/rAMWLcyT3UDDd+2QsggC/t0FyOQIe16Ei8e2i/9AS/wHbZvz1QpTcSx0iG2wKUumNFIGLJ5/9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKRAWwgalGhtPOEc1rLXSmeVV5vBCnJH1h+h4t852hFPci0d86
	WLl6S+SPq7Z+iKgBDBfJDssOSzZtampyIQWV3ofQZNo58TOE60W8rGIcjzYEFiiwQ6/OvgpPRZs
	TC3XSKuUhV1yTXrBnJycPNx4BZlsTcsalrVtAYA==
X-Gm-Gg: ASbGncuwJtmAOOlulOFPQqfM3OEWWd8+fBB4edBBjK1tlryvqII/gTEifx6k6GIHlMH
	O6ygsK6B3qU4hAx67tnbAq4VOW2v3yEiu7Q==
X-Google-Smtp-Source: AGHT+IE7s57c5CX5EN+0VrV/XwVhMQsRyEe4E1tm7jFdZ3xrCHKp5MnSIFcNY2K88pwSkR5p5gRdx23gp0eZz8tJNGY=
X-Received: by 2002:a2e:b013:0:b0:300:33b1:f0cc with SMTP id
 38308e7fff4ca-30033b1f3femr48347421fa.34.1733746109558; Mon, 09 Dec 2024
 04:08:29 -0800 (PST)
MIME-Version: 1.0
References: <20241208150711.297624-1-apatel@ventanamicro.com>
 <20241208150711.297624-2-apatel@ventanamicro.com> <875xnuq6dc.ffs@tglx>
In-Reply-To: <875xnuq6dc.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Dec 2024 17:38:18 +0530
Message-ID: <CAK9=C2VqU2mdLL-R20bdgvDHi0WcuNyUSqRo7Pztsu-8X1wVvw@mail.gmail.com>
Subject: Re: [PATCH 1/4] irqchip/riscv-imsic: Handle non-atomic MSI updates
 for device
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_040832_889525_42DA8E95 
X-CRM114-Status: GOOD (  20.01  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgVGhvbWFzLAoKT24gTW9uLCBEZWMgOSwgMjAyNCBhdCAxOjQ04oCvQU0gVGhvbWFzIEdsZWl4
bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gU3VuLCBEZWMgMDggMjAyNCBh
dCAyMDozNywgQW51cCBQYXRlbCB3cm90ZToKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICB0dmVjID0gdmVjLT5sb2NhbF9pZCA9PSBtdmVjLT5sb2NhbF9pZCA/Cj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIE5VTEwgOiAmbHByaXYtPnZlY3RvcnNbbXZlYy0+bG9jYWxfaWRd
Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmICh0dmVjICYmIF9faW1zaWNfaWRfcmVhZF9j
bGVhcl9wZW5kaW5nKHR2ZWMtPmxvY2FsX2lkKSkgewo+Cj4gQXMgSSB0b2xkIHlvdSBiZWZvcmU6
Cj4KPiBJIGRvbid0IHNlZSBhIHdheSBob3cgdGhhdCBjYW4gd29yayByZW1vdGUgd2l0aCB0aGUg
SU1TSUMgZWl0aGVyIGV2ZW4gaWYKPiB5b3UgY2FuIGVhc2lseSBhY2Nlc3MgdGhlIHBlbmRpbmcg
c3RhdGUgb2YgdGhlIHJlbW90ZSBDUFU6CgpGb3IgUklTQy1WIElNU0lDLCBhIHJlbW90ZSBDUFUg
Y2Fubm90IGFjY2VzcyB0aGUgcGVuZGluZyBzdGF0ZQpvZiBpbnRlcnJ1cHRzIG9uIHNvbWUgb3Ro
ZXIgQ1BVLgoKPgo+IENQVTAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1BVMSAgICAgICAg
ICAgICAgICAgICBEZXZpY2UKPiBzZXRfYWZmaW5pdHkoKQo+ICAgd3JpdGVfbXNnKHRtcCkKPiAg
ICAgd3JpdGUoYWRkcik7IC8vIENQVTEKPiAgICAgd3JpdGUoZGF0YSk7IC8vIHZlY3RvciAweDIw
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByYWlzZSBJUlEgKENQVTEsIHZlY3RvciAweDIwKQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaGFuZGxlIHZlY3RvciAweDIwCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAob3RoZXIgZGV2aWNlKQo+Cj4gICAgIGNoZWNrX3BlbmRpbmcoQ1BVMSwgMHgyMCkgPT0g
ZmFsc2UgLT4gSW50ZXJydXB0IGlzIGxvc3QKPgo+IFRoZXJlIGlzIG5vIGd1YXJhbnRlZSB0aGF0
IHNldF9hZmZpbml0eSgpIHJ1bnMgb24gdGhlIG9yaWdpbmFsIHRhcmdldAo+IENQVSAoQ1BVIDEp
LiBZb3VyIHNjaGVtZSBvbmx5IHdvcmtzLCB3aGVuIENQVTEgdmVjdG9yIDB4MjAgaXMgbm90IHVz
ZWQKPiBieSBzb21lIG90aGVyIGRldmljZS4gSWYgaXQncyB1c2VkLCB5b3UgbG9zdCBhcyBDUFUx
IHdpbGwgY29uc3VtZSB0aGUKPiB2ZWN0b3IgYW5kIHlvdXIgcGVuZGluZyBjaGVjayBpcyBub3Qg
c2VlaW5nIGFueXRoaW5nLgo+Cj4geDg2IGVuc3VyZXMgQ1BVIGxvY2FsaXR5IGJ5IGRlZmVycmlu
ZyB0aGUgYWZmaW5pdHkgbW92ZSB0byB0aGUgbmV4dAo+IGRldmljZSBpbnRlcnJ1cHQgb24gdGhl
IG9yaWdpbmFsIHRhcmdldCBDUFUgKENQVTEgaW4gdGhlIGFib3ZlCj4gZXhhbXBsZSkuIFNlZSBD
T05GSUdfR0VORVJJQ19JUlFfUEVORElORy4KCkkgYWdyZWUgd2l0aCB5b3UuCgpUaGUgSU1TSUMg
ZHJpdmVyIG11c3QgZG8gdGhlIGFmZmluaXR5IG1vdmUgdXBvbiB0aGUgbmV4dCBkZXZpY2UKaW50
ZXJydXB0IG9uIHRoZSBvbGQgQ1BVLiBJIHdpbGwgdXBkYXRlIHRoaXMgcGF0Y2ggaW4gdGhlIG5l
eHQgcmV2aXNpb24uCgpCVFcsIEkgZGlkIG5vdCBmaW5kIENPTkZJR19HRU5FUklDX0lSUV9QRU5E
SU5HLiBJcyB0aGUKbmFtZSBjb3JyZWN0ID8KCj4KPiBUaGUgaW50ZXJydXB0IGRvbWFpbnMgd2hp
Y2ggYXJlIG5vdCBhZmZlY3RlZCAocmVtYXApIHNldCB0aGUKPiBJUlFfTU9WRV9QQ05UWFQgZmxh
ZyB0byBhdm9pZCB0aGF0IGRhbmNlIGFuZCBkb24ndCB1c2UgdGhhdCBhZmZpbml0eQo+IHNldHRl
ciBjb2RlIHBhdGggYXQgYWxsLgoKWWVzLCBzZXR0aW5nIHRoZSBJUlFfTU9WRV9QQ05UWFQgZmxh
ZyBpbiB0aGUgcmVtYXAgZG9tYWluCm1ha2VzIHBlcmZlY3Qgc2Vuc2UuCgpJIHN1Z2dlc3QgYWRk
aW5nIElSUV9NT1ZFX1BDTlRYVCB1c2FnZSBhcyBwYXJ0IG9mIERyZXcncwppcnFieXBhc3Mgc2Vy
aWVzIHdoaWNoIGFkZHMgYSByZW1hcCBkb21haW4gaW4gdGhlIElPTU1VCmRyaXZlci4gVW5sZXNz
IHlvdSBpbnNpc3Qgb24gaGF2aW5nIGl0IGFzIHBhcnQgb2YgdGhpcyBzZXJpZXMgPwoKUmVnYXJk
cywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
