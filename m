Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBD4CA0EE8
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 08:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hawSPYDGu+EdHLA9V5IXEAyHrr2dZ0+kllisTStERoM=; b=T5xl1WIO0vJ8Vi
	xOMxu9E/y80YXczd04i84X/o7BR7uv2U5nomEq3MRpJLWdghRB589vPcQbBVCXK22NifVZ9Kw8bYy
	ye2bzPkQfHey0jI7ZYYjImzKzdgVMS7c12Lz6zS/zXQ8QxAoiSS83gcCLKSffsOEhuU4B/GtJ1sY0
	kp6PwsGWJLkvAkEy1y8SiqVqa9vFJrFrOtcEE7jWnQHZn1pHb/y7Lsxk7nDa8KmfYAp1IPgq9wJ4p
	4EyLawSZaqaWdtxAO7NUWusGU7XBEsR7dKZ/U8Ye5LpQpOU8Nug7aUY9FHL0SHAIJ/RME7qn8sI5p
	3Opl5DYmVirOlsv/mVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynLu-0000000AbtL-2jUM;
	Wed, 17 Sep 2025 08:17:22 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynLs-0000000AbsI-0O8d
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 08:17:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45cb6428c46so74823705e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Sep 2025 01:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1758097038; x=1758701838; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1cfwZOPZzFsvlNm3ek81Eqwcg/vwsqzjRAGhBUvpRL8=;
        b=CyFuNarXutzn3b3NYImgrfwe0MuX2VX38LEkJZFr/Ib+mguwCInXsRsy/ZBWYc9qWb
         sjSoXJON6VTj0wYIEAR9PZSAgJ7Cz6tgrj0c3QrFQV+EmglOOvlfnWo4zhfPKQZKtBkB
         moX2U7+GBnvnrSF3F4Pvio5KzirBM2mMA02cod9W6FFcL3qgDE7EEwfLDK/9BaS8NIy2
         FbSgeaIOYMuzGBXswOBOlcAGtEvoeyHsxN6Ov/2/z9SLNYyv8NnIqfVh/Usj5pe20Rz/
         JA9eh0jVtUDembL6c80u/5ZO6rlvEXIFgobgFF3rljoXjjpfoUaGA7sFs6GH7dTf7HoU
         9ZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758097038; x=1758701838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1cfwZOPZzFsvlNm3ek81Eqwcg/vwsqzjRAGhBUvpRL8=;
        b=QbJQoov8layj+auREN8riPe+Z+ECMvFn/zMTAkEgnXyVbf0ZPWjkq6NxyrzeeJ30hZ
         v6RE1Oa+eNtsyEEllhEX8JZIx8Of/XnvhOwg+7QYupnbg2SHfG/N2CP9aCGicXLjy77N
         DmOLMsFHPzZkUWsS7J0aPZ+XQDT+XNfeocj4UT9ze0pwOsTeXwsQMfGFOqYD2N65Gk6a
         Ojv4FrH6j6lA6B035+4gShcfE4DwrEtIWfjGETSsnDT59PClJCqZxx82W1i8+m6PVldk
         Cpg57sWR9iPT7TExgVEtSrSZQtSaJz4XBwM9TyxiW5+XvE7QIdl/T8pa+xaWN8eU7ca9
         0f5A==
X-Forwarded-Encrypted: i=1; AJvYcCXVBYZ5qouBb0WGqQ4Nhx+QW4kzvKkO2nkE/GLGlRMfJGWygC9jhPuPbve1Kpfq59Xp2Eq54G/Zt4MkjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQpAQWdM4JWVYvgp0v+se6MOEtHySMNHvRfOAJHZqHV0e72rVW
	1fXABldoC4ePz0cczGMj7gDpsHxvMlqSN+u4ShF2+M56BWuQpCjg5Ra6BTdH/Z95u0w=
X-Gm-Gg: ASbGncuqyQyT90yg1nYttmQt1uHeQsy8f34O2AGPd2ocKK6Dv85S9qmVINnZiCP95np
	2CMtVay04gxxj0XaZYwvTPP4lAyPHvGreWH/12hYvUWdmtSeR9FZgf3CoR3hFwIEtNsjX8fRKLk
	FI6LcHiDEFiiGx1fKvQuoFfw+jXZ70B3Q+pl48Ea5ExFt+Cp85CshuUSLo4p8BPtFY2AEuimwal
	7siwLwxhre+Q6brx7lFfmaa8J+e1WrrCBSmBWvLkmAn1ANDT2/WRdxwJmsHj0/LDdQ5XLR+21FS
	946GndCgUSCc5YWuPaKBVDLA0MQDhpwAATK4xJqZW3gnWbeR27kf3BFyfC8NuEWCY4lzpxr4DHk
	yIwpdvo+beX8xl4JR03EFXPJY+Cxe1WQFt7divA3mD6z0w0k3i8kkj/2U6o+6heK6SkXcsmQyRv
	ZBSA1i6zBHZyhNXw==
X-Google-Smtp-Source: AGHT+IHQauNqpq8lY/6H7jPfKtMFBDpqtFt79W/QicqW57Kb6YWQ9jdKsOFDxKIhImInFtNC7PPBqw==
X-Received: by 2002:a05:600c:1554:b0:45d:d6fc:24f7 with SMTP id 5b1f17b1804b1-462074c55cfmr10061175e9.32.1758097037873;
        Wed, 17 Sep 2025 01:17:17 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:1b1a:e580:5909:925c? ([2a02:1807:2a00:3400:1b1a:e580:5909:925c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32081248sm37379855e9.0.2025.09.17.01.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 01:17:17 -0700 (PDT)
Message-ID: <b76520ff-f039-465c-a58d-8f0f37bd1664@hammernet.be>
Date: Wed, 17 Sep 2025 10:17:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] riscv: dts: spacemit: add UART pinctrl combinations
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250917065907.160615-1-hendrik.hamerlinck@hammernet.be>
 <F213A85E78015F1A+aMpnVc9S_ynYGDF8@LT-Guozexi>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <F213A85E78015F1A+aMpnVc9S_ynYGDF8@LT-Guozexi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_011720_257047_42217639 
X-CRM114-Status: GOOD (  20.15  )
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

SGVsbG8gVHJveSwKClRoYW5rIHlvdSBmb3IgcmV2aWV3aW5nLgoKT24gOS8xNy8yNSAwOTo0Niwg
VHJveSBNaXRjaGVsbCB3cm90ZToKPiBIaSBIZW5kcmlrLCBUaGFua3MgZm9yIHlvdXIgcGF0Y2gh
Cj4KPiBPbiBXZWQsIFNlcCAxNywgMjAyNSBhdCAwODo1OTowN0FNICswMjAwLCBIZW5kcmlrIEhh
bWVybGluY2sgd3JvdGU6Cj4+IEFkZCBVQVJUIHBpbmN0cmwgY29uZmlndXJhdGlvbnMgYmFzZWQg
b24gdGhlIFNvQyBkYXRhc2hlZXQgYW5kIHRoZQo+PiBkb3duc3RyZWFtIEJpYW5idSBMaW51eCB0
cmVlLiBUaGUgZHJpdmUgc3RyZW5ndGggdmFsdWVzIHdlcmUgdGFrZW4gZnJvbQo+PiB0aGUgZG93
bnN0cmVhbSBpbXBsZW1lbnRhdGlvbiwgd2hpY2ggdXNlcyBtZWRpdW0gZHJpdmUgc3RyZW5ndGgu
Cj4+IENUUy9SVFMgYXJlIG1vdmVkIHRvIHNlcGFyYXRlICotY3RzLXJ0cy1jZmcgc3RhdGVzIHNv
IGJvYXJkcyBjYW4gZW5hYmxlCj4+IGhhcmR3YXJlIGZsb3cgY29udHJvbCBjb25kaXRpb25hbGx5
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBIZW5kcmlrIEhhbWVybGluY2sgPGhlbmRyaWsuaGFtZXJs
aW5ja0BoYW1tZXJuZXQuYmU+Cj4+IFJldmlld2VkLWJ5OiBZaXh1biBMYW4gPGRsYW5AZ2VudG9v
Lm9yZz4KPj4gLS0tCj4+IENoYW5nZXMgaW4gdjQ6Cj4+IC0gRXhwbGljaXRseSB1c2UgMCBhcyBi
aWFzLXB1bGwtdXAgdmFsdWUKPj4KPj4gQ2hhbmdlcyBpbiB2MzoKPj4gLSBBZGRlZCAvb21pdC1p
Zi1uby1yZWYvIHRvIHBpbmN0cmwgc3RhdGVzIHRvIHJlZHVjZSBEVCBzaXplCj4+Cj4+IENoYW5n
ZXMgaW4gdjI6Cj4+IC0gU3BsaXQgY3RzL3J0cyBpbnRvIHNlcGFyYXRlIHBpbmN0cmwgY29uZmln
cyBhcyBzdWdnZXN0ZWQKPj4gLSBSZW1vdmVkIG9wdGlvbnMgZnJvbSBib2FyZCBEVFMgZmlsZXMg
dG8ga2VlcCB0aGVtIGNsZWFuZXIKPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNl
bWl0L2sxLXBpbmN0cmwuZHRzaSB8IDQzMCArKysrKysrKysrKysrKysrKystCj4+ICAxIGZpbGUg
Y2hhbmdlZCwgNDI4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLXBpbmN0cmwuZHRzaSBiL2FyY2gv
cmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtcGluY3RybC5kdHNpCj4+ICsJL29taXQtaWYtbm8t
cmVmLwo+PiArCXVhcnQyXzBfY3RzX3J0c19jZmc6IHVhcnQyLTAtY3RzLXJ0cy1jZmcgewo+PiAr
CQl1YXJ0Mi0wLXBpbnMgewo+PiArCQkJcGlubXV4ID0gPEsxX1BBRENPTkYoMjMsIDEpPiwJLyog
dWFydDJfY3RzICovCj4+ICsJCQkJIDxLMV9QQURDT05GKDI0LCAxKT47CS8qIHVhcnQyX3J0cyAq
Lwo+PiArCQkJYmlhcy1wdWxsLXVwID0gPDA+Owo+PiArCQkJZHJpdmUtc3RyZW5ndGggPSA8MzI+
Owo+PiArCQl9Owo+PiArCX07Cj4gV2UgYXJlIGN1cnJlbnRseSB1c2luZyB0aGUgODI1MCBVQVJU
IGRyaXZlciwgYnV0IGhhcmR3YXJlIGZsb3cgY29udHJvbCBkb2VzIG5vdAo+IHdvcmsgcHJvcGVy
bHkgb24gSzEuIFdlIGFyZSBjb25zaWRlcmluZyBmaXhpbmcgdGhpcyB3aGVuIHRpbWUgcGVybWl0
cy4KPgo+IFNob3VsZCB3ZSBhZGQgYSBjb21tZW50IGhlcmUgdG8gYXZvaWQgY29uZnVzaW5nIG90
aGVycyB3aG8gbWF5IHJ1biBpbnRvIHRoaXM/Cj4gSWYgc28sIEkgd2lsbCByZW1vdmUgdGhlIGNv
bW1lbnQgb25jZSB0aGUgaXNzdWUgaGFzIGJlZW4gZml4ZWQuCk5vdCBzdXJlIGlmIEnigJltIG1p
c3Npbmcgc29tZXRoaW5nLCBidXQgaGFyZHdhcmUgZmxvdyBjb250cm9sIHNlZW1zIHRvIHdvcmsK
d2l0aCB0aGUgYDgyNTBfb2ZgIGRyaXZlcj8KCk9uIGJvdGggZW5kcyBJIGNvbmZpZ3VyZWQgdGhl
IHBvcnRzIHdpdGg6CmBzdHR5IC1GIC9kZXYvdHR5UzEgMTE1MjAwIGNydHNjdHMgLWl4b24gLWl4
b2ZmIHJhdyAtZWNob2AKCldpdGggdGhpcyBzZXR1cCwgZGF0YSBzZW50IHdpdGggZWNobyBvbmx5
IGdvZXMgdGhyb3VnaCB3aGVuIHRoZSBwZWVyIGlzCmFjdHVhbGx5IHJlYWRpbmcgb24gdGhlIG90
aGVyIHNpZGUsIHdoaWNoIGxvb2tzIGxpa2UgUlRTL0NUUyBpcwpmdW5jdGlvbmluZyBjb3JyZWN0
bHkuCgo+Cj4gQW55d2F5LAo+Cj4gUmV2aWV3ZWQtYnk6IFRyb3kgTWl0Y2hlbGwgPHRyb3kubWl0
Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPgo+PiArCj4+ICsJL29taXQtaWYtbm8tcmVmLwo+PiAr
CXVhcnQzXzBfY2ZnOiB1YXJ0My0wLWNmZyB7Cj4+ICsJCXVhcnQzLTAtcGlucyB7Cj4+ICsJCQlw
aW5tdXggPSA8SzFfUEFEQ09ORig4MSwgMik+LAkvKiB1YXJ0M190eGQgKi8KPj4gKwkJCQkgPEsx
X1BBRENPTkYoODIsIDIpPjsJLyogdWFydDNfcnhkICovCj4+ICsJCQliaWFzLXB1bGwtdXAgPSA8
MD47Cj4+ICsJCQlkcml2ZS1zdHJlbmd0aCA9IDwzMj47Cj4+ICsJCX07Cj4+ICsJfTsKPj4gKwou
Li4KPj4gLS0gCj4+IDIuNDMuMAo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4gbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CktpbmQgcmVnYXJkcywKSGVuZHJpawoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
