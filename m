Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE8FCA0EFA
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 00:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtgVRnC1CzVxJ1ua7Q9BFW0mXShhxFVRDcs9mDxist8=; b=R/eWoc07ZATdc5
	/wqdH1PtuGl1QE1xdx1kHBYbYu2Si9QCirzu0HCMm0oPYDfkhOWHCks6GHu5rKXq0Q8pjYphUcs41
	jumpU6Ni0LzzmphSu7J6YXLAKh1yTkQHraAzBbWlT1JrkK5yh1RzmQakIpeDepdTnlBBsZ6uHCFkn
	C+n7knexxtRxiLAX+xlnRg0X1cJRR+XLgz21H8j05+qD6Op3WfEvGEJvNpY2+BiB66WC57PtEZP5t
	ZX6VBtE5t9D9YPPateF3ZsgbKd4g4j2gV+lf+Jk9g2R7aCW7olnpi9ynEjTbeeCJPguiw7Zm9USne
	gwlr4X8Ewis52BzL7jIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upG0Q-000000015Hv-40bd;
	Fri, 22 Aug 2025 00:51:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaY-00000000OBV-1JVX
	for linux-riscv@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Zfh98TqNQqR9uCNr2hB5bEgIJ/15ql7Yv0zNbj5EC/8=; b=cDGaBL9uIdRdqjds1A0OM6JBW7
	xpyl+PoMYSkqVQ5IbTxDP7qXIkVwV7ZZJd3Ot7VWlUpr+uPvsettU/CV8+wRPq87ik/vOUREvrW5G
	1V/5hC0aD81ih8ecsEVbekhhuL3AcK09egRMgbVVjqTHE2sJtk+JeavG6M8slftWxIFbg1WrW8Ffx
	EbYyGhQ+TuY0hOXkjasTtl7BQQPUX2BHCbinfOAXQluThofJhAUvpmiigtKZ9gLWiiit2juNexvy9
	Z+e5ncbtJEEko2o4OcLDp2h+HBp2mALzvJYDtDuRTZsc453br3vsHvI4hilw/yQb9vIsg80foTw74
	0KW9Iz8A==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaT-00000000fB3-1lxo
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zfh98TqNQqR9uCNr2hB5bEgIJ/15ql7Yv0zNbj5EC/8=;
	b=Utw0GzM1fV3qofFoLeXbp/lRfieUB6HsiXebB8ElPlR3iObcLeF/cEXbHsmZ7Qsw8xsOHB
	JB4BFtCyBv5L5oulR4ayLVqTx/95rBADjIL021rQEr8Q4qw3/oVX6O33j154Qkb9MzNuP9
	TK4PF2zqw51W1hkjrgUEIs92Wo1aLyo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zfh98TqNQqR9uCNr2hB5bEgIJ/15ql7Yv0zNbj5EC/8=;
	b=Utw0GzM1fV3qofFoLeXbp/lRfieUB6HsiXebB8ElPlR3iObcLeF/cEXbHsmZ7Qsw8xsOHB
	JB4BFtCyBv5L5oulR4ayLVqTx/95rBADjIL021rQEr8Q4qw3/oVX6O33j154Qkb9MzNuP9
	TK4PF2zqw51W1hkjrgUEIs92Wo1aLyo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-AJBYwcxjNQiRhbJ0UnB0JA-1; Thu, 21 Aug 2025 16:07:17 -0400
X-MC-Unique: AJBYwcxjNQiRhbJ0UnB0JA-1
X-Mimecast-MFC-AGG-ID: AJBYwcxjNQiRhbJ0UnB0JA_1755806836
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3b9e4157303so922324f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 13:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806836; x=1756411636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zfh98TqNQqR9uCNr2hB5bEgIJ/15ql7Yv0zNbj5EC/8=;
        b=OKV+qMv81g8i6bz/MS2js948vAhlf0gFFgX/0hh/vXksMEGUAW+WTTSejc7AKI5Vnv
         3czo8FF/vN9hOgL6XhSmQbI6D1vx0cqhr44NOdeKZd4XpEepFOOZ0fSJjEyxswfWNyr4
         SqA5fNJI1PAoDA/F1+evmkd32vFUyssqJDZtp93Qe5bIycbC9DOPXdMeogCxthLiR0Xr
         DuuRPbgmhvkUcqBvFzSPPLhJOglvp0NRY+PdeN+Hxjk+ZTlc6G7KW/kZd+99hKgg5Oq1
         4/ncvdjk13aRCxn7wI2nfjac4JM5sZ47HhmVGeyagjKxdbjbwQdsHc79IvUgDc/d6SwA
         krFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0uSSyKpfPql1BaLWuSmPwCn6H/FzQO6Bj38P6ByzKkF+cSsG6UBXT4VM3DvalSR664AOZ1mY9WYhmRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/UAitoWAo4of8IcD7sNmNOZngIhci4stf4n8+nKyVyyvQpv9b
	Uh+G30G3cnEinXHfktvLN1aHPLTTBod7A74T7ltb7R3tXbE5nrMG3ssLL/MVlTutSCLoeET+a6L
	W9ZPOcRaKNrLsClH7KGO4rv+OaW22nFTleFUxj0PRn8GMs/ut33hU+0j05UWP62M6Ow1x2A==
X-Gm-Gg: ASbGncunygLbsZFXAIrhI2xLkg9tUWj6sCK6fLVFo5juiJQ0qBT3Tu0lNn69kOMZBVG
	h0g9bNWNb9XuSfXiXCq7k5U2bQgfn3iKUJTQs+Yh1BOcx9ZcVjbPvGFIMcuQn9xaYTQCDPZM6UU
	bCcu5XEMOBkd7kQvnHAgd03b/jNaJXa4Mo5YPr5aDBfrZQy6xE8mLmQoY46H2F590WyeovZx4Qu
	by1yju2kQV0z2qRY8KgwzB1SUCweGYQ39ILMWHz3IQDe8IBSkxInpnfjpZRqptlR80drc1DtqHU
	uX5urgOJB3BUxl5wJAup4VuVZ0ko2Iy4leU4xzJV1VKPIQpNyeAnrlzQWyUL3TpoNezQEdzx0ma
	a/SuAI55D2hNeUH8fljop/Q==
X-Received: by 2002:a05:6000:1445:b0:3a5:27ba:47c7 with SMTP id ffacd0b85a97d-3c5dcc0da36mr162998f8f.48.1755806836149;
        Thu, 21 Aug 2025 13:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpC+bUbLbCjHqucY3RiMYJPd72Xl9UYU3JmJwOiC1ZPXsKWXLLEiwWSHifO8HwGgrBWSbiEw==
X-Received: by 2002:a05:6000:1445:b0:3a5:27ba:47c7 with SMTP id ffacd0b85a97d-3c5dcc0da36mr162946f8f.48.1755806835650;
        Thu, 21 Aug 2025 13:07:15 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b50dc00a8sm10958175e9.1.2025.08.21.13.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:15 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	iommu@lists.linux.dev,
	io-uring@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	kasan-dev@googlegroups.com,
	kvm@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 03/35] s390/Kconfig: drop superfluous "select SPARSEMEM_VMEMMAP"
Date: Thu, 21 Aug 2025 22:06:29 +0200
Message-ID: <20250821200701.1329277-4-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4__zIhvklX-p0ArRyDVC5HCDOBHY5F73vnRl5clRW4Y_1755806836
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210841_978549_896152AB 
X-CRM114-Status: UNSURE (   9.94  )
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

Now handled by the core automatically once SPARSEMEM_VMEMMAP_ENABLE
is selected.

Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/s390/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index bf680c26a33cf..145ca23c2fff6 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -710,7 +710,6 @@ menu "Memory setup"
 config ARCH_SPARSEMEM_ENABLE
 	def_bool y
 	select SPARSEMEM_VMEMMAP_ENABLE
-	select SPARSEMEM_VMEMMAP
 
 config ARCH_SPARSEMEM_DEFAULT
 	def_bool y
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
