Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12CFC3ABBE
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 02:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSGy7u8fXAkKtkw3hF1roJ+qhASlyGGpJRZPDNU1KSM=; b=wMEmj4ns/yd8DV
	INJXwj4h4ZfnsTzLXHmC/RnTMuGn0zDT/S8L8bLcDCcG95jZt1HkA5fiOtiYBsRAdwod65e90xBgu
	NaZl0ZmEb7aPYwM5UZSBitWJoktInLpjxZR0jp6cY1Rykl+eKJBQa6RvzyYc7mzFqr2oUbhAN6/Cs
	VgBKeqWte3vN0VEbKW1qJzng6RGcQHeAeiIC8lkfq4ZAGGr1yBhRMJQSbh4gYQ7l8895KUTuAEtMs
	vbI/iQHhF1mS0rn07qqGRzyAJP8r/d9rYdSeRYxiVy81U48OAQ5Zl10s0IJ+qja8fkWX8j8Pwhf4p
	gBNcHjwjZCk3ERShao8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUci-0000000DyIe-1uHn;
	Wed, 07 May 2025 02:35:04 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQnY-0000000Db9e-35qh
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 22:30:02 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3d4436ba324so54196155ab.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 15:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1746570599; x=1747175399; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SCwGjdwjpKLNM5KZLRpAtXiKYebm5Y/Ythf2Zq+Ja2M=;
        b=LEVsXvdlZce4/LHbArHQ5Yf6i3fmSPEOxXUubrGUfNm/g7jvKgGskTuw6gGCm1s1i0
         YgRWArgNs1YXqru3d2yg8q5PjpbYzhhNygthds6KjuR1rsqdV4tnkDobiEJ80cKf/Jge
         ReGSY+9qkZMqLv+HqjqmTkIznHrEC7LemciOBFht8LEye4+C3i53DzYio/gvMw9RsKsX
         /1lnpGv9K/007a/N7jk6a1kkwiXo0YaqVo0JEQOEV4X072iWkuOFSKvUllvyflYBsXly
         1qLzZh70cKn+cblP9SWi8V8VbcfeyU9svVbfEf44iMtW2XfpjxyZ1VjYjUYy5X2mSsKW
         t2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746570599; x=1747175399;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SCwGjdwjpKLNM5KZLRpAtXiKYebm5Y/Ythf2Zq+Ja2M=;
        b=ip2NqF0JiugYVId/8XNrCzLFUGDUX/5KCZgxvZpREfFyoUiCdJDqXMmcQehHMbwzs9
         UMgyYeS2DTD/KY4WXDoNVFb5T6RyMQIsCiQQp6R7wzaupjcglUbTT2S7Jy3vNkkbLgB5
         rtOwxnV8UushkVe3u7fMFROFMLik34z+r8ephWmoPyPJPOc8dEiKcuwsSPnBOdI7HiC0
         QQ1AsKNPfG95FVBrenEV0k8xWVsH7uLLDZZ5BDrbPyDG2Xl7xjwFKgEXlkIJ6HTymXdS
         FZHFPhHEHHimyZuMowJCljd+iMAZ4+2J6TQ1azEc65Th/LCtMplE9V9mcYgot73p5SAt
         zhvw==
X-Forwarded-Encrypted: i=1; AJvYcCVwD1kyhdlMBw/zvuglHtkqGQKRyrae/lG3hJlTE49g3icQ2IvkQrmgQ55F+aAfAgpRJk/IRPKvQ/5CAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOJxi69w+XzGk8WMWrEJKsbVRr+9gjK3dj9DkcVfPnxhDuy8o1
	DJxyG0ZHRbx44s7gJZzuX+EqaitUb+7Xdsedai05hq4N0pE+LcmVyxf5H5uuugo=
X-Gm-Gg: ASbGncueAL8VpIQGqAvf/aUPxj+kk49zPoexonrocRPl0Vuktqi7bjPbsH1wEh5CCy3
	C1m+9Gsut1awLrdaN0UdaZqrbk7qJ57GMpZDraPZXkanTH41o5D1Y4jjbMOBJakI1mdVH4wlq9r
	yDU1VjFhKi5bHiGT11dS7RB021m0gdAiprOOFjwQuMcaIAGbzu23m8flbu22INQ0fyRbBhdFaCR
	EjRnHvGRnc5hhxUwfW/qYNAL00mKhZwcPCD6JcvQOkNCqbOlGAlvQS0J5J0YuxkVsWxctUi6q2i
	SsVcUI/EP2lIO5wnjxPQzP0R7ZCy4AxQA7hb2qKmuUAZcCGfw+5iRCq6iU8=
X-Google-Smtp-Source: AGHT+IEih0KzXWXM0XtCUjjjzNoININkRib/BptoTLpxhmPB23ixs92kuTJei7p+NLVoydHjeMBtvA==
X-Received: by 2002:a05:6e02:258c:b0:3d4:2409:ce6 with SMTP id e9e14a558f8ab-3da738ed7a5mr10084615ab.5.1746570599214;
        Tue, 06 May 2025 15:29:59 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.12.183])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d975ec99b7sm26935555ab.36.2025.05.06.15.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 15:29:58 -0700 (PDT)
Message-ID: <49897822-76c4-45c5-87ff-085c3f6fb318@sifive.com>
Date: Tue, 6 May 2025 17:29:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL
To: Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250504101920.3393053-1-namcao@linutronix.de>
 <c59f2632-d96f-43c6-869d-5e5f743f2dbd@ghiti.fr>
 <20250505160722.s_w3u1pd@linutronix.de>
 <d7232e99-e899-4e50-b60f-2527be709d2c@ghiti.fr>
 <570ce61a-00ca-446f-ae89-7ab7c340828f@ghiti.fr>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <570ce61a-00ca-446f-ae89-7ab7c340828f@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_153000_797292_2F2298A9 
X-CRM114-Status: GOOD (  21.48  )
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

T24gMjAyNS0wNS0wNiAxMTozMSBBTSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IE9uIDA1LzA1
LzIwMjUgMjE6MjcsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4gT24gMDUvMDUvMjAyNSAxODow
NywgTmFtIENhbyB3cm90ZToKPj4+IEhpIEFsZXgsCj4+Pgo+Pj4gT24gTW9uLCBNYXkgMDUsIDIw
MjUgYXQgMDY6MDI6MjZQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+Pj4+IE9uIDA0
LzA1LzIwMjUgMTI6MTksIE5hbSBDYW8gd3JvdGU6Cj4+Pj4+IFdoZW4gdXNlcnNwYWNlIGRvZXMg
UFJfU0VUX1RBR0dFRF9BRERSX0NUUkwsIGJ1dCBTdXBtIGV4dGVuc2lvbiBpcyBub3QKPj4+Pj4g
YXZhaWxhYmxlLCB0aGUga2VybmVsIGNyYXNoZXM6Cj4+Pj4+Cj4+Pj4+IE9vcHMgLSBpbGxlZ2Fs
IGluc3RydWN0aW9uIFsjMV0KPj4+Pj4gwqDCoMKgwqDCoCBbc25pcF0KPj4+Pj4gZXBjIDogc2V0
X3RhZ2dlZF9hZGRyX2N0cmwrMHgxMTIvMHgxNWEKPj4+Pj4gwqDCoCByYSA6IHNldF90YWdnZWRf
YWRkcl9jdHJsKzB4NzQvMHgxNWEKPj4+Pj4gZXBjIDogZmZmZmZmZmY4MDAxMWFjZSByYSA6IGZm
ZmZmZmZmODAwMTFhMzAgc3AgOiBmZmZmZmZjNjAwMzliZTEwCj4+Pj4+IMKgwqDCoMKgwqAgW3Nu
aXBdCj4+Pj4+IHN0YXR1czogMDAwMDAwMDIwMDAwMDEyMCBiYWRhZGRyOiAwMDAwMDAwMDEwYTc5
MDczIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDAyCj4+Pj4+IMKgwqDCoMKgwqAgc2V0X3RhZ2dlZF9h
ZGRyX2N0cmwrMHgxMTIvMHgxNWEKPj4+Pj4gwqDCoMKgwqDCoCBfX3Jpc2N2X3N5c19wcmN0bCsw
eDM1Mi8weDczYwo+Pj4+PiDCoMKgwqDCoMKgIGRvX3RyYXBfZWNhbGxfdSsweDE3Yy8weDIwYwo+
Pj4+PiDCoMKgwqDCoMKgIGFuZGxlX2V4Y2VwdGlvbisweDE1MC8weDE1Ywo+Pj4+Cj4+Pj4gSXQg
c2VlbXMgbGlrZSB0aGUgY3NyIHdyaXRlIGlzIHRyaWdnZXJpbmcgdGhpcyBpbGxlZ2FsIGluc3Ry
dWN0aW9uLCBjYW4geW91Cj4+Pj4gY29uZmlybSBpdCBpcz8KPj4+IFllcywgaXQgaXMgdGhlICJj
c3Jfd3JpdGUoQ1NSX0VOVkNGRywgZW52Y2ZnKTsiIGluIGVudmNmZ191cGRhdGVfYml0cygpLgo+
Pj4KPj4+PiBJZiBzbywgSSBjYW4ndCBmaW5kIGluIHRoZSBzcGVjaWZpY2F0aW9uIHRoYXQgYW4g
aW1wbGVtZW50YXRpb24gc2hvdWxkIGRvCj4+Pj4gdGhhdCB3aGVuIHdyaXRpbmcgZW52Y2ZnIGFu
ZCBJIGNhbid0IHJlcHJvZHVjZSBpdCBvbiBxZW11LiBXaGVyZSBkaWQgeW91Cj4+Pj4gc2VlIHRo
aXMgb29wcz8KPj4+IEkgY2FuJ3QgZmluZCBpdCBpbiB0aGUgc3BlYyBlaXRoZXIuIEkgdGhpbmsg
aXQgaXMgdXAgdG8gdGhlIGltcGxlbWVudGF0aW9uLgo+Pgo+Pgo+PiBUaGUgcmVzZXJ2ZWQgZmll
bGRzIG9mIHNlbnZjZmcgYXJlIFdQUkkgYW5kIGNvbnRyYXJ5IHRvIFdMUkwsIGl0IGRvZXMgbm90
Cj4+IGV4cGxpY2l0bHkgInBlcm1pdCIgdG8gcmFpc2UgYW4gaWxsZWdhbCBpbnN0cnVjdGlvbiBz
byBJJ2Qgc2F5IGl0IGlzIG5vdCB1cCB0bwo+PiB0aGUgaW1wbGVtZW50YXRpb24sIEknbGwgYXNr
IGFyb3VuZC4KPiAKPiAKPiBTbyBJIGhhZCBjb25maXJtYXRpb24gdGhhdCBXUFJJIHNob3VsZCBu
b3QgcmFpc2UgYW4gaWxsZWdhbCBpbnN0cnVjdGlvbiBzbwo+IHRoYXQncyBhbiBpc3N1ZSB3aXRo
IHRoZSBwbGF0Zm9ybS4gWW91ciBwYXRjaCBpcyBub3Qgd3JvbmcgYnV0IEknZCByYXRoZXIgaGF2
ZQo+IGFuIGV4cGxpY2l0IGVycmF0YSwgd2hhdCBkbyB5b3UgdGhpbms/CgpUaGVyZSBpcyBubyBl
cnJhdHVtIGhlcmUuIEFsbHdpbm5lciBEMSAvIFQtSEVBRCBDOTA2IGltcGxlbWVudHMgU3MxcDEx
LCB3aGljaAp3YXMgYmVmb3JlIHNlbnZjZmcgd2FzIGFkZGVkIHRvIHRoZSBwcml2aWxlZ2VkIGFy
Y2hpdGVjdHVyZSwgYW5kIGRvZXMgbm90CmltcGxlbWVudCBhbnkgb2YgdGhlIGV4dGVuc2lvbnMg
d2hpY2ggd291bGQgaW1wbHkgc2VudmNmZydzIGV4aXN0ZW5jZSwgc28gdGhlCkNTUiBpcyByZXNl
cnZlZC4gV2UgY291bGQgY2hlY2sgZm9yIFhsaW51eGVudmNmZyB0byBkZXRlcm1pbmUgaWYgdGhl
IENTUiBhY2Nlc3MKd2lsbCByYWlzZSBhbiBleGNlcHRpb24sIGJ1dCB0aGF0IGRvZXMgbm90IGdh
aW4gYW55dGhpbmcgb3ZlciBjaGVja2luZyBmb3IgU3VwbQpzcGVjaWZpY2FsbHkuIFNvIHRoZSBm
aXggaXMgY29ycmVjdC4KClJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxh
bmRAc2lmaXZlLmNvbT4KClRoYXQgc2FpZCwgSSB3b25kZXIgaWYgc2V0X3RhZ2dlZF9hZGRyX2N0
cmwodGFzaywgMCkgc2hvdWxkIHN1Y2NlZWQgd2hlbiBTdXBtIGlzCm5vdCBpbXBsZW1lbnRlZCwg
bWF0Y2hpbmcgZ2V0X3RhZ2dlZF9hZGRyX2N0cmwoKS4gV2l0aG91dCBTdXBtLCB3ZSBrbm93IHRo
YXQKaGF2ZV91c2VyX3BtbGVuXzcgYW5kIGhhdmVfdXNlcl9wbWxlbl8xNiB3aWxsIGJvdGggYmUg
ZmFsc2UsIHNvIHBtbGVuID09IDAgaXMKdGhlIG9ubHkgY2FzZSB3aGVyZSB3ZSB3b3VsZCBjYWxs
IGVudmNmZ191cGRhdGVfYml0cygpLiBBbmQgd2Uga25vdyBpdCB3b3VsZCBiZQphIG5vLW9wLiBT
byBhbiBhbHRlcm5hdGl2ZSBmaXggd291bGQgYmUgdG8gcmV0dXJuIDAgYmVsb3cgdGhlIHBtbGVu
IGNoZWNrczoKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKaW5kZXggN2MyNDRkZTc3MTgwLi41MzZkYTlhYTY5MGUg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYworKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9wcm9jZXNzLmMKQEAgLTMwOSw2ICszMDksOSBAQCBsb25nIHNldF90YWdnZWRfYWRk
cl9jdHJsKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywgdW5zaWduZWQKbG9uZyBhcmcpCiAJaWYg
KCEoYXJnICYgUFJfVEFHR0VEX0FERFJfRU5BQkxFKSkKIAkJcG1sZW4gPSBQTUxFTl8wOwoKKwlp
ZiAoIXJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9TVVBNKSkKKwkJ
cmV0dXJuIDA7CisKIAlpZiAobW1hcF93cml0ZV9sb2NrX2tpbGxhYmxlKG1tKSkKIAkJcmV0dXJu
IC1FSU5UUjsKCgpCdXQgSSBkb24ndCBrbm93IGlmIHRoaXMgYmV0dGVyIG1hdGNoZXMgd2hhdCB1
c2Vyc3BhY2Ugd291bGQgZXhwZWN0LgoKUmVnYXJkcywKU2FtdWVsCgo+Pj4gSSBnb3QgdGhpcyBj
cmFzaCBvbiB0aGUgTWFuZ29QSSBib2FyZDoKPj4+IGh0dHBzOi8vbWFuZ29waS5vcmcvbXFwcm8K
Pj4+Cj4+PiBCZXN0IHJlZ2FyZHMsCj4+PiBOYW0KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
