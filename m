Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F1DE77198
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 10:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6st5HImeAfo0JviZeriCBT7XOewGTI9jmoMnshULqhk=; b=Ae0oxLQyC+Npt8
	oq/dNezW5QvflEQqeixVY4ui3G6mlp3GMR2Yu3nHLTVs+IXIFSMIWl34/cI/mH9mR/tV7BK77VTpw
	JqR3chHHvMYqsBKrpGsMKLnAudiHl9JVDVXiysrLDKk+5p7hBoFWVlhQOCnjMO6N4SN83FTqHoX8t
	1jE7ya1AtdE5UXnaDq0Sr3zW0CcgBEIWvi3DPjP+9cATBr2T37cTJ0E3azhB14cS7cxSaQyIwfAVu
	EyqCMlfa0Fq67TdJ/i9BVsa2gwtlkjaQ/IKwIwoUrkPFpGmKgFfwgsvetX/n4/19lHEb/Xm46zdvH
	bJOOtiQyXgS88sPvaEGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7BL-00000004Rwk-28p8;
	Tue, 07 Jan 2025 10:51:31 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7BG-00000004Rsr-2YhK
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 10:51:30 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21628b3fe7dso217234185ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jan 2025 02:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736247083; x=1736851883; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubzgdL9cLh9waK09x12ru+nh0CrFzuM9srghqESdiGM=;
        b=K2WAVITR6qCAfYUnqSmGwHk6ovDRVyt5pNe+So3mJ+mxDisC9GxckfFTgaKYVwhmql
         xtBQcnUzEVFf4mcWtUMHJf4+BVNrxPV1SwsBQlBRYFoJYf1FYfpq6B+CPY4t10vCwUKC
         bt/9BDNkX+AbSr7Tc5H6IfuJlq4Dv0GKBYOhUfdvAslOb6DErOw9eMur1KqRxux8WJKl
         F8E44ZnjYnPalWoQlC3PUMmDDI+gEKQMNJQVe9eG88Yj45bBbZZEyUJryDky9V+3DCuY
         GQI7DQIICYUxBfhKH01CT8OlJ4cIT60qsO1l6U+K28vkgP1dUxoXI/Fze31bTtybPswQ
         m6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247083; x=1736851883;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubzgdL9cLh9waK09x12ru+nh0CrFzuM9srghqESdiGM=;
        b=ifmB43+1RQdJUAds40stQ7nquF0wFwlHT4XCBummg+wVnb7NQWOMl32kWwe6lsdORv
         NtNadWM3ZfB+G7M0VsV8Sqj8ZNewdRaAoP9C7ieNBskgb3wUW20jnoBMdqwxRqYUZGPg
         Ww/Hu+s3ejQVLSzPhoP880gnnwspPqgkQ5WXQ6s2yBSkO7s5xv0xq+5TQFiVn4Zjgo9H
         /mfNjNPGpXMrYrb2Cih9Kfy/EyYaIXGoeOtCPuWQwxGAhZwnsiG1AaHomITwBhUfkPv/
         eS8r8z76uBCB3W9pYGr2R5XKDSiMcuYR2R0eTuLTvginWI7jeNfDRtHn3u7Po92LYudN
         G33g==
X-Forwarded-Encrypted: i=1; AJvYcCV9dEhtYagRzStgAQYOUr3b8kRI/dQ+9UtrBEl5wPLHt2Mo1OdLTurzLOdw0Lq3gWcBAx7PIKPZWHmqcA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzU4s7BVP0hehNePm7W/Yioe8bAC9LPqGjse31z+rbDc9AGl7aA
	CXRtVNvNh91gX/Y2dK9znZkcAtOqs7+9cX31Kzuxvd4GpPoFpR5n/zHIDKFHUDY=
X-Gm-Gg: ASbGnctyMeKFMtFp37Vih9arUrrziUlyIqbSEooiCI21M0/FC9pft+wBjV82xqO0Yys
	xXwJPLslFDDsq1nr54wppyDniEOJwvVLOCR9wCd0bH7/NvUPF/gxBuyDwA5htmhczUbSfaanMwT
	e0fQBvBDwjVizB1J+enDPweRPSiX0t6EcMTp0JebMToVIkxJHZqNyy4HK5GDVXPLnC1n01gNRPH
	CRO1Zlx02RR5TvPGZNtCs2A73emEe/a9HubhkhAipZdejpRN2/S2IeprA2Zycpp0PvPqjMiA8Ik
	FEua
X-Google-Smtp-Source: AGHT+IFtbfiI9xlsmfuUVQ2Vnnc4auVp2ktX/5YZgw6vYG9rwgEZ2ifuqdpGqVP2TXFmBqefmQU79g==
X-Received: by 2002:a17:902:ea08:b0:216:7410:7e14 with SMTP id d9443c01a7336-219e6eb5c15mr809959765ad.34.1736247082763;
        Tue, 07 Jan 2025 02:51:22 -0800 (PST)
Received: from [10.4.33.153] ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca025d1sm307318475ad.254.2025.01.07.02.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 02:51:22 -0800 (PST)
Message-ID: <07e0c05f-cb69-4263-885d-6d20d4442152@bytedance.com>
Date: Tue, 7 Jan 2025 18:51:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 peterz@infradead.org, akpm@linux-foundation.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
 <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
 <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
 <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
 <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
 <d9a14211-4bbd-4fb6-ba87-a555a40bb67a@arm.com>
 <de8756aa-dbf7-4f6f-91f0-934270397192@bytedance.com>
 <ee393a7f-d01e-4e5d-9bf8-779795613af1@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ee393a7f-d01e-4e5d-9bf8-779795613af1@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_025126_656327_9A572C85 
X-CRM114-Status: GOOD (  22.18  )
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

CgpPbiAyMDI1LzEvNyAxNzo1NywgS2V2aW4gQnJvZHNreSB3cm90ZToKPiBPbiAwNi8wMS8yMDI1
IDA0OjQ5LCBRaSBaaGVuZyB3cm90ZToKPj4gWy4uLl0KPj4KPj4+IE9uY2UgdGhpcyBpcyBkb25l
LCB3ZSBzaG91bGQgYmUgYWJsZSB0byByZXBsYWNlIGFsbCB0aG9zZSBjb25mdXNpbmcKPj4+IGNh
bGxzIHRvIHRsYl9yZW1vdmVfcGFnZSgpIG9uIFBUUHMgd2l0aCB0bGJfcmVtb3ZlX3RhYmxlKCkg
YW5kIHJlbW92ZQo+Pj4gdGhlIGV4cGxpY2l0IGNhbGwgdG8gcGFnZXRhYmxlX2R0b3IoKS4gQUlV
SSB0aGlzIGlzIGVzc2VudGlhbGx5IHdoYXQKPj4+IFBldGVyIHN1Z2dlc3RlZCBvbiB2MyBbMl0u
Cj4+Cj4+IFNpbmNlIHRoaXMgcGF0Y2ggc2VyaWVzIGlzIG1haW5seSBmb3IgYnVnIGZpeCwgSSB0
aGluayB0aGF0IHRoZXNlIHRoaW5ncwo+PiBjYW4gYmUgZG9uZSBpbiBzZXBhcmF0ZSBwYXRjaCBz
ZXJpZXMgbGF0ZXIuCj4gCj4gU3VyZSB0aGF0J3MgZmFpci4KPiAKPj4KPj4+Cj4+PiBbLi4uXQo+
Pj4KPj4+PiBPciBjYW4gd2UganVzdCBub3QgbGV0IHRsYl9yZW1vdmVfdGFibGUoKSBmYWxsIGJh
Y2sgdG8KPj4+PiB0bGJfcmVtb3ZlX3BhZ2UoKT8gTGlrZSB0aGUgZm9sbG93aW5nOgo+Pj4+Cj4+
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvdGxiLmggYi9pbmNsdWRlL2FzbS1n
ZW5lcmljL3RsYi5oCj4+Pj4gaW5kZXggYTU5MjA1ODYzZjQzMS4uMzU0ZmZhYTRiZDEyMCAxMDA2
NDQKPj4+PiAtLS0gYS9pbmNsdWRlL2FzbS1nZW5lcmljL3RsYi5oCj4+Pj4gKysrIGIvaW5jbHVk
ZS9hc20tZ2VuZXJpYy90bGIuaAo+Pj4+IEBAIC0xOTUsOCArMTk1LDYgQEAKPj4+PiAgwqDCoCAq
wqAgdmFyaW91cyBwdGVwX2dldF9hbmRfY2xlYXIoKSBmdW5jdGlvbnMuCj4+Pj4gIMKgwqAgKi8K
Pj4+Pgo+Pj4+IC0jaWZkZWYgQ09ORklHX01NVV9HQVRIRVJfVEFCTEVfRlJFRQo+Pj4+IC0KPj4+
PiAgwqDCoHN0cnVjdCBtbXVfdGFibGVfYmF0Y2ggewo+Pj4+ICDCoMKgI2lmZGVmIENPTkZJR19N
TVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHJj
dV9oZWFkwqDCoMKgwqDCoMKgwqDCoCByY3U7Cj4+Pj4gQEAgLTIxOSwxNiArMjE3LDYgQEAgc3Rh
dGljIGlubGluZSB2b2lkIF9fdGxiX3JlbW92ZV90YWJsZSh2b2lkICp0YWJsZSkKPj4+Pgo+Pj4+
ICDCoMKgZXh0ZXJuIHZvaWQgdGxiX3JlbW92ZV90YWJsZShzdHJ1Y3QgbW11X2dhdGhlciAqdGxi
LCB2b2lkICp0YWJsZSk7Cj4+Pj4KPj4+PiAtI2Vsc2UgLyogIUNPTkZJR19NTVVfR0FUSEVSX0hB
VkVfVEFCTEVfRlJFRSAqLwo+Pj4+IC0KPj4+PiAtLyoKPj4+PiAtICogV2l0aG91dCBNTVVfR0FU
SEVSX1RBQkxFX0ZSRUUgdGhlIGFyY2hpdGVjdHVyZSBpcyBhc3N1bWVkIHRvIGhhdmUKPj4+PiBw
YWdlIGJhc2VkCj4+Pj4gLSAqIHBhZ2UgZGlyZWN0b3JpZXMgYW5kIHdlIGNhbiB1c2UgdGhlIG5v
cm1hbCBwYWdlIGJhdGNoaW5nIHRvIGZyZWUKPj4+PiB0aGVtLgo+Pj4+IC0gKi8KPj4+PiAtI2Rl
ZmluZSB0bGJfcmVtb3ZlX3RhYmxlKHRsYiwgcGFnZSkgdGxiX3JlbW92ZV9wYWdlKCh0bGIpLCAo
cGFnZSkpCj4+Pgo+Pj4gV2Ugc3RpbGwgbmVlZCBhIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbiBv
ZiB0bGJfcmVtb3ZlX3RhYmxlKCkgaW4gdGhpcwo+Pj4gY2FzZS4gV2UgY291bGQgZGVmaW5lIGl0
IGlubGluZSBoZXJlOgo+Pj4KPj4+IHN0YXRpYyBpbmxpbmUgdm9pZCB0bGJfcmVtb3ZlX3RhYmxl
KHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHZvaWQgKnRhYmxlKQo+Pj4gewo+Pj4gIMKgwqDCoMKg
IHN0cnVjdCBwYWdlICpwYWdlID0gdGFibGU7Cj4+Pgo+Pj4gIMKgwqDCoMKgIHBhZ2V0YWJsZV9k
dG9yKHBhZ2VfcHRkZXNjKHBhZ2UpKTsKPj4+ICDCoMKgwqDCoCB0bGJfcmVtb3ZlX3BhZ2UocGFn
ZSk7Cj4+PiB9Cj4+Cj4+IFJpZ2h0LiBBcyBJIHNhaWQgYWJvdmUsIHdpbGwgYWRkIHRoaXMgdG8g
dGhlIHVwZGF0ZWQgcGF0Y2ggIzguCj4gCj4gSSB0aGluayBpdCB3b3VsZCBiZSBwcmVmZXJhYmxl
IHRvIG1ha2UgaXQgYSBzdGFuZGFsb25lIHBhdGNoLCBiZWNhdXNlCj4gdGhpcyBpcyBhIGNoYW5n
ZSB0byBnZW5lcmljIGNvZGUgdGhhdCBjb3VsZCBpbiBwcmluY2lwbGUgaW1wYWN0IG90aGVyCj4g
YXJjaCdzIHRvby4KCkFncmVlLCBJIGhhdmUgZG9uZSB0aGF0OgoKYGBgCkF1dGhvcjogUWkgWmhl
bmcgPHpoZW5ncWkuYXJjaEBieXRlZGFuY2UuY29tPgpEYXRlOiAgIEZyaSBEZWMgMTMgMTc6MTM6
NDggMjAyNCArMDgwMAoKICAgICBtbTogcGd0YWJsZTogY29tcGxldGVseSBtb3ZlIHBhZ2V0YWJs
ZV9kdG9yKCkgdG8gZ2VuZXJpYyAKdGxiX3JlbW92ZV90YWJsZSgpCgogICAgIEZvciB0aGUgZ2Vu
ZXJpYyB0bGJfcmVtb3ZlX3RhYmxlKCksIGl0IGlzIGltcGxlbWVudGVkIGluIHRoZSAKZm9sbG93
aW5nIHR3bwogICAgIGZvcm1zOgoKICAgICAxKSBDT05GSUdfTU1VX0dBVEhFUl9UQUJMRV9GUkVF
IGlzIGVuYWJsZWQKCiAgICAgdGxiX3JlbW92ZV90YWJsZQogICAgIC0tPiBnZW5lcmljIF9fdGxi
X3JlbW92ZV90YWJsZSgpCgogICAgIDIpIENPTkZJR19NTVVfR0FUSEVSX1RBQkxFX0ZSRUUgaXMg
ZGlzYWJsZWQKCiAgICAgdGxiX3JlbW92ZV90YWJsZQogICAgIC0tPiB0bGJfcmVtb3ZlX3BhZ2UK
CiAgICAgRm9yIGNhc2UgMSksIHRoZSBwYWdldGFibGVfZHRvcigpIGhhcyBhbHJlYWR5IGJlZW4g
bW92ZWQgdG8gZ2VuZXJpYwogICAgIF9fdGxiX3JlbW92ZV90YWJsZSgpLgoKICAgICBGb3IgY2Fz
ZSAyKSwgbm93IG9ubHkgYXJtIHdpbGwgY2FsbCAKdGxiX3JlbW92ZV90YWJsZSgpL3RsYl9yZW1v
dmVfcHRkZXNjKCkKICAgICB3aGVuIENPTkZJR19NTVVfR0FUSEVSX1RBQkxFX0ZSRUUgaXMgZGlz
YWJsZWQuIExldCdzIG1vdmUgCnBhZ2V0YWJsZV9kdG9yKCkKICAgICBjb21wbGV0ZWx5IHRvIGdl
bmVyaWMgdGxiX3JlbW92ZV90YWJsZSgpLCBzbyB0aGF0IHRoZSBhcmNoaXRlY3R1cmVzIGNhbgog
ICAgIGZvbGxvdyBtb3JlIGVhc2lseS4KCiAgICAgU2lnbmVkLW9mZi1ieTogUWkgWmhlbmcgPHpo
ZW5ncWkuYXJjaEBieXRlZGFuY2UuY29tPgoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL3RsYi5oIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vdGxiLmgKaW5kZXggYjhlZWJkYjU5ODYz
MS4uZWE0ZmJlN2IxN2Y2ZiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vaW5jbHVkZS9hc20vdGxiLmgK
KysrIGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vdGxiLmgKQEAgLTM0LDEwICszNCw2IEBAIF9fcHRl
X2ZyZWVfdGxiKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHBndGFibGVfdCBwdGUsIAp1bnNpZ25l
ZCBsb25nIGFkZHIpCiAgewogICAgICAgICBzdHJ1Y3QgcHRkZXNjICpwdGRlc2MgPSBwYWdlX3B0
ZGVzYyhwdGUpOwoKLSNpZm5kZWYgQ09ORklHX01NVV9HQVRIRVJfVEFCTEVfRlJFRQotICAgICAg
IHBhZ2V0YWJsZV9kdG9yKHB0ZGVzYyk7Ci0jZW5kaWYKLQogICNpZm5kZWYgQ09ORklHX0FSTV9M
UEFFCiAgICAgICAgIC8qCiAgICAgICAgICAqIFdpdGggdGhlIGNsYXNzaWMgQVJNIE1NVSwgYSBw
dGUgcGFnZSBoYXMgdHdvIGNvcnJlc3BvbmRpbmcgcG1kCmRpZmYgLS1naXQgYS9pbmNsdWRlL2Fz
bS1nZW5lcmljL3RsYi5oIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy90bGIuaAppbmRleCA2OWRlNDdj
N2VmM2M1Li41M2FlNzc0OGY1NTViIDEwMDY0NAotLS0gYS9pbmNsdWRlL2FzbS1nZW5lcmljL3Rs
Yi5oCisrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvdGxiLmgKQEAgLTIyMCwxNCArMjIwLDIwIEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBfX3RsYl9yZW1vdmVfdGFibGUodm9pZCAqdGFibGUpCgogIGV4
dGVybiB2b2lkIHRsYl9yZW1vdmVfdGFibGUoc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwgdm9pZCAq
dGFibGUpOwoKLSNlbHNlIC8qICFDT05GSUdfTU1VX0dBVEhFUl9IQVZFX1RBQkxFX0ZSRUUgKi8K
KyNlbHNlIC8qICFDT05GSUdfTU1VX0dBVEhFUl9UQUJMRV9GUkVFICovCgorc3RhdGljIGlubGlu
ZSB2b2lkIHRsYl9yZW1vdmVfcGFnZShzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLCBzdHJ1Y3QgcGFn
ZSAKKnBhZ2UpOwogIC8qCiAgICogV2l0aG91dCBNTVVfR0FUSEVSX1RBQkxFX0ZSRUUgdGhlIGFy
Y2hpdGVjdHVyZSBpcyBhc3N1bWVkIHRvIGhhdmUgCnBhZ2UgYmFzZWQKICAgKiBwYWdlIGRpcmVj
dG9yaWVzIGFuZCB3ZSBjYW4gdXNlIHRoZSBub3JtYWwgcGFnZSBiYXRjaGluZyB0byBmcmVlIHRo
ZW0uCiAgICovCi0jZGVmaW5lIHRsYl9yZW1vdmVfdGFibGUodGxiLCBwYWdlKSB0bGJfcmVtb3Zl
X3BhZ2UoKHRsYiksIChwYWdlKSkKK3N0YXRpYyBpbmxpbmUgdm9pZCB0bGJfcmVtb3ZlX3RhYmxl
KHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHZvaWQgKnRhYmxlKQoreworICAgICAgIHN0cnVjdCBw
YWdlICpwYWdlID0gKHN0cnVjdCBwYWdlICopdGFibGU7CgorICAgICAgIHBhZ2V0YWJsZV9kdG9y
KHBhZ2VfcHRkZXNjKHBhZ2UpKTsKKyAgICAgICB0bGJfcmVtb3ZlX3BhZ2UodGxiLCBwYWdlKTsK
K30KICAjZW5kaWYgLyogQ09ORklHX01NVV9HQVRIRVJfVEFCTEVfRlJFRSAqLwoKICAjaWZkZWYg
Q09ORklHX01NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUKYGBgCgphbmQgd2lsbCBzZW5kIHY1IGxh
dGVyLgoKVGhhbmtzIQoKPiAKPiAtIEtldmluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
