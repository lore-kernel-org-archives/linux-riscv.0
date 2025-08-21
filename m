Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857D4CA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 01:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jOxWLcQtlY6m5znlIpA3fCtZGcrSceNviJ7AvNKMeGY=; b=WmDTnP+AuSKGDR
	etYwyPfnhkY34B9GZOqDCmvQgF9Z1HWZglLCv1Pt1RAjEeARQS4OpI2UuKyToBNKbz3in5Sg+XJIO
	WrKjy4rlj1O1CFMDNHpWMGxwWdkXrImbkq9x6+IQw+c+4nyWUUIlZEAnyWkESYZaCvubg0QFkV4sq
	3zQzcWyoNEtmsp/wTChT/IGFgLILse956VyKW7/GOuUI4SHPu/tE7sfBpGT4f0dAnUcNLVXBk9zm0
	kobfgvg+WyWUXyIhf3eJMC89vb9JoYqDGPxxJl8HJsaFNSZ4yVQ5czvFkCNqXzWpR2+hmxcnYVsx7
	okJE50hydk1MNGcRo0yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upGxL-00000001BBE-1aic;
	Fri, 22 Aug 2025 01:52:39 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBwy-00000000U2D-4BIB
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:31:58 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7e870316b79so165602685a.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1755808314; x=1756413114; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6aeG3+zXNcZH2d1Z1/su6zkQOg7Uc4j3Xw+oqie+iPw=;
        b=HtSv3g9ZVFVxzcw/OFtJjUfzVLhUqBMu5qyq9OFXDsSIKWFaW3HjqakB2NWfKoDeGw
         art0ny2rr48Fgws+eW+wOt795gfNPl0+iWc1RrCqrBXoYFfpeiNqWlnbBtC0mI5D9u6l
         6+8vhmAuNtMd6JA4/sEZwhfLJHmvA2EXpITfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755808314; x=1756413114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aeG3+zXNcZH2d1Z1/su6zkQOg7Uc4j3Xw+oqie+iPw=;
        b=xG4x0sct0u3vfMv7QoJ4xe58WbBEQ43wMPjMljjwt1NBAOcMwvHt7uWia7uH45twvh
         42+7/epOvBQjfeNA0afYlybAJ6pUdd80HzMgfVPy2KvTVSGF1ksjBkPyn0CkpaWes+NL
         NmrYVASqVm5LiqyQJFzAmXdCc3V/gFkUmx7dyjF2VJCZWwqbUZkcW6K0f0XUG9NZZVA+
         Vyrm11W789Ni6l6Z+5uqgBeMer8y6AHRnYQYHTVfEbzQwB3BUPrHF+g4LCwmQvyozctD
         33jhc7CtFCOKFvDLhm4f0tCGXgSL/APAm8tsyE4qMFvFppojgNFlRaOCXH4TH0ubLzyy
         XzXA==
X-Forwarded-Encrypted: i=1; AJvYcCWTnPzw2xfKTT4sVBk9iHl60KFK9S1Z1qi9zQcSaXsBcr+zW9/B3yIVO8bgzw67lRNp1FpjbJi/Rav17g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzF6CPNC9ArlQqLpnwAejn432DMn4C/Ae7LuQsGpvvTD/dB5fDB
	PSm8yfRnt76M9fBqw2wGDHuHTAB9wSweFyx8ntorEZsISEraiRq04nHDnOC+EOneoZpuY4gOymS
	/JJZccWeUSw==
X-Gm-Gg: ASbGncunRyFQH8mIPEIh3DMntEXVSnV0hplboJXnYl5i/KNOcy2Ycc+J5pNTcbbXuk7
	rRk1NTEdrY4FKQ+Pz/mjwpLexEMuJOfYRhONKNt3xjyfzx1bQrqfCeHmi8awlwPOgP0W/KsVoRh
	6bEhMd970U6IcA8/AlklQMSwZ7lYcS52hlwzN/waqHi3isRVjqMrZfFCOSoh1a1u0fLfxZMpSD1
	/Z3vlHxhFarBsnXVJOcUbCjT65LNjfNIdcW+/PjFta2GgLoYvcZRe4+REU9+55FJvWr/CBBIT9J
	ITKp1zsCcVmetO7l+HGCZWF/G79sFAo6M4am8xxb9+Q3s5TJQvo37IIxGqVSLPYdPL2T7+o2TE5
	TDwW+OrVyDcoUbvnymsEZy/uNJMk1N6meUUaGG3Sou+v30DQVVkxxT4iheGFnlGlUEPiIO86w
X-Google-Smtp-Source: AGHT+IEO5V8hnX3pFKvfZqBVKfTglkTbyL3LahITsuMN2xfiI92/IuD9PvzFuoe1+XnGUg+p4YeZ3Q==
X-Received: by 2002:a05:620a:28c3:b0:7e8:5143:d58e with SMTP id af79cd13be357-7ea1101a798mr103883385a.49.1755808313411;
        Thu, 21 Aug 2025 13:31:53 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70d93a4d26dsm9371786d6.12.2025.08.21.13.31.53
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:31:53 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-70a9f5d4b38so12503786d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:31:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXk0830d5k3KtImOWBdgzFhsTOgz9nDSglKLK04l8Aaq2AM62+iq4tK50lu9DcciMhaAdadopWFOV/rHQ==@lists.infradead.org
X-Received: by 2002:a05:6122:1ad2:b0:53c:896e:2870 with SMTP id
 71dfb90a1353d-53c8a40b923mr212315e0c.12.1755807884664; Thu, 21 Aug 2025
 13:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250821200701.1329277-1-david@redhat.com> <20250821200701.1329277-32-david@redhat.com>
In-Reply-To: <20250821200701.1329277-32-david@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Aug 2025 16:24:23 -0400
X-Gmail-Original-Message-ID: <CAHk-=wjGzyGPgqKDNXM6_2Puf7OJ+DQAXMg5NgtSASN8De1roQ@mail.gmail.com>
X-Gm-Features: Ac12FXxaZhwn04a0gbwY6rjh9UGLxnRlGOG0Jy0WjRbVAG0UxLDqNy0Wydj0GQk
Message-ID: <CAHk-=wjGzyGPgqKDNXM6_2Puf7OJ+DQAXMg5NgtSASN8De1roQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250821_133157_029648_73C66480 
X-CRM114-Status: GOOD (  12.54  )
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

On Thu, 21 Aug 2025 at 16:08, David Hildenbrand <david@redhat.com> wrote:
>
> -       page = nth_page(page, offset >> PAGE_SHIFT);
> +       page += offset / PAGE_SIZE;

Please keep the " >> PAGE_SHIFT" form.

Is "offset" unsigned? Yes it is, But I had to look at the source code
to make sure, because it wasn't locally obvious from the patch. And
I'd rather we keep a pattern that is "safe", in that it doesn't
generate strange code if the value might be a 's64' (eg loff_t) on
32-bit architectures.

Because doing a 64-bit shift on x86-32 is like three cycles. Doing a
64-bit signed division by a simple constant is something like ten
strange instructions even if the end result is only 32-bit.

And again - not the case *here*, but just a general "let's keep to one
pattern", and the shift pattern is simply the better choice.

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
