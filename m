Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6246FC001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zCwZBhfsCva7SXbcrJQrOnQvda6fbzUNwwzb3mYRUvw=; b=PXDZ2C3xiPBUZ8
	7PKZIesLrWJgYqE5matAg7MIKOyLyUOZNcmRMSA4YzDgkjRScyoPPncI3KjlDrVLEP/xfvxaWeChA
	hlaF/ajURHClIfP7IE9VeeVFVVWH/mDkZD+Mt46h1bwcFm58VQBXefcUvp05vg5/xHG3kxOm1bJ6t
	KFwW8w5U0H4FU15TePkIfHyUzgU/ApLsoqY6T3Tr4p0C5Dq+Lowx43txn9fkrEJulV9CY9aJIxMHz
	20gqZc8xEUnfliD+usw6J9GTfOCB0zxehI+OdsFZO7fbFS3tHHZzzx4gehABkIwCd9JqfwQN3bS0P
	nUadB5laHauILziist8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0WV-005ewi-0U;
	Wed, 19 Jul 2023 06:18:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0WT-005ev4-1x
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vqOdktV4CNBtKn+gnmv6biZuC3rq/Zlio3rN/V4PHOU=; b=CK4vtqSWUqdq9JEd0hqXhyqy8E
	GoDhXzjsNwJs6hWTFOkiw7EyXQf5B4Fzh9b+caPBKrBuAPVOKs80uwQPcHgiIfcBi80t+/IS40006
	oISaJieeOJ8otivW5WGsz4CPdwj28ijg6tyvId79rojNNU01Ii4NnwKmcH7lhL08rcQZeOfIibGQI
	lXNYYkOKmp5ShO93TYo9OuikOBM25xy69Qwq03HvXSqSdZy+XcZsRRkBdMg2lTdpJoWRTf3e08u/l
	olPjjaOaVANWcolFaGMqH+BYutKY3kEzNGreZRhA/dtPS4gg0k7JfY+Ma9F0ufxbhKFnrdcSnSg6z
	PfCsWufQ==;
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLrdG-00C0Wd-02
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 20:49:21 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-1b8bbce9980so36862465ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 13:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689713288; x=1692305288;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vqOdktV4CNBtKn+gnmv6biZuC3rq/Zlio3rN/V4PHOU=;
        b=rqCnJR32zTs5TqdKS1/Ufs1UUVAwzfTnwTIjTAvcFtONsiHlD252ljFOl90S2cYvgM
         ZLKSITp2+G5AW40qtJIZ+MQTegHRta341lU9Ygr4VZgxyk1KYPwQR6YP3ITcdON1PH6N
         nBkBxfCUyC9q7D1dCyEMqJOIPPFvDDFnHoE/GaSpiTrmftxOUnNcIoIdLQmi/NX0vqTm
         AASkqHAt5oOw1i09CcjHgfcGXe8UqqaQ9OfNrLp5B4dJnWN/+7yMU3bMeRYukKDthIMc
         WUh4nLPLLkhH8dJP2dA8ii7XW93gNrkr34MWCYt3URAgyPIY7x7UCH9CUr06dktAzbJs
         YqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689713288; x=1692305288;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vqOdktV4CNBtKn+gnmv6biZuC3rq/Zlio3rN/V4PHOU=;
        b=jH5QY0hxagbUhmNsRxFNYZN4NJenSguVo6KUYWfKTmIt1hH8sYGnKOqrwQpLqqNUxN
         FM7KfxPuFFvrHE1ZCjWGhtsfG3yeH8wjQodTN4uqSbNiJ/Ik/7kDH7neBY+HoUcK6SuG
         XYbZTn/6EepwOmcWLzGK/rv5YXYpHYDBpHxP6uNS2XgxXdP4+xNtHqIPb6q0uAxzaw9P
         RkPHPgb+jb+bXqpOGb8QQ5HyqGPqy6bqiOjP0EgLoWvQjj+yu215NJwoQKXeB+C+qlSb
         RlHM6rEiQvu9c0LNgUl/OSfYMzGf6LbCPNyJHpfEfRkXlpsgpb8ioOnGuegfH1tjVjCW
         PEVg==
X-Gm-Message-State: ABy/qLY/mh4uaxwz7RsWuBGgB2+fitnmOZrwaCi4kR/WP8h5uuFiJ45H
	JTdMi3hyqcPZ+ZQ7SYAaS/I=
X-Google-Smtp-Source: APBJJlHOdEC0qdKIljueqvKhAnIWEgKV9mUStxkY1rPzoLUZoY9sN7ahxjF2EtVckZx/noMv3LRlhw==
X-Received: by 2002:a17:903:110d:b0:1b0:3637:384e with SMTP id n13-20020a170903110d00b001b03637384emr888660plh.25.1689713288277;
        Tue, 18 Jul 2023 13:48:08 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.53])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902d48100b001b896d0eb3dsm2321333plg.8.2023.07.18.13.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 13:48:07 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <cd53e03b-c574-dc05-f9c0-1c8271c5a607@gmail.com>
Date: Wed, 19 Jul 2023 04:48:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: entry: set a0 prior to
 syscall_enter_from_user_mode
Content-Language: en-GB-large
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Felix Yan <felixonmars@archlinux.org>,
 Ruizhe Pan <c141028@gmail.com>, Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
References: <20230718162940.226118-1-CoelacanthusHex@gmail.com>
 <87pm4p2et2.fsf@all.your.base.are.belong.to.us>
 <03206759-8d6a-a410-a8f9-d4678236bdbf@gmail.com>
In-Reply-To: <03206759-8d6a-a410-a8f9-d4678236bdbf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_214919_360096_8F12E9CE 
X-CRM114-Status: GOOD (  19.18  )
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

Ck9uIDIwMjMvNy8xOSAwNDozNSwgQ2VsZXN0ZSBMaXUgd3JvdGU6Cj4gCj4gT24gMjAyMy83LzE5
IDAzOjM1LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+PiBDZWxlc3RlIExpdSA8Y29lbGFjYW50aHVz
aGV4QGdtYWlsLmNvbT4gd3JpdGVzOgo+Pgo+Pj4gV2hlbiB3ZSB0ZXN0IHNlY2NvbXAgd2l0aCA2
LjQga2VybmVsLCB3ZSBmb3VuZCBlcnJubyBoYXMgd3JvbmcgdmFsdWUuCj4+PiBJZiB3ZSBkZW55
IE5FVExJTktfQVVESVQgd2l0aCBFQUZOT1NVUFBPUlQsIGFmdGVyIGYwYmRkZjUwNTg2ZCwgd2Ug
d2lsbAo+Pj4gZ2V0IEVOT1NZUyBpbnN0ZWFkLiBXZSBnb3Qgc2FtZSByZXN1bHQgd2l0aCA5YzI1
OThkNDM1MTAgKCJyaXNjdjogZW50cnk6IFNhdmUgYTAKPj4+IHByaW9yIHN5c2NhbGxfZW50ZXJf
ZnJvbV91c2VyX21vZGUoKSIpLgo+Pj4KPj4+IEFmdGVyIGFuYWx5c2luZyBjb2RlLCB3ZSB0aGlu
ayB0aGF0IHJlZ3MtPmEwID0gLUVOT1NZUyBzaG91bGQgYmUgYWR2YW5jZWQgYmVmb3JlCj4+PiBz
eXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlIHRvIGZpeCB0aGlzIHByb2JsZW0uIEluIF9fc2Vj
Y29tcF9maWx0ZXIsIHdoZW4KPj4+IHNlY2NvbXAgcmVqZWN0ZWQgdGhpcyBzeXNjYWxsIHdpdGgg
c3BlY2lmaWVkIGVycm5vLCB0aGV5IHdpbGwgc2V0IGEwIHRvIHJldHVybgo+Pj4gbnVtYmVyIGFz
IHN5c2NhbGwgQUJJLCBhbmQgdGhlbiByZXR1cm4gLTEuIFRoaXMgcmV0dXJuIG51bWJlciBpcyBm
aW5hbGx5IHBhc3MKPj4+IGFzIHJldHVybiBudW1iZXIgb2Ygc3lzY2FsbF9lbnRlcl9mcm9tX3Vz
ZXJfbW9kZSwgYW5kIHRoZW4gaXMgY29tcGFyZWQKPj4+IHdpdGggTlJfc3lzY2FsbHMgYWZ0ZXIg
Y29udmVydGVkIHRvIHVsb25nIChzbyBpdCB3aWxsIGJlIFVMT05HX01BWCkuCj4+PiBUaGUgY29u
ZGl0aW9uIHN5c2NhbGwgPCBOUl9zeXNjYWxscyB3aWxsIGFsd2F5cyBiZSBmYWxzZSwgc28gcmVn
cy0+YTAgPSAtRU5PU1lTCj4+PiBpcyBhbHdheXMgZXhlY3V0YWJsZS4gSXQgY292ZXJlZCBhMCBz
ZXQgYnkgc2VjY29tcCwgc28gd2UgYWx3YXlzIGdldAo+Pj4gRU5PU1lTIHdoZW4gbWF0Y2ggc2Vj
Y29tcCBSRVRfRVJSTk8gcnVsZS4KPj4KPj4gSXNuJ3Qgc29tZXRoaW5nIGxpa2UuLi4KPj4KPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jCj4+IGluZGV4IGY5MTBkZmNjYmY1ZC4uMTVhOGI0ODk4YTZjIDEwMDY0NAo+PiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L3RyYXBzLmMKPj4gQEAgLTI5Nyw3ICsyOTcsNyBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3Ry
YXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfYnJlYWsoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+ICBh
c21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShz
dHJ1Y3QgcHRfcmVncyAqcmVncykKPj4gIHsKPj4gIAlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Cj4+
IC0JCXVsb25nIHN5c2NhbGwgPSByZWdzLT5hNzsKPj4gKwkJbG9uZyBzeXNjYWxsID0gcmVncy0+
YTc7Cj4+ICAKPj4gIAkJcmVncy0+ZXBjICs9IDQ7Cj4+ICAJCXJlZ3MtPm9yaWdfYTAgPSByZWdz
LT5hMDsKPj4gQEAgLTMwNiw3ICszMDYsNyBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBf
c2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4gIAo+
PiAgCQlzeXNjYWxsID0gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzLCBzeXNjYWxs
KTsKPj4gIAo+PiAtCQlpZiAoc3lzY2FsbCA8IE5SX3N5c2NhbGxzKQo+PiArCQlpZiAoc3lzY2Fs
bCA+IC0xICYmIHN5c2NhbGwgPCBOUl9zeXNjYWxscykKPj4gIAkJCXN5c2NhbGxfaGFuZGxlcihy
ZWdzLCBzeXNjYWxsKTsKPj4gIAkJZWxzZQo+PiAgCQkJcmVncy0+YTAgPSAtRU5PU1lTOwo+Pgo+
Pgo+PiAuLi5lYXNpZXIgdG8gcmVhZD8KPj4KPj4KPj4gQmrDtnJuCj4gCj4gSXQgc2VlbXMgdGhh
dCB5b3VyIGNoYW5nZSB0dXJuIGl0IGJhY2sgdG8gdGhlIGJlZ2lubmluZy4gSWYgc3lzY2FsbCA9
PSAtMSwKPiBpdCBpcyBzdXBwb3NlZCB0byBnbyBuZWl0aGVyIGZpcnN0IG5vciBlbHNlIGJyYW5j
aC4gSXQgc2hvdWxkIGRvIE5PVEhJTkcuCj4gSG93ZXZlciBpdCB3YXMgc3RpbGwgYSBncmVhdCBp
ZGVhLiBJdCBtYXkgYmUgYmV0dGVyIHRvIHVzZSBhIHNldCBvZiBpZi1zdGF0ZW1lbnQKPiB0byBj
bGFyaWZ5IHRoZSBsb2dpYy4KPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBpbmRleCBmOTEwZGZjY2JmNWQyLi5k
MGJkNzI1MjQ0NTk0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gQEAgLTMwNiw3ICszMDYsOSBAQCBhc21s
aW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1
Y3QgcHRfcmVncyAqcmVncykKPiAgCj4gIAkJc3lzY2FsbCA9IHN5c2NhbGxfZW50ZXJfZnJvbV91
c2VyX21vZGUocmVncywgc3lzY2FsbCk7Cj4gIAo+IC0JCWlmIChzeXNjYWxsIDwgTlJfc3lzY2Fs
bHMpCj4gKwkJaWYgKHN5c2NhbGwgPT0gLTEpCj4gKwkJCS8vIERvIG5vdGhpbmcKPiArCQllbHNl
IGlmIChzeXNjYWxsIDwgTlJfc3lzY2FsbHMpCj4gIAkJCXN5c2NhbGxfaGFuZGxlcihyZWdzLCBz
eXNjYWxsKTsKPiAgCQllbHNlCj4gIAkJCXJlZ3MtPmEwID0gLUVOT1NZUzsKPiAKCk9oLCBpdCdz
IGJldHRlciB0byByZW9yZGVyIHRvOgoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCmluZGV4IGY5MTBkZmNjYmY1ZDIuLjkz
MjgxNGUzNGFjMzcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwpAQCAtMzA4LDcgKzMwOCw3IEBAIGFzbWxpbmthZ2Ug
X192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQogCiAJCWlmIChzeXNjYWxsIDwgTlJfc3lzY2FsbHMpCiAJCQlzeXNjYWxsX2hh
bmRsZXIocmVncywgc3lzY2FsbCk7Ci0JCWVsc2UKKwkJZWxzZSBpZiAoc3lzY2FsbCAhPSAtMSkK
IAkJCXJlZ3MtPmEwID0gLUVOT1NZUzsKIAogCQlzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKHJl
Z3MpOwoKCkkgd2lsbCBzZW5kIHYzIGxhdGVyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
