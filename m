Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA808CAC59A
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Sep 2025 18:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUci+l4XY9CzQt8/yVj45z7UPBYHo+wqXfxmUbNRU9w=; b=iWNIQv6UcdRK0z
	1KQvNiWdrI5s6SWW8G32wq30Gx67O09oX+Im5+snVum875remQjBTmXk1IhwfLSkkQ4qL510+1r0p
	ZEufvuAKyVgzJWF9uxHNbAYd8YcOwOuaxvq2TkRWt4P3I0IaH6Yz0omW0AkMMID35xMDKjWA5dcwk
	InN7W0BK89vQHYnpWucEWpj9DjkIkK13oWOHK16ZMItOOc96lXqiAPncUgLK+DyZsi510KWV8RU2e
	otJiWTyHZkQtcSicUMk/Va33RNVl1Cmb6mDgg3b43F88EQ7U936wkTRfXviQnoBv+uMlTgUMI/UAb
	p1AZ34qLR29BoMO0jUOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0PGz-000000083Vo-1wJG;
	Sun, 21 Sep 2025 18:58:57 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0PGw-000000083VM-1n8Q
	for linux-riscv@lists.infradead.org;
	Sun, 21 Sep 2025 18:58:56 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-4256ef4eeebso10148945ab.2
        for <linux-riscv@lists.infradead.org>; Sun, 21 Sep 2025 11:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758481132; x=1759085932; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3yODI1opb0jOanIEDnISA0XED16oP9HRbOj2aYoSYs=;
        b=AYr7MplYF1U8xfGx5Ef3YkSKwATeoFkFU5MpmKqjw4xtYc1FtzK4HisnJ5Giht1QUu
         CfofQjrXUhoaQ5qrZZkkR91zupzRmMxwIsB7kTtwuRQ8uyLprirNLQgUzBzCR8CRejhm
         GGRKD2gPFz5/XJCmdcIDaT6Tq0M4oNGqplGYJFoJ+n3UC4NWdlLtSw/sJ9PcHjyZOXwP
         vwvZUKMVkiPG4Z8eNsKs0Z/pFpP+/HzbKPOhLiiSMQ4vCRJwKPqcT5rMGVIBvaeX1umX
         5t077v2RCnD9CXHiIqje7ZfzUVjZ4eL2RjMGCDbc7ODDfqpOGnClf1SPEOHFgPmCyhO/
         TMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758481132; x=1759085932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3yODI1opb0jOanIEDnISA0XED16oP9HRbOj2aYoSYs=;
        b=Ef9uTmx69E/Sac1SbRi2UiZ0nhJLoftMKn3Env2Igjamve2NXMdlw0P3RQClLK/5Bl
         IhlBY5W/3hORx2JoylggNXaPS55Raoew0pF9eCuCLC9qBSYEawSceeo20edGQdIgE5JM
         2Sng2148RAMJPhohMUwK56Kfa09XOWNySZ0HU+PHLjUN01i6w1BACuzb14SV+O0IytMf
         UbuMtVH9dw1gl+yBEpoUiU1h0o0WMU7ScQVuT1E/hBfLBgdKxcylhmofmQmnw3L6ax8t
         oAAMx+E1+P7HTRdG5W2F9hI0eLaOmSLljTkSFc/JL/SMvrSFMUgAs/+SyDyt9DmTqoQw
         YieQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYualB+dAZqsVmNIAMKsPEGXp0bozBfS2ZXQUKmkVu0J5eO6BwKg6fnJ2tazbZ0pXR8ChRX9dH+ji53Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsxb5mEj2m5GStm4RQ1HW4L/CEiestkjBrMN2ymW2pFKnYs465
	N4dtOmPub/o2mYNLCq4gx39i/wDo3FfHAAROMpTu0qpfUwiUU96dYrs8YLNdxfWRQ1E=
X-Gm-Gg: ASbGncuK6gMOqjOqkSDblve4Ia9kQ+wRm9cusCHUM6d+IiKYHvK1JV7UDRXU/9eljWN
	zLBKDknJNiCs43uIxtgKzPLNVjunPWEPb2o8+hsnBwnG2FhFCLtKOPlcylI+ACTnn9GqeXyvdRI
	/S0IYPV8LICCFsDa0i+9TmCg7MLfIXltfP92ZTKPgTgC4JTJFtMZ3G7d+bZqit3VBgRR/opinsU
	pPAosZEgmEKtx+zJu+/gtzhX0UPKKph20aMMtiYrg/HHz6FzDA4if6bjgIMMSSjX66Rv16kU+wj
	ovw2GAcy1gTV1YmmC1xLRd1kJOajLt26P5Pt5BqL3JoBXx/v9up7HadU3zmg8MqwAOxVYd4dUea
	PdsUAM+no5tUJvKR8Q+PzZjh206MjtqhPQpKE7IjR0GHv5mOlvMqmr5gwVnWg4O1ahwqlcPE=
X-Google-Smtp-Source: AGHT+IEFYJsSo8XIdBpCssdirvu4z8vm7oDZUP42OyCCbdIOLRYBgINTidn4zPRPHizJvfN5lbHIOQ==
X-Received: by 2002:a92:ca09:0:b0:424:ed48:9acd with SMTP id e9e14a558f8ab-424ed489bb8mr86349525ab.27.1758481132441;
        Sun, 21 Sep 2025 11:58:52 -0700 (PDT)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244a36aa66sm49663255ab.8.2025.09.21.11.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 11:58:52 -0700 (PDT)
Message-ID: <84c77e62-93f7-4a3e-8a86-7f653076bdcd@riscstar.com>
Date: Sun, 21 Sep 2025 13:58:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
To: Vivian Wang <wangruikang@iscas.ac.cn>, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250919155914.935608-1-elder@riscstar.com>
 <20250919155914.935608-3-elder@riscstar.com>
 <a7070f3f-8857-4834-9e9e-02068637075c@iscas.ac.cn>
 <3c9aaa62-f685-47f7-a21c-00f51550f185@riscstar.com>
 <411ade91-3fb5-40a3-baca-e6b03c5783ae@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <411ade91-3fb5-40a3-baca-e6b03c5783ae@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_115854_698195_61EE3BAE 
X-CRM114-Status: GOOD (  17.44  )
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

T24gOS8yMS8yNSAxOjUxIFBNLCBWaXZpYW4gV2FuZyB3cm90ZToKPiAKPiBPbiA5LzIwLzI1IDIz
OjU5LCBBbGV4IEVsZGVyIHdyb3RlOgo+PiBPbiA5LzE5LzI1IDEwOjUyIFBNLCBWaXZpYW4gV2Fu
ZyB3cm90ZToKPj4+Cj4+PiBbLi4uXQo+Pj4KPj4+ICtzdGF0aWMgdm9pZCBrMV9zcGlfcmVhZF93
b3JkKHN0cnVjdCBrMV9zcGlfZHJpdmVyX2RhdGEgKmRydl9kYXRhKQo+Pj4gK3sKPj4+ICvCoMKg
wqAgc3RydWN0IGsxX3NwaV9pbyAqcnggPSAmZHJ2X2RhdGEtPnJ4Owo+Pj4gK8KgwqDCoCB1MzIg
Ynl0ZXMgPSBkcnZfZGF0YS0+Ynl0ZXM7Cj4+PiArwqDCoMKgIHUzMiB2YWw7Cj4+PiArCj4+PiAr
wqDCoMKgIHZhbCA9IHJlYWRsKGRydl9kYXRhLT5iYXNlICsgU1NQX0RBVEFSKTsKPj4+ICvCoMKg
wqAgcngtPnJlc2lkIC09IGJ5dGVzOwo+Pj4gKwo+Pj4gK8KgwqDCoCBpZiAoIXJ4LT5idWYpCj4+
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuO8KgwqDCoCAvKiBOdWxsIHJlYWRlcjogZGlzY2FyZCB0
aGUgZGF0YSAqLwo+Pj4gKwo+Pj4gK8KgwqDCoCBpZiAoYnl0ZXMgPT0gMSkKPj4+ICvCoMKgwqDC
oMKgwqDCoCAqKHU4ICopcngtPmJ1ZiA9IHZhbDsKPj4+ICvCoMKgwqAgZWxzZSBpZiAoYnl0ZXMg
PT0gMSkKPj4+Cj4+PiBUeXBvPyBlbHNlIGlmIChieXRlcyA9PSAyKQo+Pgo+PiBXb3cuwqAgWWVz
IHRoYXQgaXMgYW4gZXJyb3IgdGhhdCBJJ2xsIGNvcnJlY3QuCj4+Cj4+Pj4gK8KgwqDCoMKgwqDC
oMKgICoodTE2ICopcngtPmJ1ZiA9IHZhbDsKPj4+PiArwqDCoMKgIGVsc2UKPj4+PiArwqDCoMKg
wqDCoMKgwqAgKih1MzIgKilyeC0+YnVmID0gdmFsOwo+Pj4KPj4+IE1heWJlCj4+Pgo+Pj4gIMKg
wqDCoMKgZWxzZSBpZiAoYnl0ZXMgPT0gNCkKPj4+ICDCoMKgwqDCoMKgwqDCoCAqKHUzMiAqKXJ4
LT5idWYgPSB2YWw7Cj4+PiAgwqDCoMKgwqBlbHNlCj4+PiAgwqDCoMKgwqDCoMKgwqAgV0FSTl9P
Tl9PTkNFKDEpOwo+Pgo+PiBUaGUgdmFsdWUgb2YgYnl0ZXMgd2lsbCBiZSAxLCAyLCBvciA0LCB3
aGljaCB3ZSBjYW4gdGVsbAo+PiBieSBpbnNwZWN0aW9uLsKgIEF0IG9uZSB0aW1lIEkgaGFkIGEg
c3dpdGNoIHN0YXRlbWVudCB3aXRoCj4+IGEgZGVmYXVsdCwgYnV0IEkgZGVjaWRlZCB0byBsZWF2
ZSBvdXQgdGhlIGRlZmF1bHQsIHdoaWNoCj4+IHdvbid0IGhhcHBlbi4KPj4KPj4+IEp1c3QgdG8g
bWFrZSB0aGUgcGF0dGVybiBjb25zaXN0ZW50PyBTYW1lIGZvciBrMV9zcGlfd3JpdGVfd29yZC4K
Pj4KPj4gQ29uc2lzdGVudCB3aXRoIHdoYXQ/Cj4+Cj4gSSB3YXMganVzdCB0aGlua2luZyBpdCB3
b3VsZCBiZSBjbGVhcmVyIGlmIHRoZSBjb2RlIHN0YXRlcyBjbGVhcmx5Ogo+IAo+ICAgICAgMSAt
PiB1OAo+ICAgICAgMiAtPiB1MTYKPiAgICAgIDQgLT4gdTMyCj4gICAgICBhbnl0aGluZyBlbHNl
IC0+IHNob3VsZG4ndCBoYXBwZW4KPiAKPiBBcyBpcywgaXQgd2Fzbid0IG9idmlvdXMgdG8gbWUg
dGhhdCB3ZSdyZSBqdXN0IGhhbmRsaW5nIDQgYXMgdTMyLiBNYXliZQo+IHdlJ3JlIGp1c3QgY2Fw
cGluZyBpdCBhdCB1MzIsIGFuZCA4IGlzIGFsc28gaGFuZGxlZC4KPiAKPiBXZWxsLCBtYXliZSBJ
J20ganVzdCBub3QgZmFtaWxpYXIgd2l0aCBTUEkgc3R1ZmYsIGFuZCB3b3JkIHNpemUgYWJvdmUg
NAo+IGRvZXNuJ3QgbWFrZSBzZW5zZSBhbnl3YXkuCgpVbmRlcnN0b29kLiAgSSBvbmx5IGtub3cg
aXQgYmVjYXVzZSBJIGNoZWNrZWQuICBBbmQgSSBkbyB3YW50IG15CmNvZGUgdG8gbWUgdW5kZXJz
dGFuZGFibGUsIHNvIEknbGwgYWRkIGEgY29tbWVudCBhcyB5b3Ugc3VnZ2VzdApiZWxvdy4KClRo
YW5rIHlvdS4KCgkJCQkJLUFsZXgKCj4gCj4gSXQgY291bGQgYWxzbyBiZSBhIGNvbW1lbnQKPiAK
PiAgICAgIGVsc2UgLyogNCAqLwo+IAo+IEp1c3QgYSBzdWdnZXN0aW9uLCBubyBzdHJvbmcgcHJl
ZmVyZW5jZSBmcm9tIG1lLgo+IAo+IFZpdmlhbiAiZHJhbWZvcmV2ZXIiIFdhbmcKPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
