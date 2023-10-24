Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3DCC07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 12:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6fs3ZWbqkEkLoe8P9Fq7ojJi9eiManHOmbLoVYfrHfY=; b=XlM4PCXS2lbd7C
	OgHeWQLphPf0Ib6Ntwqq+8ex+TsQoDZJorAgqFPnXshsy0mTedaBwUDpnAFW4ZH14TBnlYqf4MluP
	wcTLEBHlgxE0kiI6HlELshjL4gxcuGbWz9rit7MR7Nzwwa1TWOtJZ5TJhF+SE5EvQbWSu8cFZCwm4
	QGe4S1n20XhdfpiiZu07cpe5qEEE2ORx0kunQi81vC5k9HlkDWLqV3sG3wQ0/oW9K+yTHRvzdnh87
	Wt3CBWDKT4NL8PJvKhMo6ayf9UKz1T2OkYTTmvtoKfrOfoU2vE2cfk8b20IEOhJ7y2EB1rv0Dxe/1
	+uR/K37lEVH7vDwG9cdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvG78-009i5B-1Y;
	Tue, 24 Oct 2023 12:02:26 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvG73-009i36-18;
	Tue, 24 Oct 2023 12:02:23 +0000
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3b2d9a9c824so1006843b6e.0;
        Tue, 24 Oct 2023 05:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698148937; x=1698753737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2pHDhFBV3p+9e1mZi2uGJDDYekveY6SeTMBwmaYx/4=;
        b=F9QSATrxNXjQ8Hh+wfe2gCkmlQGEnKK+uuLqWAs/E5lZgbcRxj9pl+ImBTgSyR+kXH
         juoCQUpROb+gPRMMmvvo+Gtu3/xYLCQ2SJZ3q2Fe6QSbGPmh1zI1Rr1O04hjNoeDn5KX
         e/TW47P9lVsvK4KeVp5pp98VG0Vy5ew+/ifbBGrWrJqTD0TFKsGcF/v8feLWdJ96OjPF
         fCFB7/uKMVi9SJBREnQt800fv17CGeLSL/cuDUqpdtdTgytzlZ15VHcUs6CBFiJaW22L
         YnsxxTaYROf+5cXu7d0DZS1yTCu5YuSXsxKBY9DgFRIyXAYwlshXvw5+7UVp2WZ/jyHX
         A65g==
X-Gm-Message-State: AOJu0Yya3Sh5mbzArN+DhrYNoOB6HiRc34cHk8FX2G9WKJiJZaMkBoq/
	pUQIuA11g+nF72AmmBb7rIon3oxSRZZNDQCQjBhA9uF4
X-Google-Smtp-Source: AGHT+IGIETBiiFD1D2fRVRb8FftiTW+n7MOvkpWXai2dprUcsPzAq6Nyi8wxC+U5gNTBl00FSuUydUoDBwyRfxz40/M=
X-Received: by 2002:a05:6808:1513:b0:3ae:5e6a:5693 with SMTP id
 u19-20020a056808151300b003ae5e6a5693mr13497868oiw.0.1698148937006; Tue, 24
 Oct 2023 05:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <E1qtuWW-00AQ7P-0W@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1qtuWW-00AQ7P-0W@rmk-PC.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 24 Oct 2023 14:02:05 +0200
Message-ID: <CAJZ5v0hEXaYSgre=F=hZ0XTRqupaBR5Grnck=tQtfj4inDkOKA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: Rename acpi_scan_device_not_present() to be about enumeration
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	James Morse <james.morse@arm.com>, Salil Mehta <salil.mehta@huawei.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_050221_391874_E6B06C97 
X-CRM114-Status: GOOD (  24.67  )
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

T24gRnJpLCBPY3QgMjAsIDIwMjMgYXQgODo0N+KAr1BNIFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5l
bEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gRnJvbTogSmFtZXMgTW9yc2UgPGphbWVzLm1v
cnNlQGFybS5jb20+Cj4KPiBhY3BpX3NjYW5fZGV2aWNlX25vdF9wcmVzZW50KCkgaXMgY2FsbGVk
IHdoZW4gYSBkZXZpY2UgaW4gdGhlCj4gaGllcmFyY2h5IGlzIG5vdCBhdmFpbGFibGUgZm9yIGVu
dW1lcmF0aW9uLiBIaXN0b3JpY2FsbHkgZW51bWVyYXRpb24KPiB3YXMgb25seSBiYXNlZCBvbiB3
aGV0aGVyIHRoZSBkZXZpY2Ugd2FzIHByZXNlbnQuCj4KPiBUbyBhZGQgc3VwcG9ydCBmb3Igb25s
eSBlbnVtZXJhdGluZyBkZXZpY2VzIHRoYXQgYXJlIGJvdGggcHJlc2VudAo+IGFuZCBlbmFibGVk
LCB0aGlzIGhlbHBlciBzaG91bGQgYmUgcmVuYW1lZC4gSXQgd2FzIG9ubHkgZXZlciBhYm91dAo+
IGVudW1lcmF0aW9uLCByZW5hbWUgaXQgYWNwaV9zY2FuX2RldmljZV9ub3RfZW51bWVyYXRlZCgp
Lgo+Cj4gTm8gY2hhbmdlIGluIGJlaGF2aW91ciBpcyBpbnRlbmRlZC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEphbWVzIE1vcnNlIDxqYW1lcy5tb3JzZUBhcm0uY29tPgo+IFJldmlld2VkLWJ5OiBHYXZp
biBTaGFuIDxnc2hhbkByZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAo
T3JhY2xlKSA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+Cj4gLS0tCj4gVGhpcyBpcyBhbm90
aGVyIHBhdGNoIGZyb20gSmFtZXMnIGFhcmNoNjQgaG90cGx1ZyB2Y3B1IHNlcmllcy4KPgo+IEkg
YXNrZWQ6Cj4gPiBJcyB0aGlzIGFub3RoZXIgcGF0Y2ggd2hpY2ggb3VnaHQgdG8gYmUgc3VibWl0
dGVkIHdpdGhvdXQgd2FpdGluZwo+ID4gZm9yIHRoZSByZXN0IG9mIHRoZSBzZXJpZXM/Cj4gdG8g
d2hpY2ggSm9uYXRoYW4gQ2FtZXJvbiByZXBsaWVkOgo+ID4gTG9va3MgbGlrZSBhIHZhbGlkIHN0
YW5kYWxvbmUgY2hhbmdlIHRvIG1lLgo+Cj4gU28gbGV0J3MgZ2V0IHRoaXMgcXVldWVkIHVwLgo+
Cj4gIGRyaXZlcnMvYWNwaS9zY2FuLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9h
Y3BpL3NjYW4uYyBiL2RyaXZlcnMvYWNwaS9zY2FuLmMKPiBpbmRleCBlZDAxZTE5NTE0ZWYuLjE3
YWI4NzVhN2Q0ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2FjcGkvc2Nhbi5jCj4gKysrIGIvZHJp
dmVycy9hY3BpL3NjYW4uYwo+IEBAIC0yODksMTAgKzI4OSwxMCBAQCBzdGF0aWMgaW50IGFjcGlf
c2Nhbl9ob3RfcmVtb3ZlKHN0cnVjdCBhY3BpX2RldmljZSAqZGV2aWNlKQo+ICAgICAgICAgcmV0
dXJuIDA7Cj4gIH0KPgo+IC1zdGF0aWMgaW50IGFjcGlfc2Nhbl9kZXZpY2Vfbm90X3ByZXNlbnQo
c3RydWN0IGFjcGlfZGV2aWNlICphZGV2KQo+ICtzdGF0aWMgaW50IGFjcGlfc2Nhbl9kZXZpY2Vf
bm90X2VudW1lcmF0ZWQoc3RydWN0IGFjcGlfZGV2aWNlICphZGV2KQo+ICB7Cj4gICAgICAgICBp
ZiAoIWFjcGlfZGV2aWNlX2VudW1lcmF0ZWQoYWRldikpIHsKPiAtICAgICAgICAgICAgICAgZGV2
X3dhcm4oJmFkZXYtPmRldiwgIlN0aWxsIG5vdCBwcmVzZW50XG4iKTsKPiArICAgICAgICAgICAg
ICAgZGV2X3dhcm4oJmFkZXYtPmRldiwgIlN0aWxsIG5vdCBlbnVtZXJhdGVkXG4iKTsKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FQUxSRUFEWTsKPiAgICAgICAgIH0KPiAgICAgICAgIGFjcGlf
YnVzX3RyaW0oYWRldik7Cj4gQEAgLTMyNyw3ICszMjcsNyBAQCBzdGF0aWMgaW50IGFjcGlfc2Nh
bl9kZXZpY2VfY2hlY2soc3RydWN0IGFjcGlfZGV2aWNlICphZGV2KQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGVycm9yID0gLUVOT0RFVjsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAg
fSBlbHNlIHsKPiAtICAgICAgICAgICAgICAgZXJyb3IgPSBhY3BpX3NjYW5fZGV2aWNlX25vdF9w
cmVzZW50KGFkZXYpOwo+ICsgICAgICAgICAgICAgICBlcnJvciA9IGFjcGlfc2Nhbl9kZXZpY2Vf
bm90X2VudW1lcmF0ZWQoYWRldik7Cj4gICAgICAgICB9Cj4gICAgICAgICByZXR1cm4gZXJyb3I7
Cj4gIH0KPiBAQCAtMzM5LDcgKzMzOSw3IEBAIHN0YXRpYyBpbnQgYWNwaV9zY2FuX2J1c19jaGVj
ayhzdHJ1Y3QgYWNwaV9kZXZpY2UgKmFkZXYsIHZvaWQgKm5vdF91c2VkKQo+Cj4gICAgICAgICBh
Y3BpX2J1c19nZXRfc3RhdHVzKGFkZXYpOwo+ICAgICAgICAgaWYgKCFhY3BpX2RldmljZV9pc19w
cmVzZW50KGFkZXYpKSB7Cj4gLSAgICAgICAgICAgICAgIGFjcGlfc2Nhbl9kZXZpY2Vfbm90X3By
ZXNlbnQoYWRldik7Cj4gKyAgICAgICAgICAgICAgIGFjcGlfc2Nhbl9kZXZpY2Vfbm90X2VudW1l
cmF0ZWQoYWRldik7Cj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICAgICAgICAgfQo+ICAg
ICAgICAgaWYgKGhhbmRsZXIgJiYgaGFuZGxlci0+aG90cGx1Zy5zY2FuX2RlcGVuZGVudCkKPiAt
LQoKQXBwbGllZCBhcyA2LjcgbWF0ZXJpYWwsIHRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
