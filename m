Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90539CD4F27
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BToO8K41PuS1W6rvOZ0HcEvpaDgMTZt7FUYk3Ccz1sk=; b=07gOMBw0lJqnqb
	df/FWAKe7k1dNZzXY8B3G12gw6tEtU0JgecFoe9bJw3NI1O16tRhwio2CVMHKDgrhJPupjPN+UF1i
	gCJsIa4iowcN+K0XEIj/AOYSxjgdnyi3abcNLIaflYNUXi4Zi7tyhCsI2WqtzMbPNA78XgXXplcJs
	1yijynLLHofGSQuCahn0XEXQwk9NmbSwZSpRJprMJVHxBias6zDtdpSoi+2vHEBW3c91yw+7BpDBn
	tNymOpUMohOqD9XaYqto7BerMOw5mFj4f9Ma8yFL11H7GzI230UdPMtkZABC8a0dldKhFv1s7hCQa
	5zoyapns7NwOS99EB6yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjb01-008Gf7-0A;
	Fri, 22 Sep 2023 07:54:53 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjazq-008GZn-0Y
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 07:54:44 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3ae0df6494bso197725b6e.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 00:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1695369277; x=1695974077; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mChtpslVRDtABUDMXlRNyI2zcTWp8b7v1J11sWjz5UU=;
        b=Ak36vugXJut4q8N8yD3wmJ5OWdGrM28sL6VoLniO5Y5aiVYQRAlIiHMPB/a51+YuG4
         I9aorZGsbXbGUvhRju5zn8uFjwvXVEf+QYgsuX/4PPKvDSRA3vE8th7nnrUUXfug53Gt
         kJxMZOHNrQSWh0cHb4v981vfI622LAeSTO9byk23fVa8jKeNQCwl9UKAD3gwrqzNS+Wh
         3u4J7uMNU0mH0mFcPotdHp20/jJmlruZAMIIgjn1psl5dXE7z5WiJDgSvWL7k4JmskCK
         vWTvqlO6bWx9TmqLsW/kkdITE667/4uvNLuDDMY5vQvtAr0RLLBv3GgyFpgUmvpzFRiM
         8fOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695369277; x=1695974077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mChtpslVRDtABUDMXlRNyI2zcTWp8b7v1J11sWjz5UU=;
        b=VpbZiDuGsc7kX2XEj+uUyytztfkv32Ap6OKL4B4iSDyCnqe5qyvcT0W+tRVvxJyHOZ
         LKm61p7joLHX3b2nHHYPkfS14Mv0XuCLBjN8NbMpsgY7kOW3aaNu/8vBiF0DMjWpfj3L
         qPyzXFpgKcOhDPOzLx6qhG742QoD5HhPZr9EJ4bwzWJKqiNBmoqWgN0K2AbMPauVxUKu
         arJNZ0L1MOCl1BRKpFSVXAs2EbtJBt8jxDGG2YmQntYmktWGqvUJXjg+zePGv2PKhEW3
         MxUeTutV3gHeNSiOV9nu0iMCEhnwlAmylCWHhtvZUst6EgksI9ciK3JDneIOWYaDpAox
         7eYQ==
X-Gm-Message-State: AOJu0YwP9PyxRTtHJnnh1L7x3b7hBi5YU6u9adwLvNHofRVP6F9ONx5l
	kX27MOCjvrCeTMtNjdiohs3Jhg==
X-Google-Smtp-Source: AGHT+IGqQ4SE81KpOPQycLdX+PpQiCkrykKUFjbltxRe8gku3+WZ7tAnJ+OrDpFpcSdrC4r4spkfyg==
X-Received: by 2002:a05:6358:ee94:b0:143:688f:dc03 with SMTP id il20-20020a056358ee9400b00143688fdc03mr8397488rwb.2.1695369277251;
        Fri, 22 Sep 2023 00:54:37 -0700 (PDT)
Received: from [10.84.155.178] ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id y19-20020aa78053000000b0066684d8115bsm2666191pfm.178.2023.09.22.00.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 00:54:36 -0700 (PDT)
Message-ID: <6db7e7e0-4db6-f742-436b-1f4d8ae4e490@bytedance.com>
Date: Fri, 22 Sep 2023 15:54:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v1 8/8] arm64: hugetlb: Fix set_huge_pte_at() to work with
 all swap entries
Content-Language: en-US
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>,
 Mike Kravetz <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>,
 SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Lorenzo Stoakes <lstoakes@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Peter Xu <peterx@redhat.com>,
 Axel Rasmussen <axelrasmussen@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921162007.1630149-9-ryan.roberts@arm.com>
 <217bb956-b9f6-1057-914b-436d4c775a8b@bytedance.com>
 <3358e732-8df9-4408-8249-384b102f5d75@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <3358e732-8df9-4408-8249-384b102f5d75@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_005442_248368_A21A585E 
X-CRM114-Status: GOOD (  33.47  )
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

SGkgUnlhbiwKCk9uIDIwMjMvOS8yMiAxNTo0MCwgUnlhbiBSb2JlcnRzIHdyb3RlOgo+IE9uIDIy
LzA5LzIwMjMgMDM6NTQsIFFpIFpoZW5nIHdyb3RlOgo+PiBIaSBSeWFuLAo+Pgo+PiBPbiAyMDIz
LzkvMjIgMDA6MjAsIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPj4+IFdoZW4gY2FsbGVkIHdpdGggYSBz
d2FwIGVudHJ5IHRoYXQgZG9lcyBub3QgZW1iZWQgYSBQRk4gKGUuZy4KPj4+IFBURV9NQVJLRVJf
UE9JU09ORUQgb3IgUFRFX01BUktFUl9VRkZEX1dQKSwgdGhlIHByZXZpb3VzIGltcGxlbWVudGF0
aW9uCj4+PiBvZiBzZXRfaHVnZV9wdGVfYXQoKSB3b3VsZCBlaXRoZXIgY2F1c2UgYSBCVUcoKSB0
byBmaXJlIChpZgo+Pj4gQ09ORklHX0RFQlVHX1ZNIGlzIGVuYWJsZWQpIG9yIGNhdXNlIGEgZGVy
ZWZlcmVuY2Ugb2YgYW4gaW52YWxpZCBhZGRyZXNzCj4+PiBhbmQgc3Vic2VxdWVudCBwYW5pYy4K
Pj4+Cj4+PiBhcm02NCdzIGh1Z2UgcHRlIGltcGxlbWVudGF0aW9uIHN1cHBvcnRzIG11bHRpcGxl
IGh1Z2UgcGFnZSBzaXplcywgc29tZQo+Pj4gb2Ygd2hpY2ggYXJlIGltcGxlbWVudGVkIGluIHRo
ZSBwYWdlIHRhYmxlIHdpdGggY29udGlndW91cyBtYXBwaW5ncy4gU28KPj4+IHNldF9odWdlX3B0
ZV9hdCgpIG5lZWRzIHRvIHdvcmsgb3V0IGhvdyBiaWcgdGhlIGxvZ2ljYWwgcHRlIGlzLCBzbyB0
aGF0Cj4+PiBpdCBjYW4gYWxzbyB3b3JrIG91dCBob3cgbWFueSBwaHlzaWNhbCBwdGVzIChvciBw
bWRzKSBuZWVkIHRvIGJlCj4+PiB3cml0dGVuLiBJdCBkb2VzIHRoaXMgYnkgZ3JhYmJpbmcgdGhl
IGZvbGlvIG91dCBvZiB0aGUgcHRlIGFuZCBxdWVyeWluZwo+Pj4gaXRzIHNpemUuCj4+Pgo+Pj4g
SG93ZXZlciwgdGhlcmUgYXJlIGNhc2VzIHdoZW4gdGhlIHB0ZSBiZWluZyBzZXQgaXMgYWN0dWFs
bHkgYSBzd2FwCj4+PiBlbnRyeS4gQnV0IHRoaXMgYWxzbyB1c2VkIHRvIHdvcmsgZmluZSwgYmVj
YXVzZSBmb3IgaHVnZSBwdGVzLCB3ZSBvbmx5Cj4+PiBldmVyIHNhdyBtaWdyYXRpb24gZW50cmll
cyBhbmQgaHdwb2lzb24gZW50cmllcy4gQW5kIGJvdGggb2YgdGhlc2UgdHlwZXMKPj4+IG9mIHN3
YXAgZW50cmllcyBoYXZlIGEgUEZOIGVtYmVkZGVkLCBzbyB0aGUgY29kZSB3b3VsZCBncmFiIHRo
YXQgYW5kCj4+PiBldmVyeXRoaW5nIHN0aWxsIHdvcmtlZCBvdXQuCj4+Pgo+Pj4gQnV0IG92ZXIg
dGltZSwgbW9yZSBjYWxscyB0byBzZXRfaHVnZV9wdGVfYXQoKSBoYXZlIGJlZW4gYWRkZWQgdGhh
dCBzZXQKPj4+IHN3YXAgZW50cnkgdHlwZXMgdGhhdCBkbyBub3QgZW1iZWQgYSBQRk4uIEFuZCB0
aGlzIGNhdXNlcyB0aGUgY29kZSB0byBnbwo+Pj4gYmFuZy4gVGhlIHRyaWdnZXJpbmcgY2FzZSBp
cyBmb3IgdGhlIHVmZmQgcG9pc29uIHRlc3QsIGNvbW1pdAo+Pj4gOTlhYTc3MjE1YWQwICgic2Vs
ZnRlc3RzL21tOiBhZGQgdWZmZCB1bml0IHRlc3QgZm9yIFVGRkRJT19QT0lTT04iKSwKPj4+IHdo
aWNoIHNldHMgYSBQVEVfTUFSS0VSX1BPSVNPTkVEIHN3YXAgZW50cnkuIEJ1dCByZXZpZXcgc2hv
d3MgdGhlcmUgYXJlCj4+PiBvdGhlciBwbGFjZXMgdG9vIChQVEVfTUFSS0VSX1VGRkRfV1ApLgo+
Pj4KPj4+IFNvIHRoZSByb290IGNhdXNlIGlzIGR1ZSB0byBjb21taXQgMThmMzk2Mjk1M2U0ICgi
bW06IGh1Z2V0bGI6IGtpbGwKPj4+IHNldF9odWdlX3N3YXBfcHRlX2F0KCkiKSwgd2hpY2ggYWlt
ZWQgdG8gc2ltcGxpZnkgdGhlIGludGVyZmFjZSB0byB0aGUKPj4+IGNvcmUgY29kZSBieSByZW1v
dmluZyBzZXRfaHVnZV9zd2FwX3B0ZV9hdCgpICh3aGljaCB0b29rIGEgcGFnZSBzaXplCj4+PiBw
YXJhbWV0ZXIpIGFuZCByZXBsYWNpbmcgaXQgd2l0aCBjYWxscyB0byBzZXRfaHVnZV9zd2FwX3B0
ZV9hdCgpIHdoZXJlCj4+PiB0aGUgc2l6ZSB3YXMgaW5mZXJyZWQgZnJvbSB0aGUgZm9saW8sIGFz
IGRlc2NpYmVkIGFib3ZlLiBXaGlsZSB0aGF0Cj4+PiBjb21taXQgZGlkbid0IGJyZWFrIGFueXRo
aW5nIGF0IHRoZSB0aW1lLAo+Pgo+PiBJZiBpdCBkaWRuJ3QgYnJlYWsgYW55dGhpbmcgYXQgdGhh
dCB0aW1lLCB0aGVuIHNob3VsZG4ndCB0aGUgRml4ZXMgdGFnCj4+IGJlIGFkZGVkIHRvIHRoaXMg
Y29tbWl0Pwo+Pgo+Pj4gaXQgZGlkIGJyZWFrIHRoZSBpbnRlcmZhY2UKPj4+IGJlY2F1c2UgaXQg
Y291bGRuJ3QgaGFuZGxlIHN3YXAgZW50cmllcyB3aXRob3V0IFBGTnMuIEFuZCBzaW5jZSB0aGVu
IG5ldwo+Pj4gY2FsbGVycyBoYXZlIGNvbWUgYWxvbmcgd2hpY2ggcmVseSBvbiB0aGlzIHdvcmtp
bmcuCj4+Cj4+IFNvIHRoZSBGaXhlcyB0YWcgc2hvdWxkIGJlIGFkZGVkIG9ubHkgdG8gdGhlIGNv
bW1pdCB0aGF0IGludHJvZHVjZXMgdGhlCj4+IGZpcnN0IG5ldyBjYWxsZXJzPwo+IAo+IFdlbGwg
SSBndWVzcyBpdCdzIGEgbWF0dGVyIG9mIHBvaW50IG9mIHZpZXc7IE15IHZpZXcgaXMgdGhhdCAx
OGYzOTYyOTUzZTQgaXMgdGhlCj4gYnVnZ3kgY2hhbmdlIGJlY2F1c2UgaXQgYnJva2UgdGhlIGlu
dGVyZmFjZSB0byBub3QgYmUgYWJsZSB0byBoYW5kbGUgc3dhcAo+IGVudHJpZXMgd2hpY2ggZG8g
bm90IGNvbnRhaW4gUEZOcy4gVGhlIGZhY3QgdGhhdCB0aGVyZSB3ZXJlIG5vIGNhbGxlcnMgdGhh
dCB1c2VkCj4gdGhlIGludGVyZmFjZSBpbiB0aGlzIHdheSBhdCB0aGUgdGltZSBvZiB0aGUgY29t
bWl0IGlzIGlycmVsZXZhbnQgaW4gbXkgdmlldy4KCkkgdW5kZXJzdGFuZCB5b3VyIHBvaW50IG9m
IHZpZXcuCgpCdXQgSUlVQywgdGhlIEZpeGVzIHRhZyBpcyB1c2VkIHRvIGluZGljYXRlIHRoZSB2
ZXJzaW9uIHRoYXQgbmVlZHMgdG8KYmFja3BvcnQsIGJ1dCB0aGUgdmVyc2lvbiB3aGVyZSB0aGUg
Y29tbWl0IDE4ZjM5NjI5NTNlNCBpcyBsb2NhdGVkCmRvZXMgbm90IG5lZWQgdG8gYmFja3BvcnQg
dGhpcyBidWdmaXggcGF0Y2guCgo+IEJ1dCBJIGFscmVhZHkgYWRkZWQgMiBmaXhlcyB0YWdzOyBv
bmUgZm9yIHRoZSBidWdneSBjb21taXQsIGFuZCB0aGUgb3RoZXIgZm9yCj4gdGhlIGNvbW1pdCBj
b250YWluaW5nIHRoZSBuZXcgdXNlciBvZiB0aGUgaW50ZXJmYWNlLgoKSSB0aGluayAyIGZpeGVz
IHRhZ3Mgd2lsbCBjYXVzZSBpbmNvbnZlbmllbmNlIHRvIHRoZSBtYWludGFpbmVycy4KClRoYW5r
cywKUWkKCj4gCj4+Cj4+IE90aGVyIHRoYW4gdGhhdCwgTEdUTS4KPiAKPiBUaGFua3MhCj4gCj4+
Cj4+IFRoYW5rcywKPj4gUWkKPj4KPj4+Cj4+PiBOb3cgdGhhdCB3ZSBoYXZlIG1vZGlmaWVkIHRo
ZSBzZXRfaHVnZV9wdGVfYXQoKSBpbnRlcmZhY2UgdG8gcGFzcyB0aGUKPj4+IHZtYSwgd2UgY2Fu
IGV4dHJhY3QgdGhlIGh1Z2UgcGFnZSBzaXplIGZyb20gaXQgYW5kIGZpeCB0aGlzIGlzc3VlLgo+
Pj4KPj4+IEknbSB0YWdnaW5nIHRoZSBjb21taXQgdGhhdCBhZGRlZCB0aGUgdWZmZCBwb2lzb24g
ZmVhdHVyZSwgc2luY2UgdGhhdCBpcwo+Pj4gd2hhdCBleHBvc2VkIHRoZSBwcm9ibGVtLCBhcyB3
ZWxsIGFzIHRoZSBvcmlnaW5hbCBjaGFuZ2UgdGhhdCBicm9rZSB0aGUKPj4+IGludGVyZmFjZS4g
SG9wZWZ1bGx5IHRoaXMgaXMgdmFsdWFibGUgZm9yIHBlb3BsZSBkb2luZyBiaXNlY3QuCj4+Pgo+
Pj4gU2lnbmVkLW9mZi1ieTogUnlhbiBSb2JlcnRzIDxyeWFuLnJvYmVydHNAYXJtLmNvbT4KPj4+
IEZpeGVzOiAxOGYzOTYyOTUzZTQgKCJtbTogaHVnZXRsYjoga2lsbCBzZXRfaHVnZV9zd2FwX3B0
ZV9hdCgpIikKPj4+IEZpeGVzOiA4YTEzODk3ZmIwZGEgKCJtbTogdXNlcmZhdWx0ZmQ6IHN1cHBv
cnQgVUZGRElPX1BPSVNPTiBmb3IgaHVnZXRsYmZzIikKPj4+IC0tLQo+Pj4gIMKgIGFyY2gvYXJt
NjQvbW0vaHVnZXRsYnBhZ2UuYyB8IDE3ICsrKy0tLS0tLS0tLS0tLS0tCj4+PiAgwqAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvbW0vaHVnZXRsYnBhZ2UuYyBiL2FyY2gvYXJtNjQvbW0vaHVnZXRs
YnBhZ2UuYwo+Pj4gaW5kZXggODQ0ODMyNTExYzFlLi5hMDg2MDFhMTQ2ODkgMTAwNjQ0Cj4+PiAt
LS0gYS9hcmNoL2FybTY0L21tL2h1Z2V0bGJwYWdlLmMKPj4+ICsrKyBiL2FyY2gvYXJtNjQvbW0v
aHVnZXRsYnBhZ2UuYwo+Pj4gQEAgLTI0MSwxMyArMjQxLDYgQEAgc3RhdGljIHZvaWQgY2xlYXJf
Zmx1c2goc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4+PiAgwqDCoMKgwqDCoCBmbHVzaF90bGJfcmFu
Z2UoJnZtYSwgc2FkZHIsIGFkZHIpOwo+Pj4gIMKgIH0KPj4+ICDCoCAtc3RhdGljIGlubGluZSBz
dHJ1Y3QgZm9saW8gKmh1Z2V0bGJfc3dhcF9lbnRyeV90b19mb2xpbyhzd3BfZW50cnlfdCBlbnRy
eSkKPj4+IC17Cj4+PiAtwqDCoMKgIFZNX0JVR19PTighaXNfbWlncmF0aW9uX2VudHJ5KGVudHJ5
KSAmJiAhaXNfaHdwb2lzb25fZW50cnkoZW50cnkpKTsKPj4+IC0KPj4+IC3CoMKgwqAgcmV0dXJu
IHBhZ2VfZm9saW8ocGZuX3RvX3BhZ2Uoc3dwX29mZnNldF9wZm4oZW50cnkpKSk7Cj4+PiAtfQo+
Pj4gLQo+Pj4gIMKgIHZvaWQgc2V0X2h1Z2VfcHRlX2F0KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBwdGVfdCAqcHRlcCwgcHRlX3QgcHRlKQo+Pj4gIMKgIHsKPj4+IEBAIC0yNTgsMTMg
KzI1MSwxMCBAQCB2b2lkIHNldF9odWdlX3B0ZV9hdChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSwKPj4+IHVuc2lnbmVkIGxvbmcgYWRkciwKPj4+ICDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcg
cGZuLCBkcGZuOwo+Pj4gIMKgwqDCoMKgwqAgcGdwcm90X3QgaHVnZXByb3Q7Cj4+PiAgwqAgLcKg
wqDCoCBpZiAoIXB0ZV9wcmVzZW50KHB0ZSkpIHsKPj4+IC3CoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
Zm9saW8gKmZvbGlvOwo+Pj4gLQo+Pj4gLcKgwqDCoMKgwqDCoMKgIGZvbGlvID0gaHVnZXRsYl9z
d2FwX2VudHJ5X3RvX2ZvbGlvKHB0ZV90b19zd3BfZW50cnkocHRlKSk7Cj4+PiAtwqDCoMKgwqDC
oMKgwqAgbmNvbnRpZyA9IG51bV9jb250aWdfcHRlcyhmb2xpb19zaXplKGZvbGlvKSwgJnBnc2l6
ZSk7Cj4+PiArwqDCoMKgIG5jb250aWcgPSBudW1fY29udGlnX3B0ZXMoaHVnZV9wYWdlX3NpemUo
aHN0YXRlX3ZtYSh2bWEpKSwgJnBnc2l6ZSk7Cj4+PiAgwqAgLcKgwqDCoMKgwqDCoMKgIGZvciAo
aSA9IDA7IGkgPCBuY29udGlnOyBpKyssIHB0ZXArKykKPj4+ICvCoMKgwqAgaWYgKCFwdGVfcHJl
c2VudChwdGUpKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IG5jb250aWc7
IGkrKywgcHRlcCsrLCBhZGRyICs9IHBnc2l6ZSkKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzZXRfcHRlX2F0KG1tLCBhZGRyLCBwdGVwLCBwdGUpOwo+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm47Cj4+PiAgwqDCoMKgwqDCoCB9Cj4+PiBAQCAtMjc0LDcgKzI2NCw2IEBAIHZv
aWQgc2V0X2h1Z2VfcHRlX2F0KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZAo+
Pj4gbG9uZyBhZGRyLAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+PiAgwqDCoMKg
wqDCoCB9Cj4+PiAgwqAgLcKgwqDCoCBuY29udGlnID0gZmluZF9udW1fY29udGlnKG1tLCBhZGRy
LCBwdGVwLCAmcGdzaXplKTsKPj4+ICDCoMKgwqDCoMKgIHBmbiA9IHB0ZV9wZm4ocHRlKTsKPj4+
ICDCoMKgwqDCoMKgIGRwZm4gPSBwZ3NpemUgPj4gUEFHRV9TSElGVDsKPj4+ICDCoMKgwqDCoMKg
IGh1Z2Vwcm90ID0gcHRlX3BncHJvdChwdGUpOwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
