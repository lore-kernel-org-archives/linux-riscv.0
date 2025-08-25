Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DCDCA0FE8
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 15:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mzyllb1ER4Sp7SvKiXwNIcTEytTGVho5j+OotolsAv4=; b=2a077eJzeC+P8Q
	j7j5jcXMKYOV9qyCxwIaH+Ljf7pC+fKaqJK49rQOsuUAOV9FIrgD89laGsdNzMoe85wp+Z+Bz1nKf
	BKxnqJUoCxH3ArGzV37zvAmZ9jm0N9ue1MrUKk6RBiXBpyjIIJaX/FzGmeDMINtFxuAUs7hEZ89L5
	xpoJoaKdWPlzVknOSWGJjTIjBQ83hHJlc3qMoawmoXmpgngY6IjW61+c2oynRGYeojjW/eah2Ktl8
	EKKiMo1NT0+FZxImeygHHPsz08c4yaPIHEsnCuPo7Dbma8Guwdt7hO7vllGgKXlMwYOKgntPBNXC+
	KodBTmw2chdayp+y5Dlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZEn-00000008XP9-105y;
	Mon, 25 Aug 2025 15:36:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYKq-00000008HmF-1pXf
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 14:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756132691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=S1b1Qn5IdFgoYphqgj6hBBswyK4CJqNFMjotKKBhPlQ=;
	b=HoobbtYgW+PrUqxQN2BTDWBcUPLPsr7Pk9UIYE1NUHoS+P+rFUq9PzfPFunuX3v8+Ds1VU
	UsiDDgP8B+/lzzpSX7uEfEGZy4+26U34EiEQcUuOdl6628d9FLg3hIsOSPReWMV0X57SgN
	3PIAfja/536eEFFiXNk3H/JBFAp1rzk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-vmfiRTnrMCSOhenvn3GXRg-1; Mon, 25 Aug 2025 10:38:09 -0400
X-MC-Unique: vmfiRTnrMCSOhenvn3GXRg-1
X-Mimecast-MFC-AGG-ID: vmfiRTnrMCSOhenvn3GXRg_1756132687
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3c79f0a5ff0so798650f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 07:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132686; x=1756737486;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1b1Qn5IdFgoYphqgj6hBBswyK4CJqNFMjotKKBhPlQ=;
        b=VzS2KS5makBg5Uo9No72MWUkat46zkbRlxSjbQzwQjSFDzQ0K/vx5xhdMD8/7xznw9
         2ADvMuqFJ6Nf+EHCBFs0flwsJ2p4v/ckwsoHSdR5krHBhLrx6eT5ELeMx3ffjCccUaLT
         i4jACieYLAvEHSToXEZlWhWdJmLk5zMo3LcRFw4/ZqZ9cwDR9AdMMX+9L0tiX/I8oq7U
         o1ig+VoklJi1HCdqVZ2Nz6M2gA2GXXWiPmvnHR9Wu6lzSDo32xbz162j++TI+2VygG5C
         BB/e+BgZlolUgS0eB09tPcqA6uxQtT4/wpba8IkoGmpsGO3is9qjFqK3357dV18yYPha
         u2kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa2dCOAzDYm1P86wK3z1kp5Po+zprrCYziQgf/mIANnf0xMX9Mnf/zZeiwWlW1uIPdwNHt7cafumWMGg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnf35MmEvUjQpwf5M8zJck/ZqknHzX/4NHqh6VUd7G90nyPs/O
	d9C1mxatP2HxmK9SvDmYZUZN/lp2Xm6JQeADuliiny2Inq1r1pVMnG5a5n8ZaPBIDEve5mmJeH+
	ZtqnCYxt1mM47HbhFahQefS+ihPHN/ba5Fnn3SiNWIA7nOktpTMPHh2OMBsKSXGACcKyESQ==
X-Gm-Gg: ASbGnct0PEB0IvnDEW/MZr6MiNVLxKHBDAISXCe3jV39vqkJlD79er5sFIOo6zxLacN
	w0WxyvdYexVNmfcOo3yZ9rbckYWR3VZKGcV2h95PxBP40g4P5cd/XAX1zAjsCCibmKBQM0Au6Fu
	hFJbgzK5dfOfndkcixGy2p8qBWzO8x7BUGSxY5Z3T9+KZI4SPUcEJwwCpAZRpjyLbFaKLw69NsT
	iAIPG+vgOWYHBi7jJpdvmeg4JkhtZ7z/ubL4yfFd5Y0TN1hnXnAZlglfla0CFAxcugbbbPK6XUk
	dbzwtAEhsaTWHTOQsIAKo1PZbf+R+aQ3CuVHqBgxwqcKMHRdDfxB771OlLEc0qkMG5lC23cbnDv
	FjNGUg4D3bL0IkAAh78jH2fJWQJRdsfLLINvNxR1O+jOVY4LaNqV9TPVig8ebr+lqNRU=
X-Received: by 2002:a05:6000:3113:b0:3c9:f8a:f257 with SMTP id ffacd0b85a97d-3c90f8af5cbmr2996351f8f.50.1756132686347;
        Mon, 25 Aug 2025 07:38:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCFvBJRBfcBEdo8i70/6pukUQNYn2Qrs6ZnSbppOdelrrIoC/z5rNFiWI+fX6KVi1Xqpq2ow==
X-Received: by 2002:a05:6000:3113:b0:3c9:f8a:f257 with SMTP id ffacd0b85a97d-3c90f8af5cbmr2996318f8f.50.1756132685799;
        Mon, 25 Aug 2025 07:38:05 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4f:1300:42f1:98e5:ddf8:3a76? (p200300d82f4f130042f198e5ddf83a76.dip0.t-ipconnect.de. [2003:d8:2f4f:1300:42f1:98e5:ddf8:3a76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5744e9b1sm109711045e9.11.2025.08.25.07.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 07:38:05 -0700 (PDT)
Message-ID: <a72080b4-5156-4add-ac7c-1160b44e0dfe@redhat.com>
Date: Mon, 25 Aug 2025 16:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/35] mm/hugetlb: cleanup
 hugetlb_folio_init_tail_vmemmap()
To: Mike Rapoport <rppt@kernel.org>
Cc: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-11-david@redhat.com>
 <9156d191-9ec4-4422-bae9-2e8ce66f9d5e@redhat.com>
 <7077e09f-6ce9-43ba-8f87-47a290680141@redhat.com>
 <aKmDBobyvEX7ZUWL@kernel.org>
 <a90cf9a3-d662-4239-ad54-7ea917c802a5@redhat.com>
 <aKxz9HLQTflFNYEu@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aKxz9HLQTflFNYEu@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 56nBa7Kkiiln3l_OFpPh5jQphifv0Rz09M3aR3BwLJ0_1756132687
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_073812_540178_A87C913D 
X-CRM114-Status: GOOD (  17.30  )
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

T24gMjUuMDguMjUgMTY6MzIsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gT24gTW9uLCBBdWcgMjUs
IDIwMjUgYXQgMDI6NDg6NThQTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+IE9u
IDIzLjA4LjI1IDEwOjU5LCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+Pj4gT24gRnJpLCBBdWcgMjIs
IDIwMjUgYXQgMDg6MjQ6MzFBTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pj4g
T24gMjIuMDguMjUgMDY6MDksIE1pa2EgUGVudHRpbMOkIHdyb3RlOgo+Pj4+Pgo+Pj4+PiBPbiA4
LzIxLzI1IDIzOjA2LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+Pj4KPj4+Pj4+IEFsbCBw
YWdlcyB3ZXJlIGFscmVhZHkgaW5pdGlhbGl6ZWQgYW5kIHNldCB0byBQYWdlUmVzZXJ2ZWQoKSB3
aXRoIGEKPj4+Pj4+IHJlZmNvdW50IG9mIDEgYnkgTU0gaW5pdCBjb2RlLgo+Pj4+Pgo+Pj4+PiBK
dXN0IHRvIGJlIHN1cmUsIGhvdyBpcyB0aGlzIHdvcmtpbmcgd2l0aCBNRU1CTE9DS19SU1JWX05P
SU5JVCwgd2hlcmUgTU0gaXMgc3VwcG9zZWQgbm90IHRvCj4+Pj4+IGluaXRpYWxpemUgc3RydWN0
IHBhZ2VzPwo+Pj4+Cj4+Pj4gRXhjZWxsZW50IHBvaW50LCBJIGRpZCBub3Qga25vdyBhYm91dCB0
aGF0IG9uZS4KPj4+Pgo+Pj4+IFNwb3R0aW5nIHRoYXQgd2UgZG9uJ3QgZG8gdGhlIHNhbWUgZm9y
IHRoZSBoZWFkIHBhZ2UgbWFkZSBtZSBhc3N1bWUgdGhhdAo+Pj4+IGl0J3MganVzdCBhIG1pc3Vz
ZSBvZiBfX2luaXRfc2luZ2xlX3BhZ2UoKS4KPj4+Pgo+Pj4+IEJ1dCB0aGUgbmFzdHkgdGhpbmcg
aXMgdGhhdCB3ZSB1c2UgbWVtYmxvY2tfcmVzZXJ2ZWRfbWFya19ub2luaXQoKSB0byBvbmx5Cj4+
Pj4gbWFyayB0aGUgdGFpbCBwYWdlcyAuLi4KPj4+Cj4+PiBBbmQgZXZlbiBuYXN0aWVyIHRoaW5n
IGlzIHRoYXQgd2hlbiBDT05GSUdfREVGRVJSRURfU1RSVUNUX1BBR0VfSU5JVCBpcwo+Pj4gZGlz
YWJsZWQgc3RydWN0IHBhZ2VzIGFyZSBpbml0aWFsaXplZCByZWdhcmRsZXNzIG9mCj4+PiBtZW1i
bG9ja19yZXNlcnZlZF9tYXJrX25vaW5pdCgpLgo+Pj4KPj4+IEkgdGhpbmsgdGhpcyBwYXRjaCBz
aG91bGQgZ28gaW4gYmVmb3JlIHlvdXIgdXBkYXRlczoKPj4KPj4gU2hvdWxkbid0IHdlIGZpeCB0
aGlzIGluIG1lbWJsb2NrIGNvZGU/Cj4+Cj4+IEhhY2tpbmcgYXJvdW5kIHRoYXQgaW4gdGhlIG1l
bWJsb2NrX3Jlc2VydmVkX21hcmtfbm9pbml0KCkgdXNlciBzb3VuZCB3cm9uZwo+PiAtLSBhbmQg
bm90aGluZyBpbiB0aGUgZG9jIG9mIG1lbWJsb2NrX3Jlc2VydmVkX21hcmtfbm9pbml0KCkgc3Bl
bGxzIHRoYXQKPj4gYmVoYXZpb3Igb3V0Lgo+IAo+IFdlIGNhbiBzdXJlbHkgdXBkYXRlIHRoZSBk
b2NzLCBidXQgdW5mb3J0dW5hdGVseSBJIGRvbid0IHNlZSBob3cgdG8gYXZvaWQKPiBoYWNraW5n
IGFyb3VuZCBpdCBpbiBodWdldGxiLgo+IFNpbmNlIGl0J3MgdXNlZCB0byBvcHRpbWlzZSBIVk8g
ZXZlbiBmdXJ0aGVyIHRvIHRoZSBwb2ludCBodWdldGxiIG9wZW4KPiBjb2RlcyBtZW1tYXAgaW5p
dGlhbGl6YXRpb24sIEkgdGhpbmsgaXQncyBmYWlyIHRoYXQgaXQgc2hvdWxkIGRlYWwgd2l0aCBh
bGwKPiBwb3NzaWJsZSBjb25maWd1cmF0aW9ucy4KClJlbWluZCBtZSwgd2h5IGNhbid0IHdlIHN1
cHBvcnQgbWVtYmxvY2tfcmVzZXJ2ZWRfbWFya19ub2luaXQoKSB3aGVuIApDT05GSUdfREVGRVJS
RURfU1RSVUNUX1BBR0VfSU5JVCBpcyBkaXNhYmxlZD8KCi0tIApDaGVlcnMKCkRhdmlkIC8gZGhp
bGRlbmIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
