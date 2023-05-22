Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983FEC7EE26
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=egKWZ+QDxzG7h1SaJrKNlBfwcz4Ip2p5qW3Hz0ImKzc=; b=eIXXb+RsDp1Q/Q
	q8UWB4Jf0nI+Li4qGu0bSne0RBZ+4gFQooz2E3zUldGa6OsY6kcsirTfUKaI16tmGtXj/bZg5azYa
	qMXFtJs04By5I4x+x+VABGKbVkqV/+3zhMF0TzpVR/2DbAX2LMMEDf4rZAvwiaJfClMB0g3gCNEln
	q1vcYmtywRAQ3yYGeodB0YEgkWsSr+F7rE9hbmn1A9LSO8OQtbnWxxJ1nTPY+JhIcWlz1Ai+q3uF2
	c+S9gsazP1sesWTYerYKrTmc9CYrakQptCbANgpllvp9rEi8JT84SZ0S/apYv7wW5awPfdmLGnF6j
	ctgZIOrSO9ak2FcP/hGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q10nC-005jeb-1u;
	Mon, 22 May 2023 08:21:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q10nA-005jdG-1W
	for linux-riscv@lists.infradead.org;
	Mon, 22 May 2023 08:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684743678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Wu/XGI/Cw3LL7Rh46pg9C16OYUTDksjb0N1uf2C+4U=;
	b=V5PaRAqiDZ+xGE6sn7eQg2yOH7qAe6OAhq7XaeiDVb73bk/4CZHy9cqPg5sWUwNuBdR8bQ
	zwflFC8z9SyXvdydCmN4RVY4zlJenvofxis7q8NebxWijZyQ9Wj2xdEcUGsIpHIfYpOpTV
	k2P7ggCDfAKxOmzwWXNLni5WF0z+N8Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-6oU7_u2WOt2LWvLAt-O8Zw-1; Mon, 22 May 2023 04:21:16 -0400
X-MC-Unique: 6oU7_u2WOt2LWvLAt-O8Zw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f6045853c1so2375585e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 May 2023 01:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684743675; x=1687335675;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Wu/XGI/Cw3LL7Rh46pg9C16OYUTDksjb0N1uf2C+4U=;
        b=P6Mgx11kQRg29QlLgaPRYTFWLp0EX0Xf7HFtgXE2el5QpN72EPny9TvZ72aFyNPsy+
         XDBJR+OwnaYdFcNmwB4ptG3RftjZ0ZFEy3T84R5YjtH7rhV1T/JYItpLNrgRp6LkJPEo
         zxd+iT/3vgmX0NkHI4HpONseI4jeWeMTYTN637StO/3Pwrlv6A17219q9Hh97Xp2Ybri
         mZ0q+5zmSGOFZEgB9UjyJ5Dj5wADkTgUAF6qWyRxOEw5GNPVXpplv6fTLla67FoWzNn/
         PucgTig1jBvEvKwfJNp0Y70dk+Ir1CEVbWhzZ2opCGVlfRiK6RGJScR444BZHDSIFzUf
         DQXA==
X-Gm-Message-State: AC+VfDyb2UFOVEqmxFegOyyVC9m39d2lErI65cUsxh8MR4fjrb1T3QXZ
	C4ByVasfQF2yVW/KNVaEC57/x32fL31EFiecx9T6GZARrHX5uvoMtrS3CrYjdkkHK1jx43LmqVX
	qD52UZCnCZ/eXAQXycRvpSm9Ry27T
X-Received: by 2002:a1c:f70e:0:b0:3f4:2b1a:553b with SMTP id v14-20020a1cf70e000000b003f42b1a553bmr6741841wmh.28.1684743675400;
        Mon, 22 May 2023 01:21:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6mG7l4xGGoGOdmClG/pwLidLadfZoXsxEEQrH052zzBQHncEp4Wz9Jql141DWAS4jQSBmoww==
X-Received: by 2002:a1c:f70e:0:b0:3f4:2b1a:553b with SMTP id v14-20020a1cf70e000000b003f42b1a553bmr6741816wmh.28.1684743675017;
        Mon, 22 May 2023 01:21:15 -0700 (PDT)
Received: from ?IPV6:2003:cb:c742:c800:d74f:aec6:f8ac:558? (p200300cbc742c800d74faec6f8ac0558.dip0.t-ipconnect.de. [2003:cb:c742:c800:d74f:aec6:f8ac:558])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c021000b003f50d6ee334sm7400593wmi.47.2023.05.22.01.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 01:21:14 -0700 (PDT)
Message-ID: <c7e3152b-4fdd-cb93-a4f0-06502eab59b1@redhat.com>
Date: Mon, 22 May 2023 10:21:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Oscar Salvador <osalvador@suse.de>,
 virtualization@lists.linux-foundation.org, linux@rivosinc.com,
 Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20230512145737.985671-1-bjorn@kernel.org>
 <9aa7d030-19b5-01df-70c0-86d8d6ab86a6@redhat.com>
 <87zg62eqm4.fsf@all.your.base.are.belong.to.us>
 <87lehikpu6.fsf@all.your.base.are.belong.to.us>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 0/7] riscv: Memory Hot(Un)Plug support
In-Reply-To: <87lehikpu6.fsf@all.your.base.are.belong.to.us>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_012120_599856_447C028C 
X-CRM114-Status: GOOD (  18.53  )
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

T24gMjEuMDUuMjMgMTE6MTUsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gSGkgRGF2aWQgYW5kIEFu
c2h1bWFuIQo+IAo+IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyaXRlczoKPiAK
Pj4gRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+IHdyaXRlczoKPj4KPj4+IE9u
IDEyLjA1LjIzIDE2OjU3LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+Pj4+IEZyb206IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPj4+Pgo+Pj4+IE1lbW9yeSBIb3QoVW4pUGx1ZyBz
dXBwb3J0IGZvciB0aGUgUklTQy1WIHBvcnQKPj4+PiA9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09Cj4+Cj4+IFsuLi5dCj4+Cj4+Pgo+Pj4gQ29vbCBzdHVmZiEg
SSdtIGZhaXJseSBidXN5IHJpZ2h0IG5vdywgc28gc29tZSBoaWdoLWxldmVsIHF1ZXN0aW9ucyB1
cGZyb250Ogo+Pgo+PiBObyB3b3JyaWVzLCBhbmQgbm8gcnVzaCEgSSdkIHNheSB0aGUgdjEgc2Vy
aWVzIHdhcyBtYWlubHkgZm9yIHRoZSBSSVNDLVYKPj4gZm9sa3MsIGFuZCBJJ3ZlIGdvdCB0b25z
IG9mIChvZmZsaW5lKSBjb21tZW50cyBmcm9tIEFsZXggLS0gYW5kIHdpdGgKPj4geW91ciBjb21t
ZW50cyBiZWxvdyBzb21lIG1vcmUgZGV0YWlscyB0byBmaWd1cmUgb3V0Lgo+IAo+IE9uZSBvZiB0
aGUgbWFqb3IgaXNzdWVzIHdpdGggbXkgdjEgcGF0Y2ggaXMgYXJvdW5kIGluaXRfbW0gcGFnZSB0
YWJsZQo+IHN5bmNocm9uaXphdGlvbiwgYW5kIHRoYXQnbGwgYmUgcGFydCBvZiB0aGUgdjIuCj4g
Cj4gSSd2ZSBub3RpY2VkIHRoZXJlJ3MgYSBxdWl0ZSBhIGRpZmZlcmVuY2UgYmV0d2VlbiB4ODYt
NjQgYW5kIGFybTY0IGluCj4gdGVybXMgb2YgbG9ja2luZywgd2hlbiB1cGRhdGluZyAoYWRkL3Jl
bW92ZSkgdGhlIGluaXRfbW0gdGFibGUuIHg4Ni02NAo+IHVzZXMgdGhlIHVzdWFsIHBhZ2UgdGFi
bGUgbG9ja2luZyBtZWNoYW5pc21zICh1c2VkIGJ5IHRoZSBnZW5lcmljCj4ga2VybmVsIGZ1bmN0
aW9ucyksIHdoZXJlYXMgYXJtNjQgZG9lcyBub3QuCj4gCj4gSG93IGRvZXMgYXJtNjQgbWFuYWdl
IHRvIG1peCB0aGUgImxvY2stbGVzcyIgdXBkYXRlcyAoUkVBRC9XUklURV9PTkNFLAo+IGFuZCBm
ZW5jZXMgaW4gc2V0X3A/ZCtmcmllbmRzKSwgd2l0aCB0aGUgZ2VuZXJpYyBrZXJuZWwgb25lcyB0
aGF0IHVzZXMKPiB0aGUgcmVndWxhciBwYWdlIGxvY2tpbmcgbWVjaGFuaXNtPwo+IAo+IEknbSBv
YnZpb3VzbHkgbWlzc2luZyBzb21ldGhpbmcgYWJvdXQgdGhlIGxvY2tpbmcgcnVsZXMgZm9yIG1l
bW9yeSBob3QKPiBhZGQvcmVtb3ZlLi4uIEkndmUgYmVlbiByZWFkaW5nIHRoZSBhcm02NCBtZW1v
cnkgaG90IGFkZC9yZW1vdmUKPiBzZXJpZXMsIGJ1dCBub25lIHRoZSB3aXNlciEgOy0pCgpJbiBn
ZW5lcmFsLCBtZW1vcnkgaG90KHVuKXBsdWcgaXMgc2VyaWFsaXplZCBvbiBhIGhpZ2ggbGV2ZWwg
dXNpbmcgdGhlIAptZW1faG90cGx1Z19sb2NrLiBGb3IgZXhhbXBsZSwgaW4gcGFnZW1hcF9yYW5n
ZSgpIG9yIGluIAphZGRfbWVtb3J5X3Jlc291cmNlKCksIHdlIGdyYWIgdGhhdCBsb2NrIGluIHdy
aXRlIG1vZGUuIFNvIHdlJ2xsIG5ldmVyIApzZWUgbWVtb3J5IGdldHRpbmcgYWRkZWQvcmVtb3Zl
ZCBjb25jdXJyZW50bHkgZnJvbSB0aGUgZGlyZWN0IG1hcC4KCiBGcm9tIHdoYXQgSSByZWNhbGws
IHRoZSBsb2NraW5nIG9uIHRoZSBhcmNoIGxldmVsIGlzIHJlcXVpcmVkIGZvciAKY29uY3VycmVu
dCAoZGlyZWN0IG1hcHBpbmcpIHBhZ2UgdGFibGUgbW9kaWZpY2F0aW9ucyB0aGF0IHRhcmdldCB2
aXJ0dWFsIAphZGRyZXNzIHJhbmdlcyBhZGphY2VudCB0byB0aGUgcmFuZ2VzIHdlIGhvdCh1bilw
bHVnOgpDT05GSUdfQVJDSF9IQVNfU0VUX0RJUkVDVF9NQVAgYW5kIHZtYWxsb2MgY29tZSB0byBt
aW5kLgoKRm9yIGV4YW1wbGUsIGlmIGEgcmFuZ2Ugd291bGQgYmUgbWFwcGVkIHVzaW5nIGEgbGFy
Z2UgUFVELCBidXQgd2UgaGF2ZSAKdG8gdW5wbHVnIGl0IHBhcnRpYWxseSAodW5wbHVnZ2luZyBt
ZW1vcnkgcGFydCBvZiBib290bWVtKSwgd2UnZCBoYXZlIHRvIApyZXBsYWNlIHRoZSBsYXJnZSBQ
VUQgYnkgYSBQTUQgdGFibGUgZmlyc3QuIFRoYXQgY2hhbmdlICh0aGF0IGNvdWxkIAphZmZlY3Qg
b3RoZXIgY29uY3VycmVudCBwYWdlIHRhYmxlIHdhbGtlcnMvb3BlcmF0aW9ucykgaGFzIHRvIGJl
IApzeW5jaHJvbml6ZWQuCgpJIGd1ZXNzIHRvIHdoaWNoIGRlZ3JlZSB0aGlzIGFwcGxpZXMgdG8g
cmlzY3YgZGVwZW5kcyBvbiB0aGUgdmlydHVhbCAKbWVtb3J5IGxheW91dCwgZGlyZWN0IG1hcHBp
bmcgZ3JhbnVsYXJpdHkgYW5kIGZlYXR1cmVzIChlLmcuLCAKQ09ORklHX0FSQ0hfSEFTX1NFVF9E
SVJFQ1RfTUFQKS4KCgpPbmUgdHJpY2sgdGhhdCBhcm02NCBpbXBsZW1lbnRzIGlzLCB0aGF0IGl0
IG9ubHkgYWxsb3dzIGhvdHVucGx1Z2dpbmcgCm1lbW9yeSB0aGF0IHdhcyBob3RwbHVnZ2VkIChz
ZWUgcHJldmVudF9ib290bWVtX3JlbW92ZV9ub3RpZmllcigpKS4gVGhhdCAKbWlnaHQganVzdCBy
dWxlIG91dCBzdWNoIHByb2JsZW1hdGljIGNhc2VzIHRoYXQgcmVxdWlyZSBsb2NraW5nIApjb21w
bGV0ZWx5LCBhbmQgdGhlIGhpZ2gtbGV2ZWwgbWVtX2hvdHBsdWdfbG9jayBzdWZmaWNpZW50LgoK
LS0gClRoYW5rcywKCkRhdmlkIC8gZGhpbGRlbmIKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
