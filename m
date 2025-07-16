Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF441C83F22
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rm06RcdlxlCPMjEQuQmncaHC1HAKKavFLTX/EOAUSKE=; b=DtabEMj7ENJDAO
	X37BvQ6IvDuc7o1PCLs2PFNOLtMebu8vyBy0WSyxlyu3oy8BtUF4QgSontHbW0abDhpwMtJEHHwlM
	a29AOILrc8hUE7++87Zq48Q6o40bTXkM0KEpMpXl+u1UhwEasJhl5dPt8Lmck+0861O2Q00vJrKv5
	PHesQXMUnHqcA1zrkpGceEZqmsZJ+XVTCFEEuXkYSlWv1YO96QagjmT/wl+dSXK9oIX831hqv9k2P
	spjWtqRZ2hnCKGbUQNOqyjOs406qprMpwJ2TzHMA0VOe7SR1AAYs76CCvEM+f2vGhbljRo4UlnrjD
	Ax0Vhv+Qdcwr4+YxZuwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubya1-00000007IrS-1fKo;
	Wed, 16 Jul 2025 09:37:37 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubyZy-00000007Iql-11S7
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 09:37:36 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a528243636so3593622f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 02:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752658652; x=1753263452; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mRIwbcS0H9zdmv+BDkzGsQ7wEXHGjYbRxt2gj93AB+0=;
        b=X9bxaIAZzlw4RpVBV7pK2mzup8rNxpLdmc3wVhDr7/2aAWUjlTPnZZ0u/vasrxwqrp
         KAVq2bC1hUuwKZrwhakwSpoBUOCEB9diiWBZwgFNQoCSKQJukMc00Zb1dU+n34a5Zdyh
         Tw8LB6gwvO5v5QP0WC9X9/np2R2I9IKi+fSfvuw39+UOf2c4tL0NLgL4C8+v1JX25cPz
         yRM6+A2+D0BM4icucB61HEt/OxLE6atX5ypbfCZEC8UVvsLbLRdrTKA8kSvSQHDUROo/
         9GedNEoGTywBsO93hBkLNwwL4FhPDZM8Fo9DsBTtJ7SqBaJsNS/HQd13p3xbblN8e6WB
         xRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752658652; x=1753263452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRIwbcS0H9zdmv+BDkzGsQ7wEXHGjYbRxt2gj93AB+0=;
        b=uBswF+DbzqvdDsiAcIzDFr1k32MDu8SDWiiDyb6Nhs59FQau7v5vmlEem3DLNSZgHr
         bZ4nmPvHYLair9WRHmsVpqgdJAloLNmQPJclA6DLkKbg29zEPX/Bbpxd9o4kLpgvd+/H
         YXl7lrbxsn/gAdnzm3NP2UovkGcOeVG+y7GyeqmoaFOJbBhlBv0suvpqcpyn5pcglO7C
         M9B7HcwCNF70CXzgKj1u60mEzu/MiXQ6Xl2CZ5FCgfZt8HluILD7PzW2qnanCedp2ju0
         ihc1X6wyfUyY9bV2R/SJwDtGyv/rDlx2vZqAUprsjBAHaiZnTTFHN2j2s1MJbsNzL++B
         ZNLg==
X-Forwarded-Encrypted: i=1; AJvYcCUT7Wi6NDKUxWSYNY0MVHBFlJjAB4sYR7c4YfCsG233aRhWPNvjSIkQa8ccKTOJSaJ/vfO0qoZHqhEFqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwN29rMuvqun+UaLI7pi8xL/LODitYGD1ExbGkEnXcOhB1Ll5j
	V1UEPD9JeRT0A45xaQAbrJoy1wKhCOegtQlgwe+dWRJKmn7/mHF4/bnUl8Nz/Iru+E0DSpnTGFl
	4xcU8znM5+A==
X-Gm-Gg: ASbGncvrXmMSpE9MPZYyokbHyeWAwgHRC2m16oOu4PuogHdCR6JssKq5cMqJQCBKyDp
	0feyyAxoD5I17pGuCOhZLBiyTwZTvZcZgPJFiccmIiCWO+SXlZzQG/0LO4rbw9qeeBn1be+Re79
	WOVzo3Wnnu6h+P7YbaCa4QFhNDdUkY+ByORcfXEz/SGhL0Ui4oK7PobLGYT9/trc2EqWswYD40l
	jZH8Ma4S9B5R8FXs1fbu9YZ2HT5gNCDB/vEW2VGtK2FQP3f8hUFEv8gSQ9vvBwt8LCo6n1WNAl9
	ca8dXPTI/srl3qkKidvLtmrwidegOdSSEQRSUFal/PDCv9hTS9a/PeNrwr3zL1XxQP7MgspgtRO
	ODAjs7vVfSeNoVz5UMvoI1j93fSC5M+1Hp8DI87oobp7Q0PZaTEq8hLNzaU5pmZ+4Vo7mVL89OO
	UK4cpgL/2L8MBecT9W2DtZ
X-Google-Smtp-Source: AGHT+IE4uVb9YKbrx3ndRNHKiFm08G4TVQtoQIPhB1Z5lx2K3LriBMWvhlHyxvUwMMKUbX/m2DA1HA==
X-Received: by 2002:a05:6000:43cc:20b0:3a5:39be:c926 with SMTP id ffacd0b85a97d-3b60dd7aab1mr1328671f8f.32.1752658651434;
        Wed, 16 Jul 2025 02:37:31 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:5da9:c53:46d0:bd62? ([2a02:1807:2a00:3400:5da9:c53:46d0:bd62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f2f28sm15619335e9.2.2025.07.16.02.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 02:37:30 -0700 (PDT)
Message-ID: <95125019-8eaa-4242-8e68-78771ce85947@hammernet.be>
Date: Wed, 16 Jul 2025 11:37:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add OrangePi RV2 board device
 tree
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 palmer@dabbelt.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
 <20250711183245.256683-3-hendrik.hamerlinck@hammernet.be>
 <20250715102534-GYA542593@gentoo>
Content-Language: en-US
From: Hendrik Hammernet <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250715102534-GYA542593@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_023734_527357_400A7B05 
X-CRM114-Status: GOOD (  13.75  )
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

SGVsbG8sCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiA3LzE1LzI1IDEyOjI1LCBZaXh1
biBMYW4gd3JvdGU6Cj4gT24gMjA6MzIgRnJpIDExIEp1bCAgICAgLCBIZW5kcmlrIEhhbWVybGlu
Y2sgd3JvdGU6Cj4KPj4gKy8qIENvcHlyaWdodCAoYykgMjAyMyBLeSwgSW5jICovCj4gQ29weXJp
Z2h0IHNob3VsZCBjb3ZlciBjdXJyZW50IHllYXIsIHdoaWNoIGlzIDIwMjUuLgo+IHdoYXQncyAi
S3kiIHN0YW5kIGZvcj8gQ2FuIHlvdSBnaXZlIGEgZnVsbCBkZXNjcmlwdGlvbiBoZXJlClJlZ2Fy
ZGluZyB0aGUgb3JpZ2luYWwgY29weXJpZ2h0OgpUaGlzIGZpbGUgd2FzIGJhc2VkIG9uIGEgdmVy
c2lvbiBmcm9tIHRoZSBLeSwgSW5jIGRvd25zdHJlYW0ga2VybmVsLCB3aGljaAppdHNlbGYgYXBw
ZWFycyB0byBiZSBhZGFwdGVkIGZyb20gZWFybGllciBTcGFjZW1pVCBzb3VyY2VzIChkYXRlZCAy
MDIzKS4KVGhlIE9yYW5nZSBQaSBSVjIgYm9hcmQsIGhvd2V2ZXIsIHdhcyBvbmx5IHJlbGVhc2Vk
IGluIDIwMjUsIHN1Z2dlc3RpbmcKdGhhdCB0aGUgS3kgdmVyc2lvbiB3YXMgbGlrZWx5IGNvcGll
ZCBhbmQgcmVuYW1lZCBmcm9tIGVhcmxpZXIgZ2VuZXJpYwpTcGFjZW1pVCBmaWxlcy4KCkluIHJl
dmlld2luZyB0aGUgS3kgZG93bnN0cmVhbSB0cmVlLCBJIGFsc28gbm90aWNlZCB0aGF0IHNldmVy
YWwgZmlsZXMgaGFkCnRoZWlyIGNvcHlyaWdodCBzdGF0ZW1lbnRzIG92ZXJ3cml0dGVuIHdpdGgg
Ikt5LCBJbmMiLCB3aGlsZSB0aGUgb3JpZ2luYWwKeWVhcnMgKGUuZy4sIDIwMjMpIHJlbWFpbmVk
IHVuY2hhbmdlZC4gVGhpcyBtYWtlcyB0aGUgcHJvdmVuYW5jZSBhIGJpdAp1bmNsZWFyLgoKU2lu
Y2UgSSd2ZSBzaWduaWZpY2FudGx5IHJld29ya2VkIHRoZSBmaWxlIGZvciB0aGUgYWN0dWFsIE9y
YW5nZSBQaSBSVjIKaGFyZHdhcmUsIEnigJlkIHByZWZlciB0byBhdHRyaWJ1dGUgaXQgdW5kZXIg
bXkgb3duIG5hbWUsIHVubGVzcyByZXRhaW5pbmcKdGhlIG9yaWdpbmFsICJLeSwgSW5jIiBpcyBy
ZXF1aXJlZC4KClBsZWFzZSBsZXQgbWUga25vdyB3aGF0IHdvdWxkIGJlIGFwcHJvcHJpYXRlIGhl
cmUuCgo+PiArCW1lbW9yeUAwIHsKPj4gKwkJZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKPj4gKwkJ
cmVnID0gPDB4MCAweDAwMDAwMDAwIDB4MCAweDgwMDAwMDAwPjsKPj4gKwl9Owo+PiArCj4+ICsJ
bWVtb3J5QDEwMDAwMDAwMCB7Cj4+ICsJCWRldmljZV90eXBlID0gIm1lbW9yeSI7Cj4+ICsJCXJl
ZyA9IDwweDEgMHgwMDAwMDAwMCAweDAgMHg4MDAwMDAwMD47Cj4+ICsJfTsKPj4gKwo+IGZvciB0
aGUgbWVtb3J5IG5vZGVzLCB0aGVyZSBhcmUgMi80LzhHQiB2YXJpYW50cyBmcm9tIHRoZSBMaW5r
IFsxXSwgYW5kCj4geW91IGNvdWxkbid0IGNvdmVyIGFsbCBvZiB0aGVtIGluIG9uZSBkdAo+Cj4g
YmVzaWRlcywgSSB0aG91Z2h0IGJvb3Rsb2FkZXIgKHUtYm9vdCkgd2lsbCBwb3B1bGF0ZSB0aGVz
ZSBpbmZvLCByaWdodD8KPiBzbyB0aGUgYWJvdmUgbm9kZXMgaXNuJ3QgcmVhbGx5IG5lY2Vzc2Fy
eQo+CllvdSdyZSBhYnNvbHV0ZWx5IHJpZ2h0LCBVLUJvb3QgZG9lcyBwb3B1bGF0ZSB0aGlzIGlu
Zm9ybWF0aW9uIGNvcnJlY3RseQphdCBydW50aW1lLiBJIHdpbGwgcmVtb3ZlIHRoZSBtZW1vcnkg
bm9kZXMgaW4gdGhlIG5leHQgdmVyc2lvbi4KCkkgYWxzbyBub3RpY2VkIHRoYXQgdGhlIGFsaWFz
ZXMgc2VjdGlvbiBpcyBtaXNzaW5nIGluIHRoaXMgdmVyc2lvbiwgd2hpY2gKbWVhbnMgdGhlIGNo
b3Nlbi5zdGRvdXQtcGF0aCA9ICJzZXJpYWwwIiByZWZlcmVuY2Ugd29u4oCZdCByZXNvbHZlIHVu
bGVzcwpzZXJpYWwwID0gJnVhcnQwOyBpcyBkZWZpbmVkLiBJIGRpZG4ndCBlbmNvdW50ZXIgaXNz
dWVzIGR1cmluZyB0ZXN0aW5nCmJlY2F1c2UgSSdtIG92ZXJyaWRpbmcgdGhlIGJvb3QgY29tbWFu
ZCBpbiBteSBCdWlsZHJvb3Qgc2V0dXAsIGJ1dCBJ4oCZbGwKYWRkIHRoZSBwcm9wZXIgYWxpYXNl
cyBub2RlIGluIHRoZSBuZXh0IHZlcnNpb24gdG8gZW5zdXJlIHVwc3RyZWFtCmNvbXBhdGliaWxp
dHkuCgpLaW5kIHJlZ2FyZHMsCgpIZW5kcmlrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
