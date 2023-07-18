Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCB4EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vtQ2N+aVeAzickt0fMKRr2/MSWLiX2V2v+/VHQQxWzE=; b=guBy45rs4NO94k
	t4gZDEx0TeiBf1TVDxyiZKR0wkHaJ4YO02dpOs4LMHfN3QdXmOno5RYotMJdOG1Q7P0dKWd5Gfo81
	HiIviPgh/oUy2s16l71q9Fi8vxkvVu5wlAMDLrCiSCsKa4FIdXPAIrgSbD9tAT7kOm96tMHw7Ajim
	QJzegJUsMKvn+/hQ0TR08hBxUXyoGYr6wk4qW46x1gsSBML6FTcgNVgzVp3lh1uliK8zQTDqebqoN
	6xeIyRNHFExvi41AOE7pxzhapALKI3MH+e/wNa6HmN7tKx5v2GofMPpivtReZY8229HUja8xYf0D0
	4+6S9EgEAaFNHCtiuvrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0pV-005pGJ-2v;
	Wed, 19 Jul 2023 06:38:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0pU-005pFW-1O
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=s97tEr+Yr2ZXFbk9cEJRa0CCfZ19DYvI4BO8yDRKDsY=; b=Z3RzIDe1AVbEv0VPpKrLDhEErv
	bjXY+m2CDd1YsIsvUA+4EoJlHTAPpRJY4GBPxnvOGCtjlg+udniVWyBdnOyWhtR9OTPmvWLBhMD2D
	v2ZJ0WnXerZ5CIlJ0pUZzGyZaTUNU/fY7Kh9FgetQJN2eEbjAOmZ5ZqnH9G68o0n8KIqN6GFMVu9d
	TfoTMI2KMPKT171gs9zs6oEIJyyhyl4tTwKLUzEHaUO9FjTWFZMxbAuN4kJ0df5zbmXedwxQ/03nh
	BW1hTHzKzY1MvG1OKbHvbyWM1Dj/M5fgFa8JmhqBzzbCkZBPuVuoEAoMDRUlxd6+IzYhNmHIGsR0o
	BXVmpWbQ==;
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLrlT-00C12d-0D
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 20:58:05 +0000
Received: by mail-oo1-xc41.google.com with SMTP id 006d021491bc7-56352146799so4176762eaf.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 13:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689713803; x=1692305803;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s97tEr+Yr2ZXFbk9cEJRa0CCfZ19DYvI4BO8yDRKDsY=;
        b=mRKXbr6Glsi8VBQYVptpWfg3xtc95oVpxwcldhADhXDa3CpOObfBQ+DPczxIZ7GjFp
         /9eLhXadWP6WG1j6ARFKLTsdRr0YlhqojF7jWw2Kry9DbBGmzraywAojjNwpPv3AaSho
         OAhARHFg6PqbQ+b+xmCpFJ+eqHIQvmROmKWHxB7+veU0CP/ivhXqoF0nbLFgiYUGHBza
         uULa3J2fvjQ3zxdCkNG8kjC8aZpD6bM39bAacpJFd1K91LQAdEBHaKSSSEsLn8hxZn18
         3UWJiz6crj7855/U2FykVFU8azSVajIp7GNkYX0K+VI9Hzv3w/bamac5pucC/5lRH7vk
         RCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689713803; x=1692305803;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s97tEr+Yr2ZXFbk9cEJRa0CCfZ19DYvI4BO8yDRKDsY=;
        b=gdq/9lp2fql9NF3mLgrwU+5DjAZVcRZDEIpTS+e+LexZuXeMwoLlKLkroRTAzICjCQ
         0u5l1AGAMNhrChs2PBYNamI2zjL2yd/Dq52yZQbTpBaf6ALgvpYaGnUf/R3Ycmk6Pxvi
         fikuDrKMdsVWfdrPSA7LixEEP40iVfy7gs+lr1qN+CXKcVYUjbRr9Wqlwu0qo2eovsuD
         rEZiS8ABfEY8VLsK/z5LeLA3Gfrxw9keAJOjj8o6gXnuT3qyyiDXWe3HywvDiNKd/GXu
         awpBJhHcv3CGrUegU31guRM79CxM11TIrkWsJJ9uJ2bnosjgrtlBB7EhE/LLdytdpYgG
         reLg==
X-Gm-Message-State: ABy/qLaigwIWH8UNHNPSGootWX0h4CFV+/K3afDKpOAxF/44nr0Ro2iS
	wjQc28EuQOYLbX50JZGCq0E=
X-Google-Smtp-Source: APBJJlG1nhVunFoHnJqGi17dy87SbRr3QVG4ZQdEEF+untHwhWMyp70xCdPykYjSIuz44YdOSZelhg==
X-Received: by 2002:a05:6358:8aa:b0:135:acfd:8786 with SMTP id m42-20020a05635808aa00b00135acfd8786mr5761394rwj.3.1689713803369;
        Tue, 18 Jul 2023 13:56:43 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.53])
        by smtp.gmail.com with ESMTPSA id y22-20020a63b516000000b0055b6eb635f2sm2105500pge.65.2023.07.18.13.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 13:56:42 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <c62f16cd-8405-9b05-1c1d-5c776716622d@gmail.com>
Date: Wed, 19 Jul 2023 04:56:38 +0800
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
 <87r0p5kkpw.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87r0p5kkpw.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_215754_161566_B6FDB6E5 
X-CRM114-Status: GOOD (  20.88  )
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

Ck9uIDIwMjMvNy8xOSAwNDo1MCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBDZWxlc3RlIExpdSA8
Y29lbGFjYW50aHVzaGV4QGdtYWlsLmNvbT4gd3JpdGVzOgo+IAo+PiBPbiAyMDIzLzcvMTkgMDM6
MzUsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+PiBDZWxlc3RlIExpdSA8Y29lbGFjYW50aHVzaGV4
QGdtYWlsLmNvbT4gd3JpdGVzOgo+Pj4KPj4+PiBXaGVuIHdlIHRlc3Qgc2VjY29tcCB3aXRoIDYu
NCBrZXJuZWwsIHdlIGZvdW5kIGVycm5vIGhhcyB3cm9uZyB2YWx1ZS4KPj4+PiBJZiB3ZSBkZW55
IE5FVExJTktfQVVESVQgd2l0aCBFQUZOT1NVUFBPUlQsIGFmdGVyIGYwYmRkZjUwNTg2ZCwgd2Ug
d2lsbAo+Pj4+IGdldCBFTk9TWVMgaW5zdGVhZC4gV2UgZ290IHNhbWUgcmVzdWx0IHdpdGggOWMy
NTk4ZDQzNTEwICgicmlzY3Y6IGVudHJ5OiBTYXZlIGEwCj4+Pj4gcHJpb3Igc3lzY2FsbF9lbnRl
cl9mcm9tX3VzZXJfbW9kZSgpIikuCj4+Pj4KPj4+PiBBZnRlciBhbmFseXNpbmcgY29kZSwgd2Ug
dGhpbmsgdGhhdCByZWdzLT5hMCA9IC1FTk9TWVMgc2hvdWxkIGJlIGFkdmFuY2VkIGJlZm9yZQo+
Pj4+IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUgdG8gZml4IHRoaXMgcHJvYmxlbS4gSW4g
X19zZWNjb21wX2ZpbHRlciwgd2hlbgo+Pj4+IHNlY2NvbXAgcmVqZWN0ZWQgdGhpcyBzeXNjYWxs
IHdpdGggc3BlY2lmaWVkIGVycm5vLCB0aGV5IHdpbGwgc2V0IGEwIHRvIHJldHVybgo+Pj4+IG51
bWJlciBhcyBzeXNjYWxsIEFCSSwgYW5kIHRoZW4gcmV0dXJuIC0xLiBUaGlzIHJldHVybiBudW1i
ZXIgaXMgZmluYWxseSBwYXNzCj4+Pj4gYXMgcmV0dXJuIG51bWJlciBvZiBzeXNjYWxsX2VudGVy
X2Zyb21fdXNlcl9tb2RlLCBhbmQgdGhlbiBpcyBjb21wYXJlZAo+Pj4+IHdpdGggTlJfc3lzY2Fs
bHMgYWZ0ZXIgY29udmVydGVkIHRvIHVsb25nIChzbyBpdCB3aWxsIGJlIFVMT05HX01BWCkuCj4+
Pj4gVGhlIGNvbmRpdGlvbiBzeXNjYWxsIDwgTlJfc3lzY2FsbHMgd2lsbCBhbHdheXMgYmUgZmFs
c2UsIHNvIHJlZ3MtPmEwID0gLUVOT1NZUwo+Pj4+IGlzIGFsd2F5cyBleGVjdXRhYmxlLiBJdCBj
b3ZlcmVkIGEwIHNldCBieSBzZWNjb21wLCBzbyB3ZSBhbHdheXMgZ2V0Cj4+Pj4gRU5PU1lTIHdo
ZW4gbWF0Y2ggc2VjY29tcCBSRVRfRVJSTk8gcnVsZS4KPj4+Cj4+PiBJc24ndCBzb21ldGhpbmcg
bGlrZS4uLgo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+Pj4gaW5kZXggZjkxMGRmY2NiZjVkLi4xNWE4YjQ4
OThhNmMgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4+PiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4+PiBAQCAtMjk3LDcgKzI5Nyw3IEBAIGFzbWxp
bmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9icmVhayhzdHJ1Y3Qg
cHRfcmVncyAqcmVncykKPj4+ICBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2
b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4+ICB7Cj4+PiAgCWlm
ICh1c2VyX21vZGUocmVncykpIHsKPj4+IC0JCXVsb25nIHN5c2NhbGwgPSByZWdzLT5hNzsKPj4+
ICsJCWxvbmcgc3lzY2FsbCA9IHJlZ3MtPmE3Owo+Pj4gIAo+Pj4gIAkJcmVncy0+ZXBjICs9IDQ7
Cj4+PiAgCQlyZWdzLT5vcmlnX2EwID0gcmVncy0+YTA7Cj4+PiBAQCAtMzA2LDcgKzMwNiw3IEBA
IGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9lY2FsbF91
KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+Pj4gIAo+Pj4gIAkJc3lzY2FsbCA9IHN5c2NhbGxfZW50
ZXJfZnJvbV91c2VyX21vZGUocmVncywgc3lzY2FsbCk7Cj4+PiAgCj4+PiAtCQlpZiAoc3lzY2Fs
bCA8IE5SX3N5c2NhbGxzKQo+Pj4gKwkJaWYgKHN5c2NhbGwgPiAtMSAmJiBzeXNjYWxsIDwgTlJf
c3lzY2FsbHMpCj4+PiAgCQkJc3lzY2FsbF9oYW5kbGVyKHJlZ3MsIHN5c2NhbGwpOwo+Pj4gIAkJ
ZWxzZQo+Pj4gIAkJCXJlZ3MtPmEwID0gLUVOT1NZUzsKPj4+Cj4+Pgo+Pj4gLi4uZWFzaWVyIHRv
IHJlYWQ/Cj4+Pgo+Pj4KPj4+IEJqw7Zybgo+Pgo+PiBJdCBzZWVtcyB0aGF0IHlvdXIgY2hhbmdl
IHR1cm4gaXQgYmFjayB0byB0aGUgYmVnaW5uaW5nLiBJZiBzeXNjYWxsID09IC0xLAo+PiBpdCBp
cyBzdXBwb3NlZCB0byBnbyBuZWl0aGVyIGZpcnN0IG5vciBlbHNlIGJyYW5jaC4gSXQgc2hvdWxk
IGRvIE5PVEhJTkcuCj4+IEhvd2V2ZXIgaXQgd2FzIHN0aWxsIGEgZ3JlYXQgaWRlYS4gSXQgbWF5
IGJlIGJldHRlciB0byB1c2UgYSBzZXQgb2YgaWYtc3RhdGVtZW50Cj4+IHRvIGNsYXJpZnkgdGhl
IGxvZ2ljLgo+IAo+IEFoLCBnb3RjaGEhIChOb3RpY2UgdGhhdCBhcmNoL3g4Ni9lbnRyeS9jb21t
b24uYyBoYXMKPiAKPiAgIHwgCWlmICghZG9fc3lzY2FsbF94NjQocmVncywgbnIpICYmICFkb19z
eXNjYWxsX3gzMihyZWdzLCBucikgJiYgbnIgIT0gLTEpIHsKPiAKPiBhbmQgaW4gZG9fc3lzY2Fs
bF94NjQoKQo+IAo+ICAgfCAJLyoKPiAgIHwgCSAqIENvbnZlcnQgbmVnYXRpdmUgbnVtYmVycyB0
byB2ZXJ5IGhpZ2ggYW5kIHRodXMgb3V0IG9mIHJhbmdlCj4gICB8IAkgKiBudW1iZXJzIGZvciBj
b21wYXJpc29ucy4KPiAgIHwgCSAqLwo+ICAgfCAJdW5zaWduZWQgaW50IHVuciA9IG5yOwo+IAo+
IAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzLmMKPj4gaW5kZXggZjkxMGRmY2NiZjVkMi4uZDBiZDcyNTI0NDU5NCAxMDA2
NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+PiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwcy5jCj4+IEBAIC0zMDYsNyArMzA2LDkgQEAgYXNtbGlua2FnZSBfX3Zpc2li
bGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCj4+ICAKPj4gIAkJc3lzY2FsbCA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUocmVn
cywgc3lzY2FsbCk7Cj4+ICAKPj4gLQkJaWYgKHN5c2NhbGwgPCBOUl9zeXNjYWxscykKPj4gKwkJ
aWYgKHN5c2NhbGwgPT0gLTEpCj4+ICsJCQkvLyBEbyBub3RoaW5nCj4+ICsJCWVsc2UgaWYgKHN5
c2NhbGwgPCBOUl9zeXNjYWxscykKPj4gIAkJCXN5c2NhbGxfaGFuZGxlcihyZWdzLCBzeXNjYWxs
KTsKPj4gIAkJZWxzZQo+PiAgCQkJcmVncy0+YTAgPSAtRU5PU1lTOwo+IAo+IE1heWJlIHNvbWV0
aGluZyBhIGJpdCBtb3JlIGV4cGxpY2l0Pwo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IGluZGV4IGY5MTBkZmNj
YmY1ZC4uNWNlZjcyODc0NTQyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
LmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gQEAgLTI5Nyw2ICsyOTcsMTAg
QEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX2JyZWFr
KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2Vj
dGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgewo+ICAJ
aWYgKHVzZXJfbW9kZShyZWdzKSkgewo+ICsJCS8qCj4gKwkJICogQ29udmVydCBuZWdhdGl2ZSBu
dW1iZXJzIHRvIHZlcnkgaGlnaCBhbmQgdGh1cyBvdXQgb2YgcmFuZ2UKPiArCQkgKiBudW1iZXJz
IGZvciBjb21wYXJpc29ucy4KPiArCQkgKi8KPiAgCQl1bG9uZyBzeXNjYWxsID0gcmVncy0+YTc7
Cj4gIAo+ICAJCXJlZ3MtPmVwYyArPSA0Owo+IEBAIC0zMDgsNyArMzEyLDcgQEAgYXNtbGlua2Fn
ZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpCj4gIAo+ICAJCWlmIChzeXNjYWxsIDwgTlJfc3lzY2FsbHMpCj4gIAkJCXN5
c2NhbGxfaGFuZGxlcihyZWdzLCBzeXNjYWxsKTsKPiAtCQllbHNlCj4gKwkJZWxzZSBpZiAoKGxv
bmcpc3lzY2FsbCAhPSAtMUwpCj4gIAkJCXJlZ3MtPmEwID0gLUVOT1NZUzsKPiAgCj4gIAkJc3lz
Y2FsbF9leGl0X3RvX3VzZXJfbW9kZShyZWdzKTsKPiAKPiAKPiBCasO2cm4KCk9rLCBJIHdpbGwg
c2VuZCB2My4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
