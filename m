Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1E0D64093
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpoCHsGZ65tBvJn2YKiljT1/8dcziI/gfCmhtz93jrs=; b=STRXXj4Yxwt87r
	T+3Fq55k9zNWri+VZUMmKz3svBxGxDGM7q8LCXFfYtRhyJ8QmWDKpi0HS5Q49Qh2pXbTImPKfPoiI
	Uq2nuBHL6BVgYNsoduU06YLPuZFvcrln//oue+RdYO5WAyBm3Qx/6S3M1UAGPH9lC+EIQAb0ydyhq
	9gY35+FUGKvGj5LMF6Htl1IhLNiFMcRAb1WhV7ntoOhZAhYhNxIV9akSZbkNbe84+acCoCHoyPNcf
	lgFEBf9Uvjzx4IsvZMHtjnfs1cowwcuc/pK7z8aABWkRp4esk9uWdff7kO04b+QRz9QlJ4lvxj2Wm
	/1ZIgj7LQTJVu61vv/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnUJ-00000006OW9-0SKa;
	Wed, 17 Dec 2025 09:06:27 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnUG-00000006OVg-196z
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 09:06:25 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-34c3cb504efso4034403a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Dec 2025 01:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765962383; x=1766567183; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1VRWjeuH/kViMmS59iXj3V5sEFdHUh9qPFuC/Iijp4=;
        b=Ek2qMVV01rwKh7l1PfMi1Vq8EdFOtwtQpN3y6SU3AIfxKY3+Fpm/2c9MezQifwUx07
         2lESIrFAZKUU5s4Ol9fnSZ5ycckB36H+yisw3H00F2bjsMRuSUue2/zsGwERcnZ6A3vU
         ElJ949ILnVyVxfF7VKuo5atpMebdjl0Jfg2EDKZWFNHYCAn/WPCk3p0Eb/c0tk7qTiXo
         EF0aAXi20iY5TuSKd9XgSXB2Qz2YtsrkWRuYy0X3GFZPXGCM8DBGTHowl2tp57NTfH7f
         rZjSvT5wStu4/3u+248VshWW5Xn/f3zA4RS/BW9MI8F/hEUvUjdD6hw8tKDVpYVqHvQI
         KE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765962383; x=1766567183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1VRWjeuH/kViMmS59iXj3V5sEFdHUh9qPFuC/Iijp4=;
        b=qKgaTkytKhqg+8wRsAefNEwndfTMXEKlIEEA20BiuiY3Oqai758F2UNWux5ZJf4GSk
         XGfb033ctonZcXMMFXWZOAXpMZNT9QIwfo+oXecUqDKdkV/NCE7T9tStYjv3v7yGSUWk
         MudjGjxaUln9zDQlNYC3cNqqLyS2MakJCp+APisYAAHYYfDrAl+gOlsrhocyITiQ2nd6
         dhQkDisJHz0ailMn/SfqMMDvN6PlT6r/orm8PNEmslU8Vk9HrmUQIt9eNHKLWUwkfeg7
         hBKwIG5hqkQpp50+msvDRTkXQM+SLh4V/+cVpxs2XM87QLknkAbDXNEXGqcuRoGBm9fK
         3O2g==
X-Forwarded-Encrypted: i=1; AJvYcCVAHx4esi3G7guU9c02BcF9L0j3d4vj83/elOvovkKBUHSdwQyj+MrCLOupl+6aAtXAKaR+dDSuBVB2kg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRT67dpbIpcS3GeLP7e0eQe60Wi162eR4ziVEP1UqG8bNlY2Jb
	eqnx1q7hhj1wLGFEWL97EsI7XY8njYKZmdRlGr0px/I+Grkl3vQ8qMyD
X-Gm-Gg: AY/fxX4H66MXOaLIyppFnJ6e/zo6U63V0osPJQO8ewdjNPjSRhENL1KPwEZE7Sd//o7
	ucX6MSf2Vi8bAQtk3ckIWKgVQc1nRfEbkmZPiJDd4onGozwixohHb/AltQxW9R39PFyJMfDY2Xf
	UfpjqY4d5TM43OCnobdrcgphw8vjDghLUsxPEWCgKpjkOk4OPSxGl6U7ah9EXPu53u6r1zRTDJE
	KLnH0qUnSv2Tx26k1ncLRq3rqQJVjfYXEFVURT1oLdJCbNkyecm9msldTQjt5OKAH9C6IRIK/Ih
	b1rJpseUv8MXQSbVEMMkBNfqZ6H3GCMSQq2zsnpQmp2zKbIydApJGS+px1ENOuhlCwSpWtbW295
	wULbHsa28WzpzE5wDgkhSQqrVlkbUpeimb36oQlsxF+0E/3+Y+tEb//pgCRre8kvJXziBnGL0kN
	6IhqlltexYRnt3
X-Google-Smtp-Source: AGHT+IE6PfmxAkj5HlkxzkJmnrwLpLmQDasxQXTlueI2ut1ZFaSRcM/T3o7RF88n/l5r5DOiJzvQyA==
X-Received: by 2002:a17:90b:3f85:b0:330:6d5e:f174 with SMTP id 98e67ed59e1d1-34abd751aa3mr16360133a91.20.1765962382751;
        Wed, 17 Dec 2025 01:06:22 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcbc0be691sm2048570b3a.58.2025.12.17.01.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 01:06:22 -0800 (PST)
Message-ID: <e5d92ecd-6bc1-438d-87ec-96f60d1b8a24@gmail.com>
Date: Wed, 17 Dec 2025 01:04:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX board
 device tree
To: Guodong Xu <guodong@riscstar.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley
 <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 linux-serial@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-8-a0d256c9dc92@riscstar.com>
 <3c38ce9c-4259-4149-bf2c-a54e74c00a34@canonical.com>
 <CAH1PCMbzv_uggyZ3JLPyWXSwbe2dJAh7jVT64xpM6SLG77VZqQ@mail.gmail.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <CAH1PCMbzv_uggyZ3JLPyWXSwbe2dJAh7jVT64xpM6SLG77VZqQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_010624_316236_23879EEE 
X-CRM114-Status: GOOD (  25.44  )
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

SGkgR3VvZG9uZywKCk9uIDEyLzE2LzI1IDIzOjEzLCBHdW9kb25nIFh1IHdyb3RlOgo+IE9uIFR1
ZSwgRGVjIDE2LCAyMDI1IGF0IDEwOjMz4oCvUE0gSGVpbnJpY2ggU2NodWNoYXJkdAo+IDxoZWlu
cmljaC5zY2h1Y2hhcmR0QGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+Pgo+PiBPbiAxMi8xNi8yNSAx
NDozMiwgR3VvZG9uZyBYdSB3cm90ZToKPj4+IEszIFBpY28tSVRYIGlzIGEgMi41LWluY2ggc2lu
Z2xlLWJvYXJkIGNvbXB1dGVyIGVxdWlwdGVkIHdpdGggYSBTcGFjZW1pVAo+Pj4gSzMgU29DLgo+
Pj4KPj4+IFRoaXMgbWluaW1hbCBkZXZpY2UgdHJlZSBlbmFibGVzIGJvb3RpbmcgaW50byBhIHNl
cmlhbCBjb25zb2xlIHdpdGggVUFSVAo+Pj4gb3V0cHV0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6
IEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlzY3N0YXIuY29tPgo+Pj4gLS0tCj4+PiAgICBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NwYWNlbWl0L01ha2VmaWxlICAgICAgICB8ICAxICsKPj4+ICAgIGFyY2gv
cmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMtcGljby1pdHguZHRzIHwgMjUgKysrKysrKysrKysr
KysrKysrKysrKysrKwo+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4+
Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvTWFrZWZpbGUg
Yi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L01ha2VmaWxlCj4+PiBpbmRleCA5NTg4OWU3
MjY5ZDFiYWU2NzliMjhjZDA1M2UxYjBhMjNhZTZkZTY4Li43ZTJiODc3MDI1NzE4MTEzYTBlMzE5
MTdlYWRmNzU2MmY0ODhkODI1IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9z
cGFjZW1pdC9NYWtlZmlsZQo+Pj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9N
YWtlZmlsZQo+Pj4gQEAgLTQsMyArNCw0IEBAIGR0Yi0kKENPTkZJR19BUkNIX1NQQUNFTUlUKSAr
PSBrMS1taWxrdi1qdXBpdGVyLmR0Ygo+Pj4gICAgZHRiLSQoQ09ORklHX0FSQ0hfU1BBQ0VNSVQp
ICs9IGsxLW11c2VwaS1wcm8uZHRiCj4+PiAgICBkdGItJChDT05GSUdfQVJDSF9TUEFDRU1JVCkg
Kz0gazEtb3JhbmdlcGktcjJzLmR0Ygo+Pj4gICAgZHRiLSQoQ09ORklHX0FSQ0hfU1BBQ0VNSVQp
ICs9IGsxLW9yYW5nZXBpLXJ2Mi5kdGIKPj4+ICtkdGItJChDT05GSUdfQVJDSF9TUEFDRU1JVCkg
Kz0gazMtcGljby1pdHguZHRiCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9z
cGFjZW1pdC9rMy1waWNvLWl0eC5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sz
LXBpY28taXR4LmR0cwo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjBmOWQwNGRkMzUyZjUzMzFlODI1OTky
ODUxMTNiODZhZjViMDllYmUKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3BhY2VtaXQvazMtcGljby1pdHguZHRzCj4+PiBAQCAtMCwwICsxLDI1IEBACj4+
PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkKPj4+ICsvKgo+
Pj4gKyAqIENvcHlyaWdodCAoYykgMjAyNSBTcGFjZW1pVCAoSGFuZ3pob3UpIFRlY2hub2xvZ3kg
Q28uIEx0ZAo+Pj4gKyAqIENvcHlyaWdodCAoYykgMjAyNSBHdW9kb25nIFh1IDxndW9kb25nQHJp
c2NzdGFyLmNvbT4KPj4+ICsgKi8KPj4+ICsKPj4+ICsjaW5jbHVkZSAiazMuZHRzaSIKPj4+ICsK
Pj4+ICsvIHsKPj4+ICsgICAgIG1vZGVsID0gIlNwYWNlbWlUIEszIFBpY28tSVRYIjsKPj4+ICsg
ICAgIGNvbXBhdGlibGUgPSAic3BhY2VtaXQsazMtcGljby1pdHgiLCAic3BhY2VtaXQsazMiOwo+
Pj4gKwo+Pj4gKyAgICAgY2hvc2VuIHsKPj4+ICsgICAgICAgICAgICAgc3Rkb3V0LXBhdGggPSAi
c2VyaWFsMCI7Cj4+PiArICAgICB9Owo+Pj4gKwo+Pj4gKyAgICAgbWVtb3J5QDEwMDIwMDAwMCB7
Cj4+PiArICAgICAgICAgICAgIGRldmljZV90eXBlID0gIm1lbW9yeSI7Cj4+PiArICAgICAgICAg
ICAgIHJlZyA9IDwweDEgMHgwMDIwMDAwMCAweDMgMHhmZmUwMDAwMD47Cj4+Cj4+IFNob3VsZG4n
dCB0aGUgcmVzZXJ2ZWQgbWVtb3J5IGJlIGRlc2NyaWJlZCBhcyBuby1tYXAgL3Jlc2VydmVkLW1l
bW9yeQo+PiBub2RlcyBpbnN0ZWFkPwo+IAo+IEhpIEhlaW5yaWNoLAo+IAo+IFllcywgeW91IGFy
ZSByaWdodC4gVXNpbmcgYSByZXNlcnZlZC1tZW1vcnkgbm9kZSB3aXRoIHRoZSBuby1tYXAgcHJv
cGVydHkgaXMKPiB0aGUgY29ycmVjdCBhcHByb2FjaC4gSSB3aWxsIHVwZGF0ZSB0aGlzIGluIHRo
ZSBuZXh0IHZlcnNpb24gdG8gZXhwbGljaXRseQo+IHJlc2VydmUgdGhlIGZpcnN0IDJNQi4KPiAK
Pj4KPj4gSSB3b3VsZCBhc3N1bWUgdGhhdCAweDEsMDAwMCwwMDAwIGlzIHRoZSBsb2NhdGlvbiBv
ZiBPcGVuU0JJLgo+PiBXaGF0IGlzIGF0IDB4MyxmZmUwLDAwMDA/Cj4gCj4gWWVzLCBjb25maXJt
ZWQsIDB4MTAwMDAwMDAwIGlzIHRoZSBzdGFydCBvZiBPcGVuU0JJLiBUaGUgc2l6ZSAweDNmZmUw
MDAwMCBpbgo+IG15IG9yaWdpbmFsIHBhdGNoIHdhcyB0aGUgcmVzdWx0IG9mIG1hbnVhbGx5IHN1
YnRyYWN0aW5nIHRoZSAyTUIgT3BlblNCSQo+IG9mZnNldCBmcm9tIHRoZSB0b3RhbCAxNkdCIG1l
bW9yeS4KPiAKPiBJIHdpbGwgY29ycmVjdCB0aGlzIGluIHYyIHRvIHNob3cgdGhlIGFjdHVhbCBt
ZW1vcnkgYW5kIHB1dCB0aGUgZmlyc3QgMk1CIGluCj4gcmVzZXJ2ZWQtbWVtb3J5IHt9IGZvciBv
cGVuc2JpLgoKSSBkb24ndCB0aGluayB0aGlzIGlzIHRoZSByaWdodCBhcHByb2FjaC4gVGhlIExp
bnV4IGtlcm5lbCBzaG91bGRuJ3QgY2FyZQphYm91dCB0aGUgc2l6ZSBvZiB0aGUgdW5kZXJseWlu
ZyBTQkkgaW1wbGVtZW50YXRpb24uIFRoZSBzaXplIG9mIE9wZW5TQkkKYWxzbyBkZXBlbmRzIG9u
IHRoZSB2ZXJzaW9uIGFuZCBmZWF0dXJlcyBlbmFibGVkLiBUaHVzLCB5b3Ugc2hvdWxkIGp1c3QK
bGV0IHRoZSBPcGVuU0JJIG9yIHdoYXRldmVyIFNCSSBmaXggdXAgdGhlIGRldmljZS10cmVlIGZv
ciB5b3UuIE9wZW5TQkkKYWxyZWFkeSBkb2VzIHRoYXQgdG9kYXkuIEl0IGluc2VydHMgb25lIG9y
IG1vcmUgcmVzZXJ2ZWQtbWVtb3J5IG5vZGUgYW5kCmNhcnZlcyBvdXQgdGhlIG1lbW9yeSByZWdp
b24gb2YgaXRzIG93bi4gSWYgdGhlcmUncyBzb21lIGJvb3Rsb2FkZXIgaW4KYmV0d2VlbiBTQkkg
PC0+IExpbnV4LCBzdWNoIGFzIFUtYm9vdCwgdGhlbiBpdCdzIHJlc3BvbnNpYmxlIGZvciBjb3B5
aW5nCm92ZXIgdGhvc2UgcmVzZXJ2ZWQgcmVnaW9ucyBmcm9tIE9wZW5TQkkgaW50byB0aGUgZGV2
aWNlLXRyZWUgTGludXggdXNlcwooVS1ib290IGFscmVhZHkgZG9lcykuIFRodXMsIHRoZXJlJ3Mg
bm8gbmVlZCB0byBtYW51YWxseSBzcGVjaWZ5IGl0LgoKQm8KCj4gCj4gVGhhbmtzIGZvciB0aGUg
cmV2aWV3Lgo+IAo+IEJSLAo+IEd1b2RvbmcgWHUKPiAKPiAKPj4KPj4gQmVzdCByZWdhcmRzCj4+
Cj4+IEhlaW5yaWNoCj4+Cj4+PiArICAgICB9Owo+Pj4gK307Cj4+PiArCj4+PiArJnVhcnQwIHsK
Pj4+ICsgICAgIHN0YXR1cyA9ICJva2F5IjsKPj4+ICt9Owo+Pj4KPj4KPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
