Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE06C197BF
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 00:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q41loBA9PTgPzeqhpoRS9+lD5cDueMvO6zRA71sVlsw=; b=eWUBuprUcraCmZ
	zT9cmPoFsrLZ4c2U+sV1omN3VQCi43GVn+Eo5Ee7YyXtibCWGskeO5dzhclEfKyM07apML8kUHzPb
	NB4LY+uSDHNbWCPDdK8Xdoy6JRW35oCzX8TgWArgwfZIK9qraGoeZXkUT0rwo+9tbzMLargBrAVy0
	mdajJNDdXPlbmbSSXQznmT7bfIbjIIkrJQvTK3etmL6N2Wo80UbtRWjgqSXhUGRy9wW0D1aCSYubf
	j22mB9M6kaTFJoV6UfYyYB5SVcF/FCPyAfu2VRk9dzHaLEjtQpYwqkLdkJTQBMh0cAZMyhGlHKk2B
	jBiv1RiNFVmdX5dVbY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnoEc-00000009H1Q-0rkq;
	Fri, 28 Feb 2025 00:28:10 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnoEZ-00000009Gz9-0l7A
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 00:28:08 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6e893a8d2c3so7079016d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 16:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740702485; x=1741307285; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a9MGkH7t3nRTRnc4pXiJCICsI8ph23jIAM1ENCvMIuI=;
        b=XkN33iQB9UBU3t5yfW2maDzjCvmqml9h6qN7dHh8daDhmB4Z+p/yHHp70NV0ZzxtTg
         nWRarI4lg9FHbsjqijsc4yuZd3gjI8TE1R77JXCa6ENPgbQKeUEBgbnniRFAwxgTwsG8
         wApHpcsZ80ZKGwdQyNF+9nCQ66fHpxgwsHM/hnjNIXmQtOYzVDIQSGFCiDWMFQHFMKgA
         paYuUdUIIYWWWQficgrWjOFqJAqS4U4fwDmTQp7OZyMYynWD1HmKGET0jJOPQoMqscvX
         S11Rvp3VIJwEvTcZUrR058IShXc17nwbMTDOct1H5mw/nWdaKj96q8g7uiIkDPg0Jukp
         C+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740702485; x=1741307285;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9MGkH7t3nRTRnc4pXiJCICsI8ph23jIAM1ENCvMIuI=;
        b=ddPfELowerXbDVwnZpXIysV8XJAkkUuMwUQ4jwvtNKDtPhSVLJhyZbtEkPjKzRAtcV
         4bmeNOta8+hP8lJVCKjrdVtD0hOVr0L6cuDHId7EL7ClyJWLnKwWEA4NoxAAJGzVVOhn
         3noBSqkIlQ3e2yDiZY89tJgzTXpYJCcChLM3LQNn5zsxgTdqH9Xx7oWvjnMYuBbKhfS2
         FdVZIyLltT/uDpa7GGMxTk7d0w9BoxAkxJn8Z+nCQHn1DscVnA/QAAQQEy20BK6afYw7
         cHngxu3GvCoPhDF7BpnuVLpxCr2NgOU7SclPxBq/CkXm3DXhlD8iAzZsqqPRcIYrTLX8
         1rUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAWif/GeYSEaP7nh5bEIU/8sbT6gMBXobLxWcqdml4ykoCthcJ1XimTYtlbcCP17Hl/zBSR30VQTZnhg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnXnxhbf8t5JLfmDDm/SYAVY5uK+12rr/5SZK73kWMfKzej5mt
	DMuEXUHWN6gpwBrt3ZWSMR97CvwHsTrra+4H/17PUXga3K7JVwzg
X-Gm-Gg: ASbGnctVIJlmVqU4NE6a4HwjO78FB9bosvzPhoVieot9Q31PqiKdY7cHVEEMXqQ+TWT
	SMfLuetb2B3TUDkCekpM3DBg9B3nPvnTstFl1vg8v2FTs151z21s2vZWdJw9KMr3xElni+JuKRQ
	PBwgG5yEXE4U7FuCT9GBLhsx/y5ZIWvNXct1n+7hLRjYNQKcMpRNbU+b11Wp5r2TE5RcGPndJuO
	4Wocu+04yuEN6u7+EELxYzXFWpL7pVO3PlkD1I0pieoqMdvJM5HbSkx98hcNIsmEDzFlbjo8Pt+
	sA==
X-Google-Smtp-Source: AGHT+IFUPO2RW2JsYQqQUr6pL0sTdbw5IaL0xieXgH4JRQXakfoILurMP/9rER/IyNOwxRjJIl9ByA==
X-Received: by 2002:ad4:5c64:0:b0:6e8:9a55:824f with SMTP id 6a1803df08f44-6e8a0ccd0bbmr19941486d6.6.1740702485066;
        Thu, 27 Feb 2025 16:28:05 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e897634d7fsm15808146d6.3.2025.02.27.16.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 16:28:04 -0800 (PST)
Date: Fri, 28 Feb 2025 08:27:42 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/8] riscv: sophgo: Add pinctrl support for SG2042
Message-ID: <n2srdxjhpivvzolavm6hj65xybrn3qwmvq6locrgpz65aeiomu@yicfi6qltjir>
References: <20250211051801.470800-1-inochiama@gmail.com>
 <CACRpkdYfZ8izsBJaKUd__jXGHnDBU9Tha=2kozjzHssoppgY5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdYfZ8izsBJaKUd__jXGHnDBU9Tha=2kozjzHssoppgY5w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_162807_225843_D9A94038 
X-CRM114-Status: GOOD (  16.60  )
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

T24gRnJpLCBGZWIgMjgsIDIwMjUgYXQgMTI6MDA6MzRBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBUdWUsIEZlYiAxMSwgMjAyNSBhdCA2OjE44oCvQU0gSW5vY2hpIEFtYW90byA8
aW5vY2hpYW1hQGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4gPiBTRzIwNDIgaGFzIGEgc2ltcGxlIHBp
bmN0cmwgZGV2aWNlIGZvciBhbGwgY29uZmlndXJhYmxlIHBpbnMuCj4gPiBJdCBzdXBwb3J0cyBz
ZXR0aW5nIHB1bGwgdXAvZG93biwgZHJpdmUgc3RyZW5ndGggYW5kIGlucHV0IHNjaG1pdHQKPiA+
IHRyaWdnZXIuCj4gPgo+ID4gQWRkIHN1cHBvcnQgZm9yIFNHMjA0MiBhbmQgU0cyMDQ0IHBpbmN0
cmwgZGV2aWNlLgo+ICguLi4pCj4gPiBJbm9jaGkgQW1hb3RvICg4KToKPiA+ICAgcGluY3RybDog
c29waGdvOiBhdm9pZCB0byBtb2RpZnkgdW50b3VjaGVkIGJpdCB3aGVuIHNldHRpbmcgY3YxODAw
Cj4gPiAgICAgcGluY29uZgo+ID4gICBwaW5jdHJsOiBzb3BoZ286IGludHJvZHVjZSBnZW5lcmlj
IGRhdGEgc3RydWN0dXJlIGZvciBjdjE4eHggcGluY3RybAo+ID4gICAgIGRyaXZlcgo+ID4gICBw
aW5jdHJsOiBzb3BoZ286IGdlbmVyYWxpemUgc2hhcmVhYmxlIGNvZGUgb2YgY3YxOHh4IHBpbmN0
cmwgZHJpdmVyCj4gPiAgIHBpbmN0cmw6IHNvcGhnbzogaW50cm9kdWNlIGdlbmVyaWMgcHJvYmUg
ZnVuY3Rpb24KPiA+ICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IEFkZCBwaW5jdHJsIGZvciBTb3Bo
Z28gU0cyMDQyIHNlcmllcyBTb0MKPiA+ICAgcGluY3RybDogc29waGdvOiBhZGQgc3VwcG9ydCBm
b3IgU0cyMDQyIFNvQwo+ID4gICBwaW5jdHJsOiBzb3BoZ286IGFkZCBzdXBwb3J0IGZvciBTRzIw
NDQgU29DCj4gCj4gSSBhcHBsaWVkIHRoZXNlIHBhdGNoZXMgMS03IHRvIHRoZSBwaW5jdHJsIHRy
ZWUgYW5kIGNyZWF0ZWQgYW4gaW1tdXRhYmxlCj4gYnJhbmNoOgo+IGh0dHBzOi8vd2ViLmdpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9saW51c3cvbGludXgtcGluY3RybC5n
aXQvbG9nLz9oPWliLXNvcGhnbwo+IAo+ID4gICByaXNjdjogZHRzOiBzb3BoZ286IHNnMjA0Mjog
YWRkIHBpbmN0cmwgc3VwcG9ydAo+IAo+IEFwcGx5IHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L1Nv
QyB0cmVlLgo+IAo+IElmIGl0IGlzIHJlcXVpcmVkLCB0aGF0IHRyZWUgY2FuIHB1bGwgaW4gbXkg
aW1tdXRhYmxlIGJyYW5jaCwgd2hpY2gKPiBpcyBiYXNlZCBvbiB2Ni4xNC1yYzEuCj4gCj4gWW91
cnMsCj4gTGludXMgV2FsbGVpagoKVGhhbmtzLCBJIHdpbGwgdGFrZSBjYXJlIG9mIHRoZSBkZXZp
Y2UgdHJlZS4KClJlZ2FyZHMsCklub2NoaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
