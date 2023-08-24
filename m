Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692CEC3DA6F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 21:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9leJmlQhacLzEFf6D2o5S18M7itPCgizSdOsAE50SyE=; b=oOYr3pUt7bb16k
	Jjx+YkU7E7j6/o7xrCmevBt+9BIp8KdaS86diBSk9+aP2iCj6+YjnrsFWdd97Eyt1Lc7PjxfxnGzg
	PSS86jH5GTKH2nNd6NLeHQTLKh+ToIcnMbOgQ2zJXJnNf75JlZWMz6lQlSNc9quSMMonn6YN0pgYQ
	dXLGgxW0z2oO8oNkYuRlaWccPLBw3AS4zgQxpYTABwijaCTTEfM5tQdb7xUJv148UzdCEDW8y8F5e
	iT9kYw9swpkURj1LXTznik0y+1G1ryh4OpT5Hl9YvWaF40G6wCfy8XvAbC68E8gtpLQn+5hsLvWmC
	KrFaCKckmEnUgkbGN/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZIKu-003tTC-0z;
	Thu, 24 Aug 2023 21:57:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZIKr-003tSk-21
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 21:57:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2BCEC6342E
	for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 21:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA0BC433CB
	for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 21:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692914267;
	bh=e+pZg3YWlkmDjnHujmmDX7rt4Bs00zVl5lffsKGqixE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RO6AyNNvqwZ+P080BIF/6nYsI41LvCuKLA1coiIsm51N5UDfZV7DEIiBaIAcvGN4w
	 7dJWZ/nrQ/9yEm/B+oT+S8dx4egAM6UaGo0NorCryjcPZDus8iGGa/ZlWnzIM+9ccV
	 8x+Vjc1gUKDfKwgd9clNZlHvwh2XE4v54nmgGnCSS//+kW18QiiK+87+Rfn55C5aD5
	 jFiHWTV8+s9YkNReWz1NIf627Z6vmYHczgmVVtA1gh3G6gGGKYMQLdAM6gif2+gN/o
	 epCl9hmIe/FQ+f5qnBv0/jR9HUf9Jjisc5hqlueo0uavb9q9Ud+38zvDDMdx0iN6fl
	 NixvlW0KOVYxg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4ff9abf18f9so393562e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 14:57:46 -0700 (PDT)
X-Gm-Message-State: AOJu0YzJz9Fmczu59O6Skp8V9V/FBM5ltev239xS2POos/eJ8OEDbr6i
	MzwVw83fNML65giK/TvmDdNUvTOaD03HTIerxgM=
X-Google-Smtp-Source: AGHT+IHUeqKrf7kvSRY1DSALjp7e8C7fW1mUoYIBbnPTxuhFD3DIzgE8FiXJUxiEjA2LaHmF06aq7QlPyQZAVjmOQno=
X-Received: by 2002:a05:6512:b03:b0:500:8fc1:8aba with SMTP id
 w3-20020a0565120b0300b005008fc18abamr7377893lfu.26.1692914265000; Thu, 24 Aug
 2023 14:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230824133135.1176709-1-puranjay12@gmail.com> <20230824133135.1176709-2-puranjay12@gmail.com>
In-Reply-To: <20230824133135.1176709-2-puranjay12@gmail.com>
From: Song Liu <song@kernel.org>
Date: Thu, 24 Aug 2023 14:57:32 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5mMQbZ729W_5fhX0iYaNxG5JA1L7Sck-h0jQZQzEH8+Q@mail.gmail.com>
Message-ID: <CAPhsuW5mMQbZ729W_5fhX0iYaNxG5JA1L7Sck-h0jQZQzEH8+Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/3] riscv: extend patch_text_nosync() for
 multiple pages
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	pulehui@huawei.com, conor.dooley@microchip.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, yhs@fb.com, 
	kpsingh@kernel.org, bjorn@kernel.org, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_145749_774342_8C8D9F7C 
X-CRM114-Status: GOOD (  24.02  )
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

T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgNjozMeKAr0FNIFB1cmFuamF5IE1vaGFuIDxwdXJhbmph
eTEyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgcGF0Y2hfaW5zbl93cml0ZSgpIGZ1bmN0aW9u
IGN1cnJlbnRseSBkb2Vzbid0IHdvcmsgZm9yIG11bHRpcGxlCj4gcGFnZXMgb2YgaW5zdHJ1Y3Rp
b25zLCB0aGVyZWZvcmUgcGF0Y2hfdGV4dF9ub3N5bmMoKSB3aWxsIGZhaWwgd2l0aCBhCj4gcGFn
ZSBmYXVsdCBpZiBjYWxsZWQgd2l0aCBsZW5ndGhzIHNwYW5uaW5nIG11bHRpcGxlIHBhZ2VzLgo+
Cj4gVGhpcyBjb21taXQgZXh0ZW5kcyB0aGUgcGF0Y2hfaW5zbl93cml0ZSgpIGZ1bmN0aW9uIHRv
IHN1cHBvcnQgbXVsdGlwbGUKPiBwYWdlcyBieSBjb3B5aW5nIGF0IG1heCAyIHBhZ2VzIGF0IGEg
dGltZSBpbiBhIGxvb3AuIFRoaXMgaW1wbGVtZW50YXRpb24KPiBpcyBzaW1pbGFyIHRvIHRleHRf
cG9rZV9jb3B5KCkgZnVuY3Rpb24gb2YgeDg2Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUHVyYW5qYXkg
TW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPgo+IFJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVs
IDxiam9ybkByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMg
fCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKPiBp
bmRleCA1NzVlNzFkNmM4YWUuLjQ2NWIyZWViYmMzNyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC9wYXRjaC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+IEBAIC01
MywxMiArNTMsMTggQEAgc3RhdGljIHZvaWQgcGF0Y2hfdW5tYXAoaW50IGZpeG1hcCkKPiAgfQo+
ICBOT0tQUk9CRV9TWU1CT0wocGF0Y2hfdW5tYXApOwo+Cj4gLXN0YXRpYyBpbnQgcGF0Y2hfaW5z
bl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBzaXplX3QgbGVuKQo+ICtzdGF0
aWMgaW50IF9fcGF0Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBz
aXplX3QgbGVuKQo+ICB7Cj4gICAgICAgICB2b2lkICp3YWRkciA9IGFkZHI7Cj4gICAgICAgICBi
b29sIGFjcm9zc19wYWdlcyA9ICgoKHVpbnRwdHJfdCkgYWRkciAmIH5QQUdFX01BU0spICsgbGVu
KSA+IFBBR0VfU0laRTsKPiAgICAgICAgIGludCByZXQ7Cj4KPiArICAgICAgIC8qCj4gKyAgICAg
ICAgKiBPbmx5IHR3byBwYWdlcyBjYW4gYmUgbWFwcGVkIGF0IGEgdGltZSBmb3Igd3JpdGluZy4K
PiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKGxlbiA+IDIgKiBQQUdFX1NJWkUpCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwoKVGhpcyBjaGVjayBjYW5ub3QgZ3VhcmFudGVlIF9f
cGF0Y2hfaW5zbl93cml0ZSB0b3VjaCBhdCBtb3N0IHR3byBwYWdlcy4KTWF5YmUgdXNlCgogICAg
aWYgKGxlbiArIG9mZnNldF9pbl9wYWdlKGFkZHIpID4gMiAqIFBBR0VfU0laRSkKICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPwoKVGhhbmtzLApTb25nCgo+ICAgICAgICAgLyoKPiAgICAgICAgICAq
IEJlZm9yZSByZWFjaGluZyBoZXJlLCBpdCB3YXMgZXhwZWN0ZWQgdG8gbG9jayB0aGUgdGV4dF9t
dXRleAo+ICAgICAgICAgICogYWxyZWFkeSwgc28gd2UgZG9uJ3QgbmVlZCB0byBnaXZlIGFub3Ro
ZXIgbG9jayBoZXJlIGFuZCBjb3VsZAo+IEBAIC03NCw3ICs4MCw3IEBAIHN0YXRpYyBpbnQgcGF0
Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBzaXplX3QgbGVuKQo+
ICAgICAgICAgICAgICAgICBsb2NrZGVwX2Fzc2VydF9oZWxkKCZ0ZXh0X211dGV4KTsKPgo+ICAg
ICAgICAgaWYgKGFjcm9zc19wYWdlcykKPiAtICAgICAgICAgICAgICAgcGF0Y2hfbWFwKGFkZHIg
KyBsZW4sIEZJWF9URVhUX1BPS0UxKTsKPiArICAgICAgICAgICAgICAgcGF0Y2hfbWFwKGFkZHIg
KyBQQUdFX1NJWkUsIEZJWF9URVhUX1BPS0UxKTsKPgo+ICAgICAgICAgd2FkZHIgPSBwYXRjaF9t
YXAoYWRkciwgRklYX1RFWFRfUE9LRTApOwo+Cj4gQEAgLTg3LDE1ICs5MywzOCBAQCBzdGF0aWMg
aW50IHBhdGNoX2luc25fd3JpdGUodm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5zbiwgc2l6ZV90
IGxlbikKPgo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+IC1OT0tQUk9CRV9TWU1CT0wocGF0
Y2hfaW5zbl93cml0ZSk7Cj4gK05PS1BST0JFX1NZTUJPTChfX3BhdGNoX2luc25fd3JpdGUpOwo+
ICAjZWxzZQo+IC1zdGF0aWMgaW50IHBhdGNoX2luc25fd3JpdGUodm9pZCAqYWRkciwgY29uc3Qg
dm9pZCAqaW5zbiwgc2l6ZV90IGxlbikKPiArc3RhdGljIGludCBfX3BhdGNoX2luc25fd3JpdGUo
dm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5zbiwgc2l6ZV90IGxlbikKPiAgewo+ICAgICAgICAg
cmV0dXJuIGNvcHlfdG9fa2VybmVsX25vZmF1bHQoYWRkciwgaW5zbiwgbGVuKTsKPiAgfQo+IC1O
T0tQUk9CRV9TWU1CT0wocGF0Y2hfaW5zbl93cml0ZSk7Cj4gK05PS1BST0JFX1NZTUJPTChfX3Bh
dGNoX2luc25fd3JpdGUpOwo+ICAjZW5kaWYgLyogQ09ORklHX01NVSAqLwo+Cj4gK3N0YXRpYyBp
bnQgcGF0Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBzaXplX3Qg
bGVuKQo+ICt7Cj4gKyAgICAgICBzaXplX3QgcGF0Y2hlZCA9IDA7Cj4gKyAgICAgICBzaXplX3Qg
c2l6ZTsKPiArICAgICAgIGludCByZXQgPSAwOwo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAg
KiBDb3B5IHRoZSBpbnN0cnVjdGlvbnMgdG8gdGhlIGRlc3RpbmF0aW9uIGFkZHJlc3MsIHR3byBw
YWdlcyBhdCBhIHRpbWUKPiArICAgICAgICAqIGJlY2F1c2UgX19wYXRjaF9pbnNuX3dyaXRlKCkg
Y2FuIG9ubHkgaGFuZGxlIGxlbiA8PSAyICogUEFHRV9TSVpFLgo+ICsgICAgICAgICovCj4gKyAg
ICAgICB3aGlsZSAocGF0Y2hlZCA8IGxlbiAmJiAhcmV0KSB7Cj4gKyAgICAgICAgICAgICAgIHNp
emUgPSBtaW5fdChzaXplX3QsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQUdFX1NJ
WkUgKiAyIC0gb2Zmc2V0X2luX3BhZ2UoYWRkciArIHBhdGNoZWQpLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbGVuIC0gcGF0Y2hlZCk7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IF9f
cGF0Y2hfaW5zbl93cml0ZShhZGRyICsgcGF0Y2hlZCwgaW5zbiArIHBhdGNoZWQsIHNpemUpOwo+
ICsKPiArICAgICAgICAgICAgICAgcGF0Y2hlZCArPSBzaXplOwo+ICsgICAgICAgfQo+ICsKPiAr
ICAgICAgIHJldHVybiByZXQ7Cj4gK30KPiArTk9LUFJPQkVfU1lNQk9MKHBhdGNoX2luc25fd3Jp
dGUpOwo+ICsKPiAgaW50IHBhdGNoX3RleHRfbm9zeW5jKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQg
Kmluc25zLCBzaXplX3QgbGVuKQo+ICB7Cj4gICAgICAgICB1MzIgKnRwID0gYWRkcjsKPiAtLQo+
IDIuMzkuMgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
