Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D65C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 13:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjifCph+yEIfCMZZUFB3UtqYR2QwmTDLdPcxrMPj4hY=; b=O1bdHgHVY2sLug
	zL7Qr/mKsdIigKyFvoOzx4oDKM5zNP5ODEzh8+kcxHh6tbGS1FXRPoozGFC/SlymD+z89IL7jGagi
	qDO0XSsR1BDHP3nxtPyx2ero8uraC0C8IZD0KauGl9HMhFZWMVTn7Psgk43SPN5DjWu1GpRtNtYxj
	K8MP2WTzPLG4ZS+KM42TINb/yuJenKNN+uajeHYWkK0aGNlr5pomQBk3r7q2mFwabtMcQ7lN+tJXC
	xD6P+dVAP3TvGEAn+/ciypJXlGsWZfh33REezUau4rYuDdxX43gJKb/OWzRqDUn95Q702ObEaQgYz
	BJ041uHjBgXSpEvTig4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSHFE-00GhQc-2D;
	Tue, 23 Jan 2024 13:55:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSHFB-00GhOS-0d
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 13:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706018112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WbJQ58Ljpuy8Vw/B7ZBTw3hv4ANT/jjJ7tp8ylORPFw=;
	b=asDsAfLjOMmV6XyLHJ3luV+vhSVP37HMPDmgq/625X5Qn/WPzA1lDPwwRuf0GZ1yM5keRp
	tLToJ352mN9Qq9d7qXvn6forUMJ1Q0z0Wem29U4qf7oqLcyrQtzZ8yUddOqgfLnJqZRxmD
	ylQni1S2kuNad4LRO98U9YPqXs7OBUE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-qZ-9I3dJMiqCfI_VdzsTEg-1; Tue, 23 Jan 2024 08:55:10 -0500
X-MC-Unique: qZ-9I3dJMiqCfI_VdzsTEg-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33927b1fac7so1741310f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 05:55:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706018110; x=1706622910;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbJQ58Ljpuy8Vw/B7ZBTw3hv4ANT/jjJ7tp8ylORPFw=;
        b=bAYVHdgu4F7KoYpjpdWXG7N2mPuQ0uUCIMwS/7ks20Jf7/n8/8lJer42gMZ1d78uMc
         DWzIuzi6ZYUOOOhB+gxsyhBaCXAhS+xsq/sNJjFQOnzHtQxVhVLCC9AroMTkSDGcajfO
         wxJbK3mIxxUcJp7fk47uXpFHDgaBS6vjvMhlGeSk3uXbAUfheaOg65GsAR1PdEYD9XBt
         hCy5q8pkw+0vHfTkAePmP6yGZJO21iIjVIedEJENWrRz7RANcWpHSFNtWPlr4m5dfjQM
         WNNBd5KVB1mz75hdyc5gSb+UIX3yaoj2a9OkmZDm3eFQI45BXpbj4EneNLuU+zgj1rXF
         B8Lw==
X-Gm-Message-State: AOJu0YwOTLEVFZKQQxa/yHMUnkt9L0uc/MNhlcfqDtxvqiAk+q/jSlW4
	d/Je+KQtr/0iE4PluthnKelSSXvWBvbdFTHxBP0JSn0L/XXZ9sMvrOZo1OywQwOYYmG0qCP/P3O
	85GtFUKdWUglJd4kksJsP5/bSDWdHl6ThIhi9W2aYddTAdxk7OnSouzHjAmWKC3Znqw==
X-Received: by 2002:adf:e501:0:b0:337:b53e:6065 with SMTP id j1-20020adfe501000000b00337b53e6065mr3769040wrm.41.1706018109547;
        Tue, 23 Jan 2024 05:55:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0w0V/ld9eCbEjxciaXWhGg6pUEgVKCYMwUZNd7z5oyfWTKYjjYNbrxMD5nf1aExtZi4ADgA==
X-Received: by 2002:adf:e501:0:b0:337:b53e:6065 with SMTP id j1-20020adfe501000000b00337b53e6065mr3769019wrm.41.1706018109107;
        Tue, 23 Jan 2024 05:55:09 -0800 (PST)
Received: from ?IPV6:2003:cb:c741:de00:bf0f:cd46:dc1c:2de9? (p200300cbc741de00bf0fcd46dc1c2de9.dip0.t-ipconnect.de. [2003:cb:c741:de00:bf0f:cd46:dc1c:2de9])
        by smtp.gmail.com with ESMTPSA id l11-20020a5d674b000000b003392c727cadsm7565717wrw.27.2024.01.23.05.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 05:55:08 -0800 (PST)
Message-ID: <c92c2460-c66a-46c7-b84f-0732965dcf73@redhat.com>
Date: Tue, 23 Jan 2024 14:55:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/11] mm/memory: ignore dirty/accessed/soft-dirty bits
 in folio_pte_batch()
To: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-11-david@redhat.com>
 <59592b50-fe89-4b32-8490-2e6c296f972f@arm.com>
 <76740e33-9b52-4e23-b407-8ae38bac15ec@redhat.com>
 <94d33a07-c59a-4315-9c64-8b4d959ca1f4@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <94d33a07-c59a-4315-9c64-8b4d959ca1f4@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_055513_308447_2313C808 
X-CRM114-Status: GOOD (  28.17  )
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

T24gMjMuMDEuMjQgMTQ6NDIsIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPiBPbiAyMy8wMS8yMDI0IDEz
OjA2LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gT24gMjMuMDEuMjQgMTM6MjUsIFJ5YW4g
Um9iZXJ0cyB3cm90ZToKPj4+IE9uIDIyLzAxLzIwMjQgMTk6NDEsIERhdmlkIEhpbGRlbmJyYW5k
IHdyb3RlOgo+Pj4+IExldCdzIGlnbm9yZSB0aGVzZSBiaXRzOiB0aGV5IGFyZSBpcnJlbGV2YW50
IGZvciBmb3JrLCBhbmQgd2lsbCBsaWtlbHkKPj4+PiBiZSBpcnJlbGV2YW50IGZvciB1cGNvbWlu
ZyB1c2VycyBzdWNoIGFzIHBhZ2UgdW5tYXBwaW5nLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
RGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4+Pj4gLS0tCj4+Pj4gIMKgIG1t
L21lbW9yeS5jIHwgMTAgKysrKysrKystLQo+Pj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL21tL21lbW9y
eS5jIGIvbW0vbWVtb3J5LmMKPj4+PiBpbmRleCBmNTYzYWVjODViMmE4Li4zNDFiMmJlODQ1YjZl
IDEwMDY0NAo+Pj4+IC0tLSBhL21tL21lbW9yeS5jCj4+Pj4gKysrIGIvbW0vbWVtb3J5LmMKPj4+
PiBAQCAtOTUzLDI0ICs5NTMsMzAgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIF9fY29w
eV9wcmVzZW50X3B0ZXMoc3RydWN0Cj4+Pj4gdm1fYXJlYV9zdHJ1Y3QgKmRzdF92bWEsCj4+Pj4g
IMKgwqDCoMKgwqAgc2V0X3B0ZXMoZHN0X3ZtYS0+dm1fbW0sIGFkZHIsIGRzdF9wdGUsIHB0ZSwg
bnIpOwo+Pj4+ICDCoCB9Cj4+Pj4gIMKgICtzdGF0aWMgaW5saW5lIHB0ZV90IF9fcHRlX2JhdGNo
X2NsZWFyX2lnbm9yZWQocHRlX3QgcHRlKQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCByZXR1cm4gcHRl
X2NsZWFyX3NvZnRfZGlydHkocHRlX21rY2xlYW4ocHRlX21rb2xkKHB0ZSkpKTsKPj4+PiArfQo+
Pj4+ICsKPj4+PiAgwqAgLyoKPj4+PiAgwqDCoCAqIERldGVjdCBhIFBURSBiYXRjaDogY29uc2Vj
dXRpdmUgKHByZXNlbnQpIFBURXMgdGhhdCBtYXAgY29uc2VjdXRpdmUKPj4+PiAgwqDCoCAqIHBh
Z2VzIG9mIHRoZSBzYW1lIGZvbGlvLgo+Pj4+ICDCoMKgICoKPj4+PiAgwqDCoCAqIEFsbCBQVEVz
IGluc2lkZSBhIFBURSBiYXRjaCBoYXZlIHRoZSBzYW1lIFBURSBiaXRzIHNldCwgZXhjbHVkaW5n
IHRoZSBQRk4uCj4+Pgo+Pj4gbml0OiBsYXN0IGNoYXIgc2hvdWxkIGJlIGEgY29tbWEgKCwpIG5v
dCBhIGZ1bGwgc3RvcCAoLikKPj4+Cj4+Pj4gKyAqIHRoZSBhY2Nlc3NlZCBiaXQsIGRpcnR5IGJp
dCBhbmQgc29mdC1kaXJ0eSBiaXQuCj4+Pj4gIMKgwqAgKi8KPj4+PiAgwqAgc3RhdGljIGlubGlu
ZSBpbnQgZm9saW9fcHRlX2JhdGNoKHN0cnVjdCBmb2xpbyAqZm9saW8sIHVuc2lnbmVkIGxvbmcg
YWRkciwKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHB0ZV90ICpzdGFydF9wdGVwLCBwdGVfdCBw
dGUsIGludCBtYXhfbnIpCj4+Pj4gIMKgIHsKPj4+PiAgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25n
IGZvbGlvX2VuZF9wZm4gPSBmb2xpb19wZm4oZm9saW8pICsgZm9saW9fbnJfcGFnZXMoZm9saW8p
Owo+Pj4+ICDCoMKgwqDCoMKgIGNvbnN0IHB0ZV90ICplbmRfcHRlcCA9IHN0YXJ0X3B0ZXAgKyBt
YXhfbnI7Cj4+Pj4gLcKgwqDCoCBwdGVfdCBleHBlY3RlZF9wdGUgPSBwdGVfbmV4dF9wZm4ocHRl
KTsKPj4+PiArwqDCoMKgIHB0ZV90IGV4cGVjdGVkX3B0ZSA9IF9fcHRlX2JhdGNoX2NsZWFyX2ln
bm9yZWQocHRlX25leHRfcGZuKHB0ZSkpOwo+Pj4+ICDCoMKgwqDCoMKgIHB0ZV90ICpwdGVwID0g
c3RhcnRfcHRlcCArIDE7Cj4+Pj4gIMKgIMKgwqDCoMKgwqAgVk1fV0FSTl9PTl9GT0xJTyghcHRl
X3ByZXNlbnQocHRlKSwgZm9saW8pOwo+Pj4+ICDCoCDCoMKgwqDCoMKgIHdoaWxlIChwdGVwICE9
IGVuZF9wdGVwKSB7Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHB0ZSA9IHB0ZXBfZ2V0KHB0ZXApOwo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBwdGUgPSBfX3B0ZV9iYXRjaF9jbGVhcl9pZ25vcmVkKHB0ZXBf
Z2V0KHB0ZXApKTsKPj4+PiAgwqAgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghcHRlX3NhbWUocHRl
LCBleHBlY3RlZF9wdGUpKQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsK
Pj4+Cj4+PiBJIHRoaW5rIHlvdSdsbCBsb3NlIGRpcnR5IGluZm9ybWF0aW9uIGluIHRoZSBjaGls
ZCBmb3IgcHJpdmF0ZSBtYXBwaW5ncz8gSWYgdGhlCj4+PiBmaXJzdCBwdGUgaW4gYSBiYXRjaCBp
cyBjbGVhbiwgYnV0IGEgc3Vic2VxdWVudCBwYWdlIGlzIGRpcnR5LCB5b3Ugd2lsbCBlbmQgdXAK
Pj4+IHNldHRpbmcgYWxsIHRoZSBwYWdlcyBpbiB0aGUgYmF0Y2ggYXMgY2xlYW4gaW4gdGhlIGNo
aWxkLiBQcmV2aW91cyBiZWhhdmlvcgo+Pj4gd291bGQgcHJlc2VydmUgZGlydHkgYml0IGZvciBw
cml2YXRlIG1hcHBpbmdzLgo+Pj4KPj4+IEluIG15IHZlcnNpb24gKHYzKSB0aGF0IGRpZCBhcmJp
dHJhcnkgYmF0Y2hpbmcsIEkgaGFkIHNvbWUgZnVuIGFuZCBnYW1lcwo+Pj4gdHJhY2tpbmcgZGly
dHksIHdyaXRlIGFuZCB1ZmZkX3dwOgo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
YXJtLWtlcm5lbC8yMDIzMTIwNDEwNTQ0MC42MTQ0OC0yLXJ5YW4ucm9iZXJ0c0Bhcm0uY29tLwo+
Pj4KPj4+IEFsc28sIEkgdGhpbmsgeW91IHdpbGwgY3VycmVudGx5IGVpdGhlciBzZXQgc29mdCBk
aXJ0eSBvbiBhbGwgb3Igbm9uZSBvZiB0aGUKPj4+IHBhZ2VzIGluIHRoZSBiYXRjaCwgZGVwZW5k
aW5nIG9uIHRoZSB2YWx1ZSBvZiB0aGUgZmlyc3QuIEkgcHJldmlvdXNseSBjb252aW5jZWQKPj4+
IG15c2VsZiB0aGF0IHRoZSBzdGF0ZSB3YXMgdW5pbXBvcnRhbnQgc28gYWx3YXlzIGNsZWFyZWQg
aXQgaW4gdGhlIGNoaWxkIHRvCj4+PiBwcm92aWRlIGNvbnNpc3RlbmN5Lgo+Pgo+PiBHb29kIHBv
aW50cyByZWdhcmRpbmcgZGlydHkgYW5kIHNvZnQtZGlydHkuIEkgd2FudGVkIHRvIGF2b2lkIHBh
c3NpbmcgZmxhZ3MgdG8KPj4gZm9saW9fcHRlX2JhdGNoKCksIGJ1dCBtYXliZSB0aGF0J3MganVz
dCB3aGF0IHdlIG5lZWQgdG8gbm90IGNoYW5nZSBiZWhhdmlvci4KPiAKPiBJIHRoaW5rIHlvdSBj
b3VsZCBub3QgYm90aGVyIHdpdGggdGhlIGVuZm9yY2VfdWZmZF93cCAtIGp1c3QgYWx3YXlzIGVu
Zm9yY2UKPiB1ZmZkLXdwLiBTbyB0aGF0J3Mgb25lIHNpbXBsaWZpY2F0aW9uIHZzIG1pbmUuIFRo
ZW4geW91IGp1c3QgbmVlZCBhbiBhbnlfZGlydHkKCkkgdGhpbmsgSSdsbCBqdXN0IGxlYXZlIHVm
ZmQtd3AgYWxvbmUgZm9yIG5vdywgY29ybmVyIGNhc2Ugd2l0aCAKZm9yay9tdW5tYXAgdGhhdCBj
YW4gYmUgb3B0aW1pemVkIGxhdGVyIG9uIHRvcCBpZiByZWFsbHkgbmVlZGVkLgoKUmVnYXJkaW5n
IHNvZnQtZGlydHkgKHdoaWNoIGlzIHNldCBhdXRvbWF0aWNhbGx5IG11Y2ggbW9yZSBvZnRlbiks
IEkgY2FuIApjZXJ0YWlubHkgaWdub3JlIHRoZSBiaXQgaWYgIXZtYV9zb2Z0X2RpcnR5X2VuYWJs
ZWQodm1hKSBbd2hpY2ggaXMgdHJ1ZSAKaW4gbW9zdCBvZiB0aGUgY2FzZXNdLiBTbyB0aGF0J3Mg
ZWFzeSB0byBoYW5kbGUuIEJ1dCBsaWtlbHksIHNvZnQtZGlydHkgCmZvciB0aGUgY2hpbGQgaXMg
Y29tcGxldGVseSB1bmV4cHJlc3NpdmUgYW5kIHNob3VsZCBhbHdheXMgYmUgY2xlYXJlZC4gCkhh
dmUgdG8gZG91YmxlIGNoZWNrIHdoYXQgdGhlIHZtZmxhZyB3aWxsIGJlIGZvciB0aGUgY2hpbGQg
cHJvY2Vzcy4KCj4gZmxhZyBmb2xsb3dpbmcgdGhlIHNhbWUgcGF0dGVybiBhcyB5b3VyIGFueV93
cml0YWJsZS4gVGhlbiBqdXN0IHNldCBkaXJ0eSBvbiB0aGUKPiB3aG9sZSBiYXRjaCBpbiB0aGUg
Y2hpbGQgaWYgYW55IHdlcmUgZGlydHkgaW4gdGhlIHBhcmVudC4KClJlZ2FyZGluZyBkaXJ0eWlu
ZywgSSdtIG5vdCAxMDAlIHN1cmUgeWV0IGlmIHdlIHNob3VsZCBqdXN0IGFsd2F5cyBkaXJ0eSAK
YWxsIHB0ZXMgaWYgYW55IGlzIGRpcnR5LCBvciBpZiB3ZSBzaG91bGQgcHJlc2VydmUgdGhlIHN0
YXRlIGZvciBwcml2YXRlIApWTUFzIGZvciBub3cuCgo+IAo+IEFsdGhvdWdoIG5vdyBJJ20gd29u
ZGVyaW5nIGlmIHRoZXJlIGlzIGEgcmFjZSBoZXJlLi4uIFdoYXQgaGFwcGVucyBpZiBhIHBhZ2Ug
aW4KPiB0aGUgcGFyZW50IGJlY29tZXMgZGlydHkgYWZ0ZXIgeW91IGhhdmUgY2hlY2tlZCBpdCBi
dXQgYmVmb3JlIHlvdSB3cml0ZSBwcm90ZWN0Cj4gaXQ/IElzbid0IHRoYXQgYWxyZWFkeSBhIHBy
b2JsZW0gd2l0aCB0aGUgY3VycmVudCBub24tYmF0Y2hlZCB2ZXJzaW9uPyBXaHkgZG8gd2UKPiBl
dmVuIHRvIHByZXNlcnZlIGRpcnR5IGluIHRoZSBjaGlsZCBmb3IgcHJpdmF0ZSBtYXBwaW5ncz8K
Ckkgc3VzcGVjdCwgYmVjYXVzZSB0aGUgcGFyZW50IGNvdWxkIHphcCB0aGUgYW5vbiBmb2xpby4g
SWYgdGhlIGZvbGlvIGlzIApjbGVhbiwgYnV0IHRoZSBQVEUgZGlydHksIEkgc3VzcGVjdCB0aGF0
IHdlIGNvdWxkIGxvc2UgZGF0YSBvZiB0aGUgY2hpbGQgCmlmIHdlIHdlcmUgdG8gZXZpY3QgdGhh
dCBjbGVhbiBmb2xpbyAoc3dhcG91dCkuCgpTbyBJIGFzc3VtZSB3ZSBzaW1wbHkgY29weSB0aGUg
ZGlydHkgUFRFIGJpdCwgc28gdGhlIHN5c3RlbSBrbm93cyB0aGF0IAp0aGF0IGZvbGlvIGlzIGFj
dHVhbGx5IGRpcnR5LCBiZWNhdXNlIG9uZSBQVEUgaXMgZGlydHkuCgpUb3VjaGluZyBvbmx5IFBU
RXMgYXZvaWRzIGhhdmluZyB0byBtZXNzIHdpdGggZm9saW8gZmxhZ3MuCgpCdXQgdGhhdCdzIGp1
c3QgcHVyZSBzcGVjdWxhdGlvbi4gRS5nLiwgZnMvcHJvYy90YXNrX21tdS5jIGRvZXMgc29tZSAK
c2xpZ2h0bHkgZGlmZmVyZW50IGFjY291bnRpbmcgaWYgYSBQVEUgaXMgZGlydHkuIEJ1dCB1c3Vh
bGx5LCBpdCBjaGVja3MgCmlmIGVpdGhlciB0aGUgUFRFIG9yIHRoZSBmb2xpb3MgaXMgZGlydHku
CgpJJ2xsIGhhdmUgdG8gZG8gc29tZSBtb3JlIGRpZ2dpbmcuCgotLSAKQ2hlZXJzLAoKRGF2aWQg
LyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
