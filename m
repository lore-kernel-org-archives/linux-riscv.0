Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28B5CCD194
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 09:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9otakl2im83aELdEdLMShXBttorsi5J5ey0r6xdsvrE=; b=ICZxQyyMyldSKE
	oQMN7l1ncqrJehkMDjYQfVaQTWmsdCNaJ2+CYcfCvksOKVb0ksDwWXxYBXHj6y2ScwFMhYY1vPV7M
	iU/XjY32kcm70E9xPyoZIVaSelsnBAsDnts4oqnmO3LFWEfhTrFiDIKMAU4VuxhNctDTpGxpbHwDI
	slTIznAYwOpBAXwcll18RHz8LiMeGbDfeZ2+yFOcm2VFTFcm9d0D8B0enShLf61O+w6xbCUJ+pxK9
	hITgbP2VkdMWpQaipDwlP8AAklQFWRg/Kqlls4joosdwSLnkyZ094dyNmy+tJ5bB/7XvPyO/d4tBd
	1Rl1qVGcbVHqDKp9xdxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KE2-00000004BM0-4104;
	Thu, 16 Oct 2025 09:24:46 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KDy-00000004BJx-1eR6
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 09:24:43 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-43fac2df7d4so270980b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 02:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760606679; x=1761211479; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/c6zz769KW3+RZuhvQvM45rkjkysrRExAu4xufMTsS4=;
        b=eQGm+6wnGTPKkBPTo7KZbOrKpQxOrUOEhvpolmaeorbUo3zz6wganKCxQceL/+im7Q
         KVe8JC2p2B6h5tTk5LFXJ6cFpW8Z79otmXDRzP9arRUIwbAOZHShwp806nbhK0b81wpy
         PCtvYyTWvCYY+3q8bc/xWXPelXt88haPg9VtcJ2mWvZ9j4aviOalQYEfxIodMoMNRszH
         KjyUuaZ6uKOWIsGJcwTHKEw/Piv7h6XlroPbjgTqNUSBhJK1kS02FAEePuDLCLG1W0dg
         IJyCEWfxhD2yri+tdY32rHq7fBlC66Q/JBH5TJsDufnJw419wlnL+5IYw5XHWBgXV0Ui
         szOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760606679; x=1761211479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/c6zz769KW3+RZuhvQvM45rkjkysrRExAu4xufMTsS4=;
        b=LGLF8VfPQvwsXLlOpq4ksKn5/iOWicLYL5NHqNgVPXctqgjTMvdBHBoc0cz+mBHeoL
         NXtCA1tki1uEf4Qg+k0AVzb1JW+JsFF/4YSEpb7zn8+29Zau7Jn7NXgTt2ueK//eRwkw
         19+0PDeIYyPJJMP4TObsnylxoUvmJO/tLnJO16dyVVwoiQRUwkvt4E+ihs8X0BRZ/ZjJ
         1D6rXVx2+VlKrA9Y99F3X4KpeihreT/5M8CCPjyrWqwWWj+2L07rLtT0R+s/0TDZhlyZ
         Vli0uPj1sO9HHtqgV1WYsnHiql7qFi39wQ0CSoLlwZ2uWdQzPmgTlaNy5SCdD/u+axO4
         95eA==
X-Forwarded-Encrypted: i=1; AJvYcCW++VGkzmJFkVNCSW0I2Ew1vEWXjlTDIo/OQEX2/QQdL3kJX5l0RXSjVoGq7NDoudDeJyMOHSTqeV8RZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwROb0sZMI2fji3/FgA7LqI8oDS5bH1aUb9wCSdMEMGiLsDpkT9
	VxIxl22KSRFlpsyEnlCp7NavXZ0R6oRsF1VTXAnFy9ya5YCer6riokYEHp2xUsksk8yM8vy+B7w
	G+afvwIWOtKg/XOdTPReK4SzRuyl6axb5HKx94suN5w==
X-Gm-Gg: ASbGncsAJW9JiBQzF7bj6eaUfK7XxbVRVCrOGsB6bveRu/9kE0N6dLM9vuYRc+GzwSC
	WUQ6hVyU8ZceXugPqgf+QlFlrCh64+k0rRbex5GM5aBRL5VUQmFNwvRHvi9FY1vs3XVUKOsg/Av
	C0LC6sk1LIFq6412KouNWgw5MLsqfISXjbrgDLLxQdZ7h5e+7MgMY8YlKueOKrsMBfYluHBClAK
	wFNr6hxDBsstY2AC8U57rt27taVop6/wXaz3Gcb5A8MBjJJp84ctFi8Bxpz5wr9W+9hr36q
X-Google-Smtp-Source: AGHT+IHm4R3HAhs61U+ziACGhT5EU87YhgLPPrROIOYqvuuTTqIEn/VlTT4VJwJAYRRve6qjnJ4K5VlBxkGqJHLI9cY=
X-Received: by 2002:a05:6808:1787:b0:439:8e9:637c with SMTP id
 5614622812f47-4417b3b1440mr14272700b6e.25.1760606678720; Thu, 16 Oct 2025
 02:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20251009134514.8549-1-cuiyunhui@bytedance.com> <aOfmnjJmQAdR1wD4@pie>
In-Reply-To: <aOfmnjJmQAdR1wD4@pie>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 16 Oct 2025 17:24:26 +0800
X-Gm-Features: AS18NWAzFcG41x3ym-AvM6L2OgXYcfI1rHQW_3fAesaQdIbiv5CARk8r2OaaGpI
Message-ID: <CAEEQ3wkH5FZSOGPhu7i7UDyi5=Xe6B9q7=4_ZZN_R2BHi63J1A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH RFC] riscv: add support for Ziccid
To: Yao Zi <ziyao@disroot.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, ardb@kernel.org, 
	willy@infradead.org, guoren@kernel.org, ziy@nvidia.com, 
	akpm@linux-foundation.org, bjorn@rivosinc.com, ajones@ventanamicro.com, 
	parri.andrea@gmail.com, cleger@rivosinc.com, yongxuan.wang@sifive.com, 
	inochiama@gmail.com, samuel.holland@sifive.com, charlie@rivosinc.com, 
	conor.dooley@microchip.com, yikming2222@gmail.com, andybnac@gmail.com, 
	yury.norov@gmail.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_022442_437065_2EEA4831 
X-CRM114-Status: GOOD (  26.41  )
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

SGkgWWFvLAoKT24gRnJpLCBPY3QgMTAsIDIwMjUgYXQgMTI6NDbigK9BTSBZYW8gWmkgPHppeWFv
QGRpc3Jvb3Qub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDA5LCAyMDI1IGF0IDA5OjQ1OjE0
UE0gKzA4MDAsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiBUaGUgWmljY2lkIGV4dGVuc2lvbiBwcm92
aWRlcyBoYXJkd2FyZSBzeW5jaHJvbml6YXRpb24gYmV0d2Vlbgo+ID4gRGNhY2hlIGFuZCBJY2Fj
aGUuIFdpdGggdGhpcyBoYXJkd2FyZSBzdXBwb3J0LCB0aGVyZSdzIG5vIGxvbmdlcgo+ID4gYSBu
ZWVkIHRvIHRyaWdnZXIgcmVtb3RlIGhhcnQgZXhlY3V0aW9uIG9mIGZlbmNlLmkgdmlhIElQSS4K
Pgo+IFRoaXMgZGVzY3JpcHRpb24gbG9va3Mgd3JvbmcgdG8gbWU6IFppY2NpZCBvbmx5IGd1YXJh
bnRlZXMgY29kZQo+IG1vZGlmaWNhdGlvbiAqKmV2ZW50dWFsbHkqKiBiZWNvbWVzIHZpc2libGUg
dG8gcmVtb3RlIEhBUlRzLCBub3QKPiBpbW1lZGlhdGVseS4gUXVvdGluZyBhIHBhcmFncmFwaCBm
cm9tIGRvY3VtZW50YXRpb24gb2YgWmljY2lkWzFdLAo+Cj4gPiBTaW5jZSwgdW5kZXIgWmljY2lk
LCBpbnN0cnVjdGlvbiBmZXRjaGVzIGFwcGVhciBpbiB0aGUgZ2xvYmFsIG1lbW9yeQo+ID4gb3Jk
ZXIsIHRoZSBSVldNTyBwcm9ncmVzcyBheGlvbSBzdWZmaWNlcyB0byBndWFyYW50ZWUgdGhhdCBz
dG9yZXMKPiA+ICoqZXZlbnR1YWxseSoqIGJlY29tZSB2aXNpYmxlIHRvIGluc3RydWN0aW9uIGZl
dGNoZXMsIGV2ZW4gd2l0aG91dAo+ID4gZXhlY3V0aW5nIGEgRkVOQ0UuSSBpbnN0cnVjdGlvbi4K
Pgo+IGFuZCBhbiBpc3N1ZVsyXSBpbiB0aGUgc2FtZSByZXBvc2l0b3J5IChaaWNjaWQgaGFyZHdh
cmUgaW1wbGVtZW50YXRpb24gJgo+IHNvZnR3YXJlIG1vZGVsKSwKPgo+ID4gPiBJcyBmZW5jZS5p
IHN0aWxsIG5lY2Vzc2FyeSBpbiBhbnkgY2FzZSB3aXRoIHRoZSBwcmVzZW5jZSBvZiBaaWNjaWQK
PiA+Cj4gPiBUaGUgb25seSB0aGluZyB0aGF0IFppY2NpZCBndWFyYW50ZWVzIGlzIHRoYXQgc3Rv
cmVzIGV2ZW50dWFsbHkgYmVjb21lCj4gPiB2aXNpYmxlIHRvIGluc3RydWN0aW9uIGZldGNoLiBJ
dCBkb2Vzbid0IGd1YXJhbnRlZSB0aGF0IHN0b3Jlcwo+ID4gaW1tZWRpYXRlbHkgYmVjb21lIHZp
c2libGUgdG8gaW5zdHJ1Y3Rpb24gZmV0Y2gsIGV2ZW4gb24gdGhlIHNhbWUKPiA+IGhhcnQuCj4g
Pgo+ID4gU28sIGZlbmNlLmkgaXMgc3RpbGwgdXN1YWxseSBuZWNlc3NhcnkuIFRoZSBvbmx5IHNp
dHVhdGlvbnMgaW4gd2hpY2gKPiA+IGZlbmNlLmkgaXMgbm90IG5lY2Vzc2FyeSBpcyB3aGVuIHJh
Y2UgY29uZGl0aW9ucyBpbiBjb2RlIHBhdGNoaW5nIGFyZQo+ID4gZnVuY3Rpb25hbGx5IGFjY2Vw
dGFibGUsIGkuZS4gd2hlbiBpdCBkb2Vzbid0IG1hdHRlciB3aGV0aGVyIHRoZSBvbGQKPiA+IGNv
ZGUgb3IgbmV3IGNvZGUgaXMgZXhlY3V0ZWQuCgpXZWxsLCB5ZXMsIGJhc2VkIG9uIHRoaXMgbGlu
aywgbm8gYWRkaXRpb25hbCBzb2Z0d2FyZSBzdXBwb3J0IGlzCm5lZWRlZOKAlGFuZCB0aGF04oCZ
cyBhbHNvIGEgZ29vZCB0aGluZy4KaHR0cHM6Ly9naXRodWIuY29tL2Fzd2F0ZXJtYW4vcmlzY3Yt
bWlzYy9pc3N1ZXMvNAoKPgo+IFNvIGl0J3MgZGVmaW5pdGVseSB3cm9uZyB0byBzdGF0ZSAidGhl
cmUncyBubyBsb25nZXIgYSBuZWVkIHRvIHRyaWdnZXIKPiByZW1vdGUgaGFydCBleGVjdXRpb24g
b2YgZmVuY2UuaSIuCj4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBi
eXRlZGFuY2UuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZs
dXNoLmggfCAgNCArKy0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAg
fCAgMSArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaCAgfCAxMCArKysr
KysrKysrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgfCAgMSArCj4g
PiAgYXJjaC9yaXNjdi9rZXJuZWwvZnRyYWNlLmMgICAgICAgICAgfCAgMiArLQo+ID4gIGFyY2gv
cmlzY3Yva2VybmVsL2hpYmVybmF0ZS5jICAgICAgIHwgIDIgKy0KPiA+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9qdW1wX2xhYmVsLmMgICAgICB8ICAyICstCj4gPiAgYXJjaC9yaXNjdi9tbS9jYWNoZWZs
dXNoLmMgICAgICAgICAgfCAxNiArKysrKysrKysrKysrKy0tCj4gPiAgOCBmaWxlcyBjaGFuZ2Vk
LCAzMSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4KPgo+IC4uLgo+Cj4gPiAtdm9p
ZCBmbHVzaF9pY2FjaGVfYWxsKHZvaWQpCj4gPiArdm9pZCBmbHVzaF9pY2FjaGVfYWxsKGJvb2wg
Zm9yY2UpCj4gPiAgewo+ID4gICAgICAgbG9jYWxfZmx1c2hfaWNhY2hlX2FsbCgpOwo+ID4KPiA+
ICAgICAgIGlmIChudW1fb25saW5lX2NwdXMoKSA8IDIpCj4gPiAgICAgICAgICAgICAgIHJldHVy
bjsKPiA+Cj4gPiArICAgICBpZiAoIWZvcmNlKQo+ID4gKyAgICAgICAgICAgICBhc20gZ290byhB
TFRFUk5BVElWRSgibm9wIiwgImogJWxbemljY2lkXSIsIDAsCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgUklTQ1ZfSVNBX0VYVF9aSUNDSUQsIDEpCj4gPiArICAgICAgICAgICAgICAgICAgICAg
OiA6IDogOiB6aWNjaWQpOwo+Cj4gYW5kIGV2ZW4gaW4gdGhlIHBhdGNoLCBhIHJlbW90ZS1mZW5j
ZSBpcyBzdGlsbCB0cmlnZ2VyZWQgaWYKPiBmbHVzaF9pY2FjaGVfYWxsKCkgaXMgY2FsbGVkIHdp
dGggZm9yY2Ugc2V0IHRvIHRydWUuCj4KPiBCZXN0IHJlZ2FyZHMsCj4gWWFvIFppCj4KPiBbMV06
IGh0dHBzOi8vZ2l0aHViLmNvbS9hc3dhdGVybWFuL3Jpc2N2LW1pc2MvYmxvYi9lNGZlM2FhN2I0
ZDViL2lzYS96aWNjaWQuYWRvYz9wbGFpbj0xI0wxMzktTDE1OAo+IFsyXTogaHR0cHM6Ly9naXRo
dWIuY29tL2Fzd2F0ZXJtYW4vcmlzY3YtbWlzYy9pc3N1ZXMvNCNpc3N1ZWNvbW1lbnQtMjg4NDk4
NDYzMwo+Cj4gPiAgICAgICAvKgo+ID4gICAgICAgICogTWFrZSBzdXJlIGFsbCBwcmV2aW91cyB3
cml0ZXMgdG8gdGhlIEQkIGFyZSBvcmRlcmVkIGJlZm9yZSBtYWtpbmcKPiA+ICAgICAgICAqIHRo
ZSBJUEkuIFRoZSBSSVNDLVYgc3BlYyBzdGF0ZXMgdGhhdCBhIGhhcnQgbXVzdCBleGVjdXRlIGEg
ZGF0YSBmZW5jZQo+ID4gQEAgLTQxLDYgKzQ2LDcgQEAgdm9pZCBmbHVzaF9pY2FjaGVfYWxsKHZv
aWQpCj4gPiAgICAgICAgICAgICAgIHNiaV9yZW1vdGVfZmVuY2VfaShOVUxMKTsKPiA+ICAgICAg
IGVsc2UKPiA+ICAgICAgICAgICAgICAgb25fZWFjaF9jcHUoaXBpX3JlbW90ZV9mZW5jZV9pLCBO
VUxMLCAxKTsKPiA+ICt6aWNjaWQ6Owo+ID4gIH0KPiA+ICBFWFBPUlRfU1lNQk9MKGZsdXNoX2lj
YWNoZV9hbGwpOwoKClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
