Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A8FC36010
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 21:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=enIS2UwVpKOX8sLokl0GSqQemDicIzqjg29ToxAFD+M=; b=Q5Q2eq0wPIk5Xa
	Hlm2jilceX7rjHKAhtw7rmKdWrEIZwS8iGkMOwQaZMUYiBPygQJKJWof1xxhoh0dkGBkod9n2+Lc+
	Ij5m5OXzqXvclI+Sv6pMw98mtJTM9ezJKK8hKVJWzIqJvHxf/00ofFAdaJRf8C8SvTxsF+1mX77Bi
	V9ae8bZ8dTWHak1IY0MaGiKkGKn2Har+KyicK19rCVlpIH0vxMWXUcdpw4KPA4btlqzWN7zSakGpF
	c+rJSvVd5E4btk70KORhFRKDpk9lKyoMBtCftDmjvcT0N2cne27e2ndy67R+3nvofhrN/Cum3g1R4
	cFYwX5A/hf06/IyhAEJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziuM-00000004Q9x-457d;
	Tue, 01 Apr 2025 21:12:30 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzij9-00000004OCf-0AS3
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 21:00:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-225df540edcso4766875ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Apr 2025 14:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743541254; x=1744146054; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C1LyEAPWj+4L4UCZE/o9EzURwtaywFLZkoAizmX+QFk=;
        b=JIpUj97JFLSSn6aeJmi7zW7dJELmmTB88p78h8SOWRK9EuiiQ2t0y+d4ZixHCl9x6p
         v8RClfEgSJmxQ/uqaoahZWK+abBjAmRZDYBDfi5P/QS3lgmociaCgeAqu2FHGXYLXtd+
         KjdeXStWbeMNcOjbtJpDdNnImegfA5b14TEggzoFbcVP36uk7/HwtjsCMtuJ7PU7UYYj
         r7aLgcGMIAE3YrUgvCL2uShQ9qsuw7iSKz0CVo57+z/XXNX/w3QX/0hSH7yLFcWl3G6g
         L/y+uHLsq9CupCAqrrnUNiB5j5haomrl06uNoWSXQnM975XE6o84obdDv7Rj8bmktz/o
         GNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743541254; x=1744146054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1LyEAPWj+4L4UCZE/o9EzURwtaywFLZkoAizmX+QFk=;
        b=KsWvM9zfIm2jFvx/zBsqJzIJ7nN9Na/qABorPLRIF41Qy2P7RyM+SHvvLZ1XrMkV1V
         N5vN3eZtXIznvdg8yH7ZwE3SgnJjcn2mzcGdISrji97rumEirVp66FscQj+prSUIB9fJ
         QuR3DBXoZhgvMriYuaEWGfr4rhODSCvVM6eOKJbq+SJoQUzwsAb/5NjmCIH2jNpJ0XEO
         GKnrxpwxV8tg/k9Q9cUWFgcbklUprPKGgPhfNCEmNq/bydqKdLsNIVC+qkt/Wd7e7mvK
         qaicTlt/XJglZNvFNh5Rug4kpjmsboDqCSekX9BJlcD4+e4uHKSwMr3RmavF53yaZCAg
         VScQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvBmNSiOccb/3CDTQm06qYqCRzhme4DDq+QupfYsukYayssp7WmmKgVtZieKL4hjmOgmn3+n83sGnl9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkR+ADvFopeulT/w5hp0uzP91mjyLNHKqRyaFRo8G3aBtlzxL9
	xCcDMLFK+IjnKANDmKIzBMnh+Drs0W6ZzpBm0vWa8Ckyj7K41cOO/plDYM5MWeE=
X-Gm-Gg: ASbGncunaOZ7iRoxbkXLYtrlPotNAOtUr7VPj9WFpfeJTCxdBjErCQwEq6vSRJdEUrS
	5ySI7iZ412eYSddr61tdBLa9FABc6wd/MQKfqi2MLn4s1Hl/WFQTIdaGWsoV43sEDzL/sWmnYKG
	Civ07eQ1HMX6GWABIBSrnu5mdcU/XefpSvbw1BWjNmdjUFvDUwa1GzYHRgr78fijaDfIbJ1/lnV
	wr4P/9wI8I4QUoC9jiaUX0eVtk9a/aZRjIGrgxOlGj6H8gOjiKU22n6T8YU+R5fAeVHvdsLzoB/
	ngonxBR4zT8DVBRKWxXqgXG6mZa7lGM06B2L5Q7oDR2UhN5YtA==
X-Google-Smtp-Source: AGHT+IFq5wSOSYaUz+xhdOOt9G/lpOtMuM0pGKW5IB1aHu/w8gobjdZ85U1J5T4uYliQ0T0YKdsApg==
X-Received: by 2002:a05:6a00:240a:b0:728:f21b:ce4c with SMTP id d2e1a72fcca58-739c433afd4mr1931936b3a.5.1743541253981;
        Tue, 01 Apr 2025 14:00:53 -0700 (PDT)
Received: from [192.168.0.12] ([136.24.137.112])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970deefe4sm9421488b3a.30.2025.04.01.14.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 14:00:53 -0700 (PDT)
Message-ID: <d9714824-810c-4dd8-aff4-d1431235702b@gmail.com>
Date: Tue, 1 Apr 2025 14:00:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Module load relocation hashtable size can become huge and
 unallocatable
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: alex@ghiti.fr, linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@dabbelt.com
References: <32a55bf7-ffc7-4383-ab61-fd4d75f46b3a@gmail.com>
 <754690c5-3df8-4524-b545-88a2a5e186ab@gmail.com>
 <8559a9f9-9100-48a7-a996-700b4a5852a9@rivosinc.com>
Content-Language: en-US
From: William Pierce <wgpierce17@gmail.com>
In-Reply-To: <8559a9f9-9100-48a7-a996-700b4a5852a9@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_140055_082073_AF9EBE10 
X-CRM114-Status: GOOD (  16.02  )
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

T24gNC8xLzI1IDEyOjU1IEFNLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gCj4gCj4gT24gMDEv
MDQvMjAyNSAwNToxMCwgV2lsbGlhbSBQaWVyY2Ugd3JvdGU6Cj4+IFVzaW5nIHZtYWxsb2NfYXJy
YXkvdmZyZWUgb24gdGhlIHJlbG9jYXRpb25faGFzaHRhYmxlCj4+IGFsbG93cyB0aGUga2VybmVs
IG1vZHVsZSB0byBsb2FkIGp1c3QgZmluZS4gSSBjYW4gc2VuZCB0aGlzCj4+IGFzIGEgcGF0Y2gg
aWYgdGhlIGZpeCBzb3VuZHMgZ29vZC4KPiAKPiBIZXkgV2lsbGlhbSwKPiAKPiBVc2luZyB2bWFs
bG9jIHNvdW5kcyByZWFzb25hYmxlIHNpbmNlIHRoZXJlIGlzIG5vIG5lZWQgdG8gaGF2ZQo+IHBo
eXNpY2FsbHkgY29udGlndW91cyBtZW1vcnkuCj4gCj4gSG93ZXZlciwgdGhlcmUgaXMgYWxzbyBh
IG5ldyBBUEkgbmFtZWQga3ZtYWxsb2Mgd2hpY2ggdXNlcyBrbWFsbG9jIGZvcgo+IHNtYWxsIHNp
emVzIGFuZCB2bWFsbG9jIGZvciBsYXJnZSBhbGxvY2F0aW9ucyBleGNlZWRpbmcga21hbGxvYwo+
IGNhcGFiaWxpdGllcywgcG90ZW50aWFsbHkgbGVhZGluZyB0byBiZXR0ZXIgcGVyZm9ybWFuY2Vz
IHRoYW4gdXNpbmcKPiB2bWFsbG9jIG9ubHkuCj4gCj4gQ2zDqW1lbnQKPiAKCkhpIENsw6ltZW50
LAoKVGhhbmsgeW91IGZvciBjaGVja2luZy4gWWVzIEkgZXhwZWN0IGt2bWFsbG9jIHNob3VsZCBh
bHNvIHdvcmsganVzdCBmaW5lLgoKSSBjYW4gc2VuZCBvdXQgYSBwYXRjaCBiYXNlZCBvbiB0aGF0
LCB1bmxlc3Mgc29tZW9uZSB3YW50cyB0byBqdXN0IHRha2UKdGhlIGNoYW5nZS4gSSdsbCBkbyBz
byBpbiB0aGUgbmV4dCBkYXkgb3Igc28uCgotIFdpbGwKCj4+Cj4+IE9uIDMvMzAvMjUgMToxMiBQ
TSwgV2lsbGlhbSBQaWVyY2Ugd3JvdGU6Cj4+PiBIZWxsbywgSSBoYXZlIGEga2VybmVsIG1vZHVs
ZSB0aGF0IHJlcXVpcmVzIGEgaHVnZSBudW1iZXIKPj4+IG9mIHJlbG9jYXRpb25zIHVwb24gbG9h
ZGluZy4KPj4+Cj4+PiBPbiBvdGhlciBhcmNoaXRlY3R1cmVzLCBpdCBsb2FkcyBpbnRvIHRoZSBr
ZXJuZWwganVzdCBmaW5lLgo+Pj4gSG93ZXZlciwgb24gcmlzY3YsIHdoaWxlIGFsbG9jYXRpbmcg
bWVtb3J5IGZvciBpdHMgcmVsb2NhdGlvbgo+Pj4gaGFzaHRhYmxlLCBpdCBlbmRzIHVwIHJlcXVl
c3RpbmcgMjA5NzE1MiBlbGVtZW50cyB0byBrbWFsbG9jX2FycmF5Lgo+Pj4KPj4+IFJpZ2h0IGhl
cmUgSSd2ZSBkdW1wZWQgdGhlIHZhbHVlcyBieSByZWNvbXBpbGluZyB0aGUga2VybmVsOgo+Pj4g
bnVtX3JlbG9jYXRpb25zOiAxNjMwOTg1LCBoYXN0YWJsZV9zaXplOiAyMDk3MTUyCj4+PiBodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNC1yYzYvc291cmNlL2FyY2gvcmlzY3Yv
a2VybmVsL21vZHVsZS5jI0w3MzQKPj4+Cj4+PiB3aGljaCBrbWFsbG9jX2FycmF5LT4uLi4tPl9f
X2ttYWxsb2NfbGFyZ2Vfbm9kZS0+Li4uLT4KPj4+IF9fYWxsb2NfZnJvemVuX3BhZ2VzX25vcHJv
ZiBjYW4ndCBoYW5kbGUgYW5kIHJldHVybnMKPj4+ICJDYW5ub3QgYWxsb2NhdGUgbWVtb3J5IiBv
biBpbnNtb2QuCj4+Pgo+Pj4gSG93IHdvdWxkIGl0IGJlIHJlY29tbWVuZGVkIHRvIGZpeCB0aGlz
Pwo+Pj4gSSBjb3VsZCBpbWFnaW5lIGFsbG9jYXRpbmcgYSBtb3JlIGRpc2NvbnRpZ3VvdXMgZGF0
YSBzdHJ1Y3R1cmUKPj4+IHRvIHRyYWNrIHRoZSByZWxvY2F0aW9ucyBvciBvdGhlcndpc2UgcmV3
b3JraW5nIHRoZSB0cmFja2luZyB0bwo+Pj4gZG8gdGhlIHJlbG9jYXRpb24gdHJhY2tpbmcgaW5s
aW5lLgo+Pj4KPj4+IFRoYW5rIHlvdSwKPj4+IFdpbGwgUGllcmNlCj4+Cj4+Cj4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
