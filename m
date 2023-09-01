Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3133CA0FEC
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 18:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i36aVYUg3AeOyms8RrRMkT28qiNSa0+jWjBrH7Kbrcs=; b=DCdTyIjc87f2eY
	z0K3xx4PR5ZbyjwOyguBufsAJo8/gV8qPZdUuTpID5wtq9Jlzau2JsR1bqAC6rK3Q6b0D11NsakiX
	xWWfk4xdLVbFubRF3wP0RrN88/a6J0htvnCExFFD8d230bWcONjEvj1iYjwZLoWvwXMvwh+Khhupi
	Y0YIQ9A89V3mBDezwA0MWZtVgmVKZ8pycubNCg06C6PNlckK94DLVXz2mEOmfpUocQWU8euaolhwM
	RqUWQNuoJ7k4sIM/h7HM0n2bhBrZ1kIW7RrfgviG4R7xsEZ+qlN+0XjOKstwrDnFYf4084b/fr1pq
	buKMB/QHv7N9Ffu4T9qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc93L-000IEp-08;
	Fri, 01 Sep 2023 18:39:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc93I-000IE5-0j
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 18:39:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40037db2fe7so22994535e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 11:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1693593566; x=1694198366; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bA5Lm6a1t+KFAs7vnfL5/17M6lm4KSTTxqyCI/pc5BY=;
        b=HUOyh33gggeQ+UGz6WT9FobK31v094l+t2V6+QJPaDMsOPfJO4aY1Mn+NHyBMHrqx2
         X0lb6ovdnSbaEbzoOOrhOB2DVKQnUm8l+8cP8JpwBVpNNxcU6XcXzeHO7dlcuPDGurck
         vsaSK7YY6cMLjIMl5pfQT5BpYouyX06otBss03SxOaHI7GZx6gOVIX+vB3T4lC9n0bmv
         wX4AFImV5koXkDc+2NtPMg6+/78x/cihOXLiYzhAViFtqQwfQX1usPArJfFlX3lcuA6g
         TDUj2vPix3BPn56bSbXtw0uPBFmDaBYxYktNfC8mS2welQBcbRAjfDY4gQV29JqyPw85
         c4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693593566; x=1694198366;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bA5Lm6a1t+KFAs7vnfL5/17M6lm4KSTTxqyCI/pc5BY=;
        b=MX/6LuLJsawzTLYnVRFT24J2MuyP95L3F1Gwpodg9XNNj33Wk8ygKXqMYfhrYo3It/
         lJh2tHSAd3hUnBqqmnVrRULrbRkgJBuRNoznF1RD2OQdP2IsEWC7cpf0nMP5YQBpi7gE
         yEopM8WMIab+XQKGao854rNRhigMHI2LSNZ0/sdjp+E+3PXpVPK0cu4lehl0wDG5hynd
         6DKBMBZPHZ/VbhRp1mI4kZ7PWIzorqYJXQ0waTOJ/P1i8lxCfHqP8G+NseRtoL4iTaTe
         T/7L9ZZF3YtK2Uie1UQWZ4YXtdAS9P4k4h4Et7o7VzXY7LVNE+JJr8LaHvYwEjplS9pf
         8F8w==
X-Gm-Message-State: AOJu0Yya8/F6aMiYnVQncnfZ34lhwBxg/4aAc/PKJsgKGOtBPte7xAJg
	QGOTe7qqEs7M8ARiXWJqYYgAPg==
X-Google-Smtp-Source: AGHT+IHwt+wcmiHzIzpBrobUBa991WScHeOvwtCAq4Ysh3WkCDFvhnNCS5xE0Y9TRcLz8axynzkOjA==
X-Received: by 2002:a7b:c8ca:0:b0:401:b204:3b95 with SMTP id f10-20020a7bc8ca000000b00401b2043b95mr2441626wml.15.1693593566116;
        Fri, 01 Sep 2023 11:39:26 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id l8-20020a05600c1d0800b003fef6881350sm5840720wms.25.2023.09.01.11.39.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Sep 2023 11:39:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Drop unused properties
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230901-affected-wanting-ab517791a870@spud>
Date: Fri, 1 Sep 2023 19:39:14 +0100
Cc: William Qiu <william.qiu@starfivetech.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-mmc@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh+dt@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Message-Id: <C9C76D81-7244-4549-97E2-83CE10050A74@jrtc27.com>
References: <20230830031846.127957-1-william.qiu@starfivetech.com>
 <20230830031846.127957-2-william.qiu@starfivetech.com>
 <20230830-commence-trickery-40eaa193cb15@wendy>
 <b375b88c-0d9c-30a9-21f6-283083cf3880@linaro.org>
 <20230830-procedure-frostbite-56c751f7c276@wendy>
 <efab6f52-4d7f-ea3c-0fc3-4e3ad03c14c7@starfivetech.com>
 <20230901-remold-sublease-a1ddb1fc6348@spud>
 <9EF26965-10E5-4BCA-AC5E-93C5AA55A0DF@jrtc27.com>
 <20230901-affected-wanting-ab517791a870@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3731.600.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_113928_296279_408AEA4B 
X-CRM114-Status: GOOD (  25.61  )
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

T24gMSBTZXAgMjAyMywgYXQgMTg6NDMsIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gCj4gT24gRnJpLCBTZXAgMDEsIDIwMjMgYXQgMDY6MjA6MzhQTSArMDEwMCwgSmVz
c2ljYSBDbGFya2Ugd3JvdGU6Cj4+IE9uIDEgU2VwIDIwMjMsIGF0IDE2OjQyLCBDb25vciBEb29s
ZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4gCj4+PiBPbiBGcmksIFNlcCAwMSwgMjAy
MyBhdCAxMDozMzoxM0FNICswODAwLCBXaWxsaWFtIFFpdSB3cm90ZToKPj4+PiAKPj4+PiAKPj4+
PiBPbiAyMDIzLzgvMzAgMTY6MzQsIENvbm9yIERvb2xleSB3cm90ZToKPj4+Pj4gT24gV2VkLCBB
dWcgMzAsIDIwMjMgYXQgMDk6Mjk6MjBBTSArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90
ZToKPj4+Pj4+IE9uIDMwLzA4LzIwMjMgMDg6NTAsIENvbm9yIERvb2xleSB3cm90ZToKPj4+Pj4+
PiBPbiBXZWQsIEF1ZyAzMCwgMjAyMyBhdCAxMToxODo0NEFNICswODAwLCBXaWxsaWFtIFFpdSB3
cm90ZToKPj4+Pj4+Pj4gRHVlIHRvIHRoZSBjaGFuZ2Ugb2YgdHVuaW5nIGltcGxlbWVudGF0aW9u
LCBpdCdzIG5vIGxvbmdlciBuZWNlc3NhcnkgdG8KPj4+Pj4+Pj4gdXNlIHRoZSAic3RhcmZpdmUs
c3lzcmVnIiBwcm9wZXJ0eSBpbiBkdHMsIHNvIGRyb3AgdGhlIHJlbGV2YW50Cj4+Pj4+Pj4+IGRl
c2NyaXB0aW9uIGluIGR0LWJpbmRpbmdzIGhlcmUuCj4+Pj4+Pj4gCj4+Pj4+Pj4gSG93IGRvZXMg
Y2hhbmdpbmcgeW91ciBzb2Z0d2FyZSBpbXBsYW50YXRpb24gaW52YWxpZGF0ZSBhIGRlc2NyaXB0
aW9uIG9mCj4+Pj4+Pj4gdGhlIGhhcmR3YXJlPwo+Pj4+Pj4+IAo+Pj4+Pj4gCj4+Pj4+PiBXaGlj
aCBpcyBraW5kIG9mIHByb29mIHRoYXQgdGhpcyBzeXNjb24gd2FzIGp1c3QgdG8gc3Vic3RpdHV0
ZQo+Pj4+Pj4gaW5jb21wbGV0ZSBoYXJkd2FyZSBkZXNjcmlwdGlvbiAoZS5nLiBtaXNzaW5nIGNs
b2NrcyBhbmQgcGh5cykuIFdlCj4+Pj4+PiBzaG91bGQgaGF2ZSByZWplY3RlZCBpdC4gSnVzdCBs
aWtlIHdlIHNob3VsZCByZWplY3QgdGhlbSBpbiB0aGUgZnV0dXJlLgo+Pj4+PiAKPj4+Pj4gOnMg
SSBkdW5ubyB3aGF0IHRvIGRvIHdpdGggdGhpcy4uLiBJJ20gaW5jbGluZWQgdG8gc2F5IG5vdCB0
byByZW1vdmUgaXQKPj4+Pj4gZnJvbSB0aGUgYmluZGluZyBvciBkdHMgYXQgYWxsICYgb25seSBj
aGFuZ2UgdGhlIHNvZnR3YXJlLgo+Pj4+PiAKPj4+Pj4+IFRoZXJlIGFyZSBqdXN0IGZldyBjYXNl
cyB3aGVyZSBzeXNjb24gaXMgcmVhc29uYWJsZS4gQWxsIG90aGVycyBpcyBqdXN0Cj4+Pj4+PiBs
YXppbmVzcy4gSXQncyBub3Qgb25seSBzdGFyZml2ZXRlY2gsIG9mIGNvdXJzZS4gU2V2ZXJhbCBv
dGhlcgo+Pj4+Pj4gY29udHJpYnV0b3JzIGRvIHRoZSBzYW1lLgo+Pj4+PiAKPj4+Pj4gSSdtIG5v
dCBzdXJlIGlmIGxhemluZXNzIGlzIGZhaXIsIGxhY2sgb2YgdW5kZXJzdGFuZGluZyBpcyB1c3Vh
bGx5IG1vcmUKPj4+Pj4gbGlrZWx5Lgo+Pj4+IAo+Pj4+IEZvciB0aGlzLCBJIHRlbmQgdG8ga2Vl
cCBpdCBpbiBiaW5kaW5nLCBidXQgcmVtb3ZlIGl0IGZyb20gcmVxdWlyZWQuIEJlY2F1c2UKPj4+
PiB3ZSBvbmx5IG1vZGlmeSB0aGUgdHVuaW5nIGltcGxlbWVudGF0aW9uLCBpdCBkb2Vzbid0IG1l
YW4gdGhhdCB0aGlzIHByb3BlcnR5Cj4+Pj4gbmVlZCB0byBiZSByZW1vdmVkLCBpdCdzIGp1c3Qg
bm8gbG9uZ2VyIGJlIHRoZSByZXF1aXJlZCBvbmUuCj4+PiAKPj4+IFBsZWFzZSBvbmx5IHJlbW92
ZSBpdCBmcm9tIHJlcXVpcmVkIGlmIHRoZSBjdXJyZW50IGRyaXZlciBkb2Vzbid0IGJyZWFrCj4+
PiBpZiB0aGUgcmVnbWFwIGlzIHJlbW92ZWQuCj4+IAo+PiBFaXRoZXIgd2F5IHBsZWFzZSBtYWtl
IHN1cmUgdGhlIGRvY3VtZW50YXRpb24gY2xlYXJseSBzdGF0ZXMg4oCcbmV2ZXIgdXNlCj4+IHRo
aXMsIGlmIHlvdeKAmXJlIHVzaW5nIGl0IHlvdeKAmXJlIGRvaW5nIGl0IHdyb25nLCB0aGlzIG9u
bHkgZXhpc3RzCj4+IGJlY2F1c2UgaXQgd2FzIHdyb25nbHkgdXNlZCBpbiB0aGUgcGFzdOKAnS4g
T3RoZXJ3aXNlIHBlb3BsZSB3cml0aW5nCj4+IGRyaXZlcnMgZm9yIG90aGVyIE9TZXMgd2lsbCBw
cm9iYWJseSB1c2UgaXQgdG9vIHRoaW5raW5nIHRoZXkgbmVlZCB0by4KPiAKPiBNYXliZSB3ZSBz
aG91bGQganVzdCBkZWxldGUgaXQgaWYgdGhlIGltcGFjdCBpcyBnb2luZyB0byBiZSBuZWdsaWdp
YmxlLAo+IHNvdW5kcyBsaWtlIHlvdSdyZSBub3QgdXNpbmcgaXQgaW4gRnJlZUJTRCwgd2hpY2gg
d2FzIHBhcnQgb2Ygd2hhdCBJIHdhcwo+IHdvcnJpZWQgYWJvdXQuIEd1ZXNzIGl0IGRlcGVuZHMg
b24gd2hhdCBFbWlsICYgdGhlIGRpc3RybyBoZWFkcyB0aGluay4KCkZyZWVCU0QgZG9lc27igJl0
IGhhdmUgU3RhckZpdmUgZHJpdmVycyB5ZXQ7IEkgZG9u4oCZdCBoYXZlIHRpbWUgdG8gd3JpdGUK
dGhlbSwgYW5kIGEgY29tbXVuaXR5IG1lbWJlciBoYXMgdGFrZW4gaXQgdXBvbiB0aGVtc2VsdmVz
IGFzIGEgaG9iYnkKYnV0IGlzIHJhdGhlciBpbmV4cGVyaWVuY2VkIGFuZCBoYXMgYmVlbiBzdHJ1
Z2dsaW5nIGZvciBtb250aHMuIE9wZW5CU0QKaGFzIGRyaXZlcnMsIGluY2x1ZGluZyBhIG1vZGlm
aWVkIGR3bW1jLCBidXQgZG9lc27igJl0IHVzZSB0aGlzIHByb3BlcnR5CihpbiBmYWN0IGl0cyBk
cml2ZXIgZG9lc27igJl0IHVzZSB0aGUgY29tcGF0aWJsZSBvdGhlciB0aGFuIHRvIHByb2JlIHRo
ZQpnZW5lcmljIGRyaXZlcikuIEkgZG9u4oCZdCB0aGluayBhbnlvbmUgZWxzZSBoYXMgYSBzZXJp
b3VzIHBvcnQ7IEhhaWt14oCZcwp0aGUgY2xvc2VzdCBidXQgYWxzbyBoYXMgbm8gU3RhckZpdmUg
c3VwcG9ydC4KCkplc3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
