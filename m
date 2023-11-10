Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96C5C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 18:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GkcPJiSFKYH94Q5+Oh+HW4ouaOIT2LTnzjuwJMd5b3c=; b=WLGooSlR8sy2U5
	i1e1vhWS2/t1fBFQgS0CvPbp+BPwXMR1khnH3uc8/XeLXIO8XYbKYOF54NqhDgTJzRTuPWTmyj4Yd
	dmF0ce/tbjSQO8ajnpcxDlnaDFVBJOYKzUf4p7cQo0eq3J9It1ZBtJaYEmMQ76W8x1coE6bA6ywgz
	FQknjwVbWgBe+FgfQLn2R3SJ0kUDwAZ9EOKZi9bS8Rm4Apj3cab9bivNU4iiiU0ewxcTFcES0UlCY
	TRetksAMh0iRNcsauYYdYLA0pYSzp9SL3A6Vpy28eAoSej5VSjg2ov4Y0XZiQ9LlhPRKomcwxvACA
	7gggkdKDb7l6dEiiMLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1VqE-009BZD-0S;
	Fri, 10 Nov 2023 18:02:50 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Vq9-009BYJ-34
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 18:02:47 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4084e49a5e5so17985685e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Nov 2023 10:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699639361; x=1700244161; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNLq0qmMJNvfKP5O63+BxM6jCmlb62b2gPfwV2vURLs=;
        b=UKsP/wp9JVN8Xc1wdBnxdwazJ3usOIh+KmW3THHwGbZb0Djw3jKytT0DIyP1snfhIj
         6iSnNSSNe6LWUcnUpaV0f+jNTWV80pfNBXioCsJeVpq4bGRI+xMJc9SjrRnewv5u4dwR
         j5QVhDE7KCl2FAC+ajcWTq7LLFfITvQ0qCn8NnrA3RHIt3bFkU4MAYQSeikaHR9jMZKY
         7AwTj0uSYVEtpbyKzOch2lmzAok3DQ47sLcnxnotzi+sA8wZ1Y0JKjB/931bKlMQk2ll
         9Qd9SC6QJzuS2sNKOHyULujboWbn5vGZtL5ja+F7I8XHjptpS95futWIjvbKia/uLzHf
         xWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699639361; x=1700244161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QNLq0qmMJNvfKP5O63+BxM6jCmlb62b2gPfwV2vURLs=;
        b=p6H5MP8Eir67ZlEnFJnxGtB7pwBNNI+fHvA/3SDe9gcGfJezKdiqoTKUXYjUNFeQ+N
         mm060YJSsLGyyJ0PHLycgvvROxo+W4T8OdXFIp0g99D8IeAYcSMMgD8wAXnXs74ZrLYn
         KtpPdDcVRlIWK8PCV+nnmRtOLAuf/ms20QG6CXz/ohj5056k2/XVV5oK7mcm8cPar/JN
         P6BVlXrPn+Rd9wqAqs/XdyFGRx8hAF2xg0Nn9M+BHt7o6xK/7RcuBB6NXTXs/9AysMYQ
         0s8XZ9Rkmkf43akUuOg8PxeTP/MaOLKRY6kmb1/1b8rNmF00DSgVkLOZtD5MWXY7YFX1
         tXAA==
X-Gm-Message-State: AOJu0YyTp4gJzW6KG77Hw+LM275fjmMcgFbYtYiK9M466pgvajFQiHv0
	3ANhc0sT1R0nHhRe2nsnEJzbmg==
X-Google-Smtp-Source: AGHT+IFkgENQd+VCrNMqWIay+eSx1NNSFAAtgRFGrcbVElc6SAlYS3F/4RutTpyTNZbw0mULeuI4uw==
X-Received: by 2002:a5d:4d46:0:b0:32f:89e5:ef60 with SMTP id a6-20020a5d4d46000000b0032f89e5ef60mr37775wru.11.1699639361285;
        Fri, 10 Nov 2023 10:02:41 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id y9-20020adfee09000000b0031f82743e25sm2350227wrn.67.2023.11.10.10.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 10:02:40 -0800 (PST)
Message-ID: <bbd2ee8d-4349-4752-859a-02fb0252d496@linaro.org>
Date: Fri, 10 Nov 2023 19:02:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] clocksource: Add JH7110 timer driver
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Walker Chen <walker.chen@starfivetech.com>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>
References: <20231019053501.46899-1-xingyu.wu@starfivetech.com>
 <20231019053501.46899-3-xingyu.wu@starfivetech.com>
 <3f76f965-7c7b-109e-2ee0-3033e332e84b@linaro.org>
 <bb819333-52d3-49fc-9bb9-1a227bd5ca8f@starfivetech.com>
 <d0e70434-e273-4799-c5ec-bbee1b3f5cc7@linaro.org>
 <540136d4-6f8f-49a6-80ff-cc621f2f462b@starfivetech.com>
 <65c38717-3e0c-46d3-a124-29cae48f1a2e@linaro.org>
 <72ad5029-42b2-481a-887f-8f6079d8859b@starfivetech.com>
 <a8f0011c-5689-4071-b5e0-90bd6b7c66bc@linaro.org>
 <b402eb4d-a770-4988-8274-8a2544362229@starfivetech.com>
 <1dd3d765-c583-4db9-a0aa-303bfcf871db@linaro.org>
 <7c2e9b70-201c-45f8-9871-a823cc2ded16@starfivetech.com>
 <a37be8f7-64a4-4cec-8692-28ad92a02b00@sifive.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <a37be8f7-64a4-4cec-8692-28ad92a02b00@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_100245_987253_1A051E61 
X-CRM114-Status: GOOD (  23.15  )
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

CkhpIFNhbXVlbCwKCk9uIDEwLzExLzIwMjMgMTg6NDAsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+
IE9uIDIwMjMtMTEtMDggMTE6NTEgUE0sIFhpbmd5dSBXdSB3cm90ZToKPj4gT24gMjAyMy8xMS84
IDE3OjEwLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPj4+IE9uIDA4LzExLzIwMjMgMDQ6NDUsIFhp
bmd5dSBXdSB3cm90ZToKPj4+PiBPbiAyMDIzLzExLzIgMjI6MjksIERhbmllbCBMZXpjYW5vIHdy
b3RlOgo+Pj4KPj4+IFsgLi4uIF0KPj4+Cj4+Pj4gVGhhbmtzLiBUaGUgcmlzY3YtdGltZXIgaGFz
IGEgY2xvY2tzb3VyY2Ugd2l0aCBhIGhpZ2hlciByYXRpbmcgYnV0IGEKPj4+PiBjbG9ja2V2ZW50
IHdpdGggbG93ZXIgcmF0aW5nWzFdIHRoYW4gamg3MTEwLXRpbWVyLiBJIHRlc3RlZCB0aGUKPj4+
PiBqaDcxMTAtdGltZXIgYXMgY2xvY2tldmVudCBhbmQgZmxhZ2dlZCBhcyBvbmUgc2hvdCwgd2hp
Y2ggY291bGQgZG8gc29tZQo+Pj4+IG9mIHRoZSB3b3JrcyBpbnN0ZWFkIG9mIHJpc2N2LXRpbWVy
LiBBbmQgdGhlIGN1cnJlbnRfY2xvY2tldmVudCBjaGFuZ2VkCj4+Pj4gdG8gamg3MTEwLXRpbWVy
Lgo+Pj4+Cj4+Pj4gQmVjYXVzZSB0aGUgamg3MTEwLXRpbWVyIHdvcmtzIGFzIGNsb2Nrc291cmNl
IHdpdGggbG93ZXIgcmF0aW5nIGFuZCBvbmx5Cj4+Pj4gd2lsbCBiZSB1c2VkIGFzIGdsb2JhbCB0
aW1lciBhdCBDUFUgaWRsZSB0aW1lLiBJcyBpdCBuZWNlc3NhcnkgdG8gYmUKPj4+PiByZWdpc3Rl
cmVkIGFzIGNsb2Nrc291cmNlPyBJZiBub3QsIHNob3VsZCBpdCBqdXN0IGJlIHJlZ2lzdGVyZWQg
YXMKPj4+PiBjbG9ja2V2ZW50Pwo+Pj4KPj4+IFllcywgeW91IGNhbiByZWdpc3RlciB0aGUgY2xv
Y2tldmVudCB3aXRob3V0IHRoZSBjbG9ja3NvdXJjZS4KPj4+Cj4+PiBZb3UgbWVudGlvbmVkIHRo
ZSBKSDcxMTAgaGFzIGEgYmV0dGVyIHJhdGluZyB0aGFuIHRoZSBDUFUgYXJjaGl0ZWN0ZWQKPj4+
IHRpbWVycy4gVGhlIHJhdGluZyBpcyB0aGVyZSB0byAiY2hvb3NlIiB0aGUgYmVzdCB0aW1lciwg
c28gaXQgaXMgdXAgdG8gdGhlCj4+PiBhdXRob3Igb2YgdGhlIGRyaXZlciBjaGVjayBhZ2FpbnN0
IHdoaWNoIHRpbWVycyBpdCBjb21wYXJlcyBvbiB0aGUKPj4+IHBsYXRmb3JtLgo+Pj4KPj4+IFVz
dWFsbHksIENQVSB0aW1lcnMgYXJlIHRoZSBiZXN0Lgo+Pj4KPj4+IEl0IGlzIHN1cnByaXNpbmcg
dGhlIHRpbWVyLXJpc2N2IGhhcyBhIHNvIGxvdyByYXRpbmcuIFlvdSBtYXkgZG91YmxlIGNoZWNr
Cj4+PiBpZiBqaDcxMTAgaXMgcmVhbGx5IGJldHRlci4gSWYgaXQgaXMgdGhlIGNhc2UsIHRoZW4g
aW1wbGVtZW50aW5nIGEKPj4+IGNsb2NrZXZlbnQgcGVyIGNwdSB3b3VsZCBtYWtlIG1vcmUgc2Vu
c2UsIG90aGVyd2lzZSBvbmUgY2xvY2tldmVudCBhcyBhCj4+PiBnbG9iYWwgdGltZXIgaXMgZW5v
dWdoLgo+IAo+IFRoZSB0aW1lci1yaXNjdiBjbG9ja2V2ZW50IGhhcyBhIGxvdyByYXRpbmcgYmVj
YXVzZSBpdCByZXF1aXJlcyBhIGNhbGwgdG8KPiBmaXJtd2FyZSB0byBzZXQgdGhlIHRpbWVyLCBh
cyB3ZWxsIGFzIGEgdHJhcCB0byBmaXJtd2FyZSB0byBoYW5kbGUgdGhlCj4gaW50ZXJydXB0LCB3
aGljaCBib3RoIGFkZCBvdmVyaGVhZC4gSW1wbGVtZW50YXRpb25zIHdoaWNoIHN1cHBvcnQgdGhl
IFNzdGMKPiBleHRlbnNpb25bMV0gZG8gbm90IHJlcXVpcmUgZmlybXdhcmUgYXNzaXN0YW5jZSB0
byBpbXBsZW1lbnQgdGhlIGNsb2NrZXZlbnQsIHNvCj4gaW4gdGhhdCBjYXNlIHdlIHJlZ2lzdGVy
IHRoZSBjbG9ja2V2ZW50IHdpdGggYSBoaWdoZXIgcmF0aW5nLgo+IAo+IFsxXTogaHR0cHM6Ly9n
aXRodWIuY29tL3Jpc2N2L3Jpc2N2LXRpbWUtY29tcGFyZQoKVGhhbmtzIGZvciB0aGUgcG9pbnRl
ciBhbmQgdGhlIGNsYXJpZmljYXRpb24uCgo+Pj4gVW51c2VkIGNsb2Nrc291cmNlLCBjbG9ja2V2
ZW50cyBzaG91bGQgYmUgc3RvcHBlZCBpbiBjYXNlIHRoZSBmaXJtd2FyZSBsZXQKPj4+IHRoZW0g
aW4gYSB1bmRldGVybWluZWQgc3RhdGUuCj4+Cj4+IFRoZSBpbnRlcnJ1cHRzIG9mIGpoNzExMC10
aW1lciBlYWNoIGNoYW5uZWwgYXJlIGdsb2JhbCBpbnRlcnJ1cHRzIGxpa2UKPj4gU1BJKFNoYXJl
ZCBQZXJpcGhlcmFsIEludGVycnVwdCkgbm90IFBQSSAoUHJpdmF0ZSBQZXJpcGhlcmFsIEludGVy
cnVwdCkuIFRoZXkKPj4gYXJlIHVwIHRvIFBMSUMgdG8gc2VsZWN0IHdoaWNoIGNvcmUgdG8gcmVz
cG9uZCB0by4gU28gaXQgaXMgaGFyZCB0byBpbXBsZW1lbnQKPj4gYSBjbG9ja2V2ZW50IHBlciBj
cHUgY29yZS4gSSB0ZXN0ZWQgdGhpcyB3aXRoIHJlcXVlc3RfcGVyY3B1X2lycSgpIGFuZCBpdAo+
PiBmYWlsZWQuCj4gCj4gWW91IGNhbm5vdCB1c2UgcmVxdWVzdF9wZXJjcHVfaXJxKCksIGJ1dCB0
aGUgZHJpdmVyIHNob3VsZCBiZSBhYmxlIHRvIHNldCB0aGUKPiBhZmZpbml0eSBvZiBlYWNoIElS
USB0byBhIHNlcGFyYXRlIENQVS4KCkFic29sdXRlbHkuIEFuZCBnaXZlbiB0aGUgYmFkIHJhdGlu
ZyBvZiB0aGUgbG9jYWwgdGltZXJzLCBpdCBtYXkgYmUgCndvcnRoIHRvIGltcGxlbWVudCB0aGlz
IGRyaXZlciBpbiBhIHBlciBDUFUgKGFmZmluaXR5IHNldCkgYmFzaXMuCgpBdCB0aGUgZmlyc3Qg
Z2xhbmNlLCB0aGUgYXJtX2dsb2JhbF90aW1lciBjYW4gYmUgdXNlZCBhcyBhbiBleGFtcGxlLgoK
Tm90ZSBpbiB0aGlzIGNhc2UsIHlvdSBtYXkgd2FudCB0byBkb3VibGUgY2hlY2sgd2hhdCBkb2Vz
IHdpdGggYW4gaWRsZSAKc3RhdGUgd2l0aCBhIGxvY2FsIHRpbWVyIHN0b3AgZmxhZyBhbmQgdGhp
cyB0aW1lciB3aGljaCBpcyBhbHdheXMgb24uCgoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3Jn
Lz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xs
b3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJv
b2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8v
d3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
