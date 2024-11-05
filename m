Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62AAD2B920
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 12:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6YOXdjt/Nc+J6TrqZyRmH7al9nahd9gyaftI8HRny0=; b=TefD6af7urgsG2
	yvHva1fOD1Tnfl9RnJWtRa9gtk0lF8gqNB4FM5hB/j1e27arCJkgCKSBvuUZxnnap8HMXXDI+Ndkl
	p8ggEK4ygkJM6SKcNu/rIY3DkQWhSdj7HPELFDNsJXn1aXDzCwZX3DHHHcrmkmavTtbx5R6cQ3JtW
	oDaS52IbCO6eklXqkjFleZx3oON9IJl+NkpOzsGWV9TujxTwXeGQCQVSmqbptc/5fzTpZYumwqNGa
	S2tpqCpqo3BVsnX383RrI7bglK62j3hK09FF/KWpW68h0BG7Va1ra/y3amFi7DVf0ZLDf2WTLYGio
	BNZjlsOj6T0s/RnCODxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8J10-0000000H22X-1B0B;
	Tue, 05 Nov 2024 12:50:34 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Iz9-0000000H1rI-0YYi
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 12:48:40 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d47b38336so4038213f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Nov 2024 04:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730810917; x=1731415717; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JPzUqJyq9Agfg2xFr5+F7YykIu7Y2oVke0GmFsSA2w0=;
        b=vJu7lsAq58XJv/NoAxfgDXrpT6E0qG2Lc7NDOa6RsSpgTdyvq5nYNd5C1KkeTsf8pm
         LOeyvrEJM3ScL1ApOHO3LUh9OPiRLzt/w02J1M+qXUjTCfdijW2n8ZUd7cVAKpA6cpuX
         wt3XT6YGYWmNvx+64euOs2Mca1loA81YkECMHAitUOPlthUY2ljD/9e1s5NhoADx25Pl
         k1v/ihLEskWdPoyHSO3pT/h+To9iwNIn2h9c/HShT0DfrW5j3C2oktZwk5nvh2KFOUGP
         jesHlHqYpqWwaxh+Frf4CdasmdGuX7/e/VlZz5AkNiUZG7I4UJVKv8DSKBqWQ34wnkIQ
         J1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730810917; x=1731415717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JPzUqJyq9Agfg2xFr5+F7YykIu7Y2oVke0GmFsSA2w0=;
        b=ezbyJi65Kv76JzBO47RgFzqTuBPOaZYqicn/rXkaS/57EH7/juQ+W9uSIMgrK/JwJp
         dnznex+XjKgymZdZC2MGZPkNAP47RhT1/x3zeDxhCZo7Ur/sPcSrajlwbnmTwz9fv2sF
         eowkBFyRamc2ADI1Ze2G/f40CV1ExwDocJTtsPoJkG/7aDfZu/T1u9p6QWHwFrwjkA7h
         uW//Nu8dCKWpOVLiQZtIyr4xS3FqK2xIv2ZQXpg1N/dJ4rp+pPGTWHbEqFfQJ2o2f5tD
         2rmuh/BR0lgaJNJ0ywXMcLqFopPG/nPSedDw9iffsMHqKyK19BRdidZQmTBuEvMZPE0j
         e5vw==
X-Gm-Message-State: AOJu0Yw9tbK8jLrURvFrshSDdIOaGQQnF4cTFoRB0UPzfGyoed8Xalx8
	rFcNV68NIRirx/IPOdwDpp4fg9f5Kt+JcFH7Uwk+IyASFSo4ZfF5y30raEE8G4SFWOI0N0TCRyJ
	JTMI=
X-Google-Smtp-Source: AGHT+IECQtI2afC9/nV4FjpvSFo3iL4mQ4d8sginqnfT6Xw/THWJSQbtpkRmjpc+xPfmHoSY5sr+jw==
X-Received: by 2002:a5d:48ce:0:b0:37c:d001:856f with SMTP id ffacd0b85a97d-38061220ac3mr24022035f8f.56.1730810916741;
        Tue, 05 Nov 2024 04:48:36 -0800 (PST)
Received: from ?IPV6:2001:861:3380:2e20:6214:6f9b:8e4c:f723? ([2001:861:3380:2e20:6214:6f9b:8e4c:f723])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e687sm16242693f8f.84.2024.11.05.04.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 04:48:36 -0800 (PST)
Message-ID: <78cdcdc4-8087-449d-b771-e41e6295137f@rivosinc.com>
Date: Tue, 5 Nov 2024 13:48:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: cacheinfo: Use of_property_present() for
 non-boolean properties
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241104190314.270095-1-robh@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20241104190314.270095-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_044839_408666_5686D270 
X-CRM114-Status: GOOD (  12.93  )
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

CgpPbiAwNC8xMS8yMDI0IDIwOjAzLCBSb2IgSGVycmluZyAoQXJtKSB3cm90ZToKPiBUaGUgdXNl
IG9mIG9mX3Byb3BlcnR5X3JlYWRfYm9vbCgpIGZvciBub24tYm9vbGVhbiBwcm9wZXJ0aWVzIGlz
Cj4gZGVwcmVjYXRlZCBpbiBmYXZvciBvZiBvZl9wcm9wZXJ0eV9wcmVzZW50KCkgd2hlbiB0ZXN0
aW5nIGZvciBwcm9wZXJ0eQo+IHByZXNlbmNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJy
aW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2Nh
Y2hlaW5mby5jIHwgMTIgKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L2NhY2hlaW5mby5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY2FjaGVpbmZvLmMKPiBpbmRleCBiMzIw
YjFkOWFhMDEuLjAxMTUwNTFmYTFlMSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9j
YWNoZWluZm8uYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jCj4gQEAgLTEw
NSwxMSArMTA1LDExIEBAIGludCBwb3B1bGF0ZV9jYWNoZV9sZWF2ZXModW5zaWduZWQgaW50IGNw
dSkKPiAgCQlyZXR1cm4gMDsKPiAgCX0KPiAgCj4gLQlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29s
KG5wLCAiY2FjaGUtc2l6ZSIpKQo+ICsJaWYgKG9mX3Byb3BlcnR5X3ByZXNlbnQobnAsICJjYWNo
ZS1zaXplIikpCj4gIAkJY2lfbGVhZl9pbml0KHRoaXNfbGVhZisrLCBDQUNIRV9UWVBFX1VOSUZJ
RUQsIGxldmVsKTsKPiAtCWlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJpLWNhY2hlLXNp
emUiKSkKPiArCWlmIChvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLCAiaS1jYWNoZS1zaXplIikpCj4g
IAkJY2lfbGVhZl9pbml0KHRoaXNfbGVhZisrLCBDQUNIRV9UWVBFX0lOU1QsIGxldmVsKTsKPiAt
CWlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJkLWNhY2hlLXNpemUiKSkKPiArCWlmIChv
Zl9wcm9wZXJ0eV9wcmVzZW50KG5wLCAiZC1jYWNoZS1zaXplIikpCj4gIAkJY2lfbGVhZl9pbml0
KHRoaXNfbGVhZisrLCBDQUNIRV9UWVBFX0RBVEEsIGxldmVsKTsKPiAgCj4gIAlwcmV2ID0gbnA7
Cj4gQEAgLTEyMiwxMSArMTIyLDExIEBAIGludCBwb3B1bGF0ZV9jYWNoZV9sZWF2ZXModW5zaWdu
ZWQgaW50IGNwdSkKPiAgCQkJYnJlYWs7Cj4gIAkJaWYgKGxldmVsIDw9IGxldmVscykKPiAgCQkJ
YnJlYWs7Cj4gLQkJaWYgKG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImNhY2hlLXNpemUiKSkK
PiArCQlpZiAob2ZfcHJvcGVydHlfcHJlc2VudChucCwgImNhY2hlLXNpemUiKSkKPiAgCQkJY2lf
bGVhZl9pbml0KHRoaXNfbGVhZisrLCBDQUNIRV9UWVBFX1VOSUZJRUQsIGxldmVsKTsKPiAtCQlp
ZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiaS1jYWNoZS1zaXplIikpCj4gKwkJaWYgKG9m
X3Byb3BlcnR5X3ByZXNlbnQobnAsICJpLWNhY2hlLXNpemUiKSkKPiAgCQkJY2lfbGVhZl9pbml0
KHRoaXNfbGVhZisrLCBDQUNIRV9UWVBFX0lOU1QsIGxldmVsKTsKPiAtCQlpZiAob2ZfcHJvcGVy
dHlfcmVhZF9ib29sKG5wLCAiZC1jYWNoZS1zaXplIikpCj4gKwkJaWYgKG9mX3Byb3BlcnR5X3By
ZXNlbnQobnAsICJkLWNhY2hlLXNpemUiKSkKPiAgCQkJY2lfbGVhZl9pbml0KHRoaXNfbGVhZisr
LCBDQUNIRV9UWVBFX0RBVEEsIGxldmVsKTsKPiAgCQlsZXZlbHMgPSBsZXZlbDsKPiAgCX0KCgpM
b29rcyBnb29kIHRvIG1lLAoKUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KClRoYW5rcywKCkNsw6ltZW50CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
