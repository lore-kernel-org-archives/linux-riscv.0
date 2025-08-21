Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E83CA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 02:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAOH2BxEKSS072MF6Bx17HpWxvh8vBQGXK/BfjeQT0s=; b=E0WxWnVA1eekbm
	e/nS3yxpqfPgwO6VKD8yS9NJbeWpyiZIu3vuME8fceFcWKVOIH4b0TfPpn5V7B8Z3Cd2b+YFYHRSf
	n/WVKK23bx2VZCv4QTm+g+QW/h1lOVJDgEavWdhbKKRaO0ETtt53wBROhnzR2Zu3JxW+18jFNkpJJ
	40bkL29rceYz1/jGkHoJo0buq0iWhmKjgmI4UTvmUefUBvV/yvBy6qQOKq6Qte28s0kAx/swwokTT
	RruYwgRr5jgXUQOM2IcHfN1+UIqw6ie7V1R1SO8o7ioRlfZPjccOYYE/olsmr5OzFAPYB/x7XMYSA
	bxJA9415ZyLl6Bslx2zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upH57-00000001Ccj-43p3;
	Fri, 22 Aug 2025 02:00:41 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upC1d-00000000Uw4-1FMp
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:36:47 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e933af9f8b5so1158481276.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1755808604; x=1756413404; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=083PuN2wICwWm8iwB5WBlP6qyKXLyqdZEBdZ0ztp8l8=;
        b=V3r67x+OP8d5deMjJ0E0HJPAQN8bmgWA70sFhRz164JCEY6mKaT3uvqmJi9lLg3ok8
         qYVSTU6oKn5GnVJ/sY6lXjE9tP/sWd5sBJeHL4CVQE+DO6hors3l9hw9ZHGfEgJaN+ed
         YC4EA+v7Z/qMUWjYLe3a/wxcb7+hKKCtTd5Vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755808604; x=1756413404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=083PuN2wICwWm8iwB5WBlP6qyKXLyqdZEBdZ0ztp8l8=;
        b=B/fW1Cj2WmkvTdZpxHwCdIC1Z3kkvsT2m9OU+PJzfsEuh/kBwrQz+cazQHyQwnXzA3
         toBMRqL89xflilUQpqLtdpv+/yef9p/p/BXeTVWK/WL9nOY73vu3V3F77dvEUU394Szp
         2tF+uoRbJ7LFaOOnU+IPIS7iFiMpxbqCVfztrDDIyrVIFN37B9nPf/zqWS6Ch8vpnREK
         gifayR+n2UClRhG8LZejoaLWzDtjseKxZJH8UzDqVWhRcXvduqIt8+HP2QJvvgRqmFiD
         fHPVJjMUED4c7dZhlFguBJ1UQKBDx+jSV6UspGptFJVFMpZsq80BCz1Ao1UnOW+nU5X4
         bZZg==
X-Forwarded-Encrypted: i=1; AJvYcCX6tjWKOcqAGyAyLtY5ZbchTuzxrENZy0kytRlbExNoAl/dwuIiJcJgpxvcmjhr+pU3XaYTgwQw4Z7fMw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb05sGAPAPWn6m5p3/b/ceUDX6M7ambaZZbHpFlYhydLHbmI29
	C5t/PoUzFivxS/5JDoqLlSux4W4ciWO7XHxJsPkPCDtlkf52xA8R7MlHqtX5Y/dyR1W9gzyfVTo
	iTN3Dbg2cSmUHKyeFoyUX/i7nAKglRvttH63x+X2B8A==
X-Gm-Gg: ASbGncu4WZpldbZjPqtJWRZXot8XuqwW8Tg6jsavW9wX7Yxwl0Nr6/FQZe3MelTQ6NV
	Ks0ax3aolN6OhqU0uDNsfuCurQoNpbbCzRECVT2G2DOIIXyuYBeqqfAkX2TLf/XpWAaTbwT5JvH
	nWKLcjDIPIFc/ka9WVJ33ager6VFNUGpMulu5y2Ex5F8QxEIbEGVpafVWzX+IsIJoDApPn/5WHq
	4WH3Ea8A6AOm85/Ek7f8khtTFI=
X-Google-Smtp-Source: AGHT+IHnF0lVhm+1Tun1UWlMLnnSk/jF/jUOt69DP22IOjEUNxjHdHqCJTIRGjm6XM6hiUq/Axp7jnIGuYc/D1Y8ZZI=
X-Received: by 2002:a05:6902:4381:b0:e94:dea:b80b with SMTP id
 3f1490d57ef6-e951c365621mr715984276.40.1755808604080; Thu, 21 Aug 2025
 13:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250821200701.1329277-1-david@redhat.com> <20250821200701.1329277-32-david@redhat.com>
 <CAHk-=wjGzyGPgqKDNXM6_2Puf7OJ+DQAXMg5NgtSASN8De1roQ@mail.gmail.com> <2926d7d9-b44e-40c0-b05d-8c42e99c511d@redhat.com>
In-Reply-To: <2926d7d9-b44e-40c0-b05d-8c42e99c511d@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Aug 2025 16:36:32 -0400
X-Gm-Features: Ac12FXz8i_O0Dca-zCdGNOyRYVeCyfB9Z0ucQ3KoLazk0PNM2PIB2a_qe1sXKks
Message-ID: <CAADWXX81Y3ny6WvDN8EeYvBPa2qy10PKhWfZpj=VBcqczL6npg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250821_133645_341778_0888C79A 
X-CRM114-Status: UNSURE (   6.39  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Oh, an your reply was an invalid email and ended up in my spam-box:

  From: David Hildenbrand <david@redhat.com>

but you apparently didn't use the redhat mail system, so the DKIM signing fails

       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE)
header.from=redhat.com

and it gets marked as spam.

I think you may have gone through smtp.kernel.org, but then you need
to use your kernel.org email address to get the DKIM right.

          Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
