Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FCCCA0EFA
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 02:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6G6/t1REkUMdA067DEOgQxIxAituPx/kRo+eyC7TPpo=; b=UABjMLZdVDUBDk
	9UYrNFt4DK0zavV3CHdtDZH8grwGKb3KjAy9PnbIRiYCLJJggRzMht7eXwq35lO7zffnFhKSE+RbQ
	9P2SVub3HVzAUicXpSh9EhSXh+ydmx6ymfMjn/J0aqVqaoOYuynezXYSzIBnr56bNH4EHj7MoNIdS
	u3uvEgNhEkDcPuwoizwtQci0i6X0w0edUaOmZS4VvFTqyKkUacE/kQvt36blQq2wuU7SF0dRFO2pr
	XsmYuLirGUiMrIndj5vo/UFQAcs8dWzqDtM7IBk+16ymKEVrDeBnyJTwc7WtKpm3PQAxm0d4aR4y1
	WglMQ/Uz6V+6BKMJ/eBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHAK-00000001Dsq-1TBD;
	Fri, 22 Aug 2025 02:06:04 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upC5D-00000000Vib-2B6Q
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:40:28 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e931cddb0e2so1169484276.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1755808826; x=1756413626; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHa4LrampbSXQx1Wyi9Bh9OjrywcR0PvG9lus2xsnNw=;
        b=et6Dc3AT3qcojWDhWVJXNKzArikdvb97cRK980yXrycvqFdmU3JyxHYd2eEe1hREli
         /CAjqcodqACkN9p7w3bbvN/LYCDExgDMT++GxoxS5VCFXhDipMZ9BCOH50qnw6qa4AXy
         0X2JYypCo4mzAEWX7IshXvjumEbLEfDdZEJlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755808826; x=1756413626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHa4LrampbSXQx1Wyi9Bh9OjrywcR0PvG9lus2xsnNw=;
        b=Hrg4qqvk1v/lhDUYSUzX1UFHov74E6Fu4L0ZfZPLwpHtALh2rKBt9X9fV1irDdjWRR
         lqE/G1rCx/ri42sOtSItwDAubtWdrYeT72kq9PpnlW41RODmZLJWnArOzwglAO98uDOy
         n1IVvkTdc/D4YhZTzoGpVmRIisaliSpJS09DDeTW/GmynzQv2A7zzMNHl4gxu8NJH/G2
         WLGzy3GC/87PKsQy+xojy+7m9DCz3NFx7atj5R4w8a9TwiKHMPw8CnLHvUF26PY4DmC7
         cqTaXV4KsxYF4O8pti8SKPZ5nefU/SCOHGewnHggsNw+lY/6SQQGAG6hQkN82BnytkPI
         1NyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqqfDgcJFcsoay9BFHbj1iuyYXq1/GpdiPBmhx+68fdS3cN2Ku4lhBX2SA4UlPBk0+kTHrOtlMwQZb3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFxKM/wJfhzHovit/0M8WT/cu1f8X5xiDe9uPFyAM5foA4XR9T
	jE79rCd71OfYvbUdmq08KJZb3dHflx1hAf1jsDDH57K3ad0HVmWAY059X4cPN8RtEJ9cL4l9ysg
	uOmIV7SF4yKTbtA2uhEXLO9cmZvJZDMu1Icr1tPjojA==
X-Gm-Gg: ASbGnctU08SUYLXSda4eYAcHnQId3wqq85VCiFRoUl5FybsJXfIbUheHR6WqI8QB5EB
	5YpqjWxbvB6HMXaEK+dvuH5b2bnx019ulVyCjtjdvStvahsa86RcQWPKNa/2giPFsBbrzP28wqI
	z76Vb2tuQwB9rPfk1S/xFj9rZ2e3nj6l4uv3LGfEiMZHks1BZA1Y1x4W7KYmmS2Q9z20MZ+4ePQ
	BR4/HqSyqhtFXmG
X-Google-Smtp-Source: AGHT+IEDbX/Imr3oMuC/SvPpVgA4gK54+Q+BCEwHjysz7tgNECdpdXbU462KLrYXAP4tYmTYkQFLOtkp14xdKE7/w+U=
X-Received: by 2002:a05:6902:c12:b0:e93:457a:37b0 with SMTP id
 3f1490d57ef6-e951c33ee1bmr998901276.20.1755808826442; Thu, 21 Aug 2025
 13:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250821200701.1329277-1-david@redhat.com> <20250821200701.1329277-32-david@redhat.com>
 <CAHk-=wjGzyGPgqKDNXM6_2Puf7OJ+DQAXMg5NgtSASN8De1roQ@mail.gmail.com> <2926d7d9-b44e-40c0-b05d-8c42e99c511d@redhat.com>
In-Reply-To: <2926d7d9-b44e-40c0-b05d-8c42e99c511d@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Aug 2025 16:40:13 -0400
X-Gm-Features: Ac12FXw_AatpwCNNPCEiMwiwdQxQbayKDzVf5K7yc3iQ5tLY7APrv3zl2U8Z_SA
Message-ID: <CAADWXX_5AJxTsk5m_RvP58d=quRMqT4-XbnQQx=obBTKjHr1Og@mail.gmail.com>
Subject: Re: [PATCH RFC 31/35] crypto: remove nth_page() usage within SG entry
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Alexander Potapenko <glider@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Brendan Jackman <jackmanb@google.com>, 
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	iommu@lists.linux.dev, io-uring@vger.kernel.org, 
	Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>, 
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com, kvm@vger.kernel.org, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-arm-kernel@axis.com, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, 
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, 
	x86@kernel.org, Zi Yan <ziy@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_134027_561437_ADA8762E 
X-CRM114-Status: GOOD (  11.96  )
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

T24gVGh1LCBBdWcgMjEsIDIwMjUgYXQgNDoyOeKAr1BNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZp
ZEByZWRoYXQuY29tPiB3cm90ZToKPiA+IEJlY2F1c2UgZG9pbmcgYSA2NC1iaXQgc2hpZnQgb24g
eDg2LTMyIGlzIGxpa2UgdGhyZWUgY3ljbGVzLiBEb2luZyBhCj4gPiA2NC1iaXQgc2lnbmVkIGRp
dmlzaW9uIGJ5IGEgc2ltcGxlIGNvbnN0YW50IGlzIHNvbWV0aGluZyBsaWtlIHRlbgo+ID4gc3Ry
YW5nZSBpbnN0cnVjdGlvbnMgZXZlbiBpZiB0aGUgZW5kIHJlc3VsdCBpcyBvbmx5IDMyLWJpdC4K
Pgo+IEkgd291bGQgaGF2ZSB0aG91Z2h0IHRoYXQgdGhlIGNvbXBpbGVyIGlzIHNtYXJ0IGVub3Vn
aCB0byBvcHRpbWl6ZSB0aGF0Pwo+IFBBR0VfU0laRSBpcyBhIGNvbnN0YW50LgoKT2gsIHRoZSBj
b21waWxlciBvcHRpbWl6ZXMgdGhpbmdzLiBCdXQgZGl2aWRpbmcgYSA2NC1iaXQgc2lnbmVkIHZh
bHVlCndpdGggYSBjb25zdGFudCBpcyBzdGlsbCBxdWl0ZSBjb21wbGljYXRlZC4KCkl0IGRvZXNu
J3QgZ2VuZXJhdGUgYSAnZGl2JyBpbnN0cnVjdGlvbiwgYnV0IGl0IGdlbmVyYXRlcyBzb21ldGhp
bmcgbGlrZSB0aGlzOgoKICAgIG1vdmwgJWVieCwgJWVkeAogICAgc2FybCAkMzEsICVlZHgKICAg
IG1vdmwgJWVkeCwgJWVheAogICAgeG9ybCAlZWR4LCAlZWR4CiAgICBhbmRsICQ0MDk1LCAlZWF4
CiAgICBhZGRsICVlY3gsICVlYXgKICAgIGFkY2wgJWVieCwgJWVkeAoKYW5kIHRoYXQncyBjZXJ0
YWlubHkgYSBsb3QgZmFzdGVyIHRoYW4gYW4gYWN0dWFsIDY0LWJpdCBkaXZpZGUgd291bGQgYmUu
CgpBbiB1bnNpZ25lZCBkaXZpZGUgLSBvciBhIHNoaWZ0IC0gcmVzdWx0cyBpbiBqdXN0CgogICAg
c2hyZGwgJDEyLCAlZWN4LCAlZWF4Cgp3aGljaCBpcyBzdGlsbCBub3QgdGhlIGZhc3Rlc3QgaW5z
dHJ1Y3Rpb24gKEkgdGhpbmsgc2hybGQgZ2V0cyBzcGxpdAppbnRvIHR3byB1b3BzKSwgYnV0IGl0
J3MgY2VydGFpbmx5IHNpbXBsZXIgYW5kIGVhc2llciB0byByZWFkLgoKICAgICAgICAgICBMaW51
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
