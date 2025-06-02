Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AB4C5B549
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 07:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1q9Qtcq439i8MgAuezaFSKfJkpNuPtjzdAyJtFDJmw=; b=DNoJRIFo+ERxpI
	2qoT3fBJ/8PzxQww0Is0dV1oK9KaZmGcbT3yxTjKMV847Xs3pW5LW2B/z6UWk+4y59dr537AIykix
	MDlIJPeMPYW8IGCGSmd/UgjXzXhrf6P6bmR41RtLJH6eOj7yTw/bmEXMTUlgZk22Z7zbFLJ4FwwQn
	wkFdptGw9f3rE9tiJ9ojueDbyCGtJiSj/2m/YjFNDSodrl9Nwe9sSq6rkTzznIoFw6mwLwxePWuyj
	/tyhKWLr1nV9DsHZio52Iyi67Z8zZhtc2qLUIh02EcdKHVxLi1Vj/wiDsP71pJTiumXh1hsTTQa0P
	r2/55Z+58i8MsIb0JgUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLzjN-00000006vAk-1Zye;
	Mon, 02 Jun 2025 07:37:13 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLzjL-00000006vAN-2J9p
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 07:37:12 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-450df5d7b9fso12008895e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 00:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748849830; x=1749454630; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=owj0mSUC9XrWQS9ZIjU7UCMTuXH27a1AjFrPEffsoSQ=;
        b=pGiHGSC99Mh1mLO5lUkgkLadFrpqZZ58PfCWAl2tgXtDLt9Ke4jEmnMDWG/CdUyMx9
         WD10QWIpoXjrfg3lbm1+BBo3XNfuzGLEm6sWl79lF0nPqfYfLa37u3Rxo6gS4pK14D9K
         SQ8/i4Pj0OMkwmenS12EpOFvrVWdCrbPJtfxoHzAw5K1/skY/ktpO38ujGmb3122maAK
         fPl7OJqd1ihFXzBvQv2sEBA/SBjtkf9XEBSKmu6VCWwLOYWJJ6MiAtOuxedI9kxd6fgn
         gZZxrkS7Gp2homF3KbgNNpk7zdCcVU6azHWwqEioX1GYoEVAs02Uic/M/ZnhZ+9HlnUO
         cjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748849830; x=1749454630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=owj0mSUC9XrWQS9ZIjU7UCMTuXH27a1AjFrPEffsoSQ=;
        b=noGaQ2X3xOYVH5TB2SqDC0w/gYZMgBMUdjcjRBr8oYC/nLIVb1W1RzvySvrJajrZGy
         1bkTmUcLue0XuvOk7FdadURElBNKSK0ZzGPB5Nk7TaWHKbP5kcy1QYvV+3rkLCwb06GT
         lNr3k5qb2+XU9XVAI3sYMr/wLIyYFrETZqdUN1QPEdCey9b4JgBs3/teXlcgoX+OOJZC
         ZvnwXnyL2KBHxTu3uKSqjh/LH/ds7WXWnohyaClmE4VRgACFzZAa5suDB3zoqAfXvRBx
         lxQUhZ/ga+h2aPn1P/BO6ob1HWSj4HZvSoUgt0Moti1FeZPQ6ks+MGDxlHxT6gyDBvNV
         swuw==
X-Forwarded-Encrypted: i=1; AJvYcCXn1TFJS1krQGNaoc0mHJIWlhmZMOBN2djcOCrCCWHg4XsW8ipY1a7jjlVtLD1nN1+EZLQbmbGZYFoPhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeSm2UKilffMpbgFmfiPnspR7SSC7R8f/JFPyE/vk/RpwBcoC4
	gx1m9uFopy/7WPMkFxwPhoS5J9MitaKm6ocC+MhSjqXYe4YE+IPhW2jsYgmT+6ztVS0=
X-Gm-Gg: ASbGncvsyH8t2oayfG8FdcQ3p2jFkiyOlbqhPRsGIe2wmwNEoTvlLBV8Cstl0nho36C
	fQe08KoI8Xv15XqCEkKDGIX4s1X+A+oTTD3pY9VNVZ9IG8KeeX++hpkAOa+nf4FYODKNTshjdZO
	qqZBbYnJsINhE/B09owRoASTf7+AwTrd1r0MGrKsBwxRjHLw0JrCGV6NCnh5UEmFRMZyOFFrK3R
	dHrDAgc3pYV0NbD7mnFrzSAswzJ+uIbqV3Bb2gF5iMRu6jXvMmaGsH+58gexWpGu4S0V9cUjIAp
	OLX1bedZ40uF+gLBDlptUZUxzByKGz2ClzPDJ0j1EYVeYoBGrOepzyLBqX8IWP+R28LhtqWISlv
	Tzlcl/Rhtf+ew/qBVRoqd
X-Google-Smtp-Source: AGHT+IFepfbgL5FL5fc7F67zCMeGhfU6MSqbq8WhZXJbSylhitW/eqXVBzS3q1dD54TfD0UHJbodmQ==
X-Received: by 2002:a05:600c:3555:b0:450:cabc:a6c6 with SMTP id 5b1f17b1804b1-450d6bbb899mr114080925e9.15.1748849829678;
        Mon, 02 Jun 2025 00:37:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8012af3sm109895745e9.35.2025.06.02.00.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 00:37:08 -0700 (PDT)
Message-ID: <cea8cdf2-4b1e-4628-a5df-249adf4387b5@rivosinc.com>
Date: Mon, 2 Jun 2025 09:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: uaccess: do not do misaligned accesses in
 get/put_user()
To: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20250530205658.624195-1-cleger@rivosinc.com>
 <20250530205658.624195-3-cleger@rivosinc.com>
 <718fb1d7-9f0c-4637-abe8-5a34305c3ae2@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <718fb1d7-9f0c-4637-abe8-5a34305c3ae2@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_003711_589519_4A892680 
X-CRM114-Status: GOOD (  21.02  )
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

CgpPbiAzMS8wNS8yMDI1IDE0OjM1LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gT24gNS8zMC8y
NSAyMjo1NiwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBEb2luZyBtaXNhbGlnbmVkIGFjY2Vz
cyB0byB1c2Vyc3BhY2UgbWVtb3J5IHdvdWxkIG1ha2UgYSB0cmFwIG9uCj4+IHBsYXRmb3JtIHdo
ZXJlIGl0IGlzIGVtdWxhdGVkLiBMYXRlc3QgZml4ZXMgcmVtb3ZlZCB0aGUga2VybmVsCj4+IGNh
cGFiaWxpdHkgdG8gZG8gdW5hbGlnbmVkIGFjY2Vzc2VzIHRvIHVzZXJzcGFjZSBtZW1vcnkgc2Fm
ZWx5IHNpbmNlCj4+IGludGVycnVwdHMgYXJlIGtlcHQgZGlzYWJsZWQgYXQgYWxsIHRpbWUgZHVy
aW5nIHRoYXQuIFRodXMgZG9pbmcgc28KPj4gd291bGQgY3Jhc2ggdGhlIGtlcm5lbC4KPj4KPj4g
U3VjaCBiZWhhdmlvciB3YXMgZGV0ZWN0ZWQgd2l0aCBHRVRfVU5BTElHTl9DVEwoKSB0aGF0IHdh
cyBkb2luZwo+PiBhIHB1dF91c2VyKCkgd2l0aCBhbiB1bnNpZ25lZCBsb25nKiBhZGRyZXNzIHRo
YXQgc2hvdWxkIGhhdmUgYmVlbiBhbgo+PiB1bnNpZ25lZCBpbnQqLiBSZWVuYWJsaW5nIGtlcm5l
bCBtaXNhbGlnbmVkIGFjY2VzcyBlbXVsYXRpb24gaXMgYSBiaXQKPj4gcmlza3kgYW5kIGl0IHdv
dWxkIGFsc28gZGVncmFkZSBwZXJmb3JtYW5jZXMuIFJhdGhlciB0aGFuIGRvaW5nIHRoYXQsCj4+
IHdlIHdpbGwgdHJ5IHRvIGF2b2lkIGFueSBtaXNhbGlnbmVkIGFjY2Vzc2VkIGJ5IHVzaW5nIGNv
cHlfZnJvbS90b191c2VyKCkKPj4gd2hpY2ggZG9lcyBub3QgZG8gYW55IG1pc2FsaWduZWQgYWNj
ZXNzZXMuIFRoaXMgY2FuIGJlIGRvbmUgb25seSBmb3IKPj4gIUNPTkZJR19IQVZFX0VGRklDSUVO
VF9VTkFMSUdORURfQUNDRVNTIGFuZCB0aHVzIGFsbG93cyB0byBvbmx5IGdlbmVyYXRlCj4+IGEg
Yml0IG1vcmUgY29kZSBmb3IgdGhpcyBjb25maWcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+IMKgIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgMjggKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlLwo+PiBhc20vdWFjY2Vzcy5oCj4+IGluZGV4IDA0NmRlN2NlZDA5Yy4uYjU0
MmMwNWYzOTRmIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3Mu
aAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+PiBAQCAtMTY5LDgg
KzE2OSwyMSBAQCBkbyB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiDCoCDCoCAjZW5kaWYgLyogQ09ORklHXzY0QklUICov
Cj4+IMKgICt1bnNpZ25lZCBsb25nIF9fbXVzdF9jaGVjayBfX2FzbV9jb3B5X3RvX3VzZXIodm9p
ZCBfX3VzZXIgKnRvLAo+PiArwqDCoMKgIGNvbnN0IHZvaWQgKmZyb20sIHVuc2lnbmVkIGxvbmcg
bik7Cj4+ICt1bnNpZ25lZCBsb25nIF9fbXVzdF9jaGVjayBfX2FzbV9jb3B5X2Zyb21fdXNlcih2
b2lkICp0bywKPj4gK8KgwqDCoCBjb25zdCB2b2lkIF9fdXNlciAqZnJvbSwgdW5zaWduZWQgbG9u
ZyBuKTsKPj4gKwo+PiDCoCAjZGVmaW5lIF9fZ2V0X3VzZXJfbm9jaGVjayh4LCBfX2d1X3B0ciwg
bGFiZWwpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+IMKgIGRvIHvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKg
wqAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNT
KSkKPj4ge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFJ
U19BTElHTkVEKCh1aW50cHRyX3QpX19ndV9wdHIsIHNpemVvZigqX19ndV9wdHIpKSkKPj4ge8Kg
wqDCoMKgwqDCoMKgIFwKPiAKPiAKPiBOaXQ6IEkgd291bGQgdXNlICYmIGluc3RlYWQgb2YgMiBp
ZnMuCj4gCj4gCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChfX2FzbV9jb3B5X2Zyb21f
dXNlcigmKHgpLCBfX2d1X3B0ciwKPj4gc2l6ZW9mKCpfX2d1X3B0cikpKcKgwqDCoCBcCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBsYWJlbDvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBicmVhazvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+IAo+IAo+IEhlcmUgSSB3
b3VsZCByZW1vdmUgdGhlIGVsc2UKCkhpIEFsZXgsCgpUaGUgImVsc2UiIGlzIG5lZWRlZCB0byBi
cmVhayBmcm9tIHRoZSBvdXRlciBkby93aGlsZSBsb29wIG9yIGl0IHdpbGwgZ28KdGhvdWdoIHRo
ZSBuZXh0IHN3aXRjaCBjYXNlIChhbmQgaXQgd2lsbCBjcmFzaCBkdWUgdG8gbWlzYWxpZ25lZCBh
Y2Nlc3NlcykuCgo+IAo+IAo+PiArwqDCoMKgwqDCoMKgwqAgfcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgIH3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiDCoMKgwqDCoMKgIHN3
aXRjaCAoc2l6ZW9mKCpfX2d1X3B0cikpIHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
XAo+PiDCoMKgwqDCoMKgIGNhc2UgMTrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgX19nZXRfdXNlcl9h
c20oImxiIiwgKHgpLCBfX2d1X3B0ciwgbGFiZWwpO8KgwqDCoCBcCj4+IEBAIC0yOTcsNiArMzEw
LDE1IEBAIGRvIHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBcCj4+IMKgIMKgICNkZWZpbmUgX19wdXRfdXNlcl9ub2NoZWNrKHgs
IF9fZ3VfcHRyLCBsYWJlbCnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gwqAgZG8ge8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwKPj4gK8KgwqDCoCBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJ
R05FRF9BQ0NFU1MpKQo+PiB7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqDCoMKg
wqDCoCBpZiAoIUlTX0FMSUdORUQoKHVpbnRwdHJfdClfX2d1X3B0ciwgc2l6ZW9mKCpfX2d1X3B0
cikpKQo+PiB7wqDCoMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNp
Z25lZCBsb25nIHZhbCA9ICh1bnNpZ25lZCBsb25nKSh4KTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXAo+IAo+IAo+IEhlcmUgaXQgc2VtcyBsaWtlIF9faW50dHlwZSgqKF9fZ3VfcHRy
KSkgaXMgbW9yZSBhY2N1cmF0ZSB0aGFuIHVuc2lnbmVkCj4gbG9uZywgZXZlbiB0aG91Z2ggSSB0
aGluayB1bnNpZ25lZCBsb25nIHdvcmtzIGZpbmUgdG9vLgoKV2Fzbid0IGF3YXJlIG9mIF9faW50
dHlwZSwgYnV0IGl0IHNvdW5kcyBnb29kLgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChfX2FzbV9jb3B5X3RvX3VzZXIoX19ndV9wdHIsICYo
dmFsKSwKPj4gc2l6ZW9mKCpfX2d1X3B0cikpKcKgwqDCoCBcCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZ290byBsYWJlbDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgwqDCoMKgwqAgfcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgIH3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiDCoMKg
wqDCoMKgIHN3aXRjaCAoc2l6ZW9mKCpfX2d1X3B0cikpIHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXAo+PiDCoMKgwqDCoMKgIGNhc2UgMTrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgX19w
dXRfdXNlcl9hc20oInNiIiwgKHgpLCBfX2d1X3B0ciwgbGFiZWwpO8KgwqDCoCBcCj4+IEBAIC0z
ODUsMTIgKzQwNyw2IEBAIGVycl9sYWJlbDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLUVGQVVMVDvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+IMKgIH0pCj4+IMKgIC0K
Pj4gLXVuc2lnbmVkIGxvbmcgX19tdXN0X2NoZWNrIF9fYXNtX2NvcHlfdG9fdXNlcih2b2lkIF9f
dXNlciAqdG8sCj4+IC3CoMKgwqAgY29uc3Qgdm9pZCAqZnJvbSwgdW5zaWduZWQgbG9uZyBuKTsK
Pj4gLXVuc2lnbmVkIGxvbmcgX19tdXN0X2NoZWNrIF9fYXNtX2NvcHlfZnJvbV91c2VyKHZvaWQg
KnRvLAo+PiAtwqDCoMKgIGNvbnN0IHZvaWQgX191c2VyICpmcm9tLCB1bnNpZ25lZCBsb25nIG4p
Owo+PiAtCj4+IMKgIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZwo+PiDCoCByYXdfY29weV9m
cm9tX3VzZXIodm9pZCAqdG8sIGNvbnN0IHZvaWQgX191c2VyICpmcm9tLCB1bnNpZ25lZCBsb25n
IG4pCj4+IMKgIHsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
