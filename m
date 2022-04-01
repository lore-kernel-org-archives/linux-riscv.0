Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C740C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 18:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=w8Tz4LSREJjiiMHZbp7riZsUqEjQCR7oqXhmhz9Sfi8=; b=AwBrHo6y0flo3d9wpe0h+i6MZX
	tngmtHJevfAVHAXEfn5VGgJF77zT8OhX9sML6Y7uc9mm7RLJA6deryuL8N/e6A9m6umwAeLXnac6N
	M2Th39FO96Z7xp58vceWq+7WEh1Njvw7sN4vVdzusARHRSDZr0i7Z73GGd1dMp8RSG6kfElsBwOnL
	0n1gCVXhQKoeTtiRGpskI3MAi1Eq6/H2bhSt2/UGpn9m85gUaCe30mvPC0q50pqKE1bvlFkz5bHeF
	xvAawRWdVzxBTUxpdyWSCQEtoPE7YPfMZDWMVrr6BfiF4cS3X3GKjUZ6+JtnflU2PfP4pXForGV4A
	8QhZXa8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naM8p-006sTP-9T; Fri, 01 Apr 2022 18:36:59 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naM8l-006sSO-Mh
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 18:36:57 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 bx24-20020a17090af49800b001c6872a9e4eso3299568pjb.5
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 11:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=cqsuM9synFmM1yPUnHeSbl2P4nO3t+xg2dzn32HhZsU=;
 b=xNoYg77Py57X1Me0ur5VPCcatzUb1xYQqOXB3osYqUEJZfzafFqJoogVTp+lKN1g9Q
 g/jOWWRLrxIh7XlvcvzOO3Bun4bgj7ov1Qqtpxp6HG5kBgutbNTnrGemYPERcZugOBAN
 nWUML92Jqx8ffU+/0T9aiCDGOVQPtaPpNrI+gp665M/iVo5I6rDobtMXMwBNDp7Tt+eP
 bYKmDznFtNQYqD16E5guTIDDrgtCISFlRtpvrvQLwHvFV60H8ySyXFPwoN0f9iQk/Lks
 LkQxlmP5AGqOMBRUFflhbrBu+dQ3128WmdIVSMsrfaW/cZlL5J9tS7NevH4+TFXuT6K3
 hRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=cqsuM9synFmM1yPUnHeSbl2P4nO3t+xg2dzn32HhZsU=;
 b=PviSeiQJBZU047ATJm8p6wZcQnGjy78iS3Tb1HhUgHC0OqKy0P0j4mR3JxwN/7IAMQ
 r74emRg7thPEWv+GuumeIXaCtQAUm3ZgjWPU+A9145CADLTBzNWFBuo0c+mdNahMIlLq
 318bgO52ilVkj3J1skHRBMXLKh+WXe9AF3b/v2pgcPmyIUWlZZHGmZHkGo0iembT3yK5
 ptSILL2rq2FISJXDDVXX6VqEiy52Ei9bAcrg6GNUwc0h3/Fd/ZHC85bWTU3fy33bNf3L
 gZvYluj6FLOkm6bX7wgxsRkZ5aGcRuFytDBFJTR877Geas+fBrtqiscsYYaUOg8itDOU
 UNKA==
X-Gm-Message-State: AOAM533ejkaIN5jbcmKs/zkLq0jIVUnHmAVVHz5BAnPDCGEoNV65nxn4
 Fq964S+hpTy8vcpJqmfs6OVrEg==
X-Google-Smtp-Source: ABdhPJxu0cXtXaLgk1bOZrTT27XsZcXSkZ6Zri7MAMHUWKOoDZ6GQ+6L8CEvdkcl0Jg4j4oCJybCgg==
X-Received: by 2002:a17:902:d48d:b0:154:54f6:9384 with SMTP id
 c13-20020a170902d48d00b0015454f69384mr11524985plg.83.1648838214767; 
 Fri, 01 Apr 2022 11:36:54 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 p10-20020a056a0026ca00b004fb44e0cb17sm3875571pfw.116.2022.04.01.11.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 11:36:53 -0700 (PDT)
Date: Fri, 01 Apr 2022 11:36:53 -0700 (PDT)
X-Google-Original-Date: Fri, 01 Apr 2022 11:36:52 PDT (-0700)
Subject: Re: [PATCH] habanalabs: Elide a warning on 32-bit targets
In-Reply-To: <CAFCwf13-o=kUR61xjWt=F-Q-Vfy=kF6fpMP7iB+83Gfqw7+2HA@mail.gmail.com>
CC: Greg KH <gregkh@linuxfoundation.org>, linux-riscv@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, osharabi@habana.ai
From: Palmer Dabbelt <palmer@rivosinc.com>
To: ogabbay@kernel.org
Message-ID: <mhng-89bfa679-14d3-436e-80e1-439ab154beb2@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_113655_967723_B7FCF307 
X-CRM114-Status: GOOD (  24.83  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAwMSBBcHIgMjAyMiAxMToxMzo0OCBQRFQgKC0wNzAwKSwgb2dhYmJheUBrZXJuZWwu
b3JnIHdyb3RlOgo+IE9uIEZyaSwgQXByIDEsIDIwMjIgYXQgNzo0MSBQTSBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+Cj4+IEZyb206IFBhbG1lciBEYWJiZWx0
IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+Pgo+PiBUaGlzIGRvdWJsZS1jYXN0IHBhdHRlcm4gbG9v
a3MgYSBiaXQgYXdrd2FyZCwgYnV0IGl0IGFscmVhZHkgZXhpc3RzCj4+IGVsc2V3aGVyZSBpbiB0
aGUgZHJpdmVyLiAgV2l0aG91dCB0aGlzIHBhdGNoIEkgZ2V0Cj4+Cj4+IGRyaXZlcnMvbWlzYy9o
YWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYzogSW4gZnVuY3Rpb24g4oCYYWxsb2NfZGV2aWNlX21l
bW9yeeKAmToKPj4gZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9yeS5jOjE1Mzo0
OTogd2FybmluZzogY2FzdCBmcm9tIHBvaW50ZXIgdG8gaW50ZWdlciBvZiBkaWZmZXJlbnQgc2l6
ZSBbLVdwb2ludGVyLXRvLWludC1jYXN0XQo+PiAgIDE1MyB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICh1NjQpIGdlbl9wb29sX2RtYV9hbGxvY19hbGln
bih2bS0+ZHJhbV9wZ19wb29sLAo+PiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF4KPj4KPj4gd2hpY2ggZW5kcyB1cCBwcm9tb3RlZCB0byBh
IGJ1aWxkIGVycm9yIGluIG15IHRlc3Qgc2V0dXAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhbG1l
ciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+Pgo+PiAtLS0KPj4KPj4gSSBkb24ndCBr
bm93IGFueXRoaW5nIGFib3V0IHRoaXMgZHJpdmVyLCBJJ20ganVzdCBwYXR0ZXJuLW1hdGNoaW5n
IHRoZQo+PiB3YXJuaW5nIGF3YXkuCj4+IC0tLQo+PiAgZHJpdmVycy9taXNjL2hhYmFuYWxhYnMv
Y29tbW9uL21lbW9yeS5jIHwgMTAgKysrKystLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlz
Yy9oYWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYyBiL2RyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2Nv
bW1vbi9tZW1vcnkuYwo+PiBpbmRleCBlMDA4ZDgyZTRiYTMuLmYxZmM3OWMxZmMxMCAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9yeS5jCj4+ICsrKyBi
L2RyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYwo+PiBAQCAtMTUwLDEyICsx
NTAsMTIgQEAgc3RhdGljIGludCBhbGxvY19kZXZpY2VfbWVtb3J5KHN0cnVjdCBobF9jdHggKmN0
eCwgc3RydWN0IGhsX21lbV9pbiAqYXJncywKPj4gICAgICAgICAgICAgICAgIGZvciAoaSA9IDAg
OyBpIDwgbnVtX3BncyA7IGkrKykgewo+PiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoaXNf
cG93ZXJfb2ZfMihwYWdlX3NpemUpKQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBoeXNfcGdfcGFjay0+cGFnZXNbaV0gPQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAodTY0KSBnZW5fcG9vbF9kbWFfYWxsb2NfYWxpZ24odm0tPmRy
YW1fcGdfcG9vbCwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlX3NpemUsIE5VTEwsCj4+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGFnZV9zaXplKTsKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHU2NCkgKHVpbnRwdHJfdCkgZ2VuX3Bvb2xf
ZG1hX2FsbG9jX2FsaWduKHZtLT5kcmFtX3BnX3Bvb2wsCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwYWdlX3NpemUsIE5VTEwsCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYWdlX3NpemUpOwo+PiAgICAgICAgICAgICAgICAgICAgICAgICBlbHNlCj4+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGh5c19wZ19wYWNrLT5wYWdlc1tpXSA9
ICh1NjQpIGdlbl9wb29sX2FsbG9jKHZtLT5kcmFtX3BnX3Bvb2wsCj4+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFnZV9zaXplKTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
aHlzX3BnX3BhY2stPnBhZ2VzW2ldID0gKHU2NCkgKHVpbnRwdHJfdCkgZ2VuX3Bvb2xfYWxsb2Mo
dm0tPmRyYW1fcGdfcG9vbCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFn
ZV9zaXplKTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFwaHlzX3BnX3BhY2stPnBh
Z2VzW2ldKSB7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihoZGV2
LT5kZXYsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVk
IHRvIGFsbG9jYXRlIGRldmljZSBtZW1vcnkgKG91dCBvZiBtZW1vcnkpXG4iKTsKPj4gLS0KPj4g
Mi4zNC4xCj4+Cj4KPiBUaGlzIHBhdGNoIGlzOgo+IFJldmlld2VkLWJ5OiBPZGVkIEdhYmJheSA8
b2dhYmJheUBrZXJuZWwub3JnPgo+Cj4gR3JlZywKPiBDb3VsZCB5b3UgcGxlYXNlIGFwcGx5IHRo
aXMgZGlyZWN0bHkgdG8geW91ciBtaXNjIHRyZWUgYW5kIHNlbmQgaXQgdG8KPiBMaW51cyBhdCB5
b3VyIG5leHQgcHVsbCByZXF1ZXN0ID8KPiBJIGRvbid0IGhhdmUgYW55IG90aGVyIGZpeGVzIHBl
bmRpbmcgZm9yIDUuMTguCj4KPiBGb3IgNS4xOSB3ZSB3aWxsIGRvIGEgbW9yZSBlbGVnYW50IHNv
bHV0aW9uIHRoYXQgQXJuZCBoYXMgcmVjb21tZW5kZWQuCgpUaGFua3MuCgpBc3N1bWluZyB0aGlz
IGlzIHRvbyBsYXRlIGZvciByYzEsIHdvdWxkIGl0IGJlIHBvc3NpYmUgdG8gaGF2ZSBpdCBpbiAK
c29tZXRoaW5nIEkgY2FuIHRha2UgaW50byBteSBmaXhlcy9mb3ItbmV4dCB3aXRob3V0IHRvbyBt
dWNoIGRpZmY/ICBJIApwdXQgdGhpcyBvbiB0b3Agb2YgdGhlIG9mZmVuZGluZyBjb21taXQgd2l0
aCBhIAoKRml4ZXM6IGU4NDU4ZTIwZTBhMyAoImhhYmFuYWxhYnM6IG1ha2Ugc3VyZSBkZXZpY2Ug
bWVtIGFsbG9jIGlzIHBhZ2UgYWxpZ25lZCIpCgphdCBrZXJuZWwub3JnL3BhbG1lci9oYWJhbmEg
LCBpZiB0aGF0IGhlbHBzIGFueS4gIE5vIGJpZyBkZWFsIGlmIGl0IGdvZXMgCmluIGFub3RoZXIg
d2F5LCBpdCdzIGp1c3QgbmljZSB0byBrZWVwIGFsbHllc2NvbmZpZyBidWlsZGluZyBvbiBteSAK
YnJhbmNoZXMgZGlyZWN0bHkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
