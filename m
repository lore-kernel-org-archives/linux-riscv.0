Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F4ECA0EED
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 14:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NRnxpD6/eFsh/4vMVwci8xJSejj2vCqMyvu4T8OGg+8=; b=wJVHldFOYgULBv
	8KVBUEJhrl9eZ5k9nFXIYuO8bpCHccbP9IIrYXgDoaxLbkik5ZkEKbYDSrXHfzSEDNYYRdI5sf1aC
	6cwEY6b0diXf4NAgX0tJPuUVgNNIbnC0O+RcizVpLAJIdDE5kMhxcXF8g7JWL/iQgoylaNMQWnyyF
	eeoyNDeJkL3Ct1OGCGWBBgy/JEzANUPe9QIDWpVXATUHuHLEaBxdpzUXfMQ8YbZWojjZmlWWTMfaL
	bGU4xt8jqg4noHj/rCA6cZhM8lhTir7RlvLdSK5yz1y8QbrDJ33Um6f4PmaQuw+SUeHIM2htjsdtd
	ItA+Bzq0JE3TCne8yTgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSbd-00000002lDg-2ePx;
	Fri, 22 Aug 2025 14:19:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLCY-00000001glO-3q65
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 06:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755843877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WiI+ZnCzEnb/n6DQfRPkU+9oejYIM/R2hKOTH1yevco=;
	b=JUuDx/mIh1HjyqVIb1gxTmOSbawlExlJEHy+T/G78xkeOa1aDOsr81JuC1jaDFHmmCJQYE
	ZT6pMSU4frP+G2bMSgz+u3vbvrUtZCmY8LQT56a58zFfXe/EV8l+Q21T1dBhzkqoHkxm5m
	mZ5pHjgZVeGVNjfwncuqOwW4u7yjRKI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-bGN-wOw7MDmJTvriMbIV0g-1; Fri, 22 Aug 2025 02:24:36 -0400
X-MC-Unique: bGN-wOw7MDmJTvriMbIV0g-1
X-Mimecast-MFC-AGG-ID: bGN-wOw7MDmJTvriMbIV0g_1755843875
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3b9edf332faso560774f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 23:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755843875; x=1756448675;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiI+ZnCzEnb/n6DQfRPkU+9oejYIM/R2hKOTH1yevco=;
        b=dY/s9UZmYEuIMsJQhEJdvhlbYeuNhvFhHfGHFE28djcs3hfJJan7wT643SXCIJxNIM
         VPsdhlmShCiS0G2BTRWKrlGaFknnNuPEYkdDaAExUN7x2JjA3KRPoAYPspj72jydJqZ0
         FOFIuB7/rpncX8wFIAUq9J37zlX+KsiVCyxZB7mdbeP9fbxGrya1kQfDqW47YHebNJ0T
         bw9apVeX4jdzLi3reiXebvj2xXrupCOQULxjRA0NDB6rrZQebCBE1LaUUOSVEtB2JLdc
         BD47VFMMkRAy6IUTynf4DNrD921RxJ5AItAJqHqNrt0oowi+xTpUrD1sQN1IVixDcM6X
         2Dzg==
X-Forwarded-Encrypted: i=1; AJvYcCWwwDjE6vQt4ixjIgL3E+hWcXJspaBEs1H74lmRXY64NM9YYgTJU9y84k0aKdQpQuEe3s5fkSvnFoz+Rg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzN7UkV5HlKpp4ejk8x5BrxG2Zn+YiFjKcA1WRuxsAD8KvJhtsH
	SVR4ZHGXLCAAXIQvs3fhfSKvveEGU59IabVDbQ5btJU96TtraFUi0iOhLVlQFYDriZgJKBJGlkz
	YuBm5ax1CHWQX01QKIDnNF84dtTyaHhdQFlLtFtdpp6qC1Eh5b8S2k5TVMpT2jc3IsPTDRA==
X-Gm-Gg: ASbGncvylsfqivx60QStHWnYwNkPuBrgMsP+mZlG7zAH2qTmYQGgisDimbxEpw+gz9p
	AZwb4ul3fgqsKPMQw5JNAAzec3pi9CbwMhPBzr/2pECMxDoqA9EZMzhIV/uVRf++rs9+pcL3WYi
	iEZsciFmHI6hEu6Nus1fkOjQGJF67xPRQjdLTQV5VHHAC9YwoJUpfDPvBV9RqY5OyTT1EWG9jUE
	3VSSSLDjGStwkF9QX2A52u1vfYm+f7ryg/JUAz5kyNsfNKvZnUJK6d+IWqAld/5rsKW6oog6H/h
	MjoO5RaTZT2OXhoaRUJms+nAQOUXWbFrEo+4M7z4ijpYvyLrpjelLmVRJd1xQCKeKy79Cw==
X-Received: by 2002:a05:6000:26c1:b0:3a3:7ba5:93a5 with SMTP id ffacd0b85a97d-3c5daefc4a3mr930386f8f.26.1755843874990;
        Thu, 21 Aug 2025 23:24:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkMOIqwJnbz0zMoKzv9XjVteH9mRf82hflWECX8mqHGwhCkTy10DA8QnyI2PcknGc6Szk7/A==
X-Received: by 2002:a05:6000:26c1:b0:3a3:7ba5:93a5 with SMTP id ffacd0b85a97d-3c5daefc4a3mr930326f8f.26.1755843874452;
        Thu, 21 Aug 2025 23:24:34 -0700 (PDT)
Received: from [192.168.3.141] (p4ff1f25c.dip0.t-ipconnect.de. [79.241.242.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c6070264fbsm1198544f8f.67.2025.08.21.23.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 23:24:33 -0700 (PDT)
Message-ID: <7077e09f-6ce9-43ba-8f87-47a290680141@redhat.com>
Date: Fri, 22 Aug 2025 08:24:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/35] mm/hugetlb: cleanup
 hugetlb_folio_init_tail_vmemmap()
To: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
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
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-11-david@redhat.com>
 <9156d191-9ec4-4422-bae9-2e8ce66f9d5e@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <9156d191-9ec4-4422-bae9-2e8ce66f9d5e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GFFtdqDBWrYJ_5BCSj2YDY2o-ku0_xwC9UnUUM97ye4_1755843875
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_232439_027958_C83843C1 
X-CRM114-Status: GOOD (  11.22  )
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

T24gMjIuMDguMjUgMDY6MDksIE1pa2EgUGVudHRpbMOkIHdyb3RlOgo+IAo+IE9uIDgvMjEvMjUg
MjM6MDYsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IAo+PiBBbGwgcGFnZXMgd2VyZSBhbHJl
YWR5IGluaXRpYWxpemVkIGFuZCBzZXQgdG8gUGFnZVJlc2VydmVkKCkgd2l0aCBhCj4+IHJlZmNv
dW50IG9mIDEgYnkgTU0gaW5pdCBjb2RlLgo+IAo+IEp1c3QgdG8gYmUgc3VyZSwgaG93IGlzIHRo
aXMgd29ya2luZyB3aXRoIE1FTUJMT0NLX1JTUlZfTk9JTklULCB3aGVyZSBNTSBpcyBzdXBwb3Nl
ZCBub3QgdG8KPiBpbml0aWFsaXplIHN0cnVjdCBwYWdlcz8KCkV4Y2VsbGVudCBwb2ludCwgSSBk
aWQgbm90IGtub3cgYWJvdXQgdGhhdCBvbmUuCgpTcG90dGluZyB0aGF0IHdlIGRvbid0IGRvIHRo
ZSBzYW1lIGZvciB0aGUgaGVhZCBwYWdlIG1hZGUgbWUgYXNzdW1lIHRoYXQgCml0J3MganVzdCBh
IG1pc3VzZSBvZiBfX2luaXRfc2luZ2xlX3BhZ2UoKS4KCkJ1dCB0aGUgbmFzdHkgdGhpbmcgaXMg
dGhhdCB3ZSB1c2UgbWVtYmxvY2tfcmVzZXJ2ZWRfbWFya19ub2luaXQoKSB0byAKb25seSBtYXJr
IHRoZSB0YWlsIHBhZ2VzIC4uLgoKTGV0IG1lIHJldmVydCBiYWNrIHRvIF9faW5pdF9zaW5nbGVf
cGFnZSgpIGFuZCBhZGQgYSBiaWcgZmF0IGNvbW1lbnQgd2h5IAp0aGlzIGlzIHJlcXVpcmVkLgoK
VGhhbmtzIQoKLS0gCkNoZWVycwoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
