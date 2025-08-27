Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A3CCA0FF6
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s78YdtaQ7m/SttecLXTKoKis6yhvoYCQoj2sBDCufck=; b=UhagqzBrv6qAGU
	uL93ZRE/gdhReZgDuo8e9zIWjEkRcxAm67AFUrLvPPwBhV3axDdK3m5g3oRQ+C506ZoKOHtk9g94z
	DzX0iiWM/8/apDFvRG26ds0PJq+Pk4Lne6CzHakHJqz4Iz00sSalMVYt1uL6mAqEj2d7DHDeD3a8l
	d+PBb1fQT4LxseS8OuFcf1bNDomBf5NnoO4NpDEPl1hDrtd8sXoe+IF7lAV1E0Ig2xfFmATJYfg2l
	WUiB5aAXI7CQ4nASFPRJ5pj7WJw68SwLtfbDo2dzUlL/GnOMlRa+Sm70O2yvvO68sttYGiFOCui3a
	XjaWdnWykSARGr0ds+Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE03-0000000FAQ6-3ckJ;
	Wed, 27 Aug 2025 11:07:31 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urCfx-0000000EtMj-1o9t;
	Wed, 27 Aug 2025 09:42:42 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso5311470f8f.3;
        Wed, 27 Aug 2025 02:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756287759; x=1756892559; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4gNirUawo/2N73RGh/VZFmiZovBEw6Zvsz5pkyBSog=;
        b=ijyo+SI5cQMYv7UOPPf2DCWddvqx/3TkLzd0HV1ernhDIHUiRENkh2vk/Wh2+k7jB3
         FFipvcsRk9vaWZinJhttwE2z+HLER1AihAV8Uj2pCLyIDf/gTWlnLOvs5cpS4vaLOxiK
         yGxoVHf1OikLWAGqE6HqzNH8r2Tz2DBji0jrupulh+ClVxxLw8xq8a3dROEDf4phmnM6
         iEmsHE/zptw6DC3Watd4Ymsc1hwknAxtYl2nREgRIXJD16CAKe5WlVT77orJKdq/UGvj
         knNMLxkxZebQjIbA9lR7f/stRkTbJactE2IcHZu0Zj4KJZf4iZ/UmrSHnK2XIG3AS8qb
         5eDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756287759; x=1756892559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4gNirUawo/2N73RGh/VZFmiZovBEw6Zvsz5pkyBSog=;
        b=QfgBcPBXDXpmukJDbLY0XiviTOYR4/9k3rNYHooc3OVe7w6r0Wn+oN/+l7fMnUTLo6
         tyPRdwqjYtXn81ENnTUXhAEqmbDlsFYikMBXv+fLjDhoEiD2sctmlWdQC1CWDv8XWkjS
         567AHeI1Fq3nJVDqOUTty1zJHSHjX84GKW5hElR4ngQpNZ2zeAtaP2NSARTR7yP23M2z
         3GUVJnIVTixyugRpKXlY3etgUMUv6Nbpx0F7TfRN6DQTg0RcgbtMPu6uCVzj1XOYYjlt
         rR1OvW9IPDYBn4jqbOFw3mmrM/Mhxgju+qV4eGdZPWp0JRrZ3hbZ+xZ++6vPSzI7kFcN
         46CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuKXApxAqsFRvlm0vWbpSQ/verkpIvU6HrdxsnDOPKgHXMcBvnTAVDyN5T4xjxYq6HXzMwLcZYoB0DKns=@lists.infradead.org, AJvYcCUuhddNOMgBA7PGLPt2sG1Z++Y5iSULAyRGTnb4xlRgIgXfATLQ1Q4CpZht7YuCh7T457Z0ZWx0KUynBisuEt48@lists.infradead.org
X-Gm-Message-State: AOJu0YzD/HdOPiNYWYeeS+u1A0GwTikcOPGpAk+3vXK//2NYiN9VR/GT
	U3Izguk/Q8rfNZKPPY6DecLWjabbSnial0CQ2Mb32kJeEDzzMNfl3bJQ
X-Gm-Gg: ASbGncuJ18QkzBByK4P/PKSzSMH45rC9eJB1lsxvLArxzd+L8ECVZssrnTPDTXL92iH
	RIDXWy9NEjM6m8n5OyE0/0qfl7OlTawUb7JjrvlMw4HkFmDUZYO9eRWyFJMVcGHRn92EA+6cCQZ
	rWKATNdPKuahl6fSlEOZaHPq7AWHhoaD7WQ4YmeoeYmlniS76c2fEtt4grxUFb0ptg9HEYhpdys
	s/eRj0/sIGvNeC+mBsWLQIpPPW67dXKEVdg3JTM1Pd4ka6Vm6le5vnTG/xGUe3c1KnWtlut/j+N
	xW8fC4+2sRI+TbzbWRgjnRiPBHN75E3Bo/CgDV5TAMZhSRXPTzd46ezP+AabDvH2oRRwSCm9jOV
	MYFjx/DrunMzJZ5ksdX+/+IpnS6hpuGNbyPtVwImUy3gz0dWFh1/6NWRu3g+gmvgPBw==
X-Google-Smtp-Source: AGHT+IFkjO5GHbU1+2MUuKQvNL0fwH2etmLb7S57NgBpdq01aCYpWSgROxwdQQpXxfO8aoPZevSNpQ==
X-Received: by 2002:a05:6000:3105:b0:3b8:d672:3cf8 with SMTP id ffacd0b85a97d-3c5dcb10b6amr14770182f8f.43.1756287759105;
        Wed, 27 Aug 2025 02:42:39 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:4a1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cc4b102889sm3363615f8f.51.2025.08.27.02.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 02:42:38 -0700 (PDT)
Message-ID: <46d09557-1873-4d97-b073-ce0c7296b954@gmail.com>
Date: Wed, 27 Aug 2025 10:43:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 18/35] io_uring/zcrx: remove "struct io_copy_cache"
 and one nth_page() usage
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-19-david@redhat.com>
 <b5b08ad3-d8cd-45ff-9767-7cf1b22b5e03@gmail.com>
 <473f3576-ddf3-4388-aeec-d486f639950a@redhat.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <473f3576-ddf3-4388-aeec-d486f639950a@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_024241_472126_52B37757 
X-CRM114-Status: GOOD (  15.40  )
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

T24gOC8yMi8yNSAxNDo1OSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gT24gMjIuMDguMjUg
MTM6MzIsIFBhdmVsIEJlZ3Vua292IHdyb3RlOgo+PiBPbiA4LzIxLzI1IDIxOjA2LCBEYXZpZCBI
aWxkZW5icmFuZCB3cm90ZToKPj4+IFdlIGFsd2F5cyBwcm92aWRlIGEgc2luZ2xlIGRzdCBwYWdl
LCBpdCdzIHVuY2xlYXIgd2h5IHRoZSBpb19jb3B5X2NhY2hlCj4+PiBjb21wbGV4aXR5IGlzIHJl
cXVpcmVkLgo+Pgo+PiBCZWNhdXNlIGl0J2xsIG5lZWQgdG8gYmUgcHVsbGVkIG91dHNpZGUgdGhl
IGxvb3AgdG8gcmV1c2UgdGhlIHBhZ2UgZm9yCj4+IG11bHRpcGxlIGNvcGllcywgaS5lLiBwYWNr
aW5nIG11bHRpcGxlIGZyYWdtZW50cyBvZiB0aGUgc2FtZSBza2IgaW50bwo+PiBpdC4gTm90IGZp
bmlzaGVkLCBhbmQgY3VycmVudGx5IGl0J3Mgd2FzdGluZyBtZW1vcnkuCj4gCj4gT2theSwgc28g
d2hhdCB5b3UncmUgc2F5aW5nIGlzIHRoYXQgdGhlcmUgd2lsbCBiZSBmb2xsb3ctdXAgd29yayB0
aGF0IHdpbGwgYWN0dWFsbHkgbWFrZSB0aGlzIHN0cnVjdHVyZSB1c2VmdWwuCgpFeGFjdGx5Cgo+
PiBXaHkgbm90IGRvIGFzIGJlbG93PyBQYWdlcyB0aGVyZSBuZXZlciBjcm9zcyBib3VuZGFyaWVz
IG9mIHRoZWlyIGZvbGlvcy4gPiBEbyB5b3Ugd2FudCBpdCB0byBiZSB0YWtlbiBpbnRvIHRoZSBp
b191cmluZyB0cmVlPwo+IAo+IFRoaXMgc2hvdWxkIGJldHRlciBhbGwgZ28gdGhyb3VnaCB0aGUg
TU0gdHJlZSB3aGVyZSB3ZSBhY3R1YWxseSBndWFyYW50ZWUgY29udGlndW91cyBwYWdlcyB3aXRo
aW4gYSBmb2xpby4gKHNlZSB0aGUgY292ZXIgbGV0dGVyKQoKTWFrZXMgc2Vuc2UuIE5vIG9iamVj
dGlvbiwgaG9wZWZ1bGx5IGl0IHdvbid0IGNhdXNlIHRvbyBtYW55IGNvbmZsaWN0cy4KCj4+IGRp
ZmYgLS1naXQgYS9pb191cmluZy96Y3J4LmMgYi9pb191cmluZy96Y3J4LmMKPj4gaW5kZXggZTVm
ZjQ5ZjM0MjVlLi4xOGMxMmY0YjU2YjYgMTAwNjQ0Cj4+IC0tLSBhL2lvX3VyaW5nL3pjcnguYwo+
PiArKysgYi9pb191cmluZy96Y3J4LmMKPj4gQEAgLTk3NSw5ICs5NzUsOSBAQCBzdGF0aWMgc3Np
emVfdCBpb19jb3B5X3BhZ2Uoc3RydWN0IGlvX2NvcHlfY2FjaGUgKmNjLCBzdHJ1Y3QgcGFnZSAq
c3JjX3BhZ2UsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChmb2xpb190ZXN0X3BhcnRpYWxf
a21hcChwYWdlX2ZvbGlvKGRzdF9wYWdlKSkgfHwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmb2xpb190ZXN0X3BhcnRpYWxfa21hcChwYWdlX2ZvbGlvKHNyY19wYWdlKSkpIHsKPj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHN0X3BhZ2UgPSBudGhfcGFnZShkc3RfcGFnZSwgZHN0
X29mZnNldCAvIFBBR0VfU0laRSk7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRzdF9wYWdl
ICs9IGRzdF9vZmZzZXQgLyBQQUdFX1NJWkU7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZHN0X29mZnNldCA9IG9mZnNldF9pbl9wYWdlKGRzdF9vZmZzZXQpOwo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzcmNfcGFnZSA9IG50aF9wYWdlKHNyY19wYWdlLCBzcmNfb2Zmc2V0IC8g
UEFHRV9TSVpFKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3JjX3BhZ2UgKz0gc3JjX29m
ZnNldCAvIFBBR0VfU0laRTsKPiAKPiBZZWFoLCBJIGNhbiBkbyB0aGF0IGluIHRoZSBuZXh0IHZl
cnNpb24gZ2l2ZW4gdGhhdCB5b3UgaGF2ZSBwbGFucyBvbiBleHRlbmRpbmcgdGhhdCBjb2RlIHNv
b24uCgpJZiB3ZSBnbyB3aXRoIHRoaXMgdmVyc2lvbjoKClJldmlld2VkLWJ5OiBQYXZlbCBCZWd1
bmtvdiA8YXNtbC5zaWxlbmNlQGdtYWlsLmNvbT4KCi0tIApQYXZlbCBCZWd1bmtvdgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
