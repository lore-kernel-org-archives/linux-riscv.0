Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF90C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=McTd4nmLE0w47ZcH2BHhAryJOwZAGjXno+pHOESjbG8=; b=pGA/ZDN3kez8Ij
	XlumLRHDEX+D3gMDyrDMg5ZezlGohmvdTveNC/C+bSzwk0LUJkPMY2scoHRS/koFXVrLEOV/vWnNI
	8UbKof4qjXV7/pjrgmCB+WISR4A25PQ/iDgFv2dl7DG+yLh5UBj/XyMrbwWm4LN1OochoFtK+PP+g
	VmVcDJIi+b2ZqK23Ga+rIvJ7MBdpbWAdmZ5pHnl2AauRguAmfrw3d0zY1WhWBRCYAmMCE/7yymYBM
	Urn+quPutIGMjmIR6eRX8FQOCqsBiZyp62Jtll1A/Q0fpprSk2JdYpMPQg8dOz6YSNXIgfFYuhwQm
	mX7Q9W4NUr+DhFw3wWgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRoU-00000002NX7-0dYI;
	Thu, 18 Apr 2024 13:28:30 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRoQ-00000002NWF-3K7q
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 13:28:28 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-36b2ecd7b76so6066545ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 06:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713446905; x=1714051705; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMNMsgIxykHwVLRcqTZk25HnL0Z5DBPcc9H1w13fRk4=;
        b=wF3t7OwwrYqrfUzdwS1JeVElhUYn/JZySFKyEoog+bESNoMWp/AXiML54Cg9AY4nPF
         yaiwwW+GM42hTP8ogO33iMAfONoN5xgTkncnFO8Hoe/R6AVMqFrZXGUoKZNbBBm9L3lu
         2nQqONPW8yKNvJhg6piaBoDRCXnoTARSBs4OzYT+ot0+VXyR+6m6j9bMj+760ImdDAPB
         G7zujHb+0HeOsxjKoKH89uum/wagelpVHitM6xqiwGI/acqjl8QoOr41fHLjnXqftTbS
         cXHpVEEzXXisYAyXQ6oi2LkSCycKb40K7fYrBP4sq1kkK/s0B6/VsGwJzYLVWBoXyipJ
         E/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713446905; x=1714051705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMNMsgIxykHwVLRcqTZk25HnL0Z5DBPcc9H1w13fRk4=;
        b=Q+i0GsQqh5RsEUGtOAqvdtWgYW3xw+jk5zpSUO/XRJahde0yfSZwuyJLlemz/4PD3q
         3VesE69YXbYEDQvGLQhoTGgaiB5Dk6qHWFDQj5pS0jG6uxsitdIVeGyli8MNh84rhw9Q
         MxL4Zh7lHunKqBAzX4MgdLb6llof17t/aTRMXO3KIR1GUbyLa897ZOa4ImOid4Zvb+vk
         zH5owmdvWkPX+fZJCg8HO0/11mWiiTZhskwmjlNEdZe5B/OUAV2BoELoMAg+xB7Ox1nY
         xQIXJvKM5MbmmWvGre50DsGbfQQH167VCe8kRpAow+904nT/mpsy9OGvsEaDUZRp6vSE
         E0sA==
X-Forwarded-Encrypted: i=1; AJvYcCXaVzBAAj4TSU2qW4tijo1dbIdNowZRnYDl5NfRMvx6bfh7QeblYlwm4dUUsAmFEPvioFs0BCcq/vVgr8HILHWeH/oz6YRmasYiYGQ6/IHw
X-Gm-Message-State: AOJu0YwpykK+om0uWBpP98NRWVD5EhbunaEV1ID93GRjkOISyEkGicXd
	2060HGsQJJRgs7t46uug+zP5Kc4hY72TJJEveNJeOoFfiFcybsH1gL6iNTM6LnZJScLj2UvotTr
	UuwJvXxCR8JYuo6LcuBwbUETdXqo5jQvma5BXEQ==
X-Google-Smtp-Source: AGHT+IFrWxljQUhM4BHCWc1rpwi1ngTEKRjguXPUXYX/AlzCjkEoKCfJFfKh82U9YYFX9h6A9SWk0YTxswpzIbsp85s=
X-Received: by 2002:a05:6e02:1c8b:b0:368:920b:e211 with SMTP id
 w11-20020a056e021c8b00b00368920be211mr3604422ill.5.1713446905449; Thu, 18 Apr
 2024 06:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240418124300.1387978-1-cleger@rivosinc.com>
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Apr 2024 18:58:13 +0530
Message-ID: <CAAhSdy0RPOX7_rLQ8GcYzbWQ8wzKDxDKXUqNoNd2ZFkVx4sfMg@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] Add support for a few Zc* extensions as well as Zcmop
To: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_062826_862734_098022D0 
X-CRM114-Status: GOOD (  15.19  )
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

SGkgUGFsbWVyLAoKT24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgNjoxM+KAr1BNIENsw6ltZW50IEzD
qWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBBZGQgc3VwcG9ydCBmb3IgKHll
dCBhZ2FpbikgbW9yZSBSVkEyM1U2NCBtaXNzaW5nIGV4dGVuc2lvbnMuIEFkZAo+IHN1cHBvcnQg
Zm9yIFpjbW9wLCBaY2EsIFpjZiwgWmNkIGFuZCBaY2IgZXh0ZW5zaW9ucyBpc2Egc3RyaW5nIHBh
cnNpbmcsCj4gaHdwcm9iZSBhbmQga3ZtIHN1cHBvcnQuIFpjZSwgWmNtdCBhbmQgWmNtcCBleHRl
bnNpb25zIGhhdmUgYmVlbiBsZWZ0Cj4gb3V0IHNpbmNlIHRoZXkgdGFyZ2V0IG1pY3JvY29udHJv
bGxlcnMvZW1iZWRkZWQgQ1BVcyBhbmQgYXJlIG5vdCBuZWVkZWQKPiBieSBSVkEyM1U2NAo+Cj4g
VGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gdGhlIFppbW9wIG9uZSBbMV0uCj4KPiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDQwNDEwMzI1NC4xNzUyODM0LTEt
Y2xlZ2VyQHJpdm9zaW5jLmNvbS8gWzFdCj4KPiAtLS0KPiB2MjoKPiAgLSBBZGQgWmMqIGRlcGVu
ZGVuY2llcyB2YWxpZGF0aW9uIGluIGR0LWJpbmRpbmdzCj4gIC0gdjE6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvMjAyNDA0MTAwOTExMDYuNzQ5MjMzLTEtY2xlZ2VyQHJpdm9zaW5jLmNv
bS8KPgo+IENsw6ltZW50IEzDqWdlciAoMTIpOgo+ICAgZHQtYmluZGluZ3M6IHJpc2N2OiBhZGQg
WmNhLCBaY2YsIFpjZCBhbmQgWmNiIElTQSBleHRlbnNpb24KPiAgICAgZGVzY3JpcHRpb24KPiAg
IHJpc2N2OiBkdHM6IGVuYWJsZSBaYyogZXh0ZW5zaW9ucyB3aGVuIG5lZWRlZAo+ICAgZHQtYmlu
ZGluZ3M6IHJpc2N2OiBhZGQgWmMqIGV4dGVuc2lvbiBydWxlcyBpbXBsaWVkIGJ5IEMgZXh0ZW5z
aW9uCj4gICByaXNjdjogYWRkIElTQSBwYXJzaW5nIGZvciBaY2EsIFpjZiwgWmNkIGFuZCBaY2IK
PiAgIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWmNhLCBaY2YsIFpjZCBhbmQgWmNiIElTQSBleHRl
bnNpb25zCj4gICBSSVNDLVY6IEtWTTogQWxsb3cgWmNhLCBaY2YsIFpjZCBhbmQgWmNiIGV4dGVu
c2lvbnMgZm9yIEd1ZXN0L1ZNCj4gICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBzb21lIFpj
KiBleHRlbnNpb25zIHRvIGdldC1yZWctbGlzdCB0ZXN0Cj4gICBkdC1iaW5kaW5nczogcmlzY3Y6
IGFkZCBaY21vcCBJU0EgZXh0ZW5zaW9uIGRlc2NyaXB0aW9uCj4gICByaXNjdjogYWRkIElTQSBl
eHRlbnNpb24gcGFyc2luZyBmb3IgWmNtb3AKPiAgIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWmNt
b3AgSVNBIGV4dGVuc2lvbgo+ICAgUklTQy1WOiBLVk06IEFsbG93IFpjbW9wIGV4dGVuc2lvbiBm
b3IgR3Vlc3QvVk0KPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFpjbW9wIGV4dGVuc2lv
biB0byBnZXQtcmVnLWxpc3QgdGVzdAo+Cj4gIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3By
b2JlLnJzdCAgICAgICAgICB8ICAyNCArKwo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9jcHVzLnlhbWwgICAgICAgfCAgIDggKy0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvZXh0ZW5zaW9ucy55YW1sIHwgMTI0ICsrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRz
L2FsbHdpbm5lci9zdW4yMGktZDFzLmR0c2kgfCAgIDQgKy0KPiAgYXJjaC9yaXNjdi9ib290L2R0
cy9taWNyb2NoaXAvbXBmcy5kdHNpICAgICAgIHwgIDIwICstCj4gIGFyY2gvcmlzY3YvYm9vdC9k
dHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kgICB8ICAgNCArLQo+ICBhcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NpZml2ZS9mdTU0MC1jMDAwLmR0c2kgICAgfCAgMjAgKy0KPiAgYXJjaC9yaXNjdi9ib290
L2R0cy9zaWZpdmUvZnU3NDAtYzAwMC5kdHNpICAgIHwgIDIwICstCj4gIGFyY2gvcmlzY3YvYm9v
dC9kdHMvc29waGdvL2N2MTh4eC5kdHNpICAgICAgICB8ICAgNCArLQo+ICBhcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NvcGhnby9zZzIwNDItY3B1cy5kdHNpICAgfCAyNTYgKysrKysrKysrLS0tLS0tLS0t
Cj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTAwLmR0c2kgICAgICB8ICAgOCAr
LQo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC5kdHNpICAgICAgfCAgMjAg
Ky0KPiAgYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaSAgICAgICAgIHwgIDE2
ICstCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCAgICAgICAgICAgICAgICB8ICAg
NSArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggICAgICAgICB8ICAg
NSArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCAgICAgICAgICAgICB8ICAg
NSArCj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICAgICAgICAgICB8ICAg
NSArCj4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICAgICAgICAgICB8ICAg
NSArCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICAgICAgICAgICAgICB8ICAx
MCArCj4gIC4uLi9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jICAgICAgICB8ICAy
MCArKwo+ICAyMCBmaWxlcyBjaGFuZ2VkLCAzOTQgaW5zZXJ0aW9ucygrKSwgMTg5IGRlbGV0aW9u
cygtKQo+Cj4gLS0KPiAyLjQzLjAKPgoKTW9zdCBsaWtlbHkgdGhlIEtWTSBSSVNDLVYgcmVsYXRl
ZCBjaGFuZ2VzIGluIHRoaXMgc2VyaWVzCndpbGwgY29uZmxpY3Qgd2l0aCB0aGUgS1ZNIFJJU0Mt
ViByZXBvLgoKSSB3aWxsIHByb3ZpZGUgYSBzaGFyZWQgdGFnIGJhc2VkIG9uIDYuOS1yYzMgdG9t
b3Jyb3cgb3IKZWFybHkgbmV4dCB3ZWVrLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
