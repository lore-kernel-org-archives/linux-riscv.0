Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8EBC3ABD8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 12:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sRzlA02rG5178DGDR/+fXnhHEJmM59aMFvmgz1Sk9oo=; b=Nb8X6k2o69JGVB
	cj/u7V7aEVvg+7VrDmY8RhKuq0JD1dK6GARm9HvojJgBsN7MrQXlq8GFkkduruOBUv9ORMfTBHV7Y
	U8/WVTDCLYZrmCPM5KYl/xEgTzInC1G32XkZ67wUkeV/++alT347F6gaCNRRYvSWzKYwnMPamJPKZ
	WIXDzAO40sxAoEmehBcEtxzxuayYJJ7m52S5sSJy2vB4vsL9+wsbol7yWz9rV9WzvclelcRqPaA+h
	Fiv+o9LXYCh/RP28OJj9o/n7slI3YPyLRaj/hsrwPpcankW7D0Pe6v6/X1XwxmUn8w7BmcBehdZ0M
	mMHEV+NIqUFhJV7jym3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuLK-00000003PIX-3i0p;
	Fri, 16 May 2025 12:39:14 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuLI-00000003PHY-0bcP
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 12:39:14 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ad51ba0af48so286922566b.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747399150; x=1748003950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7oP/zLljTZnogybPTM7wMGdNzWkdEVn7QUgHEuDqyw=;
        b=B+VaBZyVgGVg8bOM9jku/U1LqPkl2YNXaN65Su/xnW0EJqM8KjNc6wmwzIl4N8mngL
         XQfJOU7uucFBkcxdPVR7fo2O0v54zPdTuN+bIl9DbIa2pPn60ASzgKPIkYEMjn0dpidM
         QVbCI2qCdenCeh5DI9QWTeh6/jaO76nnj3X577lEZdRNXW2xYUjj0KW6kT2KSFP4YwMW
         z/yqTpNI5r3WjGsfxpOAE8A9ZCPia77NqW2R2EiUAIG7GaY0luTXd2hNZA/BpfcW0VMT
         LvTQSDON4v0kMWwH+Ma8KpoGqdH7DFUZc5f61Qzb9orC4Gu4/TPNnpt6YAx7iENxd27e
         82qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747399150; x=1748003950;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7oP/zLljTZnogybPTM7wMGdNzWkdEVn7QUgHEuDqyw=;
        b=w4NDP1kOD8QT2yKAct894y+M1k6zplRQdPAgT+Hioc9gm6ZzAhF+kOgTULOVRTLVei
         KelbCLHUW6nuZ96xYy/3NcoyOYtf1naXWkRKHgFL7oTkHYajbuNA93MchI74vmY5muMh
         wtKh2phi/Z0DFx+3z6e967S3Sgcj6f27D4yUCIMa8GF3OxgvZMADXfqFEz29ZoZKpy2I
         +LHY/kQSv3krs/jX/gSUwjN89ZTcGfqQ/7GbGXiiOk4Pe6pFq+DIqO5PInN+42GzAn3Z
         Iew0KBWw3XoCwCfv4NjjATO8cr1P/JbvthKaqfRt17VcqTMuODjSCZjo99VTNQNqDf5q
         xIbw==
X-Forwarded-Encrypted: i=1; AJvYcCV4ds5NLqiMis4OLC67vx52RpsuzhxmJF4TW6cL6yMqr0g3FRnVY+3FX/5N3eAZ1RHMcvNouCjRBMu7rg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUO/oJ1IzfhDzzXFgEl+G1hmdm6dJT+DJ1ZzZ1gCghctclkKHK
	rAf2WPC30+fCxJerLBF3QEZmyRE8Yb1ZIqJ+MtTXOGHllJ19lpjP1mZOYcZpLCkl+K8QMDOEmpc
	2oC2RGMM=
X-Gm-Gg: ASbGncsnwfA+er2JZ6vg4WshGX+ofa5Nk6iPQvIaJZT2RpGMJg1MHibs34iojLEIOzT
	htak9TD107mwkpE2x05mEbQOQ/6EfGs7E7Y4Tm+io58KeJhtsr0uJK79u7Hkq4X2R1i1OmV6TX4
	qX5P5pFbpHv9s2NlfaBkP6u/oNzxIJVVOS9ShFVH+bqyGretv8WFtEs5YRJxZ1xPX9FoeCRUjrz
	MblAVFoHk9qwuLZUtYPxG6jVj/LkxDxQHSAxepq9M3nywc00zYKZybWRkZdsw7YrAu0oJ758wo9
	BXcLUDnH1Vx/Zc7C/aKkM3zG25zWDiFcZMtvdrY0bpCgZ++Asd8jw4zOIw==
X-Google-Smtp-Source: AGHT+IEIP3JUo4/gXsU3fbvKdiE+stLoARyyOdwaLPtOpDK0xW0RFEgVI9pNgG5UTxsDu4I2grbQIg==
X-Received: by 2002:a17:907:3fa0:b0:ad4:f5f1:28cf with SMTP id a640c23a62f3a-ad50f82067fmr632543466b.25.1747399150339;
        Fri, 16 May 2025 05:39:10 -0700 (PDT)
Received: from ?IPv6:::1? ([2a00:11b1:101e:447e:2959:9e3d:ac05:c19d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4383a6sm153554466b.120.2025.05.16.05.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 05:39:09 -0700 (PDT)
Date: Fri, 16 May 2025 14:39:06 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@rivosinc.com>
CC: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] RISC-V: KVM: Remove scounteren initialization
In-Reply-To: <CAAhSdy38s0WWc7Cv4KF+0_pGC3xKU3_PLgeedz7Pu04-xKm4jw@mail.gmail.com>
References: <20250515-fix_scounteren_vs-v3-1-729dc088943e@rivosinc.com> <CAAhSdy38s0WWc7Cv4KF+0_pGC3xKU3_PLgeedz7Pu04-xKm4jw@mail.gmail.com>
Message-ID: <70DD7215-76A0-493C-87CA-60A605842B44@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_053912_180592_3D262F1B 
X-CRM114-Status: GOOD (  17.84  )
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

T24gTWF5IDE2LCAyMDI1IDI6MTg6MTggUE0gR01UKzAyOjAwLCBBbnVwIFBhdGVsIDxhbnVwQGJy
YWluZmF1bHQub3JnPiB3cm90ZToKPk9uIEZyaSwgTWF5IDE2LCAyMDI1IGF0IDQ6NDHigK9BTSBB
dGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+Cj4+IFNjb3VudGVyZW4g
Q1NSIGNvbnRyb2xzIHRoZSBkaXJlY3QgYWNjZXNzIHRoZSBocG1jb3VudGVycyBhbmQgY3ljbGUv
Cj4+IGluc3RyZXQvdGltZSBmcm9tIHRoZSB1c2Vyc3BhY2UuIEl0J3MgdGhlIHN1cGVydmlzb3In
cyByZXNwb25zaWJpbGl0eQo+PiB0byBzZXQgaXQgdXAgY29ycmVjdGx5IGZvciBpdCdzIHVzZXIg
c3BhY2UuIFRoZXkgaHlwZXJ2aXNvciBkb2Vzbid0Cj4+IG5lZWQgdG8gZGVjaWRlIHRoZSBwb2xp
Y3kgb24gYmVoYWxmIG9mIHRoZSBzdXBlcnZpc29yLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBdGlz
aCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+IENoYW5nZXMgaW4gdjM6Cj4+
IC0gUmVtb3ZlZCB0aGUgcmVkdW5kYW50IGRlY2xhcmF0aW9uCj4+IC0gTGluayB0byB2MjogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDUxNS1maXhfc2NvdW50ZXJlbl92cy12Mi0xLTFm
ZDhkYzA2OTNlOEByaXZvc2luYy5jb20KPj4KPj4gQ2hhbmdlcyBpbiB2MjoKPj4gLSBSZW1vdmUg
dGhlIHNjb3VudGVyZW4gaW5pdGlhbGl6YXRpb24gaW5zdGVhZCBvZiBqdXN0IHNldHRpbmcgdGhl
IFRNIGJpdC4KPj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUw
NTEzLWZpeF9zY291bnRlcmVuX3ZzLXYxLTEtYzFmNTJhZjkzYzc5QHJpdm9zaW5jLmNvbQo+PiAt
LS0KPj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyB8IDQgLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQs
IDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPj4gaW5kZXggNjBkNjg0Yzc2YzU4Li45YmZhYWU5YTEx
ZWEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+PiArKysgYi9hcmNoL3Jp
c2N2L2t2bS92Y3B1LmMKPj4gQEAgLTExMSw3ICsxMTEsNiBAQCBpbnQga3ZtX2FyY2hfdmNwdV9j
cmVhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+PiAgewo+PiAgICAgICAgIGludCByYzsKPj4g
ICAgICAgICBzdHJ1Y3Qga3ZtX2NwdV9jb250ZXh0ICpjbnR4Owo+PiAtICAgICAgIHN0cnVjdCBr
dm1fdmNwdV9jc3IgKnJlc2V0X2NzciA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X3Jlc2V0X2NzcjsKPj4K
Pj4gICAgICAgICBzcGluX2xvY2tfaW5pdCgmdmNwdS0+YXJjaC5tcF9zdGF0ZV9sb2NrKTsKPj4K
Pj4gQEAgLTE0Niw5ICsxNDUsNiBAQCBpbnQga3ZtX2FyY2hfdmNwdV9jcmVhdGUoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KQo+PiAgICAgICAgIGlmIChrdm1fcmlzY3ZfdmNwdV9hbGxvY192ZWN0b3Jf
Y29udGV4dCh2Y3B1LCBjbnR4KSkKPj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+
Pgo+PiAtICAgICAgIC8qIEJ5IGRlZmF1bHQsIG1ha2UgQ1ksIFRNLCBhbmQgSVIgY291bnRlcnMg
YWNjZXNzaWJsZSBpbiBWVSBtb2RlICovCj4+IC0gICAgICAgcmVzZXRfY3NyLT5zY291bnRlcmVu
ID0gMHg3Owo+PiAtCj4+ICAgICAgICAgLyogU2V0dXAgVkNQVSB0aW1lciAqLwo+PiAgICAgICAg
IGt2bV9yaXNjdl92Y3B1X3RpbWVyX2luaXQodmNwdSk7Cj4+Cj4+Cj4+IC0tLQo+PiBiYXNlLWNv
bW1pdDogMDFmOTU1MDBhMTYyZmNhODhjZWZhYjllZDY0Y2VkZWQ1YWZhYmMxMgo+PiBjaGFuZ2Ut
aWQ6IDIwMjUwNTEzLWZpeF9zY291bnRlcmVuX3ZzLWZkZDg2MjU1YzdiNwo+PiAtLQo+Cj5PdmVy
YWxsLCB0aGlzIGxvb2tzIGdvb2QuCj4KPlJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJy
YWluZmF1bHQub3JnPgo+Cj5DdXJyZW50bHksIHRoZSBzY291bnRlcmVuLlRNIGJpdCBpcyBvbmx5
IHNldCBieSB0aGUgTGludXggU0JJIFBNVQo+ZHJpdmVyIGJ1dCBLVk0gUklTQy1WIG9ubHkgcHJv
dmlkZXMgU0JJIFBNVSBmb3IgZ3Vlc3Qgd2hlbgo+U3Njb2ZwbWYgaXMgYXZhaWxhYmxlIGluIGhv
c3Qgc28gd2UgbmVlZCB0aGUgYmVsb3cgaHVuayB0bwo+Y29tcGxldGVseSBnZXQgcmlkLW9mZiBz
Y291bnRlcmVuIGluaXRpYWxpemF0aW9uIGluIEtWTSBSSVNDLVYuCj4KPmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPmluZGV4
IDM1NmQ1Mzk3YjJhMi4uYmRmMzM1MmFjZjRjIDEwMDY0NAo+LS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvaGVhZC5TCj4rKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPkBAIC0xMzEsNiArMTMx
LDEyIEBAIHNlY29uZGFyeV9zdGFydF9zYmk6Cj4gICAgIGNzcncgQ1NSX0lFLCB6ZXJvCj4gICAg
IGNzcncgQ1NSX0lQLCB6ZXJvCj4KPisjaWZuZGVmIENPTkZJR19SSVNDVl9NX01PREUKPisgICAg
LyogRW5hYmxlIHRpbWUgQ1NSICovCj4rICAgIGxpIHQwLCAweDIKPisgICAgY3NydyBDU1JfU0NP
VU5URVJFTiwgdDAKPisjZW5kaWYKPisKPiAgICAgLyogTG9hZCB0aGUgZ2xvYmFsIHBvaW50ZXIg
Ki8KPiAgICAgbG9hZF9nbG9iYWxfcG9pbnRlcgo+Cj5AQCAtMjI2LDYgKzIzMiwxMCBAQCBTWU1f
Q09ERV9TVEFSVChfc3RhcnRfa2VybmVsKQo+ICAgICAgKiB0byBoYW5kIGl0IHRvIHVzLgo+ICAg
ICAgKi8KPiAgICAgY3NyciBhMCwgQ1NSX01IQVJUSUQKPisjZWxzZQo+KyAgICAvKiBFbmFibGUg
dGltZSBDU1IgKi8KPisgICAgbGkgdDAsIDB4Mgo+KyAgICBjc3J3IENTUl9TQ09VTlRFUkVOLCB0
MAo+ICNlbmRpZiAvKiBDT05GSUdfUklTQ1ZfTV9NT0RFICovCj4KPiAgICAgLyogTG9hZCB0aGUg
Z2xvYmFsIHBvaW50ZXIgKi8KPgo+SSBoYXZlIHF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC02
LjE2IHdpdGggdGhlIGFib3ZlIGh1bmsgc3F1YXNoZWQuCj4KPlRoYW5rcywKPkFudXAKPgo+LS0g
Cj5rdm0tcmlzY3YgbWFpbGluZyBsaXN0Cj5rdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YKCll1
cCwgSSBoYWQgcGxhbm5lZCB0byBwb3N0IHNvbWV0aGluZyBsaWtlIHRoYXQgdG9vLCBidXQgZGlk
bid0IGdldCB0byBpdC4KClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
