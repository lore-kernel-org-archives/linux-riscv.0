Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C86C02181
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 17:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kLqChCLv1gT4CKbCyq6cAX/dJtBxlPjYvR/4JfiqmE0=; b=0XDdzmeUhxR08R
	197r0c9sXDTE1Pr3Ge57ViC7ebm+8ZVov6vLflFT0MqzNQtQdz87slywdVIf6ihmIDE+ePE9yUbbR
	1RqNL4TmYv3M8OvHFn4TP6jIO37le7YNtnwqQOLnNAaW/XFUW237JQ0SInxgMAbT0wbD2LuPJwFtP
	OCVvFfrVOZsakQaSvaywg+oBy5BKC3idRAjnEBgRuQ3Pn0NmS+i7Ts2aLw2SdFZN9vr54OVVFO4/x
	PuV0/E5xFCGLiDfP87I7RY6xvLsErv8iclpghFkqke7ZBd1aWw+VaajcGQY7WWUG6Yz0TFtbBlxIi
	Qer2nLhJoRDib95bAb3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taed6-0000000Asxj-36ut;
	Wed, 22 Jan 2025 17:35:04 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taed3-0000000AswZ-2lYa
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 17:35:02 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2165cb60719so121244555ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2025 09:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737567300; x=1738172100; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IAEG7j3YoAapRtz5l9O6FiT3v3lTn5Cx8ci+PI4OmP8=;
        b=vZIWuEf+w48myPXRA2FT3N5LfTE/20qAXgWho9y18aG+nIFVIVuvnOqG/YhBtG41yl
         kBQqbXcn7bG/Q5XIR7JRlf5lVGblxtTrkvQ8baR3dFbrQklsGQp7YAGrZ5wkddTosvds
         sDryls98QGGJoZKde1RZwbHwdFR0UxEERKLsQrhykmacGv5LFrkmUeanFAnGW+5Yczv7
         q7Hhwlbfc+7cY3zkJZuc1iNT7C6yKQlO14Mp0BRC+o+v01yHqCF5BqQCc2irIT6ZV0lI
         nuoDCrjCeSKx2VauwG8kpaTpPxe9oUEZaMfGGbcXUs8C6z+Rde9D9GQcw0FcLY/hCzzA
         nefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737567300; x=1738172100;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IAEG7j3YoAapRtz5l9O6FiT3v3lTn5Cx8ci+PI4OmP8=;
        b=hmI6QgRzu1zbbkXzbrcQh4AKiiwbS4duOwQCfOgKmJsqUsR6FzNiS+wwN/b2KLbEBs
         ow1yPAYSbgCCUO7jrm87DIKDShYm71U1oDdTRK8KwYYRPTXdH2O+rIYdcR8cpHNQXkt7
         2GfuW27MT2rxyU2zbiPX2Pl6U06V6Ab7Isj6lXVwfouC9Qrki+904VpRCM7YxZx8pT6/
         n+iYvkqP3sbFBUk939mSCcT5thdoSB9q5kUzGMFtIUkg5flqwindqPvF0TsbjmFSTyb8
         rMCHFhqBdBxOEd4Y16Bruv92wsb6NWHC5yIZOyQtay/UFsr8YTrgnzLhnsJeunF/cLv/
         uv8w==
X-Forwarded-Encrypted: i=1; AJvYcCVqO0TjylKZXw9sTbQRJV7G975b3rcAm8OCRvStPkTg2Cu6aPQvS7HBpL0KVXVjBJh6iJ2YhCfyb3kdMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVPzuJiwlxEmRChd0H/N28qzjsww/vYdgiGTBULXWQFtXl2PwC
	aJkFf0jpJfsCCz2biVPmdW2csRB2o184hMjokgIqxmcHdFgEx6pzWn9CzoTKXw==
X-Gm-Gg: ASbGncsKh8MYMTXv+a8QYvNiwL7oOaAmXIoDczHkfzWIDwP0hPxdu13ggxh1Aeo7GAT
	VVmvoFvz6lP2s34RV3NhBGyybtgjmHIbH+et2kXhtsoRSMfL8+KFZTrdlf1SagjzkHuLIZOH69k
	EB1yQQUNZKBbxCQKKk5L25A6YLvbBchbBfHjzk9WceNW6ZfMrAqN8vA4TP6+Xd/9hEvcVVwlko3
	AcrXtQhgf9vFGapwIUpvtEsMPAObBHeCygYWxbdFKr8bix5Xj00RqBv9AwyJjDyfJyw6E1mEYkc
	akPj
X-Google-Smtp-Source: AGHT+IE8NIEOlYRScPXYRwjMD5LqVC4ujNKCuJjI3vvVMMsUgArz6g9GAHMD2cEjtZmCMQ2tnFfX6w==
X-Received: by 2002:a17:902:e548:b0:215:e98c:c5bb with SMTP id d9443c01a7336-21c3555353dmr341753835ad.28.1737567300134;
        Wed, 22 Jan 2025 09:35:00 -0800 (PST)
Received: from thinkpad ([36.255.17.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d6b298dsm98301135ad.245.2025.01.22.09.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 09:34:59 -0800 (PST)
Date: Wed, 22 Jan 2025 23:04:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Chen Wang <unicorn_wang@outlook.com>, maz@kernel.org
Cc: Chen Wang <unicornxw@gmail.com>, kw@linux.com,
	u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
	bhelgaas@google.com, conor+dt@kernel.org, guoren@kernel.org,
	inochiama@outlook.com, krzk+dt@kernel.org, lee@kernel.org,
	lpieralisi@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	pbrobinson@gmail.com, robh@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com,
	helgaas@kernel.org
Subject: Re: [PATCH v3 2/5] PCI: sg2042: Add Sophgo SG2042 PCIe driver
Message-ID: <20250122173451.5c7pdchnyee7iy6t@thinkpad>
References: <cover.1736923025.git.unicorn_wang@outlook.com>
 <ddedd8f76f83fea2c6d3887132d2fe6f2a6a02c1.1736923025.git.unicorn_wang@outlook.com>
 <20250119122353.v3tzitthmu5tu3dg@thinkpad>
 <BM1PR01MB254540560C1281CE9898A5A0FEE12@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BM1PR01MB254540560C1281CE9898A5A0FEE12@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_093501_702467_08652813 
X-CRM114-Status: GOOD (  41.05  )
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

KyBNYXJjIChmb3IgdGhlIElSUUNISVAgaW1wbGVtZW50YXRpb24gcmV2aWV3KQoKT24gV2VkLCBK
YW4gMjIsIDIwMjUgYXQgMDk6Mjg6MTJQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3RlOgo+IAo+IE9u
IDIwMjUvMS8xOSAyMDoyMywgTWFuaXZhbm5hbiBTYWRoYXNpdmFtIHdyb3RlOgo+ID4gT24gV2Vk
LCBKYW4gMTUsIDIwMjUgYXQgMDM6MDY6NTdQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3RlOgo+ID4g
PiBGcm9tOiBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPiA+ID4gCj4gPiA+
IEFkZCBzdXBwb3J0IGZvciBQQ0llIGNvbnRyb2xsZXIgaW4gU0cyMDQyIFNvQy4gVGhlIGNvbnRy
b2xsZXIKPiA+ID4gdXNlcyB0aGUgQ2FkZW5jZSBQQ0llIGNvcmUgcHJvZ3JhbW1lZCBieSBwY2ll
LWNhZGVuY2UqLmMuIFRoZQo+ID4gPiBQQ0llIGNvbnRyb2xsZXIgd2lsbCB3b3JrIGluIGhvc3Qg
bW9kZSBvbmx5Lgo+ID4gPiAKPiA+IFBsZWFzZSBhZGQgbW9yZSBpbmZvIGFib3V0IHRoZSBJUC4g
TGlrZSBJUCByZXZpc2lvbiwgUENJZSBHZW4sIGxhbmUgY291bnQsCj4gPiBldGMuLi4KPiBvay4K
PiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+
Cj4gPiA+IC0tLQo+ID4gPiAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvY2FkZW5jZS9LY29uZmln
ICAgICAgIHwgIDEzICsKPiA+ID4gICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVuY2UvTWFr
ZWZpbGUgICAgICB8ICAgMSArCj4gPiA+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9jYWRlbmNl
L3BjaWUtc2cyMDQyLmMgfCA1MjggKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgIDMgZmlsZXMg
Y2hhbmdlZCwgNTQyIGluc2VydGlvbnMoKykKPiA+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9wY2kvY29udHJvbGxlci9jYWRlbmNlL3BjaWUtc2cyMDQyLmMKPiA+ID4gCj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVuY2UvS2NvbmZpZyBiL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvY2FkZW5jZS9LY29uZmlnCj4gPiA+IGluZGV4IDhhMDA0NGJiMzk4
OS4uMjkyZWIyYjIwZTljIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L2NhZGVuY2UvS2NvbmZpZwo+ID4gPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2NhZGVu
Y2UvS2NvbmZpZwo+ID4gPiBAQCAtNDIsNiArNDIsMTggQEAgY29uZmlnIFBDSUVfQ0FERU5DRV9Q
TEFUX0VQCj4gPiA+ICAgCSAgZW5kcG9pbnQgbW9kZS4gVGhpcyBQQ0llIGNvbnRyb2xsZXIgbWF5
IGJlIGVtYmVkZGVkIGludG8gbWFueQo+ID4gPiAgIAkgIGRpZmZlcmVudCB2ZW5kb3JzIFNvQ3Mu
Cj4gPiA+ICtjb25maWcgUENJRV9TRzIwNDIKPiA+ID4gKwlib29sICJTb3BoZ28gU0cyMDQyIFBD
SWUgY29udHJvbGxlciAoaG9zdCBtb2RlKSIKPiA+ID4gKwlkZXBlbmRzIG9uIEFSQ0hfU09QSEdP
IHx8IENPTVBJTEVfVEVTVAo+ID4gPiArCWRlcGVuZHMgb24gT0YKPiA+ID4gKwlzZWxlY3QgSVJR
X01TSV9MSUIKPiA+ID4gKwlzZWxlY3QgUENJX01TSQo+ID4gPiArCXNlbGVjdCBQQ0lFX0NBREVO
Q0VfSE9TVAo+ID4gPiArCWhlbHAKPiA+ID4gKwkgIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdG8g
c3VwcG9ydCB0aGUgU29waGdvIFNHMjA0MiBQQ0llIHBsYXRmb3JtCj4gPiA+ICsJICBjb250cm9s
bGVyIGluIGhvc3QgbW9kZS4gU29waGdvIFNHMjA0MiBQQ0llIGNvbnRyb2xsZXIgdXNlcyBDYWRl
bmNlCj4gPiA+ICsJICBQQ0llIGNvcmUuCj4gPiA+ICsKPiA+ID4gICBjb25maWcgUENJX0o3MjFF
Cj4gPiA+ICAgCWJvb2wKPiA+ID4gQEAgLTY3LDQgKzc5LDUgQEAgY29uZmlnIFBDSV9KNzIxRV9F
UAo+ID4gPiAgIAkgIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdG8gc3VwcG9ydCB0aGUgVEkgSjcy
MUUgUENJZSBwbGF0Zm9ybQo+ID4gPiAgIAkgIGNvbnRyb2xsZXIgaW4gZW5kcG9pbnQgbW9kZS4g
VEkgSjcyMUUgUENJZSBjb250cm9sbGVyIHVzZXMgQ2FkZW5jZSBQQ0llCj4gPiA+ICAgCSAgY29y
ZS4KPiA+ID4gKwo+ID4gU3B1cmlvdXMgbmV3bGluZS4KPiAKPiBvb3BzLCBJIHdpbGwgZml4IHRo
aXMuCj4gCj4gWy4uLi4uLl0KPiAKPiA+ID4gKy8qCj4gPiA+ICsgKiBTRzIwNDIgUENJZSBjb250
cm9sbGVyIHN1cHBvcnRzIHR3byB3YXlzIHRvIHJlcG9ydCBNU0k6Cj4gPiA+ICsgKgo+ID4gPiAr
ICogLSBNZXRob2QgQSwgdGhlIFBDSWUgY29udHJvbGxlciBpbXBsZW1lbnRzIGFuIE1TSSBpbnRl
cnJ1cHQgY29udHJvbGxlcgo+ID4gPiArICogICBpbnNpZGUsIGFuZCBjb25uZWN0IHRvIFBMSUMg
dXB3YXJkIHRocm91Z2ggb25lIGludGVycnVwdCBsaW5lLgo+ID4gPiArICogICBQcm92aWRlcyBt
ZW1vcnktbWFwcGVkIE1TSSBhZGRyZXNzLCBhbmQgYnkgcHJvZ3JhbW1pbmcgdGhlIHVwcGVyIDMy
Cj4gPiA+ICsgKiAgIGJpdHMgb2YgdGhlIGFkZHJlc3MgdG8gemVybywgaXQgY2FuIGJlIGNvbXBh
dGlibGUgd2l0aCBvbGQgUENJZSBkZXZpY2VzCj4gPiA+ICsgKiAgIHRoYXQgb25seSBzdXBwb3J0
IDMyLWJpdCBNU0kgYWRkcmVzcy4KPiA+ID4gKyAqCj4gPiA+ICsgKiAtIE1ldGhvZCBCLCB0aGUg
UENJZSBjb250cm9sbGVyIGNvbm5lY3RzIHRvIFBMSUMgdXB3YXJkIHRocm91Z2ggYW4KPiA+ID4g
KyAqICAgaW5kZXBlbmRlbnQgTVNJIGNvbnRyb2xsZXIgInNvcGhnbyxzZzIwNDItbXNpIiBvbiB0
aGUgU09DLiBUaGUgTVNJCj4gPiA+ICsgKiAgIGNvbnRyb2xsZXIgcHJvdmlkZXMgbXVsdGlwbGUo
dXAgdG8gMzIpIGludGVycnVwdCBzb3VyY2VzIHRvIFBMSUMuCj4gPiA+ICsgKiAgIENvbXBhcmVk
IHdpdGggdGhlIGZpcnN0IG1ldGhvZCwgdGhlIGFkdmFudGFnZSBpcyB0aGF0IHRoZSBpbnRlcnJ1
cHQKPiA+ID4gKyAqICAgc291cmNlIGlzIGV4cGFuZGVkLCBidXQgYmVjYXVzZSBmb3IgU0cyMDQy
LCB0aGUgTVNJIGFkZHJlc3MgcHJvdmlkZWQgYnkKPiA+ID4gKyAqICAgdGhlIE1TSSBjb250cm9s
bGVyIGlzIGZpeGVkIGFuZCBvbmx5IHN1cHBvcnRzIDY0LWJpdCBhZGRyZXNzKD4gMl4zMiksCj4g
PiA+ICsgKiAgIGl0IGlzIG5vdCBjb21wYXRpYmxlIHdpdGggb2xkIFBDSWUgZGV2aWNlcyB0aGF0
IG9ubHkgc3VwcG9ydCAzMi1iaXQgTVNJCj4gPiA+ICsgKiAgIGFkZHJlc3MuCj4gPiA+ICsgKgo+
ID4gPiArICogTWV0aG9kIEEgJiBCIGNhbiBiZSBjb25maWd1cmVkIGluIERUUywgZGVmYXVsdCBp
cyBNZXRob2QgQi4KPiA+IEhvdyB0byBjb25maWd1cmUgdGhlbT8gSSBjYW4gb25seSBzZWUgInNv
cGhnbyxzZzIwNDItbXNpIiBpbiB0aGUgYmluZGluZy4KPiAKPiAKPiBUaGUgdmFsdWUgb2YgdGhl
IG1zaS1wYXJlbnQgYXR0cmlidXRlIGlzIHVzZWQgaW4gZHRzIHRvIGRpc3Rpbmd1aXNoIHRoZW0s
Cj4gZm9yIGV4YW1wbGU6Cj4gCj4gYGBgZHRzCj4gCj4gbXNpOiBtc2ktY29udHJvbGxlckA3MDMw
MDEwMzAwIHsKPiDCoMKgwqAgLi4uLi4uCj4gfTsKPiAKPiBwY2llX3JjMDogcGNpZUA3MDYwMDAw
MDAwIHsKPiDCoMKgwqAgbXNpLXBhcmVudCA9IDwmbXNpPjsKPiB9Owo+IAo+IHBjaWVfcmMxOiBw
Y2llQDcwNjIwMDAwMDAgewo+IMKgwqDCoCAuLi4uLi4KPiDCoMKgwqAgbXNpLXBhcmVudCA9IDwm
bXNpX3BjaWU+Owo+IMKgwqDCoCBtc2lfcGNpZTogaW50ZXJydXB0LWNvbnRyb2xsZXIgewo+IMKg
wqDCoMKgwqDCoMKgIC4uLi4uLgo+IMKgwqDCoCB9Owo+IH07Cj4gCj4gYGBgCj4gCj4gV2hpY2gg
bWVhbnM6Cj4gCj4gcGNpZV9yYzAgdXNlcyBNZXRob2QgQgo+IAo+IHBjaWVfcmMxIHVzZXMgTWV0
aG9kIEEuCj4gCgpPay4geW91IG1lbnRpb25lZCAnZGVmYXVsdCBtZXRob2QnIHdoaWNoIGlzIG5v
dCBhY2N1cmF0ZSBzaW5jZSB0aGUgY2hvaWNlCm9idmlvdXNseSBkZXBlbmRzIG9uIERULiBNYXli
ZSB5b3Ugc2hvdWxkIHNheSwgJ2NvbW1vbmx5IHVzZWQgbWV0aG9kJz8gQnV0IGJvdGgKdGhlIGJp
bmRpbmcgYW5kIGR0cyBwYXRjaGVzIG1ha2UgdXNlIG9mIGluLWJ1aWx0IE1TSSBjb250cm9sbGVy
IG9ubHkgKG1ldGhvZCBBKS4KCkluIGdlbmVyYWwsIGZvciBNU0kgaW1wbGVtZW50YXRpb25zIGlu
c2lkZSB0aGUgUENJZSBJUCwgd2UgZG9uJ3QgdXN1YWxseSBhZGQgYQpkZWRpY2F0ZWQgZGV2aWNl
dHJlZSBub2RlIHNpbmNlIHRoZSBJUCBpcyB0aGUgc2FtZS4gQnV0IGluIHlvdXIgcmVwbHkgdG8g
dGhlIG15CnF1ZXN0aW9uIG9uIHRoZSBiaW5kaW5ncyBwYXRjaCwgeW91IHNhaWQgaXQgaXMgYSBz
ZXBhcmF0ZSBJUC4gSSdtIGNvbmZ1c2VkIG5vdy4KCj4gWy4uLi4uLl0KPiAKPiA+ID4gK3N0cnVj
dCBzZzIwNDJfcGNpZSB7Cj4gPiA+ICsJc3RydWN0IGNkbnNfcGNpZQkqY2Ruc19wY2llOwo+ID4g
PiArCj4gPiA+ICsJc3RydWN0IHJlZ21hcAkJKnN5c2NvbjsKPiA+ID4gKwo+ID4gPiArCXUzMgkJ
CWxpbmtfaWQ7Cj4gPiA+ICsKPiA+ID4gKwlzdHJ1Y3QgaXJxX2RvbWFpbgkqbXNpX2RvbWFpbjsK
PiA+ID4gKwo+ID4gPiArCWludAkJCW1zaV9pcnE7Cj4gPiA+ICsKPiA+ID4gKwlkbWFfYWRkcl90
CQltc2lfcGh5czsKPiA+ID4gKwl2b2lkCQkJKm1zaV92aXJ0Owo+ID4gPiArCj4gPiA+ICsJdTMy
CQkJbnVtX2FwcGxpZWRfdmVjczsgLyogdXNlZCB0byBzcGVlZCB1cCBJU1IgKi8KPiA+ID4gKwo+
ID4gR2V0IHJpZCBvZiB0aGUgbmV3bGluZSBiZXR3ZWVuIHN0cnVjdCBtZW1iZXJzLCBwbGVhc2Uu
Cj4gb2sKPiA+ID4gKwlyYXdfc3BpbmxvY2tfdAkJbXNpX2xvY2s7Cj4gPiA+ICsJREVDTEFSRV9C
SVRNQVAobXNpX2lycV9pbl91c2UsIE1BWF9NU0lfSVJRUyk7Cj4gPiA+ICt9Owo+ID4gPiArCj4g
PiBbLi4uXQo+ID4gCj4gPiA+ICtzdGF0aWMgaW50IHNnMjA0Ml9wY2llX3NldHVwX21zaShzdHJ1
Y3Qgc2cyMDQyX3BjaWUgKnBjaWUsCj4gPiA+ICsJCQkJIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbXNp
X25vZGUpCj4gPiA+ICt7Cj4gPiA+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gcGNpZS0+Y2Ruc19w
Y2llLT5kZXY7Cj4gPiA+ICsJc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSA9IG9mX25vZGVf
dG9fZndub2RlKGRldi0+b2Zfbm9kZSk7Cj4gPiA+ICsJc3RydWN0IGlycV9kb21haW4gKnBhcmVu
dF9kb21haW47Cj4gPiA+ICsJaW50IHJldCA9IDA7Cj4gPiA+ICsKPiA+ID4gKwlpZiAoIW9mX3By
b3BlcnR5X3JlYWRfYm9vbChtc2lfbm9kZSwgIm1zaS1jb250cm9sbGVyIikpCj4gPiA+ICsJCXJl
dHVybiAtRU5PREVWOwo+ID4gPiArCj4gPiA+ICsJcmV0ID0gb2ZfaXJxX2dldF9ieW5hbWUobXNp
X25vZGUsICJtc2kiKTsKPiA+ID4gKwlpZiAocmV0IDw9IDApIHsKPiA+ID4gKwkJZGV2X2Vycihk
ZXYsICIlcE9GOiBmYWlsZWQgdG8gZ2V0IE1TSSBpcnFcbiIsIG1zaV9ub2RlKTsKPiA+ID4gKwkJ
cmV0dXJuIHJldDsKPiA+ID4gKwl9Cj4gPiA+ICsJcGNpZS0+bXNpX2lycSA9IHJldDsKPiA+ID4g
Kwo+ID4gPiArCWlycV9zZXRfY2hhaW5lZF9oYW5kbGVyX2FuZF9kYXRhKHBjaWUtPm1zaV9pcnEs
Cj4gPiA+ICsJCQkJCSBzZzIwNDJfcGNpZV9tc2lfY2hhaW5lZF9pc3IsIHBjaWUpOwo+ID4gPiAr
Cj4gPiA+ICsJcGFyZW50X2RvbWFpbiA9IGlycV9kb21haW5fY3JlYXRlX2xpbmVhcihmd25vZGUs
IE1TSV9ERUZfTlVNX1ZFQ1RPUlMsCj4gPiA+ICsJCQkJCQkgJnNnMjA0Ml9wY2llX21zaV9kb21h
aW5fb3BzLCBwY2llKTsKPiA+ID4gKwlpZiAoIXBhcmVudF9kb21haW4pIHsKPiA+ID4gKwkJZGV2
X2VycihkZXYsICIlcGZ3OiBGYWlsZWQgdG8gY3JlYXRlIElSUSBkb21haW5cbiIsIGZ3bm9kZSk7
Cj4gPiA+ICsJCXJldHVybiAtRU5PTUVNOwo+ID4gPiArCX0KPiA+ID4gKwlpcnFfZG9tYWluX3Vw
ZGF0ZV9idXNfdG9rZW4ocGFyZW50X2RvbWFpbiwgRE9NQUlOX0JVU19ORVhVUyk7Cj4gPiA+ICsK
PiA+IFRoZSBNU0kgY29udHJvbGxlciBpcyB3aXJlZCB0byBQTElDIGlzbid0IGl0PyBJZiBzbywg
d2h5IGNhbid0IHlvdSB1c2UKPiA+IGhpZXJhcmNoaWFsIE1TSSBkb21haW4gaW1wbGVtZW50YXRp
b24gYXMgbGlrZSBvdGhlciBjb250cm9sbGVyIGRyaXZlcnM/Cj4gCj4gVGhlIG1ldGhvZCB1c2Vk
IGhlcmUgaXMgc29tZXdoYXQgc2ltaWxhciB0byBkd19wY2llX2FsbG9jYXRlX2RvbWFpbnMoKSBp
bgo+IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1ob3N0LmMuIFRo
aXMgTVNJIGNvbnRyb2xsZXIgaXMKPiBhYm91dCBNZXRob2QgQSwgdGhlIFBDSWUgY29udHJvbGxl
ciBpbXBsZW1lbnRzIGFuIE1TSSBpbnRlcnJ1cHQgY29udHJvbGxlcgo+IGluc2lkZSwgYW5kIGNv
bm5lY3QgdG8gUExJQyB1cHdhcmQgdGhyb3VnaCBvbmx5IE9ORSBpbnRlcnJ1cHQgbGluZS4gQmVj
YXVzZQo+IE1TSSB0byBQTElDIGlzIG11bHRpcGxlIHRvIG9uZSwgSSB1c2UgbGluZWFyIG1vZGUg
aGVyZSBhbmQgdXNlIGNoYWluZWQgSVNSCj4gdG8gaGFuZGxlIHRoZSBpbnRlcnJ1cHRzLgo+IAoK
SG1tLCBvay4gSSdtIG5vdCBhbiBJUlFDSElQIGV4cGVydCwgYnV0IEknbGwgZGVmZXIgdG8gTWFy
YyB0byByZXZpZXcgdGhlIElSUUNISVAKaW1wbGVtZW50YXRpb24gcGFydC4KCi0gTWFuaQoKLS0g
CuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
