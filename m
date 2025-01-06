Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05385E77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 09:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=regf5UmOKxtoGzLCrmyqCZXtZ/HVu16yWycGM+hfr3Q=; b=0MdddBFUiPUoeR
	wB+byApvm0YtkYaOzQLdJb22TWKmZr5xqq3y9BX0WdRL31k3h/9U0CfJQqziQZcmh4Bt/vU+O7rFR
	YMN1ZtEX+16hWFMJzeSODLra6p3u040VK8ZJBB1ybFJJNtsexQm/tLIDk88CVLILBpzP2YluQMSqY
	Z0wQPe0YKoqV5wLUhqL8l2Rsnjg1DXuRJKrGlFK5FDQJFIUzk9TKWFOOoFNv/aH+NPf0w+TCbbxRp
	jIW0QgZqdmWIXB1/uf9zWTmTRp5aXCeCbe3DQMJAvRGdGBVGNAKYGnviWo4GQ4zHnNVCXJ5CS2QFN
	3Bm4pQwYCwmAtXgHH13Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUiye-00000000aIk-27kI;
	Mon, 06 Jan 2025 09:00:48 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUiyc-00000000aIF-0yiS
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 09:00:47 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-85c4b4cf73aso2195201241.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 01:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736154044; x=1736758844; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqWDvGHWrGvSzvZ+8ugo2KRnlDSxD8xXB96mXOU0lg4=;
        b=iQbNO8acrxjpGw9mZR/C6UeaqIAmYAEfWdxQYxKQdCuyCH6g6e2f0zG4A8Os3EAqpn
         VrOjBhJ7mieaWgPXl7aHabzfNrtgxSxzKJpjZl98rLW+9F2pqGFC9TnxgWAGbhTNbKea
         q95JKobtRxqA0J1QS2zFvxwvjEOSmQ/GewaixQfQ0aZpWb5GRZvepDKc5agxA+c9xe0R
         yt50DJQaoPToUmGJFvqnz6Ud3apq91zNV47lz+94zNFqVhVjUAyY9SeweCGhvXMGt4m7
         Yiz6Xvb3k9dZkUUuoQxg1bqS58EFCtEgjbFzDsGG+2B/kW5CiUCztLWpL7i+UqM2Yctf
         26sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736154044; x=1736758844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqWDvGHWrGvSzvZ+8ugo2KRnlDSxD8xXB96mXOU0lg4=;
        b=k/4Jtv13jxUm6geIscgSFe5NiCP9eWKWtPmZOnml36XsT7Z+8SPUUT3TDvgOCO7agG
         /MkcLw8erR6nTxnSPlTxmz5pljcq01vOYryraczuil7FqwLHe3BBhhE74Q6KBghp7qmx
         Bxm5NRIngJ0ZNqiG4g4Z3kGT8s0SdiACuIL8soJZS3ca9GKZOIOP1Xu1DC6CbOriadA7
         Mahiidoe9yppIZO8OzLvjrANZhvTnYLosbIMPSPDqgtMeYyjK0y9WIdtJwunZW4+5YXr
         o1bPxGdndStHm1qJpI3BQJ/PM56APpyOGudsZhKCyNUSK2ykV3CI8rxRp3cBzXZfCeMW
         j4FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBt4eRiau1Ew+6sEfwO9PiCffZ9zM+Nd5wrM+zWgugmTubndGEzQrr6bSAVk11oXTVw7qastonONvo0g==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv+eI0T/lmYY159mj9KZ1aSlA47Php8yWdrnVAAnfcnNpxMPqz
	4DuNaE+s7PsdLonbrJ3F6sIKstKAQrer2C8T+XDC0KnIkjgYgBBbgW77gzDWWHet/iuLVdBkOCV
	LOkVfo5c049qa+UqWlR3DYlLnKbg4LPyuIAyhhQ==
X-Gm-Gg: ASbGncsGMtCsswG61qS315qooLEm7Hb5TsDyZXp5N+ZyLD8AQFrb9HkwXNTVpc3rrRm
	dcDteWc1eYLmvveVDyT5V1qK9b5E0VGRhX1CLr5/7
X-Google-Smtp-Source: AGHT+IEi3ZBafEZiHUD7dXioBMaLkm1e2JoCKXblv3XIfUY1bATE2OhPY0NnTbQT5snAk04oeSJgkfFVx4e/nsM3hb0=
X-Received: by 2002:a05:6102:2914:b0:4b2:cbe4:5999 with SMTP id
 ada2fe7eead31-4b2cc493769mr42332843137.23.1736154044154; Mon, 06 Jan 2025
 01:00:44 -0800 (PST)
MIME-Version: 1.0
References: <20240222081231.213406-1-nylon.chen@sifive.com>
 <20240222081231.213406-4-nylon.chen@sifive.com> <jvwgsszvs4jtcytcphsdjulzgqfqzdp4sisu236ddwsqgmvriw@ngi4ljgh5b74>
 <CAHh=Yk92=hp+kaTJWL13_jwJ5gzAAi8gbRF=Ns9=yq2trRUQEg@mail.gmail.com>
 <xf6ympnaljfjztptb5w5qdpuluckptozdz5a7gtuycsev32ngr@x2ovibqv6evr>
 <CAGKtFavQAZOof5QSTFCEaRJEPETm5aBqzkV4g24n3ioiBAOgDA@mail.gmail.com> <p6rqpx3yrn2ib4ulmby7tbnpbg4bjyt4dt6snrmhuyw6hx6izl@lywssban54et>
In-Reply-To: <p6rqpx3yrn2ib4ulmby7tbnpbg4bjyt4dt6snrmhuyw6hx6izl@lywssban54et>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Mon, 6 Jan 2025 17:00:32 +0800
Message-ID: <CAHh=Yk-iFGULUQc-U-PNjx-st7d5KER3J+t54SNERVaNr++qoQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] pwm: sifive: Fix the error in the idempotent test
 within the pwm_apply_state_debug function
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Nylon Chen <nylon7717@gmail.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, conor@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, thierry.reding@gmail.com, 
	vincent.chen@sifive.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_010046_331889_62E21976 
X-CRM114-Status: GOOD (  26.30  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IOaWvCAyMDI0
5bm0MTLmnIgyN+aXpSDpgLHkupQg5LiL5Y2IMTE6Mznlr6vpgZPvvJoKPgo+IE9uIFR1ZSwgRGVj
IDI0LCAyMDI0IGF0IDA0OjM0OjUzUE0gKzA4MDAsIE55bG9uIENoZW4gd3JvdGU6Cj4gPiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiDmlrwgMjAyNOW5
tDTmnIgxMuaXpSDpgLHkupQg5LiL5Y2IMzowNeWvq+mBk++8mgo+ID4gPgo+ID4gPiBPbiBUdWUs
IEFwciAwMiwgMjAyNCBhdCAxMDowMTozOUFNICswODAwLCBOeWxvbiBDaGVuIHdyb3RlOgo+ID4g
PiA+IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IOaW
vCAyMDI05bm0M+aciDE55pelIOmAseS6jCDkuIrljYgyOjE35a+r6YGT77yaCj4gPiA+ID4gPgo+
ID4gPiA+ID4gSGVsbG8sCj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gVGh1LCBGZWIgMjIsIDIwMjQg
YXQgMDQ6MTI6MzFQTSArMDgwMCwgTnlsb24gQ2hlbiB3cm90ZToKPiA+ID4gPiA+ID4gUm91bmQg
dGhlIHJlc3VsdCB0byB0aGUgbmVhcmVzdCB3aG9sZSBudW1iZXIuIFRoaXMgZW5zdXJlcyB0aGF0
Cj4gPiA+ID4gPiA+IHJlYWxfcGVyaW9kIGlzIGFsd2F5cyBhIHJlYXNvbmFibGUgaW50ZWdlciB0
aGF0IGlzIG5vdCBsb3dlciB0aGFuIHRoZQo+ID4gPiA+ID4gPiBhY3R1YWwgdmFsdWUuCj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IGUuZy4KPiA+ID4gPiA+ID4gJCBlY2hvIDExMCA+IC9zeXMvZGV2
aWNlcy9wbGF0Zm9ybS9sZWQtY29udHJvbGxlci0xL2xlZHMvZDEyL2JyaWdodG5lc3MKPiA+ID4g
PiA+ID4gJCAuYXBwbHkgaXMgbm90IGlkZW1wb3RlbnQgKGVuYT0xIHBvbD0wIDE3Mzk2OTIvNDAz
Mjk4NSkgLT4gKGVuYT0xIHBvbD0wIDE3Mzk2MzAvNDAzMjk4NSkKPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiA+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+ID4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZpdmUuY29tPgo+
ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyB8IDIg
Ky0KPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdt
LXNpZml2ZS5jIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gPiA+ID4gPiA+IGluZGV4IGE1
ODZjZmU0MTkxYi4uYmViY2JlYmFjY2NkIDEwMDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJz
L3B3bS9wd20tc2lmaXZlLmMKPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9wd20vcHdtLXNpZml2
ZS5jCj4gPiA+ID4gPiA+IEBAIC0xMDEsNyArMTAxLDcgQEAgc3RhdGljIHZvaWQgcHdtX3NpZml2
ZV91cGRhdGVfY2xvY2soc3RydWN0IHB3bV9zaWZpdmVfZGRhdGEgKmRkYXRhLAo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiAgICAgICAvKiBBcyBzY2FsZSA8PSAxNSB0aGUgc2hpZnQgb3BlcmF0aW9u
IGNhbm5vdCBvdmVyZmxvdy4gKi8KPiA+ID4gPiA+ID4gICAgICAgbnVtID0gKHVuc2lnbmVkIGxv
bmcgbG9uZylOU0VDX1BFUl9TRUMgPDwgKFBXTV9TSUZJVkVfQ01QV0lEVEggKyBzY2FsZSk7Cj4g
PiA+ID4gPiA+IC0gICAgIGRkYXRhLT5yZWFsX3BlcmlvZCA9IGRpdjY0X3VsKG51bSwgcmF0ZSk7
Cj4gPiA+ID4gPiA+ICsgICAgIGRkYXRhLT5yZWFsX3BlcmlvZCA9IERJVl9ST1VORF9VUF9VTEwo
bnVtLCByYXRlKTsKPiA+ID4gPiA+ID4gICAgICAgZGV2X2RiZyhkZGF0YS0+Y2hpcC5kZXYsCj4g
PiA+ID4gPiA+ICAgICAgICAgICAgICAgIk5ldyByZWFsX3BlcmlvZCA9ICV1IG5zXG4iLCBkZGF0
YS0+cmVhbF9wZXJpb2QpOwo+ID4gPiA+ID4gPiAgfQo+ID4gPiA+IEhpIFV3ZQo+ID4gPiA+ID4K
PiA+ID4gPiA+IHB3bV9zaWZpdmVfYXBwbHkgaGFzIGEgRElWNjRfVTY0X1JPVU5EX0NMT1NFU1Qo
KS4gSSB3b25kZXIgaWYgdGhhdCBuZWVkcwo+ID4gPiA+ID4gYWRhcHRpb24sIHRvbz8hCj4gPiA+
ID4gQWNjb3JkaW5nIHRvIG15IGV4cGVyaW1lbnRzLCBubyBhZGp1c3RtZW50IGlzIG5lY2Vzc2Fy
eS4KPiA+ID4KPiA+ID4gRGlkIHlvdSBlbmFibGUgUFdNX0RFQlVHIGFuZCB0ZXN0ZWQgd2l0aCBz
b21ldGhpbmcgbGlrZToKPiA+ID4KPiA+ID4gICAgICAgICBzZXEgNTAwMCAxMDAwMDAgfCB3aGls
ZSByZWFkIHA7IGRvIGVjaG8gcCA+IC9zeXMvY2xhc3MvcHdtL3B3bWNoaXBYL3B3bVkvcGVyaW9k
OyBkb25lCj4gPiA+Cj4gPiBIaSBVd2UsCj4gPiBJIGFwb2xvZ2l6ZSBmb3IgdGhlIHNpZ25pZmlj
YW50IGRlbGF5IGluIHJlc3BvbmRpbmcgdG8geW91ciBxdWVyeSwKPiA+IEkndmUgbm93IGNvbXBs
ZXRlZCBhIHRob3JvdWdoIHZlcmlmaWNhdGlvbiBvZiB0aGUgUFdNX0RFQlVHCj4gPiBmdW5jdGlv
bmFsaXR5Lgo+ID4KPiA+IFRoZSBQZXJpb2QgVGVzdGluZzoKPiA+IHNlcSA1MDAwIDUwMDAgMTAw
MDAwIHwgd2hpbGUgcmVhZCBwOyBkbyBlY2hvICRwID4KPiA+IC9zeXMvY2xhc3MvcHdtL3B3bWNo
aXAwL3B3bTAvcGVyaW9kIGVjaG8gIlRlc3RpbmcgcGVyaW9kOiAkcCIgZG9uZQo+ID4KPiA+IFRo
ZSBEdXR5IEN5Y2xlIFRlc3Rpbmc6Cj4gPiBmb3IgcGVyY2VudCBpbiAwIDI1IDUwIDc1IDEwMDsg
ZG8gZHV0eT0kKCgxMDAwMDAgKiBwZXJjZW50IC8gMTAwKSkKPiA+IGVjaG8gJGR1dHkgPiAvc3lz
L2NsYXNzL3B3bS9wd21jaGlwMC9wd20wL2R1dHlfY3ljbGUgZG9uZQo+Cj4gVGhpcyBpcyB1bmxp
a2VseSB0byBmaW5kIHRoZSBpc3N1ZXMgdGhhdCBJIGhhdmUgaW4gbWluZC4gSWYgZG9pbmcgfjEw
MGsKPiBhc3NpZ25tZW50cyBpcyB0b28gbXVjaCwgcGxlYXNlIGtlZXAgdGhlICsxIHN0ZXAgYnV0
IHJlc3RyaWN0IHRoZQo+IGludGVydmFsLgpIaSBVd2UsIEkgaGF2ZSBtYWRlIHRoZSBmb2xsb3dp
bmcgYWRqdXN0bWVudHMgYmFzZWQgb24geW91cgpyZXF1aXJlbWVudHMuIERvZXMgdGhpcyBhbGln
biB3aXRoIHdoYXQgeW91IGhhZCBpbiBtaW5kPwotIHBlcmlvZApzZXEgNTAwMCAxIDE1MDAwIHwg
d2hpbGUgcmVhZCBwOyBkbyBlY2hvICRwID4KL3N5cy9jbGFzcy9wd20vcHdtY2hpcDAvcHdtMC9w
ZXJpb2QgZWNobyAiVGVzdGluZyBwZXJpb2Q6ICRwIiBkb25lCgotIGR1dHkgY3ljbGUKZm9yIGR1
dHkgaW4gJChzZXEgMCAxIDEwMDAwKTsgZG8gZWNobyAkZHV0eSA+Ci9zeXMvY2xhc3MvcHdtL3B3
bWNoaXAwL3B3bTAvZHV0eV9jeWNsZSBlY2hvICJUZXN0aW5nIGR1dHkgY3ljbGU6CiRkdXR5IiBk
b25lCj4KPiBCZXN0IHJlZ2FyZHMKPiBVd2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
