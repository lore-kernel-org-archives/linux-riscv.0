Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E75EE57F5
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 09:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxjXIkeYDMspp5w1ZxjGn3J9vZwMTch7oUzhuddgxw8=; b=XWNzQRX97Bf+BO
	bhNbO2CCjbPnJJ8yN6LwjnnssMV94iOjpIjI2jChXUYMZ4AAJeb9YG0Y/f0GZYtZUK51j+NOZBs+c
	Gx0jwCJXJdrLB9Sk57oZZgj9Y6vDUuuidHVWbMQuktAat1HUi1cIfW4MeeurU3he31Bjqq5sPTNhk
	y9u6/o3AG/CI0ceVtUl80FqTIXA/E8u6m5xcpzYi5NmImGSw3z8Bl0zXw8vKGf6Pe94V6SdwLk2JQ
	Lweh/mFIFunw6g6YBnAu2v2Tx9KXW+62+Naq3B1HGNksq96OVO1WebIBoCaDTz3qtpka3EZ8L3zUk
	Rf/GHYsIhsl2npIUUPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vasdP-00000005pay-0H8M;
	Wed, 31 Dec 2025 09:36:51 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vasdM-00000005paV-2JkV
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 09:36:49 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-646b8d2431dso2194054d50.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 Dec 2025 01:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767173807; x=1767778607; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/3+RSe7fQelQU4YkqbPxOBoE/8zH+jlMkgHbbjEj8c=;
        b=SG09kZvTR/4wobukPdwvybXenIsnGo+R1Y0lqpVXLNNX+EPhgtYgrbxnN0X4anSgmQ
         OnbWOGjWEbm1MKCmTYq29hRF5PLPZ5+Jdxc2gcmcY3+ygn2erTDYZPr44knaNSORv9FD
         MvZYLWfYNuvF1FYAUV1fAH593aD8FrP8zECaBhCOV/STkZBKowUEnO6YHA9Y65TmEEh0
         vqo5gD0TisXRDbo+Bwp4tfn2NCGDg56woE0Ev90faiYIgmuLdzjkEZg+JOiuP56zIeSn
         VL8fJ2Dp6MCU81w1KXXLzxc/8XO/qAM2ECh9y/SDoXoxiRnc9PyLklSx7f4XtIyIPayj
         PtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767173807; x=1767778607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i/3+RSe7fQelQU4YkqbPxOBoE/8zH+jlMkgHbbjEj8c=;
        b=dHnuCEJUom+sngrpIuFx3poFFIwWL3bvXEkcIxzAH7oLytxasoqikawxZrkj1G9wc/
         MB0LvkXbSXZTkwA22OzHDmVJBiZl+IcoNRX1cULsO79VNbeZilCFXlm7TJpO+u3RmSkd
         sjglrTVasLLDAN/67E8+t3C71lXs7hACacncryokdOgRpzO41gC7V+gj9BZB+LcEZeoD
         ZmyVEW5YPZLnwwTHnL+Su4gid3mqi8k8IgSZTS6Cz4I+xXGDoPDZv9+6CROMFJiCynzz
         1n01ErTigxn8AUBLMNt7KQFuWQs0dUZDRshgzC9fOaxagh+mcSR2Re5RGOqVE3cpPYPz
         oXrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj/5ZVXcIsJx331zbNIwedq7T566Mlh232UyPmaO4EyEjsEQSnFybMAbGpj0dAEWFx01BjMfTx1CByrw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh3/PeA/ci2I97O8O9Kh73XfdiWzOpeggaup8JV30zEK15DHpB
	qrctNPMtXfxlF0XZE5FNXV88jXJNr7Q8ZL9jMNHNodxBsbXAibT4MbbE4lj0+KIILVcocv0zW7A
	3NK9DJHvnXlVQYb6is51ubXnh8dEjrAGOeVlQ0HlakA==
X-Gm-Gg: AY/fxX6CRQ+rQads42GXj4S+77AYLu6vm+YK4NU4mIUOE93jQQs0jgGCSyDMJWHHYHp
	17diQfn1jhG8+pPtbHozGDbiOAzzlt93U53x7uVlul/SicatT/mRU8P1KrqpJ3wDHhfWijsJz9z
	5jEReRD8/XNYomhiItcs8z4fuoI/su/MsrWFm3zYteH3EIAHBsgLhZ61zdmWnHR45mrN1I/yS9h
	YfiffpuNAbqg7vqln54/OpMHj02AkP5sK9JqKH2TMJmXpeXlC08Dr1enTnsApgoetW5EOQ8uh2b
	OzGe50aDyHn4w9Q1NZJ6jbKFAYSIm9uaBNbUwDhLW1+c
X-Google-Smtp-Source: AGHT+IH9+gy6Ia0VNNIYxSU2fLYpk13oP/Tm8jYmi+Mtb2LEUjTmajm/ISPd0dJ9fMuHW6e5GpVdviDj+Wzpgl4ZTjE=
X-Received: by 2002:a05:690e:4cf:b0:644:60d9:8674 with SMTP id
 956f58d0204a3-6466a8d74famr22435914d50.89.1767173807173; Wed, 31 Dec 2025
 01:36:47 -0800 (PST)
MIME-Version: 1.0
References: <20251229-k3-reset-v1-0-eda0747bded3@riscstar.com>
 <20251229-k3-reset-v1-3-eda0747bded3@riscstar.com> <20251230-dashing-black-skink-45e5a6@quoll>
In-Reply-To: <20251230-dashing-black-skink-45e5a6@quoll>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 31 Dec 2025 17:36:35 +0800
X-Gm-Features: AQt7F2pQEjLh6AvJYpaZgx8RA130bkC0nRocUhcFJ6RvAy_4of4qZC5SF6hClOo
Message-ID: <CAH1PCMYG6DEj-oq_S8GNddF0m=tt+h313i9HXjFi7DkeRc7DiA@mail.gmail.com>
Subject: Re: [PATCH 3/4] reset: spacemit: Extract common K1 reset code
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_013648_714690_940BB379 
X-CRM114-Status: GOOD (  26.77  )
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

SGkgS3J6eXN6dG9mLAoKT24gVHVlLCBEZWMgMzAsIDIwMjUgYXQgODoyM+KAr1BNIEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIERlYyAyOSwg
MjAyNSBhdCAwNzowNDowNlBNICswODAwLCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gRXh0cmFjdCB0
aGUgY29tbW9uIHJlc2V0IGNvbnRyb2xsZXIgY29kZSBmcm9tIHRoZSBLMSBkcml2ZXIgaW50bwo+
ID4gc2VwYXJhdGUgcmVzZXQtc3BhY2VtaXQtY29tbW9uLntjLGh9IGZpbGVzLiBUaGlzIHByZXBh
cmVzIGZvcgo+ID4gYWRkaXRpb25hbCBTcGFjZW1pVCBTb0NzIHRoYXQgc2hhcmUgdGhlIHNhbWUg
cmVzZXQgY29udHJvbGxlcgo+ID4gYXJjaGl0ZWN0dXJlLgo+ID4KPiA+IFRoZSBjb21tb24gY29k
ZSBub3cgaW5jbHVkZXMgaGFuZGxlcnMgZm9yIHJlc2V0IGFzc2VydAo+ID4gZGVhc3NlcnQgb3Bl
cmF0aW9ucyBhbmQgcHJvYmluZyBmb3IgYXV4aWxpYXJ5IGJ1cyBkZXZpY2VzLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlzY3N0YXIuY29tPgo+ID4gLS0tCj4g
PiAgZHJpdmVycy9yZXNldC9zcGFjZW1pdC9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAxNyAr
KystCj4gPiAgZHJpdmVycy9yZXNldC9zcGFjZW1pdC9NYWtlZmlsZSAgICAgICAgICAgICAgICB8
ICAgMiArCj4gPiAgZHJpdmVycy9yZXNldC9zcGFjZW1pdC9yZXNldC1zcGFjZW1pdC1jb21tb24u
YyB8ICA3OSArKysrKysrKysrKysrKysrKwo+ID4gIGRyaXZlcnMvcmVzZXQvc3BhY2VtaXQvcmVz
ZXQtc3BhY2VtaXQtY29tbW9uLmggfCAgNTMgKysrKysrKysrKysrCj4gPiAgZHJpdmVycy9yZXNl
dC9zcGFjZW1pdC9yZXNldC1zcGFjZW1pdC1rMS5jICAgICB8IDExMyArKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gPiAgNSBmaWxlcyBjaGFuZ2VkLCAxNTggaW5zZXJ0aW9ucygrKSwgMTA2IGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Jlc2V0L3NwYWNlbWl0L0tj
b25maWcgYi9kcml2ZXJzL3Jlc2V0L3NwYWNlbWl0L0tjb25maWcKPiA+IGluZGV4IDU1Mjg4NGU4
YjcyYS4uNTZhNDg1OGIzMGUxIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9yZXNldC9zcGFjZW1p
dC9LY29uZmlnCj4gPiArKysgYi9kcml2ZXJzL3Jlc2V0L3NwYWNlbWl0L0tjb25maWcKPiA+IEBA
IC0xLDEwICsxLDIwIEBACj4gPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5Cj4gPgo+ID4gLWNvbmZpZyBSRVNFVF9TUEFDRU1JVF9LMQo+ID4gLSAgICAgdHJpc3RhdGUg
IlNwYWNlbWlUIEsxIHJlc2V0IGRyaXZlciIKPiA+ICttZW51ICJSZXNldCBzdXBwb3J0IGZvciBT
cGFjZW1pVCBwbGF0Zm9ybXMiCj4gPiAgICAgICBkZXBlbmRzIG9uIEFSQ0hfU1BBQ0VNSVQgfHwg
Q09NUElMRV9URVNUCj4gPiAtICAgICBkZXBlbmRzIG9uIFNQQUNFTUlUX0sxX0NDVQo+ID4gKwo+
ID4gK2NvbmZpZyBSRVNFVF9TUEFDRU1JVF9DT01NT04KPiA+ICsgICAgIHRyaXN0YXRlCj4gPiAg
ICAgICBzZWxlY3QgQVVYSUxJQVJZX0JVUwo+ID4gKyAgICAgaGVscAo+ID4gKyAgICAgICBDb21t
b24gcmVzZXQgY29udHJvbGxlciBpbmZyYXN0cnVjdHVyZSBmb3IgU3BhY2VtaVQgU29Dcy4KPiA+
ICsgICAgICAgVGhpcyBwcm92aWRlcyBzaGFyZWQgY29kZSBhbmQgaGVscGVyIGZ1bmN0aW9ucyB1
c2VkIGJ5Cj4gPiArICAgICAgIHJlc2V0IGRyaXZlcnMgZm9yIHZhcmlvdXMgU3BhY2VtaVQgU29D
IGZhbWlsaWVzLgo+ID4gKwo+ID4gK2NvbmZpZyBSRVNFVF9TUEFDRU1JVF9LMQo+ID4gKyAgICAg
dHJpc3RhdGUgIlN1cHBvcnQgZm9yIFNwYWNlbWlUIEsxIFNvQyIKPiA+ICsgICAgIGRlcGVuZHMg
b24gU1BBQ0VNSVRfSzFfQ0NVCj4gPiArICAgICBzZWxlY3QgUkVTRVRfU1BBQ0VNSVRfQ09NTU9O
Cj4gPiAgICAgICBkZWZhdWx0IFNQQUNFTUlUX0sxX0NDVQo+ID4gICAgICAgaGVscAo+ID4gICAg
ICAgICBTdXBwb3J0IGZvciByZXNldCBjb250cm9sbGVyIGluIFNwYWNlbWlUIEsxIFNvQy4KPiA+
IEBAIC0xMiwzICsyMiw0IEBAIGNvbmZpZyBSRVNFVF9TUEFDRU1JVF9LMQo+ID4gICAgICAgICB1
bml0IChDQ1UpIGRyaXZlciB0byBwcm92aWRlIHJlc2V0IGNvbnRyb2wgZnVuY3Rpb25hbGl0eQo+
ID4gICAgICAgICBmb3IgdmFyaW91cyBwZXJpcGhlcmFscyBhbmQgc3Vic3lzdGVtcyBpbiB0aGUg
U29DLgo+ID4KPiA+ICtlbmRtZW51Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9zcGFj
ZW1pdC9NYWtlZmlsZSBiL2RyaXZlcnMvcmVzZXQvc3BhY2VtaXQvTWFrZWZpbGUKPiA+IGluZGV4
IGRlN2UzNThjNzRmZC4uZmVjZGE5ZjIxMWIyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9yZXNl
dC9zcGFjZW1pdC9NYWtlZmlsZQo+ID4gKysrIGIvZHJpdmVycy9yZXNldC9zcGFjZW1pdC9NYWtl
ZmlsZQo+ID4gQEAgLTEsMyArMSw1IEBACj4gPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMAo+ID4gK29iai0kKENPTkZJR19SRVNFVF9TUEFDRU1JVF9DT01NT04pICArPSByZXNl
dC1zcGFjZW1pdC1jb21tb24ubwo+ID4gKwo+ID4gIG9iai0kKENPTkZJR19SRVNFVF9TUEFDRU1J
VF9LMSkgICAgICAgICAgICAgICs9IHJlc2V0LXNwYWNlbWl0LWsxLm8KPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9yZXNldC9zcGFjZW1pdC9yZXNldC1zcGFjZW1pdC1jb21tb24uYyBiL2Ry
aXZlcnMvcmVzZXQvc3BhY2VtaXQvcmVzZXQtc3BhY2VtaXQtY29tbW9uLmMKPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmU0YjNmMGUyYzU5ZAo+ID4gLS0t
IC9kZXYvbnVsbAo+ID4gKysrIGIvZHJpdmVycy9yZXNldC9zcGFjZW1pdC9yZXNldC1zcGFjZW1p
dC1jb21tb24uYwo+ID4gQEAgLTAsMCArMSw3OSBAQAo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9ubHkKPiA+ICsKPiA+ICsvKiBTcGFjZW1pVCByZXNldCBjb250cm9s
bGVyIGRyaXZlciAtIGNvbW1vbiBpbXBsZW1lbnRhdGlvbiAqLwo+ID4gKwo+ID4gKyNpbmNsdWRl
IDxsaW51eC9jb250YWluZXJfb2YuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+Cj4g
PiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ID4gKwo+ID4gKyNpbmNsdWRlIDxzb2Mvc3Bh
Y2VtaXQvY2N1Lmg+Cj4gPiArCj4gPiArI2luY2x1ZGUgInJlc2V0LXNwYWNlbWl0LWNvbW1vbi5o
Igo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgc3BhY2VtaXRfcmVzZXRfdXBkYXRlKHN0cnVjdCByZXNl
dF9jb250cm9sbGVyX2RldiAqcmNkZXYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyBpZCwgYm9vbCBhc3NlcnQpCj4gPiArewo+ID4gKyAgICAgc3RydWN0
IGNjdV9yZXNldF9jb250cm9sbGVyICpjb250cm9sbGVyOwo+ID4gKyAgICAgY29uc3Qgc3RydWN0
IGNjdV9yZXNldF9kYXRhICpkYXRhOwo+ID4gKyAgICAgdTMyIG1hc2s7Cj4gPiArICAgICB1MzIg
dmFsOwo+ID4gKwo+ID4gKyAgICAgY29udHJvbGxlciA9IGNvbnRhaW5lcl9vZihyY2Rldiwgc3Ry
dWN0IGNjdV9yZXNldF9jb250cm9sbGVyLCByY2Rldik7Cj4gPiArICAgICBkYXRhID0gJmNvbnRy
b2xsZXItPmRhdGEtPnJlc2V0X2RhdGFbaWRdOwo+ID4gKyAgICAgbWFzayA9IGRhdGEtPmFzc2Vy
dF9tYXNrIHwgZGF0YS0+ZGVhc3NlcnRfbWFzazsKPiA+ICsgICAgIHZhbCA9IGFzc2VydCA/IGRh
dGEtPmFzc2VydF9tYXNrIDogZGF0YS0+ZGVhc3NlcnRfbWFzazsKPiA+ICsKPiA+ICsgICAgIHJl
dHVybiByZWdtYXBfdXBkYXRlX2JpdHMoY29udHJvbGxlci0+cmVnbWFwLCBkYXRhLT5vZmZzZXQs
IG1hc2ssIHZhbCk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgc3BhY2VtaXRfcmVzZXRf
YXNzZXJ0KHN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBpZCkKPiA+ICt7Cj4gPiArICAgICBy
ZXR1cm4gc3BhY2VtaXRfcmVzZXRfdXBkYXRlKHJjZGV2LCBpZCwgdHJ1ZSk7Cj4gPiArfQo+ID4g
Kwo+ID4gK3N0YXRpYyBpbnQgc3BhY2VtaXRfcmVzZXRfZGVhc3NlcnQoc3RydWN0IHJlc2V0X2Nv
bnRyb2xsZXJfZGV2ICpyY2RldiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgaWQpCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIHNwYWNlbWl0X3Jlc2V0
X3VwZGF0ZShyY2RldiwgaWQsIGZhbHNlKTsKPiA+ICt9Cj4gPiArCj4gPiArY29uc3Qgc3RydWN0
IHJlc2V0X2NvbnRyb2xfb3BzIHNwYWNlbWl0X3Jlc2V0X2NvbnRyb2xfb3BzID0gewo+ID4gKyAg
ICAgLmFzc2VydCAgICAgICAgID0gc3BhY2VtaXRfcmVzZXRfYXNzZXJ0LAo+ID4gKyAgICAgLmRl
YXNzZXJ0ICAgICAgID0gc3BhY2VtaXRfcmVzZXRfZGVhc3NlcnQsCj4gPiArfTsKPiA+ICtFWFBP
UlRfU1lNQk9MX0dQTChzcGFjZW1pdF9yZXNldF9jb250cm9sX29wcyk7Cj4gPiArCj4gPiArc3Rh
dGljIGludCBzcGFjZW1pdF9yZXNldF9jb250cm9sbGVyX3JlZ2lzdGVyKHN0cnVjdCBkZXZpY2Ug
KmRldiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IGNjdV9yZXNldF9jb250cm9sbGVyICpjb250cm9sbGVyKQo+ID4gK3sKPiA+ICsgICAgIHN0
cnVjdCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYgPSAmY29udHJvbGxlci0+cmNkZXY7Cj4g
PiArCj4gPiArICAgICByY2Rldi0+b3BzID0gJnNwYWNlbWl0X3Jlc2V0X2NvbnRyb2xfb3BzOwo+
ID4gKyAgICAgcmNkZXYtPm93bmVyID0gVEhJU19NT0RVTEU7Cj4KPiBTbyB3aG8gaXMgbm93IHRo
ZSBvd25lcj8gVGhpcyBtb2R1bGUgb3IgYWN0dWFsIGRyaXZlciBjYWxsaW5nIGFuZCB1c2luZwo+
IHRoaXM/CgpZb3UncmUgYWJzb2x1dGVseSByaWdodCwgZ29vZCBjYXRjaCAmIHRoYW5rIHlvdSEK
CkknbGwgZml4IGl0IGluIHRoZSB2MiB2ZXJzaW9uIHdpdGg6CgogcmNkZXYtPm93bmVyID0gZGV2
LT5kcml2ZXItPm93bmVyOwoKQmVzdCByZWdhcmRzLApHdW9kb25nIFh1Cgo+Cj4gVGhpcyBmZWVs
cyBidWdneSwgYXNzdW1pbmcgdGhpcyBpcyBhIG1vZHVsZSBhbmQgeW91cgo+IE1PRFVMRV9ERVND
UklQVElPTigpIGNsZWFybHkgc3VnZ2VzdHMgdGhhdC4KPgo+Cj4gQmVzdCByZWdhcmRzLAo+IEty
enlzenRvZgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
