Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60C9C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPkRcU1CLij86QrnrH3Th36OQzLJs4XkzMDgSBfpsag=; b=aMjW7uqdoso0ZA
	vbG1Ttc1kWmFtzK8NE8+ts/eVFRv7Qt6jqqFlO2FwFZkNRJ8UctMWiFfFTROwD3atzIWGcUWstTK7
	IT7CkweneqAEJ7XGVFMftZH5Wffn0UtURcNeVDMKf4qMd76RwDppSRWhEARFG7LlhpCLM1nY312cq
	vnLakk6OeS86SZgabB/aiw4pxfSw3fr8Q3jYUK51h2kzkmRO6e+FM6fklMU0Q+41moOucoVrKqek9
	dcFyQwTV+gESMCO/VjK2PdTU6HS2ObWYEbuiQfb4QTi8iGtWPCO8rcjoppOACKUxivhOrMOL/lSpk
	vkYqhvNVXlvSgGpL9AoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJyEr-003lLV-32;
	Thu, 13 Jul 2023 15:28:17 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJyEp-003lKg-1Z
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 15:28:16 +0000
Received: by mail-il1-x144.google.com with SMTP id e9e14a558f8ab-3457157a164so3441255ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 08:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689262092; x=1691854092;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b4KxDrl04bf0Vf57I6E3B3+mq1oEi/sn9+KisK/u73Q=;
        b=UbNyGklqJq2M8+EImiMKPQWNKj6HO29Kj9yUByexUx7kAoYJrrJayKs7IquHsbiAdy
         ZVyhlqlZsrKvgXKcIpIJ1xy4CPBGWlGMkuhppj6R0OaRRoYIwLtyigd8GhgEco89XysF
         c5LjBy4Z8gVIKLRygFXJV4z0DBCnV6tom7mC1p5X3fOh+W2C6I2m00i28irrD7/DqiWY
         at4hAjwXhy6aAUat72v9YbVSMpMYHOxqNaAqhqc/fms+WySRASOttZmnMJgl3L4u8Wrr
         xGO4oYYKn+FdM0TF31gltCF/ffLW2uewY1OZSsOEdLl5t+/1XQQ+rmw2mnA8us63q6gp
         m0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689262092; x=1691854092;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4KxDrl04bf0Vf57I6E3B3+mq1oEi/sn9+KisK/u73Q=;
        b=dF6xGwZFD4VMtr+eMfpfb05yxOMeEajV8x0TanKAVtMyyWu1NSRrjf2g85rL2HXFlj
         WVG4LetLBpJENWFRnxfUma0jPQNtWIFe2xADetxqwBNrpSEfK36ZaG5l/UV8MhkgxtsY
         v65QoKn0iHNUe5QInoFrTTGkLst92xTU3jLUNPs4K93fqQFYoY7CN8Q+5D+tL8VmlkpI
         xoA1DdbPDr3tZRjPlbUAdC9I7F+wpynXSuG4iXZSE/Zvj0dh273QmGTL4bEeGc/mcL/N
         NjBZEQOqaHh2w7rR91xuYGhYV4vHHnOWkpoFln8Koq3h9+ANHD5aKRk0Fji7qZmkJajl
         BjTw==
X-Gm-Message-State: ABy/qLbJyyME4O5WZ/pM1pdECloVI/gZorOyB1GZz3B5d8LAnCOATG5w
	LcUMbOI9AcErjq/ZStM3Aow=
X-Google-Smtp-Source: APBJJlF2QcMLC68E0jTaKDGDw322opVqtbAdk8Ama3TnEa2h2rTqres/nmIlO/C+HZGpxc5XZc6L/w==
X-Received: by 2002:a92:c907:0:b0:346:f14:86ba with SMTP id t7-20020a92c907000000b003460f1486bamr1722729ilp.2.1689262092386;
        Thu, 13 Jul 2023 08:28:12 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.53])
        by smtp.gmail.com with ESMTPSA id h4-20020a17090adb8400b00262d662c9adsm11946904pjv.53.2023.07.13.08.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 08:28:11 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <37a22693-e33c-f64a-e3d7-febed8e9f195@gmail.com>
Date: Thu, 13 Jul 2023 23:28:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: entry: set a0 prior to syscall_handler
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Felix Yan <felixonmars@archlinux.org>,
 Ruizhe Pan <c141028@gmail.com>, Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
References: <20230711062202.3542367-1-CoelacanthusHex@gmail.com>
 <CAJF2gTRgXbEfQWiWtZtVNBDhpY2miG_ByHrVZF2fbfu60hCHcQ@mail.gmail.com>
Content-Language: en-GB-large
In-Reply-To: <CAJF2gTRgXbEfQWiWtZtVNBDhpY2miG_ByHrVZF2fbfu60hCHcQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_082815_525955_BD86BDE7 
X-CRM114-Status: GOOD (  16.39  )
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

Ck9uIDIwMjMvNy8xMyAwODowMCwgR3VvIFJlbiB3cm90ZToKPiBPbiBUdWUsIEp1bCAxMSwgMjAy
MyBhdCAyOjIy4oCvQU0gQ2VsZXN0ZSBMaXUgPGNvZWxhY2FudGh1c2hleEBnbWFpbC5jb20+IHdy
b3RlOgo+Pgo+PiBXaGVuIHdlIHRlc3Qgc2VjY29tcCB3aXRoIDYuNCBrZXJuZWwsIHdlIGZvdW5k
IGVycm5vIGhhcyB3cm9uZyB2YWx1ZS4KPj4gSWYgd2UgZGVueSBORVRMSU5LX0FVRElUIHdpdGgg
RUFGTk9TVVBQT1JULCBhZnRlciBmMGJkZGY1MDU4NmQsIHdlIHdpbGwKPj4gZ2V0IEVOT1NZUy4g
V2UgZ290IHNhbWUgcmVzdWx0IHdpdGggOWMyNTk4ZDQzNTEwICgicmlzY3Y6IGVudHJ5OiBTYXZl
IGEwCj4+IHByaW9yIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSIpLgo+Pgo+PiBDb21w
YXJlZCB3aXRoIHg4NiBhbmQgbG9vbmdhcmNoJ3MgaW1wbGVtZW50YXRpb24gb2YgdGhpcyBwYXJ0
IG9mIHRoZQo+PiBmdW5jdGlvbiwgd2UgdGhpbmsgdGhhdCByZWdzLT5hMCA9IC1FTk9TWVMgc2hv
dWxkIGJlIGFkdmFuY2VkIGJlZm9yZQo+PiBzeXNjYWxsX2hhbmRsZXIgdG8gZml4IHRoaXMgcHJv
YmxlbS4gV2UgaGF2ZSB3cml0dGVuIHRoZSBmb2xsb3dpbmcgcGF0Y2gsCj4+IHdoaWNoIGNhbiBm
aXggdGhpcyBwcm9ibGVtIGFmdGVyIHRlc3RpbmcuIEJ1dCB3ZSBkb24ndCBrbm93IGVub3VnaCBh
Ym91dAo+PiB0aGlzIHBhcnQgb2YgdGhlIGNvZGUgdG8gZXhwbGFpbiB0aGUgcm9vdCBjYXVzZS4g
SG9wZSBzb21lb25lIGNhbiBmaW5kCj4+IGEgcmVhc29uYWJsZSBleHBsYW5hdGlvbi4gQW5kIHdl
J2QgbGlrZSB0byByZXdvcmQgdGhpcyBjb21taXQgbWVzc2FnZQo+PiBhY2NvcmRpbmcgdG8gdGhl
IGV4cGxhbmF0aW9uIGluIHYyCj4+Cj4+IEZpeGVzOiBmMGJkZGY1MDU4NmQgKCJyaXNjdjogZW50
cnk6IENvbnZlcnQgdG8gZ2VuZXJpYyBlbnRyeSIpCj4+IFJlcG9ydGVkLWJ5OiBGZWxpeCBZYW4g
PGZlbGl4b25tYXJzQGFyY2hsaW51eC5vcmc+Cj4+IENvLWRldmVsb3BlZC1ieTogUnVpemhlIFBh
biA8YzE0MTAyOEBnbWFpbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFJ1aXpoZSBQYW4gPGMxNDEw
MjhAZ21haWwuY29tPgo+PiBDby1kZXZlbG9wZWQtYnk6IFNoaXFpIFpoYW5nIDxzaGlxaUBpc3Jj
LmlzY2FzLmFjLmNuPgo+PiBTaWduZWQtb2ZmLWJ5OiBTaGlxaSBaaGFuZyA8c2hpcWlAaXNyYy5p
c2Nhcy5hYy5jbj4KPj4gU2lnbmVkLW9mZi1ieTogQ2VsZXN0ZSBMaXUgPENvZWxhY2FudGh1c0hl
eEBnbWFpbC5jb20+Cj4+IFRlc3RlZC1ieTogRmVsaXggWWFuIDxmZWxpeG9ubWFyc0BhcmNobGlu
dXgub3JnPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgfCAzICstLQo+PiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMKPj4gaW5kZXggZjkxMGRmY2NiZjVkMi4uY2NhZGI1ZmZkMDYzYyAxMDA2NDQKPj4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwcy5jCj4+IEBAIC0zMDEsNiArMzAxLDcgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFw
X3NlY3Rpb24gdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+Cj4+
ICAgICAgICAgICAgICAgICByZWdzLT5lcGMgKz0gNDsKPj4gICAgICAgICAgICAgICAgIHJlZ3Mt
Pm9yaWdfYTAgPSByZWdzLT5hMDsKPj4gKyAgICAgICAgICAgICAgIHJlZ3MtPmEwID0gLUVOT1NZ
UzsKPiBPaCwgbm8uIFlvdSBkZXN0cm95ZWQgdGhlIGEwIGZvciBzeXNjYWxsX2hhbmRsZXIsIHJp
Z2h0PyBJdCdzIG5vdAo+IHJlYXNvbmFibGUuIExldCdzIHNlZSB3aGljaCBzeXNjYWxsX2hhbmRs
ZXIgbmVlZHMgYTA9LUVOT1NZUy4KCnN5c2NhbGxfaGFuZGxlciBhbHdheXMgdXNlIG9yaWdfYTAs
IG5vdCBhMC4KQW5kIEkgaGF2ZSBhIG1pc3Rha2UgaW4gb3JpZ2luYWwgZW1haWwsIGNvcnJldCBv
bmUgaXMKc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSBub3Qgc3lzY2FsbF9oYW5kbGVyLgoK
PiBDb3VsZCB5b3UgZ2l2ZSBvdXQgbW9yZSBkZXRhaWwgb24geW91ciB0ZXN0IGNhc2U/Cj4gCj4+
Cj4+ICAgICAgICAgICAgICAgICByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHJlZ3MpOwo+Pgo+PiBA
QCAtMzA4LDggKzMwOSw2IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZv
aWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+Pgo+PiAgICAgICAgICAg
ICAgICAgaWYgKHN5c2NhbGwgPCBOUl9zeXNjYWxscykKPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgc3lzY2FsbF9oYW5kbGVyKHJlZ3MsIHN5c2NhbGwpOwo+PiAtICAgICAgICAgICAgICAgZWxz
ZQo+PiAtICAgICAgICAgICAgICAgICAgICAgICByZWdzLT5hMCA9IC1FTk9TWVM7Cj4+Cj4+ICAg
ICAgICAgICAgICAgICBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOwo+PiAgICAgICAg
IH0gZWxzZSB7Cj4+IC0tCj4+IDIuNDEuMAo+Pgo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
