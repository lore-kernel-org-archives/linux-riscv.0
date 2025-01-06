Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B781E77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 14:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BAbvgxcH2yreD6cmI9o04d1k1F6YAYi6gLFMzUyeK+I=; b=hbTM70+jkS7akB
	gx/MQtaOrvhMLtQ0TyeFc4Zi248isa3+5Sr2qvjuAA94MLxpcxT0y/uRpmW24YX+vHp72VNOG8rSa
	byfvuiV3GQpc2qCbDxGLv9AlYWthuZ6IYbzILjxWfik7HEuPgDiKpYHzritXT8pv4Q7MQudKWZwW2
	8WCyOWEBDOkrJr7gCTTMZg0Vy5ej43qMYVMaJJjkSFSI3a1xVRhIFynSaeYS6ZFKPpt1lWEPOEQS8
	ego5TmSB/mDnCJbQM5G1yNaOu6twFkDW+BYF0XcQ4+vEpwFLCs83jZiyV2HNyo+XYyJ6UxFxK/OKC
	q2APNvTeCKG+tBg8jTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoYt-00000001goj-0Ako;
	Mon, 06 Jan 2025 14:58:35 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoOR-00000001dTd-0Eyy
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 14:47:48 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so18568230a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 06:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736174866; x=1736779666; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N8ShvKnJKHbBbIfzU3u2fPvT77gYzjD3QzSKw1ElEXQ=;
        b=VZATvtXFa9XJKEEHaUIPtj8P82JHXiHWXDKbw3d/LEZ+DKTmY4NOcDQgqp4h4S3e6b
         rw55gGvoSuAQELPVShURZGB9BtwjZE16rKCiOfajkQdQ9OSGYBifOMXUAvnv04tJqGLv
         9PsLinMFBEFqSBxFA9+QSDD8PTwtSIXkDmgy073sChc8XKf5SxOq3yzJ3TitqK2OypdE
         wGJQLmAi6nK5auv0J+2qMQrH1YgebFdml3MgUycK9ec/zf3c0lwuHtciRRTTji4WfTl4
         dLwSWpHFKIKkys888vJczrh34eeFrqpYLncmyOpWWQUa2dcSBkxs13KSreVSM5kyPtjo
         ETlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736174866; x=1736779666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N8ShvKnJKHbBbIfzU3u2fPvT77gYzjD3QzSKw1ElEXQ=;
        b=Z5hFNxOSfjdu4e79rOlRKqUH7mEgp+6xRJtphxuWa11vm51YMA55BYe7uEtp2oP9i6
         HkzmlSrHrhK1tL++F1RxUqo21OcxVJKGVkfdqkjA06tnnR4t+aaHbKQogOlXWrYEquXR
         yoPma6+2niMaW+/IkkVtpUooHgddT5IN53oWf7boddxqMNHtD7STDtmOud5tK+OYH1ud
         z7bSTG5s7xTsksrKluCm4FEmT57go+gLFArshl8h+9qYdBfRnQRpK7yWurKd755W4gMY
         JJppjmD2ffvcx3PjCeZU7R9UC1sW6OmCGzWNQiLBC8luXKvChYmnTzWypPHmXBZ3CyiK
         DX/g==
X-Forwarded-Encrypted: i=1; AJvYcCUIh7C+jD0qThV+EaFRI82AL4hdayu5ZTYyFvkfCyqtlu/HF/x7ycuwwx27nOcI7ABxrZxZL/SXwpmUng==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdjecJ6I6F3HQvaJ7WRT8Zt8RnLLMlhnz5ry6zjeoQq4xmMU1y
	zOKjIl3jyhS6cdW/UqUQWXQ5vBlfNjYI+YgvA0sSyhf+Vv3YQJ/MC8a7f2Cfv09Co4gmkmrZOR9
	o
X-Gm-Gg: ASbGncs3n1t3TmxL3aiXmSjU5OeMui8dMG7qla1Vtl0dJpq6Q2d+ZrOQGDQr1Ja95sH
	DKf0w9dDTWFDaZpqzpdsxqDjEzAXWjYjSkKTMZHdLm2iQ1r5xn7gpGqvgBe8N0YhzuAkEBE2ZAk
	sIruVEVUYEOS9MR+Tbl8mHf6LH0ButSZqXfQAKUr9Q4HSF7Al0Aky2t5I/LyKg0lVU1nv8OZ+kj
	8Vqn7kDWYQvWks1Q05F8OZJycikbcDoVlDZQOd73yruhx+oVGaXpSPILnN7ZT7b0xygQs6MabwZ
	3b8UGWLOOt9+4HdZ/cfU3zVLwA==
X-Google-Smtp-Source: AGHT+IEfiYiuZ2bu6M0Ryc/pi0Qit0SQ26mPdyY07+eTuW7P9drMf6YNS4OhO9F8ObsWsHhzkE7yJA==
X-Received: by 2002:a17:90a:f945:b0:2ef:949c:6f6b with SMTP id 98e67ed59e1d1-2f4437bf688mr95733018a91.13.1736174865896;
        Mon, 06 Jan 2025 06:47:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2db9ca30asm22373253a91.1.2025.01.06.06.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:47:45 -0800 (PST)
Message-ID: <e155b489-e511-4a8a-948c-c6838fc7a679@rivosinc.com>
Date: Mon, 6 Jan 2025 15:47:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: misaligned: disable pagefault before accessing
 user memory
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>
References: <20250103160214.657508-1-cleger@rivosinc.com>
 <e68e8c3a-2d22-4385-9de5-e167974604fd@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <e68e8c3a-2d22-4385-9de5-e167974604fd@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_064747_292509_9B15DA6F 
X-CRM114-Status: GOOD (  21.31  )
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

CgpPbiAwNi8wMS8yMDI1IDE1OjM3LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gSGkgQ2zDqW1l
bnQsCj4gCj4gT24gMDMvMDEvMjAyNSAxNzowMiwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBD
YWxsaW5nIGNvcHlfe2Zyb20vdG99X3VzZXIoKSBpbiBpbnRlcnJ1cHQgY29udGV4dCBtaWdodCBh
Y3R1YWxseSBzbGVlcAo+PiBhbmQgZGlzcGxheSBhIEJVRyBtZXNzYWdlOgo+Pgo+PiBbwqDCoCAx
MC4zNzcwMTldIEJVRzogc2xlZXBpbmcgZnVuY3Rpb24gY2FsbGVkIGZyb20gaW52YWxpZCBjb250
ZXh0IGF0Cj4+IGluY2x1ZGUvbGludXgvdWFjY2Vzcy5oOjE2Mgo+PiBbwqDCoCAxMC4zNzk4Njhd
IGluX2F0b21pYygpOiAwLCBpcnFzX2Rpc2FibGVkKCk6IDEsIG5vbl9ibG9jazogMCwgcGlkOgo+
PiA4OCwgbmFtZTogc3NoLWtleWdlbgo+PiBbwqDCoCAxMC4zODAwMDldIHByZWVtcHRfY291bnQ6
IDAsIGV4cGVjdGVkOiAwCj4+IFvCoMKgIDEwLjM4MDMyNF0gQ1BVOiAwIFVJRDogMCBQSUQ6IDg4
IENvbW06IHNzaC1rZXlnZW4gTm90IHRhaW50ZWQKPj4gNi4xMy4wLXJjNS0wMDAxMy1nMzQzNWNk
NWYxMzMxLWRpcnR5ICMxOQo+PiBbwqDCoCAxMC4zODA2MzldIEhhcmR3YXJlIG5hbWU6IHJpc2N2
LXZpcnRpbyxxZW11IChEVCkKPj4gW8KgwqAgMTAuMzgwNzk4XSBDYWxsIFRyYWNlOgo+PiBbwqDC
oCAxMC4zODExMDhdIFs8ZmZmZmZmZmY4MDAxM2QzMD5dIGR1bXBfYmFja3RyYWNlKzB4MWMvMHgy
NAo+PiBbwqDCoCAxMC4zODE2OTBdIFs8ZmZmZmZmZmY4MDAwMjJkOD5dIHNob3dfc3RhY2srMHgy
OC8weDM0Cj4+IFvCoMKgIDEwLjM4MTgxMl0gWzxmZmZmZmZmZjgwMDBlZTFjPl0gZHVtcF9zdGFj
a19sdmwrMHg0YS8weDY4Cj4+IFvCoMKgIDEwLjM4MTk1OF0gWzxmZmZmZmZmZjgwMDBlZTRlPl0g
ZHVtcF9zdGFjaysweDE0LzB4MWMKPj4gW8KgwqAgMTAuMzgyMDQ3XSBbPGZmZmZmZmZmODAwNjVl
MGE+XSBfX21pZ2h0X3Jlc2NoZWQrMHhmYS8weDEwNAo+PiBbwqDCoCAxMC4zODIxNzJdIFs8ZmZm
ZmZmZmY4MDA2NWU1Nj5dIF9fbWlnaHRfc2xlZXArMHg0Mi8weDY2Cj4+IFvCoMKgIDEwLjM4MjI2
N10gWzxmZmZmZmZmZjgwMWIwYzVlPl0gX19taWdodF9mYXVsdCsweDFjLzB4MjQKPj4gW8KgwqAg
MTAuMzgyMzYzXSBbPGZmZmZmZmZmODA0NDE1ZTQ+XSBfY29weV9mcm9tX3VzZXIrMHgyOC8weGMy
Cj4+IFvCoMKgIDEwLjM4MjQ1OV0gWzxmZmZmZmZmZjgwMDE1MmNhPl0gaGFuZGxlX21pc2FsaWdu
ZWRfbG9hZCsweDFjYS8weDJmYwo+PiBbwqDCoCAxMC4zODI1NjVdIFs8ZmZmZmZmZmY4MGEwMzNh
MD5dIGRvX3RyYXBfbG9hZF9taXNhbGlnbmVkKzB4MjQvMHhlZQo+PiBbwqDCoCAxMC4zODI3MTRd
IFs8ZmZmZmZmZmY4MGEwZGM2Nj5dIGhhbmRsZV9leGNlcHRpb24rMHgxNDYvMHgxNTIKPj4KPj4g
SW4gb3JkZXIgdG8gc2FmZWx5IGhhbmRsZSB1c2VyIG1lbW9yeSBhY2Nlc3MgZnJvbSB0aGlzIGNv
bnRleHQsIGRpc2FibGUKPj4gcGFnZSBmYXVsdCB3aGlsZSBjb3B5aW5nIHVzZXIgbWVtb3J5LiBB
bHRob3VnaCB0aGlzIG1pZ2h0IGxlYWQgdG8gY29weQo+PiBmYWlsdXJlIGluIHNvbWUgY2FzZXMg
KG9mZmxpbmVkIHBhZ2UpLCB0aGlzIGlzIHRoZSBiZXN0IHdlIGNhbiB0cnkgdG8gYmUKPj4gc2Fm
ZS4KPj4KPj4gRml4ZXM6IGI2ODZlY2RlYWNmNiAoInJpc2N2OiBtaXNhbGlnbmVkOiBSZXN0cmlj
dCB1c2VyIGFjY2VzcyB0bwo+PiBrZXJuZWwgbWVtb3J5IikKPj4gU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+Pgo+PiAtLS0KPj4gwqAgYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgMjYgKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVk
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC8KPj4gdHJhcHNfbWlzYWxpZ25lZC5jCj4+IGluZGV4IDdj
YzEwOGFlZDc0ZS4uNzVhMDhlZDIwMDcwIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwc19taXNhbGlnbmVkLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlz
YWxpZ25lZC5jCj4+IEBAIC0zNTUsNyArMzU1LDcgQEAgc3RhdGljIGludCBoYW5kbGVfc2NhbGFy
X21pc2FsaWduZWRfbG9hZChzdHJ1Y3QKPj4gcHRfcmVncyAqcmVncykKPj4gwqAgewo+PiDCoMKg
wqDCoMKgIHVuaW9uIHJlZ19kYXRhIHZhbDsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGVw
YyA9IHJlZ3MtPmVwYzsKPj4gLcKgwqDCoCB1bnNpZ25lZCBsb25nIGluc247Cj4+ICvCoMKgwqAg
dW5zaWduZWQgbG9uZyBpbnNuLCBjb3B5X2xlbjsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25n
IGFkZHIgPSByZWdzLT5iYWRhZGRyOwo+PiDCoMKgwqDCoMKgIGludCBmcCA9IDAsIHNoaWZ0ID0g
MCwgbGVuID0gMDsKPj4gwqAgQEAgLTQ0MSw3ICs0NDEsMTYgQEAgc3RhdGljIGludCBoYW5kbGVf
c2NhbGFyX21pc2FsaWduZWRfbG9hZChzdHJ1Y3QKPj4gcHRfcmVncyAqcmVncykKPj4gwqAgwqDC
oMKgwqDCoCB2YWwuZGF0YV91NjQgPSAwOwo+PiDCoMKgwqDCoMKgIGlmICh1c2VyX21vZGUocmVn
cykpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChjb3B5X2Zyb21fdXNlcigmdmFsLCAodTggX191
c2VyICopYWRkciwgbGVuKSkKPj4gK8KgwqDCoMKgwqDCoMKgIC8qCj4+ICvCoMKgwqDCoMKgwqDC
oMKgICogV2UgY2FuIG5vdCBzbGVlcCBpbiBleGNlcHRpb24gY29udGV4dC4gRGlzYWJsZSBwYWdl
ZmF1bHQgdG8KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBhdm9pZCBhIHBvdGVudGlhbCBzbGVlcCB3
aGlsZSBhY2Nlc3NpbmcgdXNlciBtZW1vcnkuIFNpZGUKPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBl
ZmZlY3QgaXMgdGhhdCBpZiBpdCB3b3VsZCBoYXZlIHNsZWVwLCB0aGVuIHRoZSBjb3B5IHdpbGwK
Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBmYWlsLgo+PiArwqDCoMKgwqDCoMKgwqDCoCAqLwo+PiAr
wqDCoMKgwqDCoMKgwqAgcGFnZWZhdWx0X2Rpc2FibGUoKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGNv
cHlfbGVuID0gY29weV9mcm9tX3VzZXIoJnZhbCwgKHU4IF9fdXNlciAqKWFkZHIsIGxlbik7Cj4+
ICvCoMKgwqDCoMKgwqDCoCBwYWdlZmF1bHRfZW5hYmxlKCk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAoY29weV9sZW4pCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtMTsKPj4g
wqDCoMKgwqDCoCB9IGVsc2Ugewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtY3B5KCZ2YWwsICh1
OCAqKWFkZHIsIGxlbik7Cj4+IEBAIC00NjMsNyArNDcyLDcgQEAgc3RhdGljIGludCBoYW5kbGVf
c2NhbGFyX21pc2FsaWduZWRfc3RvcmUoc3RydWN0Cj4+IHB0X3JlZ3MgKnJlZ3MpCj4+IMKgIHsK
Pj4gwqDCoMKgwqDCoCB1bmlvbiByZWdfZGF0YSB2YWw7Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQg
bG9uZyBlcGMgPSByZWdzLT5lcGM7Cj4+IC3CoMKgwqAgdW5zaWduZWQgbG9uZyBpbnNuOwo+PiAr
wqDCoMKgIHVuc2lnbmVkIGxvbmcgaW5zbiwgY29weV9sZW47Cj4+IMKgwqDCoMKgwqAgdW5zaWdu
ZWQgbG9uZyBhZGRyID0gcmVncy0+YmFkYWRkcjsKPj4gwqDCoMKgwqDCoCBpbnQgbGVuID0gMCwg
ZnAgPSAwOwo+PiDCoCBAQCAtNTM5LDcgKzU0OCwxNiBAQCBzdGF0aWMgaW50Cj4+IGhhbmRsZV9z
Y2FsYXJfbWlzYWxpZ25lZF9zdG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRU9QTk9UU1VQUDsKPj4gwqAgwqDCoMKgwqDCoCBpZiAodXNlcl9t
b2RlKHJlZ3MpKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoY29weV90b191c2VyKCh1OCBfX3Vz
ZXIgKilhZGRyLCAmdmFsLCBsZW4pKQo+PiArwqDCoMKgwqDCoMKgwqAgLyoKPj4gK8KgwqDCoMKg
wqDCoMKgwqAgKiBXZSBjYW4gbm90IHNsZWVwIGluIGV4Y2VwdGlvbiBjb250ZXh0LiBEaXNhYmxl
IHBhZ2VmYXVsdCB0bwo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIGF2b2lkIGEgcG90ZW50aWFsIHNs
ZWVwIHdoaWxlIGFjY2Vzc2luZyB1c2VyIG1lbW9yeS4gU2lkZQo+PiArwqDCoMKgwqDCoMKgwqDC
oCAqIGVmZmVjdCBpcyB0aGF0IGlmIGl0IHdvdWxkIGhhdmUgc2xlZXAsIHRoZW4gdGhlIGNvcHkg
d2lsbAo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIGZhaWwuCj4+ICvCoMKgwqDCoMKgwqDCoMKgICov
Cj4+ICvCoMKgwqDCoMKgwqDCoCBwYWdlZmF1bHRfZGlzYWJsZSgpOwo+PiArwqDCoMKgwqDCoMKg
wqAgY29weV9sZW4gPSBjb3B5X3RvX3VzZXIoKHU4IF9fdXNlciAqKWFkZHIsICZ2YWwsIGxlbik7
Cj4+ICvCoMKgwqDCoMKgwqDCoCBwYWdlZmF1bHRfZW5hYmxlKCk7Cj4+ICvCoMKgwqDCoMKgwqDC
oCBpZiAoY29weV9sZW4pCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtMTsK
Pj4gwqDCoMKgwqDCoCB9IGVsc2Ugewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtY3B5KCh1OCAq
KWFkZHIsICZ2YWwsIGxlbik7Cj4gCj4gCj4gSSdtIHdvbmRlcmluZyB3aHkgdGhlIGlycXMgYXJl
IGRpc2FibGVkIGhlcmU/IFdoYXQgcHJldmVudHMgdXMgZnJvbQo+IGVuYWJsaW5nIHRoZW0/IElJ
VUMsIGlmIGZvciBzb21lIHJlYXNvbiB0aGUgdXNlciBwYWdlIGlzIG5vdCBpbiBtZW1vcnksCj4g
d2Ugd2lsbCBmYWlsIHRoZSBtaXNhbGlnbmVkIGFjY2VzcyBhbmQga2lsbCB0aGUgcHJvY2Vzcywg
c28gc3VjaAo+IGZhaWx1cmVzIGNvdWxkIGJlIGNvbXBsZXRlbHkgcmFuZG9tIHJpZ2h0PwoKSGkg
QWxleCwKClRoaXMgY29kZSBpcyBjYWxsZWQgZnJvbSBpbnRlcnJ1cHQgY29udGV4dCBhcyBhIHJl
c3VsdCBmcm9tIGFuCmV4Y2VwdGlvbi4gQUZBSUssIGludGVycnVwdHMgYXJlIGRpc2FibGVkIGR1
cmluZyB0aGUgd2hvbGUgZXhjZXB0aW9uCmhhbmRsaW5nIGFuZCByZS1lbmFibGVkIHdoZW4gcmV0
dXJuaW5nIHRvIHVzZXIgbW9kZSBpbgpkb19ub3RpZnlfcmVzdW1lKCkuIFNvIHRoYXQncyB3aHkg
aXQgdHJpZ2dlcnMgdGhpcyB3YXJuaW5nLgoKQ2zDqW1lbnQKCj4gCj4gQnV0IGlmIHdlIGdvIGZv
ciB0aGlzIHNvbHV0aW9uLCBJIHRoaW5rIHRoZSBzYW1lIG5lZWRzIHRvIGJlIGRvbmUgaW4KPiBf
X3JlYWRfaW5zbigpLgo+IAo+IExldCBtZSBrbm93IGlmIEkgbWlzdW5kZXJzdG9vZCBzb21ldGhp
bmcuCj4gCj4gVGhhbmtzLAo+IAo+IEFsZXgKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
